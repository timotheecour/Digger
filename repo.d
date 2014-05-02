module repo;

import std.algorithm;
import std.exception;
import std.file;
import std.parallelism : parallel;
import std.path;
import std.process;
import std.range;
import std.regex;
import std.string;

import ae.sys.file;
import ae.sys.d.manager;

import common;

class DiggerManager : DManager
{
	this()
	{
		this.config.workDir = common.config.workDir;
	}

	override void log(string s)
	{
		common.log(s);
	}
}

DiggerManager d;

static this()
{
	d = new DiggerManager();
}

string parseRev(string rev)
{
	auto args = ["log", "--pretty=format:%H"];

	// git's approxidate accepts anything, so a disambiguating prefix is required
	if (rev.canFind('@'))
	{
		auto parts = rev.findSplit("@");
		args ~= ["--until", parts[2].strip()];
		rev = parts[0].strip();
		if (rev.empty)
			rev = "origin/master";
	}

	try
		return d.repo.query(args ~ ["-n", "1", "origin/" ~ rev]);
	catch (Exception e)
	try
		return d.repo.query(args ~ ["-n", "1", rev]);
	catch (Exception e)
		{}

	auto grep = d.repo.query("log", "-n", "2", "--pretty=format:%H", "--grep", rev, "origin/master").splitLines();
	if (grep.length == 1)
		return grep[0];

	auto pickaxe = d.repo.query("log", "-n", "3", "--pretty=format:%H", "-S" ~ rev, "origin/master").splitLines();
	if (pickaxe.length && pickaxe.length <= 2) // removed <- added
		return pickaxe[$-1];   // the one where it was added

	throw new Exception("Unknown/ambiguous revision: " ~ rev);
}

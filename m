Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C15322A;
	Thu,  9 Apr 2026 15:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775750138; cv=none; b=eAuK/wKvZprJ4wvpWoH4PGrQmzkJrT/kOn05vW9TZnSz7TJ26UubdSCIBdrYeiqqS76dcrFJ+OJ8UriiByyZsfcaYPRpAeBODGvNdsSmRz3NYY672jy2V212wv6yFtG4DvfjSJQJLLF+c0zePG7dve5PoTW9D3frusI3NwnqgPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775750138; c=relaxed/simple;
	bh=mRDmuC+3enBS9mW+6VqPJA876i45ugW5vUZhiutz5J8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EjswaXimCHqz4H27WtpE/cazYioZKU/GxF1nnfDqxlR6zQPlAHOjy+LaiupZgm+z7eSqIpuaqBaJpZ7uvC9tfsq4oI0T46Ri8FUg2qMakB0har25mLllxdjm2XruosF3dv337aT2quUKBjvcIE3KgvOSr6gAIswC4NmH9RtsPkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kfxp54DE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kfxp54DE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775750137; x=1807286137;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mRDmuC+3enBS9mW+6VqPJA876i45ugW5vUZhiutz5J8=;
  b=kfxp54DEa6ex0cdTo/bG7UR1suLh+H8yk7hx3uXBSNmDqQy0kahgs+jW
   vy24npcrQQ7xDo33Olf7gaNEl4t+7STxB9v5yXDkK+t2YZi5iKwJbd/Ol
   AoNqgpVW28rkG+lRd5GVwN6wYIpXfFtKSCgCufnQs5CGowzW+Jj1su4pb
   QkD4AMp1rum3eE7S20d+f8mYW/ScYCQuZ0gNIBjIyjPNG1dKLzyNDX5cF
   qV3NuBw15H2HG0DwGVQlQ1NvMqF30pIQJZusguo6rXb2k6CkjRFr9o0Vt
   T4qt8wg3+8K6noWBa7GGXIPHwWFlg3ca/YF0FvM/bze8iyzhFvLFfvnK4
   g==;
X-CSE-ConnectionGUID: r/bM4wP7QG+pkMwR8XIkkA==
X-CSE-MsgGUID: SFuGIir1R0WMUUWQZQnwmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76647923"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="76647923"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 08:55:36 -0700
X-CSE-ConnectionGUID: tD8mtbhwT0yr0+VJPRPqWQ==
X-CSE-MsgGUID: zjJheMxQRgG0D3fhApejzQ==
X-ExtLoop1: 1
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.162])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 08:55:30 -0700
Date: Thu, 9 Apr 2026 18:55:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Prithvi <activprithvi@gmail.com>, Greg KH <gregkh@linuxfoundation.org>,
	abrahamadekunle50@gmail.com, b9788213@gmail.com,
	straube.linux@gmail.com, tmimiharoen@gmail.com,
	filippo.muschera@gmail.com, ethantidmore06@gmail.com,
	rayfraytech@gmail.com, david@cardinalsystem.net, weibu@redadmin.org,
	dharanitharan725@gmail.com, ignacio.pena87@gmail.com,
	dan.carpenter@linaro.org, karanja99erick@gmail.com,
	khushalchitturi@gmail.com, suunj1331@gmail.com, s9430939@naver.com,
	nikolayof23@gmail.com, bryant.boatright@proton.me,
	ysinghcin@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: Re: [PATCH v4 0/5] staging: rtl8723bs: Code cleanup in
 drivers/staging/rtl8723bs
Message-ID: <adfL8CHDT6UdKppU@ashevche-desk.local>
References: <20260409135026.137904-1-activprithvi@gmail.com>
 <DHOOTLM62TV2.2JOOAA5UQG410@linux.dev>
 <20260409145045.44r4f5bleklkk4ha@inspiron>
 <2026040942-slicer-rake-4056@gregkh>
 <20260409153958.6wmjiu4jcghtyeom@inspiron>
 <D767F902-D249-4F93-A230-D432DB0423F9@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D767F902-D249-4F93-A230-D432DB0423F9@linux.dev>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Apr 09, 2026 at 05:44:24PM +0200, Luka Gejak wrote:
> On April 9, 2026 5:39:58 PM GMT+02:00, Prithvi <activprithvi@gmail.com> wrote:
> >On Thu, Apr 09, 2026 at 05:02:16PM +0200, Greg KH wrote:
> >> On Thu, Apr 09, 2026 at 08:20:45PM +0530, Prithvi wrote:

...

> >> But next time, trim your "who do I cc:" list, as it is _way_ too big,
> >> how did you generate it?
> >
> >Understood...here I used all the email addresses generated from the 
> >get_maintainer.pl script. Next time, I'll be sure to trim it down just to 
> >maintainers and reviewers.
> 
> Upon testing myself, get_maintainer.pl doesn't list all of those 
> people when ran on a directory or a file in staging.

Also you may check my script [1] that I use on everyday basis to send patches
to Linux kernel. It has some heuristics that showed to be almost suitable.

[1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh

-- 
With Best Regards,
Andy Shevchenko



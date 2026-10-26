Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006687;
	b=UARsVIuiokXlgijdAvbTTmZG8S+DDzNp69LsdbZ8jxjuJgdGm5X/3aZ2DWIajQirTxkq
	 eb3mvU4y4iRYiqQBsPHn/k7u3814fEm6e9nqr/H55+kv2DEgF4X7jCX2PB9BiIDqNTtx6
	 7r7C8mqW0pHCR99i+Z8l9Pjn1m8XXuWNmt0McY5dnejx9qX50Kmciqel+W2hoLvPuHJMT
	 m1/HY/Utt75XdX0MJm5cNuoiVphP+CmRF//9DLh84NYKoki9d5ym6Red7U8L7nF6657e7
	 Xu+Mp7PLkyyydP1XXYo/aG1B02Vx0Ql304aBI0O6BVZPyZLSt+2AimYxudCQL/ed3tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006687;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=XyY6QwI5d5wBdkJzT0g/k8F7w00iljyIPp+DEpMbmXU=;
	b=f8OccRj3YHqFa+ONWyljWN96DMsQ6Iw7iLsMEDLM7bmb1dGB+gC1E+FqgB2FZs4ngJmq
	 46NL/rEiz+WWqTiOQeWbA+FUCXJBMKV8kHeO6vVPr8VAP05PZKQOUjebk5OtDPQBxB97k
	 g88wi+0kLp5A+jyIIIfm9mbWjkC9Y/KIgssbrsBpF3ReHfXCL3A078UiZtVTpdX17FtSR
	 pmYGCP74yULnlYvmWRqE3b6eOVKSprEet943as4PGTCzSTKJ3In9q61KRvou4ikRdzyaB
	 aUSxeT1g+lLaUra6xF3MrRGb+MIjkeg9PG58zcvj1pHG/wJNnzkh9yf68Gw+p/OQCAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CxHPWCFP;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33DC606A333
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 09:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B33DC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CxHPWCFP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793006685; x=1824542685;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nLVdTbTG3BOOg0NKFoId7DXu+3MHSWUcFw4OvEb/0iI=;
  b=CxHPWCFPUb/ZL5e1sFsquhvWwEWNaZLl0e6mCh0votwKmf+B4qzPNrSb
   nikiaM7Wp1aSLm4/sr9mi4ROaCFD8GjyAnFVGMLOBVuteccULsGap63yC
   jePXfqTO2qZYLKbGwTu100lfwudj8nNDr6jGdBFzEEt+O4h1GJ/iaghdn
   qXC7TQfEhZdtDKFWtvdkEOdR07P1ASLco3oSeHShhuLe/EU+AqMZ7ye9K
   YMT0Z9PQse1bwR/Y/6pipkNRk2VpIs1Xn5aFvvoKRIYQKROE9F/xy99Du
   GFW0jBkEyEra1HE8Xp3LwmgrpX0P90gtxPvuV+6ncLTdnH6W53b3tzvHl
   A==;
X-CSE-ConnectionGUID: 4+2qYsf1T8axYgt2vcykGg==
X-CSE-MsgGUID: n9sCsQbPTvWwVF1coqVE2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1567576"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1567576"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 02:24:44 -0700
X-CSE-ConnectionGUID: SWD2y8FzSO+MtT9Rg6GkFA==
X-CSE-MsgGUID: vPTCfpkGTMOKogBsIiegLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="6044272"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 02:24:41 -0700
Date: Mon, 26 Oct 2026 11:24:39 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: himanshu bakshi <himanshu.bakshi478@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, dennylin0707@gmail.com,
	cenzhang@linux.microsoft.com, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, dan.carpenter@linaro.org
Subject: Re: [PATCH] staging: fbtft: Remove unused macro
Message-ID: <at8cV1asiwO1FtQA@ashevche-desk.local>
References: <20261026081832.60570-1-himanshu.bakshi478@gmail.com>
 <at8cAMm6psyWsqbe@ashevche-desk.local>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <at8cAMm6psyWsqbe@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Oct 26, 2026 at 11:23:17AM +0200, Andy Shevchenko wrote:
> On Mon, Oct 26, 2026 at 01:48:32PM +0530, himanshu bakshi wrote:
> > 
> > fbtft_init_dbg is not used in drivers/staging/fbtft directory and
> 
> We refer to the functions and semantically similar macros as
> func() or macro() in the text and comments.
> 
> > since dev_dbg messages are good enough, fbtft_init_dbg should be
> 
> Ditto for both dev_dbg() and fbtft_init_dbg().
> 
> > removed. After compiling the driver, there are no undefined macro
> > issues.
> 
> > Signed-off-by: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
> > ---
> 
> It doesn't say how you tested this, though.

Ah, after reading Dan's email I noticed that the last sentence in the commit
message actually should be located here, in the comment block.

-- 
With Best Regards,
Andy Shevchenko



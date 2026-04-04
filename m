Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26D523C39A
	for <linux-staging@lists.linux.dev>; Sat,  4 Apr 2026 19:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775332141; cv=none; b=UqfAGdPrLnacsWQp6g8oKU1iS3oHQGN01fqMvxwyIL/JOrdW057RHv7zBCnkOw+j9eGwzG1TmNkm8wQ049fslIPYk9B9Xlm02SjMTBOz3VjrLKSJFj3+zqQ5Nh1d850DeB5fHODzprzpG1YNmaNEMTwy2leedbECRD1O561ld7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775332141; c=relaxed/simple;
	bh=oNK7J/ZJrj15UHcEgyp/oaOFDQo7MzlFwyxSC0GuWnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFZx0Iq3Pvl0CvInB3aiLFtVBxfeTQyq9u2/NJWD5OsL/cgTcuTS+ETcTxq0EgARO3N84QvNT09X4oDkJH3MsJrkIh7CI1YI2MSmhaQdpJeehoISikDJQE8HBCo+xxVqNiP+nmnNu1i7BmZVpg3/aKd35RwCZezlIgqqF5L7H30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dXLidFNS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dXLidFNS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775332140; x=1806868140;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oNK7J/ZJrj15UHcEgyp/oaOFDQo7MzlFwyxSC0GuWnA=;
  b=dXLidFNSk3mHB4nf03UNRrZDrCGuzztz+sM2egixeYQNf+q7Z8TMcRV8
   rquOhDpGAdYM4R3aWESrwT00b6wF1i1Z4zRdyjp9iT5UCYCL/pPAyStRq
   FfAPa1OD1ipqEW0bmjUFWPG2DkNRkKXJXGqG/je5bvtu5Yoef2mDRKWCz
   ezsPLWTZ2+9PhNWwtiVwyLN+zkIYVhcHz55AqrZjFE4YTq3V3iJf+EKDj
   Nuy20ycbiASwTddKHqJ3IcPdzCNqnoHZgIXo0XCemPx7S5KEtDG8GcSjp
   CGF0eff+QTlm6hSJOZitf8NFHf7OT1NymxJ+vFcQSpLFuN2BqhTkytUAy
   Q==;
X-CSE-ConnectionGUID: mG9u0iNSS4uDmj1XxJWx8g==
X-CSE-MsgGUID: SR5bMTMDRwC0r/1xAfLKkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11749"; a="80235665"
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="80235665"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 12:49:00 -0700
X-CSE-ConnectionGUID: NakGEKgiSyyBsdO+UkFnwQ==
X-CSE-MsgGUID: VThqi0DrSOSZUBuveC4uEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="265483901"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.247])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 12:48:56 -0700
Date: Sat, 4 Apr 2026 22:48:54 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org,
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
	grondon@gmail.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: atomisp: cleanup parenthesis alignment in
 pci.
Message-ID: <adFrJmqSfx7dEJWt@ashevche-desk.local>
References: <CALoEA-z0aGoir4_C8cMyZGguJ-Bp1UUADKxntDgjcseUkzNuag@mail.gmail.com>
 <20260403202101.34849-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403202101.34849-1-joshua.crofts1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Apr 03, 2026 at 10:21:01PM +0200, Joshua Crofts wrote:
> Cleanup parenthesis alignment as per checkpatch.pl in the
> pci/ directory.

Use prefix in the subject as "media: atomisp:".

...

>  	hmm_store(ddr_addr,
> -		   (void *)(data->address),
> -		   (size_t)data->size);
> +		  (void *)(data->address),
> +		  (size_t)data->size);

In cases like this, try to use the room on the previous lines:

	hmm_store(ddr_addr, (void *)(data->address), (size_t)data->size);

is perfectly fits 80 characters.


-- 
With Best Regards,
Andy Shevchenko



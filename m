Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7B2279917
	for <linux-staging@lists.linux.dev>; Thu, 30 Apr 2026 06:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777529151; cv=none; b=g+5ZiUhe3VIIa/m+NPKMqNrR7ge6gkEkv4AkTUfu+TyNjgTkhgFkcNQ/9APOVqnXwYPQTamUYNUtNOJZmyTgDtONXiryCiNGDavP9c0XP16qYIQlP8FEGxmFkcH/tskFTCzhZcWn7oSjarxqvSsL76EbCvvdpv8vG5FbRzFa30g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777529151; c=relaxed/simple;
	bh=MAgqiHxTHVhhgEAEAOOfc1268HvQAf01a+K2UTI+3K8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qhRC23wil8S68/KbIE9+RnWmPYyFWYWbn0FYd5RiPcPdf5iMfJTlPxIEJoOJpVYwf+gslld/utTEz3/D/6Qyl1y5uBqPnIdBH/gkL58OOL503RKxvnTfDu9QAxlprvD4yYTmQQBaumlNNGM2h5Dj9F9Mp0uT87MqtVdksQ/3ohA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n+3sFwyb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n+3sFwyb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777529151; x=1809065151;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MAgqiHxTHVhhgEAEAOOfc1268HvQAf01a+K2UTI+3K8=;
  b=n+3sFwyb43scmOHurYWs43MUoFe98fQfb5joo56slach01sWs/Fh1gFT
   hymaHQF5GfYIdnq3hBsW44fTigK/B0d9/oa43BQ8aDUwmCkAWEYG4X7/0
   70VMJm8HQAp6cEh/uxc9E+ExL5XK/y60Jti3fUnDcoJuPmtNGSVOU3uPH
   BYr9ULqsJ7bnOsgQmu6mlJcsbPBr/iiFYACVqz9+311IsmdAd7nwfsKda
   yTcT7DEtuqxkw8PCZ2gqX9ce/r2n76aopQoZEuYL0i6KbyJ5OTIhbSYlx
   U1obxQ7XzZ9pYwDEtkiif59x1Q0HOj9zIWzs+friCdXS3fUeRvUqawsqw
   Q==;
X-CSE-ConnectionGUID: FMxM82d8RweVxHn1dGV05A==
X-CSE-MsgGUID: +P/EZ/A/SFexL9tAJLYj0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="82077064"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="82077064"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 23:05:50 -0700
X-CSE-ConnectionGUID: 3ihSaDnoR1CjeQ4YAqUw1Q==
X-CSE-MsgGUID: /VN4PyLITKeLvtvMLZOT1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="229881428"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.42])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 23:05:47 -0700
Date: Thu, 30 Apr 2026 09:05:44 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jack Lee <skunkolee@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>, Kees Cook <kees@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	"open list:STAGING - ATOMISP DRIVER" <linux-media@vger.kernel.org>,
	"open list:INTEL MID (Mobile Internet Device) PLATFORM" <linux-kernel@vger.kernel.org>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Subject: Re: [PATCH] staging: media: atomisp: ov2722: clean up
 ov2722_startup()
Message-ID: <afLxOIy_RwjzltcG@ashevche-desk.local>
References: <20260429234110.7879-1-skunkolee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429234110.7879-1-skunkolee@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Apr 29, 2026 at 05:41:06PM -0600, Jack Lee wrote:
> Remove stale TODO comment that has been present since the file
> was first added to staging in 2017 and was never really acted on.
> Also replace return ret with return 0 since ret is guaranteed
> to be zero at that point, both write calls return early on
> failure.

NAK. This is not a real change. It has no value on itself.
Moreover, it removes a comment without actually addressing it.

-- 
With Best Regards,
Andy Shevchenko



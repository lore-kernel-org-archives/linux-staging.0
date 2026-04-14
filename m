Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3873E51F4
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 11:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776167296; cv=none; b=rEvb5gflPiuV/ce+CqAghvg8xby5GbWuwkXS48N3Zgcg+VyIuPMU//g9l+NOi4jNK8hvY0qGZN/VeOBxw9smj4V2+8R2Lo9LF1E2NQxc1WHDe7JcQqq2fTThV1QDrgkpvetYA21r2edObFBk0mqir2fTfKef7UP2FVeK2RJDTmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776167296; c=relaxed/simple;
	bh=oxk6Cyl5CQiBfjyCLVbsq/qAGJSobUlSJEvCVoV9zR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rA2b7X4UQ2WMs4XRGptpi7h4BiMhQRSJo+ushVxjLMPfCa4D+ZSz0p+AxwceGxvwdptSoQT04lpkowchQp+5J+1fcCogXoN+g1LKLKG8rSdH+Vbnu5znmlwxTEdX+VHmpORvK4ntv3d4K/rDxxDyYR+Po/KzjFFg2Kw/52A84bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UrBIAiaF; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UrBIAiaF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776167294; x=1807703294;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oxk6Cyl5CQiBfjyCLVbsq/qAGJSobUlSJEvCVoV9zR8=;
  b=UrBIAiaFdhxGoCESAfvS33rMNjnpFXdCG0qgaP2unjkt71CrwJbA1fN2
   zxYmLef6lkV7okKuz+dYSevk6MBF8xyHtfaO0AayfiL3tcEv+Hl6oWAP7
   GvQ0K1clU2DiWPJR1EbWv3H0AtAyhDp0OY7/AIvCB7TI409SSIyivx1i7
   p0cYHahyVMjg9fFQ5gRcs7lmrLOhNCJpQ62w7NPOkDKhqH/89wVxe5Xjk
   KoJ9+ImKdD9qHn6VGF0K5rRw/O3ctTXanAj91JC37yT7fjC+Jrn5A4/+1
   iSsgMCgRY0zb45oKv+FM1RqkGkfrgUfGexdxTAmdmuek0R62ag/vhzJ3D
   A==;
X-CSE-ConnectionGUID: 0rASG+Z5SnmWKXZGpuWefQ==
X-CSE-MsgGUID: OXNZ4FePQReKksYYHEqKcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="87823651"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="87823651"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 04:48:13 -0700
X-CSE-ConnectionGUID: fCTd00iOSUC3bPphexh6Eg==
X-CSE-MsgGUID: yGXJkRVsTZeQJLoxDSoLjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="230295131"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.106])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 04:48:11 -0700
Date: Tue, 14 Apr 2026 14:48:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marc Finkelbaum <regpacy@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/9] staging: rtl8723bs: fix space-before-tab whitespace
Message-ID: <ad4peDj4n4pWDuRa@ashevche-desk.local>
References: <20260414095833.76480-1-regpacy@gmail.com>
 <20260414095833.76480-3-regpacy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414095833.76480-3-regpacy@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Apr 14, 2026 at 12:58:26PM +0300, Marc Finkelbaum wrote:
> Replace tab characters with a single space in macro definitions
> (EEPROM_CHANNEL_PLAN_BY_HW_MASK, REG_RF_BB_GAIN_OFFSET), the
> dump_chip_info parameter list, the pHalData pointer declaration in
> SetHalODMVar, and the BK/BE/VI/VO tabular comments inside
> _TwoOutPipeMapping and _ThreeOutPipeMapping.
> 
> No functional change.

...

> -#define	EEPROM_CHANNEL_PLAN_BY_HW_MASK	0x80
> +#define EEPROM_CHANNEL_PLAN_BY_HW_MASK 0x80

Please, leave tab indentation of the value (between K and 0).

...

> -#define		REG_RF_BB_GAIN_OFFSET	0x7f
> +#define REG_RF_BB_GAIN_OFFSET 0x7f

Ditto.

>  //#define		RF_GAIN_OFFSET_MASK	0xfffff

This (and these in general) has to be fixed accordingly as it's clearly not an
example of the code in the comment, but a real code that got commented out for
some reason. For the latter the style should be adjusted accordingly.

-- 
With Best Regards,
Andy Shevchenko



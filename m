Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795507957;
	b=Ut+eDCyapiI2KdEwKfrlfSu0U+ll9Yl5sBAoz8QabuK4z8mWjoPDbTItjYZxq+7aRIA9
	 bgXI5Bguk39F0l/iapBYFn99KfD9+uoDLYPhdIwqXz9LG2+KOtWmsBBKmC0m7mHILVhvX
	 92RK1SQP288y4MSYKY9FfozpNsjVsrluXFG4aNF3mwarw7F01v2REH7l7T53tnQ7vdn80
	 HHIfe8nAmmf68bkG5eJixDscRRMzhxieYcw/zXMZSSJa7g1ZfFX+S0IAGDxExfyt88fp4
	 GaecUIK603k3dbqCsWp6gO/Q5o1y3b7HXr7R9qZL706VrIZ3fuHxeHOuq2aRRBPli0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795507957;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=Vh6o0Uq0GD1FXVlvKlx8RTkFOpyY76iCiDBsd6zPbMY=;
	b=jb3Ci1RLufqmnZ55A/ysUPmZHEMRR8dHCFLMlY5ssTCVL4IvaXXgbeBbU2X44EhnpcRR
	 xnW/UFwt/2HeYr3KemlNk/70NPuzUJGDnAjraqaqCs8hFEe0QFjPGLg8t+TYmq9L8x4Bs
	 BD/Vlb96aQwwbrF49pK9c9Od6gyc7mEocpSyNr7mJnUAiTR9WfroMg4p1ruFgXoL0Hc1v
	 mAHioEF8iHyvmyOKvUelQ8q3i0RW47i8/E7xePRJYA+0I6TFQaHHjYpxrMNjKSC95YcV/
	 JPXLSOr1jX1q9/CN0DF9a7p4rxNJPPCt4hgtNlI3MPDIFeYy3J9WHTC9Vwnh5QWDAYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E1askq4J;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E078606A31E
	for <linux-staging@lists.linux.dev>; Tue, 24 Nov 2026 08:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E078606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E1askq4J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795507956; x=1827043956;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Rf4Wny/8xM0G/G/mMyP4juRv8qe8MSGZhUvTveLTgjg=;
  b=E1askq4JTQmZOy8MODXzMAThjB8cxs6WzYSTVZ0+CnDTAkjwYpvEvxL2
   KhUQbCLZIvqC+KEIDcT3HuJfFuVlZivW0W4NzZYX8/D1MqhtpKADFs8s3
   ezAnyJpEnq1T/rAkJUoClfrs1lUveP7mAArARLyNN/SyraO8/N9RtiYEm
   90OBzB9aWc+1p2LjlyxrpD7iAVL4u9zwbEthYakQJJMbLGeLWc5S6eiPh
   y5PYEbQ3gCc5fcJutQjWnMc/Sb/UChwyQBdMALi4oEy7GQfpYTm27Yg4C
   pn+fmoek43hXcFFYnwCRTZ4bHRKF8Y9afiD3Hp3qJJlHA0VlQQZyycywp
   Q==;
X-CSE-ConnectionGUID: vdERubamQt6p1tgWWQySTw==
X-CSE-MsgGUID: U/81IDfVTRa6Dr3t5wxhQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4438886"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4438886"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 23:59:08 -0800
X-CSE-ConnectionGUID: tuGy8414R4S2qYx5/P+aDA==
X-CSE-MsgGUID: PQT5WKGnTv6NiF+C2djBVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="11830089"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.125])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 23:59:05 -0800
Date: Tue, 24 Nov 2026 09:59:03 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Abhishek Chaulagain <chaulagainavishek14@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: Remove unused timed controller code
Message-ID: <awVDx5P4yvcuVXWp@ashevche-desk.local>
References: <20261123200658.449-1-chaulagainavishek14@gmail.com>
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
In-Reply-To: <20261123200658.449-1-chaulagainavishek14@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 23, 2026 at 08:06:58PM +0000, Abhishek Chaulagain wrote:
> The timed controller HAL module - timed_ctrl_snd_commnd(),
> timed_ctrl_snd_sp_commnd(), timed_ctrl_snd_gpio_commnd() and the inline
> timed_ctrl_reg_store() helper they used - has no callers anywhere in the
> tree. The only remaining reference was a stale #include in sh_css.c that
> pulled in none of its symbols.
> 
> Remove the dead source file, its public/private/local/global headers and
> the timed_controller_defs.h definitions header (included only by this
> module), drop the object from the Makefile, and delete the unused include
> from sh_css.c.

> The timed_ctrl device identifiers (timed_ctrl_ID_t, TIMED_CTRL0_ID,
> N_TIMED_CTRL_ID, TIMED_CTRL_BASE) live in the shared system_global.h /
> system_local.* enumerations and are left untouched.

Why?

> No functional change intended.

-- 
With Best Regards,
Andy Shevchenko



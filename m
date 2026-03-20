Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D9B358374
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 08:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773994690; cv=none; b=YuODpP9k1bOvVxM7w5rRa9/rBnN58E3ZbrB/hEiBLMB62J+yQt1Ac1gCrAttHZeoX2hO1PxGLv4w1Gk9NiSUUK7id9l8daUmtE3Io32xAbt9XNB1JrXF6qzyx51eatC44jW9Ox73xy4dkMNjJIU/Io590VWEJFyr4NKvznOddLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773994690; c=relaxed/simple;
	bh=Cbs6fDbIVm4cxqy5zfwG+B9ee7arLRyURHKCIhe1zUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJxhPXSVoSgY/qBeviBKohvDxQGAqMWyvjsZwopKRcjlODZSI7FcSlnNVFD2YUZR7ZOMsnFZKqTVBYpjeFMAx247j8/AGEEocuW4kk2Bil161sgJeDLiaiPivniwgSUxhc2Im7t/Oeo4SpjEp24e1Pk5O9LJLmoIPde8ArF71VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gt7J5bdc; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gt7J5bdc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773994689; x=1805530689;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cbs6fDbIVm4cxqy5zfwG+B9ee7arLRyURHKCIhe1zUM=;
  b=gt7J5bdcwJTWCEsDdVooOarrxEm2EFOV7ZUlFFVhB1gCc5i4OCBKtrOY
   jzI0tuCw3I7X64x7YSVNIaqBKYMxEFE353euwGuABTHUTW5iko+x687DK
   N/Lkw5HAbbO1x2DvyeBb6M1TmWUjbnrYwzkRxhlFBssEq0kNq1lAzkEbY
   pWU4sc5tZkk1y1pWfP+wQ9w3Fo/01gw+ipwS+ZnS5gh5ojw7j3R4EZZiO
   Fn5YxWFZTVwB2Xcp9CvaOebTnW3IQWRPDSFHEY2Cr8X/V6pWI+1Eg+wqe
   YM+mfAu+LoPn0GmaYQOca08gjjtH3l3M9qgDZamo5Ds/pUKesrj3J1I2A
   Q==;
X-CSE-ConnectionGUID: A6deReHSTlOmE2XZg4G50g==
X-CSE-MsgGUID: Ip+H0BpQQGGqtUoTHJxMKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="92650477"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="92650477"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 01:18:09 -0700
X-CSE-ConnectionGUID: CEB5EzedQiSCpRlmKKLplA==
X-CSE-MsgGUID: sIrSlVdjSeqRxIkQ2bU8yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="222313546"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.40])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 01:18:06 -0700
Date: Fri, 20 Mar 2026 10:18:03 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Choi, Yuho" <yqc5929@psu.edu>
Cc: "hansg@kernel.org" <hansg@kernel.org>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"andy@kernel.org" <andy@kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: atomisp: fix UAF and memory leak in gc2335
Message-ID: <ab0Cu8NnIt-m7pQc@ashevche-desk.local>
References: <54321DD5-808B-441A-8F68-B812A3D72E5E@psu.edu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54321DD5-808B-441A-8F68-B812A3D72E5E@psu.edu>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Mar 19, 2026 at 07:30:10PM +0000, Choi, Yuho wrote:
> From: Yuho Choi <yqc5929@psu.edu>
> Date: Wed, 18 Mar 2026 17:08:57 -0400
> Subject: [PATCH] media: atomisp: gc2335: fix UAF and memory leak

Make sure you understand the tools and how properly to send patches

Also note, your patch is mangled and may not be applied.

> This commit addresses two potential resource management vulnerabilities

Please, take your time to study Submitting Patches documentation,
in particular on how to use imperative mode.

> within the gc2235_probe function's error handling paths.

As below refer to the function as func():

gc2235_probe()

> 1.  UAF: If media_entity_pads_init fails, the driver
>     invokes gc2235_remove(), which frees the 'dev' object.
>     The execution flow then inadvertently fails through to
>     atomis_register_i2c_module(), dereferencing the freed 'dev' pointer.
> 2.  Memory Leak: If atomisp_register_i2c_module() fails, the function
>     returns the error code immediately without executing any teardown
>     routines. This leavs the 'dev' structure, v4l2 control handler,
>     and media entity permanently orphaned.
> 
> This fix follows a standard goto-based teadown routines to ensure all
> allocated resources are freed in reverse order.

-- 
With Best Regards,
Andy Shevchenko



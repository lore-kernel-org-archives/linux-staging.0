Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C040836F8FD
	for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 18:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787857096; cv=none; b=NgMyzmfgeoPSFKy4yGQy2hV29iJ9LGx9s9BXT6rBTaZNK9Aqtib5ePWPa2PnXAkREppZjZMthyIrUvKCHpOl5Pq/QeDlMed+LpnXsuVHdv7xnHoX9+FgdRdf0WGIs9rH4nuoxwlDO9s9CAF+a06TFl3la6iVss6+uVZYf/Rq/QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787857096; c=relaxed/simple;
	bh=4zcrTddowpSxiYhcSYOL05EQdrvjbZcH9gttjFlk72U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGmPcYCzkTvKxGiMbAFNDpO8xSQAd0sLGIAjgwzLmOegwJJEsYg9HwkRT0nhrBUbQm2OCWkxYkfwes6pAe8DcTU/81U+WjuXWVBxyLOPqmZDlilaNPJdAghUCuubqMPsIjhG6mGWFJ1U7zFAZ51RF//nWTtGd6w933DJIY+A9to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dAerWUPc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dAerWUPc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787857091; x=1819393091;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4zcrTddowpSxiYhcSYOL05EQdrvjbZcH9gttjFlk72U=;
  b=dAerWUPccb4PfAf171+FQcb8RCBhleMFBc1hkgGnEPn7cYOaO2zMpJIe
   01kkXb9C5nBjjoH6W+Orv66ztTZQkEPbVXKtnCERehTq7G0qE6b04r8RM
   JLKUNo9PGW8ILxMasHER4TetCokZmEtG6k3z5LDg62LPy6P+ThM7//9LT
   76KuOtLb2wL+EBRtaJ4qxRyTxbUBD8ENxruIA13iXghAN3fJ5GYOHuw3e
   f4hJtrz/woxn51jeH1pqCecMKoEC4f/Lx2jr4+DvczfR1Bphv7igvg1Wx
   yawvKxLO6rxF1SVKLX25VeixITwaD6Q+McBuNwr3wWH2LzEWTNVJjlldR
   A==;
X-CSE-ConnectionGUID: LAfc3TvTT12RTce+ZBKeZA==
X-CSE-MsgGUID: XDxpwenLQPCF6ROdisEQiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="98965362"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="98965362"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 11:58:08 -0700
X-CSE-ConnectionGUID: FVVv0PTfRDSMYeYN1XYNCA==
X-CSE-MsgGUID: e4HhexLHSEK495d7uilDEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="297850150"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 11:58:04 -0700
Date: Thu, 27 Aug 2026 21:58:02 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/11] media: Add Lenovo Yoga Book YB1-X91 camera
 support
Message-ID: <apCIuhDu9jI9ZbJl@ashevche-desk.local>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Aug 27, 2026 at 08:17:45PM +0200, Maurizio Casciano wrote:
> The Lenovo Yoga Book YB1-X91L exposes an OV2740 front sensor and an
> OV8858 rear sensor through the Cherry Trail AtomISP. Its firmware does
> not provide enough information for the existing sensor and IPU bridge
> drivers to construct the complete camera links.
> 
> Add the ACPI IDs and bridge data, describe both AtomISP camera links,
> support the Yoga Book sensor clocks and modes, expose raw Bayer capture,
> add per-channel white-balance controls, and add the WV517S rear-camera
> lens actuator.
> 
> Raw capture is selected through the normal V4L2 raw pixel formats. There
> is no module parameter or separate private ABI. Processed formats retain
> the existing behavior, while raw formats expose the complete CSI-2
> transport frames required by the ISP2401 copy pipeline.

Do not start new version in the email thread of the previous one!

> The series is based on mainline at 73e3f0710014.

Unneeded statement, the --base puts data (and it did) in the cover letter.
Tools know about it.

> All patches pass strict
> checkpatch with no errors, warnings or checks. Pahole reports a 64-byte
> ov2740_mode with no holes and a 792-byte ov8858 with the new clock-rate
> field naturally aligned. A clean 20-job bindeb-pkg build containing the
> same final source state completed successfully.
> 
> Runtime testing used a Lenovo Yoga Book YB1-X91L. Both sensors, AtomISP
> and WV517S bound. Focus position 300 was accepted. Captures passed with:
> 
> - front raw BG10: 1932x1092, 4472832 bytes;
> - rear raw BG10: 3264x2448, 16293888 bytes;
> - front processed YU12: 1920x1080; and
> - rear processed JPEG: 3248x2432, 1530647 bytes.
> 
> The raw format was selected and streamed in the same v4l2-ctl invocation,
> as reopening the video node restores its default format. Both raw files
> were non-empty and distinct, and the rear full-resolution JPEG completed
> without AtomISP, sensor or runtime-PM errors.

-- 
With Best Regards,
Andy Shevchenko



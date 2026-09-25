Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150BE355057
	for <linux-staging@lists.linux.dev>; Fri, 25 Sep 2026 08:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326288; cv=none; b=rFSosgY+8GBwkqlV1AFP+7UsFravZe3KR2YG1Pte4zLYeJxp1xQjpXFBqu8rZO4DEjPf3wfRkhlBog9+JHeRgm/est1Sifa9MTQFBOIuevH1OLJC58iuxQoLk8ljim1obuJ/whxtLy2zKQ40w9lX8lGB+2Z3PpIFze5IicaJx8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326288; c=relaxed/simple;
	bh=3wm6TUr+tZUOPwnofkBwSc153ql4UOBJK8YjoL01jks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QDREXLziIeodYaqBWVrHI7/gHYd4TnWsTB2kYJuLAno7+sQPEAKzB8lbLYpeP+hMvxeFJ9n/YQW7hVveGwZbKr36j2UxBNDTW/e95IwKdAPB4v9YykNu8W7xL9Nfs/+nTDI1UQMwYWX5bCfCsrXmRqYg6nel+iymfVRManK8aUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hr6C18nr; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hr6C18nr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790326286; x=1821862286;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3wm6TUr+tZUOPwnofkBwSc153ql4UOBJK8YjoL01jks=;
  b=Hr6C18nr8rr4VqWaDQD46FYcKw7EKyp2++8uKsF0/WRoya4aFM3b4WDF
   7HnnwKCTGDFQze1iMOUZqsJmU3XNCn7AIZze3dDj1bp1Z+kKjkU8Cm3Fl
   cazIiFpvxAxEL+B7yihWy5F5NwTlzBJTWsrKVDlS2X21Cz/9exUBSf+9n
   fiXRYOzgyskH1SFhoV/T2ANIb7djI62JaWIlJummbdWw8r3QDmnFZ6RSC
   5KDCm85NAy274hTTQpCXcIigbN9gvpcS2CxikHwkviBCUOx+RhxP7q8pR
   8IKqd+RBgVgRTRvLorT01wiTp08V4B7S/nhBfvO+Ktp80q+o4JefjKvAH
   Q==;
X-CSE-ConnectionGUID: hOGKTtapS4G3XFJYEUZgHQ==
X-CSE-MsgGUID: kamEMIlbSOuZH5NZm8vukQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90149515"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="90149515"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 01:51:24 -0700
X-CSE-ConnectionGUID: tTBcGD5gS06zv6Op1u528g==
X-CSE-MsgGUID: XtE7K6PSShuE3ACHVpwfMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="273502300"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.84])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 01:51:21 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 06AC4121BA5;
	Fri, 25 Sep 2026 11:51:21 +0300 (EEST)
Date: Fri, 25 Sep 2026 11:51:21 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ruslan Koreev <koreev.r@gmail.com>
Cc: benjamin.mugnier@foss.st.com, sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com, mchehab@kernel.org, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>
Subject: Re: [PATCH 4/4] media: staging/ipu7: Add monochrome pixel formats
Message-ID: <arY2CULvwXGyVvH_@kekkonen.localdomain>
References: <20260924171820.1179823-1-koreev.r@gmail.com>
 <20260924171820.1179823-5-koreev.r@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924171820.1179823-5-koreev.r@gmail.com>

Hi Ruslan,

On Thu, Sep 24, 2026 at 08:18:20PM +0300, Ruslan Koreev wrote:
> The CSI-2 receiver already accepts MEDIA_BUS_FMT_Y10_1X10 but the video
> nodes offer no pixel format for it, and MEDIA_BUS_FMT_Y8_1X8 is not
> accepted at all, so a monochrome sensor cannot stream through the IPU7:
> the ST VD55G1 IR camera of the Lenovo ThinkPad X1 Carbon Gen 14 only
> produces Y8 and Y10 and no configuration can be negotiated for it.
> 
> Add the GREY, Y10 and Y10P pixel formats, mapped to the RAW8, RAW16
> and RAW10 frame formats like their Bayer counterparts, and accept
> MEDIA_BUS_FMT_Y8_1X8 on the CSI-2 receiver with the RAW8 data type.
> ipu7_isys_is_bayer_format() treats every raw code as Bayer, so the mono
> codes take the raw path in the CSI-2 cropping code; leave them alone in
> ipu7_isys_convert_bayer_order(), which otherwise warns about them. The
> two parts belong together: with the mono codes exposed but not excluded
> there, any crop offset on a mono stream triggers the warning.
> 
> Tested with the VD55G1 on that laptop: libcamera negotiates Y8 and
> streams 804x704 at 58 fps, and Y10 and Y10P stream with plain V4L2.

Can you try doing this with the ipu6 driver instead? We're about to drop
the ipu7 staging driver after some smallish number of kernel releases.

-- 
Regards,

Sakari Ailus

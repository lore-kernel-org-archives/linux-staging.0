Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249433F4DE7
	for <linux-staging@lists.linux.dev>; Mon, 20 Jul 2026 11:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784547460; cv=none; b=nWBotjosbbWkupGj8/cbCKSCSRj+6SU2bMLMJQwb7ycDLsFjA09NsumBJ2CNZ36DOHmtR/JrVVwdJFGhbLN9zFzYQxagM5EL0AJupMYj9tM6AxqjdpYINtY9Fzfv0Ilfm5nD7Lh1cdGwkJBmMmLbr0RHd9Vt8ETZLBBFkC0iRDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784547460; c=relaxed/simple;
	bh=2S13Kd+yZY0NjA3fKw2dnB/9se2tJrzCCQrbr51MvmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APmYcLMjiU8goWQjiz7nPDLTZe4bK0R2Px+oY5HtoazcksSjwa/8Jub7H3Y0Gz08CAi93/KCwIQyr/TBKtIilypo7tSySxGp+j1wveuO1c6ubJoalnWCLPH3Vtkvu8yryE7tsz62uxFxY7cf30th1ezAeausxyzxDWatvHwdHGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jgz+QvIq; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jgz+QvIq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784547459; x=1816083459;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2S13Kd+yZY0NjA3fKw2dnB/9se2tJrzCCQrbr51MvmM=;
  b=Jgz+QvIqzMOBw7UO2wS7oD3D7Al3STFZo8P1cn6RpwWwFAVZUFixnHTT
   02Y45SIJ2S5HDSyOSlXJ+/TAXUzOyUQmUxtdvUeSFu/BwgsebTt6iPMGL
   jUW6VLVR269+3E9Viyshrq8fAdkaxfwg1JKaqwqoVuCp+j4bme8gx5mff
   sz/xskCMPpBXZ6etOeKxBAeS3c2+n5TBLGmZGyJNVuz/YNj8jfmpAHJe8
   3QXehLXLnmOGqb4lAJEneMPXMOGZJ+G82n52Gx6sYraI3AOFBAGtP1n6D
   AeIrNek3ghndEhpr/GFm4KxvsxwgE6BzGEUw0MriMIj4jEPZDUMZIv3O7
   w==;
X-CSE-ConnectionGUID: jEC6t+aVSY+ymK7M5E5idA==
X-CSE-MsgGUID: pJdCbhtxTCGSHvtZ+gmYfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="84982074"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="84982074"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 04:37:39 -0700
X-CSE-ConnectionGUID: CB6+BqVCSJ+/D2p+LSEF6Q==
X-CSE-MsgGUID: xbvm2yQsQLC5Gbk0rzD3kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="254819712"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.175])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 04:37:36 -0700
Date: Mon, 20 Jul 2026 14:37:34 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	error27@gmail.com, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: media: atomisp: Remove pad_w and pad_h
 module parameters
Message-ID: <al4IfpjQiUEuNiJ3@ashevche-desk.local>
References: <20260720112807.6348-1-prajvalchaudhari733@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720112807.6348-1-prajvalchaudhari733@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jul 20, 2026 at 04:58:07PM +0530, Prajval Chaudhary wrote:
> Hi Andy, Dan, Hans,
> 
> Thank you for the review and catching this. 
> 
> In this v3, I have completely dropped the changes to the debug 
> parameters to keep the staging debug facilities fully intact as requested.
> 
> This patch now strictly focuses on removing the 'pad_w' and 'pad_h' 
> module parameters and converting them into internal driver constants.

This must not be the part of the commit message. See below.

> Remove the 'pad_w' and 'pad_h' module parameters to prevent userspace
> from overriding internal ISP hardware padding boundaries. Convert them
> into internal driver constants instead.
> 
> This partially addresses the 'Remove unnecessary/unwanted module
> parameters' task in the driver's TODO file, while keeping the debug
> facilities intact as requested by maintainers.

If it partially addresses, then I recommend to finish the task.
Half-baked solutions usually are not welcome (only as a discussion
starter or so). I already told that the whole debug facility in
this driver should be aligned with the kernel APIs and tools.
Have you read my previous replies?

> Signed-off-by: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
> ---

Here is the space to add comments like you put in the above text.

>  drivers/staging/media/atomisp/pci/atomisp_common.h | 4 ++--
>  drivers/staging/media/atomisp/pci/atomisp_v4l2.c   | 8 ++------

-- 
With Best Regards,
Andy Shevchenko



Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32502FD68B
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 22:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773182782; cv=none; b=b3ivAH7/1T6nmIYrwx8rpoLD1hl0FlTQo5r7GZdtN5JLSgKYqqoYRMtj3MqZx5DXf74G57siRg7ua4FxjuU96MspPgALZlpFukcjed7p+ZHbmf9jkOBnl04ly87Y6OdNt4Hd1xQaY8jXxJSf27nkFCrfmukiTuku3/mVGcmcjKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773182782; c=relaxed/simple;
	bh=wPIYw+bRB1LzsklOC9+3gspMXxwrNY3ONTv8VzwLXcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eE+nsBmeFtfyTxChJzLCWsssnIALwaUWUbWHJ/cHp4g8bmQDytC8vczh3a7IkAA1J1KsFSC6QCSCd286V8Y16SC8yCyszy92aq9LmQoKF0BxEdbS2SrDbddMz40hRAFQQwaIuXSWBPaxKmOLc/GPh5iFYY5X/9tr672sICrzK/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h9+QFhir; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h9+QFhir"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773182780; x=1804718780;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wPIYw+bRB1LzsklOC9+3gspMXxwrNY3ONTv8VzwLXcA=;
  b=h9+QFhirxHhzpk0MjKSn1KniTqEuGOHlKRDVycuM3ASwj7XsmP6pYni7
   aW7MAoPCeoIeDR4DCePQ0gdmUcWqcs/DypT6yanZCuc6b9HSWZfI3xaj5
   Yr7BKg4lxHbMWWNtJXcjU5nvNk4nwYC7sPO4N1TyNLhds0pguueTkKnId
   q9K2Q6pe+1tBbmaacbicc6yv/sBCLpAnTaymRT01hFDC1Mp3Mj4+uxxK5
   YN5QO/C4eWA33eZM1lDUsYSppmU70ekjOlfVKfYjhiDgSQi8r47LWoL5j
   eaioCk+5TQkoG6E1E4C3dJxcXS92FMEOFZUr0Kp0Z5RjyrnJOYduPzc7w
   g==;
X-CSE-ConnectionGUID: aGJNi1goQNm5glkQ3SvYLg==
X-CSE-MsgGUID: 8hK9Ji8IRJ6akk6WuHi4Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="99709875"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="99709875"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 15:46:18 -0700
X-CSE-ConnectionGUID: a7pr8+qSS0mqcmwLv6rMdw==
X-CSE-MsgGUID: Yts02qf8SxWmXU+7JQBdJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="224730903"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 15:46:16 -0700
Date: Wed, 11 Mar 2026 00:46:13 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 00/28] media: staging: atomisp: Remove unnecessary
 return statements from void functions
Message-ID: <abCfNWX2R7rkLJ9n@ashevche-desk.local>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271.ref@yahoo.pl>
 <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Mar 10, 2026 at 10:39:11PM +0100, Tomasz Unger wrote:
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
> Changes in v3:
> - Extended cleanup to all 27 files in the driver containing redundant
>   'return;' statements at the end of void functions (as suggested by
>   Andy Shevchenko): inputfifo.c, bufq.c, ifmtr.c, frame.c, rx.c,
>   binary.c, ia_css_debug.c, mmu_public.h,
>   isp2400_input_system_private.h, hmm_bo.c, sh_css.c, sp_private.h,
>   fifo_monitor_private.h, isp.c, input_formatter_private.h, irq.c,
>   mmu.c, fifo_monitor.c, gp_device.c, gdc.c, event_fifo_private.h,
>   isp_private.h, input_formatter.c, irq_private.h, gpio_private.h,
>   gp_device_private.h, atomisp_cmd.c
> - Each removed 'return;' was verified to be at the end of a void function
> - Compiled successfully: make M=drivers/staging/media/atomisp/
> - Module loaded successfully in QEMU with Linux 7.0-rc3
> - Link to v2: https://lore.kernel.org/r/20260310-atomisp-remove-void-return-v2b-v2-1-b0e73f498e25@yahoo.pl

You sent the series 3 times and all of the times it's not sent in full.
Besides that it must not be split by file! This kind of change is okay
to have in one patch.

-- 
With Best Regards,
Andy Shevchenko



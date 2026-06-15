Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47953B389A
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 11:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781521880; cv=none; b=jqzqwwcdoZBemhjbumBDJYKCyxLAGfjUCQC5ed8q4mBiiQuq/yct+U5rwVQBqeHXFb2lV0VyZheKk3M2g03RUVMf3wymkks3BpeGuBAMOHYJnl52TigUfRVgJDqOzgnM/uNeaKBGuWxHGxREVPJ8CVTacWNkIE+Hd9E4tay0i6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781521880; c=relaxed/simple;
	bh=oGkEbOWKIP4/QgBtFSIaAB4DFWaeZvXeFAjNwaH8by8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWakUBd4NBCN/b8S1AnjIxXvXYWRfl+D0uMRzXsBm0nb1noEi4p+0S6H1kRhxcppc04Wy25OjWYqRv19aQ94Vs4yBntWKxRx46BhvJLwrpFNUMH5jxu662YYJmyDqQm7ju7MbTnCikIlF263G+P/re9ETLXzlIVqv0wI9o4MDzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Os8DnVe5; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Os8DnVe5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781521878; x=1813057878;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oGkEbOWKIP4/QgBtFSIaAB4DFWaeZvXeFAjNwaH8by8=;
  b=Os8DnVe5WDIV0v4JjT86Zzuzf2MwPAT2ksqnXAPNd941XuyUJFIb/8Zk
   PpGhhPzUN0fPBJKn44QCf3sj9lUpX99JrzikqyglHkV62OGtM5XECqmr9
   +ESuiHrSfGgdrX5LDAG9GGe7158/64iyLy/JuKnGi56Ec1Xfhkptz35dq
   CyEE3caBGkuC9VMHq6sLcEgnWyEPw6x4mZAudIl7h5hgrZdgP0RnWrRKg
   UBwFjEs/dRlNFt/EC3TpKARA476Rmal83MGjdLWimpWjgHzqJrD9/uycz
   ktZsTvr3RdDimy7A3i4AB6Y4P8kQfBhvsDN9Ix+eNzM1a/FWHFKQMUl0W
   Q==;
X-CSE-ConnectionGUID: JC9Mkx4hQPaQGKGWlIMBwg==
X-CSE-MsgGUID: KTl2A7u2QyGZDTcshtkNcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="92816730"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="92816730"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 04:11:17 -0700
X-CSE-ConnectionGUID: ULp5p7pwQUGlrTAGsgc1Qw==
X-CSE-MsgGUID: sF1ZahKLQm2GbyaZWqio4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="271139934"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 04:11:14 -0700
Date: Mon, 15 Jun 2026 14:11:12 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dawei Feng <dawei.feng@seu.edu.cn>
Cc: andy@kernel.org, error27@gmail.com, hansg@kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, abdelrahmanfekry375@gmail.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, jianhao.xu@seu.edu.cn,
	Zilin Guan <zilin@seu.edu.cn>
Subject: Re: [PATCH v2 1/2] media: atomisp: fix memory leak in
 atomisp_pci_probe()
Message-ID: <ai_d0B8YOZAwnqu_@ashevche-desk.local>
References: <20260615072841.3113700-1-dawei.feng@seu.edu.cn>
 <20260615072841.3113700-2-dawei.feng@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615072841.3113700-2-dawei.feng@seu.edu.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 15, 2026 at 03:28:40PM +0800, Dawei Feng wrote:
> atomisp_initialize_modules() creates CSI2 and ISP subdev media entities
> before atomisp_pci_probe() registers them. Its counterpart,
> atomisp_uninitialize_modules(), only releases part of that module-owned
> state and leaves some media entity cleanup to the entity unregister path.
> 
> That ownership split is incomplete for probe error paths. If
> atomisp_pci_probe() fails after module initialization but before all
> entities are registered, the unwind path cannot rely on unregister
> helpers to release media entity state whose lifetime started in module
> initialization. The CSI2 and ISP subdev media entities can therefore be
> left allocated.
> 
> Refactor the cleanup boundary so module cleanup releases media entities
> created by module initialization, while unregister helpers only undo
> registered V4L2 and media device state. Move CSI2 and ISP subdev media
> entity cleanup into atomisp_mipi_csi2_cleanup() and the new
> atomisp_subdev_cleanup(), and run media_device_cleanup() after module
> cleanup in the probe unwind and remove paths.
> 
> If atomisp_mipi_csi2_init() itself fails, it has already unwound its
> partial setup, so return the error directly. Only the later
> atomisp_subdev_init() failure path needs to clean up CSI2 from the
> caller.

> The bug was first flagged by an experimental analysis tool we are
> developing for kernel memory-management bugs while analyzing
> v6.13-rc1. The tool is still under development and is not yet publicly
> available. Manual inspection confirms that the bug is still present in
> v7.1-rc7.
> 
> An x86_64 allyesconfig build showed no new warnings. As we do not have
> an Intel Atom ISP platform with the required camera sensor hardware to
> test with, no runtime testing was able to be performed.

These last two paragraphs do not suit the commit message. Please, drop them
here and better to describe all this in the cover letter (if not yet).

> Fixes: 9d4fa1a16b28 ("media: atomisp: cleanup directory hierarchy")
> Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
> Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>

This SoB chain is wrong. Who is Zilin and why is he here?

-- 
With Best Regards,
Andy Shevchenko



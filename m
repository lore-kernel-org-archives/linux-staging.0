Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759693264EA
	for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 17:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785259022; cv=none; b=GCktwwbjxsFuKK+J6gr5pPRXNfkyOVw7xBIHqbNqL5VNVE8r8mE6LJETEwoPBLsKNfh3q5hqRBo1nvHrm7dzjNTy8oC1ZZpEB9Z1xN1PFYburrPpDY5rX7y+uV5BUJd+omCYgVbHyMFXV3OdsUSPlA/NAur8Gw8gQqS445XSLqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785259022; c=relaxed/simple;
	bh=Bcj8YV4X7orSGwFtvXPqoJ7JhF9qdEDLoBZf7cwnHIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oyQ5btZz/qhnwdFMIuBwXtmdht+cJTGuvm+V2PqT/pX3UU/s1ilpeNgV0ohbcnqE+NLjoa1aFg5YgEVj0HLdFaqv3lrM5lxGd6wUFuHB1U9LUYf491bZvBFs1JynENDYtvDqkFjSizMpuLCoE5X1zyI0dcwNwXcdIRjDCaxxV0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RJX4DxAu; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJX4DxAu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785259021; x=1816795021;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bcj8YV4X7orSGwFtvXPqoJ7JhF9qdEDLoBZf7cwnHIQ=;
  b=RJX4DxAu8mvNJ/nZGgUWqinGrI1AvsZ73hfehzLHG19R9iuM3oP583We
   wmP/7ACi27o8CKBZmd/SWdbMwajBg0K7VdgeUQhCsH/kSCOa7pFLAuTuA
   xUIRJpkd05H8Lk1hYTf60sdtnswdd6eWMwOfpHMRv+nupQQiJtxfTGhv6
   cksxdSPwMhb3WzY0HvLcF6Z9Fq4WkZBMZWU9jQq1q2DO85dSYfWWaJjsz
   2T7ZhHJzLHepTOEKk2HlG/YqxX/fc/ZMs6fPwScWYY0BNlO+1nLXHOLaf
   GLTdAZpUGWAvuEj3wgttHt1rnPsVM3AqvbIEdBhIf5MkM8mOE0BMNvyi5
   g==;
X-CSE-ConnectionGUID: CP1sOKRYTACyL1d6n87BQw==
X-CSE-MsgGUID: rM/t/uJRRHud+tPYnJCYXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="111398943"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="111398943"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 10:17:00 -0700
X-CSE-ConnectionGUID: fq+EKPK9TwORg5gGzOv6Yg==
X-CSE-MsgGUID: 5G7Ra9sgR3mksHlYdmQPFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="263249471"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.69])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 10:16:58 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 55042121C2B;
	Tue, 28 Jul 2026 20:16:56 +0300 (EEST)
Date: Tue, 28 Jul 2026 20:16:56 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Cong Nguyen <congnt264@gmail.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging/ipu7: fix async notifier leak on init
 error
Message-ID: <amjkCL_nSJk6VRSL@kekkonen.localdomain>
References: <20260727112239.812159-1-congnt264@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727112239.812159-1-congnt264@gmail.com>

Hi Cong,

Thanks for the patch.

On Mon, Jul 27, 2026 at 06:22:39PM +0700, Cong Nguyen wrote:
> isys_notifier_init() initialises a v4l2 async notifier and then, for
> each CSI-2 port, adds a remote sensor subdev to the notifier's
> waiting_list via v4l2_async_nf_add_fwnode_remote(), which allocates a
> sensor_async_sd descriptor and takes a fwnode reference.
> 
> If parsing or adding a later port fails, the code jumps to the
> "err_parse" label, which only drops the current endpoint fwnode
> reference and returns, without calling v4l2_async_nf_cleanup(). Any
> descriptors already added to the notifier for earlier ports are
> therefore leaked, and the caller's error path does not clean up the
> notifier either.
> 
> Call v4l2_async_nf_cleanup() on the error path, matching the cleanup
> already performed when v4l2_async_nf_register() fails. This is safe as
> the notifier is always initialised before the loop is entered.
> 
> Fixes: a516d36bdc3d ("media: staging/ipu7: add IPU7 input system device driver")
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>

The patch is fine, but there's another issue there, see
<URL:https://linuxtv.org/mailman3/hyperkitty/list/media-ci@linuxtv.org/message/G5DTPKTRTWM5PBTFQJP2HI7T324FZF5D/>.

Feel free to post a patch for that, too.

-- 
Kind regards,

Sakari Ailus

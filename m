Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF267282F2A
	for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 07:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786520960; cv=none; b=SBTArILnfwEMSBTOqmjv8j9tc9hfWLuBKayRAkQDwFwtPlYRkPI+Vypxd6ezt1trxn6h4FZECCLypaYS5ceyClTz8OJrLb+Az7aB4F88N8O0oPxPt/IQiUR0NIKKlrY4xjZYqaEha/w86YYIPPMahYI3R5NtZHkGGgzqCLWlc0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786520960; c=relaxed/simple;
	bh=tVi/QBdK0JUsLmuPKmZmBi8Oqnf7Y9WfAIErWDAibgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tmlid42HEA5P3nlFrNen/98pO6C0RORVyATmkPjAq0OiaCQxS2pBUKbqTCe27XsWmDq+JwUz19/ZENGrfcf3+3uT2XySrwmTslVodEGxyzd0ZtrUY9Dsi/kl9845xHMuVHJ4NwLszEo7y4SJvXa6bo7QmcvX0Eemplye7sRiuqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cR1EE36M; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cR1EE36M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786520959; x=1818056959;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tVi/QBdK0JUsLmuPKmZmBi8Oqnf7Y9WfAIErWDAibgI=;
  b=cR1EE36Mh0fzZp4F5Cozwfqr2k5jU1z3kBTOtWSFW+8oqEBEN+Ur3w2b
   9rY5gmqrklXNa5/bY1jWPjMu1NZCuKOQ2FMlFY5BcU/L+N+GtPrvmxxZj
   lnyKoS62CVHVCFiHVwrBJJFIkqfqqeLOWbq9HiOyMKdtdQ4haJ6rvQjWr
   nf/BTE5SoxYUtcyw60gcdMNvcE7GUw8Uy/1GB6RhmcM2vn6PWXKBrTPvH
   f5qBOmeyhyOu3721RGLKTjqhZS15/dgiUZSnjZ/vgubSaCZ13EVlsELFK
   tjiWxGyclEVTy+fQ9CRZ3O7qKa5Xew/6YuTrpGzRnYTy5bEpKntZI3rSJ
   A==;
X-CSE-ConnectionGUID: 1Q3PxOyQRvy3GMWjKm7M8Q==
X-CSE-MsgGUID: kf67sgEXQHyfIwRj0YtQnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="89590595"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="89590595"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 00:49:17 -0700
X-CSE-ConnectionGUID: 5e0MXCmSRUmVCDMF0vZn2w==
X-CSE-MsgGUID: /D+aPU8SRV+UTE9a7n7U0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="267424881"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.92])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 00:49:15 -0700
Date: Wed, 12 Aug 2026 10:49:12 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nikolay Kulikov <nikolayof23@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] staging: media: atomisp: inline macros for
 checking the bo/bodev pointer
Message-ID: <anwleCB7QFRPfY-t@ashevche-desk.local>
References: <20260723185217.317981-1-nikolayof23@gmail.com>
 <20260723185217.317981-3-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723185217.317981-3-nikolayof23@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 23, 2026 at 09:51:19PM +0300, Nikolay Kulikov wrote:
> These macros perform a pointer check. Replace it with direct conditional
> expressions to simplify the code.

...

> struct hmm_buffer_object *hmm_bo_alloc(struct hmm_bo_device *bdev,
>  				       unsigned int pgnr)
>  {
>  	struct hmm_buffer_object *bo, *new_bo;
> -	struct rb_root *root = &bdev->free_rbtree;
> +	struct rb_root *root;
> +
> +	if (!bdev) {
> +		dev_err(atomisp_dev, "NULL hmm_bo_device.\n");
> +		return NULL;
> +	}
>  
> -	check_bodev_null_return(bdev, NULL);
> +	root = &bdev->free_rbtree;
>  	var_equal_return(hmm_bo_device_inited(bdev), 0, NULL,
>  			 "hmm_bo_device not inited yet.\n");

While at it, also replace here var_equal_return() with appropriate C code.

...

> void hmm_bo_device_exit(struct hmm_bo_device *bdev)
>  
>  	dev_dbg(atomisp_dev, "%s: entering!\n", __func__);
>  
> -	check_bodev_null_return_void(bdev);
> +	if (!bdev) {
> +		dev_err(atomisp_dev, "NULL hmm_bo_device.\n");
> +		return;
> +	}

While it's in the original code, usually in kernel we consider releasing or
existing functions be NULL-aware. Not sure if we need an error message to
be printed here. But I leave it to Sakari to decide.


...

> int hmm_bo_alloc_pages(struct hmm_buffer_object *bo,
>  {
>  	int ret = -EINVAL;

Do wee need to keep the above assignment?

> -	check_bo_null_return(bo, -EINVAL);
> +	if (!bo) {
> +		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
> +		return -EINVAL;

Depending on the above it might be

		return ret;

But in such a case the above assignment should be split

	int ret;

	ret = -EINVAL;
	if (!bo) {
		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
		return ret;

Looking now at this, I think that your variant is better, but with it it's
better to also check how ret is being used and split assignment.

	int ret;

	if (!bo) {
		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
		return -EINVAL;
	...
	ret = -EINVAL;

> +	}

...

> static void hmm_bo_vm_open(struct vm_area_struct *vma)
>  {
>  	struct hmm_buffer_object *bo = vma->vm_private_data;
>  
> -	check_bo_null_return_void(bo);
> +	if (!bo) {
> +		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
> +		return;
> +	}

In this case it's better to also split an assignment.

	struct hmm_buffer_object *bo;

	bo = vma->vm_private_data;
	if (!bo) {
		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
		return;
	}

...

> static void hmm_bo_vm_close(struct vm_area_struct *vma)
>  {
>  	struct hmm_buffer_object *bo = vma->vm_private_data;
>  
> -	check_bo_null_return_void(bo);
> +	if (!bo) {
> +		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
> +		return;
> +	}

Ditto.

-- 
With Best Regards,
Andy Shevchenko



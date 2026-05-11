Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D713A0B01;
	Mon, 11 May 2026 07:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485591; cv=none; b=cNfchjcgtm8nvdZOPKI4R9hYAdvWpJLm0aBPuWmGsdWp5VH7oFEWkCAbhcB7xtAjPTZ+pMhHRPpmvvRr1r32PCg4v1codo4QYbgnWTwDgRvEqW7Obx0BJ4u32K69onO43+NiVqwKza6fZJZyv+RJOg4MIX/6jm/z9xkZsDNPfdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485591; c=relaxed/simple;
	bh=XOvdML94WYeB2whpCkopQ3cgWTtcayaUmFAd/5PlNYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=piDDO6FujF15yuaOBjgAvYuJtT5kDMDSJeArg8cKHo8mjEX9JnrP1YATSGYgK2v6DoRSPknzGyt1LmiNFhe7XdXovNg6B5ije8AA39sBspYs6QjenhaOh0zEE9GsHjW0RTu/TZdzXj2wqW0+BiSdJ0RLD2u4rJ8mWd2QGvx8ocY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=V0VjX6sH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="V0VjX6sH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB720C2BCB0;
	Mon, 11 May 2026 07:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778485589;
	bh=XOvdML94WYeB2whpCkopQ3cgWTtcayaUmFAd/5PlNYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V0VjX6sHMVogwH8A+BChyNsMsDiNAk0tgTM8VBonPExhgnLXx7BVeYwEi48gtKNZ2
	 rcMKX/k4BHhfhHjJJG5lVcUA1A6LrWnUvt+pcgAHK0Q8UcqS8fViV+cjbnzQ6KH/09
	 5oYL18yO0zILcI2qHmlb9v9qt92nu6NhF+eYJ/yM=
Date: Mon, 11 May 2026 09:46:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: check find_bridge() return value
Message-ID: <2026051125-cost-calculus-2a6d@gregkh>
References: <20260505205746.227144-1-shyamsunderreddypadira@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505205746.227144-1-shyamsunderreddypadira@gmail.com>

On Wed, May 06, 2026 at 02:27:46AM +0530, Shyam Sunder Reddy Padira wrote:
> find_bridge() returns NULL when no matching bridge is found
> for a given resource. Some call sites dereference the return
> value without verifying it is non-NULL.
> 
> Add NULL checks before use to avoid potentail NULL pointer
> dereferences.
> 
> Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
> ---
>  drivers/staging/vme_user/vme.c | 63 ++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
> index b5c66b66ce32..2ed2f1fe502f 100644
> --- a/drivers/staging/vme_user/vme.c
> +++ b/drivers/staging/vme_user/vme.c
> @@ -82,6 +82,9 @@ void *vme_alloc_consistent(struct vme_resource *resource, size_t size,
>  {
>  	struct vme_bridge *bridge = find_bridge(resource);
>  
> +	if (!bridge)
> +		return NULL;
> +
>  	if (!bridge->alloc_consistent) {
>  		dev_err(bridge->parent,
>  			"alloc_consistent not supported by bridge %s\n",
> @@ -107,6 +110,9 @@ void vme_free_consistent(struct vme_resource *resource, size_t size,
>  {
>  	struct vme_bridge *bridge = find_bridge(resource);
>  
> +	if (!bridge)
> +		return;
> +
>  	if (!bridge->free_consistent) {
>  		dev_err(bridge->parent,
>  			"free_consistent not supported by bridge %s\n",
> @@ -136,6 +142,9 @@ size_t vme_get_size(struct vme_resource *resource)
>  	dma_addr_t buf_base;
>  	u32 aspace, cycle, dwidth;
>  
> +	if (!bridge)
> +		return 0;

This is an error, why not return a error?

> +
>  	switch (resource->type) {
>  	case VME_MASTER:
>  		retval = vme_master_get(resource, &enabled, &base, &size,
> @@ -332,6 +341,9 @@ int vme_slave_set(struct vme_resource *resource, int enabled,
>  	struct vme_slave_resource *image;
>  	int retval;
>  
> +	if (!bridge)
> +		return 0;

Same here.

Also, can this ever actually happen?  Given that the code seems to work
just fine, if you look at the callers, the function does not seem to
ever be able to return NULL, so be careful of adding checks that are
never actually needed.

thanks,

greg k-h

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503C730FF21;
	Sat, 14 Feb 2026 16:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771086494; cv=none; b=adVVlYb8hKytD7ZLaXh9i8U1ITTnCeaoCngndRuAriSl65QTQICV84Q1oZD8N7qVt/nKGmuKlJ0BxSgMEqf41GiBVqHlwmvGWDu+nYKFWOAT84WFRnWivj4hUdm2bJtzXi1FJkDj8XUPgy/YFf0flljDxuyNtnOpbcFx1ThJwMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771086494; c=relaxed/simple;
	bh=71VmH8tzvjvNaxHgAkEgD5BCNS+zldr8zdQ1ThngY/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iVv2xuF3jX6cLQdeRIpl/c13DAfyhvrk8GJ3WYwc37s39A7bZ1ZBFKsmIz8fDPTmlgzYa9Zg4GTPE9njf9tRI5x8YuDvGulCDA6q3rC1QHeXoolDbNUQiwjYiFwhAR6TKU1CUZkl9EZu7xmHfvV7GIXn8Ju6N+gssAqByCHWUpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=x6BhHLpS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="x6BhHLpS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB6DC16AAE;
	Sat, 14 Feb 2026 16:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771086493;
	bh=71VmH8tzvjvNaxHgAkEgD5BCNS+zldr8zdQ1ThngY/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=x6BhHLpS2q5YpbjyZWOZvzVTcTSbOfNOpDI6oJVLTu8+u2T32UOL/Y3hgDZSoJsv5
	 PDWyoQ1cXiyvFKOlWpXQITMc7B9FAuEXCNDwZNWxBA33GMNvRh4F2EDzNqcsOiXR/Y
	 4f5haoimsVYQjMMxauvDCWE97t5sxswQ3Dur5lm8=
Date: Sat, 14 Feb 2026 17:28:10 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Samyak <samyak.bambole07@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: vme_user: use kmalloc_obj instead of kmalloc
Message-ID: <2026021459-murkiness-impurity-336f@gregkh>
References: <20260214161321.669459-1-samyak.bambole07@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260214161321.669459-1-samyak.bambole07@gmail.com>

On Sat, Feb 14, 2026 at 09:43:21PM +0530, Samyak wrote:
> From: Samyak Bambole <samyak.bambole07@gmail.com>
> 
> Replace kmalloc(sizeof(*ptr), GFP_KERNEL) calls with kmalloc_obj(*ptr,
> GFP_KERNEL)
> 
> This addresses scripts/checkpatch.pl warnings and follows the preffered
> allocation pattern.
> 
> Signed-off-by: Samyak Bambole <samyak.bambole07@gmail.com>
> 
> ---
>  drivers/staging/vme_user/vme.c        | 24 ++++++++++++------------
>  drivers/staging/vme_user/vme_fake.c   |  6 +++---
>  drivers/staging/vme_user/vme_tsi148.c | 14 +++++++-------
>  3 files changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
> index 2095de725..8496c722a 100644
> --- a/drivers/staging/vme_user/vme.c
> +++ b/drivers/staging/vme_user/vme.c
> @@ -287,7 +287,7 @@ struct vme_resource *vme_slave_request(struct vme_dev *vdev, u32 address,
>  	if (!allocated_image)
>  		goto err_image;
>  
> -	resource = kmalloc(sizeof(*resource), GFP_KERNEL);
> +	resource = kmalloc_obj(*resource, GFP_KERNEL);
>  	if (!resource)
>  		goto err_alloc;
>  
> @@ -484,7 +484,7 @@ struct vme_resource *vme_master_request(struct vme_dev *vdev, u32 address,
>  		goto err_image;
>  	}
>  
> -	resource = kmalloc(sizeof(*resource), GFP_KERNEL);
> +	resource = kmalloc_obj(*resource, GFP_KERNEL);
>  	if (!resource)
>  		goto err_alloc;
>  
> @@ -854,7 +854,7 @@ struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 route)
>  	if (!allocated_ctrlr)
>  		goto err_ctrlr;
>  
> -	resource = kmalloc(sizeof(*resource), GFP_KERNEL);
> +	resource = kmalloc_obj(*resource, GFP_KERNEL);
>  	if (!resource)
>  		goto err_alloc;
>  
> @@ -894,7 +894,7 @@ struct vme_dma_list *vme_new_dma_list(struct vme_resource *resource)
>  		return NULL;
>  	}
>  
> -	dma_list = kmalloc(sizeof(*dma_list), GFP_KERNEL);
> +	dma_list = kmalloc_obj(*dma_list, GFP_KERNEL);
>  	if (!dma_list)
>  		return NULL;
>  
> @@ -924,11 +924,11 @@ struct vme_dma_attr *vme_dma_pattern_attribute(u32 pattern, u32 type)
>  	struct vme_dma_attr *attributes;
>  	struct vme_dma_pattern *pattern_attr;
>  
> -	attributes = kmalloc(sizeof(*attributes), GFP_KERNEL);
> +	attributes = kmalloc_obj(*attributes, GFP_KERNEL);
>  	if (!attributes)
>  		goto err_attr;
>  
> -	pattern_attr = kmalloc(sizeof(*pattern_attr), GFP_KERNEL);
> +	pattern_attr = kmalloc_obj(*pattern_attr, GFP_KERNEL);
>  	if (!pattern_attr)
>  		goto err_pat;
>  
> @@ -964,11 +964,11 @@ struct vme_dma_attr *vme_dma_pci_attribute(dma_addr_t address)
>  
>  	/* XXX Run some sanity checks here */
>  
> -	attributes = kmalloc(sizeof(*attributes), GFP_KERNEL);
> +	attributes = kmalloc_obj(*attributes, GFP_KERNEL);
>  	if (!attributes)
>  		goto err_attr;
>  
> -	pci_attr = kmalloc(sizeof(*pci_attr), GFP_KERNEL);
> +	pci_attr = kmalloc_obj(*pci_attr, GFP_KERNEL);
>  	if (!pci_attr)
>  		goto err_pci;
>  
> @@ -1005,11 +1005,11 @@ struct vme_dma_attr *vme_dma_vme_attribute(unsigned long long address,
>  	struct vme_dma_attr *attributes;
>  	struct vme_dma_vme *vme_attr;
>  
> -	attributes = kmalloc(sizeof(*attributes), GFP_KERNEL);
> +	attributes = kmalloc_obj(*attributes, GFP_KERNEL);
>  	if (!attributes)
>  		goto err_attr;
>  
> -	vme_attr = kmalloc(sizeof(*vme_attr), GFP_KERNEL);
> +	vme_attr = kmalloc_obj(*vme_attr, GFP_KERNEL);
>  	if (!vme_attr)
>  		goto err_vme;
>  
> @@ -1233,7 +1233,7 @@ struct vme_error_handler *vme_register_error_handler(struct vme_bridge *bridge,
>  {
>  	struct vme_error_handler *handler;
>  
> -	handler = kmalloc(sizeof(*handler), GFP_ATOMIC);
> +	handler = kmalloc_obj(*handler, GFP_ATOMIC);
>  	if (!handler)
>  		return NULL;
>  
> @@ -1458,7 +1458,7 @@ struct vme_resource *vme_lm_request(struct vme_dev *vdev)
>  	if (!allocated_lm)
>  		goto err_lm;
>  
> -	resource = kmalloc(sizeof(*resource), GFP_KERNEL);
> +	resource = kmalloc_obj(*resource, GFP_KERNEL);
>  	if (!resource)
>  		goto err_alloc;
>  
> diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
> index 731fbba17..0fc5fe7f8 100644
> --- a/drivers/staging/vme_user/vme_fake.c
> +++ b/drivers/staging/vme_user/vme_fake.c
> @@ -1102,7 +1102,7 @@ static int __init fake_init(void)
>  	/* Add master windows to list */
>  	INIT_LIST_HEAD(&fake_bridge->master_resources);
>  	for (i = 0; i < FAKE_MAX_MASTER; i++) {
> -		master_image = kmalloc(sizeof(*master_image), GFP_KERNEL);
> +		master_image = kmalloc_obj(*master_image, GFP_KERNEL);
>  		if (!master_image) {
>  			retval = -ENOMEM;
>  			goto err_master;
> @@ -1128,7 +1128,7 @@ static int __init fake_init(void)
>  	/* Add slave windows to list */
>  	INIT_LIST_HEAD(&fake_bridge->slave_resources);
>  	for (i = 0; i < FAKE_MAX_SLAVE; i++) {
> -		slave_image = kmalloc(sizeof(*slave_image), GFP_KERNEL);
> +		slave_image = kmalloc_obj(*slave_image, GFP_KERNEL);
>  		if (!slave_image) {
>  			retval = -ENOMEM;
>  			goto err_slave;
> @@ -1150,7 +1150,7 @@ static int __init fake_init(void)
>  
>  	/* Add location monitor to list */
>  	INIT_LIST_HEAD(&fake_bridge->lm_resources);
> -	lm = kmalloc(sizeof(*lm), GFP_KERNEL);
> +	lm = kmalloc_obj(*lm, GFP_KERNEL);
>  	if (!lm) {
>  		retval = -ENOMEM;
>  		goto err_lm;
> diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
> index 733594dde..62b16be15 100644
> --- a/drivers/staging/vme_user/vme_tsi148.c
> +++ b/drivers/staging/vme_user/vme_tsi148.c
> @@ -1611,7 +1611,7 @@ static int tsi148_dma_list_add(struct vme_dma_list *list, struct vme_dma_attr *s
>  	tsi148_bridge = list->parent->parent;
>  
>  	/* Descriptor must be aligned on 64-bit boundaries */
> -	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
> +	entry = kmalloc_obj(*entry, GFP_KERNEL);
>  	if (!entry) {
>  		retval = -ENOMEM;
>  		goto err_mem;
> @@ -2333,8 +2333,8 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  		master_num--;
>  
>  		tsi148_device->flush_image =
> -			kmalloc(sizeof(*tsi148_device->flush_image),
> -				GFP_KERNEL);
> +			kmalloc_obj(*tsi148_device->flush_image,
> +				    GFP_KERNEL);
>  		if (!tsi148_device->flush_image) {
>  			retval = -ENOMEM;
>  			goto err_master;
> @@ -2350,7 +2350,7 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  
>  	/* Add master windows to list */
>  	for (i = 0; i < master_num; i++) {
> -		master_image = kmalloc(sizeof(*master_image), GFP_KERNEL);
> +		master_image = kmalloc_obj(*master_image, GFP_KERNEL);
>  		if (!master_image) {
>  			retval = -ENOMEM;
>  			goto err_master;
> @@ -2376,7 +2376,7 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  
>  	/* Add slave windows to list */
>  	for (i = 0; i < TSI148_MAX_SLAVE; i++) {
> -		slave_image = kmalloc(sizeof(*slave_image), GFP_KERNEL);
> +		slave_image = kmalloc_obj(*slave_image, GFP_KERNEL);
>  		if (!slave_image) {
>  			retval = -ENOMEM;
>  			goto err_slave;
> @@ -2397,7 +2397,7 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  
>  	/* Add dma engines to list */
>  	for (i = 0; i < TSI148_MAX_DMA; i++) {
> -		dma_ctrlr = kmalloc(sizeof(*dma_ctrlr), GFP_KERNEL);
> +		dma_ctrlr = kmalloc_obj(*dma_ctrlr, GFP_KERNEL);
>  		if (!dma_ctrlr) {
>  			retval = -ENOMEM;
>  			goto err_dma;
> @@ -2417,7 +2417,7 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	}
>  
>  	/* Add location monitor to list */
> -	lm = kmalloc(sizeof(*lm), GFP_KERNEL);
> +	lm = kmalloc_obj(*lm, GFP_KERNEL);
>  	if (!lm) {
>  		retval = -ENOMEM;
>  		goto err_lm;
> -- 
> 2.53.0
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

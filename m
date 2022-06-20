Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265C87F6
	for <linux-staging@lists.linux.dev>; Mon, 20 Jun 2022 10:26:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39B6FC3411B;
	Mon, 20 Jun 2022 10:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1655720816;
	bh=prCd0hruC00HknZ99+NKnyfp0ohBvyccw/iGZdVf9I8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RUSIJCIeSvKsOxT2OJhAgHrXUmHpRgIXT7zDhrpTVEBo7F1WSwmTVma0IFiu9sMbX
	 X9g8ekD/RRp+6LjjJ6vxPMq03lySLTBa4+8Z/LkR6o+1QV20HAuCHkd5tQo1OXwYDR
	 arSy0TkKFTDNpz/2c1TRJLhNez7bILVYzComVjJk=
Date: Mon, 20 Jun 2022 12:26:53 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-efi@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH] media: atomisp_gmin_platform: stop abusing efivar API
Message-ID: <YrBLbb7jYNFautj7@kroah.com>
References: <20220620100819.1682995-1-ardb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620100819.1682995-1-ardb@kernel.org>

On Mon, Jun 20, 2022 at 12:08:19PM +0200, Ard Biesheuvel wrote:
> As the code comment already suggests, using the efivar API in this way
> is not how it is intended, and so let's switch to the right one, which
> is simply to call efi.get_variable() directly after checking whether or
> not the GetVariable() runtime service is supported.
> 
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
> 
> If I can please get an ack, I'd like to take this via the EFI tree for
> the next cycle.
> 
>  drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 27 +++++---------------
>  1 file changed, 6 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> index 7e47db82de07..bf527b366ab3 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> @@ -1284,7 +1284,7 @@ static int gmin_get_config_var(struct device *maindev,
>  	const struct dmi_system_id *id;
>  	struct device *dev = maindev;
>  	char var8[CFG_VAR_NAME_MAX];
> -	struct efivar_entry *ev;
> +	efi_status_t status;
>  	int i, ret;
>  
>  	/* For sensors, try first to use the _DSM table */
> @@ -1326,24 +1326,11 @@ static int gmin_get_config_var(struct device *maindev,
>  	for (i = 0; i < sizeof(var8) && var8[i]; i++)
>  		var16[i] = var8[i];
>  
> -	/* Not sure this API usage is kosher; efivar_entry_get()'s
> -	 * implementation simply uses VariableName and VendorGuid from
> -	 * the struct and ignores the rest, but it seems like there
> -	 * ought to be an "official" efivar_entry registered
> -	 * somewhere?
> -	 */
> -	ev = kzalloc(sizeof(*ev), GFP_KERNEL);
> -	if (!ev)
> -		return -ENOMEM;
> -	memcpy(&ev->var.VariableName, var16, sizeof(var16));
> -	ev->var.VendorGuid = GMIN_CFG_VAR_EFI_GUID;
> -	ev->var.DataSize = *out_len;
> -
> -	ret = efivar_entry_get(ev, &ev->var.Attributes,
> -			       &ev->var.DataSize, ev->var.Data);
> -	if (ret == 0) {
> -		memcpy(out, ev->var.Data, ev->var.DataSize);
> -		*out_len = ev->var.DataSize;
> +	status = EFI_UNSUPPORTED;
> +	if (efi_rt_services_supported(EFI_RT_SUPPORTED_GET_VARIABLE))
> +		status = efi.get_variable(var16, &GMIN_CFG_VAR_EFI_GUID, NULL,
> +					  (unsigned long *)out_len, out);
> +	if (status == EFI_SUCCESS) {
>  		dev_info(maindev, "found EFI entry for '%s'\n", var8);
>  	} else if (is_gmin) {
>  		dev_info(maindev, "Failed to find EFI gmin variable %s\n", var8);
> @@ -1351,8 +1338,6 @@ static int gmin_get_config_var(struct device *maindev,
>  		dev_info(maindev, "Failed to find EFI variable %s\n", var8);
>  	}
>  
> -	kfree(ev);
> -
>  	return ret;
>  }
>  
> -- 
> 2.35.1
> 
> 

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

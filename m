Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF5712D771;
	Thu,  7 Mar 2024 14:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709821281; cv=none; b=m/vnpQYDyFVCKb6RJstJusShA0FLsoRicmnrJF6FQlsLpg8IzHIKODU+eokPt4vmvpxOVtIa5X3BSZeboX/WiPgsbZXosg4rRaLfVbicI32mNdxjKUzX2DDF5Hv2n9Hi48FKc+nDnmXDuAVMw5KOngwiPF4qiVd+oqZ8KoRddJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709821281; c=relaxed/simple;
	bh=LqaL4c9EjIqGdATt6Jg0007WJpGZJ/4PVJy5NIll6p4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C7VQUVJKNpbKxLfsvrMjml3N4sCuLoEfo4D/jLTXESPEZVjiqGvoMsq0dzSaakGWUFWlKjaqzBhddglSTRMicKNG5CFKBKAz56I3fVTLLKW0WzVHS+BiHMtK//tqwH//2C/AiPY3jV2bp/GjC3T4Q8upfqRaneh5z3URGLxBWrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=S9qjNAc3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="S9qjNAc3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD34CC433F1;
	Thu,  7 Mar 2024 14:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709821281;
	bh=LqaL4c9EjIqGdATt6Jg0007WJpGZJ/4PVJy5NIll6p4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S9qjNAc3mdYm2vgI+O94FBW8hG8CA/pr1hQD4fbL3qV1yV62EzS68tKIBtYf0FpQz
	 qidfDr3ABTJYcdUVrvONrw5ZzJpQWhNoo3t5pd0E7TtD84eCWCqNFa+JjPsRrhBr1C
	 RBXDL06/zEzb562sGkARMtygKXG9nEEE8+WHKi4k=
Date: Thu, 7 Mar 2024 14:21:18 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Dorine Tipo <dorine.a.tipo@gmail.com>
Cc: linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH v3 1/8] Staging: sm750fb: Rename sii164ResetChip
Message-ID: <2024030727-observing-flavoring-7aa2@gregkh>
References: <20240306054458.102288-1-dorine.a.tipo@gmail.com>
 <20240306054458.102288-2-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306054458.102288-2-dorine.a.tipo@gmail.com>

On Wed, Mar 06, 2024 at 05:44:51AM +0000, Dorine Tipo wrote:
> Rename variable sii164ResetChip to sii164_reset_chip to silence
> checkpatch warning Avoid CamelCase
> 
> Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
> ---
> V2: Added the patch to a series.
>     Fixed errors within the patch.
>     Compiled the kernel
> 
> V3: Reverted a commit in the same patch series
> 
>  drivers/staging/sm750fb/ddk750_dvi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
> index 3fb14eff2de1..6dee95e60a6e 100644
> --- a/drivers/staging/sm750fb/ddk750_dvi.c
> +++ b/drivers/staging/sm750fb/ddk750_dvi.c
> @@ -18,7 +18,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
>  		.get_vendor_id = sii164_get_vendor_id,
>  		.get_device_id = sii164_get_device_id,
>  #ifdef SII164_FULL_FUNCTIONS
> -		.reset_chip = sii164ResetChip,
> +		.reset_chip = sii164_reset_chip,
>  		.get_chip_string = sii164GetChipString,
>  		.set_power = sii164SetPower,
>  		.enable_hot_plug_detection = sii164EnableHotPlugDetection,

You did not compile with this change applied, did you?

If so, can you show us the steps you did?  There still is a function
called sii164ResetChip() in the tree after you apply this commit, and
there is no function called sii164_reset_chip(), right?

confused,

greg k-h

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A2B3451CC;
	Sun,  8 Feb 2026 06:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770532516; cv=none; b=BQba36/DZUC03bRiPjZDnMGGL2bsOqxej+jc8qyrgdQPlLAgXSZKFl6jv5Gq+/xBytdx9GHepVWCyvsrbs/ZRsPA5ufQRjTxR6rH0u7ZxGzBHJeRJqG/FGW61YljhB/xVh3XiQhmQZxiqTYzW9xbXLu03B1tzJnlqlFWFBGGSQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770532516; c=relaxed/simple;
	bh=MeUe4zwO3toJae1/szQR4t1oeZ8c9TEOB2ItDVVu4Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3VSJEtIBiKbcFdQeCFVzGQVbxRLzvLufZfp0uT1mowBU7KmMSM2F8gRfoLQAqVhWFiQWx73FZV0KI5waIPsluNgTaPvwtZ8b/X05mZ6dUcdxfPNtlrMCcc4HgOpNATa7ROZaN2v6VfaNi0sFa9Kc1cmxJkTBO4WPLv7bvo5I6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PCooF/H0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PCooF/H0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C173FC4CEF7;
	Sun,  8 Feb 2026 06:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770532516;
	bh=MeUe4zwO3toJae1/szQR4t1oeZ8c9TEOB2ItDVVu4Ls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PCooF/H0R+fTiZouq9VP6giUe4CDhwIVOTMe4flZ4uvJu6VvpijVR0+R6fAUoJQ5D
	 Sd2yz+tcP/3Ui2/p3KstYm4EGKMC6PeX1D6W64dkoK7Cn88QuT+xpWitTOojaqeMyq
	 6GN8e5stf7ni/NvzgvqCcGWmQ2Cjni8d12/YVKLI=
Date: Sun, 8 Feb 2026 07:35:12 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Artem Lytkin <iprintercanon@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: reorder NULL check after kzalloc in
 fake_crcsr_init
Message-ID: <2026020835-flakily-grasp-9f39@gregkh>
References: <20260207215502.1961-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260207215502.1961-1-iprintercanon@gmail.com>

On Sat, Feb 07, 2026 at 09:55:02PM +0000, Artem Lytkin wrote:
> Move the NULL check for bridge->crcsr_kernel before its use in
> fake_ptr_to_pci(). While fake_ptr_to_pci() is a simple cast that
> handles NULL safely, using a value before validating it is a bad
> pattern that static analyzers flag and could become a real issue
> if fake_ptr_to_pci() changes in the future.
> 
> Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
> ---
>  drivers/staging/vme_user/vme_fake.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
> index 731fbba17..506bc5439 100644
> --- a/drivers/staging/vme_user/vme_fake.c
> +++ b/drivers/staging/vme_user/vme_fake.c
> @@ -1029,9 +1029,9 @@ static int fake_crcsr_init(struct vme_bridge *fake_bridge)
>  
>  	/* Allocate mem for CR/CSR image */
>  	bridge->crcsr_kernel = kzalloc(VME_CRCSR_BUF_SIZE, GFP_KERNEL);
> -	bridge->crcsr_bus = fake_ptr_to_pci(bridge->crcsr_kernel);
>  	if (!bridge->crcsr_kernel)
>  		return -ENOMEM;
> +	bridge->crcsr_bus = fake_ptr_to_pci(bridge->crcsr_kernel);

As this isn't actually a bugfix, and if an automated tool can't handle
something as simple as this it's really broken, I think we should just
leave this alone for now.

thanks,

greg k-h

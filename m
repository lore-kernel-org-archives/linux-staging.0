Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE503CE48B;
	Wed, 18 Mar 2026 11:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773833966; cv=none; b=ehogCL78TMffeDuv51inVb3FityUJOUXS7c22C2foXvrWuJFxDGQnIqDS6HX9hvRUOcynFm4jU2P9BzmyQMD9R0dtMATlc3Orju3jwEr/fARTQ1imWrVpdOTEBvoo2ElXG0HkHiFXOk05l5HDlYVLCk2lLlcdk6nNMm4MZdzxFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773833966; c=relaxed/simple;
	bh=WlDTHlaRN+Esqw/tv4AESjX7LAh48c13vDhUkCNdK+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PdFf1SSl9O1Od+Vj2B160P3UMSx1ZJx7rkL1N94vWzyhFdMWyEtIgK3FbO+JqfDGXsiQtFTeePAHGqxNMuhs+x4E2871B4kMtgfWH0GxeZx08lgzI8hE9yzb5NCnwNB4jMEA5A10+3ugAW5F7mQRoLlmX78yFU7/2OF0zeTt/C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=I8IFt07F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="I8IFt07F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E09FC19421;
	Wed, 18 Mar 2026 11:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773833965;
	bh=WlDTHlaRN+Esqw/tv4AESjX7LAh48c13vDhUkCNdK+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I8IFt07FNn7YnFQVALzpY5cYiyFmC1wqkX0nn5aljDniBeTNizq6VXKjbHxEH+8Ek
	 +kZSL+Hdi459hIkIX4hDW3gD0iAnV4hpExG/6xQcnW86GXOFYpZ1n4hXDo4HGMcN7T
	 IuYM4fbuiv5xiBCZyjeoiWWoq1xnyXWA3hz1OWRg=
Date: Wed, 18 Mar 2026 12:37:38 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Aadarsh Mandal <aadarshmandal9354@gmail.com>
Cc: luka.gejak@linux.dev, dan.carpenter@linaro.org,
	ethantidmore06@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, straube.linux@gmail.com
Subject: Re: [PATCH v3] staging: rtl8723bs: remove dead code
Message-ID: <2026031858-verbose-gents-fefc@gregkh>
References: <20260318092639.27055-1-aadarshmandal9354@gmail.com>
 <20260318104332.32093-1-aadarshmandal9354@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318104332.32093-1-aadarshmandal9354@gmail.com>

On Wed, Mar 18, 2026 at 04:13:31PM +0530, Aadarsh Mandal wrote:
> remove unused and commented code 
> no changes in functionality
> 
> Signed-off-by: Aadarsh Mandal <aadarshmandal9354@gmail.com>
> ---
> v3:
>  - regenrated patch from the clean tree
>  - removed unwanted addition
> v2:
>  - accidently added the functions in the {} blocks
> v1:
>  - some commented code wasnt deleted.
> Note:
> * This patch is part of the GSoC2026 application process for device tree bindings conversions
> * https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings
> 
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c | 21 ++++++--------------
>  1 file changed, 6 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> index 063a0737933e..8fbb46b3019d 100644
> --- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> +++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> @@ -68,8 +68,8 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
>  	rtw_write16(padapter, REG_APS_FSMCO, value16);
>  
>  	/*  Enable CMD53 R/W Operation */
> -	rtw_write8(padapter, REG_CR, 0x00);
>  
> +	rtw_write8(padapter, REG_CR, 0x00);

This does not follow what you documented in the changelog :(

What tool told you to make this change?

thanks,

greg k-h

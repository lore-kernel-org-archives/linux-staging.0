Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476A53D7D72;
	Mon,  4 May 2026 14:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906648; cv=none; b=HtkRVRvkNMd6LPQMOT+ndf139JNrMSyojW4sdsTI+uun7GdI4qRE9Tx8NuvzkcAXx298NGcUFOeMUegJGfxwvijnaY5Jv6u8J4Gx80w48Dru/d1xqSxXiPtiAiqQFqVm/9uFdJ4SgSKYGzMeGZYzUeaw2s/xXGsrW0+0+/gARtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906648; c=relaxed/simple;
	bh=B8cAgquW3uG3MMpdn8Ul4ICSotHEExqPaZ4Gx362jIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IfE/4KPyVSLK2wYEe+48833lrlxd72VwEAkSYKBNetkTEjztmfwEASlgwenWBKWSbKUwaPUiLPwWe8nTsrwdjx/f4ZZLL2zLYjwHg+mMQEwARufMEtW04ghM2cHH2Sn2IwzW/nF1nJaplOLpVmQKOTMMUSxZ2FOyDcwwfpJ7yI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zO8URg4k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zO8URg4k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B75C2BCC4;
	Mon,  4 May 2026 14:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777906647;
	bh=B8cAgquW3uG3MMpdn8Ul4ICSotHEExqPaZ4Gx362jIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zO8URg4kL/4VsGrm7cABWlTXPwdqwVVRk3jraRpOoD9igBkWBMOungqzil16o+jTc
	 vRKjv9LgZRs4AFqcpi55R2fkcKLGWctZ57RxsL5e/LdP85VBfINkULQ7JsZtoCeUgv
	 LjSHsM502LnXaPDCDXMzQKCNZIKN7sc6iVyuALlQ=
Date: Mon, 4 May 2026 16:50:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Francisco Maestre <francisco@maestretorreblanca.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: remove unnecessary braces in
 sdio_intf.c
Message-ID: <2026050405-outfit-jogger-b5f6@gregkh>
References: <20260503005754.69012-1-francisco@maestretorreblanca.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503005754.69012-1-francisco@maestretorreblanca.com>

On Sat, May 02, 2026 at 07:57:54PM -0500, Francisco Maestre wrote:
> Remove braces around a single-statement block in the SDIO
> disconnect path, as per kernel coding style guidelines.
> 
> This fixes the following checkpatch.pl warning:
>   WARNING: braces {} are not necessary for single statement blocks
> 
> Signed-off-by: Francisco Maestre <francisco@maestretorreblanca.com>
> ---
> v2: Resend as individual patch, not part of an unrelated series.
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> index d664e254912c..a86252ccac76 100644
> --- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> +++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> @@ -146,9 +146,8 @@ static void sdio_deinit(struct dvobj_priv *dvobj)
>  		sdio_claim_host(func);
>  		sdio_disable_func(func);
>  
> -		if (dvobj->irq_alloc) {
> +		if (dvobj->irq_alloc)
>  			sdio_release_irq(func);
> -		}
>  
>  		sdio_release_host(func);
>  	}
> -- 
> 2.50.1 (Apple Git-155)
> 
> 

Does not apply to my tree :(

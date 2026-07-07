Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DB93F4DC1;
	Tue,  7 Jul 2026 10:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783421988; cv=none; b=HLyrzK41vjsMnxgvIirj8UpScWl2I52RzefABEK0gDY8XRbX2AqyxrbOZCuqmFD8lEHAnQsfpj4cRp0GLc89X6L/FfR3HbmKs7Hh5Bl8EjVYchVjp99fpldWxrF5/C/ErSHrYjmo9fu7PX3KRNWlVl8cpIO5y+4hdf6+qdHzgGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783421988; c=relaxed/simple;
	bh=elncxxniBxS0IUn5/3WMTZbwp+U+LG2HknkxiuMoZig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dyxymE4OU4maKRdo7fdTyXH3JHfBDqG99nQTyoJP6s115552m4BLmDDk6DE07WdKEByzYggovOai4Kqgb4kXzILwGGYfInkezFbIm+XSs8FgR5R3aYWM7G3oeKVctveUXupGb51jG6gO7fa6fbBmvKNercuzPc3Hc+211FkdzSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=u8cQOlVo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="u8cQOlVo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE361F000E9;
	Tue,  7 Jul 2026 10:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783421985;
	bh=dKTXuOyhIMUmxhbp17C/MTP03QGysfP23F4oRfcLy48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=u8cQOlVoviNgVvNcSpte3xobZ/Gz/3V7FmvwaEdqNl6WyLri9dz14M0wZmndOoo7e
	 qihkgnwU7QbHrYAWOqlEOL5iG30jmKEa7aCRbFSkXfNYBx0uqyBMndV//5uupg8KXY
	 OPrmWUUAoi4dvmGvGOD44LUKdLS2V5ARkkDpx8tY=
Date: Tue, 7 Jul 2026 12:59:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vitaliy Slivinskiy <phant0m.mail2023@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org
Subject: Re: [PATCH v3 1/3] staging: rtl8723bs: remove unnecessary braces and
 comments
Message-ID: <2026070708-flirt-chirpy-46f8@gregkh>
References: <20260531165849.283264-1-phant0m.mail2023@gmail.com>
 <20260531165849.283264-2-phant0m.mail2023@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260531165849.283264-2-phant0m.mail2023@gmail.com>

On Sun, May 31, 2026 at 07:58:47PM +0300, Vitaliy Slivinskiy wrote:
> Fix checkpatch.pl warning about unnecessary braces for single statement blocks. Also clean up the sentinel entry in the sdio_ids array as suggested by reviewers.

This needs to be properly line-wrapped.

> 
> Signed-off-by: Vitaliy Slivinskiy <phant0m.mail2023@gmail.com>
> ---
> Changes in v3:
> - Split changes into multiple patches.
> - Fixed sentinel entry formatting.
> 
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> index c43a0391a5ca..f0aa5bc8a38b 100644
> --- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> +++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> @@ -20,7 +20,7 @@ static const struct sdio_device_id sdio_ids[] = {
>  	{ SDIO_DEVICE(0x024c, 0x0626), },
>  	{ SDIO_DEVICE(0x024c, 0x0627), },
>  	{ SDIO_DEVICE(0x024c, 0xb723), },
> -	{ /* end: all zeroes */				},
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(sdio, sdio_ids);
>  
> -- 
> 2.53.0

The description doesn't match what you did here :(

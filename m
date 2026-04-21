Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82A73D668C
	for <linux-staging@lists.linux.dev>; Tue, 21 Apr 2026 14:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776781122; cv=none; b=PicX3MelOaPVvRdMxRaT6/bQ+bRpOQnv/s0URarkDJUfZg0A8aeBHXHRTh2VjFzWfHKLr0/gQfjFEaR3a8s/UqBIR/R2tXgmc9lXy0Il9GXZK+qRYAvR8t0c6PFp+rqWC8agxRoggtmSF+ttyVOE4W0Z8ll+F7hTSDGFGwSgLIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776781122; c=relaxed/simple;
	bh=OBBLcD2yyhozn1tx9+55YFWlXW38GG11TYymnSZ7WnQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=aIUGCdZhv0lcUO/T77dhRDnHnbPwMY72X9EYPO6QNi6vQaKr2ngmTVLihI9WpIAXn6csJGo7NUZdaZyUNUiL4Bo5M4LY/XSVS4hwRG97wjzd8232KFTwq8fI8QIX7aSXWQV0NtqCbxGPYiwB0ytpz7ZPnRWuxiR7QXezqrUxMPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OUpOFu0Y; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OUpOFu0Y"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776781118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C9ZyLibQRVjp7Cub/jYi0zAyyyLBU3CAhZgAovsLuqI=;
	b=OUpOFu0YUWmLtGaVw3gukCNOhhn/WqERgea9gmsunIykurT6iGKDWUGGI1W7yaAtFXsX1J
	iB4Tv1jwWyF+7yFSeh/N5gaYenDHbEj4qyRUjB7kdnM+0ZNX7Bp3v4owoZW3dwzbaHadNb
	4SyvlFoInp+FIE0BVNf64RNeXTEy86M=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Apr 2026 16:18:36 +0200
Message-Id: <DHYWC8LQK5MY.31KCOCDFVW1Q9@linux.dev>
Subject: Re: [PATCH] staging: rtl8723bs: os_dep: remove unnecessary braces
 for single statement
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Shyam Sunder Reddy Padira" <shyamsunderreddypadira@gmail.com>,
 <gregkh@linuxfoundation.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
References: <20260418171904.16479-1-shyamsunderreddypadira@gmail.com>
In-Reply-To: <20260418171904.16479-1-shyamsunderreddypadira@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Sat Apr 18, 2026 at 7:19 PM CEST, Shyam Sunder Reddy Padira wrote:
> Remove redundant braces around single statement blocks to follow
> kernel coding style and improve readability.
>
> Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.co=
m>
> ---
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/stagi=
ng/rtl8723bs/os_dep/sdio_intf.c
> index d664e254912c..a86252ccac76 100644
> --- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> +++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> @@ -146,9 +146,8 @@ static void sdio_deinit(struct dvobj_priv *dvobj)
>  		sdio_claim_host(func);
>  		sdio_disable_func(func);
> =20
> -		if (dvobj->irq_alloc) {
> +		if (dvobj->irq_alloc)
>  			sdio_release_irq(func);
> -		}
> =20
>  		sdio_release_host(func);
>  	}

LGTM.

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak

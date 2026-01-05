Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB9B30E83B
	for <linux-staging@lists.linux.dev>; Mon,  5 Jan 2026 09:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767605363; cv=none; b=WysFsjy1CxMoKt1bvaWTdfEDFoVnc27POgNl0yOdpGAgHYzEzQIJEchHgcQ18PRft1CQWgx/LFgeHkw5vT77JZ5WF8QaXbxLBbMIwbeV71+fTBU6Dp9S+l/HMEUIqVdfvpotTLznELH2HTfDluWOEyyaYJ6q+PXCK5XHXe5l9AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767605363; c=relaxed/simple;
	bh=kulg8XpQJj0RJsRzeEiMoGn3kCVl+Azl9DkbzbDNaSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJBNcghzZuDTHpsjfYn/A4p3YOV00hyh8CVK/YKecZXr3DD639xjLJpbjffXTbaofNQcJp1w1xArWy4DqWZNH8mxIlVLLfkpEyer2CUgNAUB2O9gRIiDcnE4whQ+Ah0H/ouDbpjXyMAWQRiKoBpF6kN3ZsARvhFz4eCbSxYcSfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tnIULlhd; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tnIULlhd"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4308d81fdf6so6572628f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 05 Jan 2026 01:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767605353; x=1768210153; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3FOjzDY/r2U/Kq/8+NQu0xSKjWhumQpilnNpvJw2ez0=;
        b=tnIULlhdIBcTDOOfGrwWBqonGEhiBCT5X8LqtZhnvzztFlBDgz72zNy/YF68y3aaHI
         uXNpetQNi0YoOfzsYuqjN1eopgkIDxIDoaPGknaQ7eNfHI5YhKoNYIsi8cf0NBlLycfU
         35oFE+fsmQMvLEUFNry4H2c1braVk3RiXkJkP0807IjSFUb4w5vH298gi/pdSyQCU+FJ
         pBJGzDsdw6+WU0TRcilx54KoFUOalwqH5eBFBxYhrQsIvGD0InDqD3M/vRkcqc007SkB
         cP/Rn7bBdAyNtZqEWiYmw+uby+J88nc6rb4sxtWCqG/g6HiipxL9pyZXYkMY34qFSuIi
         bgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767605353; x=1768210153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3FOjzDY/r2U/Kq/8+NQu0xSKjWhumQpilnNpvJw2ez0=;
        b=dXQdjj795zTSd6lbHWkcib8FcexXoj1KQ2LNn5CiZJtIBkFkjonSeiKd4V1ycwxkXU
         MY/PG6InCFbBpea879pXa6yvRSxxD96BiKq2Voyr1uXtewTxvY7puctYAXdQqp65noqv
         NevN0mOvGczyp6m7pSp84dLYWRJigZEKbxAcbOj0fO+KBvsngviyeisFKcsIUzqkK3Q3
         naL1VqxkRZSX5IFpFgp9oOPxYXNiEq4Br0mozCJ3sPgJpeALF3khDVashH9aSFQ6Trqs
         JcFivoUe9uGxE1+cppEL58pqLm8/+WrSzGW9HeNEhd1p/RF5BQp8JzTLRDpChrVa4kFL
         gTVA==
X-Forwarded-Encrypted: i=1; AJvYcCXHUi6+QLgjfhGeUU5agKFlTC2pugBaHXpPbRs8In4/3RjkwZY/yuOui5TBZTkTeaoEumCGkPh+KvxEJ37S@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8u0HT+WHJGslKyzeCbmRwLamztlHIhBOAj/91a3wOgnewTUK5
	LCoYFpRC9Vz1jOBotwilwfkYA/Z/UaAM9CnGfuL1sF9aSJDLSrep9ZK5FeFXOE/TYxw=
X-Gm-Gg: AY/fxX7dviNeDs5Y/5Q3CrYeMoF4no9JJEHRmaBIXMWHBEpLweRV+SkzHp1Vn9/QOCA
	eNcqZoTZ4cqnSvxkv4Hhk9Hej6bLtVf/c27D/GlZxLEphQL2deSnKbnYCCtPQ2hceKTKi6NEYTt
	saIUl656ZfnweXbdk3nJX+dgNyMOGacHuggUzamuLvrDcxg220aqSa/9siHB0gwXplZDUKeATEY
	8EejczWJ4NckaxZtyoMVRstYAsOXZvayuWyUOiy1IaX/ELr/Tl2bIxgfnn/Csx1B43eg3/CMmNQ
	SVB0mkYNTKpKQGxfo1DxPsi0eKp6K5ro1+mHEtqSINfooIF1cyC8RTp5AOYpnAPkDcsTXlz3vC7
	QXlv1ZCDM7PcBtFcnDkJI6zDbCofc62ZuGgLuueVZ6r63L1RTX50TNTJBNAXT9vf5V55cD9NewI
	RFUi6XAhTHhuE/6Sl/ogYygXeTLNc=
X-Google-Smtp-Source: AGHT+IGLRjvHkbD51sq0sAkqKxpj1rcyV+vQVTA74eAF94lRvk/+SSjX418hZaRMI0oM7tM6XrvOng==
X-Received: by 2002:a05:6000:24c4:b0:430:fc3a:fbce with SMTP id ffacd0b85a97d-4324e4c9d45mr74505993f8f.15.1767605352648;
        Mon, 05 Jan 2026 01:29:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa46c0sm99932867f8f.34.2026.01.05.01.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:29:12 -0800 (PST)
Date: Mon, 5 Jan 2026 12:29:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Khaled Saleh <khaled.saleh.req@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org
Subject: Re: [PATCH] staging: greybus: split gb_audio_gb_get_topology() into
 helper functions
Message-ID: <aVuEZQ11i0gS_t7q@stanley.mountain>
References: <20251221194200.3734-1-khaled.saleh.req@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251221194200.3734-1-khaled.saleh.req@gmail.com>

On Sun, Dec 21, 2025 at 09:42:00PM +0200, Khaled Saleh wrote:
> From: khaled <khaled.saleh.req@gmail.com>

Full name, please.

> 
> The gb_audio_gb_get_topology() function performs multiple distinct
> operations: retrieving the topology size, allocating the topology buffer,
> and fetching the topology data. A TODO comment in the file notes that
> this logic should be split into separate calls.
> 
> Introduce helper functions for each step and update
> gb_audio_gb_get_topology() to use them.
> 
> This improves readability and maintainability without changing behavior.
> 
> Signed-off-by: Khaled Saleh <khaled.saleh.req@gmail.com>
> ---
>  drivers/staging/greybus/audio_gb.c | 47 +++++++++++++++++++++++-------
>  1 file changed, 36 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
> index 9d8994fdb41a..0d5109ec14f6 100644
> --- a/drivers/staging/greybus/audio_gb.c
> +++ b/drivers/staging/greybus/audio_gb.c
> @@ -9,36 +9,61 @@
>  #include "audio_codec.h"
>  
>  /* TODO: Split into separate calls */
> +static int gb_audio_topology_get_size(struct gb_connection *connection, u16 *size)

Use size_t for sizes.

> +{
> +	struct gb_audio_get_topology_size_response resp;
> +	int ret;
> +
> +	ret = gb_operation_sync(connection,
> +				GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
> +				NULL, 0,
> +				&resp, sizeof(resp));
> +	if (ret)
> +		return ret;
> +
> +	*size = le16_to_cpu(resp.size);
> +
> +	return 0;
> +}
> +
> +static struct gb_audio_topology *gb_audio_topology_alloc(u16 size)

Same.

> +{
> +	if (size < sizeof(struct gb_audio_topology))
> +		return NULL;
> +
> +	return kzalloc(size, GFP_KERNEL);
> +}
> +
> +static int gb_audio_topology_fetch(struct gb_connection *connection,
> +				   struct gb_audio_topology *topo, u16 size)

Same.

It's fine for now since there is just one caller, but using anything
other that size_t for sizes is just asking for integer overflow bugs.

regards,
dan carpenter



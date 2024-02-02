Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29E417BC4
	for <linux-staging@lists.linux.dev>; Fri,  2 Feb 2024 07:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706858479; cv=none; b=OL17VmLVzTWBgxgavx56BVnXFb/z9JQn0w9J3eLDzqqRUFHKNYHg3Qgtfuq3AADiQvjvBMP5O9Og9Jan3Sl5u9WJKv8hmpc6WsiCPndh8sCW19/AWYVXuXVzL5q5f8kIEGMpuLzSmXPlEC2QJHs9wodZQgAGWTPDnX3O0XQVNlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706858479; c=relaxed/simple;
	bh=lpTM8i3qAGSiY4E67knpu4ci12EK/1WfR/fXKv773eM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MyyePNnFp8j1xvG3PyYp5kgueIjU8lGiSlew8XRL9HRtL5cmEg+FJDz1xaJJ7BJA/NlFl3wJMJ8BzO8dFI6HwLvA6Z6FDcjVGuLUJKN/9QU75TFtktxCjlovyLcR2pjDB76fVTw4sDuc4LeE4gS9aRSOg3oXF1lE7SDzNzCSfMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eY6QBvaI; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eY6QBvaI"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a370328e8b8so41401466b.3
        for <linux-staging@lists.linux.dev>; Thu, 01 Feb 2024 23:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706858476; x=1707463276; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rynCR7DUuWYPX0uSmJQ3t5lmPk1yuAmXaxIJOHoQI7E=;
        b=eY6QBvaImcpnwVLfayAPof5LuSpFktUk1s6rYdLJ7I1g6RU0UPs/LXDvGMDOUqUDyx
         K66/dcOq4Wtp/i1xERVud0WddshibEbPDzPzuU6qKqsHVuac0WAiBdylgcROFK+i+Enn
         rWicO3+sxi+Tig0tUjExJYuf5TLa894eB0KcvCJQpfkjlmHsd4WIwHTndwuCqYux5hzD
         vSjw/IuQa2Io+JTSJ8t+F5/Bu7dPuZcfqav0ItqlNFTTKnex6wQgYw9ipFJq2iUUcsC5
         mnUN5T4eEBr3XWRvlKU5x9kGp7bI+497/wTyyF9sYoxr1yEtrjSdDP+oPDVu+145XRqF
         jywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706858476; x=1707463276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rynCR7DUuWYPX0uSmJQ3t5lmPk1yuAmXaxIJOHoQI7E=;
        b=B89duN9FGf7B09aOBoXkTVNC1PSp/T66RKq6kS65rE9V+kIT/tXMorv5ZFz9wjCDZO
         Wa76YDQ4zQ6yPVl6Fgo0Ruzax7ZyYxAutJUnxn3Rmym07Rkj1KnTa2yh/xRC/rK2X6ju
         bijKfzSN6oGCJNwl8Fgcgby092aN35YkXxrTpSRDVTmVSjn9yhlKJjzuT1bLM/+jyBNj
         oh7mM7CTxfhU0/bHpGwd3Q7lj21S/SJKjN8WDbxDDJjCZ0gUD1vPiMDsQljdct3AJ7DK
         0k3EMNCNcYJ59dixA82fuHq0Ixibx6dHGebpvs++Hg157Nbm1CHGW0Z9SwCIJ0dlnQ48
         qSwA==
X-Gm-Message-State: AOJu0Yx03iw6cSKQgwDVE+inlaiDreD7MUAgRxGnH9UJrzSHhm/hlJyu
	74gD4sy98PSjTnL4lSsbMODLdVrZ2aqiCVuCsGFnOTUg1/8uCeJeIGMh/Pc+UsI=
X-Google-Smtp-Source: AGHT+IHyFuUb47frdawTnmd/JjYOHapvFHmXI/c0K9LOuiYQvjT6KjLwQDkDiJ5b/D3nZiVjarwlJA==
X-Received: by 2002:a17:906:304e:b0:a30:4189:4e10 with SMTP id d14-20020a170906304e00b00a3041894e10mr786033ejd.53.1706858475842;
        Thu, 01 Feb 2024 23:21:15 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV7YI6mqnDVH0uFCEJYm+8NVVZE/Nt68934vPNYx8qXgR5csU5taYye9/7ohZBqK8bkwv/fwawi/urQuvGLGFSrs3JWDyUDCxAoK41JGw3j6qmFCPnzSVaINsHsGoGIjpX+VuSDMI2sFJRhrD5fo5FQLA66O6PdL5XQllsK6gPC86qxRc1zzTxuOXfM6J70RPVOmHPEEmDmVg8bPVQkowIZ5C54FYPsrQmCjrCoihKezjIXQwh1thzPtcOyGWMf6uopIEd0eEba+UTpBw==
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id un1-20020a170907cb8100b00a35de0619dbsm567619ejc.200.2024.02.01.23.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 23:21:15 -0800 (PST)
Date: Fri, 2 Feb 2024 10:21:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Meir Elisha <meir6264@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ruan Jinjie <ruanjinjie@huawei.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] Staging: rtl8723bs: Remove extra spaces
Message-ID: <78dc8263-b866-4d44-9f02-194c8a79fccb@moroto.mountain>
References: <20240201140459.438479-1-meir6264@Gmail.com>
 <20240201140459.438479-3-meir6264@Gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201140459.438479-3-meir6264@Gmail.com>

On Thu, Feb 01, 2024 at 04:04:57PM +0200, Meir Elisha wrote:
> Fix checkpatch warning: please, no space before tabs
> 
> Signed-off-by: Meir Elisha <meir6264@Gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 63 ++++++++++-------------
>  1 file changed, 26 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index 5568215b35bd..44b77c1ba992 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -169,7 +169,6 @@ void _rtw_free_network(struct	mlme_priv *pmlmepriv, struct wlan_network *pnetwor
>  {
>  	unsigned int delta_time;
>  	u32 lifetime = SCANQUEUE_LIFETIME;
> -/* 	_irqL irqL; */
>  	struct __queue *free_queue = &(pmlmepriv->free_bss_pool);
>  
>  	if (!pnetwork)

Please the "delete dead code" stuff into a separate patch.  It's a
little bit easier to review when patches are split up like that.

regards,
dan carpenter


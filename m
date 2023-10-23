Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B7F1171C
	for <linux-staging@lists.linux.dev>; Mon, 23 Oct 2023 14:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qbaiJGX5"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2c5210a1515so51083441fa.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Oct 2023 07:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698071568; x=1698676368; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4zLfZKHxVydtU/EGWqXKarc7iejpbu5G0JHAWOhD6zo=;
        b=qbaiJGX50/uNCBUN1JC5v3s0q/SftmIVtb11yVSJJpl5sm76+EIav+RxKJ9//KC6/V
         4EDalBGeCSDPH7SJ0jNXR5wd7FMwdsHYmAvd24Hh+ixJVMOK2h6Kr5+pWMtKvsFXo9bw
         kGXCs8IKSXx/eoAD8kYpPMhdAAx9driHIZSotecJfelAT01mkkuJetjj2GHlVCAz6TlF
         IBtl1CYJPKSvMaGsUniqv/4U9zbb4rveMgwbAfGbdG5EEGR/VRi2kgeQh5/ZT0omDiP4
         wEvzNPyua7MrhaRLa1/tnl8ql7rEdidlctFWVjwJqXIaX/7ctXJ9jCrajc5Fv/0uvlUZ
         Y7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698071568; x=1698676368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zLfZKHxVydtU/EGWqXKarc7iejpbu5G0JHAWOhD6zo=;
        b=pAoLpwBLrPJU7qrqeuvcsVOIfV2o0ESfBEP03Bmw5Luq/9JyCOfjR0GO2+1hML3i3g
         e0r9eqTpLdi5tgmgc/wQI3197CTFdREjS5cc72JYWKHTq2laNLJw7Vn5lsZyCy/89/Bl
         SVFdElhINOYQPU3bcd01f9HKwaGa4VLmLqrTJWdc1cwwDxR4BYLeoV2NI3fJkYbUHhU1
         PP49B/QKG2R9mUZ5WyDAhopi5RAJV4B5GJlItBNivn4zjQRbXjoba8Khk70b/+Jv8kbA
         fVKShfA75rJTFCI9aq2grrieS0eVgMtjz3Pdj0id5+I6581GMQu9GnaT9zRdh7cEHAye
         I18Q==
X-Gm-Message-State: AOJu0YwSX1PZkaJJkW2VnsATTiAklShaE3wnwUmxdpuKN5/OWvAQdN4l
	+oaeN1JYihZi9Dbm8xTCT3xa6w==
X-Google-Smtp-Source: AGHT+IHWAvcn3DtHE1zZNxaFAmobec0SjV+b2xWBbgNDrpNvHCcScjtF3CCZpq1XsfYEUllNhe1Dyg==
X-Received: by 2002:a2e:a7c7:0:b0:2c5:1867:b0bd with SMTP id x7-20020a2ea7c7000000b002c51867b0bdmr6020677ljp.23.1698071568320;
        Mon, 23 Oct 2023 07:32:48 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r5-20020a056000014500b0032db4825495sm7854704wrx.22.2023.10.23.07.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 07:32:47 -0700 (PDT)
Date: Mon, 23 Oct 2023 17:32:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jonathan Bergh <bergh.jonathan@gmail.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org, error27@gmail.com,
	linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] staging: media: av7110: Fix various formating issues
Message-ID: <052d566b-574a-439c-8113-b894406a4407@kadam.mountain>
References: <20231020232332.55024-1-bergh.jonathan@gmail.com>
 <20231020232332.55024-6-bergh.jonathan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020232332.55024-6-bergh.jonathan@gmail.com>

On Sat, Oct 21, 2023 at 01:23:32AM +0200, Jonathan Bergh wrote:
>  drivers/staging/media/av7110/av7110_av.c | 29 +++++++++++++-----------
>  1 file changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
> index 82d4c02ae3ef..bdef95244121 100644
> --- a/drivers/staging/media/av7110/av7110_av.c
> +++ b/drivers/staging/media/av7110/av7110_av.c
> @@ -241,8 +241,8 @@ int av7110_pes_play(void *dest, struct dvb_ringbuffer *buf, int dlen)
>  		sync |= DVB_RINGBUFFER_PEEK(buf, 2) << 8;
>  		sync |= DVB_RINGBUFFER_PEEK(buf, 3);
>  
> -		if (((sync &~0x0f) == 0x000001e0) ||
> -		    ((sync &~0x1f) == 0x000001c0) ||
> +		if (((sync & ~0x0f) == 0x000001e0) ||
> +		    ((sync & ~0x1f) == 0x000001c0) ||

You introduced this yourself earlier.  Which is good.  But better to
not create the issue in the first place.

regards,
dan carpenter


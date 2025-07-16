Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A4519D06B
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 14:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752677916; cv=none; b=C4Fsa50n3chXax8RIxDQI6+gIgWRhO/MBPrdvqr+owBnRf1YsDXquHFE69qs623oFRtX676eKiSVG9m/KMIxJ3Su+mrBfhblvIsiuGBf6C2yScmFusNVmFEwXQ4ubAjXUot1EAX7bJZ6ghVRWCQVtDEbxf2kXtafh2oOZeO4zEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752677916; c=relaxed/simple;
	bh=MOX5FLSTuz4gUJyElIjKVpCmGAf/+/SwzprErmNYXao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KVbvKQ8orV0rA9/6/rDcb37XPCNX5fWqCMqHkvd7rhUUJhNM22DgtBkjSgnymtOdC1sx5gq7EY5XW/fY7tHptczjLqez97gXeHFByFtid3lk89MXxSbLfC3ys0CrZ/BLU59nKVGy8nyhYxlOOW5HNhtLI1Iy+2aLtEr5Si6YbjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LZdBVSD/; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LZdBVSD/"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2f78ef10832so3537fac.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 07:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752677914; x=1753282714; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3m45BGM+l7hWNTfPbsljo+iULDrTlSlvRi9+iUw9IvA=;
        b=LZdBVSD/7M8DKPnRBvnpY8mDGh0/vDQkL5bgvBKpyjMCFoUNx7w9FGk0q6XYXOKoiw
         gHrDIXBQ9iKsMcilOKHDx5k1Me5+/IgF3j7BDWyclW7lFbYfPCT64BkXF8A52QoNVaC/
         lGJjWnfwPntp9+VPeJhif/uAazQZmQ2r5VJPxDxfGIruzLZYrPpAjz2zLCpREEGI54Ky
         hpBfKE0fg/qInJOkWTwNscbE/jFDWD6sb28+q2fPfJN5Tuzr5+1C53Mfph7teMxe89I2
         EPwj2mZ/ZkGD4eT+vZxg4ESQpT55UG16mgXedjpwRsQBC380Js1KFoIQOlimXL8n6ZTN
         nthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752677914; x=1753282714;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3m45BGM+l7hWNTfPbsljo+iULDrTlSlvRi9+iUw9IvA=;
        b=qfJXkGE7AynMmgqyS83bidoNhZx41RBxId0qcy1nCrebVYRJsP8S5YGYHnWrXZUCx3
         Hfvsb4aax7U+6s0RUU725pSBucJOIEUsC+GJpk31iG0eceDqEdpEo9bHI+p5jNlXPV3o
         6nboCjBO0r0Y5QtGgdu4fFyuK3twyXenK+1smwNiOBzY7VNKDquY9euk71KaRBbtxhvr
         TMPQN4x7DdJ4C6A5vJ4ne95Lu4CEs4EYSWevT9UeXg908MkI0ewiBV4Vpcns/sUHNCt2
         QNAX9nRkeQOF1cFRqUsLM74TjXko7eO7pkDS9Z+U98urouhomOefegvefnd+yes4KL9m
         wLxw==
X-Forwarded-Encrypted: i=1; AJvYcCXYV8wq8hboPfqRnp8lHPhs/iSIzIB6sQxsfuqdUGRxkg2y7m0WpiPkM8PhzmTvoZYb06N3f3GiiW0cHTzt@lists.linux.dev
X-Gm-Message-State: AOJu0YzTDxaaGVyxFL2LblihxKGCIDIJNFYwyW9k+/oX17kXbfADd8Ot
	eLHqCNRhMM5qwA0vloUh2R75lXZygo7yeSV9suyTanw5Hbc8HfUKTsCbWJQ/8MnfElw=
X-Gm-Gg: ASbGncukE2lMlmjhA9JWgJxV01054VqCd/R507i0/3WYCaiMMQaN79v+VunpAEQUraf
	dEGx9GEVsEmfmCJ398jbNPx01GIuXjazOEwEhXwk+VwRdTbx0d/hTfWsOKFhpuVVXS0pU1OoYj4
	CX4Qu9W5lGRqEXKNentkZFMjxxCleu/R8dXVHkaDzSrIPZ0stdUVc8V0DX1Uk4LsIKsXpbxxsyp
	iBJlXNlMjVw8mSkglRxkanDNMBWk6bx/JjFRspgCPfvGa/RN4LzVIWSQyY+t/sHqM5xrg85km9a
	RM7EFwCb7r4cKacM57ZNL1be/yB/dlyNTc1IM/MK+xYeJdHXi++FclHRWya6wG8CBAkx7NXX/nZ
	K7UUrHdgNoocNTUe13lODZtu9+P3H
X-Google-Smtp-Source: AGHT+IGPDRDGTGWtsm0enNOZoTDYjmJ1+WpJCzBBYWbatrsQi58k48BUuUzP7TVR+vTSQiuuXI/ZQg==
X-Received: by 2002:a05:6871:7244:b0:2ff:9224:b1c8 with SMTP id 586e51a60fabf-2ffaf5a4bc4mr2923399fac.36.1752677913663;
        Wed, 16 Jul 2025 07:58:33 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:2564:68a3:7d6:cb7d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff111c36a0sm3509364fac.2.2025.07.16.07.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 07:58:33 -0700 (PDT)
Date: Wed, 16 Jul 2025 17:58:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ignacio =?iso-8859-1?Q?Pe=F1a?= <ignacio.pena87@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 3/4] staging: rtl8723bs: fix block comment alignment in
 rtl8723b_cmd
Message-ID: <6591cf13-7f1b-4079-939b-5277a046e990@suswa.mountain>
References: <20250716113808.73115-1-ignacio.pena87@gmail.com>
 <20250716113808.73115-3-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250716113808.73115-3-ignacio.pena87@gmail.com>

On Wed, Jul 16, 2025 at 07:38:07AM -0400, Ignacio Peña wrote:
> From: Ignacio Pena <ignacio.pena87@gmail.com>
> 
> Fix block comment formatting to align the * on each line properly
> according to kernel coding style.
> 
> Signed-off-by: Ignacio Pena <ignacio.pena87@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> index def456abc..789abc123 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> @@ -34,13 +34,13 @@ static u8 _is_fw_read_cmd_down(struct adapter *padapter, u8 msgbox_num)
>  
>  
>  /*****************************************
> -* H2C Msg format :
> -*| 31 - 8		|7-5	| 4 - 0	|
> -*| h2c_msg	|Class	|CMD_ID |
> -*| 31-0						|
> -*| Ext msg					|
> -*
> -******************************************/
> + * H2C Msg format :
> + * | 31 - 8		|7-5	| 4 - 0	|
> + * | h2c_msg	|Class	|CMD_ID |
> + * | 31-0						|
> + * | Ext msg					|
> + *
> + ******************************************/
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is not the correct comment format.

regards,
dan carpenter


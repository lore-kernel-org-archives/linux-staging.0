Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97042EAEA
	for <linux-staging@lists.linux.dev>; Tue, 17 Oct 2023 19:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20230601.gappssmtp.com header.i=@ragnatech-se.20230601.gappssmtp.com header.b="fLw3XB1N"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5041bb9ce51so7367212e87.1
        for <linux-staging@lists.linux.dev>; Tue, 17 Oct 2023 12:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1697570209; x=1698175009; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eSiJ+SgnN8DTqfMtIC3KGjxwzeSBjvuis9ayU/E7k5Q=;
        b=fLw3XB1NrXr/eSndZ37YgF2G2yyFa/mubu9P1O9zTNYkawgVSSSjbICTKJAY2FuaIT
         Qm+QtuwIDksQfM5eH7cLLPUSw1RhRN8OLTHr080uzNYx+qKICl36MKgxaEYEnJ4kRcwU
         AxSlNKuUXY3F4bs6bnuZfwGPm9e6Jxkn24zNdLWDuJhRBs8wYgC5SBiUQzxZ1spLEO8/
         H32eBH+Rdfc2NC82RYOKR04baIAONhlLEPzJCCxfWTn4aA6hAJl+42GNeiJ7/k/IB3cJ
         uwrPIJ33lKXGjAgoh1OAqeqpBJAomNpIIRqaqovmxqS6CpDMF8tHbKIBPALPHsS5dbTU
         23ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697570209; x=1698175009;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eSiJ+SgnN8DTqfMtIC3KGjxwzeSBjvuis9ayU/E7k5Q=;
        b=GW9T65D3OMi0w5TmwhTpLTN+N1e9Ybj5t0MpgQiOjCinHllQeBwfpHKF64DQbZhObQ
         ucSExZJhdSUeGfQEWUdYG3fztCxAgjwEAkUWBSnEM0eowBVR8/On+3jEN2royj/sUr81
         NiwnpZZICrBC6Pc2kNIdKRrKj5O08McK2j5iWQ3sNfRXZeCxz7W8Vi4AugX70w3JhkgN
         oDj7n3+bz579CKWbJZxws3FKTq/WSDln78jW0YhTEaBXTJRec6TtbPbBmqCHBff6KyzW
         3dsp1eEuxZnWEY1D7u5HmG3CrWd/IP8u8aSpGtH4y89mRS24hwD17fHEkAfFpEtu24sA
         zsIw==
X-Gm-Message-State: AOJu0Yx+m4UuE4VQs3SjN1h2AHCJUawGciS/DYGN0Dq09YQ4gZKaHnoW
	h5DjyMwIFuJq95mN0gQLMTAE8w==
X-Google-Smtp-Source: AGHT+IG2cO3Bsb5IUnEpZlFyKPEwG5sdEK4KsPtXu1MxCxw/7byNBiQ69TVDDbf0IJsQgD7CQ79rOQ==
X-Received: by 2002:ac2:47f2:0:b0:507:a6b2:3996 with SMTP id b18-20020ac247f2000000b00507a6b23996mr2099211lfp.56.1697570209407;
        Tue, 17 Oct 2023 12:16:49 -0700 (PDT)
Received: from localhost (h-46-59-36-206.A463.priv.bahnhof.se. [46.59.36.206])
        by smtp.gmail.com with ESMTPSA id c13-20020a056512324d00b004fe333128c0sm389408lfr.242.2023.10.17.12.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 12:16:49 -0700 (PDT)
Date: Tue, 17 Oct 2023 21:16:48 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: ihor.matushchak@foobox.net
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging: max96712: Fix device name in description
Message-ID: <ZS7doO43ijXhBqkm@oden.dyn.berto.se>
References: <ZS0wxi7SUhJcVh5Y@oden.dyn.berto.se>
 <942346374212972ef938ecac7c892558a48bfe75.1697568186.git.ihor.matushchak@foobox.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <942346374212972ef938ecac7c892558a48bfe75.1697568186.git.ihor.matushchak@foobox.net>

Hi Ihor,

Thanks for your work.

On 2023-10-17 19:46:54 +0100, ihor.matushchak@foobox.net wrote:
> From: Ihor Matushchak <ihor.matushchak@foobox.net>
> 
> Fix the device model name in driver description,
> which appears to be a copy-paste error

Super-nit: You are still missing a trailing dot here.

> 
> Signed-off-by: Ihor Matushchak <ihor.matushchak@foobox.net>

Reviewed-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>

> ---
>  drivers/staging/media/max96712/max96712.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> index c44145284aa1..ea67bcf69c9d 100644
> --- a/drivers/staging/media/max96712/max96712.c
> +++ b/drivers/staging/media/max96712/max96712.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Maxim MAX9286 Quad GMSL2 Deserializer Driver
> + * Maxim MAX96712 Quad GMSL2 Deserializer Driver
>   *
>   * Copyright (C) 2021 Renesas Electronics Corporation
>   * Copyright (C) 2021 Niklas Söderlund
> -- 
> 2.30.2
> 

-- 
Kind Regards,
Niklas Söderlund

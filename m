Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FE2374FE
	for <linux-staging@lists.linux.dev>; Tue,  9 Jan 2024 12:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bRKTm38h"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40e490c2115so10203545e9.0
        for <linux-staging@lists.linux.dev>; Tue, 09 Jan 2024 04:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704802943; x=1705407743; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s+mFmDvLzl1W8S/o/HBXWXg1x6nCRXGw45+KcA5RU+I=;
        b=bRKTm38h2m+NEWhXdkvgDqQTEApM7XnYMobenm3LL2IT3rOA5HAueVOUBTgtajBlku
         PYvnU2bogFj7bhNLsAdMDuBl3Rm+ZmheDnuSES1en5iUuchhoCS0Ypht8S3+SYi37sqU
         bK0/6KCPQsElDeeHRVBNkI5nzFe9HCBUSfPHP88Tf2yXpeV86dgx9xCPeCQRGZGlExdC
         +1GeT3OLpsMoQvfLkEM83h8VOpFJKhA2cClULNLy72JSxH1anbIYvgggNRG5UgKzaAGn
         0QP9Mr1akL8cc9/5Iub6Z7MFLs2o4v4RM4Lxrh30PqKQPKGIy4wnG9aGZMqRaYx7UbC6
         otnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704802943; x=1705407743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+mFmDvLzl1W8S/o/HBXWXg1x6nCRXGw45+KcA5RU+I=;
        b=qUDoqbjSv3JzAO3hmF9lO0hPnQFzDaQhULGaeYzhmvXEWfVtrKAcl8q4ru5nYWDPcJ
         ISmZpQZYlgQDBA/gGMPvM737iiYkZ0PLyeaFozkG0OZtVK2uQr0y3VzTVEtizkKsFIUm
         rCFMcLOD8O2GPaaDYGDf3jQaMxGP7oraxFRvuhFpA10MV86lff1jVSbAhXb10zhvdoar
         rxs9WsxiM0VsyUQFtWNWfsEwNdLjYx5Rdqimn7FicgefEg4VKjG2Rq9vcuivFYknyf2v
         cmQ9XJgaQCIHdA/5o3hU/fVWTIdHb0v5fjbeNj8xvfFThLgc5lWOyPRvwQf3OgWaabah
         mO/Q==
X-Gm-Message-State: AOJu0YwYoFAyThOGdaCou4ZxKst0vCzKrr+RFxAAozvHdigIW9aERhbG
	vA9TnndQvaZMShVECmH2cDkJioXGNvJ1ow==
X-Google-Smtp-Source: AGHT+IG4OFzVoMmxpgZZz+Is/bVT/V4t71XFSOPqm7Bop/mY179ODSjKjt3PlGxUcSwO9dnR7hzsnw==
X-Received: by 2002:a7b:ce0f:0:b0:40e:4bce:f952 with SMTP id m15-20020a7bce0f000000b0040e4bcef952mr371445wmc.95.1704802943561;
        Tue, 09 Jan 2024 04:22:23 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id e1-20020a056000120100b00333404e9935sm2275101wrx.54.2024.01.09.04.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 04:22:23 -0800 (PST)
Date: Tue, 9 Jan 2024 15:22:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: SilverPlate3 <arielsilver77@gmail.com>
Cc: forest@alittletooquiet.net, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: vt6655: Fix sparse warning. Restricted cast.
Message-ID: <d6489a61-3985-4fc2-9eda-333ea8fa02ae@moroto.mountain>
References: <20240109072704.44582-1-arielsilver77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240109072704.44582-1-arielsilver77@gmail.com>

On Tue, Jan 09, 2024 at 09:27:04AM +0200, SilverPlate3 wrote:
> Running 'make M=drivers/staging/vt6655 C=2'
> causes sparse to generate few warnings.
> This patch fixes the following warnings by ensuring le64_to_cpu
> handles only __le64 values, thus dismissing chances of bad endianness.
> * drivers/staging/vt6655/card.c:302:45: warning: cast to restricted __le64
> * drivers/staging/vt6655/card.c:336:23: warning: cast to restricted __le64
> * drivers/staging/vt6655/card.c:804:23: warning: cast to restricted __le64
> * drivers/staging/vt6655/card.c:831:18: warning: cast to restricted __le64
> 
> Signed-off-by: Ariel Silver <arielsilver77@gmail.com>
> ---
>  drivers/staging/vt6655/card.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
> index 350ab8f3778a..5dc2200466b7 100644
> --- a/drivers/staging/vt6655/card.c
> +++ b/drivers/staging/vt6655/card.c
> @@ -292,6 +292,7 @@ bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
>  {
>  	u64 local_tsf;
>  	u64 qwTSFOffset = 0;
> +	__le64 le_qwTSFOffset = 0;
>  
>  	local_tsf = vt6655_get_current_tsf(priv);
>  
> @@ -299,7 +300,8 @@ bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
>  		qwTSFOffset = CARDqGetTSFOffset(rx_rate, qwBSSTimestamp,
>  						local_tsf);
>  		/* adjust TSF, HW's TSF add TSF Offset reg */
> -		qwTSFOffset =  le64_to_cpu(qwTSFOffset);
> +		le_qwTSFOffset = cpu_to_le64(qwTSFOffset);
> +		qwTSFOffset = le64_to_cpu(le_qwTSFOffset);


This isn't right at all.  You've just to convert it and then convert it
back.  (In other words do nothing but in a very complicated way).

This isn't a bug, it's just an issue of annotations.  The code is
re-using a single variable to hold both cpu and little endian data.  So
the way to write the annotations is to create two variables, one that's
cpu endian and one that's little endian.

regards,
dan carpenter


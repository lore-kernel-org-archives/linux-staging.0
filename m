Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD56033E7
	for <linux-staging@lists.linux.dev>; Mon, 23 Oct 2023 14:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lXQHKe0+"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4084e49a5e5so28864895e9.3
        for <linux-staging@lists.linux.dev>; Mon, 23 Oct 2023 07:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698071227; x=1698676027; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EwAfBCzyEL9M9CAS9M5go7qNbD/H8dJ1LrQUAE2nRV4=;
        b=lXQHKe0+oCnJZcRYwOCSP/VMZHATjQ7YXna5fihkmWaPU16vC7z70SBVRSr0WrNkY/
         j+yLED/+gc1HkT2RUvKp+kMKneo9qvLwG+j94Cwr/ArJnfqImX7XEMp7OIT5RuKp22rG
         BuOeUrNxzxFZgaOT+6Hn7QXUho+0JCkvxLbce8C1gB09emgrO40Lf/LuC3Lnm4iajTGJ
         yQJh+MJ6CNvER3oDRjwuhDAqHruE20kshDoMLdJ3K69G5sNHn9rr3X6JL4NPu1ey3t4D
         hTXhnpbmKvZ7Wh7T6VDqsa7b7Ds+jxugYaPYaANRGUlzkb1LGcmB5cCv4wvtOJgg9voP
         2ang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698071227; x=1698676027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwAfBCzyEL9M9CAS9M5go7qNbD/H8dJ1LrQUAE2nRV4=;
        b=QY5mkDBmsT9zH+HnunltRfVNXwDMTr4zlCYGSEaaoyrBDbe424isLUGPCwn9PiLsDA
         DXDJ9TIDgeCDuAfA/GZ4arkUt9OFNaY5OLYN1PBYNJ3VaFkrqSmIyTAE8xQCoXBjmeAk
         41Ce8nxZBTMVUAakh/DwHGAVcxzhTRIv4w0SLSuDMLfWcobJDjmmAsjUsjODuBLgCT7R
         e55CxbJxLtT7C3mrx5iF+aThXbHIdL1gabDmm4X6ghV8UAT6WPN9aTefisZivj2i4IBi
         QZOAJUmGn1m0B235LujRoR4Olj3T4QxmczGDQNGU01MC3ZT94TLLmXPHPqcld9HHMR94
         Yrag==
X-Gm-Message-State: AOJu0YyNVt5iuvjKd4VD0TxVnv5nqrCY1mDqMIqMP3I2j9hlNFit9dUd
	bDefIyofyXbckYHjjtEDutBETg==
X-Google-Smtp-Source: AGHT+IGsPviJvYb+Qa0YPg1rlRYHeafkFn9M5YrEypyA+svUk2pOnU8f56Un06MUp/IZG22EqE/hTw==
X-Received: by 2002:a05:600c:5115:b0:403:cc64:2dbf with SMTP id o21-20020a05600c511500b00403cc642dbfmr8051547wms.27.1698071227028;
        Mon, 23 Oct 2023 07:27:07 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c499100b0040772138bb7sm14226886wmp.2.2023.10.23.07.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 07:27:06 -0700 (PDT)
Date: Mon, 23 Oct 2023 17:27:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jonathan Bergh <bergh.jonathan@gmail.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org, error27@gmail.com,
	linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] staging: media: av7110: Remove unnecessary
 whitespace before quoted newlines
Message-ID: <68f20f25-d612-473d-8dcf-a5dfc1ae6279@kadam.mountain>
References: <20231020232332.55024-1-bergh.jonathan@gmail.com>
 <20231020232332.55024-4-bergh.jonathan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020232332.55024-4-bergh.jonathan@gmail.com>

On Sat, Oct 21, 2023 at 01:23:30AM +0200, Jonathan Bergh wrote:
> Fixed multiple instances where whitespaces were placed before quoted
> newlines
> 
> Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
> ---
>  drivers/staging/media/av7110/av7110_av.c | 40 ++++++++++++------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
> index 482dfc548b16..880fa8a314ba 100644
> --- a/drivers/staging/media/av7110/av7110_av.c
> +++ b/drivers/staging/media/av7110/av7110_av.c
> @@ -150,7 +150,7 @@ int av7110_av_start_play(struct av7110 *av7110, int av)
>  {
>  	int ret = 0;
>  
> -	dprintk(2, "av7110:%p, \n", av7110);
> +	dprintk(2, "av7110:%p,\n", av7110);

Just delete all these printks.  They are useless.

regards,
dan carpenter


Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CC9EC2
	for <linux-staging@lists.linux.dev>; Wed,  6 Sep 2023 08:52:54 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-31ae6bf91a9so2773139f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 06 Sep 2023 01:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693990373; x=1694595173; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BfJ6EiGtQip0OGudrI4BPeU8/IOFG65Mt4ZCTg7kHPM=;
        b=jk6X1YG9fhMDk3Wfk1G4RgMiGTVxa9RVD51QkOI8SSfuQKd3bqoJL6KNaFM1mVIbdR
         URZXOVFgW8/4wTxTfEKvx/izOQKPPdohJqmujZwYDOVfrYfXVIDyIi9+6HcdYOaRToOZ
         iyw+aGC3dzP87rQR4zAvB3VAwSjY9nULsZcWJEl3FpOfFKgjz0xiUOf9nBKkGko/zNBV
         vtA/NCR33rCQ0OYHp/iusZKLpNvNV4qA02E7uPRIhoRAP1tnfvlfzQnY6mSW/2z0c9rT
         D9oT8SlVNDmSRCD8rvTBQYKlmflZai+xH7hwqjcmdgqkNnOHAcBBrTTiqXg64tZ30jQ5
         bD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693990373; x=1694595173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfJ6EiGtQip0OGudrI4BPeU8/IOFG65Mt4ZCTg7kHPM=;
        b=bysgBHvGh+AGMZXSmnWLkTsOJIziLnXlcGikg+NKzKwMfuIxDXxGb/euT+VHJD1HGX
         3Sck3yfOKEt6L+v7asyy7C+ZYn6C5X5qyXMPw+tMHk4UI9rgsLiS/7xgTA2lI/Cq79c2
         gpM6HjNVav+oTnFOD0hsdPGobB4yS7jcQDDPaA97w7Ez9YnZ0osMQB0HITM+9AEfLVim
         zoMN7MEvrQNCIBD/rKTdKGaDZSPrjE0W+KmyefkFyts0QLIYiTNR2Wb9KRPhGs7Bc18m
         2O5+jNKBc8ukbApJclv2dwNarGHF3MJnXTxyZytpTWrOWemcsdzVjNHTEyLfpbxN1xad
         +fwg==
X-Gm-Message-State: AOJu0YwVr7Sv+3TGYatWR0BcJbLr/4sbjcqwUyHesGcRFu2dz3DB9URo
	kOHEVVo1CcqXq+N0Sssmx+Yu2w==
X-Google-Smtp-Source: AGHT+IH9dK1R9hCLbXHFqEQjm71wqlFg//hfLFlBI0i2Te1UllPFWp2LBixdSShTbZzRa/EQOXWoPw==
X-Received: by 2002:adf:f24a:0:b0:315:8f4f:81b8 with SMTP id b10-20020adff24a000000b003158f4f81b8mr1786330wrp.50.1693990372951;
        Wed, 06 Sep 2023 01:52:52 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v2-20020adff682000000b0031c5dda3aedsm19831973wrp.95.2023.09.06.01.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 01:52:52 -0700 (PDT)
Date: Wed, 6 Sep 2023 11:52:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jonathan Bergh <bergh.jonathan@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: vme_user: Fix block comments where '*' on
 each line should be aligned
Message-ID: <775380d1-add8-4f1e-a9df-85b8ec0b9043@kadam.mountain>
References: <20230905194632.19174-1-bergh.jonathan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905194632.19174-1-bergh.jonathan@gmail.com>

On Tue, Sep 05, 2023 at 09:46:32PM +0200, Jonathan Bergh wrote:
> Fixed checkpatch warnings where lines with '*' in block comments should
> be aligned and were not as well as incorrect tab spacings at the start of
> comment lines.
> 
> Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
> ---
>  drivers/staging/vme_user/vme_tsi148.h | 140 +++++++++++++-------------
>  1 file changed, 70 insertions(+), 70 deletions(-)
> 
> diff --git a/drivers/staging/vme_user/vme_tsi148.h b/drivers/staging/vme_user/vme_tsi148.h
> index dbdf5dabaf90..9748b7897527 100644
> --- a/drivers/staging/vme_user/vme_tsi148.h
> +++ b/drivers/staging/vme_user/vme_tsi148.h
> @@ -251,28 +251,28 @@ static const int TSI148_LCSR_VIACK[8] = { 0, TSI148_LCSR_VIACK1,
>   */
>  #define TSI148_LCSR_VMEFL	0x250
>  
> -	/*
> -	 * VME exception.
> -	 * offset  260
> +/*
> + * VME exception.
> + * offset  260

Your patch doesn't introduce this but it should be hex 0x260 instead of
decimal 260.  Same for all the other comments.

>   */
>  #define TSI148_LCSR_VEAU	0x260
>  #define TSI148_LCSR_VEAL	0x264
>  #define TSI148_LCSR_VEAT	0x268

regards,
dan carpenter

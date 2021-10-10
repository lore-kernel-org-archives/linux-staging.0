Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37002C80
	for <linux-staging@lists.linux.dev>; Sun, 10 Oct 2021 10:50:44 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id a25so39334091edx.8
        for <linux-staging@lists.linux.dev>; Sun, 10 Oct 2021 03:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GxinhD93p6jNHOzdHJBzaHDpg/GHkcxp7GHbNqNh6Q0=;
        b=Z+a6KTs/ZZdxBuVVyTdIhZzfPDmygpA/GnzcQsp51rMOCrVcapFqMB0TIIWX8q1m8A
         TzZuUjNG1USa1mz+tgzVsxxnFC97Br4QEHMz1Sx0wCp2jEPQjDDICBghCQ1AkXL8Y9Va
         3AhodvROWR/6K+Zj7D20ekWoSSxz2uOI7kADdkNac30ESq1sFiJ4BFWPTY4qf91GsGIl
         Q/BDqUGk/WJf6+uZQhUBA7f06fftD5Vds7V5DLuWHJbLrBCc7M1InAvjdog17dNYVNvt
         vT1gMEd3KdMnUDtOhxHaPTFw76ncsKdWWp3ygrQtpPO8gOcwNvfE/zV5IBh/RmPrZv7L
         veiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GxinhD93p6jNHOzdHJBzaHDpg/GHkcxp7GHbNqNh6Q0=;
        b=rNMcfnkV0ZwE5CSUX2DrFd5MIatF9J+uCvRgezxe1u8NbArtxcGisqEwOI1amg8pdu
         tfa2F45Ym5tu/WV/PQIrvPL4Ismex1VQ2XLG0CocAqJXRtzyaHUUUnS1IwAw0drQLJz2
         QblDeSRf6oXvFgkThSC/K4pAD6ER3Wx3jvP/+Z7uQwLi2GQRshj3maE6VkLXDoHuMa3A
         XyM0bejCnUkCw6DrQitvwfHdBGxGb41/s4VPpSCP3NQd38qLmqn3ht4r5UAw2PkU9+u6
         LNspL78eOLoAVOiNEx5WmZGQk7BeVDv98Y4nkyh2EVkaI24fISRWK37OoWWZQ5B2oUw1
         lSdw==
X-Gm-Message-State: AOAM533GL7m7uxNhLYXmrjCVql4LvW9wbnib4RJwD0BKVDFO43bKYj0P
	W2wiRHC8EaKjqdGTgfM58to=
X-Google-Smtp-Source: ABdhPJwoB0bgCTw9dPFXXbRD19l6fylhoQ2SB4fiQMXGCmCZKn74h61kA1FsFv2wEEZ3r1NTQGXQiQ==
X-Received: by 2002:a05:6402:270e:: with SMTP id y14mr15251616edd.190.1633863043350;
        Sun, 10 Oct 2021 03:50:43 -0700 (PDT)
Received: from agape.jhs ([5.171.72.142])
        by smtp.gmail.com with ESMTPSA id k15sm635596eje.37.2021.10.10.03.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 03:50:42 -0700 (PDT)
Date: Sun, 10 Oct 2021 12:50:39 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Saurav Girepunje <saurav.girepunje@gmail.com>
Cc: gregkh@linuxfoundation.org, marcocesati@gmail.com,
	dan.carpenter@oracle.com, lee.jones@linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	saurav.girepunje@hotmail.com
Subject: Re: [PATCH] staging: rtl8723bs: hal: remove if condition which is
 always false
Message-ID: <YWLFf1zPvK9gz+7+@agape.jhs>
References: <YWKXKGuA/Io9sEjf@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YWKXKGuA/Io9sEjf@user>

Hello Surav,

thanks for your patch, see a comment below,

On Sun, Oct 10, 2021 at 01:02:56PM +0530, Saurav Girepunje wrote:
> Remove the if condition which is always false. The last update on
> variable max_rf_path is value 1. It's value is not changing after that.
> So if condition check for value 2 will be always false only.
> 
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c b/drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c
> index 392cc8a398f5..612575ba961a 100644
> --- a/drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c
> +++ b/drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c
> @@ -106,12 +106,10 @@ static s16 odm_InbandNoise_Monitor_NSeries(
>  	pDM_Odm->noise_level.noise[RF_PATH_A] = -110 + reg_c50 + noise_data.sum[RF_PATH_A];
>  	pDM_Odm->noise_level.noise_all += pDM_Odm->noise_level.noise[RF_PATH_A];
> 
> -	if (max_rf_path == 2) {
> -		reg_c58 = (s32)PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XBAGCCore1, bMaskByte0);
> -		reg_c58 &= ~BIT7;
> -		pDM_Odm->noise_level.noise[RF_PATH_B] = -110 + reg_c58 + noise_data.sum[RF_PATH_B];
> -		pDM_Odm->noise_level.noise_all += pDM_Odm->noise_level.noise[RF_PATH_B];
> -	}
> +	reg_c58 = (s32)PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XBAGCCore1, bMaskByte0);
> +	reg_c58 &= ~BIT7;
> +	pDM_Odm->noise_level.noise[RF_PATH_B] = -110 + reg_c58 + noise_data.sum[RF_PATH_B];
> +	pDM_Odm->noise_level.noise_all += pDM_Odm->noise_level.noise[RF_PATH_B];
>  	pDM_Odm->noise_level.noise_all /= max_rf_path;

If the condition is always false the whole block can be wiped out,
why did you keep it? Did you change the logic here?

> 
>  	/*  */
> --
> 2.32.0
> 

thank you,

fabio

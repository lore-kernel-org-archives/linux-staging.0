Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7A02C80
	for <linux-staging@lists.linux.dev>; Wed,  1 Dec 2021 21:04:24 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id o13so54980891wrs.12
        for <linux-staging@lists.linux.dev>; Wed, 01 Dec 2021 13:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=dXdZwfGWDav+4+EuXXt9amZDrLIfxTbg+r3dcr+ghrc=;
        b=bRjBq1q/t59/oprvbtWyo+sLjo83k6AHf2tN9l+TrGv6plUjnh8vWlKcIxGgGzdcRf
         QD9T2Q5PCQgaUzRX0ukZcUhKlKfm0rvUy/1VfieI2pEP1Pu3rnns+sG/rzjHT64EONSO
         Nm0ESG+jjt1fUMcAjazUdlzfjlUFy9+ZWtwrhmO35Ere/MXLZKvMtqzwSelx42QxfPho
         njClcM7khrQ1IPnQqOzigf0SU41SrxYOsvUbUQRHkWur1CPWxQwvHT3DT4P1d0PsIYTS
         rRKoRoIasLF6mBxzZ8AQ0sTiVZlt5GPz93hII22xuQSXlCuBjXa1d1++r9K1EGS3FWpB
         yfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=dXdZwfGWDav+4+EuXXt9amZDrLIfxTbg+r3dcr+ghrc=;
        b=Z3eNPirLotUUuZrg5W9IuaoGodGWIuVwc9n0ULv6FWrKKLPgdwTdxoLvJNlvl7rKS4
         z2BHVOD9htg3AMmRRROAAKbpcdT/v/FjMRA71qCEITvSOb8HO8SQ4Gd7b/+7SCIGohcc
         1cKjo1+MREQEPyT/fXko4h1Aol/wrkk0cbnvKs6jKzdgyngFa0md7GqqKay2u/IGXhwc
         8eW1M5kNWFdUyCul7weU+zU9zaO0e0V2PDtzmttB5ksA8uGBMgy9SBtYmarwOcRblmPO
         neY0gzf1nVTdwvWFT4VcxRXoF/IRbwLba3faD+2odzCNtrJbUDbiyeVESx88V+UORTRp
         DqTg==
X-Gm-Message-State: AOAM533l0J3S53WR/+B6tFFJI5QdybEvB6Gmd+MBpm/fABT3yMtGZigu
	sDh09YXifqsFD0kyd17zN0+gVV1gdDw=
X-Google-Smtp-Source: ABdhPJwtOQTmBKrSdV6HNqHEji/a4WAwj68V5PxjVwp3jDel7K0LwJlUzxHoMJ7/EjNxxLeRI3aL3g==
X-Received: by 2002:a5d:6d86:: with SMTP id l6mr9385949wrs.304.1638392663156;
        Wed, 01 Dec 2021 13:04:23 -0800 (PST)
Received: from ?IPV6:2003:ea:8f1a:f00:4055:a69:db9e:1280? (p200300ea8f1a0f0040550a69db9e1280.dip0.t-ipconnect.de. [2003:ea:8f1a:f00:4055:a69:db9e:1280])
        by smtp.googlemail.com with ESMTPSA id g16sm465221wmq.20.2021.12.01.13.04.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Dec 2021 13:04:22 -0800 (PST)
Message-ID: <65516be1-9588-af00-cf4f-053e20af9b45@gmail.com>
Date: Wed, 1 Dec 2021 22:04:07 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH v2 2/2] staging: fbtft: sh1106: use new macro
 FBTFT_REGISTER_SPI_DRIVER
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <773dc6ff-f2b4-4192-a128-c34bd3f5be01@gmail.com>
In-Reply-To: <773dc6ff-f2b4-4192-a128-c34bd3f5be01@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Make fb_sh1106 the first user of new macro FBTFT_REGISTER_SPI_DRIVER.
In addition the MODULE_ALIASes can be removed. Module auto-loading
was successfully tested with a SH1106-based OLED module connected
to an Odroid C2.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/staging/fbtft/fb_sh1106.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/fbtft/fb_sh1106.c b/drivers/staging/fbtft/fb_sh1106.c
index 7b9ab39e1..9685ca516 100644
--- a/drivers/staging/fbtft/fb_sh1106.c
+++ b/drivers/staging/fbtft/fb_sh1106.c
@@ -173,12 +173,7 @@ static struct fbtft_display display = {
 	},
 };
 
-FBTFT_REGISTER_DRIVER(DRVNAME, "sinowealth,sh1106", &display);
-
-MODULE_ALIAS("spi:" DRVNAME);
-MODULE_ALIAS("platform:" DRVNAME);
-MODULE_ALIAS("spi:sh1106");
-MODULE_ALIAS("platform:sh1106");
+FBTFT_REGISTER_SPI_DRIVER(DRVNAME, "sinowealth", "sh1106", &display);
 
 MODULE_DESCRIPTION("SH1106 OLED Driver");
 MODULE_AUTHOR("Heiner Kallweit");
-- 
2.34.1



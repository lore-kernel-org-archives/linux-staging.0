Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355C83FE0
	for <linux-staging@lists.linux.dev>; Tue,  1 Feb 2022 08:43:15 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id n10so32532111edv.2
        for <linux-staging@lists.linux.dev>; Tue, 01 Feb 2022 00:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Nb3xSeie889vi5dtxHuHAsn4Vn6L3IVncsI2Y6Lx56g=;
        b=pc/f/hXsAH1pPlvIHbUnatwUOgKC7TrbwD0E5kJkD6VnNjMdip/URdwwDRoW2XoyBH
         ic1t/NcgZJfEl7Rn5RlrZvWu3ivZYuMLK7YTO3THqOReA2hNV/4hKTp+kDibE2CDajBv
         0ZWKdzGjZ7wTPjO2TiTt/Nmv+9GndisEhT4/qR+gE5gjb0145idQmMM+TRt8ApERzmg+
         2BgCfxM/8PAgKNZ1echww8PK88ctJcpDcoONBt+DGiUuhgsGkJI1YYMzUS92zQi4v5d2
         0AeNG9FPJywnEcoo3tKc8mY4ZgRGNfin6+Lp1OGM4kqZS67knxmbzl3+P6JhKiMFk3lQ
         XSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nb3xSeie889vi5dtxHuHAsn4Vn6L3IVncsI2Y6Lx56g=;
        b=Vx5/8zqMqzPWCPDEmhM4Dq39oaXIHMzCu2pj4RkB7NfyyOsv9jbBShMX/eWmDr5dj5
         u+Qw6xxVLBwKQ5s2ogqe2hicVqEtDDF5iFk+R7PWuoAQV6fW+ulM8RxN5y7ig6TMUaCu
         KrOnzSaaIDBRphW6vc4/44YjcPtl4xtwc6IeKcjdhITJIN4quf2OBcfy+fJkU0Se8i1d
         AqclM1bAyUSxksdhCY/GB8VLtVvvuITi6cwZyRDO+cA0Jo5o1aitIbP7WQXbHD6FljV8
         qaEkn7f98rCid75GiNyRwcSVZoJ9xw2t/Dx+7CgHABPcdFqvD54mn590t+CVa9iSTByc
         ec5g==
X-Gm-Message-State: AOAM533na4MFUToNJS7PNS3ptLECZ74HedSrbjtyBpkx/t7+15xBMvmW
	fSR7d+753CyIyI3ya0Wrt2I=
X-Google-Smtp-Source: ABdhPJwLLwl0NLr2DqbcAy45dMyGWuVA6Q9UAw7+6hSkEGEEd4aOVSdXc1deJ6WvMMWhUFXEYWz7SQ==
X-Received: by 2002:a05:6402:5216:: with SMTP id s22mr24541386edd.359.1643704993669;
        Tue, 01 Feb 2022 00:43:13 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb5a.dynamic.kabel-deutschland.de. [95.90.187.90])
        by smtp.gmail.com with ESMTPSA id c14sm19123431edy.66.2022.02.01.00.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 00:43:13 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/9] staging: r8188eu: BasicRateSet is set but never used
Date: Tue,  1 Feb 2022 09:42:54 +0100
Message-Id: <20220201084259.7497-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220201084259.7497-1-straube.linux@gmail.com>
References: <20220201084259.7497-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The varaible BasicRateSet in struct hal_data_8188e is set but never
used. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_halinit.c      | 1 -
 drivers/staging/r8188eu/include/rtl8188e_hal.h | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 2252e8a1d55b..e6c253122e9c 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1078,7 +1078,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 			/* CCK 5.5M & 11M ACK should be enabled for better performance */
 
 			BrateCfg = (BrateCfg | 0xd) & 0x15d;
-			haldata->BasicRateSet = BrateCfg;
 
 			BrateCfg |= 0x01; /*  default enable 1M ACK rate */
 			/*  Set RRSR rate table. */
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 88246ef65f8a..7a72b564400d 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -155,8 +155,6 @@ struct hal_data_8188e {
 	u8	CurrentChannel;
 	u8	nCur40MhzPrimeSC;/*  Control channel sub-carrier */
 
-	u16	BasicRateSet;
-
 	u8	EEPROMRegulatory;
 	u8	EEPROMThermalMeter;
 
-- 
2.34.1


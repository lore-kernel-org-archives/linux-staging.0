Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB0BA51
	for <linux-staging@lists.linux.dev>; Wed, 28 Sep 2022 08:36:53 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id u24so1613729edb.11
        for <linux-staging@lists.linux.dev>; Wed, 28 Sep 2022 01:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=MBektPIlMNaA94hBUX0CqK9rztppqrFQ5yZw6cU5GA0=;
        b=nPowmBvi0n48oK8YdWwlNpwVqzUohZDIbZ6IeTiNfgHLlJ8NYAlh/4Pyluc7lIAa/L
         16N1y+rHrLvENsNatjnSGhKwwvXZMs/i/qcAv9hRPCfDorku4qTRB0xoh/OwE4WpFVl+
         5syX9koK47487SX4eughY8qYHorRRQykNPlusQrBoJhQTkSgo5Ws9Y4e/ek0gHCXfQ9f
         UWl5dvf85g7MpHjezxrovZ/ktB/Un3GxYG/jYT3zgq8T9AgYpE7PLwmxr5/ofJF8joiF
         NpMLrA6HnUVs/7RW87NzdUUfbfkekVaP1f+8Y/DC+jqu3WQwMc2KUa3y+PprukqCJcHU
         8uRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=MBektPIlMNaA94hBUX0CqK9rztppqrFQ5yZw6cU5GA0=;
        b=U4Q7h62YoVjlOxaPt/AMca5oX0EGSNkIip3JVy2bmGwmXA9ZtsPvZelxCo1RLfk4qv
         fhqNnMwm4hPmhPoCdzzkAr7CwxQVUuDVDpODV91uQsUKAV8spCjKMWXLdRK2DTTXIU2H
         NhW6MuDd1lDTLfRQ1vbZXUSCdjZg37Hvo0hnjaPchqL0/NEF11F8H2e9IlQ+5uFRjZTX
         d+jf4u3tyc++XZcrxqA/w5UHKV3Uka6d/InPe1UelnSQjURGvnubAu/xxur++dTgTUaj
         8VGm0O+/w3K4DDSbKyhcfm8TOSkYvBe8avPJ84oXvyIknHUb4REnr720K/hMFC/AeZ1T
         vAYw==
X-Gm-Message-State: ACrzQf0OUecN8eROBNauOAMemg/Rk4SFNYd42LuR2GvFyV1G6zVBl5VA
	DtRaOg7OUgfkiSvIqU8ApBE=
X-Google-Smtp-Source: AMsMyM4twxMuvjaYsmnTWGMP/Jsa+DOULJ4IT+cCUr07gRi+SeVNi1RRVmEet7caj68BkC4mHllRSA==
X-Received: by 2002:aa7:c6d6:0:b0:457:d8cd:abb5 with SMTP id b22-20020aa7c6d6000000b00457d8cdabb5mr3999708eds.382.1664354211697;
        Wed, 28 Sep 2022 01:36:51 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb59.dynamic.kabel-deutschland.de. [95.90.187.89])
        by smtp.gmail.com with ESMTPSA id gy23-20020a170906f25700b00730b3bdd8d7sm2024526ejb.179.2022.09.28.01.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 01:36:51 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/2] staging: r8188eu: remove PHY_RFConfig8188E()
Date: Wed, 28 Sep 2022 10:36:41 +0200
Message-Id: <20220928083641.8275-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928083641.8275-1-straube.linux@gmail.com>
References: <20220928083641.8275-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function PHY_RFConfig8188E() is just a wrapper around
phy_RF6052_Config_ParaFile(). Remove the wrapper.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c    | 9 ---------
 drivers/staging/r8188eu/hal/usb_halinit.c        | 2 +-
 drivers/staging/r8188eu/include/Hal8188EPhyCfg.h | 1 -
 3 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
index cb2788bc383b..731179635c54 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
@@ -507,15 +507,6 @@ PHY_BBConfig8188E(
 	return rtStatus;
 }
 
-int PHY_RFConfig8188E(struct adapter *Adapter)
-{
-	int		rtStatus = _SUCCESS;
-
-	/*  RF config */
-	rtStatus = phy_RF6052_Config_ParaFile(Adapter);
-	return rtStatus;
-}
-
 static void getTxPowerIndex88E(struct adapter *Adapter, u8 channel, u8 *cckPowerLevel,
 			       u8 *ofdmPowerLevel, u8 *BW20PowerLevel,
 			       u8 *BW40PowerLevel)
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index a478b83dcbf3..d28b4dc2a767 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -611,7 +611,7 @@ u32 rtl8188eu_hal_init(struct adapter *Adapter)
 	if (status == _FAIL)
 		goto exit;
 
-	status = PHY_RFConfig8188E(Adapter);
+	status = phy_RF6052_Config_ParaFile(Adapter);
 	if (status == _FAIL)
 		goto exit;
 
diff --git a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
index 9e6f2361b090..4a0b782c33be 100644
--- a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
+++ b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
@@ -80,7 +80,6 @@ void rtl8188e_PHY_SetRFReg(struct adapter *adapter, u32 regaddr, u32 mask, u32 d
 /* MAC/BB/RF HAL config */
 int PHY_MACConfig8188E(struct adapter *adapter);
 int PHY_BBConfig8188E(struct adapter *adapter);
-int PHY_RFConfig8188E(struct adapter *adapter);
 
 /*  BB TX Power R/W */
 void PHY_SetTxPowerLevel8188E(struct adapter *adapter, u8 channel);
-- 
2.37.3


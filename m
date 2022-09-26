Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07514428
	for <linux-staging@lists.linux.dev>; Mon, 26 Sep 2022 17:32:51 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id sb3so15612086ejb.9
        for <linux-staging@lists.linux.dev>; Mon, 26 Sep 2022 10:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=kRLijR5oyAOegAsMr9uRqxn4ejdUkVTR852YUUghNUE=;
        b=HAKciU4TTD/RKp/d/Zwr4SkfntWLJ6I2A59VOxclITi0+ND1ld1jMAF4vl1KCNsZd6
         nxcQE7zKVfS/a//nrFteMMgaydHNI2DLLDsvt4O3UoWoSMA4pZuv3BpGdsprZ9O5o0/6
         NMgAh5uw0Y49tl4lbwz1lXqEe9ASBi+78/kAOgDk+VgJuLS82Z/Rs+DFmvmLtZt1b8UK
         N9GPSfeCtrmreSAbve3PHFOeYHIUy2ntW7zZRAKbBpHhTb4P4FeselQwBNpbxYq8yxH2
         ixRvNU/AhDKWdJNb51bDc6OrRVj2SNJoeu2jGKJDhU8+ncvjsDaXpG0XAu14Yqvx/ncG
         qpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=kRLijR5oyAOegAsMr9uRqxn4ejdUkVTR852YUUghNUE=;
        b=qiISNklt1PvI1g+SPiURWu+ex68y+HyzO/B8DxYO9I3hDwtirn19I5h15hAnH7T/am
         9Oc1AsXN/Fq2xMR5mJV9CP/yo2Lg+00t+TDmt+aQ9D5zDmeSbezshqS0cgYVoiRm/dqm
         IldZI8uBTTX3KbavdYZ9f5v2RcP5n+Sgkz1Ou76Zp4lVkAerV0ulin1ofllc1v/jSxuF
         Azt7o3W+WrIdsaxHmk08sOShi48yX8Hh5v68FA7LCZ0R2tZXYo9rw1A3a+C8GW7krO3s
         TaM+jO9HEuB9fKbteNxjiw49CNpFuCipeZwftGKw4P9rULGhPMC31K3sc60vkrTnSVcN
         el3A==
X-Gm-Message-State: ACrzQf25u4OMrD7bM1QoRz/s462JuQq4wUE+H2SFtde/bIYaUSKOZX8F
	Y2dimQwucS7IulcaIr7bke4=
X-Google-Smtp-Source: AMsMyM7m9kNWqUF+vdLNEDJ+Oh4nkq5deojnLJRurAWBKV3yeD4Q6lMxcOu4GxwXON075c8s1fexxQ==
X-Received: by 2002:a17:906:854b:b0:782:4c6f:5ff6 with SMTP id h11-20020a170906854b00b007824c6f5ff6mr18231861ejy.603.1664213570117;
        Mon, 26 Sep 2022 10:32:50 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb59.dynamic.kabel-deutschland.de. [95.90.187.89])
        by smtp.gmail.com with ESMTPSA id y4-20020a1709060a8400b00782667df018sm6554617ejf.54.2022.09.26.10.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 10:32:49 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/3] staging: r8188eu: make odm_ConfigMAC_8188E() static
Date: Mon, 26 Sep 2022 19:32:41 +0200
Message-Id: <20220926173243.8767-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926173243.8767-1-straube.linux@gmail.com>
References: <20220926173243.8767-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function odm_ConfigMAC_8188E() is only used in HalHWImg8188E_MAC.c.
Make it static.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/HalHWImg8188E_MAC.c      | 5 +++++
 drivers/staging/r8188eu/hal/odm_RegConfig8188E.c     | 5 -----
 drivers/staging/r8188eu/include/odm_RegConfig8188E.h | 2 --
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/HalHWImg8188E_MAC.c b/drivers/staging/r8188eu/hal/HalHWImg8188E_MAC.c
index 77b25885c63b..e615bc37c74f 100644
--- a/drivers/staging/r8188eu/hal/HalHWImg8188E_MAC.c
+++ b/drivers/staging/r8188eu/hal/HalHWImg8188E_MAC.c
@@ -126,6 +126,11 @@ static u32 array_MAC_REG_8188E[] = {
 		0x70B, 0x00000087,
 };
 
+static void odm_ConfigMAC_8188E(struct odm_dm_struct *pDM_Odm, u32 Addr, u8 Data)
+{
+	rtw_write8(pDM_Odm->Adapter, Addr, Data);
+}
+
 enum HAL_STATUS ODM_ReadAndConfig_MAC_REG_8188E(struct odm_dm_struct *dm_odm)
 {
 	#define READ_NEXT_PAIR(v1, v2, i) do { i += 2; v1 = array[i]; v2 = array[i + 1]; } while (0)
diff --git a/drivers/staging/r8188eu/hal/odm_RegConfig8188E.c b/drivers/staging/r8188eu/hal/odm_RegConfig8188E.c
index 0fa17a99f9e9..e6e10a3c8d54 100644
--- a/drivers/staging/r8188eu/hal/odm_RegConfig8188E.c
+++ b/drivers/staging/r8188eu/hal/odm_RegConfig8188E.c
@@ -33,11 +33,6 @@ void odm_ConfigRF_RadioA_8188E(struct odm_dm_struct *pDM_Odm, u32 Addr, u32 Data
 	odm_ConfigRFReg_8188E(pDM_Odm, Addr, Data, Addr | maskforPhySet);
 }
 
-void odm_ConfigMAC_8188E(struct odm_dm_struct *pDM_Odm, u32 Addr, u8 Data)
-{
-	rtw_write8(pDM_Odm->Adapter, Addr, Data);
-}
-
 void odm_ConfigBB_AGC_8188E(struct odm_dm_struct *pDM_Odm, u32 Addr, u32 Bitmask, u32 Data)
 {
 	rtl8188e_PHY_SetBBReg(pDM_Odm->Adapter, Addr, Bitmask, Data);
diff --git a/drivers/staging/r8188eu/include/odm_RegConfig8188E.h b/drivers/staging/r8188eu/include/odm_RegConfig8188E.h
index 683fa4a07956..9cecbf9532f5 100644
--- a/drivers/staging/r8188eu/include/odm_RegConfig8188E.h
+++ b/drivers/staging/r8188eu/include/odm_RegConfig8188E.h
@@ -7,8 +7,6 @@
 void odm_ConfigRF_RadioA_8188E(struct odm_dm_struct *pDM_Odm,
 			       u32 Addr, u32 Data);
 
-void odm_ConfigMAC_8188E(struct odm_dm_struct *pDM_Odm, u32 Addr, u8 Data);
-
 void odm_ConfigBB_AGC_8188E(struct odm_dm_struct *pDM_Odm, u32 Addr,
 			    u32 Bitmask, u32 Data);
 
-- 
2.37.3


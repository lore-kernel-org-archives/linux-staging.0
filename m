Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC702FB3
	for <linux-staging@lists.linux.dev>; Sat,  7 Aug 2021 09:48:24 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id k4so1219693wrc.0
        for <linux-staging@lists.linux.dev>; Sat, 07 Aug 2021 02:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ULeafM1R3YduxD1dAv+SkYM7oMOT+IRds1g32q9BMXo=;
        b=hukA4IRMFM2o8QrAOywMzSxmDBju1xUuI/lLLewvaqvTB7VIHceZMK1OcyScko9QDM
         tJpOQiTtCXPLOgYEAKWBWHm34cV/oD1+GpKgAl+lPFmnVLFpYb5cEuGLpjAMpWh3iETs
         cuka8MUOcaWF9v68ty1ntxA/RUBl3/RljLAW56PdFQhROoJ/QvCy2LW4wFfgi/9Gt3L1
         yzZrjM8OhsC6WqwOhR+ifCy2VBZQKFC1DN4qHchHADsqHwQoALcQPD1mEQ16YQ6FS3is
         CTiMgCH7MvR2dsbNUofhXkn9k6UqZm0Yzs5W9+r/C98s8Axm//V2BFGxadceIa+Uzfst
         I6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ULeafM1R3YduxD1dAv+SkYM7oMOT+IRds1g32q9BMXo=;
        b=gqeosUEuOQ8mJV+WNziJPvo+ldLh8N94AiyVlNBoTj+khqvoYjnA44bG2cPxTFnfO8
         cFqBhmgJ+o6l2GSD9LS9DUrdpaOpDoyqxC1M4NsNrvm3SJMZ2XIPlkNxImYfobvJOr/T
         cacH/qyh7zo9mpFzRJIydy8WLaOArsaMa7tPq6rFZjbJRknr+knF+whrC1rHWbW5IjLL
         kGo3GRFMw3l5QRBhExmaqYB492ox31FKdCx8X9PtmgFlI1qcxVw20+2/bMZ5fEJdASiO
         2wb3Z2GZGqvqgyRaGED+lYyNl5wN9nugrb/KkYu5L0eBiXE/k11MqI0Tuxp5xWTz+ywk
         k1Pg==
X-Gm-Message-State: AOAM530EsXfW7FPxLRR8kxluCuW0osMYbjMCilUKbkxueM5BIx3cF0d6
	m4fTZEGbUsKJCLE5PD0Oyvs=
X-Google-Smtp-Source: ABdhPJy81EVkINQuWhOXhLbE9coNz8iFuFg0VDmDx90jDs81WsFw0/+cMkpi73aLu9WqnBktD/DL5g==
X-Received: by 2002:adf:a188:: with SMTP id u8mr15179454wru.245.1628329703177;
        Sat, 07 Aug 2021 02:48:23 -0700 (PDT)
Received: from agape ([5.171.80.112])
        by smtp.gmail.com with ESMTPSA id z20sm10844212wmi.36.2021.08.07.02.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Aug 2021 02:48:23 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/21] staging: rtl8723bs: remove wrapping static function
Date: Sat,  7 Aug 2021 11:47:58 +0200
Message-Id: <786fc4d72db2a4b5e22c95e0e1437cfb734e1218.1628329348.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1628329348.git.fabioaiuto83@gmail.com>
References: <cover.1628329348.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unneeded wrapping static function in
hal/odm_HWConif.c

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index 2d4d8d57ceeb..5e6186040484 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -393,7 +393,7 @@ static void odm_Process_RSSIForDM(
 /*  */
 /*  Endianness before calling this API */
 /*  */
-static void ODM_PhyStatusQuery_92CSeries(
+void ODM_PhyStatusQuery(
 	struct dm_odm_t *dm_odm,
 	struct odm_phy_info *phy_info,
 	u8 *phy_status,
@@ -407,17 +407,6 @@ static void ODM_PhyStatusQuery_92CSeries(
 		odm_Process_RSSIForDM(dm_odm, phy_info, pkt_info);
 }
 
-void ODM_PhyStatusQuery(
-	struct dm_odm_t *pDM_Odm,
-	struct odm_phy_info *pPhyInfo,
-	u8 *pPhyStatus,
-	struct odm_packet_info *pPktinfo
-)
-{
-
-	ODM_PhyStatusQuery_92CSeries(pDM_Odm, pPhyInfo, pPhyStatus, pPktinfo);
-}
-
 /*  */
 /*  If you want to add a new IC, Please follow below template and generate a new one. */
 /*  */
-- 
2.20.1


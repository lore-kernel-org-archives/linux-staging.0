Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A2D3FCA
	for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 19:47:26 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id u18so133926wrg.5
        for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 12:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YAxHuRHm7WfK6bNik1ywIBpJsescet2i7txnxF2Aqf0=;
        b=VaUSB+G5i7MxEC1NU5ctqQF4GfLXIHpHcsb47g290mR+P//Lrq61NxgxaWVSVCabaa
         2TCgKQkvVP5XORobC+0eaJ2g6tKHAGbSYxNSGDnwIZb3FdrxjNnhXbGKf5wFHrClCF+Y
         MlfWd/fXpqL9+dFTGHX5Yr6w7Ytus7zhxigdj27BTz3i4WUuPoZg5w6n9SPzgNLJjx1Z
         WHM5srEvoPfZt62TJEsfIh8qQhlZYQRmDMFg7bUjwFTMQYdqQgjBVdZhYHT1iB/UA/ap
         fR6wBfu4LdcpbR//W0LFXOCHVpYSG9mcKK9ABc24QKHID7c64AcwtP7w8Km92jz0jOIm
         cS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YAxHuRHm7WfK6bNik1ywIBpJsescet2i7txnxF2Aqf0=;
        b=nNvAVt1OoReEeUfoJxKOdHMfP2kpL4Aw/FQ6ChZdDmwkY10U9GU8cWDf5fZbkzX+zp
         rYeIcweYVl7L39wzHxU0qJdL0/Ntv/HOcA++CSo39OlPnxwJrwm/t987lfirMuGoWgML
         V5epJjLdfdPJPTvr9s3V17cQHZbwglq0UJ/+7R1v1EEqb2a3szppusoDpK2x3GHbL09l
         QspffwVKfsqMhJq/2VJ6IUgbGEkf+Ly372tpZr8eE06J6BaDguWazIuixS1YGi+iUkSr
         3oQpLtmm/AUMQq3COMNOyCdYyjW/KIjKeFfLRFCijkXc6fxDJYbpXmzLfC5s/ZRDav63
         Gqnw==
X-Gm-Message-State: AOAM530z5kPzR6K1TkGgpIKmnxoxKpVbMDbQhj1XEmRGjlCD4lLxJVkY
	W4sP+RI/gsFE0rgzPR0Oo5b2jv0+b9vfgw==
X-Google-Smtp-Source: ABdhPJyElFp1acBjmLJYQr8aJci7+tL3R8CDUq0tU/ZKz1XYvXDEtbkcjFSX9gUM59/gIzN96r0fag==
X-Received: by 2002:a05:6000:1809:: with SMTP id m9mr38380557wrh.396.1632253645190;
        Tue, 21 Sep 2021 12:47:25 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id s13sm3891243wmc.47.2021.09.21.12.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 12:47:24 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/8] staging: r8188eu: remove write-only fields from struct dm_priv
Date: Tue, 21 Sep 2021 21:46:54 +0200
Message-Id: <20210921194658.10654-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921194658.10654-1-straube.linux@gmail.com>
References: <20210921194658.10654-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fields bDynamicTxPowerEnable and LastDTPLvl of struct dm_priv
are set but never used. Remove them.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c             | 2 --
 drivers/staging/r8188eu/include/rtl8188e_dm.h | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index c691a6a90fa9..555060bdfdd9 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -1183,8 +1183,6 @@ void odm_DynamicTxPowerInit(struct odm_dm_struct *pDM_Odm)
 	struct adapter *Adapter = pDM_Odm->Adapter;
 	struct hal_data_8188e	*pHalData = GET_HAL_DATA(Adapter);
 	struct dm_priv	*pdmpriv = &pHalData->dmpriv;
-	pdmpriv->bDynamicTxPowerEnable = false;
-	pdmpriv->LastDTPLvl = TxHighPwrLevel_Normal;
 	pdmpriv->DynamicTxHighPowerLvl = TxHighPwrLevel_Normal;
 }
 
diff --git a/drivers/staging/r8188eu/include/rtl8188e_dm.h b/drivers/staging/r8188eu/include/rtl8188e_dm.h
index 3ead20b321a9..2209975c0b2d 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_dm.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_dm.h
@@ -29,8 +29,6 @@ struct	dm_priv {
 	int	LastMinUndecoratedPWDBForDM;
 
 	/* for High Power */
-	u8 bDynamicTxPowerEnable;
-	u8 LastDTPLvl;
 	u8 DynamicTxHighPowerLvl;/* Tx Power Control for Near/Far Range */
 	u8	PowerIndex_backup[6];
 };
-- 
2.33.0


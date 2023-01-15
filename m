Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE8646BD
	for <linux-staging@lists.linux.dev>; Sun, 15 Jan 2023 21:07:48 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id u9so63911042ejo.0
        for <linux-staging@lists.linux.dev>; Sun, 15 Jan 2023 13:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+5N1rXSfVPzLU7ZKBzI7cYGDRpk01puVVQT6NPAi1o=;
        b=jcN9F7eXKvSGmUgLLg6dzI3dRFBeoFJsef5UJB/M15r6NhBJER1HOfqzotw2DxpKXO
         vX5zrtjhrccQEuBUR07GhVUzObjfbuUfUhPHW48PAjR2imZH6M81m7W9I5DXoS2jFN9Y
         a6PtqYC8nlgCirn+hafNwZXAbuLWGl3JF13HulCDSNctv+uZaK0c0XvMmqzI6MpOkdbO
         1TNKHuq5hQZUE7QW1RbmKmdjbnGmEMgqnUb6b4cVkGBzj+OhNjqhRi6n09MkfsDSdpVe
         o7hOe6rGLh1oNQZggDdQDhve8M7q5+2WoNCohdNbzUqUVqmr9s9+G0AHSwCyRjIuPAGu
         2IqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+5N1rXSfVPzLU7ZKBzI7cYGDRpk01puVVQT6NPAi1o=;
        b=h5TmQo5E1bl2Q6+Hrfgefg0O6qhMcgmrEJA0UTKdYzecf4kdqswTWXB8IOmiWTBXgX
         Pz8Vl1rJanRkxLIrtQ2qPHmJ0tyCyw0X3rdBqkrOy928buVoUyhRLDao6KWNY+3IKNX4
         XA8kO7b9UOKICbuhbwg1ikZSxXg1y/hoTsakoSSL6P2Y3tgXBXjYTNE0GCIKgoJCVP/L
         pu7cbzrG9d/nbnuEGfS/nDCKlf5/wsmNSbRelhXCUmNn57wPCvYN/A4D51ABNUYQ3PwC
         xTU82bAT69KWx9S7fK6s6EiNu9eEt+BzVVTSHzRelq9g1r1f5ZKM5th5SmHLjrV7zgTJ
         Tjkw==
X-Gm-Message-State: AFqh2kqk+YS9JGb13ck3Je6CagzoQbQrcO1nGzrHAJ8+FdWiZD5IojjY
	kepCt2yq56ksNUaiBoxX8bdcXxu9UEw=
X-Google-Smtp-Source: AMrXdXst4D2SRJG02W2JtgxucFf+eXdtI3QE0xU5NO4BcY0cLVtjS+Pc/v+KPVRLGsBqZVFr5JY7iA==
X-Received: by 2002:a17:907:3e26:b0:839:74cf:7c4f with SMTP id hp38-20020a1709073e2600b0083974cf7c4fmr103277586ejc.8.1673816866654;
        Sun, 15 Jan 2023 13:07:46 -0800 (PST)
Received: from localhost.localdomain (ip5f5abbb0.dynamic.kabel-deutschland.de. [95.90.187.176])
        by smtp.gmail.com with ESMTPSA id a11-20020aa7d74b000000b0049e08f781e3sm1010421eds.3.2023.01.15.13.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 13:07:46 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/4] staging: r8188eu: convert PHY_MACConfig8188E() to common error logic
Date: Sun, 15 Jan 2023 22:07:31 +0100
Message-Id: <20230115210734.18610-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230115210734.18610-1-straube.linux@gmail.com>
References: <20230115210734.18610-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the function PHY_MACConfig8188E() away from returning _FAIL or
_SUCCESS which uses inverted error logic. Use the common error logic
instead. Return 0 for success and negative values for failure.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 9 ++++-----
 drivers/staging/r8188eu/hal/usb_halinit.c     | 5 ++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
index b7f3c7a670fb..204c1c30377b 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
@@ -315,21 +315,20 @@ rtl8188e_PHY_SetRFReg(
  *  08/12/2008	MHC		Create Version 0.
  *
  *---------------------------------------------------------------------------*/
-s32 PHY_MACConfig8188E(struct adapter *Adapter)
+int PHY_MACConfig8188E(struct adapter *Adapter)
 {
 	struct hal_data_8188e *pHalData = &Adapter->haldata;
-	int rtStatus = _SUCCESS;
+	int err;
 
 	/*  */
 	/*  Config MAC */
 	/*  */
-	if (ODM_ReadAndConfig_MAC_REG_8188E(&pHalData->odmpriv))
-		rtStatus = _FAIL;
+	err = ODM_ReadAndConfig_MAC_REG_8188E(&pHalData->odmpriv);
 
 	/*  2010.07.13 AMPDU aggregation number B */
 	rtw_write16(Adapter, REG_MAX_AGGR_NUM, MAX_AGGR_NUM);
 
-	return rtStatus;
+	return err;
 }
 
 /**
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index d28b4dc2a767..9ba6a526e90d 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -600,9 +600,8 @@ u32 rtl8188eu_hal_init(struct adapter *Adapter)
 	Adapter->pwrctrlpriv.bFwCurrentInPSMode = false;
 	haldata->LastHMEBoxNum = 0;
 
-	status = PHY_MACConfig8188E(Adapter);
-	if (status == _FAIL)
-		goto exit;
+	if (PHY_MACConfig8188E(Adapter))
+		return _FAIL;
 
 	/*  */
 	/* d. Initialize BB related configurations. */
-- 
2.39.0


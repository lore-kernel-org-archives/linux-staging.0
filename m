Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8732C9C
	for <linux-staging@lists.linux.dev>; Sat,  1 Jan 2022 08:49:51 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id r17so59681374wrc.3
        for <linux-staging@lists.linux.dev>; Sat, 01 Jan 2022 00:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YbTLV5Bfca2xgmvPMQbusqJj771BWIhHOlR3Rbqv4og=;
        b=HxVL6urLyJ013tVQPhN0jkvV/1Z+cCKHsb2VhwP1lPo23HHH2mVEqwA4PivmGlUrrZ
         eaDycPhQJjn6lv8qfnm5EEAHXoTyqq2YfuoU63Q38e0yTJdWhWztx3rInDIK2ZDnkZrF
         Iy1d4ZBX9BBbz1O+MvU0+J+5B0lXyRGD5mD/5boEN4BAvuKrYNNFUbsZUZab/mKjOK2e
         Z/qy3hbT9zGNz7ZyZ2Qo381xxeSZMVxHy6rM2rfxKy8BndSjin2zI7JJBBveJljXi7Ju
         irdMO9KnGgai3R89XhIIs80SGlHJQSOk0yl/7WBLEvlMgpPQUKz6z3yYvtex+4Nj0QEb
         5CLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YbTLV5Bfca2xgmvPMQbusqJj771BWIhHOlR3Rbqv4og=;
        b=OROHnbPIy3EqQ2sgTqsJBvdcmJBQ4uEWUKaELVZ1Vy11ZCUltDegTMHnx5rYi4wN80
         9smS9zIAYDxQbLhJ9goQ2GXvDukYF6uT3ttK2JvOqZ91yd2hgZ7aHHrM2EWyAG95/8gC
         Vu7/2xzx4FeHzBlOSMGIzSnq42UMoX2fJOcdy4bo+zJpCSSyYWOf0Bb+LyEaJeJBfPmX
         r7hnBVYr+K6FhdxYb2MdgP2F3c1+NeMjPfQrxCbdYmyounVAlmK5ephCc+2n3nm+tGbK
         GjtxQpgpyXzuXaSkzghsXTQOb4UQV4KpaXHHs+OVxH5fDy5FwSLmjXE1p8C+ALKaxeUW
         nfUA==
X-Gm-Message-State: AOAM532xpEH2A74x3p2nh9R6ZTAAz7D5PV3VOcL32+yw3dJOiAT8xL3i
	jQ02j+7cphY/AlOE7RVbb3M=
X-Google-Smtp-Source: ABdhPJxbpw+qEbVexHxloGMc0GmrBwUKsBQZc/ZK+EEzC45glDJqFE52JOQhyEip1qCasDmMq1+IfQ==
X-Received: by 2002:a05:6000:181b:: with SMTP id m27mr30601277wrh.43.1641026989807;
        Sat, 01 Jan 2022 00:49:49 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::d7e8])
        by smtp.gmail.com with ESMTPSA id o9sm14806578wri.97.2022.01.01.00.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jan 2022 00:49:49 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 1/7] staging: r8188eu: bRDGEnable is always false
Date: Sat,  1 Jan 2022 09:49:31 +0100
Message-Id: <20220101084937.3411-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220101084937.3411-1-straube.linux@gmail.com>
References: <20220101084937.3411-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The field bRDGEnable in struct hal_data_8188e is never set. It stays
at its default value 0. Remove bRDGEnable and related dead code.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v3: no changes
v2: no changes

 drivers/staging/r8188eu/hal/usb_halinit.c      | 10 ----------
 drivers/staging/r8188eu/include/rtl8188e_hal.h |  3 ---
 2 files changed, 13 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index d5c7e8bf1f38..104705ef170e 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -384,13 +384,6 @@ static void _InitEDCA(struct adapter *Adapter)
 	rtw_write32(Adapter, REG_EDCA_VO_PARAM, 0x002FA226);
 }
 
-static void _InitRDGSetting(struct adapter *Adapter)
-{
-	rtw_write8(Adapter, REG_RD_CTRL, 0xFF);
-	rtw_write16(Adapter, REG_RD_NAV_NXT, 0x200);
-	rtw_write8(Adapter, REG_RD_RESP_PKT_TH, 0x05);
-}
-
 static void _InitRetryFunction(struct adapter *Adapter)
 {
 	u8 value8;
@@ -712,9 +705,6 @@ u32 rtl8188eu_hal_init(struct adapter *Adapter)
 	value16 |= (MACTXEN | MACRXEN);
 	rtw_write8(Adapter, REG_CR, value16);
 
-	if (haldata->bRDGEnable)
-		_InitRDGSetting(Adapter);
-
 	/* Enable TX Report */
 	/* Enable Tx Report Timer */
 	value8 = rtw_read8(Adapter, REG_TX_RPT_CTRL);
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index b42af86555cd..e8cb093abb62 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -236,9 +236,6 @@ struct hal_data_8188e {
 
 	u32	RfRegChnlVal[2];
 
-	/* RDG enable */
-	bool	 bRDGEnable;
-
 	/* for host message to fw */
 	u8	LastHMEBoxNum;
 
-- 
2.34.1


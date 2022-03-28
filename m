Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C80E435A
	for <linux-staging@lists.linux.dev>; Mon, 28 Mar 2022 11:40:01 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id a17so16546235edm.9
        for <linux-staging@lists.linux.dev>; Mon, 28 Mar 2022 04:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5U5/Qr+cQNGt04R4HkgE3JZ2XZt3yyTkgQ3RavyTc6g=;
        b=NFFGrqLusL2W2aloJb7UyHTq8l406uyV6/lUS/xNlz23h9z3LaprrosVjLtorPeLPn
         y1EuSFNpwiEQEjs3pqEj2v8vwEFLd8+Mka9DKzi2PwH5Yq4FXEBo4DYFymttBTDlRd+h
         IdRlNPn6GUkW4r6fLpl+K2cyP2w/KN7C6zMusxdLplnARrmQ9LGFqOfQPjAwqwXcLcHv
         VHKoCQcl8cdSL9zKj1o62kNt6Wk2fPwiomcljqT92a+1/MaAJl7yeBA1hepgvWzzxwyE
         cFA1LepEXNpW2L2Zgi4+QtoH4BvpoM/sa+hRng5ICBnMMNCUg6owfPNJBopBlCEOLGGP
         GClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5U5/Qr+cQNGt04R4HkgE3JZ2XZt3yyTkgQ3RavyTc6g=;
        b=lyyhWWVKHyct2DrICw89KIBJ3fLXTVpprplh4YWXyWUW8xQ4sKKpGCeGxGNQFZFxcQ
         p8i3FwXpqs8Lvs2gj32o6/edfeO0eYGM/zp1si3MOxXAG9/cjj3G47DfPkmZmhXSBJHR
         d4dfb6oHblqrgm43JpV0GzZvcxMV2lgMgKosCAISuVw11WZSmAjfR60bBVOcA1JyzUX1
         CgM0hTRKjOAYXYIR++S1yRXZFAaeg8CIMwd3lB9kngeBAMyv/gxnup7A4D8NMlctd35N
         VqZ42/v5KOs3N2y14ClBqsmnuhjGqSM47DEcW+VltkFWMff6I2O9NYFo4pk74/KBTYR9
         Pm7g==
X-Gm-Message-State: AOAM532QtCkeEP/trez5+wKag5kGLe1266ZGYBUKthAU7k7c9SONbxQ6
	l1f/PcmnWnXQfZiaQIHJNjM=
X-Google-Smtp-Source: ABdhPJzOXu7cB9SOxfdEWZGeyRyOBY/WMvEq+jyyC1TxxcvsjDwuDeqnyyL2prnzrZBAakSEa+cvkg==
X-Received: by 2002:a05:6402:354b:b0:419:4af8:c5c9 with SMTP id f11-20020a056402354b00b004194af8c5c9mr15818762edd.91.1648467599289;
        Mon, 28 Mar 2022 04:39:59 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id hq39-20020a1709073f2700b006dfc58efab9sm5938556ejc.73.2022.03.28.04.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 04:39:58 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 9/9] staging: r8188eu: remove HW_VAR_BCN_VALID from SetHwReg8188EU()
Date: Mon, 28 Mar 2022 13:39:40 +0200
Message-Id: <20220328113940.6396-10-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328113940.6396-1-straube.linux@gmail.com>
References: <20220328113940.6396-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HW_VAR_BCN_VALID case in SetHwReg8188EU() just calls rtw_write8().
Remove HW_VAR_BCN_VALID from SetHwReg8188EU() and call rtw_write8()
directly. This is part of the ongoing effort to getrid of the unwanted
hal layer.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c |  5 ++++-
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c  | 12 ++++++++----
 drivers/staging/r8188eu/hal/usb_halinit.c   |  4 ----
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index b5c2e7d4cb48..313e1a3beecb 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -5765,7 +5765,10 @@ unsigned int send_beacon(struct adapter *padapter)
 
 	u32 start = jiffies;
 
-	SetHwReg8188EU(padapter, HW_VAR_BCN_VALID, NULL);
+	/* Clear beacon valid check bit. */
+	/* BIT(16) of REG_TDECTRL = BIT(0) of REG_TDECTRL+2, write 1 to clear, Clear by sw */
+	rtw_write8(padapter, REG_TDECTRL + 2, rtw_read8(padapter, REG_TDECTRL + 2) | BIT(0));
+
 	do {
 		issue_beacon(padapter, 100);
 		issue++;
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
index f1464e4ba429..f58284eba70a 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
@@ -557,8 +557,9 @@ void rtl8188e_set_FwJoinBssReport_cmd(struct adapter *adapt, u8 mstatus)
 		rtw_write8(adapt, REG_FWHW_TXQ_CTRL + 2, (haldata->RegFwHwTxQCtrl & (~BIT(6))));
 		haldata->RegFwHwTxQCtrl &= (~BIT(6));
 
-		/*  Clear beacon valid check bit. */
-		SetHwReg8188EU(adapt, HW_VAR_BCN_VALID, NULL);
+		/* Clear beacon valid check bit. */
+		/* BIT(16) of REG_TDECTRL = BIT(0) of REG_TDECTRL+2, write 1 to clear, Clear by sw */
+		rtw_write8(adapt, REG_TDECTRL + 2, rtw_read8(adapt, REG_TDECTRL + 2) | BIT(0));
 		DLBcnCount = 0;
 		poll = 0;
 		do {
@@ -596,8 +597,11 @@ void rtl8188e_set_FwJoinBssReport_cmd(struct adapter *adapt, u8 mstatus)
 		}
 
 		/*  Update RSVD page location H2C to Fw. */
-		if (bcn_valid)
-			SetHwReg8188EU(adapt, HW_VAR_BCN_VALID, NULL);
+		if (bcn_valid) {
+			/* Clear beacon valid check bit. */
+			/* BIT(16) of REG_TDECTRL = BIT(0) of REG_TDECTRL+2, write 1 to clear, Clear by sw */
+			rtw_write8(adapt, REG_TDECTRL + 2, rtw_read8(adapt, REG_TDECTRL + 2) | BIT(0));
+		}
 
 		/*  Do not enable HW DMA BCN or it will cause Pcie interface hang by timing issue. 2011.11.24. by tynli. */
 		/*  Clear CR[8] or beacon packet will not be send to TxBuf anymore. */
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 4be5c5ed8711..8bff4c6c29cf 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1281,10 +1281,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 	case HW_VAR_H2C_MEDIA_STATUS_RPT:
 		rtl8188e_set_FwMediaStatus_cmd(Adapter, (*(__le16 *)val));
 		break;
-	case HW_VAR_BCN_VALID:
-		/* BCN_VALID, BIT(16) of REG_TDECTRL = BIT(0) of REG_TDECTRL+2, write 1 to clear, Clear by sw */
-		rtw_write8(Adapter, REG_TDECTRL + 2, rtw_read8(Adapter, REG_TDECTRL + 2) | BIT(0));
-		break;
 	default:
 		break;
 	}
-- 
2.35.1


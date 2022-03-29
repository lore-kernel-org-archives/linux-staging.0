Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89B0258C
	for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 20:21:56 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id bq8so23469910ejb.10
        for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 13:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vc+8XpUtyVNiqLLtoPnfC057JfZKwxN2NzxO5NmDbTM=;
        b=J8KvhlYAxm+Jnh6RGzMUCOrR7LASjHDjKLf5jrdb7ibPS1BGAOderi0ICuiQLOoWyM
         O64NUJJ4vQsUb3dhKCJmgbTPbtzGWo/hteuB/MPqXsZak+nvNHyoaVJ5btw1AAG0jiun
         Hmuod6ahu8v1xcFS1CnWVL/k7aP4sXme7RHzBSSRzNeSD0HG5P/F5Umq3x+kkN8gjjnB
         sg16FIP0gKIezve0rP45KcMue2wfubsDIQQm5bqQpPJg4ZcewjJnLZVVIC2KTGMXSCTI
         KDuRbsGbxAvg3IDqHj9rs5gse7S/pfXRFWRKKFYBJjKW7FfL5Hx7s8v7+8+JgvuSsejk
         drzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vc+8XpUtyVNiqLLtoPnfC057JfZKwxN2NzxO5NmDbTM=;
        b=6152re4cPzqC78qL7F0mbHypDkM7PzTU/PCASaygHD0trwvjEEgiLWrXgDbp8DlKt0
         ts5kcUW+8RRBpJHWzXjaCVJCs8vQ8k1pF7xF4jvFIwKvPVwytNdiljntDFp4qIDDfitP
         2HrjxDyPf0y1yWFnyJwy6DMzcZtzl7xBGTcbgrm4FNo2z62sGiKq+R2MsWwGfa+vny8L
         HAVWewtAuTqYFRA8F8H8JUsvWa6lYU08ga5JH1rj11vRLVojGb52OVBluH+dDgvQ6mqi
         37Ug3zLBOQSmU5nfa5HzgDRcKUGB+B1p8iTGpV4biTsMsw1l/oAbqHXmr8Z0Oi66Q3eg
         Zh1w==
X-Gm-Message-State: AOAM530XQ77leoES0Mw5ggVdTx5ihnnUsGtfoJIhIwkfjr1Qev5IrqzX
	zwkjpsnoVF767AAH9cvMvI0=
X-Google-Smtp-Source: ABdhPJyPSqTxbQ86DNXVq4dHPCjZDaRIOKjLwbjGpyYpgcIHWvJQhPQXPaahdJCFxV1EyoV45FqJBQ==
X-Received: by 2002:a17:907:6d96:b0:6df:f199:6a7c with SMTP id sb22-20020a1709076d9600b006dff1996a7cmr37449982ejc.137.1648585315340;
        Tue, 29 Mar 2022 13:21:55 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id ss12-20020a170907038c00b006e0ec9e806dsm3938111ejb.136.2022.03.29.13.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 13:21:54 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 8/8] staging: r8188eu: remove HW_VAR_BCN_VALID from SetHwReg8188EU()
Date: Tue, 29 Mar 2022 22:21:41 +0200
Message-Id: <20220329202141.7028-9-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329202141.7028-1-straube.linux@gmail.com>
References: <20220329202141.7028-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HW_VAR_BCN_VALID case in SetHwReg8188EU() just calls rtw_write8().
Remove HW_VAR_BCN_VALID from SetHwReg8188EU() and call rtw_write8()
directly. Move the call to a new function to indicate what it actually
does. This is part of the ongoing effort to getrid of the unwanted hal
layer.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v2: Moved the code into a function.

 drivers/staging/r8188eu/core/rtw_mlme_ext.c    | 9 ++++++++-
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c     | 5 ++---
 drivers/staging/r8188eu/hal/usb_halinit.c      | 4 ----
 drivers/staging/r8188eu/include/rtw_mlme_ext.h | 1 +
 4 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 9df87a878121..ef14a960c861 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -5764,7 +5764,8 @@ unsigned int send_beacon(struct adapter *padapter)
 
 	u32 start = jiffies;
 
-	SetHwReg8188EU(padapter, HW_VAR_BCN_VALID, NULL);
+	clear_bacon_valid_bit(padapter);
+
 	do {
 		issue_beacon(padapter, 100);
 		issue++;
@@ -5786,6 +5787,12 @@ unsigned int send_beacon(struct adapter *padapter)
 	}
 }
 
+void clear_bacon_valid_bit(struct adapter *adapter)
+{
+	/* BIT(16) of REG_TDECTRL = BIT(0) of REG_TDECTRL+2, write 1 to clear, Clear by sw */
+	rtw_write8(adapter, REG_TDECTRL + 2, rtw_read8(adapter, REG_TDECTRL + 2) | BIT(0));
+}
+
 /****************************************************************************
 
 Following are some utitity fuctions for WiFi MLME
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
index f1464e4ba429..a7337954891a 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
@@ -557,8 +557,7 @@ void rtl8188e_set_FwJoinBssReport_cmd(struct adapter *adapt, u8 mstatus)
 		rtw_write8(adapt, REG_FWHW_TXQ_CTRL + 2, (haldata->RegFwHwTxQCtrl & (~BIT(6))));
 		haldata->RegFwHwTxQCtrl &= (~BIT(6));
 
-		/*  Clear beacon valid check bit. */
-		SetHwReg8188EU(adapt, HW_VAR_BCN_VALID, NULL);
+		clear_bacon_valid_bit(adapt);
 		DLBcnCount = 0;
 		poll = 0;
 		do {
@@ -597,7 +596,7 @@ void rtl8188e_set_FwJoinBssReport_cmd(struct adapter *adapt, u8 mstatus)
 
 		/*  Update RSVD page location H2C to Fw. */
 		if (bcn_valid)
-			SetHwReg8188EU(adapt, HW_VAR_BCN_VALID, NULL);
+			clear_bacon_valid_bit(adapt);
 
 		/*  Do not enable HW DMA BCN or it will cause Pcie interface hang by timing issue. 2011.11.24. by tynli. */
 		/*  Clear CR[8] or beacon packet will not be send to TxBuf anymore. */
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index a3c955e54321..0330947e0106 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1277,10 +1277,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
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
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index bab6eeae6fc9..6974c7ffafde 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -538,6 +538,7 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr,
 		     unsigned char action, unsigned short status);
 unsigned int send_delba(struct adapter *padapter, u8 initiator, u8 *addr);
 unsigned int send_beacon(struct adapter *padapter);
+void clear_bacon_valid_bit(struct adapter *adapter);
 
 void start_clnt_assoc(struct adapter *padapter);
 void start_clnt_auth(struct adapter *padapter);
-- 
2.35.1


Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912CC20E3
	for <linux-staging@lists.linux.dev>; Fri, 15 Jul 2022 06:29:19 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id os14so7281730ejb.4
        for <linux-staging@lists.linux.dev>; Thu, 14 Jul 2022 23:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y4Hu8b7EBTiadfTtEnPvDOCRgZybaDcXil1RG7XF6OY=;
        b=ONow5fB2vcsaJp8j56tTryta/5uItziKuyvgkpSP7ESV9V5gN69EpFc6y0R6Er88bP
         LMbXNPuCnyX279o8C1WioWbl9tgatsaTzDouH0B0dD+HCxiF+NsOvNCyJNfklvnTF77I
         qtN3zDrdc8FdkjqLAICOKPF7Q6E61ULFCl3KkA4XO7HjP/KfOkp6PW4VBOPHKtG/xwrl
         GG2rQt/7+FwtbX819GYEM/fK9nzkaNBklNj1Hpq5+UB+AKQn1v2epKUIWBiRGgBgvuk+
         EWvFVEfKEwGEOvtUmhGlqaZKhOmPVRl2IwAIvMq8nrXMvk4Qo+CAmRPy0VQ/RH460pOC
         SjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y4Hu8b7EBTiadfTtEnPvDOCRgZybaDcXil1RG7XF6OY=;
        b=6IYub8P0ZcqttfNxjzGLfBFhbB142I1OjM2L3t6qGwt1USMR6nVeHpEQreXmZ853l9
         h2nY67P+/YNosA+0Wr1DUGIRgYCdqi8Zm5TObEAvuvE72LgJG16KiezV2u76s3kwbDoy
         J2BDBFiET0uFkBTTzu+0OgG6JOJRMUg7OYPsD5piTOnOsXCc9qOhy9vJOVasmY7lRtwB
         73kGVI9zoJ9ljtyoApsC86tvKV/GyAPPLHsDdWGY2QyiYXCqAhbQOrA7BqYnBXIaGWZG
         D+YpXwvVTBLg7QyG8E6OWcteVUW+tYP6FL8qz6pRhaOk2eY8/xn7A5UngAXktfoE5Y70
         4QYg==
X-Gm-Message-State: AJIora9ttm+xlKTqz/qZhHobomhnezVIxxr/sQcfodU++dWpPC2gT4+p
	qMpw3nyfMdqgyT65uySRPiE=
X-Google-Smtp-Source: AGRyM1vYPpY44y0QXNnch/6A5ygtFGZWhFnKkKfdA59ZFQ5aTgOGP2+Rq8XUE4wa0aZ8Zwwh/yFTyw==
X-Received: by 2002:a17:907:9613:b0:72b:68df:8ada with SMTP id gb19-20020a170907961300b0072b68df8adamr12582278ejc.31.1657866557937;
        Thu, 14 Jul 2022 23:29:17 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb91.dynamic.kabel-deutschland.de. [95.90.187.145])
        by smtp.gmail.com with ESMTPSA id ku5-20020a170907788500b007262a5e2204sm1614515ejc.153.2022.07.14.23.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 23:29:17 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/5] staging: r8188eu: make update_TSF() and correct_TSF() static
Date: Fri, 15 Jul 2022 08:29:07 +0200
Message-Id: <20220715062908.8547-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220715062908.8547-1-straube.linux@gmail.com>
References: <20220715062908.8547-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions update_TSF() and correct_TSF() are only used in
rtw_mlme_ext.c. Make them static.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 20 +++++++++++++++++++
 drivers/staging/r8188eu/core/rtw_wlan_util.c  | 20 -------------------
 .../staging/r8188eu/include/rtw_mlme_ext.h    |  3 ---
 3 files changed, 20 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index c23be5d9eaaf..7b69d9ad75e9 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -428,6 +428,26 @@ static u32 p2p_listen_state_process(struct adapter *padapter, unsigned char *da)
 	return _SUCCESS;
 }
 
+static void update_TSF(struct mlme_ext_priv *pmlmeext, u8 *pframe)
+{
+	u8 *pIE;
+	__le32 *pbuf;
+
+	pIE = pframe + sizeof(struct ieee80211_hdr_3addr);
+	pbuf = (__le32 *)pIE;
+
+	pmlmeext->TSFValue = le32_to_cpu(*(pbuf + 1));
+
+	pmlmeext->TSFValue = pmlmeext->TSFValue << 32;
+
+	pmlmeext->TSFValue |= le32_to_cpu(*pbuf);
+}
+
+static void correct_TSF(struct adapter *padapter)
+{
+	SetHwReg8188EU(padapter, HW_VAR_CORRECT_TSF, NULL);
+}
+
 /****************************************************************************
 
 Following are the callback functions for each subtype of the management frames
diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index 9e920a320d71..3a002cb6834f 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -1571,26 +1571,6 @@ int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie, uint var_ie_l
 	return _SUCCESS;
 }
 
-void update_TSF(struct mlme_ext_priv *pmlmeext, u8 *pframe)
-{
-	u8 *pIE;
-	__le32 *pbuf;
-
-	pIE = pframe + sizeof(struct ieee80211_hdr_3addr);
-	pbuf = (__le32 *)pIE;
-
-	pmlmeext->TSFValue = le32_to_cpu(*(pbuf + 1));
-
-	pmlmeext->TSFValue = pmlmeext->TSFValue << 32;
-
-	pmlmeext->TSFValue |= le32_to_cpu(*pbuf);
-}
-
-void correct_TSF(struct adapter *padapter)
-{
-	SetHwReg8188EU(padapter, HW_VAR_CORRECT_TSF, NULL);
-}
-
 void beacon_timing_control(struct adapter *padapter)
 {
 	SetBeaconRelatedRegisters8188EUsb(padapter);
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index 54384b4c6b1a..bf952755ba35 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -596,9 +596,6 @@ void addba_timer_hdl(struct sta_info *psta);
 bool cckrates_included(unsigned char *rate, int ratelen);
 bool cckratesonly_included(unsigned char *rate, int ratelen);
 
-void update_TSF(struct mlme_ext_priv *pmlmeext, u8 *pframe);
-void correct_TSF(struct adapter *padapter);
-
 struct cmd_hdl {
 	uint	parmsize;
 	u8 (*h2cfuns)(struct adapter  *padapter, u8 *pbuf);
-- 
2.37.0


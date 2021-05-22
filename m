Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5A76D00
	for <linux-staging@lists.linux.dev>; Sat, 22 May 2021 09:20:35 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id v14so13444524pgi.6
        for <linux-staging@lists.linux.dev>; Sat, 22 May 2021 02:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=32vletY3W6qZdcYy8jDbXQ8gIV4bJm8FuAU2OUrb+YU=;
        b=SUuT+ZZc5yxcDpgMugTkttudmrOTqfX9jlbKvEixlyWo7fp/zhSazrFRq5+7W2pPsy
         5DcyX7Q716Kx8opAoGsoLkTLKZXzmahmNiE2/Bq2qPPNSpRvytEa2w8F0JaL3UNjOGCP
         UJ8y20JCS3CchwKKQowDj3kWBcAYV+jvAo7zdnnZoEenxqWEqgNVkTmh5Zv23gj72N0v
         M3PkYm/TmhZO50cXd3FIBVj954n4/KIkcl1Axl18z37XpwnSQHYo6KDxkGO2WbK67K3I
         qcJkEbdWJcYD+ivjjHoAxhzB6pcDMy47omEYE+IYV44VpbcsJgWq9Rp54GllbUwS7DyX
         LM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=32vletY3W6qZdcYy8jDbXQ8gIV4bJm8FuAU2OUrb+YU=;
        b=Qc2bDxiuh3wf4oP0HMy5SyUw51tEQU4i3SihGWl3nIsNwzomjJsHU9KO3RvMc0CH5l
         Y3x1ni8Eflo4IP7RCHWoAQyAiZWdSQGq8a8ctgtUjQlOMUEA/KCFcV/aLXA6r9T6qbys
         pAsh8y8ZyOab70E67DQmNhsI+OuibhXNy5ylo6+T8m3qM3t017E5/Qmcbn6u5D0IHQOr
         lNvZ4z+VB12N2x2ND9YH2spvLe21IPZwulFOh/WFTtlPz/AGKAFViJ1w31EeagRzAxZq
         Oj2HMJNSsTpPGyNhejRioMVDYWU70iHdD2gb7/oknPEEXS42SONisBI+wNrL5hsu4G2t
         2JYw==
X-Gm-Message-State: AOAM530Dhp/qtMneRZAolWpldGVU8k0+cALbneqYcooSro2NI/dIc41F
	iFQVWJvEP8VmHRuxo9vYvrc=
X-Google-Smtp-Source: ABdhPJy9LzfS206ryLhV0B6RtgZr3zue+cdoJjvvYFQTAbnlzRl0V5yKZgTP+sMawyb1QEggF14tag==
X-Received: by 2002:aa7:80d3:0:b029:28e:f117:4961 with SMTP id a19-20020aa780d30000b029028ef1174961mr14828606pfn.37.1621675235297;
        Sat, 22 May 2021 02:20:35 -0700 (PDT)
Received: from fedora.. ([2405:201:6000:a04d:2131:362f:d566:c9d5])
        by smtp.googlemail.com with ESMTPSA id gt23sm5925752pjb.13.2021.05.22.02.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 May 2021 02:20:34 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
To: gregkh@linuxfoundation.org,
	fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com,
	straube.linux@gmail.com
Cc: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [Resend] [PATCH 1/2] [RFC] staging: rtl8723bs: refactor to reduce indents
Date: Sat, 22 May 2021 14:50:23 +0530
Message-Id: <20210522092024.65018-2-chouhan.shreyansh630@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210522092024.65018-1-chouhan.shreyansh630@gmail.com>
References: <20210522092024.65018-1-chouhan.shreyansh630@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reduce the number of indents in rtw_wlan_util.c file by refactoring the
code.

Moved the part of code that rearranged ac paramaters in the function
WMMOnAssocResp to a separate function named sort_wmm_ac_params. It takes
both the array of ac params and their indexes as arguments and sorts them.
Has return type void.

Moved the part of code that checked for the realtek vendor in the
function check_assoc_AP to a separate function named
get_realtek_assoc_AP_vender. It takes a pointer to struct
ndis_80211_var_ie as an argument and returns a u32 realtek vendor.

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
---
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 108 +++++++++---------
 1 file changed, 56 insertions(+), 52 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index ce47ef4edea0..36e515a7ab5c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -777,6 +777,32 @@ int WMM_param_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
 	return true;
 }
 
+static void sort_wmm_ac_params(u32 *inx, u32 *edca)
+{
+	u32 i, j, change_inx = false;
+
+	/* entry indx: 0->vo, 1->vi, 2->be, 3->bk. */
+	for (i = 0; i < 4; i++) {
+		for (j = i + 1; j < 4; j++) {
+			/* compare CW and AIFS */
+			if ((edca[j] & 0xFFFF) < (edca[i] & 0xFFFF)) {
+				change_inx = true;
+			} else if ((edca[j] & 0xFFFF) == (edca[i] & 0xFFFF)) {
+				/* compare TXOP */
+				if ((edca[j] >> 16) > (edca[i] >> 16))
+					change_inx = true;
+			}
+
+			if (change_inx) {
+				swap(edca[i], edca[j]);
+				swap(inx[i], inx[j]);
+
+				change_inx = false;
+			}
+		}
+	}
+}
+
 void WMMOnAssocRsp(struct adapter *padapter)
 {
 	u8 ACI, ACM, AIFS, ECWMin, ECWMax, aSifsTime;
@@ -873,35 +899,8 @@ void WMMOnAssocRsp(struct adapter *padapter)
 
 		inx[0] = 0; inx[1] = 1; inx[2] = 2; inx[3] = 3;
 
-		if (pregpriv->wifi_spec == 1) {
-			u32 j, tmp, change_inx = false;
-
-			/* entry indx: 0->vo, 1->vi, 2->be, 3->bk. */
-			for (i = 0; i < 4; i++) {
-				for (j = i+1; j < 4; j++) {
-					/* compare CW and AIFS */
-					if ((edca[j] & 0xFFFF) < (edca[i] & 0xFFFF)) {
-						change_inx = true;
-					} else if ((edca[j] & 0xFFFF) == (edca[i] & 0xFFFF)) {
-						/* compare TXOP */
-						if ((edca[j] >> 16) > (edca[i] >> 16))
-							change_inx = true;
-					}
-
-					if (change_inx) {
-						tmp = edca[i];
-						edca[i] = edca[j];
-						edca[j] = tmp;
-
-						tmp = inx[i];
-						inx[i] = inx[j];
-						inx[j] = tmp;
-
-						change_inx = false;
-					}
-				}
-			}
-		}
+		if (pregpriv->wifi_spec == 1)
+			sort_wmm_ac_params(inx, edca);
 
 		for (i = 0; i < 4; i++)
 			pxmitpriv->wmm_para_seq[i] = inx[i];
@@ -1496,6 +1495,33 @@ void set_sta_rate(struct adapter *padapter, struct sta_info *psta)
 	Update_RA_Entry(padapter, psta);
 }
 
+static u32 get_realtek_assoc_AP_vender(struct ndis_80211_var_ie *pIE)
+{
+	u32 Vender = HT_IOT_PEER_REALTEK;
+
+	if (pIE->Length >= 5) {
+		if (pIE->data[4] == 1)
+			/* if (pIE->data[5] & RT_HT_CAP_USE_LONG_PREAMBLE) */
+			/* bssDesc->BssHT.RT2RT_HT_Mode |= RT_HT_CAP_USE_LONG_PREAMBLE; */
+			if (pIE->data[5] & RT_HT_CAP_USE_92SE)
+				/* bssDesc->BssHT.RT2RT_HT_Mode |= RT_HT_CAP_USE_92SE; */
+				Vender = HT_IOT_PEER_REALTEK_92SE;
+
+		if (pIE->data[5] & RT_HT_CAP_USE_SOFTAP)
+			Vender = HT_IOT_PEER_REALTEK_SOFTAP;
+
+		if (pIE->data[4] == 2) {
+			if (pIE->data[6] & RT_HT_CAP_USE_JAGUAR_BCUT)
+				Vender = HT_IOT_PEER_REALTEK_JAGUAR_BCUTAP;
+
+			if (pIE->data[6] & RT_HT_CAP_USE_JAGUAR_CCUT)
+				Vender = HT_IOT_PEER_REALTEK_JAGUAR_CCUTAP;
+		}
+	}
+
+	return Vender;
+}
+
 unsigned char check_assoc_AP(u8 *pframe, uint len)
 {
 	unsigned int	i;
@@ -1519,29 +1545,7 @@ unsigned char check_assoc_AP(u8 *pframe, uint len)
 			} else if (!memcmp(pIE->data, CISCO_OUI, 3)) {
 				return HT_IOT_PEER_CISCO;
 			} else if (!memcmp(pIE->data, REALTEK_OUI, 3)) {
-				u32 Vender = HT_IOT_PEER_REALTEK;
-
-				if (pIE->Length >= 5) {
-					if (pIE->data[4] == 1)
-						/* if (pIE->data[5] & RT_HT_CAP_USE_LONG_PREAMBLE) */
-						/* bssDesc->BssHT.RT2RT_HT_Mode |= RT_HT_CAP_USE_LONG_PREAMBLE; */
-						if (pIE->data[5] & RT_HT_CAP_USE_92SE)
-							/* bssDesc->BssHT.RT2RT_HT_Mode |= RT_HT_CAP_USE_92SE; */
-							Vender = HT_IOT_PEER_REALTEK_92SE;
-
-					if (pIE->data[5] & RT_HT_CAP_USE_SOFTAP)
-						Vender = HT_IOT_PEER_REALTEK_SOFTAP;
-
-					if (pIE->data[4] == 2) {
-						if (pIE->data[6] & RT_HT_CAP_USE_JAGUAR_BCUT)
-							Vender = HT_IOT_PEER_REALTEK_JAGUAR_BCUTAP;
-
-						if (pIE->data[6] & RT_HT_CAP_USE_JAGUAR_CCUT)
-							Vender = HT_IOT_PEER_REALTEK_JAGUAR_CCUTAP;
-					}
-				}
-
-				return Vender;
+				return get_realtek_assoc_AP_vender(pIE);
 			} else if (!memcmp(pIE->data, AIRGOCAP_OUI, 3)) {
 				return HT_IOT_PEER_AIRGO;
 			} else {
-- 
2.31.1


Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A923195E3
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 08:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769674020; cv=none; b=SIhNiK/60ouU4G4lsrBlQ2PnzrlEWLAtOAe60fVDZRAwY4/NNufyTBfP1Vr0twfY8dPRGM1mHbF/Gi5uOEPJNhIHbaJt1sTY8SQQiPms1Ls1JgK3g4wBZ33URUW5ZmocqES8BYLkoTeD042uWsNSuImoSlIybpSEy6CkHm6BObY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769674020; c=relaxed/simple;
	bh=4naTu1i37tuBzAwWmiqQ+8T7e2n7EUQU0Pl5QJ1hgVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tjmCTpVy4Kpr62CaX7t4RfmkeUK6s718wHN+/RdhX2M3SSdQtgPvYwB/lrNGikMUTaoMhGtvhM3PY4tWOhz7VODaEKbg1SeRWTW4e29lmgjHKaMQjZRToUQS0uHANKbemBHOw1F1NVQHq9OERPTEmPJyqzMSHGR2rVkCrR+xb3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1bPYDgi; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1bPYDgi"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a1022dda33so3840195ad.2
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 00:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769674019; x=1770278819; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFwht3Bh53ospZEdeEaFl61TP1c0Tumxe4gtDU8Xkzs=;
        b=J1bPYDgifPkZj5y7keuHu1aVKDSPLCcOw4RdF3ZeABvctk7Z3ESu/dZmLYvZdXAi7A
         Oh2kzdjZYhJfY7Fa8zmoB5YqHjKRJVohosDvhZ6QNlQrmIFWk4Q4X/XAlhX+YnFLLHEN
         CwMbNKgIGsU5fJp63ziXOOXRAAEutBeJ4qucHNIXsL2Tmmjk5QHOxqbTF+w29N/aqPQQ
         Yt2IaR/Vllc1nEwYQUVeTPQKWWTtb32dhioWL9nxHCpnRr6FltdWmlnitJ65FI9ymLxw
         zOglEPf6MSag2MJPDx+lnw+HIoGixabD0C46q1rVf61HGYD2Kyi5LtplN8n0mvbn6Ifq
         6rsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769674019; x=1770278819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YFwht3Bh53ospZEdeEaFl61TP1c0Tumxe4gtDU8Xkzs=;
        b=mzAgl+veQ+GIFpmYHZXr+KUay5Dri994ljT6sFjewGyMqNyk7qtxOSMjnPT2HK7KgJ
         GQBsYCPyiehcxFv+jUAEtnh6b6V/DG0seFsVX81KXIgnIq4Z34i7A+i05EXoNl80wJXg
         0CfxvdneK9+Ifj+lAGnMs3UvgZXcSWiN90dLG3+kD/Vx3fBFfCxWNAi5DgmdCwDV0DAg
         0ZUkMCBumeI8bFo380sI6BmGS9SGxnqQZ6JIGyAyZq+TF4OpKHYefZzFSSD/D4wGH9pV
         EP3076aPkf1x5RKhQ/cMvOsdvz61NLZrkg7oj2+KjcSTwSCJMqFocF0PrsPRisTf/hfF
         zosg==
X-Gm-Message-State: AOJu0Yx7T8E6GXMsi3d5XM9IB6H8oJJamhk0xibzqrH0U1hM2SyG2If5
	VBL7AN0g8P8LMkqIdz/19m0/7kseDLycC2fty0FlADUszlKvgG9aWRWb
X-Gm-Gg: AZuq6aK6OJli/o1w0BX34VqIi1Awe1yZZmkx5tpdBnCu14HV2HwP81Bl9wbTBKb8Eep
	Xbu6RVe4JXfO2KsM554OizSX214XSp7dnyAt7xxLA/ml3PUYkL7KSA7fCMKL60VlCs1ObGmw5rl
	PG69sd26CgYvaIzEl/Y/dkhcAvHXlEugzcx50/nTEm5ETe6sYukIiEJSgSgu/p2FuBrU/9ADEww
	hr9Zew0WIGfBsXpWzzbmNurJApGv/xOEfOYnnqPiKDQiF7aMZ3YEapXad8+/WT+2i2EegkcOzEy
	1UHkVwc9xyAKdxs8j2KrK1MVrbBNtv+DI2KAeQJJtkM5gziVHIIA9TtfXh8M62B7x6IK/1vIiJ7
	rXLoQ8P2XMG7BVxoK0/LTExCgYSL6AgTDz+eUi+YuZZNHEwthIUXJeAa1z/gFZpPC7ewgH55u/J
	lNe/AiJfct6UG1yU0z8oRohC8u3h/MhFTY
X-Received: by 2002:a17:903:1b08:b0:2a0:81c1:6194 with SMTP id d9443c01a7336-2a870dd80b9mr76696405ad.47.1769674018747;
        Thu, 29 Jan 2026 00:06:58 -0800 (PST)
Received: from tehuang-Alienware-m16-R2.. ([50.47.240.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8a039812dsm29394555ad.100.2026.01.29.00.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 00:06:58 -0800 (PST)
From: Michael Huang <tehsiu.huang@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>,
	Joe Perches <joe@perches.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Huang <tehsiu.huang@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: refactor BSS Coexistence channel report logic
Date: Thu, 29 Jan 2026 00:01:10 -0800
Message-ID: <20260129080110.73884-1-tehsiu.huang@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aXsEd2bzf35y8i_E@stanley.mountain>
References: <aXsEd2bzf35y8i_E@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the 'ICS' array in issue_action_BSSCoexistPacket() to improve
readability and maintainability. This addresses technical debt related
to magic numbers and ambiguous array usage.

The original implementation used a multi-purpose 2D array (ICS[8][15])
where magic numbers were prevalent and the first element of each row
was overloaded as a status flag. This patch:

- Introduces descriptive macros: BSS_COEX_MAX_CLASSES,
  BSS_COEX_MAX_CHANNELS, and BSS_COEX_MAX_INFO_LEN.
- Splits the overloaded array into two distinct boolean arrays:
  'class_active' (for group status) and 'ch_present' (for channel data).
- Converts the logic to use 'bool' types and 0-indexed loops,
  conforming to standard C programming practices.
- Adds defensive boundary checks (ch > 0 && ch < MAX) to ensure
  robustness against unexpected channel data.

This refactoring maintains the current 2.4GHz reporting behavior while
providing a structured and extensible foundation for future Operating
Class support according to IEEE 802.11 specifications.

Signed-off-by: Michael Huang <tehsiu.huang@gmail.com>
---

v2:
  - Use kernel-style = {} for array initialization per Dan Carpenter.
  - Separate flags from data using bool arrays per Joe Perches.
  - Fix magic numbers with proper defines.
  - Retained the 2D structure for 'ch_present' despite only using class 0
    for now. This aligns with the IEEE 802.11 Regulatory Class/Channel 
    List hierarchy, making the code easier to map to the specification 
    and extensible for future operating class support.

v1:
  - Initial refactoring of the ICS array logic.

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 41 +++++++------------
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  3 ++
 2 files changed, 18 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 884fcce50d9c..dc2677275e0f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -3587,8 +3587,9 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct __queue		*queue	= &(pmlmepriv->scanned_queue);
-	u8 InfoContent[16] = {0};
-	u8 ICS[8][15];
+	u8 InfoContent[BSS_COEX_MAX_INFO_LEN] = {};
+	bool class_active[BSS_COEX_MAX_CLASSES] = {};
+	bool ch_present[BSS_COEX_MAX_CLASSES][BSS_COEX_MAX_CHANNELS] = {};
 
 	if ((pmlmepriv->num_FortyMHzIntolerant == 0) || (pmlmepriv->num_sta_no_ht == 0))
 		return;
@@ -3642,7 +3643,6 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 
 
 	/*  */
-	memset(ICS, 0, sizeof(ICS));
 	if (pmlmepriv->num_sta_no_ht > 0) {
 		int i;
 
@@ -3667,46 +3667,35 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 
 			p = rtw_get_ie(pbss_network->ies + _FIXED_IE_LENGTH_, WLAN_EID_HT_CAPABILITY, &len, pbss_network->ie_length - _FIXED_IE_LENGTH_);
 			if (!p || len == 0) {/* non-HT */
+				u8 ch = pbss_network->configuration.ds_config;
 
-				if (pbss_network->configuration.ds_config <= 0)
-					continue;
-
-				ICS[0][pbss_network->configuration.ds_config] = 1;
-
-				if (ICS[0][0] == 0)
-					ICS[0][0] = 1;
+				if (ch > 0 && ch < BSS_COEX_MAX_CHANNELS) {
+					ch_present[0][ch] = true;
+					class_active[0] = true;
+				}
 			}
 
 		}
 
 		spin_unlock_bh(&(pmlmepriv->scanned_queue.lock));
 
-
-		for (i = 0; i < 8; i++) {
+		for (i = 0; i < BSS_COEX_MAX_CLASSES; i++) {
 			int j, k = 0;
 
-			if (ICS[i][0] != 1)
+			if (!class_active[i])
 				continue;
 
-			InfoContent[k] = i;
+			InfoContent[k++] = i;
 			/* SET_BSS_INTOLERANT_ELE_REG_CLASS(InfoContent, i); */
-			k++;
 
-			for (j = 1; j <= 14; j++) {
-				if (ICS[i][j] != 1)
-					continue;
-
-				if (k < 16) {
-					InfoContent[k] = j; /* channel number */
-					/* SET_BSS_INTOLERANT_ELE_CHANNEL(InfoContent+k, j); */
-					k++;
+			for (j = 0; j < BSS_COEX_MAX_CHANNELS; j++) {
+				if (ch_present[i][j]) {
+					if (k < BSS_COEX_MAX_INFO_LEN)
+						InfoContent[k++] = j; /* channel number */
 				}
 			}
-
 			pframe = rtw_set_ie(pframe, WLAN_EID_BSS_INTOLERANT_CHL_REPORT, k, InfoContent, &(pattrib->pktlen));
-
 		}
-
 	}
 
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index dd5080056e58..3a1067d6f164 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -41,6 +41,9 @@
 #define _HW_STATE_STATION_	0x02
 #define _HW_STATE_AP_			0x03
 
+#define BSS_COEX_MAX_CLASSES	8
+#define BSS_COEX_MAX_CHANNELS	15
+#define BSS_COEX_MAX_INFO_LEN	16
 
 #define		_1M_RATE_	0
 #define		_2M_RATE_	1
-- 
2.43.0


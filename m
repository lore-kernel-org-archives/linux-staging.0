Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B239D25771
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 20:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769633124; cv=none; b=dzbay2mpSPhnoAOFkuKP2t5RD0kJtDbyDcMPjpyHfuhlS17OvldJKJIhYqUNSJQr474igrJ/r/Zo+vU2D+eX4aixLAsxwZdsdaKcSic8TfcIFMmdpX3sanHmg8LarDsZ5Y6diDCYA68pKjFtC1BqvooHDFXLtmSknpuBChZGudM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769633124; c=relaxed/simple;
	bh=ZYyUKN9p3PrUqQX/m6rx4VI4F3mHghv24h88NCaOZpU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QbSeaD3taD1ZpCR97HxgzOsSOI07XQUahFhmxQoH+qXNJyBAjDLfKFkmPbAE4h22TK1iyS7rlkOo5UPFu/FL482j17z8taYdgPurwn7mY5tgtEWSvKNR9LDkCMeI0juUS6QT1cxgEg4AjwP/R8IMhR3tlwBNwIaFXI5laQugc1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EoGaePO4; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EoGaePO4"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c075ec1a58aso96082a12.0
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 12:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769633122; x=1770237922; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=29Q5Wv+RhO5624ZMe7qIrVSuQL+rizLiHQMdD29EGs8=;
        b=EoGaePO42CB50FV5fboePikAwU68yZRjM88pLM95KEPmX90YFlYb7mkeLaceIpIPN5
         R961Q55719wcCIRopGv70Hq4iYQlnrD54OQgtAZbkI5uzePZ7Ux2Oa0RO3GKU8XC2D9F
         hQjXPczQTSrTH9Z6gcwQKUZLTL+tbr19QpzVTQCXTWfsxDyAsfKik4sCi5xMN/thafVA
         bStG7ZD5bhdiWIXgwMgg03c1KQA1//e2nrNObc0BtbKuyS+Mhty/k0F7vNMt26fXpBDa
         zV3rK2popm/NoEzlk0lfJV5vwlPP2gkn+J++xucJDzYHSwnNbNuy5VB1EatFAWaCzuin
         SXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769633122; x=1770237922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29Q5Wv+RhO5624ZMe7qIrVSuQL+rizLiHQMdD29EGs8=;
        b=s5eK1+l9UbtUUqoDiCCyAJUJW1jDYdOy6opDzXpuWw6lntUTVOlFeIqTLFdzVPRbNg
         uF2E0BCQWGkO3lGNaGGIeWk9gYzu7LBdVHJAtn1RX4pOpCyD/l7x6fywJYkn0uZTI3Yi
         SvcSPrO7l+49xmBcjI30eT69jIqWIaBysdj884XxoBYdOoiaL1D1JjOT2nClfBRVTSXQ
         DC5G3+iKtivx/LzNZiL2vJp9dWAJ0UgJej01ndYvN4KH4Zai5JCyD4NAL4y20uHswkKK
         TQo8qVfuuu5iSJEgMLqnvz2Q6wBh+JKyYSu5x0P2LBnA3c6zolmIGsxUuuhnIYFP5hmJ
         9djA==
X-Forwarded-Encrypted: i=1; AJvYcCVPnDlxsKzSt3uBqY+13G3/S2/Uo7/U1T9JyzEoKfrjTIF1RA00IcWFpkfCK5sfhuHyp2ImavHifPWhKHeC@lists.linux.dev
X-Gm-Message-State: AOJu0Ywt8wiLp5vdtf/DOFCEgszhNrX/ukzEGmWmEqPO/VKB1oKml+Yi
	9sNXbVDK9wUscGEw2koPmZsd8IDZC5Yu8hPpkhZrSBEdxWpzz+jzuO42
X-Gm-Gg: AZuq6aJbK8t8liigtXxHvyEEvcs18cqgAnujXtnYaWYXCGeLLEMHS+/ZeCpsKbT+pbJ
	rUa/t1Rcl6qWOrsfHSqpVUCBw1//U8uQkYCjTq8ILAMlXfA7ZMoz0iU0v68zZuMNCwqj9n0eVGc
	yBRMzA0leYw9GhQf7gRtxvhPLwGALhZ8AQdhLHJhsn0mCBmUkiO9T0ahJ+/Jrs05G5ldamzq4x8
	FDr3dFlXuNXj5pfWFWnd3sIo4Zskr10XYMjeNA9PUJycRBmkozJcCWwr8pA20YcttJqSWUrZ1DL
	6h5o1T6ovoWsxex6Fxh4HY6KuiKh4QsntpnchI7KSAPl242ha+hGQaMg6DeAa3mlgZifRr/IvYP
	P5HBz1D6KXZf6NoI38QjdnVTXEIvubAe81sc02tts6flxlNZO+H3Fa1n4sDTd9lJCDs1wA+9S66
	My63faEhbhgNGeQuRaUelHagHL4FmuWi6ZJ/Wwmx6mqRo=
X-Received: by 2002:a17:90b:2705:b0:340:d06d:ea73 with SMTP id 98e67ed59e1d1-353fed74b1bmr5766506a91.19.1769633121824;
        Wed, 28 Jan 2026 12:45:21 -0800 (PST)
Received: from tehuang-Alienware-m16-R2.. ([50.47.240.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3541110e107sm20279a91.14.2026.01.28.12.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 12:45:21 -0800 (PST)
From: Michael Huang <tehsiu.huang@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Joe Perches <joe@perches.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Huang <tehsiu.huang@gmail.com>
Subject: [PATCH] staging: rtl8723bs: refactor BSS Coexistence channel report logic
Date: Wed, 28 Jan 2026 12:45:10 -0800
Message-ID: <20260128204510.53433-1-tehsiu.huang@gmail.com>
X-Mailer: git-send-email 2.43.0
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
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 41 +++++++------------
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  3 ++
 2 files changed, 18 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 884fcce50d9c..481295224f14 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -3587,8 +3587,9 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct __queue		*queue	= &(pmlmepriv->scanned_queue);
-	u8 InfoContent[16] = {0};
-	u8 ICS[8][15];
+	u8 InfoContent[BSS_COEX_MAX_INFO_LEN] = {0};
+	bool class_active[BSS_COEX_MAX_CLASSES] = {false};
+	bool ch_present[BSS_COEX_MAX_CLASSES][BSS_COEX_MAX_CHANNELS] = {{false}};
 
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


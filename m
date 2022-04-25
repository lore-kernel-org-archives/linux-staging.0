Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A3E7C
	for <linux-staging@lists.linux.dev>; Mon, 25 Apr 2022 01:17:16 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id n18so23636849plg.5
        for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 18:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nKwdqQyjnMhqftxM2oKP4i7/tuAP8z5KGRd+4yndHbw=;
        b=nxoo7akq3NDc1RUVWXRaU7OiBQLkD2/ZFBtEnFCkf4pByetxg8Gr14CYvD5mBwsQWj
         akWZcvT4zWS/S0aSgqAskm6LTZufhtA/9iVLCpqoW1FI7u2R6LbILTH+4dHGYe75RAhg
         jIKlunWj94rqLVicCXnZiFDrNCR9/SXv7HwexEnxGx6m0rL7G74w7nncZqeFy4GZBEoY
         OtBmBKYOG2v6lJzzFMLf8LS5PJAP9t6je5yjcsN12FHk8c/zwARKnFKwFa2Rth3OV7uU
         bMeznW67Bb5lPsb51h5WSw00QMlcllyngofWnR8vwRj5B0kJNtlXONFwPQv9hhKj73PA
         Ms7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nKwdqQyjnMhqftxM2oKP4i7/tuAP8z5KGRd+4yndHbw=;
        b=DzRR9NGkm1znZPViK/lOCnH3JinkNQkef/9LVQXc81aYfBnK1i9tLDo+a0DeA8/b+o
         OeCcrtEBGueBoupmOIsHJzK7Rtjrh9Iz22u3Ue5L/hi6WeI3LbfBGVrezp2Va14+bl4S
         rfDakP4KE3PRE/C/zHCWgw/E+yN4xD5Z1akAg0IRGuGKO8M8NNXt2rawtXekwsvegO/7
         yIDYBO/08Cr6Ph4/9cAHe09ZI5j+o79tKF1R1K4WPhHcQEXOrU2W9h6C8JKCwXq4i6+e
         9SoBsg0LsOWpWcyqXY3GXQRQUM7VkBRbzf3+EFi9nk1lx7NVDW0n386+HP+mE6mpQs4/
         ScAw==
X-Gm-Message-State: AOAM533QlJrqC13/k/AL/jSxCVk/yQyIwYlyNoDiAMc8ZOQsEoBItI0f
	zAZzj3dVs+1QTymrjr/XCFsBm7FmpIeWhg==
X-Google-Smtp-Source: ABdhPJzylLkQi745qRrz0LCmvS+M9S7NJK1wd3F4z6ec8E2TgmWZAdj+uRyXFeq19J0DPkaR2lj18g==
X-Received: by 2002:a17:902:d044:b0:15c:eec0:2bc with SMTP id l4-20020a170902d04400b0015ceec002bcmr7883217pll.28.1650849435175;
        Sun, 24 Apr 2022 18:17:15 -0700 (PDT)
Received: from localhost.localdomain ([14.100.36.163])
        by smtp.gmail.com with ESMTPSA id x19-20020a17090a789300b001cd4989ff69sm8697699pjk.48.2022.04.24.18.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 18:17:14 -0700 (PDT)
From: Solomon Tan <wjsota@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	straube.linux@gmail.com
Subject: [PATCH v2] Revert "staging: r8188eu: use in-kernel ieee channel"
Date: Mon, 25 Apr 2022 09:16:13 +0800
Message-Id: <20220425011612.113664-1-wjsota@gmail.com>
X-Mailer: git-send-email 2.36.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 0afaa121813ed602bd203759c339cb639493f8c2 as changing
rtw_ieee80211_channel to ieee80211_channel causes a memcpy bug as reported
in
https://lore.kernel.org/linux-staging/67e2d10b-7f0f-9c5a-ce31-376b83ffba9e@gmail.com/
due to their size differences.

Signed-off-by: Solomon Tan <wjsota@gmail.com>
---
V1 -> V2: Fix spelling error in commit message.
---
 drivers/staging/r8188eu/core/rtw_cmd.c        |  6 ++--
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 18 +++++-----
 drivers/staging/r8188eu/include/ieee80211.h   | 34 ++++++++++++++++++-
 drivers/staging/r8188eu/include/rtw_cmd.h     |  4 +--
 .../staging/r8188eu/include/rtw_mlme_ext.h    |  2 +-
 5 files changed, 48 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index ebe2479d1402..f036a980ec1a 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -320,7 +320,7 @@ int rtw_cmd_thread(void *context)
  *	MUST TAKE CARE THAT BEFORE CALLING THIS FUNC, YOU SHOULD HAVE LOCKED pmlmepriv->lock
  */
 u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid, int ssid_num,
-	struct ieee80211_channel *ch, int ch_num)
+	struct rtw_ieee80211_channel *ch, int ch_num)
 {
 	u8 res = _FAIL;
 	struct cmd_obj		*ph2c;
@@ -366,8 +366,8 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 	if (ch) {
 		int i;
 		for (i = 0; i < ch_num && i < RTW_CHANNEL_SCAN_AMOUNT; i++) {
-			if (ch[i].hw_value && !(ch[i].flags & IEEE80211_CHAN_DISABLED)) {
-				memcpy(&psurveyPara->ch[i], &ch[i], sizeof(struct ieee80211_channel));
+			if (ch[i].hw_value && !(ch[i].flags & RTW_IEEE80211_CHAN_DISABLED)) {
+				memcpy(&psurveyPara->ch[i], &ch[i], sizeof(struct rtw_ieee80211_channel));
 				psurveyPara->ch_num++;
 			}
 		}
diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 7739a0bde1e0..839b0b85993e 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -5749,11 +5749,11 @@ void site_survey(struct adapter *padapter)
 		else
 			ScanType = SCAN_ACTIVE;
 	} else {
-		struct ieee80211_channel *ch;
+		struct rtw_ieee80211_channel *ch;
 		if (pmlmeext->sitesurvey_res.channel_idx < pmlmeext->sitesurvey_res.ch_num) {
 			ch = &pmlmeext->sitesurvey_res.ch[pmlmeext->sitesurvey_res.channel_idx];
 			survey_channel = ch->hw_value;
-			ScanType = (ch->flags & IEEE80211_CHAN_NO_IR) ? SCAN_PASSIVE : SCAN_ACTIVE;
+			ScanType = (ch->flags & RTW_IEEE80211_CHAN_PASSIVE_SCAN) ? SCAN_PASSIVE : SCAN_ACTIVE;
 		}
 	}
 
@@ -7280,26 +7280,26 @@ u8 disconnect_hdl(struct adapter *padapter, unsigned char *pbuf)
 	return	H2C_SUCCESS;
 }
 
-static int rtw_scan_ch_decision(struct adapter *padapter, struct ieee80211_channel *out,
-	u32 out_num, struct ieee80211_channel *in, u32 in_num)
+static int rtw_scan_ch_decision(struct adapter *padapter, struct rtw_ieee80211_channel *out,
+	u32 out_num, struct rtw_ieee80211_channel *in, u32 in_num)
 {
 	int i, j;
 	int set_idx;
 	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
 
 	/* clear out first */
-	memset(out, 0, sizeof(struct ieee80211_channel) * out_num);
+	memset(out, 0, sizeof(struct rtw_ieee80211_channel) * out_num);
 
 	/* acquire channels from in */
 	j = 0;
 	for (i = 0; i < in_num; i++) {
 		set_idx = rtw_ch_set_search_ch(pmlmeext->channel_set, in[i].hw_value);
-		if (in[i].hw_value && !(in[i].flags & IEEE80211_CHAN_DISABLED) &&
+		if (in[i].hw_value && !(in[i].flags & RTW_IEEE80211_CHAN_DISABLED) &&
 		    set_idx >= 0) {
-			memcpy(&out[j], &in[i], sizeof(struct ieee80211_channel));
+			memcpy(&out[j], &in[i], sizeof(struct rtw_ieee80211_channel));
 
 			if (pmlmeext->channel_set[set_idx].ScanType == SCAN_PASSIVE)
-				out[j].flags &= IEEE80211_CHAN_NO_IR;
+				out[j].flags &= RTW_IEEE80211_CHAN_PASSIVE_SCAN;
 
 			j++;
 		}
@@ -7313,7 +7313,7 @@ static int rtw_scan_ch_decision(struct adapter *padapter, struct ieee80211_chann
 			out[i].hw_value = pmlmeext->channel_set[i].ChannelNum;
 
 			if (pmlmeext->channel_set[i].ScanType == SCAN_PASSIVE)
-				out[i].flags &= IEEE80211_CHAN_NO_IR;
+				out[i].flags &= RTW_IEEE80211_CHAN_PASSIVE_SCAN;
 
 			j++;
 		}
diff --git a/drivers/staging/r8188eu/include/ieee80211.h b/drivers/staging/r8188eu/include/ieee80211.h
index 788c9873d7b6..fe2dc2a0a802 100644
--- a/drivers/staging/r8188eu/include/ieee80211.h
+++ b/drivers/staging/r8188eu/include/ieee80211.h
@@ -8,7 +8,6 @@
 #include "drv_types.h"
 #include "wifi.h"
 #include <linux/wireless.h>
-#include <net/cfg80211.h>
 
 #define MGMT_QUEUE_NUM 5
 
@@ -666,6 +665,39 @@ enum rtw_ieee80211_back_actioncode {
 
 #define VENDOR_HT_CAPAB_OUI_TYPE 0x33 /* 00-90-4c:0x33 */
 
+/**
+ * enum rtw_ieee80211_channel_flags - channel flags
+ *
+ * Channel flags set by the regulatory control code.
+ *
+ * @RTW_IEEE80211_CHAN_DISABLED: This channel is disabled.
+ * @RTW_IEEE80211_CHAN_PASSIVE_SCAN: Only passive scanning is permitted
+ *      on this channel.
+ * @RTW_IEEE80211_CHAN_NO_IBSS: IBSS is not allowed on this channel.
+ * @RTW_IEEE80211_CHAN_RADAR: Radar detection is required on this channel.
+ * @RTW_IEEE80211_CHAN_NO_HT40PLUS: extension channel above this channel
+ *      is not permitted.
+ * @RTW_IEEE80211_CHAN_NO_HT40MINUS: extension channel below this channel
+ *      is not permitted.
+ */
+enum rtw_ieee80211_channel_flags {
+	RTW_IEEE80211_CHAN_DISABLED	 = 1<<0,
+	RTW_IEEE80211_CHAN_PASSIVE_SCAN     = 1<<1,
+	RTW_IEEE80211_CHAN_NO_IBSS	  = 1<<2,
+	RTW_IEEE80211_CHAN_RADAR	    = 1<<3,
+	RTW_IEEE80211_CHAN_NO_HT40PLUS      = 1<<4,
+	RTW_IEEE80211_CHAN_NO_HT40MINUS     = 1<<5,
+};
+
+#define RTW_IEEE80211_CHAN_NO_HT40 \
+	  (RTW_IEEE80211_CHAN_NO_HT40PLUS | RTW_IEEE80211_CHAN_NO_HT40MINUS)
+
+/* Represent channel details, subset of ieee80211_channel */
+struct rtw_ieee80211_channel {
+	u16 hw_value;
+	u32 flags;
+};
+
 #define CHAN_FMT \
 	"hw_value:%u, " \
 	"flags:0x%08x" \
diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
index ee15f93a5477..6b6d560d7143 100644
--- a/drivers/staging/r8188eu/include/rtw_cmd.h
+++ b/drivers/staging/r8188eu/include/rtw_cmd.h
@@ -187,7 +187,7 @@ struct sitesurvey_parm {
 	u8 ssid_num;
 	u8 ch_num;
 	struct ndis_802_11_ssid ssid[RTW_SSID_SCAN_AMOUNT];
-	struct ieee80211_channel ch[RTW_CHANNEL_SCAN_AMOUNT];
+	struct rtw_ieee80211_channel ch[RTW_CHANNEL_SCAN_AMOUNT];
 };
 
 /*
@@ -731,7 +731,7 @@ struct TDLSoption_param
 #define H2C_RESERVED		0x07
 
 u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
-		      int ssid_num, struct ieee80211_channel *ch,
+		      int ssid_num, struct rtw_ieee80211_channel *ch,
 		      int ch_num);
 u8 rtw_createbss_cmd(struct adapter  *padapter);
 u8 rtw_setstakey_cmd(struct adapter *padapter, u8 *psta, u8 unicast_key);
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index fed8e77e512b..dcf91e7894a5 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -200,7 +200,7 @@ struct	ss_res {
 	u8 ssid_num;
 	u8 ch_num;
 	struct ndis_802_11_ssid ssid[RTW_SSID_SCAN_AMOUNT];
-	struct ieee80211_channel ch[RTW_CHANNEL_SCAN_AMOUNT];
+	struct rtw_ieee80211_channel ch[RTW_CHANNEL_SCAN_AMOUNT];
 };
 
 /* define AP_MODE				0x0C */
-- 
2.36.0


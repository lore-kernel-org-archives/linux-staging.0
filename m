Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8442471
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:22:04 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id ap14so1905120ejc.0
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=82CdLjY8VS8WWjbCmtISyq7PJS/R41U6h4QCnRIJAXQ=;
        b=uKTeltvRitssEUWkPa9e/HfcckrRs9YCiW6E5FEmFifk2sdWRCDZGOtYjpNUVZnRNf
         JazD4BZlMJywBm9WV821dLl1/LkHq8yqPDwS4D8uDU+TwS8mfZUcUq39u45RmYoZvzUG
         nGoyYcoOmdDyItxgm0qV+NgD6ngxsqzKY89YyOz59WfIc6G8HdZj12vCEbIWqSOTokkw
         o9/UGxAc7jDry2rDUypOe6ktwuFWINoE333PjTFkKg3y1ZlqinX7M4tMBZd2Ys9Yaagx
         +zXwQVkziwaKJBPwNtVLxcPNuff2BNgadrHSlsQ597iL+oQGi+4B6tvU1kTdJUhEP25C
         TKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=82CdLjY8VS8WWjbCmtISyq7PJS/R41U6h4QCnRIJAXQ=;
        b=s+zOyWAq/dZhxAOXxWHMBXToJJspzjNFbczerKhBQVDh+D/xe2I3dDcOPEvxZs3T3Y
         HzgEpFK/SaiyLcn0V33x6/CI7FhLWR+GHqCcoDZqi6KFtIIOW+QZ0ABBg4MiFAkulpEd
         pFor6YGA3uBR1ISLaqEXgFiGWbrcSABBUM6W3VEENbg3QOKRXQEtccH/wf0SwGDf8ms7
         U43NY8iPFqtXY+CWTgDrZf7JzP8dAWUHpqEkcQgaXNSp8ymdhLId8olVfre8gJXRGbS+
         JjowVV05r0rebcyI1Y+yXjxDGWpizzEdAZovrz020cXB35BfiDzK2Ouw4PPXKF8aKt2K
         c7Ow==
X-Gm-Message-State: AOAM533CTL0KwL/7utSP2TInaQ34RGlpcYYncFtwGrk1O8D10NihcYUD
	VXTZsgGhp6fqAVH6JQJcqWelcjAP7cxUYg==
X-Google-Smtp-Source: ABdhPJwjPWcUqkatUawEStseRBk1rRcMssa0nL8K5OYRkAK9Pr1RM00ABWbi+Ncr12gotGSi6bBEMw==
X-Received: by 2002:a17:906:4955:: with SMTP id f21mr8436138ejt.74.1617268923080;
        Thu, 01 Apr 2021 02:22:03 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id i2sm3295149edy.72.2021.04.01.02.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:22:02 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 24/49] staging: rtl8723bs: remove empty for cycles
Date: Thu,  1 Apr 2021 11:20:54 +0200
Message-Id: <17a82ff571b16f14368b3f7cde4c5c1312e74c40.1617268327.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove empty for cycles and related unused counters

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 3cf2c4db14f6..0f72be17c540 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -595,7 +595,7 @@ int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher, int *pairwi
 int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len)
 {
 	int len = 0;
-	u8 authmode, i;
+	u8 authmode;
 	uint	cnt;
 	u8 wapi_oui1[4] = {0x0, 0x14, 0x72, 0x01};
 	u8 wapi_oui2[4] = {0x0, 0x14, 0x72, 0x02};
@@ -616,9 +616,6 @@ int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len)
 					!memcmp(&in_ie[cnt+6], wapi_oui2, 4))) {
 			if (wapi_ie) {
 				memcpy(wapi_ie, &in_ie[cnt], in_ie[cnt+1]+2);
-
-				for (i = 0; i < (in_ie[cnt+1]+2); i = i+8) {
-				}
 			}
 
 			if (wapi_len)
@@ -639,7 +636,7 @@ int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len)
 
 void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie, u16 *wpa_len)
 {
-	u8 authmode, sec_idx, i;
+	u8 authmode, sec_idx;
 	u8 wpa_oui[4] = {0x0, 0x50, 0xf2, 0x01};
 	uint	cnt;
 
@@ -655,9 +652,6 @@ void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie
 		if ((authmode == WLAN_EID_VENDOR_SPECIFIC) && (!memcmp(&in_ie[cnt+2], &wpa_oui[0], 4))) {
 				if (wpa_ie) {
 				memcpy(wpa_ie, &in_ie[cnt], in_ie[cnt+1]+2);
-
-				for (i = 0; i < (in_ie[cnt+1]+2); i = i+8) {
-					}
 				}
 
 				*wpa_len = in_ie[cnt+1]+2;
@@ -666,9 +660,6 @@ void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie
 			if (authmode == WLAN_EID_RSN) {
 				if (rsn_ie) {
 				memcpy(rsn_ie, &in_ie[cnt], in_ie[cnt+1]+2);
-
-				for (i = 0; i < (in_ie[cnt+1]+2); i = i+8) {
-					}
 				}
 
 				*rsn_len = in_ie[cnt+1]+2;
-- 
2.20.1


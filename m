Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B635F
	for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 00:18:11 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id t5so3844399qvs.5
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 17:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xqBa11K+t3yJo64JHPBL4xG7apvJbEXnUnLncnKDQMA=;
        b=NIt0T9RXfaESkCQkTRUHfIEMw/MB5myfMUFUQ/Y2gNALTg7EinJnNXNyK16+tSo7l0
         q1565/xhUhqsf0cajIPToAx6MHgRngWeI0aZdHURR4/sf4GPr/7D1//Rgrg+7JAlNQL2
         GY4oArBZEMNBLTjuSAaahPBvu18TUMOksSZ+iZYPWEPaPaNKQQkoNCxHGwfCZ/VT4W3t
         nIvM/kNubA0RyaWdxVtjaZLu/UxJrhCDKSBOMiAx9I/wUoNW+qZiPtKgBMMx5Ea/U+g/
         XB2WbVvTGzY92I4Lj3E2VsLIdiCQaLWoEmbEHhqZiI3vRDAv57qh9jH+L1m8u09kterk
         3ybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xqBa11K+t3yJo64JHPBL4xG7apvJbEXnUnLncnKDQMA=;
        b=RyYuSO9KkWHlfEFETrbh/TBaVrJZXYDCZu9TsLIQi3KygxHc4M2RSkyVu8JtUb0OXm
         NOOfK2RltiRqeuq9Rkgrx75MAKpPK0tV6iwO/kEM+DLYGFiIdmekmnTmUTOHldZIGeKI
         iIpTLEjodRapYiymcTN7b7U1X94s/oC5ZT2UGXxiBs6RgtqG02QlUV0Vu97Xr/+40dsR
         BKbZyrrghVKgoLvFBeK85MpGOTxTmfEXxSA8EbW0Lc2RLYC/BOs9EnkR1Ko4rhQ5WwTZ
         bKXv0F125LWX1+tP7lqPeu0HKqlN/obFeyCbmPFmZ4Ckzp0Y6+OtnlzMT5daLbR4qG3D
         PtMg==
X-Gm-Message-State: AOAM532GSDa6qGO64NNoIZ3k7R7SwFZ9YYcFH1IuzQvVpB0NYEYHtC2h
	ld1xqjboUMaNzkJX9e626+w=
X-Google-Smtp-Source: ABdhPJwNFRvBFgM9rN9qoxreJmFNMEl10dp5kOUd7xtpm2y6ZU4sHjL6q6qAwjXPZgOuzj0e8dK2lw==
X-Received: by 2002:a0c:e148:: with SMTP id c8mr7780071qvl.18.1616804290258;
        Fri, 26 Mar 2021 17:18:10 -0700 (PDT)
Received: from linuxerio.localdomain ([186.32.194.42])
        by smtp.gmail.com with ESMTPSA id z2sm8213531qkg.22.2021.03.26.17.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 17:18:09 -0700 (PDT)
From: Edmundo Carmona Antoranz <eantoranz@gmail.com>
To: gregkh@linuxfoundation.org,
	marcocesati@gmail.com,
	dan.carpenter@oracle.com,
	ross.schm.dev@gmail.com,
	fabioaiuto83@gmail.com,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	Edmundo Carmona Antoranz <eantoranz@gmail.com>
Subject: [PATCH -next 1/6] staging: rtl8723bs: ieee80211: remove unused variable
Date: Fri, 26 Mar 2021 18:17:31 -0600
Message-Id: <20210327001736.180881-1-eantoranz@gmail.com>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

sec_idx in rtw_get_sec_ie() is set to 0 and never changes value. Also,
it is only used for debugging messages. Therefore the variable is
removed and the debug messages are adjusted. Adjusting debug messages
forced style changes. Taking the opportunity to adjust indentation
of those sections of the code.

Removing this warning:

drivers/staging/rtl8723bs/core/rtw_ieee80211.c:657:15: warning: variable ‘sec_idx’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Edmundo Carmona Antoranz <eantoranz@gmail.com>
---
 .../staging/rtl8723bs/core/rtw_ieee80211.c    | 43 +++++++++++--------
 1 file changed, 25 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index cccbea555a32..ec065d924fbb 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -654,7 +654,7 @@ int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len)
 
 void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie, u16 *wpa_len)
 {
-	u8 authmode, sec_idx, i;
+	u8 authmode, i;
 	u8 wpa_oui[4] = {0x0, 0x50, 0xf2, 0x01};
 	uint	cnt;
 
@@ -662,37 +662,44 @@ void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie
 
 	cnt = (_TIMESTAMP_ + _BEACON_ITERVAL_ + _CAPABILITY_);
 
-	sec_idx = 0;
-
 	while (cnt < in_len) {
 		authmode = in_ie[cnt];
 
 		if ((authmode == WLAN_EID_VENDOR_SPECIFIC) && (!memcmp(&in_ie[cnt+2], &wpa_oui[0], 4))) {
-				RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("\n rtw_get_wpa_ie: sec_idx =%d in_ie[cnt+1]+2 =%d\n", sec_idx, in_ie[cnt+1]+2));
+			RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_,
+				 ("\n rtw_get_wpa_ie: in_ie[cnt+1]+2 =%d\n", in_ie[cnt + 1] + 2));
 
-				if (wpa_ie) {
+			if (wpa_ie) {
 				memcpy(wpa_ie, &in_ie[cnt], in_ie[cnt+1]+2);
 
 				for (i = 0; i < (in_ie[cnt+1]+2); i = i+8) {
-						RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("\n %2x,%2x,%2x,%2x,%2x,%2x,%2x,%2x\n",
-									wpa_ie[i], wpa_ie[i+1], wpa_ie[i+2], wpa_ie[i+3], wpa_ie[i+4],
-									wpa_ie[i+5], wpa_ie[i+6], wpa_ie[i+7]));
-					}
+					RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_,
+						 ("\n %2x,%2x,%2x,%2x,%2x,%2x,%2x,%2x\n",
+						  wpa_ie[i], wpa_ie[i + 1], wpa_ie[i + 2],
+						  wpa_ie[i + 3], wpa_ie[i + 4],
+						  wpa_ie[i + 5], wpa_ie[i + 6],
+						  wpa_ie[i + 7]));
 				}
+			}
 
-				*wpa_len = in_ie[cnt+1]+2;
-				cnt += in_ie[cnt+1]+2;  /* get next */
+			*wpa_len = in_ie[cnt + 1] + 2;
+			cnt += in_ie[cnt + 1] + 2;  /* get next */
 		} else {
 			if (authmode == WLAN_EID_RSN) {
-				RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("\n get_rsn_ie: sec_idx =%d in_ie[cnt+1]+2 =%d\n", sec_idx, in_ie[cnt+1]+2));
+				RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_,
+					 ("\n get_rsn_ie: in_ie[cnt+1]+2 =%d\n",
+					  in_ie[cnt + 1] + 2));
 
 				if (rsn_ie) {
-				memcpy(rsn_ie, &in_ie[cnt], in_ie[cnt+1]+2);
-
-				for (i = 0; i < (in_ie[cnt+1]+2); i = i+8) {
-						RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("\n %2x,%2x,%2x,%2x,%2x,%2x,%2x,%2x\n",
-									rsn_ie[i], rsn_ie[i+1], rsn_ie[i+2], rsn_ie[i+3], rsn_ie[i+4],
-									rsn_ie[i+5], rsn_ie[i+6], rsn_ie[i+7]));
+					memcpy(rsn_ie, &in_ie[cnt], in_ie[cnt + 1] + 2);
+
+					for (i = 0; i < (in_ie[cnt + 1] + 2); i = i + 8) {
+						RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_,
+							 ("\n %2x,%2x,%2x,%2x,%2x,%2x,%2x,%2x\n",
+							  rsn_ie[i], rsn_ie[i + 1], rsn_ie[i + 2],
+							  rsn_ie[i + 3], rsn_ie[i + 4],
+							  rsn_ie[i + 5], rsn_ie[i + 6],
+							  rsn_ie[i + 7]));
 					}
 				}
 
-- 
2.30.2


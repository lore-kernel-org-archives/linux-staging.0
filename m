Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2B31FA6
	for <linux-staging@lists.linux.dev>; Sat,  5 Nov 2022 09:39:33 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id bj12so18785070ejb.13
        for <linux-staging@lists.linux.dev>; Sat, 05 Nov 2022 02:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UxXjh/HXZsln6nQHph//YT1hNRabli6WZS407CAMang=;
        b=f4IyhMYOp03CFxrRgNeKLddDWgkauptTZj7+gxlIkLrb9whUDtzfgfIpy6ONi/MiqS
         tSLL/T3aazcnY69xJ943JhUSfAu7lLzTpFI0i5CqB5EkzAlz1+3WeQHxi79ohmXLs00X
         eSqMGfp2Xjxkrw3p2wvUlmy0XwDYaqaTbnXLXcLuT3+DrjZ6ePaYuykFs/Y7AJ5kcYd3
         u1b2F50Q53it1RkhDz+eD89oyIxrg+N4vMyJq3x/ppSoOpqbpBosEpC12MAjSXy1Wh/p
         +xWU66UJrWo7XPjQh+JtvSAxYlpSNybXeYlCkSmbvmj6v+EDgqc95aW/+PnIeXo55EaE
         wv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UxXjh/HXZsln6nQHph//YT1hNRabli6WZS407CAMang=;
        b=VqNm9etrwHH4YIS8aPBsITQVZwuBYZtJz6ttGoiD/KZB3vnqSHiBQ8rWCPCtFWfquM
         D0+rb2e5sppuHEPoRyke3g931/R6CsiHXLh4b4//cUDBpW1F1bv+0Gkcv9XD0bOnz/u+
         GRmONrIcE+yKUFHEBvquGKiskIaQ3uyVSv4wGcLUxbnN+4kUhk3N8VSt2ld8hRRAUVJL
         qH/VwxYHzCDtxFQ9Ef1R/dEZ2s2/orAYgi/A9WJ4pJ+IsRcIHD0pULg+ja8CdYrO9Mjh
         iGMgJPCktlC2qAgVgu7W+YvGThdrNvRxBMab2RjSGqaTNGUbBczqPpDc6ZrGtF8eMuLB
         Ot2Q==
X-Gm-Message-State: ACrzQf0JxVuOgOdb3+Nvm3P/Va3zaJIqQrN7V1OwJXlA50WfFsarRjwx
	dcxyaZYVhYLCbXHD43LE6Yg=
X-Google-Smtp-Source: AMsMyM5bA1LSd/16G4FnFVoCoTM6RZnj54TViEhaWb7U2tF8IRKd6e3O1yHLR66KgiVEnAIzLrzFkA==
X-Received: by 2002:a17:907:a40f:b0:7ad:b9b7:582c with SMTP id sg15-20020a170907a40f00b007adb9b7582cmr36685920ejc.347.1667641171813;
        Sat, 05 Nov 2022 02:39:31 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abba7.dynamic.kabel-deutschland.de. [95.90.187.167])
        by smtp.gmail.com with ESMTPSA id lj18-20020a170906f9d200b007adade0e9easm677549ejb.85.2022.11.05.02.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 02:39:31 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: convert three functions to bool
Date: Sat,  5 Nov 2022 10:39:16 +0100
Message-Id: <20221105093916.8255-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.38.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions

is_client_associated_to_ap()
is_client_associated_to_ibss()
is_IBSS_empty()

return boolean values. Convert their return type to bool and replace
_FAIL, which is defined as 0, with false. Another step to get rid of
_SUCCESS / _FAIL.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_wlan_util.c   | 18 +++++++++---------
 drivers/staging/r8188eu/include/rtw_mlme_ext.h |  6 +++---
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index e50631848cab..c95438a12b59 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -331,35 +331,35 @@ u16 get_beacon_interval(struct wlan_bssid_ex *bss)
 	return le16_to_cpu(val);
 }
 
-int is_client_associated_to_ap(struct adapter *padapter)
+bool is_client_associated_to_ap(struct adapter *padapter)
 {
 	struct mlme_ext_priv	*pmlmeext;
 	struct mlme_ext_info	*pmlmeinfo;
 
 	if (!padapter)
-		return _FAIL;
+		return false;
 
 	pmlmeext = &padapter->mlmeextpriv;
 	pmlmeinfo = &pmlmeext->mlmext_info;
 
 	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE))
 		return true;
-	else
-		return _FAIL;
+
+	return false;
 }
 
-int is_client_associated_to_ibss(struct adapter *padapter)
+bool is_client_associated_to_ibss(struct adapter *padapter)
 {
 	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
 
 	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE))
 		return true;
-	else
-		return _FAIL;
+
+	return false;
 }
 
-int is_IBSS_empty(struct adapter *padapter)
+bool is_IBSS_empty(struct adapter *padapter)
 {
 	unsigned int i;
 	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
@@ -367,7 +367,7 @@ int is_IBSS_empty(struct adapter *padapter)
 
 	for (i = IBSS_START_MAC_ID; i < NUM_STA; i++) {
 		if (pmlmeinfo->FW_sta_info[i].status == 1)
-			return _FAIL;
+			return false;
 	}
 	return true;
 }
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index e234a3b9af6f..7652e72a03f4 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -432,9 +432,9 @@ void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
 u8 *get_my_bssid(struct wlan_bssid_ex *pnetwork);
 u16 get_beacon_interval(struct wlan_bssid_ex *bss);
 
-int is_client_associated_to_ap(struct adapter *padapter);
-int is_client_associated_to_ibss(struct adapter *padapter);
-int is_IBSS_empty(struct adapter *padapter);
+bool is_client_associated_to_ap(struct adapter *padapter);
+bool is_client_associated_to_ibss(struct adapter *padapter);
+bool is_IBSS_empty(struct adapter *padapter);
 
 unsigned char check_assoc_AP(u8 *pframe, uint len);
 
-- 
2.38.0


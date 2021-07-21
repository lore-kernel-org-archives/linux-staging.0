Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3FF72
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 13:37:34 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id dt7so3253321ejc.12
        for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 06:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9aHB5wDXtjVablMoi0Fk0IO6LvsBphTljb6rirl7ru4=;
        b=miDF4q5pO5yqJYFUy7KW/hYf2j46LKY4eJG+iW20XQtv+ic5b06tEf7bWj9HEyHjZv
         paxjXSfEXhRlC6sld4XzhKs8KsTxEjqqRfR2/t+ssD1mmzLvLnQ8KE8nrevPUJeJF7Xk
         QPRTcpnVa37+QagxiudqhiIBWO17P927MW8EWKn3ul3QAXElzIUKU8ly4U+8o3VEpi58
         IA9rHxmQiUBc/FNmZ/yOKYxRM+8QWLwj/b8Xx+eSYEorBRz2rGkSM1MiqR5vVQhQelaf
         ejMl69fRBJ4XnaS44zdh+Poa3MZT87jEppnn8Qn3rsoZmOIjrdUoJ952t7SzKdYR4cg9
         6HQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9aHB5wDXtjVablMoi0Fk0IO6LvsBphTljb6rirl7ru4=;
        b=NUbgZLYVcTTJbTku1QPxMbemfWX+coPGihZpjZWHDK2oy5XjAUb9DIN8MpYRBQiH7X
         1QPTntKgjXpH6mOI1lrW5FPGiBrFg9H2oeg3rf4wf+dAf8fBosLcnEsUA0btdlc0+zGl
         Vd2+7aS05KNWARcOqYAHk1Em/3e+bhjAKmiKN47fMMs2+Gtrbvgh1MbDDy+yLvGiGTDf
         6CE4mtTcRqv+IZ7vAhvFTibqTCF9rnQ7DOhKc/0lwT7SxdXVtn3V5GwGJUutlVFlqDxp
         R2rV2A1JHh5Q8RXYi23oRBNoWw8hchJvddqM+Yo5Dnz19j8MLb2ADCAfy2XX1iB89fZo
         Ud8w==
X-Gm-Message-State: AOAM5319Ri1mak0MI8YebX4bx3qMzS1vW4lKZNARmrPFMmtQ1SMtRx6B
	WrY5L7eH+1Z2uwnkMJWvTsQ=
X-Google-Smtp-Source: ABdhPJwy/b10bIoRYQnp4Gebk+OKIIsuchrI2l+iMTa6NZUIY+NkqgS85LS+owWWSu5gAM2hdwVamw==
X-Received: by 2002:a17:906:e088:: with SMTP id gh8mr38698680ejb.125.1626874652827;
        Wed, 21 Jul 2021 06:37:32 -0700 (PDT)
Received: from agape ([5.171.73.45])
        by smtp.gmail.com with ESMTPSA id g8sm11113099eds.25.2021.07.21.06.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 06:37:32 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/16] staging: rtl8723bs: remove 5Ghz code blocks
Date: Wed, 21 Jul 2021 15:37:12 +0200
Message-Id: <c64443b92ce1a60f568db153842a62e3244a8c3a.1626874164.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1626874164.git.fabioaiuto83@gmail.com>
References: <cover.1626874164.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove 5 Ghz code blocks, related to networks
working over channel numbers above 14.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  7 ++-----
 .../staging/rtl8723bs/os_dep/ioctl_linux.c    | 20 +++----------------
 2 files changed, 5 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index af7d133bce94..2df8ed649519 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -3708,7 +3708,7 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 			p = rtw_get_ie(pbss_network->IEs + _FIXED_IE_LENGTH_, WLAN_EID_HT_CAPABILITY, &len, pbss_network->IELength - _FIXED_IE_LENGTH_);
 			if ((p == NULL) || (len == 0)) {/* non-HT */
 
-				if ((pbss_network->Configuration.DSConfig <= 0) || (pbss_network->Configuration.DSConfig > 14))
+				if (pbss_network->Configuration.DSConfig <= 0)
 					continue;
 
 				ICS[0][pbss_network->Configuration.DSConfig] = 1;
@@ -5428,10 +5428,7 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 			{
 				struct HT_info_element *pht_info = (struct HT_info_element *)(pIE->data);
 
-				if (pnetwork->Configuration.DSConfig > 14) {
-					if ((pregpriv->bw_mode >> 4) > CHANNEL_WIDTH_20)
-						cbw40_enable = 1;
-				} else {
+				if (pnetwork->Configuration.DSConfig <= 14) {
 					if ((pregpriv->bw_mode & 0x0f) > CHANNEL_WIDTH_20)
 						cbw40_enable = 1;
 				}
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index 965558516cbd..8af81c4ff8db 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -129,14 +129,7 @@ static char *translate_scan(struct adapter *padapter,
 		else
 			snprintf(iwe.u.name, IFNAMSIZ, "IEEE 802.11bg");
 	} else {
-		if (pnetwork->network.Configuration.DSConfig > 14) {
-			if (vht_cap)
-				snprintf(iwe.u.name, IFNAMSIZ, "IEEE 802.11AC");
-			else if (ht_cap)
-				snprintf(iwe.u.name, IFNAMSIZ, "IEEE 802.11an");
-			else
-				snprintf(iwe.u.name, IFNAMSIZ, "IEEE 802.11a");
-		} else {
+		if (pnetwork->network.Configuration.DSConfig <= 14) {
 			if (ht_cap)
 				snprintf(iwe.u.name, IFNAMSIZ, "IEEE 802.11gn");
 			else
@@ -683,7 +676,7 @@ static int rtw_wx_get_name(struct net_device *dev,
 	struct adapter *padapter = rtw_netdev_priv(dev);
 	u32 ht_ielen = 0;
 	char *p;
-	u8 ht_cap = false, vht_cap = false;
+	u8 ht_cap = false;
 	struct	mlme_priv *pmlmepriv = &(padapter->mlmepriv);
 	struct wlan_bssid_ex  *pcur_bss = &pmlmepriv->cur_network.network;
 	NDIS_802_11_RATES_EX *prates = NULL;
@@ -707,14 +700,7 @@ static int rtw_wx_get_name(struct net_device *dev,
 			else
 				snprintf(wrqu->name, IFNAMSIZ, "IEEE 802.11bg");
 		} else {
-			if (pcur_bss->Configuration.DSConfig > 14) {
-				if (vht_cap)
-					snprintf(wrqu->name, IFNAMSIZ, "IEEE 802.11AC");
-				else if (ht_cap)
-					snprintf(wrqu->name, IFNAMSIZ, "IEEE 802.11an");
-				else
-					snprintf(wrqu->name, IFNAMSIZ, "IEEE 802.11a");
-			} else {
+			if (pcur_bss->Configuration.DSConfig <= 14) {
 				if (ht_cap)
 					snprintf(wrqu->name, IFNAMSIZ, "IEEE 802.11gn");
 				else
-- 
2.20.1


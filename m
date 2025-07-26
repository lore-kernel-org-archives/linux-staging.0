Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690B2215175
	for <linux-staging@lists.linux.dev>; Sat, 26 Jul 2025 04:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753504430; cv=none; b=fNcA1pwwHtq+cqtWynbq8WHql8a7k/A5pF6QN0Qg4nWCvD8Sklox3+pU0DRuzmrKORfFCv32VyxV77EhG4A3lq6rNw0FpP6DgBHws6QhQCrkwv5cxIhGx7YQxx+D3mA/V4wQCXZquMFHy0lG2a5cHH+/8sGcZKH7SQBunNCaBe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753504430; c=relaxed/simple;
	bh=HbTYJpvbsizmO6AePks88UoqbxnEofkE+uZjPBDPOoo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dUyP41TjttDvr8Mb3eXTGBpyDg0UttXNFmXlYxSOIAiC42nB5jhjcSFT1ZXy4l47h21ZIstkD6rcua+sSCHfzL1dyrQ5Dmwr+GKwmnBwD6bP02Yii4Kj7pgx3BKlDij03+ZHSHXSeKuAi8RPoiuH5XOHzWJhgsdljArSpUVjRBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OVhDOZ5Z; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVhDOZ5Z"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7e1d89fcc31so273921485a.1
        for <linux-staging@lists.linux.dev>; Fri, 25 Jul 2025 21:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753504426; x=1754109226; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YINGwzP+WQ2B2pLZ+3JU3T3wxECudwibr/z31+tOBEA=;
        b=OVhDOZ5ZLxSZlIok0gviZloSt1++cHZoBw99eYi8uSif6AyjzUsVeopK4EdcrUvN07
         PoYe+GkxMsceb76G0+8jzNxNr+n0wqlUOAVYTIwWJv4ik1TZwjSuwfogOlehapXNUC79
         4tKUUMr7YpumAEbnnLMPyCnzTbj1lIPqU/nudPkAtRywKnmG7xJlLM+jE5I90JWEAVVp
         poveUUWgFT6YlNEzhoGGtWYPH1zLKWip8rnAqLNk2PVP6s7lHmwudA92TL07QiXbQIS3
         z++l17skeP9HPAr8xP3oCnxwMXeFbBOYQSNY9Tv7u/S0Fo2q0VY32T2Te3WQnv0869A2
         KjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753504426; x=1754109226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YINGwzP+WQ2B2pLZ+3JU3T3wxECudwibr/z31+tOBEA=;
        b=H4MyPDPwdwTHkcl0iT3Uip8Dh8xk+PF6Y0P+INM6gAuDg3Im/xnpo+Qbw+TZ4a8EyX
         RiB2GxmYpp9az4TWHQt5uJMZDfVfI4YdjoCw/R/S3UMQXYLQUBNsinjDnrjKNqtmdN/5
         TE0fbehybluPzey9ah+eu04Lv3S7thpi4dhdT1hwnuM3YrVMHFFk39KZ0JzyZAAj2gXC
         qR9HfbAjqBHslE4E6SzrnR5vvlCNw84ppZp0QCYqYTA/wIOf8J+PeGW39Jb9VEdCp95f
         NHv5UZ/zyMUxAYfK3aQ7629ERB/ZD5XD0elxFBNuNcCCSpuADemriDXTDqpJZEm6oY82
         NMLg==
X-Gm-Message-State: AOJu0Yx2yhvpMUoseh+KTafktr13bsoTMQRxrTLC81FnumKXHawvShz5
	4A20Hd+hGT64BtgModIDU++CulDDXBoWeWD4tk3z7ADu1QiWuWTST1o1
X-Gm-Gg: ASbGncumg9nbcMf0trPiWDRR9WyMQBJkQIwJX3ieru2i5O6kV8I67f2ouON6MJo7YyQ
	+sP9JPFw8kSpvB/mcpLnnACa0kl9KTxvT8+mYStoBfg+CVJVfFNCOU5E+PJkqNy/okWMMo9SWQX
	v/vN3oES+YTZeMwGLhEtloi2QgdmLMJCYclras8GHcsW53yExP/IGwvJCe8A1Jke2AoFQmFy7IT
	FyGgFdEyP0e8kFYEWFSkULaBj0o6bc0G6pipVvzMNWPHGV5scWr8/iQQMnUGr+lz6HtUVcf6Gt+
	zACGj8T3X2UR3P916ewPDJhDwYNMzX5y158nBIAhHE0q0lZoRO6XpmW83ytlh9Vz0txiT4NLRav
	jNiGgcZUPvb9NPJe1AWndW8lhkSvoA421ex7frYEXe9rPRA3g6k8=
X-Google-Smtp-Source: AGHT+IGrlpeDG+M1XFYNQBMVlA5m1LG8vzAaNYW0s67UXCoEigoyFT+rBXnmZPZoEYP8bDGeD73U6g==
X-Received: by 2002:a05:620a:5bd8:b0:7e3:3276:99f with SMTP id af79cd13be357-7e63bfae1d2mr537840285a.53.1753504426331;
        Fri, 25 Jul 2025 21:33:46 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e6432a885asm70322185a.36.2025.07.25.21.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 21:33:46 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH 09/20] staging: rtl8723bs: fix indentation to align with open parenthesis
Date: Sat, 26 Jul 2025 04:32:07 +0000
Message-Id: <20250726043218.386738-10-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
References: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adjusted indentation of function arguments to align with the
opening parenthesis, following kernel coding style guidelines.
This enhances readability and maintains consistent formatting.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 692d2526965f..e709a0bd24f3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -154,7 +154,7 @@ void _rtw_free_network(struct	mlme_priv *pmlmepriv, struct wlan_network *pnetwor
 		return;
 
 	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true))
+	    (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true))
 		lifetime = 1;
 
 	if (!isfreeall) {
@@ -241,7 +241,7 @@ signed int rtw_if_up(struct adapter *padapter)
 	signed int res;
 
 	if (padapter->bDriverStopped || padapter->bSurpriseRemoved ||
-		(check_fwstate(&padapter->mlmepriv, _FW_LINKED) == false))
+	    (check_fwstate(&padapter->mlmepriv, _FW_LINKED) == false))
 		res = false;
 	else
 		res =  true;
@@ -310,7 +310,7 @@ int rtw_is_same_ibss(struct adapter *adapter, struct wlan_network *pnetwork)
 	struct security_priv *psecuritypriv = &adapter->securitypriv;
 
 	if ((psecuritypriv->dot11PrivacyAlgrthm != _NO_PRIVACY_) &&
-		    (pnetwork->network.privacy == 0))
+	    (pnetwork->network.privacy == 0))
 		ret = false;
 	else if ((psecuritypriv->dot11PrivacyAlgrthm == _NO_PRIVACY_) &&
 		 (pnetwork->network.privacy == 1))
@@ -391,7 +391,7 @@ struct	wlan_network	*rtw_get_oldest_wlan_network(struct __queue *scanned_queue)
 }
 
 void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
-	struct adapter *padapter, bool update_ie)
+		    struct adapter *padapter, bool update_ie)
 {
 	long rssi_ori = dst->rssi;
 
@@ -447,9 +447,9 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
 	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
 
 	rtw_bug_check(&pmlmepriv->cur_network.network,
-		&pmlmepriv->cur_network.network,
-		&pmlmepriv->cur_network.network,
-		&pmlmepriv->cur_network.network);
+		      &pmlmepriv->cur_network.network,
+		      &pmlmepriv->cur_network.network,
+		      &pmlmepriv->cur_network.network);
 
 	if ((check_fwstate(pmlmepriv, _FW_LINKED) == true) &&
 	    (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
@@ -1343,7 +1343,7 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 	spin_lock_bh(&pmlmepriv->lock);
 
 	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
+	    (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
 		if (adapter->stapriv.asoc_sta_count == 2) {
 			spin_lock_bh(&pmlmepriv->scanned_queue.lock);
 			ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue,
@@ -1442,7 +1442,7 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 	}
 
 	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) ||
-	      check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
+	    check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
 		rtw_free_stainfo(adapter,  psta);
 
 		if (adapter->stapriv.asoc_sta_count == 1) {
@@ -1768,7 +1768,7 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
 	if (mlme->assoc_ssid.ssid[0] && mlme->assoc_ssid.ssid_length) {
 		if (competitor->network.ssid.ssid_length != mlme->assoc_ssid.ssid_length ||
 		    memcmp(competitor->network.ssid.ssid, mlme->assoc_ssid.ssid,
-				  mlme->assoc_ssid.ssid_length)
+			   mlme->assoc_ssid.ssid_length)
 		)
 			goto exit;
 	}
@@ -2010,7 +2010,7 @@ static int SecIsInPMKIDList(struct adapter *Adapter, u8 *bssid)
 
 	for (i = 0; i < NUM_PMKID_CACHE; i++)
 		if ((p->PMKIDList[i].bUsed) &&
-				(!memcmp(p->PMKIDList[i].Bssid, bssid, ETH_ALEN)))
+		    (!memcmp(p->PMKIDList[i].Bssid, bssid, ETH_ALEN)))
 			return i;
 	return -1;
 }
-- 
2.39.5


Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4749A261573
	for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 14:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770906161; cv=none; b=FLdhoiZKPQva80vKbwTguZypR5r8VqXLKfIVG1sLkR67hERy/AyCFwFsPFiGQnMCPEIGUTdcWwRl7thuAXC8i7SFmDwO3j34m+LI2XSFUra0RNfBeyD2GQhzuiIqBTWBLc2uOdNl3wgEfOKpqqzXm5AvRyTFdb4h+pCY59QZiXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770906161; c=relaxed/simple;
	bh=j8JekCs3ZS/rkajeaMMNoCV05t83c2Wl2Q0wPoZEIKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t1nsAE2Y0N8Ety0proMkOSoatrgkGGGUaXXvecB77T5oOQmEiCwwLs60ofrpSurEXhQJoYazJ2W0QydrgpGAEevoKtUf5LNRjk87SVhRBkvd4uA76/ZAepC5ZXijzeIgSUkS1HlcJwVSPF68KBUwqA2C+E4X2tI9ItMQN9P2H4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=chpRSipo; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="chpRSipo"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8249fc726e9so1170079b3a.2
        for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 06:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770906159; x=1771510959; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2exHcZToZu2EpbdASl4Yzi0O0TQLUdMunWgD/Yezv4=;
        b=chpRSipo6I50w9CY8m+BJsvHvoOHhajXQAd/DZ45JSyGIjt0AmRiZ40vU7a64FIZVg
         OTRGYFPoL8RsQuulJFWg4IgSxguZ4bvrBkmk8pBQh1XbICrPN7Y1p/clpAmtnmXMYTa/
         G/IV1iJ9e3Uzkwb+hyIMK3/tnIwL0PB28yN7E9gMOb0tpsbQj5kHkdG41qPVYgTmjNqn
         SLu6sKs+rleZMaORAvA8moIULtolPCuRBPfS+GnqnBhXxYgLekhIf8oy9iTRClOk16PB
         qU8qfDAXj8BaPon0zBNlLb5vADZWaDB65wxjKbx0CsKmWdw7lW1LdTYZhGvwIyZvchp4
         j9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770906159; x=1771510959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d2exHcZToZu2EpbdASl4Yzi0O0TQLUdMunWgD/Yezv4=;
        b=HTaG7ECJia4bZOWXlJ1NH/rARmpGqhVE+JUY1CTzxQ0g5AmyhnDhqq0YcpI5jQnDgb
         Gh/UtjYYXEDQ852Fe++znPFvabYwAxzrBnwBb4woRmacjyAzeUTSGTa3Ym6zVnAlkOEc
         H/Z83PkhCWl24RicyBsJCvl6fnd52mFtqN/MKu8RWpWUXj31DhkoWinicYaRRUoOgUvG
         yVmLhkO6jCL5Aj78JK7cEIu0/IxUzZO0oQHg6f18chlAVbLKdOmXGwvq3fqX4vQbvgv+
         OsqAxNTNV0vpsUrfSBiVkaoW3UAiiinMTBnMNvKc8B0tR3jMaVaeXNTtm21lXOjLbfIB
         WI4w==
X-Forwarded-Encrypted: i=1; AJvYcCWnxmekCTomJmagEXtJqlQyWGz4OhUAdfJkN915kdbx8JqwHDr0TkeediLDAbcRkX8P4+NyUS9wgukB9ys2@lists.linux.dev
X-Gm-Message-State: AOJu0Yxzee8aOoD9tVnAB3IIcTMCZiSfFO75Tx7gHi98TUr7z/yvUCU+
	gC/k4uBVngC44Mk/CfuBoiv0yk5V2tngGp0pe05h4fksoltdzKXcO7vA
X-Gm-Gg: AZuq6aISImTzcZ70T1CDX2pR4wHcmrV7n7TVG8jRW3bpdtTJBpAwmU7qNdj6UVVmPVE
	jUZBt/IJXQhQKX7DDfgbmromQ4m9uM33E7afItDCDytMVe+KU2czNfxWFr/0KS7nBAU4KmnR1ET
	5MQy5+aZJfSbYZN0NmXmWdFbMaoE0AN50ge+3n9hQISgSbX6cRdPlMxkFOvqy7hBzQPWm7FMX7g
	BQmGkssSgtDJNnHxzJFWG3NUzZ1tWBcPNZVK9Z8XazniQrXejN6DtBLvK2+PRNZdMIvB6xDSHHD
	yAkrURR41VIGhxsI7jJXCoUcurXqtWVttAcTk1aRDm45Xhs+5iSQ9LnREY3O4fndx7TCsPEOFkG
	kjXtZIrhsQp++bPc7QuCJELvk51U0r2AFr5/udh0YuIdtd7Y2adKYmyOFmA7jVjBzjixxxur79o
	dZVOqPJrITkmlZG8A3R+oOfnL+wDSb5Ogsd5PSjFk9
X-Received: by 2002:a05:6a00:1a14:b0:81f:99cd:faf8 with SMTP id d2e1a72fcca58-824b03f25ffmr2199591b3a.8.1770906159483;
        Thu, 12 Feb 2026 06:22:39 -0800 (PST)
Received: from snowman ([2401:4900:647d:9ae6:881d:5895:580d:d8e5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e366b82sm5336631b3a.1.2026.02.12.06.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 06:22:38 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	ethantidmore06@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v7 6/7] staging: rtl8723bs: simplify boolean expressions
Date: Thu, 12 Feb 2026 19:51:30 +0530
Message-ID: <20260212142131.28131-7-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212142131.28131-1-khushalchitturi@gmail.com>
References: <20260212142131.28131-1-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant comparisons with true/false and simplify
boolean conditions.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
Changelog:
v6 -> v7: new patch applying boolean simplifications to renamed code.

 drivers/staging/rtl8723bs/core/rtw_cmd.c          |  9 ++++++---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c    | 13 +++++--------
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  2 +-
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index c50a3a2997e2..f322a7f89b42 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1150,7 +1150,8 @@ bool traffic_status_watchdog(struct adapter *padapter, bool from_timer)
 		    pmlmepriv->link_detect_info.num_tx_ok_in_period > busy_threshold) {
 			busy_traffic = true;
 
-			if (pmlmepriv->link_detect_info.num_rx_ok_in_period > pmlmepriv->link_detect_info.num_tx_ok_in_period)
+			if (pmlmepriv->link_detect_info.num_rx_ok_in_period >
+			    pmlmepriv->link_detect_info.num_tx_ok_in_period)
 				rx_busy_traffic = true;
 			else
 				tx_busy_traffic = true;
@@ -1161,14 +1162,16 @@ bool traffic_status_watchdog(struct adapter *padapter, bool from_timer)
 		    pmlmepriv->link_detect_info.num_tx_ok_in_period > 4000) {
 			higher_busy_traffic = true;
 
-			if (pmlmepriv->link_detect_info.num_rx_ok_in_period > pmlmepriv->link_detect_info.num_tx_ok_in_period)
+			if (pmlmepriv->link_detect_info.num_rx_ok_in_period >
+			    pmlmepriv->link_detect_info.num_tx_ok_in_period)
 				higher_busy_rx_traffic = true;
 			else
 				higher_busy_tx_traffic = true;
 		}
 
 		/*  check traffic for  powersaving. */
-		if (((pmlmepriv->link_detect_info.num_rx_unicast_ok_in_period + pmlmepriv->link_detect_info.num_tx_ok_in_period) > 8) ||
+		if (((pmlmepriv->link_detect_info.num_rx_unicast_ok_in_period +
+		      pmlmepriv->link_detect_info.num_tx_ok_in_period) > 8) ||
 		    (pmlmepriv->link_detect_info.num_rx_unicast_ok_in_period > 2)) {
 			should_enter_ps = false;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index c41595d03c08..d92ec9949d00 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -61,9 +61,7 @@ u8 rtw_do_join(struct adapter *padapter)
 		/* when set_ssid/set_bssid for rtw_do_join(), but scanning queue is empty */
 		/* we try to issue sitesurvey firstly */
 
-		if (pmlmepriv->link_detect_info.busy_traffic == false
-			|| rtw_to_roam(padapter) > 0
-		) {
+		if (!pmlmepriv->link_detect_info.busy_traffic || rtw_to_roam(padapter) > 0) {
 			/*  submit site_survey_cmd */
 			ret = rtw_sitesurvey_cmd(padapter, &pmlmepriv->assoc_ssid, 1, NULL, 0);
 			if (ret != _SUCCESS)
@@ -113,9 +111,8 @@ u8 rtw_do_join(struct adapter *padapter)
 
 				/* when set_ssid/set_bssid for rtw_do_join(), but there are no desired bss in scanning queue */
 				/* we try to issue sitesurvey firstly */
-				if (pmlmepriv->link_detect_info.busy_traffic == false
-					|| rtw_to_roam(padapter) > 0
-				) {
+				if (!pmlmepriv->link_detect_info.busy_traffic ||
+				    rtw_to_roam(padapter) > 0) {
 					ret = rtw_sitesurvey_cmd(padapter, &pmlmepriv->assoc_ssid, 1, NULL, 0);
 					if (ret != _SUCCESS)
 						pmlmepriv->to_join = false;
@@ -379,8 +376,8 @@ u8 rtw_set_802_11_bssid_list_scan(struct adapter *padapter, struct ndis_802_11_s
 		goto exit;
 	}
 
-	if ((check_fwstate(pmlmepriv, _FW_UNDER_SURVEY|_FW_UNDER_LINKING) == true) ||
-		(pmlmepriv->link_detect_info.busy_traffic == true)) {
+	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING) ||
+	    pmlmepriv->link_detect_info.busy_traffic) {
 		/*  Scan or linking is in progress, do nothing. */
 		res = true;
 
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 983669189d41..f0e423cf7627 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1231,7 +1231,7 @@ static int cfg80211_rtw_scan(struct wiphy *wiphy
 		goto check_need_indicate_scan_done;
 	}
 
-	if (pmlmepriv->link_detect_info.busy_traffic == true) {
+	if (pmlmepriv->link_detect_info.busy_traffic) {
 		static unsigned long lastscantime;
 		unsigned long passtime;
 
-- 
2.52.0


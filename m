Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCEA481248
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119839; cv=none; b=br7lWOoz9WC+9t6IaT5rFT5/8Ts9bx5D7jD4yI0vtqGapof3PEyMa+NvJ/PzjBWZxtIsapwPVPT9U+1yLtvH6YRf5G0fFV1kQYENtpsCOIfv20fC+jOoUuMpDlrIM7tJnhYOfSk6Y8Pck14p722QwL49EgDa0Ir+Hz6D9HF90ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119839; c=relaxed/simple;
	bh=yL3MDBeVkAVOB9oDfKbW+0M2Vb7XK/uO0pym0tpxAao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=plJnUgnpu4flnmDXm4WVhKDwW7DPjHeUkg2cxjbuG07RUYzhZqH4h6l6J5fqEigiWV9ywp6gcFk3Bc3r1oForgbEcahvqoYiSp3dFf4DIYyA1HnYa5WOMl/YCz5+lqkf7ev/60ONLWr4xDURovZeFnCFlzKDhF6q/Lhspl8kYsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pkox817F; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pkox817F"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aebd52488cso5790833e87.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119834; x=1784724634; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1XiIWCVLfMVYPMIlR/WL0zQsHXtVSv4kGRxUBvVkPwI=;
        b=pkox817FWKH76Tnk2ZQCFPm33qxWpF/xE2E35y1ka211jKygTeFw0PeN35fPxCgsDW
         1TnVqynSdVad3d4LgrJeI3hixucYU6k42Qu7neo209XVGfAJ39GDjWRL5KJovzQApP9S
         DzhinvJKYMDwXL8z0k+DrONGunhPf0lQzDLj0QXb1Pzjs4aaPjI44NTnaWx8QL3oyGoA
         zZxtOt/R0iarEAxvLG3bkvj4hI3aUC/6SGicpoVEeUTsq25MjiEIEYbijvhI6EjM78Be
         A7jsuvTIiz3rNFdrHNWrPBUIJES+Ep3Jp/ri4YSQtE5ounVqucumSyjGqUQ6Pa7tqbO4
         voAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119834; x=1784724634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1XiIWCVLfMVYPMIlR/WL0zQsHXtVSv4kGRxUBvVkPwI=;
        b=qNuRX44Ct1Y/ucRkZWqhXNWNwQdy9gBE/AWCgi8buP3csiug3V+2qjUdSnGXM+7rtL
         q5TjihinutU8bq+Qc/dh7OnR93P4Kq7IvnjYUCY3WgEgdYbm73m055IGQ7dXkvDKRgCi
         Ie/jDK6g+GpX6IEXyy+EQ5X0a8/ryXC2p8PLusG2GQaBT7uvb9zVLQT3s/W8S61tUq7H
         u+EWEyW35QZ7udk8dljxibUwtCCJiIRjzdZV+S26OF3372or/FvXoF2A1wW7xCKCi8Fu
         gLAW27s9i2kN1BcVJE7fVzxNn0zBxiszvSrU9kdBtU/9hNvTuKHFpIqXZos/vIGqDnp1
         /quA==
X-Gm-Message-State: AOJu0YywIMWM3Uy3D+WNg/oNZ+724iXEGk66wIJkGurweDc9x96Ja6X8
	GAeX7emRorr4myi7hWDDcMxHoxjbgGdeT19yZOojlGoiunaMkwt1udsu
X-Gm-Gg: AfdE7cnv6tjayHIyivzK+Gg2hzAd6xiXJmmLhpjG46bjvkRAsbu2DHQMykjuFG/MDQY
	z59aiDkaOksVqmE3nrNkhnDWMi4WABxHs+EX9GqxZoWJnjNRP0K7nIAHaUWwlNYaciThkzi6hZw
	z80GxP+EvV1eaG2q+GX7w4jtBHGPemNdQWPHA/u9q+9um/xnJAvB/d2Xz3G03JLw509O08Tya+M
	NBK+rmz9saiDjQUAK5YWGywxVuCGfrLTroqDaGoBeIl7iienW6Pve9XjKzFmW2KlwRxW6kCXr20
	bg2vWTmqH893cQxlzzl2pmwub+ppz9jmynV77BepfBkMXlFiTqr86/f4GJsP5xxvScZDGwcoKDL
	rGhsHmRfI4KHzsDY4eyrajyHEV4tZ/fok0d7UK7QRw+HfKN5oBbo6ftrw8eYtAUdq38OeQtxhrS
	8e1B8zf5ZZN3jERiZSQOtRgZ/EeN9FHR6ZJEJCilc7nxKBibQAdzCMsgiqVHi+A3jUh6odDTND0
	9Gf7ng5gtVx1G83JuvjcpXQ
X-Received: by 2002:ac2:5689:0:b0:5ae:b9b3:8ba8 with SMTP id 2adb3069b0e04-5b15d7c2ef5mr635991e87.57.1784119833531;
        Wed, 15 Jul 2026 05:50:33 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:33 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 23/61] staging: rtl8723bs: remove issue_probereq wrapper and rename helper
Date: Wed, 15 Jul 2026 19:47:51 +0700
Message-ID: <20260715124829.90290-24-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the redundant issue_probereq() wrapper function from
rtw_mlme_ext.c, which did nothing but pass fixed default arguments
to _issue_probereq().

Simplify the code by renaming the internal _issue_probereq() helper
to issue_probereq() and exposing its full signature. Update its only
call sites across the driver to pass the required explicit arguments
(0, 1, false) directly.

This eliminates the useless leading underscore naming convention,
reduces unnecessary abstraction layers, and cleans up the MLME
extension interface.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 24 ++++++++++---------
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  3 ++-
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 54690c2fc..0c5770f09 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -2357,7 +2357,7 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 	dump_mgntframe(padapter, pmgntframe);
 }
 
-static int _issue_probereq(struct adapter *padapter,
+int issue_probereq(struct adapter *padapter,
 			   struct ndis_802_11_ssid *pssid,
 			   u8 *da, u8 ch, bool append_wps, bool wait_ack)
 {
@@ -2450,10 +2450,6 @@ static int _issue_probereq(struct adapter *padapter,
 	return ret;
 }
 
-inline void issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da)
-{
-	_issue_probereq(padapter, pssid, da, 0, 1, false);
-}
 
 int issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da, u8 ch, bool append_wps,
 	int try_cnt, int wait_ms)
@@ -2462,7 +2458,7 @@ int issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid,
 	int i = 0;
 
 	do {
-		ret = _issue_probereq(padapter, pssid, da, ch, append_wps,
+		ret = issue_probereq(padapter, pssid, da, ch, append_wps,
 				      wait_ms > 0);
 
 		i++;
@@ -3703,20 +3699,26 @@ void site_survey(struct adapter *padapter)
 
 					/* IOT issue, When wifi_spec is not set, send one probe req without WPS IE. */
 					if (padapter->registrypriv.wifi_spec)
-						issue_probereq(padapter, &(pmlmeext->sitesurvey_res.ssid[i]), NULL);
+						issue_probereq(padapter,
+							&pmlmeext->sitesurvey_res.ssid[i],
+							NULL, 0, 1, false);
 					else
-						issue_probereq_ex(padapter, &(pmlmeext->sitesurvey_res.ssid[i]), NULL, 0, 0, 0, 0);
+						issue_probereq_ex(padapter,
+							&pmlmeext->sitesurvey_res.ssid[i],
+							NULL, 0, 0, 0, 0);
 
-					issue_probereq(padapter, &(pmlmeext->sitesurvey_res.ssid[i]), NULL);
+					issue_probereq(padapter,
+						&pmlmeext->sitesurvey_res.ssid[i],
+						NULL, 0, 1, false);
 				}
 
 				if (pmlmeext->sitesurvey_res.scan_mode == SCAN_ACTIVE) {
 					/* IOT issue, When wifi_spec is not set, send one probe req without WPS IE. */
 					if (padapter->registrypriv.wifi_spec)
-						issue_probereq(padapter, NULL, NULL);
+						issue_probereq(padapter, NULL, NULL, 0, 1, false);
 					else
 						issue_probereq_ex(padapter, NULL, NULL, 0, 0, 0, 0);
-					issue_probereq(padapter, NULL, NULL);
+					issue_probereq(padapter, NULL, NULL, 0, 1, false);
 				}
 			}
 		}
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index a850675d5..ae4c4586f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -539,7 +539,8 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 void issue_assocreq(struct adapter *padapter);
 void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_info *pstat, int pkt_type);
 void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short status);
-void issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da);
+int issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *pssid,
+	u8 *da, u8 ch, bool append_wps, bool wait_ack);
 s32 issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da, u8 ch, bool append_wps, int try_cnt, int wait_ms);
 int issue_nulldata(struct adapter *padapter, unsigned char *da, unsigned int power_mode, int try_cnt, int wait_ms);
 s32 issue_nulldata_in_interrupt(struct adapter *padapter, u8 *da);
-- 
2.55.0


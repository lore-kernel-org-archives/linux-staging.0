Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610DB1F8AC8
	for <linux-staging@lists.linux.dev>; Fri, 23 Jan 2026 21:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769203165; cv=none; b=h4i8Z62F0PSkhNKftOkH/pWgBersOiMQzfy/ehOkIecgAxH2S8l83XwQowKhQ1p7YbMCc0EbMmUBeqldI4ei6h3Wyf7q+uAdOuoJAVmY/Y+red3zcpveMR/WY28XSgF890B9oefYDMI5IXdo6ioionKEXKdyc3B/kpdCCX3niko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769203165; c=relaxed/simple;
	bh=B7lauwC0PhR2Uq6+Y6qtpT1Aei1c7wc9xs9GdTm2JTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lys4bgnEelxZcTy48cnQgsMQ1IHFbwYbwMlLT8U3k2bOemHsUqsVZCJWJkXkYdJMHfmWmyjj6aMy9aJdlJN9RVYlH1thd2VhVarxWyrVpAxz33aPNPfbC6/llVVzhzq+knb4QXS5lAJB7Otog6rUCtH43tCDOaS6GcvPsMaNrPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QYrJ2K2W; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYrJ2K2W"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-81345800791so1872670b3a.0
        for <linux-staging@lists.linux.dev>; Fri, 23 Jan 2026 13:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769203164; x=1769807964; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l7+gptmUu1WgROnTfKUbDotrrabbU+mDCS1QhaivmYM=;
        b=QYrJ2K2WBRXRVm0aRSU9u8OC8pQiHclTOjQX3wpv3bjVZ6jpvW/at2TzkPmBbJyhaz
         EjIuM6iuhvqDCjJIYSt6WyQIemIr2A7z1GkHe2Bc0PlumMjI9YTT1Ccopr2zp9EUTd0d
         AigUVU1fxt8IHPImRkfsbztlNAb7Ll0rbRqsitY6jMMm8uJ8kl68qWjd0xPptWSjPQgV
         cqZbIkp23KULoWwj/I3ddOK8lD/Ey9ZtPxIlPVEVscCjsLzDGp6KxD5MlhyGaKA8lgrx
         VFXnLmkcM2gMZ0Ql68zUUvS4lkrI30KuqXmNCUVOrMZlDwNx2abNqZgP6Sdi4HJgjlEg
         6OBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769203164; x=1769807964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l7+gptmUu1WgROnTfKUbDotrrabbU+mDCS1QhaivmYM=;
        b=nui5/fUPgbJg15slxYjI3+hPQvIgrRZWrg1drxv+FIc58Zr0ViwAcb9T5VX7SPFqhn
         IgMgHJL5+P4+z1o1fw5cblA+jIV7ldZ+0t/OSUtOdN5q0hyIT7k6v5wf/iY1YSCpBYeC
         TkRzULXrFOcF5KHvDuHgmRvzi/63+VgQ0RQ6QZ4UWSAjYQp6iTNN6mqDYjwWoJ/hk/F3
         6LTKgp9ew/Zf+y2asIntVbYZczbXieIFW+FLTI9LScwrw06rBwvGzff+jH/nfZwajLOS
         iLplRYzJX0Jsci7CY3W2gRYidu1ebHRLf2OmciTIuYjmpXg9fhHPWihFUKpI63yJRSkc
         yLIg==
X-Gm-Message-State: AOJu0YxznS+oRWXD2QgnY6gqJxW6DZgxGnhoxjd6XZ1pa0xNIrmgJa1s
	GjESaXx9iTERzmwMn7ZeMTIOIpXdkKZ18voloYqG3D49PKpZUwAgfk1t
X-Gm-Gg: AZuq6aIRpUX1x+PF8Whh0f6zX3UE60xEfiEGYAUvP3qk4Yjw+H27EYqt7fwPngRP8la
	OkNazRCX3xOtkzk4xjNeWIom4kvUMlkzugjGTEP1S/adB9Q7cuTV5W9pr3c3REsQzhVNHaG8Mqe
	Wri38vX5zE7+ClTM99oDUaAp6r86kK1o6ijrRIngDxt0T8DjFWguf1AoF6fd96Re+0JM8gEQaoH
	nHzqLLeS5xdd0tEa4T/eg5+5g9jusnBmufOf9E73Cm7DUf1n8TIYr/I7XbiWF9uzma/U/HANN4g
	jhsRuhyJP1rzG+miIzNFQJCtWYaQeebDt+B9HNzvG4e1os9bYsFaubcCjXS5SquK5iw940pYlJa
	P7Yxi035bjvV1gfbe5lKpTZ/sPdtgbd7Lv3kqZnctZavgj7ldEutdLKqL3tPVCfUyclaY/R7LbV
	CAeJDZbG/wjK3Ry4dpf3BQ3QMhApT3kMax
X-Received: by 2002:a05:6a21:6487:b0:366:14b0:4b04 with SMTP id adf61e73a8af0-38e6f823d1emr4090800637.64.1769203163592;
        Fri, 23 Jan 2026 13:19:23 -0800 (PST)
Received: from tehuang-Alienware-m16-R2.. ([50.47.240.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a141fc4sm2779469a12.8.2026.01.23.13.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 13:19:23 -0800 (PST)
From: Michael Huang <tehsiu.huang@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Huang <tehsiu.huang@gmail.com>
Subject: [PATCH v3 1/2] staging: rtl8723bs: refactor nested loops to reduce indentation
Date: Fri, 23 Jan 2026 13:19:03 -0800
Message-ID: <20260123211904.64589-2-tehsiu.huang@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260123211904.64589-1-tehsiu.huang@gmail.com>
References: <20260123211904.64589-1-tehsiu.huang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use guard clauses (continue statements) to flatten the logic in
rtw_mlme_ext.c. This improves code readability by reducing deep
nesting levels.

Signed-off-by: Michael Huang <tehsiu.huang@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 61 +++++++++++--------
 1 file changed, 35 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index fa1e3ad59254..0ab3629608ce 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -3682,32 +3682,31 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 
 		spin_unlock_bh(&(pmlmepriv->scanned_queue.lock));
 
-
 		for (i = 0; i < 8; i++) {
-			if (ICS[i][0] == 1) {
-				int j, k = 0;
+			int j, k = 0;
 
-				InfoContent[k] = i;
-				/* SET_BSS_INTOLERANT_ELE_REG_CLASS(InfoContent, i); */
-				k++;
+			if (ICS[i][0] != 1)
+				continue;
 
-				for (j = 1; j <= 14; j++) {
-					if (ICS[i][j] == 1) {
-						if (k < 16) {
-							InfoContent[k] = j; /* channel number */
-							/* SET_BSS_INTOLERANT_ELE_CHANNEL(InfoContent+k, j); */
-							k++;
-						}
-					}
-				}
+			InfoContent[k] = i;
+			/* SET_BSS_INTOLERANT_ELE_REG_CLASS(InfoContent, i); */
+			k++;
 
-				pframe = rtw_set_ie(pframe, WLAN_EID_BSS_INTOLERANT_CHL_REPORT, k, InfoContent, &(pattrib->pktlen));
+			for (j = 1; j <= 14; j++) {
+				if (ICS[i][j] != 1)
+					continue;
 
+				if (k < 16) {
+					InfoContent[k] = j; /* channel number */
+					/* SET_BSS_INTOLERANT_ELE_CHANNEL(InfoContent+k, j); */
+					k++;
+				}
 			}
 
+			pframe = rtw_set_ie(pframe,
+					    WLAN_EID_BSS_INTOLERANT_CHL_REPORT,
+					    k, InfoContent, &pattrib->pktlen);
 		}
-
-
 	}
 
 
@@ -3831,14 +3830,24 @@ void site_survey(struct adapter *padapter)
 				int i;
 
 				for (i = 0; i < RTW_SSID_SCAN_AMOUNT; i++) {
-					if (pmlmeext->sitesurvey_res.ssid[i].ssid_length) {
-						/* IOT issue, When wifi_spec is not set, send one probe req without WPS IE. */
-						if (padapter->registrypriv.wifi_spec)
-							issue_probereq(padapter, &(pmlmeext->sitesurvey_res.ssid[i]), NULL);
-						else
-							issue_probereq_ex(padapter, &(pmlmeext->sitesurvey_res.ssid[i]), NULL, 0, 0, 0, 0);
-						issue_probereq(padapter, &(pmlmeext->sitesurvey_res.ssid[i]), NULL);
-					}
+					if (!pmlmeext->sitesurvey_res.ssid[i].ssid_length)
+						continue;
+
+					/* IOT issue, When wifi_spec is not set. */
+					/* Send one probe req without WPS IE. */
+					if (padapter->registrypriv.wifi_spec)
+						issue_probereq(padapter,
+							       &pmlmeext->sitesurvey_res.ssid[i],
+							       NULL);
+					else
+						issue_probereq_ex(padapter,
+								  &pmlmeext->sitesurvey_res.ssid[i],
+								  NULL,
+								  0, 0, 0, 0);
+
+					issue_probereq(padapter,
+						       &pmlmeext->sitesurvey_res.ssid[i],
+						       NULL);
 				}
 
 				if (pmlmeext->sitesurvey_res.scan_mode == SCAN_ACTIVE) {
-- 
2.43.0


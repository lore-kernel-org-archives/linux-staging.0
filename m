Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938392D1911
	for <linux-staging@lists.linux.dev>; Sat, 24 Jan 2026 10:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769251930; cv=none; b=lVbE3TGswk1AIkAnR8s3SxQBZq2MBNmCp3erdNXpWK0U2WzZZSGigknE0P5ddxoIcJXl1LCqnBIy8XtRTfUtyKrm07TPwecgsPlK3Pd3m8+K/f31Sw0yIBhXbqdnmPePejLS1Ep+hFhhoc9E48ZC2xqiil2tbGpvfdZ+h0DvFZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769251930; c=relaxed/simple;
	bh=NAhV+EGTrg4zqg2uM5ltnaeo9F7X2r3mhXGdV/D5phw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hdk/2nRtWsDqvUasSowr+1bl0dkZ7i7hmifsulc9e2A2yFWCMdmXJf3pQBTV7nVT5PUJ8wfNHWD57h2NARNaH36Biz4uFO+zmhxv+8I5NgqKfI2SQCj7Z/McbuNlUblbHJZ65R+32MREcmhdSYtpj3//RO9GrsurbsoQKTUH33o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUQX/Npm; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUQX/Npm"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a0834769f0so20145155ad.2
        for <linux-staging@lists.linux.dev>; Sat, 24 Jan 2026 02:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769251929; x=1769856729; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97+wvAR7vSL2hQOkz8tJI+iHkohzQNf97h734mRTrKo=;
        b=HUQX/NpmXt6pv4cqPG4kUqfoJEhCYCIDAfRWzh41R6nKqsxj6iG30KfGYqLPW6eFek
         ld64WR+vGz0+ksnusJhZnKT2qiwjcxT4vs+Gbd5xCMe+238JD+K5u/IFhBr6hPPiZxgR
         cE60wq7Zj/FtQYrZ+NdQxzucv6eW7oMC5Ftr2pr+XpiZ2qpuTDC75Hd7ZOLhsD6v1rmY
         AKD+LNj7MAkOv/guTbLGUrQkDosN5MW78ZPluwFlHkDMQ007iNyuhbPd/VhFC9aoHJJe
         6S3GV6ZXsDme2kSmPWNswr6wVK41D+rCLU49U1xTrnBxu2Pw2pmynpKpAzWB3+PT5CF1
         5lHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769251929; x=1769856729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=97+wvAR7vSL2hQOkz8tJI+iHkohzQNf97h734mRTrKo=;
        b=fIK8g0X9XDf7JcxeNEAgUJ7TovVyMlIFRP0KgEg49xRLHV/IQXARs/i/RvPN86UiDZ
         pdeb4hn1+VUkfNc1fTrZcNQnuu7CN7r0aukfbjCwK5NpGc4F5C+dpOAINifIaHls/Zk/
         //NSI39zeMj0Hy7vPDjhTBpEEvmmMsNViXCBarO1PzvfS+bTXV5zYLuJwuJb7B9T+jX+
         7Zbej8ZVdu7EiUhye1IEcm8roeefrsiv5jqK0GsxYdOp3BFy+2ogpbMR8yFfvy6LW6YA
         b2tGgyeIuKHTMiZBKjppXxnbdXg7lmW7bE0f1386gkOwjsq8xOpnZXEO5IhO0BGONiSI
         MTvw==
X-Gm-Message-State: AOJu0YyK9x2nx7ItT0bNMCitvIjm4GxBmWxN+MBaxWagvkm8W/kHVDrg
	T4VuGEX7fzhW48XHZB74H+xCQhDr0YmDuKYtMoUoImv3WxXaeh2vyyBd
X-Gm-Gg: AZuq6aIuM98a1pgB5zjWrEy/GVAyMzZSPVVITJASD2XPH//h9iF1yd8c18saHVUHPAz
	dTFfHZPY2hntBqlQiy/RFlRUbNjsDOM8VHM5XxFdn8jIgq4NWe2L5zKgH8+TJujApijVliRQEzZ
	EZO5WKG+IqkQ7puM+c56m4yma0d7938W51VKsHQGdkCps98TB3qZqJcV+coeNb5N380sQW3UUl0
	bLwhPEC25/WvPt0c17mjecmFIPAROXCHzpAg4NyTsaZH8X6Jw6oGmjN7zfiJ7vfI6DL1sAIq3dJ
	QMPcsBfTvC+62Bz+02GfmY0b7I5YOaA9ox4TsyJIXehEE7vC8516m7CemJY/1qcuRPZat6FSbOK
	8r02C7pssL983ORWQHotQk1W+wMs7tAtAJZYhmegrm1RFDXhWzg8QtlKePvj9gTsR7zatro/qDo
	dGfOHXqgxKwNpPzoHwv/ccqGp5Tt24lPQc
X-Received: by 2002:a17:903:2351:b0:2a7:88d2:dd9d with SMTP id d9443c01a7336-2a7fe625dc0mr58381945ad.31.1769251928706;
        Sat, 24 Jan 2026 02:52:08 -0800 (PST)
Received: from tehuang-Alienware-m16-R2.. ([50.47.240.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802de5cd4sm42468985ad.40.2026.01.24.02.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 02:52:08 -0800 (PST)
From: Michael Huang <tehsiu.huang@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Huang <tehsiu.huang@gmail.com>
Subject: [PATCH v4 1/2] staging: rtl8723bs: refactor nested loops to reduce indentation
Date: Sat, 24 Jan 2026 02:49:19 -0800
Message-ID: <20260124104920.5721-2-tehsiu.huang@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260124104920.5721-1-tehsiu.huang@gmail.com>
References: <20260123211904.64589-1-tehsiu.huang@gmail.com>
 <20260124104920.5721-1-tehsiu.huang@gmail.com>
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
Changes in v4:
- Fix canonical patch format by moving the changelog below the "---" line.
- Initial public submission (corrected versioning).

Changes in v3:
- Fix line wrapping in commit description (under 75 chars).
- Properly align multi-line function parameters.
- Remove unnecessary parentheses.
- Add missing Signed-off-by tag.

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


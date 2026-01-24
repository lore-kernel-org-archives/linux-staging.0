Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0C63EBF1E
	for <linux-staging@lists.linux.dev>; Sat, 24 Jan 2026 23:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769296578; cv=none; b=hfpabbc2WBA5viGwDxigX8GG5zpQ01LdFsUOmGEmPYukdb48ZL0tl2enZlxqMy3fGXbumUWqioiGi6KbXUELe2vBo16VxciZBVL43RwjYDKcnoyXgu4MZvW6ysccxDzW/VPISlE7JABQm4ye7hPLss8jn201GGAYWF317Gottys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769296578; c=relaxed/simple;
	bh=rTt4qvkrDSBQ9pwoZIWMf9vIyblhXcDrVn61LbQIFfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c4IGasloj/EnW8cwzU6KAQiWL3U5LEj0PKKl9a704TyiFMi7xvCxSuWC2MB65eo/JoBhaBjzQK/jadOyoBdPvhqsJ6zKTeFQ2rF37rCU3e9LwaFKmScoBjXGIggu27D/aDK3r1xDwGuG6vyHinC0R567+tNBc16nKsfgKb81FZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=klfONFyR; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="klfONFyR"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-81f4ba336b4so3498645b3a.1
        for <linux-staging@lists.linux.dev>; Sat, 24 Jan 2026 15:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769296576; x=1769901376; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYcPiK31VtTFqRLIN2/IL3eoLrIZeAm97Ta0Kdq8bZo=;
        b=klfONFyR7XNDdIrQKwnNtYUe4rvDzfpNEumaUFVrx3XH5TzpaCjJvjc263/CAHibJd
         U+AX2Y+XwpfsfNt4D81E5Cat28ffX4S0zxUZB1Dh3wzukH52BGWglxoPcsXexp0Y5eGG
         soBU+LBn+ixFutUvjs6viJP/eXd7cbqFuLELYgaPbrSSzmfYzKGyGQjhpVK99T6PxuJV
         or36MrOjFMtAbm6HEm1yq3fGWFHYl8XzT773KRrzL+5WfuJ8b1qFvlQmxX633/8lOT+U
         deplq48GtOZZt7fm5Iy92yXGCpyrLEqWMXJpDzva4AlIZiiCrU+YDakoPTJXzcW02fwN
         YmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769296576; x=1769901376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RYcPiK31VtTFqRLIN2/IL3eoLrIZeAm97Ta0Kdq8bZo=;
        b=iO1XxvihQxcP5A4aNun1P3GNID+xEVbh6Fb1Ki+zk4csT80UYryuXzxizHIOougusN
         VjuxOzerBSavTzuV+5AzlWz0EhlamFamoj0/zQxlU3H+4BckV5EI/CIjxJ6yNiFze03P
         uPkOPfjCZYm0tmYiV/QmSMWZ9R3BnRK9LGDUD2LcpThclyQGEdsyPu7iJgsX12QDfUTx
         RO4LLNG71Srhs90id/ziV7lAdknV5eQeTljcK1Mv8Er40QWurU5jkv5DxCEQPfnO8Poa
         k/fJme8QiewS7+bPC5jOqnDZf5eSvHQYZp7MIvVMmap1LYIHSqQXzCHERq2w5/n3yamC
         V3tA==
X-Forwarded-Encrypted: i=1; AJvYcCXqTdO4CU22JwFoVTjh0PUVkcKi7Q4IyqntSgg/pH80rmDZRCcVIzFXcFuUWPKQVglTLxyJLuL0Alu/t/fc@lists.linux.dev
X-Gm-Message-State: AOJu0YwaukCYgX+xvjTzJsQgUTrCy1srjlGX7NKn+Zw6/o50ZVRgquK6
	58IQcTQIH6CSOjDOfJfou2XPtXB8G2kAINcDVS0JoE8XjJnUtVgBOebz
X-Gm-Gg: AZuq6aIRX/UdgT0OUEjVL0kjtdi3zCMZEnqriuoo19LrlGeH2r/JkQjVcz7tVdBI539
	D9qPSjY1p5irK5Oy3uUrm7Vkc6SSwmZgKFn+IKoHnk0xX4Ph22eYgFwn5r2/iuNdan89gUcuqlZ
	uAfJthxfnR6Gj/f6Z25iQtkOnNuBeKr9p6zWF1N+uY9aTcelP+nXRmtZSJbGswxfShrUqGAnFEb
	RQ8MjSwewFAL4/93HZpkfdIXmiVjo/gJztjEpUKegHR5tkNCZd2D3epPxz9JBw5PFS/QbaWBpqR
	cVnOWSDb7ZtTyxF5LxWI7AqALaU7xfVqNdHgmu7uubLhlUdgxd2AZkX/Zx+xNHH41IdQ+46ld33
	zRyV9Z5R26BOZM/XP8q7ti2waEWvuN/FGdjJbk1JJ6kBS/Z6yywQmmctcO7pMlq/9p4JNKvTy/4
	zuiMQCoyJzVSJwVuoebDqpv72GUNTZAgX8
X-Received: by 2002:a05:6a00:7097:b0:821:862e:384d with SMTP id d2e1a72fcca58-8234129e354mr81257b3a.40.1769296576078;
        Sat, 24 Jan 2026 15:16:16 -0800 (PST)
Received: from tehuang-Alienware-m16-R2.. ([50.47.240.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231873bf53sm5604506b3a.45.2026.01.24.15.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 15:16:14 -0800 (PST)
From: Michael Huang <tehsiu.huang@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Huang <tehsiu.huang@gmail.com>
Subject: [PATCH v5 1/7] staging: rtl8723bs: use continue statements to reduce indentation
Date: Sat, 24 Jan 2026 15:15:51 -0800
Message-ID: <20260124231557.18189-2-tehsiu.huang@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260124231557.18189-1-tehsiu.huang@gmail.com>
References: <20260124104920.5721-1-tehsiu.huang@gmail.com>
 <20260124231557.18189-1-tehsiu.huang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor nested if-statements using "continue"
statements. This flattens the logic, reduces deep indentation,
and improves overall code readability.

Signed-off-by: Michael Huang <tehsiu.huang@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 48 ++++++++++---------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index fa1e3ad59254..d80c1a2620e2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -3684,29 +3684,29 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 
 
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
 
-		}
+			pframe = rtw_set_ie(pframe, WLAN_EID_BSS_INTOLERANT_CHL_REPORT, k, InfoContent, &(pattrib->pktlen));
 
+		}
 
 	}
 
@@ -3831,14 +3831,16 @@ void site_survey(struct adapter *padapter)
 				int i;
 
 				for (i = 0; i < RTW_SSID_SCAN_AMOUNT; i++) {
-					if (pmlmeext->sitesurvey_res.ssid[i].ssid_length) {
-						/* IOT issue, When wifi_spec is not set, send one probe req without WPS IE. */
-						if (padapter->registrypriv.wifi_spec)
-							issue_probereq(padapter, &(pmlmeext->sitesurvey_res.ssid[i]), NULL);
-						else
-							issue_probereq_ex(padapter, &(pmlmeext->sitesurvey_res.ssid[i]), NULL, 0, 0, 0, 0);
+					if (!pmlmeext->sitesurvey_res.ssid[i].ssid_length)
+						continue;
+
+					/* IOT issue, When wifi_spec is not set, send one probe req without WPS IE. */
+					if (padapter->registrypriv.wifi_spec)
 						issue_probereq(padapter, &(pmlmeext->sitesurvey_res.ssid[i]), NULL);
-					}
+					else
+						issue_probereq_ex(padapter, &(pmlmeext->sitesurvey_res.ssid[i]), NULL, 0, 0, 0, 0);
+
+					issue_probereq(padapter, &(pmlmeext->sitesurvey_res.ssid[i]), NULL);
 				}
 
 				if (pmlmeext->sitesurvey_res.scan_mode == SCAN_ACTIVE) {
-- 
2.43.0


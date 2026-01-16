Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B8422D781
	for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 16:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768579788; cv=none; b=XZOIloKqSjEqIUQnaiA1kE20KNDYinZWCsYBbImpl3ZYYhc46/DhKDqQT6VYfsD061kcCJ05ArAQe7QJtHAdjFPV5AxYs1KFTuXbFp1g1fhVU7G0HRPlKiKbyLllRYIgDK0CASICxcBQ5bbGdS41aydpzsmnoZ1ztQs+9yviRiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768579788; c=relaxed/simple;
	bh=hD0ctyk3z1lwsqNqBS9z+YXKuHl6FbWbC+3sUQQrANs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V4lovaOosc1NVcoB1PeV5UDrN8p6T1zllB8XxpeM9lYrmRXPjnjXhTIn3NW8ZijbvlVsR57f+zutNjH2wW7X+i+VTezuO7+k63l+v/x8Au5PRow6t0dAcmA3L7rI+0Nl0rUE6+Cc10QNeie/qgRnzBsIYu2k40Hbq9ksvCChFUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZksR83f; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZksR83f"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8c537b9fcbfso225237585a.1
        for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 08:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768579781; x=1769184581; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Rz3BzbAePDh/GESGmxqoJgS1/apuaB7bGaio8ArDl4=;
        b=IZksR83f1xz9VepRCJHoRB4rU00s+BJ5Yc6f9x6/dhK0G7Nz0mtTw+NrRfv6F+H+EE
         pvWTU2lhZyeR5NlXnku8w2XoNIuYjYp1aWBXara7wL2ixtUQU/cPXXUyfQ4ibPTFINVa
         iEqop8qjrCQ9i+xU12K9zCow6YqoOMN4uLw3KLNxxKiKjg7pCDKHWU0G8OrhgNReeSMb
         3KzVpsCsLyBQD5gHEFkuVCTJXDIYkalf54JqF4EADRxpuu5LyRayPdckXPl23l1t6r5O
         D4hg2W5SurhEPsltlft9y1pZkpRMIWRw6TzoRjg6K4haUYb/0VU/yR035rgVmmjMeG4B
         3qQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768579781; x=1769184581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Rz3BzbAePDh/GESGmxqoJgS1/apuaB7bGaio8ArDl4=;
        b=IUe9jiIFmK0tg2pRE0rcFUFt5cz0H1byAVgoULXQ9QaUSSxfyB1keVdqN8/i97u+uB
         Mo09Zi0HcVvD4WbonpRIp+YRKHfrS6m36HML0l8paK5JpSbVJkJAFjylw72gmph2pw6j
         dPIAwb+3kyrkAkLYIEooXFLXhP/sC4cPyRGxPW41scLxNhaEaQ1N56T/ho8pi6dW4v5o
         Tuqzzi3Hm5VkEgK37SO+T+v5ttPDGfajtjBPZiikM1mKfa3LuOv6653zz3Jzty1nrDEU
         qQKOKfVgB3cDKtiDDKgVkZhlEOWMmy0wvRVPwlyC34kDw75NJ00t1NrTUX/65jOduOJG
         Og6A==
X-Gm-Message-State: AOJu0YwmjToSW2uvyQyo9xwva3sdt3uwiUJQT3yJSFJ8yZdNp1+J5KZ6
	WU3eGUyioxe3nkRKzsORDpkAeHY0Mary/KJBoD0kaEA9j9noIAdfqYX7
X-Gm-Gg: AY/fxX7w3ypaaL1duwrLgHDLVqHW6ig4uUQIJ7rWcEL0Riq2rWpiYWvIA15J60wH4Gc
	QOMXjQyrTrjBLXNlgAzgHNjY3UPWWyM/LIZmMBi9dP4zo3dLFGpHv8Ayx3IDXwkRuC8VeQq8BZj
	iyatZZhfXunzozNYkvB832ugyjsQIZeQzJmjfqKYk7/WYHsKf/aVHC6YYVFqfUc5zr7aBYpukmi
	1MxAdv7wgDgsTFjUoAIKp6FikjDD/tK1WtytPKUSzuFhheNiqK75LupJhUmcISiAriyDG2YnWcv
	6atylVgJEo7I4zg/4RcE3rHZMS/BkVdF0YQ0hyVBwR900bpY9enxaqfnq1YFdr4YD52Q1ojGTY/
	fWyz4NoMPWM4p9voIEIja44xi/5DkvuOzX81tnYM7fFhXAFQUVsP3avCWscRSlghshPO1T4gDAz
	E26eQxdEDR7mueglglUIVWsddq
X-Received: by 2002:a05:620a:4588:b0:8b8:7f8d:a8b2 with SMTP id af79cd13be357-8c6a6524b29mr447591985a.44.1768579780567;
        Fri, 16 Jan 2026 08:09:40 -0800 (PST)
Received: from localhost ([132.216.195.103])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a728f2f2sm250248885a.47.2026.01.16.08.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 08:09:40 -0800 (PST)
From: William Hansen-Baird <william.hansen.baird@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	William Hansen-Baird <william.hansen.baird@gmail.com>
Subject: [PATCH 5/5] staging: rtl8723bs: core/rtw_mlme_ext.c: initialize copy_len, clearing later control-flow.
Date: Fri, 16 Jan 2026 11:08:51 -0500
Message-ID: <20260116160914.88069-5-william.hansen.baird@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116160914.88069-1-william.hansen.baird@gmail.com>
References: <20260116160914.88069-1-william.hansen.baird@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initialize copy_len to 0 in rtw_parse_assoc_security_ies function.
This allows later if-statement to not have to explicitly set copy_len to 0.
Thus we can make the if statement single-lined, and remove the braces
from the if-else branch.
The change is purely cosmetic and changes no logic.

Signed-off-by: William Hansen-Baird <william.hansen.baird@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 842e95e1eaec..d470725a033f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -946,6 +946,7 @@ static unsigned short rtw_parse_assoc_security_ies(struct adapter *padapter,
 	pstat->wpa_pairwise_cipher = 0;
 	pstat->wpa2_pairwise_cipher = 0;
 	memset(pstat->wpa_ie, 0, sizeof(pstat->wpa_ie));
+
 	if ((psecuritypriv->wpa_psk & BIT(1)) && elems->rsn_ie) {
 
 		int group_cipher = 0, pairwise_cipher = 0;
@@ -1016,17 +1017,15 @@ static unsigned short rtw_parse_assoc_security_ies(struct adapter *padapter,
 		}
 
 	} else {
-		int copy_len;
+		int copy_len = 0;
 
 		if (psecuritypriv->wpa_psk == 0) 
 			return WLAN_STATUS_INVALID_IE;
 
-		if (elems->wps_ie) {
+		if (elems->wps_ie)
 			pstat->flags |= WLAN_STA_WPS;
-			copy_len = 0;
-		} else {
+		else
 			copy_len = min_t(int, sizeof(pstat->wpa_ie), wpa_ie_len+2);
-		}
 
 		if (copy_len > 0)
 			memcpy(pstat->wpa_ie, wpa_ie-2, copy_len);
-- 
2.52.0


Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBB240DB3F
	for <linux-staging@lists.linux.dev>; Tue,  6 Oct 2026 20:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791317191; cv=none; b=SFHNIl9EKJPFnVvD0aHwRLDAqnFi1MHGqIpCwsrJvhKaGf0L8fykvM900eDZHdTB19HuSo75ReT3XFjjz86V0lkuOxfqJurKWTyOtBY+nxB+CO+Xx7Ztm+iQOu2edzMXxzH0i2MHlzHc5EngbhdJeozAum2eTWWCNhhVw5XHEQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791317191; c=relaxed/simple;
	bh=TIw5lqIwI++o+BW9gqykLWSc9RqLvUR4fxEVOXOCSMI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oMzB8ko5nv9XLBmi12j88A9MaQodN61oCKRxmSum7qwgosxQFQbKt3IasCgZS/OmyUZUg48m9jbe+rpBaoMzJ7mXKTXPgTBRK5dmaM0+wtpo2hihfDRyj/s0Bjeoxmm3RUt0y9C9qs/feaaL7uWgTTXEWA5y0Vf2llCWSlJho7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1z4vwqP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1z4vwqP"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a17b4c6133so10893255e9.1
        for <linux-staging@lists.linux.dev>; Tue, 06 Oct 2026 13:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791317188; x=1791921988; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VUPT3jPI5p4I31iDMdvVFZ1BjY0fbePSrjebk4p17uE=;
        b=J1z4vwqP5Vf5pd9hQDcwavpIAbbz1J6J8huAlgk8ubQFp3r26S/DwkLM1bkQ/diPj6
         afAOq61DCOFLnIg/MiG5+0b4tYLzWSjstZjoW8/nuCg/ZNOLBQQ+8jHI7nU5AHqKWURA
         O+tJtdfG2v6IyJ7r4HW0ptrjGRHD+rTWKA6/RojoALd39/K6YSZv9GpC7WI8W1mI9X5Z
         iOJgKzv3gFV0cSaDWfvFP4oHDebIPtSY12pOgEC+/f1AZ5WxcXs5eBhFP2wZy+sghl8G
         91nrGXJ8rJRB/OEMpB1lfIgf275rx44lLhS1i8Og836c/SJZSkFmPyzaK8EnL3dVcQyX
         duiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791317188; x=1791921988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VUPT3jPI5p4I31iDMdvVFZ1BjY0fbePSrjebk4p17uE=;
        b=iPhhGlQU5gr5+8j0RCDdYdbMJLlXZa8ZEU4LOXoiX20nfhaqFgeXtV1XggSwTMtce6
         d2eXQrt1PDd7VMFpPcFKomRfZTMMvoGTJmo5CAluaoTT/Ru5Qgvs0XVqlieadxlsWfAC
         flv1xgrhQ2a3b360UOKG6PR6ZoDuVSKoWC+6gODTLxYOfCw2OD8sRr55TuNgWLAwOaEb
         CiEG5e4C3Zc8yWd2zNErS+lYP8KLyy2Yj0/L9LDs76vLSCuSHGo3IhVyT8W81wpYjmoM
         PEz8CFIHjWqLnrGHizOdma9sZ6CE+sS98F8kqolcajo51syCcZu4RSMDqFmoUHhPp83S
         m/wg==
X-Gm-Message-State: AFuF++lRBXUV7c2GrvCkMpIMBsr+fNYa8m4vcjjaZ8NnLtkW5Kg7cwoh
	5cqQyt+i2SnVSkY1dH8u555cGIMe4g266QIlSbTUNlR1DDe2HODKtS1x7BI6ffeqgrzevVdO07R
	HqA==
X-Gm-Gg: AYBFou1D6X1o38aEFWt+gRXGEnhk22YaJDjT63uyh3tmlbFI6KkScFQDT85DR89hQ/G
	lebcDfn0Qmlc3WhGuuWRQNpRpAA3I2Dx8m/1hNTE0qwm3RhiArWayeTRczGX5CLvYih1iCD28OM
	TBQssh0R+bUZpiA91SyejbYwtJYrikGOgXkjgsP5RqQ4ZNcBfzNIQIlGBWRI57FlDECWgbkyuUX
	h3FqfOsdsf6zdN09aUKR8PGiOtGLiquHt9HwqAgSjnrzkguPHELBEaAvlPOoWipfo3xyIjMRuYW
	/TZ2F0Ph/Du4dEMXHj94pFkkGxgQs6/mSWfgKaDGGZ4xTNV4dug10bwI/anrnQRWNNaxTi43pKe
	YXBYE1fb2NouyYE1+bOMAs+xLksmGlaSimo6cq2Yr61rq0nX0HFVnLMjdjuPy1C//fQxOy2Rmlm
	6i1oe6M+8WbtwOItu3OsGeAjFAFU5POS3kPhHlTRG+Yo+KfW3VtqevIz818dAu6D0Hq6NcjvD5O
	Au2RB0G
X-Received: by 2002:a05:600c:4e11:b0:49f:bd3c:bc24 with SMTP id 5b1f17b1804b1-4a17b554d8dmr37462435e9.31.1791317188309;
        Tue, 06 Oct 2026 13:06:28 -0700 (PDT)
Received: from fedora.domain.name ([217.218.153.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f446f4csm6772595e9.2.2026.10.06.13.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:06:27 -0700 (PDT)
From: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
Subject: [PATCH] staging: rtl8723bs: use u8 instead of unsigned char in NDIS typedefs
Date: Tue,  6 Oct 2026 23:36:22 +0330
Message-ID: <20261006200622.41856-1-ampr.mhd@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
---
 drivers/staging/rtl8723bs/include/wlan_bssdef.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index f4c1456f1..df541e956 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -15,8 +15,8 @@
 #define NDIS_802_11_LENGTH_RATES        8
 #define NDIS_802_11_LENGTH_RATES_EX     16
 
-typedef unsigned char   NDIS_802_11_RATES[NDIS_802_11_LENGTH_RATES];        /*  Set of 8 data rates */
-typedef unsigned char   NDIS_802_11_RATES_EX[NDIS_802_11_LENGTH_RATES_EX];  /*  Set of 16 data rates */
+typedef u8 NDIS_802_11_RATES[NDIS_802_11_LENGTH_RATES];        /*  Set of 8 data rates */
+typedef u8 NDIS_802_11_RATES_EX[NDIS_802_11_LENGTH_RATES_EX];  /*  Set of 16 data rates */
 
 struct ndis_802_11_ssid {
 	u32 ssid_length;
-- 
2.55.0


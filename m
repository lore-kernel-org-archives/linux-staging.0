Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CA53FCC
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:25:22 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id r7so10511759edd.6
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iEzDdyzAFFu2bR5f0c3Tr73sdtBpa1SXUiajkJlqtqo=;
        b=Re/a24RAUfZmH/BkWRHqTcEa91oIeYt67Y+OfWQyi1Y/HB07tmzzRyI5sp+mToMPdd
         E/K/AVGKn9Slq5VgFJ+fT9M23aGh5dEwTL+Qv/ZlIIL018VwyPHJWV0Wkxrtx/FLlOLZ
         3lvjFy996DI5+2SXzEMKTwhdWfZD+jQFPjRpt6RKL0/N+ERzuKptHUCpYFP8JvM/kBWA
         AMYKAd3T/L8wR8DVkkBE5xshFT+r4YMe8FWaW+uyfxQ8GNh6l9y/s13WgD/C+jHWgIRI
         /XxsM8pW0VbBPYOAAsL/mRReq8iiMv9jVAqf5WGVAPf4sdcd6cTYOvbl4vRWF/86ji8F
         K6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iEzDdyzAFFu2bR5f0c3Tr73sdtBpa1SXUiajkJlqtqo=;
        b=UKyBw03XkipDk4MYjtaATyb+FL25n4neSg1WBISMFv7l45w4qC6eeZb+g1fXK7Bawm
         saTlfNlIOZsPVGhtGuSNWKuAra1gDaDeONQ+pokoQvqrSo2FCFEjlSIj121dCsDfQkea
         tBiOoLcGoahnDajyGpL2DHEWaPBmneuQh52w7bvSiQhR6gI48zyvtMopG+mW/S78m1bS
         a0+JP7f0iY6fX8y+4rmxBOgtj45h2kwmK9oTlW/NeidxRpYQJyAFfMu6Qya+IgnGRnXW
         b5I1kH3KMB41ERVYn8BR/k8wscxVosqaaMDMH9QL8RqlxfQbtl2jJ/wucFwgIzKne2qe
         EfvA==
X-Gm-Message-State: AOAM532unKL9IB/NKOwPH7MS+eqkpyHJ/DiXra5n11sOKhGumVbFLpJe
	zm7zmzw/3KtWfXRncZLrkJQ=
X-Google-Smtp-Source: ABdhPJxU6cYdWEj67Lz4NFWNJTsQvj75qefQtrVkDBMTut0/ox4dItWiU+H+YQxO+BREj7zuqcNSpw==
X-Received: by 2002:a50:f0da:: with SMTP id a26mr14709372edm.58.1630952721243;
        Mon, 06 Sep 2021 11:25:21 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id s25sm4284492ejq.17.2021.09.06.11.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:25:20 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 27/40] staging: r8188eu: remove empty comments
Date: Mon,  6 Sep 2021 20:24:25 +0200
Message-Id: <20210906182438.5417-28-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906182438.5417-1-straube.linux@gmail.com>
References: <20210906182438.5417-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove empty comments.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_efuse.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_efuse.c b/drivers/staging/r8188eu/core/rtw_efuse.c
index bae9a32ec27e..9196a7925940 100644
--- a/drivers/staging/r8188eu/core/rtw_efuse.c
+++ b/drivers/staging/r8188eu/core/rtw_efuse.c
@@ -25,10 +25,9 @@ u8 fakeBTEfuseInitMap[EFUSE_BT_MAX_MAP_LEN] = {0};
 u8 fakeBTEfuseModifiedMap[EFUSE_BT_MAX_MAP_LEN] = {0};
 /*------------------------Define local variable------------------------------*/
 
-/*  */
 #define REG_EFUSE_CTRL		0x0030
 #define EFUSE_CTRL			REG_EFUSE_CTRL		/*  E-Fuse Control. */
-/*  */
+
 static bool Efuse_Read1ByteFromFakeContent(struct adapter *pAdapter,
 					   u16 Offset,
 					   u8 *Value)
@@ -364,14 +363,14 @@ u8 rtw_efuse_access(struct adapter *padapter, u8 write, u16 start_addr, u16 cnts
 
 	return res;
 }
-/*  */
+
 u16 efuse_GetMaxSize(struct adapter *padapter)
 {
 	u16 max_size;
 	rtl8188e_EFUSE_GetEfuseDefinition(padapter, EFUSE_WIFI, TYPE_AVAILABLE_EFUSE_BYTES_TOTAL, (void *)&max_size, false);
 	return max_size;
 }
-/*  */
+
 u8 efuse_GetCurrentSize(struct adapter *padapter, u16 *size)
 {
 	rtl8188e_EfusePowerSwitch(padapter, false, true);
@@ -380,7 +379,7 @@ u8 efuse_GetCurrentSize(struct adapter *padapter, u16 *size)
 
 	return _SUCCESS;
 }
-/*  */
+
 u8 rtw_efuse_map_read(struct adapter *padapter, u16 addr, u16 cnts, u8 *data)
 {
 	u16 mapLen = 0;
@@ -416,7 +415,7 @@ u8 rtw_BT_efuse_map_read(struct adapter *padapter, u16 addr, u16 cnts, u8 *data)
 
 	return _SUCCESS;
 }
-/*  */
+
 u8 rtw_efuse_map_write(struct adapter *padapter, u16 addr, u16 cnts, u8 *data)
 {
 	u8 offset, word_en;
@@ -508,7 +507,6 @@ u8 rtw_efuse_map_write(struct adapter *padapter, u16 addr, u16 cnts, u8 *data)
 	return ret;
 }
 
-/*  */
 u8 rtw_BT_efuse_map_write(struct adapter *padapter, u16 addr, u16 cnts, u8 *data)
 {
 	u8 offset, word_en;
-- 
2.33.0


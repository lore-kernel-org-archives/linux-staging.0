Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1E2BA2D
	for <linux-staging@lists.linux.dev>; Sun, 26 May 2024 11:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716722449; cv=none; b=MwhXgI5DhNoQlnH4VxvoJahOCWlWir88IR6VDpJ192e70dmRiKl7ZUUvrdasRj/CT9WovTMDXvvWjSvWVCAExKHmsxa1LfUdHTlyPXxlLXE9vdmkKKKVB3UuNfV4FB+Pj9nH0jBx+jsStf0GHCrO/6QP93riV0DodlwRJ/8L3r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716722449; c=relaxed/simple;
	bh=2KJRg3rxgw4WdUGj6+yaSTtcYpu9GqNWKKviyIlmQEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=buWIAU79OV1afxmMRKbo3mPXJ2Czy4rruBQ8H8f34yXhaNyGGTM/jjmAAwS6ZBJjAjfCpV7jjvPFG6LEKos0wTgfYLW/Pc+H4JN/UtVNfrzOxKeR7GFzEbseGI2pIZWBU7ro74TB3AD0SiR68xg42O2fRSIzvW4c5xNe52KuhAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P6IULOwD; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P6IULOwD"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5755fafa5a7so9873192a12.1
        for <linux-staging@lists.linux.dev>; Sun, 26 May 2024 04:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716722445; x=1717327245; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8IWKpCZ28tVsNAru3OI66zH7hDNq0tpB9AZz0FdEa4s=;
        b=P6IULOwDrYwEMDIKdVIy8+1UXmENhMITHIXvE4cHldurxuzWfkycZ9VnxNNP2KMekT
         Sf2+NSe1UXXHIUWG/Vac88MiyGKKmiMH0TedHaUrX1z2L3j4azEumJmeT0k8UIMuFfoz
         0klY5GBL4xEVQ0NiHDHcATTtf5K9PZ0SoQSdql9GCLF8irkgFTlEOI/MxvF+MDq4zmzc
         qZclx2xv2VqRoo+UH8O+eOKm8XByyXS9VqDhyjaZpf3Qagi8tnaRuMey17PGhkv24/ji
         SwYW3/8BjnUK3jODlM7D3GvR0JUtsQkeJNuI3C9SPhFFzuOC+hRVjIcYGRsRllFC89B6
         ZyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716722445; x=1717327245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8IWKpCZ28tVsNAru3OI66zH7hDNq0tpB9AZz0FdEa4s=;
        b=SVRNKSo6c5M06TCcaccEltHdlNpQ3Zci6YOp+vNE1xty6puSupJt13iGDlMg4pvuAH
         IjfsSZCIOqpXh+t+TmN0/anFnkarSTmeAjagOYs/RvqJR9aZvvKf7zEP7uf+Ly5VceC7
         fVrWp7NXjTM72cg48fVCevFjacSBHqUCCY+k9gNWNFxuUs7JR4jKuPIENsVMu/NoScuC
         xZGvyKj0oHnKiF460gUxSzqgsMHfZE+NSuJ7NvoTJYaMSxO2Oqqi7NcC9iE2rOTM8FQs
         SQfpTXstJoGrP483WAJNMPyvl+pK90jg35vHoZu6SZAxPUn5D9I8YUaaLsjPCcvzp4bk
         x1Ew==
X-Forwarded-Encrypted: i=1; AJvYcCVA9d7yQ7pPPyKX1jgUwfVpQymKAhZX9GR0JFpbkjJg7aiPKs9mTaSPXXwbCqApgOY32mxTCVUaU8WM6yPjNy9GZPvavwUBsVTZ0aSNYQ==
X-Gm-Message-State: AOJu0Yy1PyLemcKBH/G5z05AT2ptwnHbgZp3Up5kHywr9DZAT4Po365Y
	d9Bjtm1m0s8+Cm0fAcZCIrAcgbjXzEaupuwz60vU+CbTlkgrJRgr
X-Google-Smtp-Source: AGHT+IGb9pWHY5MwLKWjj4bkOvPj+V1TzZGffzKKFlAOIc2hqsj5ZU1m2qeFlw9/EUo+lBZpSOUVjg==
X-Received: by 2002:a17:907:a19f:b0:a62:2eca:4f15 with SMTP id a640c23a62f3a-a6265128c48mr448892666b.48.1716722444622;
        Sun, 26 May 2024 04:20:44 -0700 (PDT)
Received: from localhost.localdomain (ip-77-25-34-87.web.vodafone.de. [77.25.34.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc8e534sm373983366b.170.2024.05.26.04.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 May 2024 04:20:44 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/3] staging: rtl8192e: remove unnecessary line breaks
Date: Sun, 26 May 2024 13:19:27 +0200
Message-ID: <20240526111928.14574-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240526111928.14574-1-straube.linux@gmail.com>
References: <20240526111928.14574-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove some unnecessary line breaks after '=' and '==' to improve
readability.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 24 ++++++++--------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 2fda44c5a412..5392d2daf870 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -1392,8 +1392,7 @@ static void _rtl92e_dm_rx_path_sel_byrssi(struct net_device *dev)
 				continue;
 
 			rf_num++;
-			cur_cck_pwdb =
-					dm_rx_path_sel_table.cck_pwdb_sta[i];
+			cur_cck_pwdb = dm_rx_path_sel_table.cck_pwdb_sta[i];
 
 			if (rf_num == 1) {
 				cck_rx_ver2_max_index = i;
@@ -1412,27 +1411,20 @@ static void _rtl92e_dm_rx_path_sel_byrssi(struct net_device *dev)
 				}
 			} else {
 				if (cur_cck_pwdb > tmp_cck_max_pwdb) {
-					tmp_cck_sec_pwdb =
-							tmp_cck_max_pwdb;
-					cck_rx_ver2_sec_index =
-							cck_rx_ver2_max_index;
+					tmp_cck_sec_pwdb = tmp_cck_max_pwdb;
+					cck_rx_ver2_sec_index = cck_rx_ver2_max_index;
 					tmp_cck_max_pwdb = cur_cck_pwdb;
 					cck_rx_ver2_max_index = i;
-				} else if (cur_cck_pwdb ==
-						tmp_cck_max_pwdb) {
+				} else if (cur_cck_pwdb == tmp_cck_max_pwdb) {
 					tmp_cck_sec_pwdb = cur_cck_pwdb;
 					cck_rx_ver2_sec_index = i;
 				} else if (PWDB_IN_RANGE) {
 					tmp_cck_sec_pwdb = cur_cck_pwdb;
 					cck_rx_ver2_sec_index = i;
-				} else if (cur_cck_pwdb ==
-						tmp_cck_sec_pwdb) {
-					if (tmp_cck_sec_pwdb ==
-						tmp_cck_min_pwdb) {
-						tmp_cck_sec_pwdb =
-								cur_cck_pwdb;
-						cck_rx_ver2_sec_index =
-								i;
+				} else if (cur_cck_pwdb == tmp_cck_sec_pwdb) {
+					if (tmp_cck_sec_pwdb == tmp_cck_min_pwdb) {
+						tmp_cck_sec_pwdb = cur_cck_pwdb;
+						cck_rx_ver2_sec_index = i;
 					}
 				} else if ((cur_cck_pwdb < tmp_cck_sec_pwdb) &&
 						(cur_cck_pwdb > tmp_cck_min_pwdb)) {
-- 
2.45.1


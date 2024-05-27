Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4145813AA37
	for <linux-staging@lists.linux.dev>; Mon, 27 May 2024 09:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716803155; cv=none; b=NZelg6FiSAYQ4BHAIVQRNaIEB2C4yhaGomN6f3kjNjQZt29xUw8oBw6JK4dXgaMiLHSLmez5rdstz4tqja6fjwQUTbeOU8GdW8ABe0hmq+yrN7vzSckSluVsKOMPU1gSa++/vzp++41mh6IzfSrCwmUfO3A6C73I2ukhUkCj4lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716803155; c=relaxed/simple;
	bh=WflIQoeUamn8PO2OKh5VSMS4KpxPJy/grFXhGMPOAe0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d4pajSo3G8nZ/B6iRaxqed+pE0Uf+6kc2c/PuW42BtsgfislA2t70RDyHSQW8qq3WBz2Uobh2mWfsHZ28qKPmIsIKSOfAMA8NMUmwMnvaVQH0uTistoijs1adhNAHKByTdwxlER1IDSYGDMe0Dy39ovVYnBNTu+1oiuIJFzQSrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aM9Xsjnx; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aM9Xsjnx"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5785e443cf4so2869568a12.3
        for <linux-staging@lists.linux.dev>; Mon, 27 May 2024 02:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716803152; x=1717407952; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCU3XZH1xof6IMBlikDcCMM2jat2Zoq5blIFKcFiWcU=;
        b=aM9XsjnxjZr1U4HkIwYJCTwCql7ua4wu7iOLCbzKml0T6yAnCwxF5a33+Un9tNQXYo
         VcN2xmBrf2pEh1m9x740TnrHmVZdbHH0eGgSyfv/f54C/2fEvetKgZjeG2Ody8lna12j
         ot4MUU45jCQEmO88V+z/PSK2oLbFvgo6MksN6iBcpO0Yq5U1ONfwtXpcSYItwpvxC++T
         fvDpYMghP8RIgm5KwvZSUWIQNd/4D49BupCJy2wd4XEAJEx15DJ1+rcZLT/x+yjGCtJl
         O00SKSUiAPd3GB7w74asFGfZB2FeW6mcQ3NW5aRaIkyLnn4RLFRYdoHXWMX4cZlWZASj
         R3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716803152; x=1717407952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZCU3XZH1xof6IMBlikDcCMM2jat2Zoq5blIFKcFiWcU=;
        b=SgEHsBND00EcRKkONlolIw8wcq93/FRUXj+WjvB944jlo7J1HDl8JfNM0VvGXg8pxV
         qiXYi8qJ0zT7jkl90nEWRqIPear19U3p+n1zJXJ3guJbPEj01ulSB+TnWExuv1F0OHJx
         HNx9VnwbJLd0lUZuclU/8apml6BfzRwMApYNnN1k/9olqTzbiPKnLfu6GSlPE5vj9zXg
         C+mwfwQqVZh1n99IhRMfUarkPaNbnu9H3T18E51EfY+1YqfTdiNZkz+ANywlkD8e7hCr
         16MglFL4XQ8J5+uFkapdPZx/rzvkKjgmxNja33TQVr5C9lFAGJlCotcRLoRCvSgaT0m4
         At/w==
X-Forwarded-Encrypted: i=1; AJvYcCVysD1+hVcUDuq8OMkd9AsVpAwf9g8Y3d8XaE85GSZ6+Y6NuP7tFahTYp51/IPypUDKiCZgNUa+G9MokI4/Ts7hcZ0yS3pIyVlYmmiusA==
X-Gm-Message-State: AOJu0YwS7Lupq2Lmb5l9EmDNOAdBwCf8vUeEuFX0Cv8dM64oiwS5Gs5U
	LHQuijDdPZ8mW2t+cyYIsa8xNkoqAn7hHgr25coSvYbERcCi25uZ
X-Google-Smtp-Source: AGHT+IFCyaJZWTGFtwyvFpUuoVfenu2rfxpVDS9Di1Q0IN+mizrFBCaT9vyhskDyjLy7ncb8AVoMEw==
X-Received: by 2002:a50:9514:0:b0:578:6c19:47fa with SMTP id 4fb4d7f45d1cf-5786c195f61mr4100819a12.22.1716803152358;
        Mon, 27 May 2024 02:45:52 -0700 (PDT)
Received: from localhost.localdomain (ip-77-25-34-87.web.vodafone.de. [77.25.34.87])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-579c6c72ed3sm2304178a12.87.2024.05.27.02.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 02:45:52 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	namcao@linutronix.de,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 2/2] staging: rtl8192e: remove unnecessary line breaks
Date: Mon, 27 May 2024 11:45:27 +0200
Message-ID: <20240527094527.2046-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240527094527.2046-1-straube.linux@gmail.com>
References: <20240527094527.2046-1-straube.linux@gmail.com>
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
Reviewed-by: Nam Cao <namcao@linutronix.de>
---
v1 -> v2:
Added Nam Cao's reviewed-by tag from v1

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


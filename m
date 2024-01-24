Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20881386DF
	for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 22:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706136306; cv=none; b=hkv3QAVnZd57t5zhMfEh46gla68RyBWN5xfApkmwTtttbkFD1joQRLezlNqo99daED0Jbn7EjSndMTIR+sTtFznZCzMFiXZpRpBLUKAVndCh48tqDsIctX4AYG8OhmiaqaAuUXRVZGcyK33GmE0ic3+ugIbTl+sOsjpLSrdPSAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706136306; c=relaxed/simple;
	bh=DJJM8ourMI8YOLSjcnuIiMGG/Ch85Npyxy4IyOv1k2s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PMCANQnGMUyxO4Qofqw5E/lvhT8DJDKUbmQ0/Zly6u1uHe6PV2JhtiZvq0quGjp/R4kPk1Lj240V7AlSzRVkUSwTSkSNsDkUOKZo26JBBPT2b77TELH8xCzcLKw9RZrbKU1ZE/R8cEzwOix9LYZwK5/7ZvyfO5BOk3nle7U8hCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=G8MoLaea; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="G8MoLaea"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d75c97ea6aso1137495ad.1
        for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 14:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706136304; x=1706741104; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fa5epUckBwc59OQqx8+WcaToiqilCl96layeKKlW1wA=;
        b=G8MoLaea2OAOsoQZpFbi4dXOf+kYnTIywSGBqMEr5UP0bjzzHxIdlpwVexvDAYMNuu
         5/xCp964ECFW3Fq+vm5jjcUOJZ2BYfeqxHov0bhTsDRRRnm0+IZUyvUiz6OiRoQDV1zN
         2pcj4mRDsoCg8biEsa+i60eGcQHsCWqreGeaYbWRz+h0OiHVou+n3X+6gOzBuhqWJJLB
         OQkDUsUrTqVqPSH0n4ziqDOXvh5OpeUzBLqXmsGFfBuD5EemGDYnls7jC1k2mdenC2OV
         TcMHXi+Y6y0Bem6UxCWUB5Bd5wWncI3L3gE4TZtLp0FkCVxdzBksQgvchr5M5bkEeEt0
         Mh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706136304; x=1706741104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fa5epUckBwc59OQqx8+WcaToiqilCl96layeKKlW1wA=;
        b=Gr4LcNwfoY3oC5qgXFz7Tp0gf9lNITf5HwKV4DZqcdkBA16BYiuGGd+olQuYyBFI9u
         vhbVbal++6zL/R5R6Ghc1rulOdcTfvbqY337XNAwfqg6ROFuteCbVdiWGFxBmmnyjpDV
         P8skqqURIiPbo2178fSN36oIjnJi3Wlmfb6T+FG/QiSQyzpHiBQpawWkV09grB0sjTby
         cGyozCOpRjVka/kqrM/r3V+Jbh+lnHM1hTl26M7PkM/SYTlxKARlG6Zrn0zMBWv6Plah
         lOH+3smL6I/lYBF+NMij+zbyLj+1XK+kalK8t6DxBWU6bytbBWOpigYPUlTcR9HwL6vf
         K2bw==
X-Gm-Message-State: AOJu0YzADvsI8/ySvruZAdTz39Hc3+SN41A+vd8Yets6vthRFiP7yE2h
	v5yhC3xKflA2/GjrgP/iChAe5IPIRB9elmkXwaJnRPy/RH/CwmujdywMe6KnDb8=
X-Google-Smtp-Source: AGHT+IF2Q69nmyZX52NssPpNhs/qhCQwjcYYmyUrjRUIxPp3YDjHXbBnqzIIGgodhF42Xw3+hSfzEA==
X-Received: by 2002:a17:903:24c:b0:1d0:4802:3b6c with SMTP id j12-20020a170903024c00b001d048023b6cmr64614plh.4.1706136304108;
        Wed, 24 Jan 2024 14:45:04 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id i5-20020a170902c28500b001d73a2acc0csm6743987pld.283.2024.01.24.14.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 14:45:03 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 09/18] Staging: rtl8192e: Rename variable LPSAwakeIntvl
Date: Wed, 24 Jan 2024 14:44:43 -0800
Message-Id: <20240124224452.968724-10-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240124224452.968724-1-tdavies@darkphysics.net>
References: <20240124224452.968724-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable LPSAwakeIntvl to lps_awake_intvl to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h         |  2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c | 26 +++++++++++------------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index c380d1c3e9b6..8de46b61416b 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1072,7 +1072,7 @@ struct rt_pwr_save_ctrl {
 
 	bool				bLeisurePs;
 	u8				LpsIdleCount;
-	u8				LPSAwakeIntvl;
+	u8				lps_awake_intvl;
 
 	u32				CurPsLevel;
 };
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 9ee6364f7b00..545f79387991 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1379,15 +1379,15 @@ static short rtllib_sta_ps_sleep(struct rtllib_device *ieee, u64 *time)
 
 	if (time) {
 		if (ieee->awake_pkt_sent) {
-			psc->LPSAwakeIntvl = 1;
+			psc->lps_awake_intvl = 1;
 		} else {
 			u8 max_period = 5;
 
-			if (psc->LPSAwakeIntvl == 0)
-				psc->LPSAwakeIntvl = 1;
-			psc->LPSAwakeIntvl = (psc->LPSAwakeIntvl >=
+			if (psc->lps_awake_intvl == 0)
+				psc->lps_awake_intvl = 1;
+			psc->lps_awake_intvl = (psc->lps_awake_intvl >=
 					       max_period) ? max_period :
-					       (psc->LPSAwakeIntvl + 1);
+					       (psc->lps_awake_intvl + 1);
 		}
 		{
 			u8 lps_awake_intvl_tmp = 0;
@@ -1395,23 +1395,23 @@ static short rtllib_sta_ps_sleep(struct rtllib_device *ieee, u64 *time)
 			u8 count = ieee->current_network.tim.tim_count;
 
 			if (count == 0) {
-				if (psc->LPSAwakeIntvl > period)
+				if (psc->lps_awake_intvl > period)
 					lps_awake_intvl_tmp = period +
-						 (psc->LPSAwakeIntvl -
+						 (psc->lps_awake_intvl -
 						 period) -
-						 ((psc->LPSAwakeIntvl - period) %
+						 ((psc->lps_awake_intvl - period) %
 						 period);
 				else
-					lps_awake_intvl_tmp = psc->LPSAwakeIntvl;
+					lps_awake_intvl_tmp = psc->lps_awake_intvl;
 
 			} else {
-				if (psc->LPSAwakeIntvl >
+				if (psc->lps_awake_intvl >
 				    ieee->current_network.tim.tim_count)
 					lps_awake_intvl_tmp = count +
-					(psc->LPSAwakeIntvl - count) -
-					((psc->LPSAwakeIntvl - count) % period);
+					(psc->lps_awake_intvl - count) -
+					((psc->lps_awake_intvl - count) % period);
 				else
-					lps_awake_intvl_tmp = psc->LPSAwakeIntvl;
+					lps_awake_intvl_tmp = psc->lps_awake_intvl;
 			}
 
 		*time = ieee->current_network.last_dtim_sta_time
-- 
2.39.2


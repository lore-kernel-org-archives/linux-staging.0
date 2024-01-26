Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B7351C53
	for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 22:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706308307; cv=none; b=QyO9rfsd9Iw98fHqWRvLUOtdUqVByty8LBIFn7OsVvSMHWKiylrBlBkPyXGEls1YGf7cMnagpw9ialr935IcjMO0FdfVJb9w/64TZzMLcgm+d6LwlYHeU2ICDGnwJ7WagIl7XnPBPUo8B6V2+s81Kkw7VttGcl4LBtkER4xpw64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706308307; c=relaxed/simple;
	bh=XYHmNCHS2lZ0tCizaQyAD8HMmTWaEZnNSfa3xJDCaEY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qKFKMR0uqOL+TGknOu1FlxunzCcx7TirzdrM2z4CexSbgdg7SD182XEqC6WX1s8taJr/oMP79N8lJtRfJq/Uk/1VRjmQHMfHGM3l5BJvp0TpklzaovD7xDxriUWeGQZpf0WMExb0RVUBWNm/kGOoag14amCVKrBXKyHX5McC3q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=Xrd7Asiy; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="Xrd7Asiy"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d746856d85so7438795ad.0
        for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 14:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706308305; x=1706913105; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcxJDHEfCk1y2I/MmdCghduQrzDXHBl54C/3QCx3wdg=;
        b=Xrd7AsiyFQW7zwbQrS5o9uC7LUQeJtY8IF4hsLVmPlF2sikA1Cw+7WpTgxchrLZdP8
         s8+q8j9HWl8XyqGIEjInC4FTbkIXHLYWv1BisxbML807NMxYBsgTQ0rOD5/dj93tIXB4
         It9ShWLqIKR1QSP4uQk6h493+EoQMJKSObb8MM2lNbvcWYao2pvDv66oc7ky4A//9/cZ
         m5OG/koGhdl6BKRy2thPAu/wC0Xg0likd/kTxccqgv54+t7c+2ih/rWJKK8XhlBz0/0l
         wKMEEfC8/e1ZuCqYia9cuDOhoM/Lq9dKC67wTo4fPvZqJ9ML9RI1NIuqnxNyE46JNAgI
         yJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706308305; x=1706913105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UcxJDHEfCk1y2I/MmdCghduQrzDXHBl54C/3QCx3wdg=;
        b=j5dBRbpk8RoW8ReIye+9UlEMTcm1x1oEWo9d+LQp7jCg6Sxg2uRs2qmECBF/38uU20
         Ietapibj0/5uj3+hMuhIJDBCVW0Is/Cg53aybUFVNmVNw15ni0rvK4FQ91PHXrjIn9bY
         i+FAjZ71RCp/YXI2VXWA1lWLD8eZ5N/PSip6HlNPBzs4QZ9qbWLrtUDBZNT3DYXznEtN
         fcHODSdV2hMbs0g78PJD4U3KHC6CG/VxNrdN0Y7lfeCC/s1dSsWZ9xGsjdKDmrz5b8rx
         BEJXkWQNasj8QKIBG8foqj8wOz9frWCCJFvvCNwihBWqMS/udF9eG6aQi8Km7LPxvOVQ
         9ilg==
X-Gm-Message-State: AOJu0YzJLMStQW4kwjKdZUXgI+aYY667tOLlXD2QOp50tQ7aHEu52SDe
	MYDC2hKNe0MrQi3uzWqEOD/WmI/MFclmfZ7h5J+f5nLvva/2pVJlMbKnAQuZv7GpLoCVGKOQT13
	Z
X-Google-Smtp-Source: AGHT+IH6bhRe2mX8pIcrYjZUu9d0qjWd7b7lw7LkbzaXLVnrDcMy7TynOC28MTNFfmky4kcdJS78hQ==
X-Received: by 2002:a17:902:e5c6:b0:1d6:fdf4:a97d with SMTP id u6-20020a170902e5c600b001d6fdf4a97dmr477678plf.50.1706308304877;
        Fri, 26 Jan 2024 14:31:44 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902d0c100b001d8a8f431b7sm737909pln.300.2024.01.26.14.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 14:31:44 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 09/18] Staging: rtl8192e: Rename variable LPSAwakeIntvl
Date: Fri, 26 Jan 2024 14:30:57 -0800
Message-Id: <20240126223106.986093-10-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126223106.986093-1-tdavies@darkphysics.net>
References: <20240126223106.986093-1-tdavies@darkphysics.net>
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
v2: No Changes.
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


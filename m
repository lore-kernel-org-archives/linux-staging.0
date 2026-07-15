Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D763909A3
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119861; cv=none; b=lvk+0ChzjqUYwRxqcfeGJvzHvLaCCzNdrM4Ahlg4aLeVP0PTvnLXkGcSY6JU9XhbENF3fe88mmMRcpiqSGys/x7mO/s3dIK4L8gkSX6b9Gvf83XpAYSYph69jJ6MpIT9jP/cN+AB9CtT81xOHST8pxbS6fZL+PBqulViGm0J+P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119861; c=relaxed/simple;
	bh=xlFC6HLoV2n1vFY6zAXQKisCqIRVD1f4N5Bs+wu8YGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gF1Vn6QdoTi2VdnVhWVc8x44CWigxiB3T1mGAylwFPOQiHum05BMyBN1E9Ism7MzrNrxcVdAMUeTmcU676j7LzWcp09LspZlone4u0AETf0DikSsn3EUsCyAUZfABueF6RMp5jKmfNuK7SYNmvVjOEi2TZ9R88NpQ7w5igjyJu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jd8wjs7o; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jd8wjs7o"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aeb5e85378so5766187e87.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119849; x=1784724649; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dr2lce3rXypZeYHhFi4dr63szYheMvNYAGHnVpT1kRQ=;
        b=Jd8wjs7ofMgmcByQLtK0tkxLdqEiwFWwnFJl5ylZ4fGoM7oUI63hEdLrZzUuvF3tXI
         2cZaJAFC378etIxY8/t4HY9kYn76SUlXNlR24typ6pKpK2XKxEByZQVCd8kWBvX66Dzb
         pM19I8zlYR68lYT4skfrwAYjW5c748s9p2EgY3PQ6ixJvM8RiXjVDwcN5QkI8A7CjDEQ
         b6VJlrzQr0LcdRHzONyw/ryWjbl4WnTA2Hqnj2jW9hOOx02ke5S0iIVr5NM1hU02NJlq
         kBCJNy0vD7IDxGntneFAhrBDPb14gdbLiXKL9aK2ptHsjT5NHIenRAhXXmYMjyfEB4uP
         SoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119849; x=1784724649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dr2lce3rXypZeYHhFi4dr63szYheMvNYAGHnVpT1kRQ=;
        b=JkIoMDqF07SCJRCQ0A7z81rryzkGNWS+Swh2K8njqc5oC11EL1K3iMPNOKiUjkARW2
         21oEC3mojVNsMAWL4DmhnxolShFqrMRSWDy4gHtUKN+n3pVK6IBzP7N9dQ3ARrZoARgH
         J32JRmbiNPqTaXaEcFonjpxooVKbLf47DAq9lheMyfxHe3wPdnQixGMpLEH2kaa2ApYC
         H26oavQSpP03nt9pObsPM/dbWV2zPVbkQIF2XuPbBHWbyfwyCHXUtKjSDsnOA5FsVskk
         uuXLiQnjv0e3aPcsgWVjS/J4geKOh1+Xfwc/A5SSA02mV+o+hTex4citwCp4TruhlaWn
         DLQA==
X-Gm-Message-State: AOJu0Yw8cYXgXpnqRN6Hr36gQ4Xne+mr+hCk8qv2x65Vz73+z6wxaAVH
	GrFa22Ph/C70tU94cD02zAeFKrE9EcOOwzuuj5ROVTjK5hLgwTmHTdv5
X-Gm-Gg: AfdE7clMh9Ipttc6k+rvY33Vc6f0AOoWrrjL7MNCougz6c8o8yLmcOW9p56gL1WMZ3d
	89WP5/uiT9eE1E3WV4xcoRbHiL0A+SRLhME5TCLP0YXtaytkzh2FzReNH7RGeIJFHtPGBpIKYbN
	ZLi8nbx8x4QHZkO8/tBXzSB7DewIl+7d27VAR4RmYBcLwO8ZMm6Ul1GiMk4qrpT9YzN3hzrEjRZ
	GIkF4DbqH7LKREXj7HcLnIXaMKI4iSHnfZcNWTG7RSOkGvwLoyXJGZPFT2vWXMJeErAK5A0kxr6
	o28KCjRwYq+DcnqTJVpJzc7F/t5mnH1lPg69b8GTt9bGKPZEzFu3saGU+01a5qzzCsxz25mDqBJ
	wJpDGiOHGnx1ShIixtknNT/rIIUnMlJ4KvLhkSNcyPFn5ibWLQr+HbhukrxrZDlfBVpU+KjokdB
	lepPsv4JpNCn/tc8nakyM57V2CMAxfDZrz8q/JTLlYK9hON1NTojuv0FWnyddHiM5TUKjn4wO3M
	bw4UrdeqPXyrWwI1iFogkpk
X-Received: by 2002:a05:6512:4016:b0:5b0:13b4:6079 with SMTP id 2adb3069b0e04-5b159b8919cmr1426425e87.53.1784119848808;
        Wed, 15 Jul 2026 05:50:48 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:48 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 42/61] staging: rtl8723bs: remove ConfigureTxpowerTrack wrapper
Date: Wed, 15 Jul 2026 19:48:10 +0700
Message-ID: <20260715124829.90290-43-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the useless external wrapper function ConfigureTxpowerTrack.
Call ConfigureTxpowerTrack_8723B directly instead. This eliminates
the unused pDM_Odm argument and cleans up the driver code

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalPhyRf.c | 7 ++-----
 drivers/staging/rtl8723bs/hal/HalPhyRf.h | 1 -
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf.c b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
index 9e4d42e3a..14b4ac979 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
@@ -8,10 +8,7 @@
 /* include "Mp_Precomp.h" */
 #include "odm_precomp.h"
 
-void ConfigureTxpowerTrack(struct dm_odm_t *pDM_Odm, struct txpwrtrack_cfg *pConfig)
-{
-	ConfigureTxpowerTrack_8723B(pConfig);
-}
+
 
 /*  */
 /*  <20121113, Kordan> This function should be called when TxAGC changed. */
@@ -78,7 +75,7 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 
 	/* 4 2. Initialization (7 steps in total) */
 
-	ConfigureTxpowerTrack(pDM_Odm, &c);
+	ConfigureTxpowerTrack_8723B(&c);
 
 	(*c.GetDeltaSwingTable)(
 		pDM_Odm,
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf.h b/drivers/staging/rtl8723bs/hal/HalPhyRf.h
index bd9430db9..3d098ce34 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf.h
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf.h
@@ -30,7 +30,6 @@ struct txpwrtrack_cfg {
 	FuncSwing GetDeltaSwingTable;
 };
 
-void ConfigureTxpowerTrack(struct dm_odm_t *pDM_Odm, struct txpwrtrack_cfg *pConfig);
 
 void ODM_ClearTxPowerTrackingState(struct dm_odm_t *pDM_Odm);
 
-- 
2.55.0


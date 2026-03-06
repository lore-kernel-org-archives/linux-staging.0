Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D34314D05
	for <linux-staging@lists.linux.dev>; Fri,  6 Mar 2026 01:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772759870; cv=none; b=kbfCyuyyW4eHiVsHA6pjGYa+KdtYiQTbx3YpP5pfzh1uvwz+l9B66i6DKtzt2Cwxd9kjzfC7+KSY2jBj6Yf9JxGXbDe29xG5/yn9zXRD03RFZWEi3x/gBS5VZWWqYVFvKpDSlab2beMGj5K1gxvfB87Tv6kZZDOt1n+wbzMc7K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772759870; c=relaxed/simple;
	bh=2frCmtaCIMo3c1zbwWhudaxhr8xRVPOyVL5nvCoGxsU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qVB472F6uMZ9h6Ef7cIAzQSaVIbDQB1YL3IgBEE08o4eJ++s2fQszr1+a6zVPwmPVfKxA993h+ItVaSFkj/cywUjowtGNO7Qhb9BtW5TdVMrDsBLEgd2ly83q41cY+93aV9HX3IG/57FtBk0W+8w/MS8n/7b240eJMSDVa+pOX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CxJHalXI; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CxJHalXI"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12732e6a123so272667c88.1
        for <linux-staging@lists.linux.dev>; Thu, 05 Mar 2026 17:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772759869; x=1773364669; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nbo4fnn8vlQt+1bPbaCz9dgVpQ8Lg5w2SH7FE4xKFkk=;
        b=CxJHalXIYEBvXloIvFVxv+d4rnXbFq79cvd/qeynZa5r8Z0RTUMRtjIGuCRrQBstsy
         3n70ev/aYvzp0RHRUNKMXeq54tE0qS3z0Zvx1sVEBB7BwzVWEbP5PhRqHpXlO3SHvc1t
         VPcHTSD8csauzX3aFok8TvhYPsaZ8M6VpVtgrjy7D2aEQCFGb1uA6eqne7+YQDx9oHf4
         YP9LbClMIP28eaVEIOatNonFbEThYESZJcqLrmtaY9jKKpZmwFd2dqL8Kg6P3vmHZxST
         mJnfa7An5PoEZBkDhibrh/0FvdnIHtfSdDMCit4JyE3rR9SP1xV75mLynEfdnnXMeabV
         5TIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772759869; x=1773364669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nbo4fnn8vlQt+1bPbaCz9dgVpQ8Lg5w2SH7FE4xKFkk=;
        b=PY3+C6kioj/rxuIQWGSXwOZGBjeywMzgMSByUOknK8jbAIIMK6COJBOJYNwPSHnNOo
         036i/AVWMjSMzm9rteu0XDpHxcwsXLuymSMrqXEeESrajCkTZIt2uI2H82PMtea+gXpP
         7Wy33kW36r25eLhS37BtGh3wra9r+7UtYhvtr3Y+ysG5TdxCJlYodJPgAKF2WttjCUGU
         4s/9K5y5g2tJar8KKKT7qErPQlQp/CUiX70HHLIsI7k22IrwjuB1GUAVnOI0YKhy+i8P
         4O2VIbW6anohU2C/sFOY8J+EgMPsY43vFEq8YRHG9hoIJIGA7NlXsMK3DgtrRQo98McN
         l7gA==
X-Forwarded-Encrypted: i=1; AJvYcCU4QhdNp8wXI6dsb9MZ82i0rkjSVybsFjtNldkjiI8NHH402RiiCSKFHEtBytpouxR1+yNUHJhUX3niM/aB@lists.linux.dev
X-Gm-Message-State: AOJu0YwLnFOd8Hsd3HDw42jgUtR3Xelrqe+H7es+su+MYif+atsdFf1B
	UPpPoBToWkaLfxwaShcosbMO3W0AWZDhBqiyx+xcYVFyZFqcVfPS/ehO
X-Gm-Gg: ATEYQzxymU3MwJPF+tcXzPyND7XmCesqrl+r3MPa4y786hJB/Ui0EVhn6x5dGofkeDM
	K2lVMEGi+AI7u38xJdSmN7y5+p9oJpsW0BuyVW5TU015oxD2tpq/TDM+rGVagbuwGnX+2b1cSQZ
	u78XlLyagqkgjRNo/BaWglrVTi1SZToUeYQu27Kh21JkzEUTzrdh8jhuolm/trlJpXRGl3Z5qzq
	0i81hHn4YGok4mGNOtFC1GC6BJqY/QDQhGNggP8DElZr12ZTiC0uWuSX2ZKjyTAhGTUCQvH4Xd/
	PrBUTvw4rVGOET7hVJfKXx/5x2ngQsMNje4d9LUMUJADOFEl0NAQKziY4ISzFwjA7RXup/rH5Ll
	WVGXaIYL74loi+AK++dOk14/lKurWfpDTuTkgK/LY4xNYxTx1SxIvN3X3rPV5HjE4r1Bg/eveUp
	kGwTb3i2GyNupf+oTB
X-Received: by 2002:a05:7022:2229:b0:123:331d:bdbb with SMTP id a92af1059eb24-128c2e996b2mr236858c88.22.1772759868600;
        Thu, 05 Mar 2026 17:17:48 -0800 (PST)
Received: from mx.lan ([2605:59c8:31a3:5608:a911:bac1:f2eb:a46a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128c3d5e067sm18409c88.4.2026.03.05.17.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 17:17:48 -0800 (PST)
From: Iman Reihanian <reihanianm@gmail.com>
X-Google-Original-From: Iman Reihanian <ireihani@uci.edu>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Iman Reihanian <ireihani@uci.edu>
Subject: [PATCH] staging: most: video: replace BUG_ON with WARN_ON_ONCE
Date: Thu,  5 Mar 2026 17:17:40 -0800
Message-Id: <20260306011740.971756-1-ireihani@uci.edu>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BUG_ON causes a kernel panic if the condition is true, which is
too severe for this cleanup check on module exit. Replace it with
WARN_ON_ONCE to emit a warning and allow the system to continue.

Signed-off-by: Iman Reihanian <ireihani@uci.edu>
---
 drivers/staging/most/video/video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 04351f8ccccf..279ec98aa70e 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -577,7 +577,7 @@ static void __exit comp_exit(void)
 
 	most_deregister_configfs_subsys(&comp);
 	most_deregister_component(&comp);
-	BUG_ON(!list_empty(&video_devices));
+	WARN_ON_ONCE(!list_empty(&video_devices));
 }
 
 module_init(comp_init);
-- 
2.39.5


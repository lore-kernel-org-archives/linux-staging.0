Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CAE29E10F
	for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 20:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781468174; cv=none; b=Pbi4z6VcWCvnrXcnWoaU0ncf7Afcr9lzY1k8hqD/eqYMnq4rhqpk+N0w7IpO/5t3H5Dx0p/gNWZy/JLCqdXQvPNcRUzkeGi+nT4S6oovdV0p0NSO+NnGNDArNcKhBMcSr1NgkY3sGgp67lYE2u+ZkiD97gZMZfLTPb08lSK60Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781468174; c=relaxed/simple;
	bh=odnJMk2Iur9EW+NLveIiI2DGWoiKIbQQn3/cwmGFwWk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FEaiU2MvWOrG7MuK8L3wYpeRxVhcGzDW+oOdbLB600pLSThuIo1uzmVS1Naw7lJta/dSjfzp+wBXvZDhdWw+tqJgQAoyu/ci/PFdggOg08vJgr4n+5cAVV00SQ7iNeQuxN6yovLZY9trZ6ZXHPGJu+MG5ZkXKmaWBOkCAFR6xsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQGR46hf; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQGR46hf"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8cceaacd07bso33814626d6.3
        for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 13:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781468171; x=1782072971; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7MKHApoD4FmbO7LLQOWnCTjAAZ+14mTiiY6a3gJWdwY=;
        b=EQGR46hfdQLL053SbXZTllyWsmg++raHF8MS8njBsMO122S/5oGGehAiPdpiUD8Maj
         pVWK6+bBlnCdAPtq0EWVcj3ldDrUwnQLv2EGkuFxQ9vKXRpUcVtzlKs+ivpk3dyRBZwy
         pSnjBlSGu+t3AOcYVp6irpUIBq71zWoJ0r13ordPurLd4PLuHS3fVJ2FGDIG0rIKiieS
         Jbx+OABUZh2sbvSisMi9D5FXqE1SnJ13juoGx7TCiQN1GQ8viU1sL8YEmw9rxWTg6ru0
         V1ExGy1gvA/j6qn6Na6iMar0oosYMjAfeibYlNZu148YlIgQ9QzGoWgvGjYlbyMCBE/F
         AmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781468171; x=1782072971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MKHApoD4FmbO7LLQOWnCTjAAZ+14mTiiY6a3gJWdwY=;
        b=duD4am7WRJ/caFk0V+uN1OD5OqMHUeiOBakiU6g3rB16Qpi2etqgiHoExOJ1fwtBs7
         58pQtnsIPabcOe2iqoQwkzeTV+2lThSJ4nVEBcNgEFpuHkh3eB3Ien3ZFb3fUPe35DTz
         PxoRDssQuvy9f/V672Oc7ncE8+LKsKbxz1Le1EyuwhD1eMCrPyYvs3moavQvX0BbsktX
         /2d7W0RpKP1X+mioWue8f2gKSgzCC7OKxrqS5JNj2AA+dJMm70PLPcuRNjc39F8imyWD
         v4KhDI6qgtIaa3WaIcCw+1ljpCAvuHxz43MMvgzMfwMVwaSJ8+k/hJ9mWRQf86pk4Iy3
         yY1w==
X-Forwarded-Encrypted: i=1; AFNElJ86KQOFCE1U9den85VIpX5IFHe5+p4JoXlFaTNtxvjl/sWWCa3JMSTc4XvENbUdGdYY3nf2QLg/gaL6LCKY@lists.linux.dev
X-Gm-Message-State: AOJu0YxDYYl9E6fuT/fS+48ReC46MLsZ+PRHLGvI0gy6b+9JjuPSrS3a
	SuYaezf+k+xR9JjY1DycGnmNhANOa3x9IlbK180BFtMkEAXYm5atqrOH
X-Gm-Gg: Acq92OGpVuh5QJuXNbli6M7KCjxaJakU6t4vXrgWh9/qJKIyRfD0SPxBB1T7u0p3S48
	bTkyGjay9wpTkp2VMhsNEhLoLTorNZVayWoM06bqSJf5mYS0OTeJvYSqfFZVOsXTKQq3ztOv7/J
	ooZ/0Hd34IyvCukawomBI2tXqLI/AeTlnr0WEAuO75AvfZI4FVfXxC9mUgAY9qL2AjaJGZwlXly
	tv44PD9IRufjOxVnlLY8tDwqmcXuPMaea38MlUFI9GJ08ClltUtgTrl00UpJ8QhsFYWzcP5q5/w
	kN4jei/QHtnccLQKLj9VMp7prL55mC+Z6nb4h/7PDZ/gB6vC/9BlY9uHtOioWmHkEPuqjG2Jvy8
	WVYFJxpJ5tzxIlOJXZyNth8inXhPLYX9eZ2tYsTvyDDir5nM3K7+RME+D6PfQg7mejYVyShL5n/
	NCtg5QiR6TwKZvZ5ZzXHXRIiBcnzN9PduugRm4cQwSqsjG
X-Received: by 2002:ad4:5bc6:0:b0:8ce:abea:4723 with SMTP id 6a1803df08f44-8d32f599636mr195018916d6.40.1781468171377;
        Sun, 14 Jun 2026 13:16:11 -0700 (PDT)
Received: from localhost.localdomain ([38.174.6.30])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d304f3e55fsm90190706d6.39.2026.06.14.13.16.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 13:16:10 -0700 (PDT)
From: Keefe Reeves <reeveskeefe@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: abdun.nihaal@gmail.com,
	error27@gmail.com,
	chintanlike@gmail.com,
	namcao@linutronix.de,
	niejianglei2021@163.com,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Keefe Reeves <reeveskeefe@gmail.com>
Subject: [PATCH v2] staging: fbtft: use %pe for backlight errors
Date: Sun, 14 Jun 2026 17:15:51 -0300
Message-ID: <20260614201551.20542-1-reeveskeefe@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Coccinelle found two places where backlight registration errors are
printed by passing PTR_ERR() to dev_err().

Use %pe instead so the error pointer can be printed directly. This keeps
the behavior the same and just makes the error printing cleaner.

Signed-off-by: Keefe Reeves <reeveskeefe@gmail.com>
---
Changes in v2:
- Use reachable Gmail address for author and Signed-off-by.

 drivers/staging/fbtft/fb_ssd1351.c | 4 ++--
 drivers/staging/fbtft/fbtft-core.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ssd1351.c b/drivers/staging/fbtft/fb_ssd1351.c
index 6736b09b2f45..b6cb60f20b11 100644
--- a/drivers/staging/fbtft/fb_ssd1351.c
+++ b/drivers/staging/fbtft/fb_ssd1351.c
@@ -218,8 +218,8 @@ static void register_onboard_backlight(struct fbtft_par *par)
 				       &bl_props);
 	if (IS_ERR(bd)) {
 		dev_err(par->info->device,
-			"cannot register backlight device (%ld)\n",
-			PTR_ERR(bd));
+			"cannot register backlight device (%pe)\n",
+			bd);
 		return;
 	}
 	par->info->bl_dev = bd;
diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 3da42c8ca6e3..b6a846ada3e0 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -187,8 +187,8 @@ void fbtft_register_backlight(struct fbtft_par *par)
 				       &fbtft_bl_ops, &bl_props);
 	if (IS_ERR(bd)) {
 		dev_err(par->info->device,
-			"cannot register backlight device (%ld)\n",
-			PTR_ERR(bd));
+			"cannot register backlight device (%pe)\n",
+			bd);
 		return;
 	}
 	par->info->bl_dev = bd;
-- 
2.54.0


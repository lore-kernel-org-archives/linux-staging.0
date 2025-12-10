Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09A027B35F
	for <linux-staging@lists.linux.dev>; Wed, 10 Dec 2025 08:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765355517; cv=none; b=HYepopLc4ruvUH00vIor0YfK1AWUWVQb7ryL/sAQENVH/a8qS+FQzDJ5VMla3KjRvlDXNIG3zCrdZfqdab+26Pb0jgZ+nt46IdZDmw2CGXPoecxepY+N944vgNSRVjMDb1Qj6oaVGrAnfVONyC7ekMi5FZHLHbOWuYGYcPP/Nkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765355517; c=relaxed/simple;
	bh=LrLdovRzSzdNxTBUY5bVyUTgTkSb9V8DwRHPPe0GO8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PnDtJSQTUDUlSDTrzMZ0g2OjTLD7ArH5mV64daDclIz0RdXS14iPeNj5tPpAUElxfbNQ3wOCXA1tiMhmkPAzD3su/s+5EyBe4KSmNpABx8H48awMuHNIqSJj/w4NPNJIIGj1bQbiUR48SJ/VYZsnywMiyF4ssmVS+jfeJh3m9uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xD2vjKmz; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xD2vjKmz"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b735e278fa1so1166150266b.0
        for <linux-staging@lists.linux.dev>; Wed, 10 Dec 2025 00:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765355511; x=1765960311; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSlXOGUPyH2wmzlmXTP6V9Rk2E/YQBY/7/JUKnpIt0k=;
        b=xD2vjKmzQKRtMEBW1VtgDSa3sz27JFL+PPAoltQnuDAq4+mms4pRY6zt1KlM0TVs35
         HjWXZmNwyCVGEnWl6oMAeLrpKcl3chOj/shZp9nTTzvrGuy7Yr9uyR+UV7b3VI8a55wk
         3WpaoKlCcZYzn+kKum3hvO6/JxxnXa9jOut8eNevmZ0Kc41W1DsW0iaKSEblbY/q42Az
         cn3K4YP26sK6hP4Ut/i2EmVOr+5NJduf8D+cDV5nyWHofk3Z17En4aX3SYHX/Vy9ztmH
         +eUhcFF3VOYGfKWwHa0prCstMzUbC2bBYe46UwJs1EOQI0jykN1nRzHMWhZ48ngs6d8a
         N1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765355511; x=1765960311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WSlXOGUPyH2wmzlmXTP6V9Rk2E/YQBY/7/JUKnpIt0k=;
        b=tFfL6BIk2Ew0B/5XAg2oKpjezAdNrZ/PZB7FkoFVsX1TjEAyTMMSlHU1XBSayQkzi8
         2g+8zE+gjtLyyPElu4UFns8sWUQvF5pDEF4MgKkibpWsTmXmhxD1y71N4bWb17IfChO5
         fP6mThilbe3OSTbSnvHg0ta49hmb3wYg0G0X1JCY+ASu1OrxyY2rqZdjIUTgTui79uWt
         t/Iyhn86XfGW2Kz2Fg5TZM7buxPawQovjy7t0JPlNYXOH7cZb1CiGXS/7rKZZZLNO2CM
         OzWwpK+YXi3UtM7CydeOjE9xfJWh7ZgrSWZ6JzUhh2Y9rLcsSf7m0sZbsPhoR2urZdm/
         DQTA==
X-Forwarded-Encrypted: i=1; AJvYcCWG5GW7VqLKDXvBHWna/bxJ7V8rcKgByWYwjjALI1lEwmuzL69S2lbOItAgaPnMy2nkHgv5LAjB7Tt/DnpA@lists.linux.dev
X-Gm-Message-State: AOJu0YxX47o6qxB9CpPpPzaxB/ANAmYInxkZj2a+q2sKR0U2zSHCNbnx
	5VBYuSTlDxSzg7nmBq2nn6wA6As3gHGV+eHdw/asg6+L2FpBYlAH2lFZXywOQ/0QV+4=
X-Gm-Gg: AY/fxX6ZVtAbqGR37O2/9o/rNNA0jBPiHu0+ZgsA1g0RJ8YiQA/uukb7rpUc0/aBVTo
	VG3WrGRzBxgacJA7QrqIABTyZH8AYQXFeG9kGBm/Ye/OLlBmQiY0WFAsEQJN6W9AKtUrTY0Qeg+
	FPPyxsfziU7MeKsQK/GJWmZrs8CNHgI/UrvxAwGalveScFC2+Yyd+QihrYFhvh7hhjJyQNuce5V
	rkwWmmjmZhQptsx1xYnMUvj9zaALG++IY4iPx9Gg4iVv0AzMj2ZX/8eXkhmTTCEW9Lj5prV8I2s
	rhDu4MrC6/jscHXH8dlvcP3U7KGAHO4GW6HCta4j/O89Ld3ZS7fq8x9nFmXmXsIc8xrtUTPq0W4
	tmCYKP6ueWSzd7w74JgFx/yCmYUmidIZNc05miI/EWwZWGfFhD41zzLZhkUDsyVhOFYwLbsuG0S
	pFDq3nQSEdniQqQ2n4
X-Google-Smtp-Source: AGHT+IFDU3NgK94e2I43lGVaae/zTSx8SJWvAB4zEAII7VlEYPowkYq2MDr2f3QvhM1SFljKSS7JEQ==
X-Received: by 2002:a17:907:86a6:b0:b7a:21d5:15eb with SMTP id a640c23a62f3a-b7ce844ed2cmr161725666b.52.1765355511508;
        Wed, 10 Dec 2025 00:31:51 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-647b4121f07sm16450153a12.28.2025.12.10.00.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 00:31:51 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Akhil R <akhilrajeev@nvidia.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-crypto@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 1/2] host1x: Make remove callback return void
Date: Wed, 10 Dec 2025 09:31:37 +0100
Message-ID:  <d364fd4ec043d36ee12e46eaef98c57658884f63.1765355236.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765355236.git.u.kleine-koenig@baylibre.com>
References: <cover.1765355236.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3660; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=LrLdovRzSzdNxTBUY5bVyUTgTkSb9V8DwRHPPe0GO8o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOS/sRGieJNY6eEBd+rKCwW3UfWy+0G4cTvst6 vX4NaiKjOaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTkv7AAKCRCPgPtYfRL+ ToEUCACCotR1zED66IhienYTk2oEwO+g1mqbvB0PBHiZ7kpG+Kt+FBF7T1RKGnWK6WehDqyRHzM LmmgMZ0GhkSc/r8NFSihIQ7xR9UHh0VtcZmTCGjd/V+1XQJ//+axPc6/9xNaWlRikHwzmJCpk0s Zn3UGsasK2k7ECE8T6ylyGqtRmxW3d0glZQHu1Nr48U662jtsLpWZTEqu0fSg6jfVexpG95q63a KmF1OmNjtm+iHmWbYbtWuMwvE/va59+K8qESdRpTmtGEhbPfoSDzB9Z5AKF0leNgBVwwbtrYrSm 9Gn4FQA7UH5CuZuJt9nktkL/UscIvvFIeQ5hP0bslc+tW4tc
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The return value of struct device_driver::remove is ignored by the core
(see device_remove() in drivers/base/dd.c). So it doesn't make sense to
let the host1x remove callback return an int just to ignore it later.

So make the callback return void. All current implementors return 0, so
they are easily converted.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/crypto/tegra/tegra-se-main.c      | 4 +---
 drivers/gpu/drm/tegra/drm.c               | 4 +---
 drivers/gpu/host1x/bus.c                  | 2 +-
 drivers/staging/media/tegra-video/video.c | 4 +---
 include/linux/host1x.h                    | 2 +-
 5 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/crypto/tegra/tegra-se-main.c b/drivers/crypto/tegra/tegra-se-main.c
index 7237f14eaf5a..4e7115b247e7 100644
--- a/drivers/crypto/tegra/tegra-se-main.c
+++ b/drivers/crypto/tegra/tegra-se-main.c
@@ -401,11 +401,9 @@ static int tegra_se_host1x_probe(struct host1x_device *dev)
 	return host1x_device_init(dev);
 }
 
-static int tegra_se_host1x_remove(struct host1x_device *dev)
+static void tegra_se_host1x_remove(struct host1x_device *dev)
 {
 	host1x_device_exit(dev);
-
-	return 0;
 }
 
 static struct host1x_driver tegra_se_host1x_driver = {
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 4596073fe28f..bd0646eae555 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1300,7 +1300,7 @@ static int host1x_drm_probe(struct host1x_device *dev)
 	return err;
 }
 
-static int host1x_drm_remove(struct host1x_device *dev)
+static void host1x_drm_remove(struct host1x_device *dev)
 {
 	struct drm_device *drm = dev_get_drvdata(&dev->dev);
 	struct tegra_drm *tegra = drm->dev_private;
@@ -1329,8 +1329,6 @@ static int host1x_drm_remove(struct host1x_device *dev)
 
 	kfree(tegra);
 	drm_dev_put(drm);
-
-	return 0;
 }
 
 static void host1x_drm_shutdown(struct host1x_device *dev)
diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 344cc9e741c1..fd89512d4488 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -628,7 +628,7 @@ static int host1x_device_remove(struct device *dev)
 	struct host1x_device *device = to_host1x_device(dev);
 
 	if (driver->remove)
-		return driver->remove(device);
+		driver->remove(device);
 
 	return 0;
 }
diff --git a/drivers/staging/media/tegra-video/video.c b/drivers/staging/media/tegra-video/video.c
index 074ad0dc56ca..68783d5ffeb1 100644
--- a/drivers/staging/media/tegra-video/video.c
+++ b/drivers/staging/media/tegra-video/video.c
@@ -107,7 +107,7 @@ static int host1x_video_probe(struct host1x_device *dev)
 	return ret;
 }
 
-static int host1x_video_remove(struct host1x_device *dev)
+static void host1x_video_remove(struct host1x_device *dev)
 {
 	struct tegra_video_device *vid = dev_get_drvdata(&dev->dev);
 
@@ -118,8 +118,6 @@ static int host1x_video_remove(struct host1x_device *dev)
 
 	/* This calls v4l2_dev release callback on last reference */
 	v4l2_device_put(&vid->v4l2_dev);
-
-	return 0;
 }
 
 static const struct of_device_id host1x_video_subdevs[] = {
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 9fa9c30a34e6..5e7a63143a4a 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -380,7 +380,7 @@ struct host1x_driver {
 	struct list_head list;
 
 	int (*probe)(struct host1x_device *device);
-	int (*remove)(struct host1x_device *device);
+	void (*remove)(struct host1x_device *device);
 	void (*shutdown)(struct host1x_device *device);
 };
 
-- 
2.47.3


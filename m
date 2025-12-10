Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9F2302149
	for <linux-staging@lists.linux.dev>; Wed, 10 Dec 2025 08:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765355520; cv=none; b=gpOCqpBASVIUUIgWHWw/GQ3iqQKTfDfsw5MrzO6m6N+9tVGzA92g2B0KSB2gIyhWuQ3dnXgoDQxckJfmiDyQFuJG4KES0upca8M68eRF1wAjdYAYJF+dUEOWOU9i7sAs5nNeyZKEfImEK2LkoTS5Oe6Yy8cs+4c7yI2yYVqUFeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765355520; c=relaxed/simple;
	bh=FFNspWcgr6JBh3jF6KiuWIJwLT9QVchWO/Z3r4hqr+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DYD3LgRp7J/IPUXTHr7bnUJ77u4GFMQwOzUDe9wvFRie02U6VwnbRmnU8ikxMYzzsRw5DXIsLJXoZEQPMYwCGPKbdkdvAIybRXRTolOW8AsnntBfNxvINNWmIvCaRB5yIy/2urxg1j02XM+KOcPMvNqUUZ068NVBdBumLNWx/m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xHsZTOqM; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xHsZTOqM"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b7277324054so980797166b.0
        for <linux-staging@lists.linux.dev>; Wed, 10 Dec 2025 00:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765355513; x=1765960313; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSMdgZiYQlpcrCoz/a1I+Tk8d9M7yHxRNKGn/fSx/9c=;
        b=xHsZTOqM0nDRaXnNhY6I2VifmdlE/A8zrGiKhP/LMNBi710DIkkE5J5SAhifdNcyrv
         DtDkgdfZHRVjL5SKEot7P4EWFxBvHDDNdEX0lkQnRGiCpiTzrf9OTvl145jT8UCWyQa7
         gKGbHgZ6Iiwy6zd4fbYFGq1pbohLLuaSjRLDNSUVQ/KIuMAwAgjdPBc9nNJrN15J9rLU
         lRRQouVh+fCBvQafu/4jKBv8P+eZ2Wmb8bLM0EBUqQQR+bTOA83XAAPlD9oJT9BiVhAu
         bpEbcPLGHx8RktG/SUn2dhXvA1Dv5AEANL3ETOG9t1IRIysfr4677jWWTLZGABpEbvLC
         ZcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765355513; x=1765960313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lSMdgZiYQlpcrCoz/a1I+Tk8d9M7yHxRNKGn/fSx/9c=;
        b=eb7zhyRZWUXsKeBPl9/Fz9wKWybcxFO/kT0ZTDpdnIOhWR+YPZvi6t2resh0arx2Y7
         EvJlUc/DCzRZaRiiVkJWBeNyiTFZ+WZtd1h7iU7GN4BEeZ883dhoBHL+oqzadj/GwU/+
         SSu84SlFEy38EOwUuDvpxEOG2dflNsvgVDKr7sFTfvTXMXkVeu0S7+TYWJaSkYryXoOO
         Mem5E7skhv4s9zXvZJY3478RyMcsysRxrs6pUjm+E2RbLSa4X/Q1GCIcM7VmIKsoJK1N
         yhlMqpUeAUFwf61J5f7Yuapopety3Ez77F8IP1/vFlncBTYhUIwnU/2fjYM8daZC8eVL
         8Oww==
X-Forwarded-Encrypted: i=1; AJvYcCV/k+qL8csL/Eayu86mQZ60+UT3GRBpCDEq8pV5Bmy7kGsiPfftkYhP6SxfTOiq/5tnre8m+GHbSIckbAgk@lists.linux.dev
X-Gm-Message-State: AOJu0YxHySKFr2oVmS/TspXlX9ccM2ouSOgFXiKd87jtOZxtLEzz9vGc
	7Z1TeGcI5ATFlWzxij4iHgE+a/pSnPTS9qw1OuccbzFTjHcMLY4aG9qOg106NpNLewc=
X-Gm-Gg: AY/fxX6gF6BA1GDQqJLtTUYku3m7PCu0i8vLtRyzF5E2fetmijhCFF4ENmMAlOvNMoW
	ocVnncSOPagUc7VkcI0iUwWPf+vuM1dROEm8jKIfzv5KJQtsHthfPVuEeK6+H+OJFuqjUmEU8I9
	GZrGbhrykNxwfSt/plf9md5B4oYD5TYWCiSpReK7UfVvYj2BZvyb/4zvBmkg665s6FJcLOmGsd7
	g8wY/tW73F4D1FZz2TQWH/tTkimkAT+Rath2kt3B3jdHkvnOqIuH85yS9G5JlusEV5PPJqTLh/R
	bAJzyydrcpmCRxcgcWGMzjGQKrp8tbfsd3Wga1/guIeStz5mcEqmUuqd+dO0dg3rL5KpaRMwKiI
	pgJ+LmLLYKzLmAdsGrUIlRthoF57N8jjWJXvz6z5I75awh6fOA6AP/PVJy2l7CTP3BLpyLWEirc
	FgOeUjqChn/zEDX9ZU
X-Google-Smtp-Source: AGHT+IFYDRtX5PoiZPxafkMiANC8Xf6Bj78BEbFQEysHNafXsqKHXNdBL6htv855tq3hOMwvxyT2DQ==
X-Received: by 2002:a17:906:dc89:b0:b7a:1b3:5e52 with SMTP id a640c23a62f3a-b7ce8245e92mr181408966b.17.1765355513484;
        Wed, 10 Dec 2025 00:31:53 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b79f4975c56sm1602897366b.33.2025.12.10.00.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 00:31:53 -0800 (PST)
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
Subject: [PATCH 2/2] host1x: Convert to bus methods
Date: Wed, 10 Dec 2025 09:31:38 +0100
Message-ID:  <dd55d034c68953268ea416aa5c13e41b158fcbb4.1765355236.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3411; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=FFNspWcgr6JBh3jF6KiuWIJwLT9QVchWO/Z3r4hqr+s=; b=owGbwMvMwMXY3/A7olbonx/jabUkhkxL/XeniljWpVlqZprUz387O3yFDZsen0Dv82P2G2Sm3 TlnKlbUyWjMwsDIxSArpshi37gm06pKLrJz7b/LMINYmUCmMHBxCsBEVC3Y/zu/fWz+PrXm6LS0 dE5ho5k693/XWU84d3BxsdDGBK8J1dxsNlGXf78pl87kPVPNdPVFGHN/poPqz/XF2R+y4+P+1Pm uF4y9sNcp+StnnJ+woIjkh4kejO9X8ru5rza4Jv51C38E74xrNc+9+s/5tdZ2eKV8MPe/cbB8iu cJA8ud7316C22vnJ8Va705o+iMduCiwGk7jKrzVOL++s14Lv+wt93cRPTHzfK2Ob1enG0Va8y73 AR/zb+W8Z1zSvTLS2YKRjzB/H1W97rMXDljNyk1tquedzktlBzCnO2smc3YUKHdeTDPcUruiQf6 sUVfGVMl1taKv/g0yShu35X6slxd4de/9vOe3K3QXAYA
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The callbacks .probe(), .remove() and .shutdown() for device_drivers
should go away. So migrate to bus methods. There are two differences
that need addressing:

 - The bus remove callback returns void while the driver remove callback
   returns int (the actual value is ignored by the core).
 - The bus shutdown callback is also called for unbound devices, so an
   additional check for dev->driver != NULL is needed.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/gpu/host1x/bus.c | 67 ++++++++++++++++++++--------------------
 1 file changed, 33 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index fd89512d4488..c0d7a9b5f07a 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -346,6 +346,36 @@ static int host1x_device_uevent(const struct device *dev,
 	return 0;
 }
 
+static int host1x_device_probe(struct device *dev)
+{
+	struct host1x_driver *driver = to_host1x_driver(dev->driver);
+	struct host1x_device *device = to_host1x_device(dev);
+
+	if (driver->probe)
+		return driver->probe(device);
+
+	return 0;
+}
+
+static void host1x_device_remove(struct device *dev)
+{
+	struct host1x_driver *driver = to_host1x_driver(dev->driver);
+	struct host1x_device *device = to_host1x_device(dev);
+
+	if (driver->remove)
+		driver->remove(device);
+}
+
+static void host1x_device_shutdown(struct device *dev)
+{
+	struct host1x_driver *driver = to_host1x_driver(dev->driver);
+	struct host1x_device *device = to_host1x_device(dev);
+
+	if (dev->driver && driver->shutdown)
+		driver->shutdown(device);
+}
+
+
 static const struct dev_pm_ops host1x_device_pm_ops = {
 	.suspend = pm_generic_suspend,
 	.resume = pm_generic_resume,
@@ -359,6 +389,9 @@ const struct bus_type host1x_bus_type = {
 	.name = "host1x",
 	.match = host1x_device_match,
 	.uevent = host1x_device_uevent,
+	.probe = host1x_device_probe,
+	.remove = host1x_device_remove,
+	.shutdown = host1x_device_shutdown,
 	.pm = &host1x_device_pm_ops,
 };
 
@@ -611,37 +644,6 @@ int host1x_unregister(struct host1x *host1x)
 	return 0;
 }
 
-static int host1x_device_probe(struct device *dev)
-{
-	struct host1x_driver *driver = to_host1x_driver(dev->driver);
-	struct host1x_device *device = to_host1x_device(dev);
-
-	if (driver->probe)
-		return driver->probe(device);
-
-	return 0;
-}
-
-static int host1x_device_remove(struct device *dev)
-{
-	struct host1x_driver *driver = to_host1x_driver(dev->driver);
-	struct host1x_device *device = to_host1x_device(dev);
-
-	if (driver->remove)
-		driver->remove(device);
-
-	return 0;
-}
-
-static void host1x_device_shutdown(struct device *dev)
-{
-	struct host1x_driver *driver = to_host1x_driver(dev->driver);
-	struct host1x_device *device = to_host1x_device(dev);
-
-	if (driver->shutdown)
-		driver->shutdown(device);
-}
-
 /**
  * host1x_driver_register_full() - register a host1x driver
  * @driver: host1x driver
@@ -672,9 +674,6 @@ int host1x_driver_register_full(struct host1x_driver *driver,
 
 	driver->driver.bus = &host1x_bus_type;
 	driver->driver.owner = owner;
-	driver->driver.probe = host1x_device_probe;
-	driver->driver.remove = host1x_device_remove;
-	driver->driver.shutdown = host1x_device_shutdown;
 
 	return driver_register(&driver->driver);
 }
-- 
2.47.3


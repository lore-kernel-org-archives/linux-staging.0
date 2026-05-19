Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C734028D1
	for <linux-staging@lists.linux.dev>; Tue, 19 May 2026 14:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779199595; cv=none; b=TfEJTUF/XinGRek7SbreSAb+lkAvm6w94Oa6kFxiB2hlTkl1Tls8TzUVunx8SHeqr30nHImfF8AwQrN41bL1lT19gfqpvqeIYrOW5XO/O4wlr3/B+UgF18QSpNC9keOB2ayf+QjuohvkCRmvxtJsbmZ7NVeMs/58bREeyQX7az4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779199595; c=relaxed/simple;
	bh=1FBR4g/VxQh+jJHTGxhfk5NruFCJTNpQXEUYu3wfoTo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h04KGRX3kWEdbTD3Yvs0Mb0JCPSxBUk4Jw1HKGBRa9JUb1FD2GJoz3s/bohF4zVL03EYw3xHb76Vl98kttsKkyAx51y5T5XaEXIiQHNaediuBkul02h6LoaSAxdkxqU2vEBqs5C9HNspTd1Glkcwv+zrAczIAg3Pgp1fX7kvIqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fkeC5UC8; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fkeC5UC8"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43fe62837baso2036229f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 19 May 2026 07:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779199592; x=1779804392; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F1rveWDJ/n3gZq22bLKQlpmlHtwzsA8j9KcVfu+WYds=;
        b=fkeC5UC8AvF0+zA9e+AdH0wX7tKLqKKfDtwV86vnT9O7LpRVMOx5JMkMg5fSfuw3E8
         vHHf9/m00j6bc9Xb+hpxvR+cX9uv2PGPTvsmOIw92scrW6do851WmgdUMEXDxoAHRfkW
         6nhTY2ZFqoeTeUjGOPnBgoAByBGHZxClVix3194tbsLBaurn97dvcljBIstqWcm2tgho
         75Qq1LLciae3zsBDJ2sV5uqBtcQ5yOArmdgKk3Z9wEecROLloFx95O+r5iG3HOYd0SOh
         jAwCsp2ZfYTi6eJ18tUL05jOXsygwps4JXeRAHIcJtJYeCpf/eEmufKEKn73qTEOOwI0
         MrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779199592; x=1779804392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1rveWDJ/n3gZq22bLKQlpmlHtwzsA8j9KcVfu+WYds=;
        b=PC+NWGQs6Kdv5fhbWgQLVWkM0Vcg1/IReK5P9cmNnBoT4h8VO7jAnxk4WyqU/sVnCx
         tLSvbzrF0aZVO6wmxI7KX5Em7RFyHB5NnvSkBcIen5HJ3vOe699Bgio0w5JoxbNXnjEp
         BYd//+3+zo9FHBX1ObkGiQTQ62lhjUv/7sBp2BxuZdE0mqMEj+1Varjv/JtYXwKASZ3x
         5ZkcwS0a1C6AkDpa7e+NfnJdKaxgAuOnMgdZHuNneRGWs4jiB+ZrOiLCMOyK6CtRwMba
         eOzakkVuy6i9fnp6NSXY0H1r6K60JST69br9FDWk04XIe9DL9+lX4V09zxHzhcVSq218
         /z4Q==
X-Forwarded-Encrypted: i=1; AFNElJ95Z/YUGfNHBbXRnAfzK4JkqVMMbT7OFYf0g1423AB5yFfSSk5FuaRy++aFJF46bgspq6PJhwAZcSRvAARS@lists.linux.dev
X-Gm-Message-State: AOJu0Yxg/DCcHCms9xcTrRO0cfoE9CTxG+jsODQyEkppX+d3vZXQ/mwu
	bI27BixQWaXRDyHox7nmqoLJ6DyTp4haRQlfOoGmcEyHKnd26MOKm9TkbK9XZpE1PjY=
X-Gm-Gg: Acq92OEZdZh3Akl4z+agPpXQ2unKyy9Ch/t4Pbgfaq1MjwKDPUy9x26WVR6/Zq0jhtg
	Vi+P8lNTlEhYdPZ78+rVg9qT8pINiYj6TKYP5aeMY0jywh7Jufc4rqleKKJOX3daysvc8/ULZK+
	4OsBiRScFOJBATsqFXNh9Q9PWc3ARexdYmqxOiW/bNhPd8wVdDwCQgWZuMDSokWQ8mdHX041vuq
	5QX9dCn/T+EiPUuMnwNoJsPnFHAE0DEtRRPyYd9ZYBYj8UbmoJEs4Zlfeu2V4nzZQXPujHxr+dY
	htl/oq/f6DUVmk6Dn1oezqnE5Gm+dZ3q9aw20EJ+exV31Z5HhDD8n+3WKkdoICwXK9egu5k1EI5
	qkYPD7GBGXQ7WbRrcO/X/R6dBm/+3grPHZmrjE6AViOdwDk/zsOFRDIwUEqeww/IrJtBK8n2TU4
	2Il8HfLmkqvgQ5+TtLX71PId/chTHNmwqfmfzLgJQCZa4VyV7zQ6HZuyNvfXmNa9w1plRzkQ+kb
	2NSLF+zjFL9/p8=
X-Received: by 2002:adf:f284:0:b0:45e:65a3:badf with SMTP id ffacd0b85a97d-45e65a3bb1fmr18932862f8f.21.1779199591612;
        Tue, 19 May 2026 07:06:31 -0700 (PDT)
Received: from localhost (p200300f65f47db048a8dfcf61053817f.dip0.t-ipconnect.de. [2003:f6:5f47:db04:8a8d:fcf6:1053:817f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45da15a562dsm46552734f8f.33.2026.05.19.07.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:06:31 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] staging: iio: Use named initializers for struct i2c_device_id
Date: Tue, 19 May 2026 16:06:20 +0200
Message-ID: <20260519140624.1585534-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2374; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=1FBR4g/VxQh+jJHTGxhfk5NruFCJTNpQXEUYu3wfoTo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqDG5gwmZax1mAiiSWvVmAabAkcCFNeU0lUJ667 /MMFAeuYQmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCagxuYAAKCRCPgPtYfRL+ TsagCACejQTTKFEmHQ5sS0I7GdAhQh79jW5Ec/J2pSbo5S49iuFip5OtV+gI+wBtr7Q4FNCO2bZ mPlVyxCeEK6MpUexpedkiyJoyVYLIXClWYZnGToat8BT+7p0kKyjUwUTo5ao87hPVSscvHkws0h oTxpCXzz05df0YBsXp+UYtPwfTED9sDOieEEM2FOOCbcxpk3IOb6vs8KU04BuSddgWP4k4P47oG GAkLfhqToIMFVzXYoBMm/JSDJPZ3Iewo7QZOlbZu7WfBlyoM081ZR3Q+h/6mMij1pc39AHfNq0+ T63EfeucxqzUbEnsFksSd5xZZaGmPzH4hUzkfYx6hMelX7Mo
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits. The former was confirmed with x86 and arm64
builds.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

this patch is part of a bigger quest to use named initializers for
mainly struct i2c_device_id::driver_data to be able to modify
i2c_device_id. See e.g.
https://lore.kernel.org/all/20260518111203.639603-2-u.kleine-koenig@baylibre.com/
for the details.

This patch here isn't critical for this quest, as no driver makes use of
.driver_data, so apart from the better readability this is only about
consistency with other subsystems.

Best regards
Uwe

 drivers/staging/iio/addac/adt7316-i2c.c         | 12 ++++++------
 drivers/staging/iio/impedance-analyzer/ad5933.c |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/iio/addac/adt7316-i2c.c b/drivers/staging/iio/addac/adt7316-i2c.c
index 3bdaee925dee..98f2e23c6a4b 100644
--- a/drivers/staging/iio/addac/adt7316-i2c.c
+++ b/drivers/staging/iio/addac/adt7316-i2c.c
@@ -109,12 +109,12 @@ static int adt7316_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adt7316_i2c_id[] = {
-	{ "adt7316" },
-	{ "adt7317" },
-	{ "adt7318" },
-	{ "adt7516" },
-	{ "adt7517" },
-	{ "adt7519" },
+	{ .name = "adt7316" },
+	{ .name = "adt7317" },
+	{ .name = "adt7318" },
+	{ .name = "adt7516" },
+	{ .name = "adt7517" },
+	{ .name = "adt7519" },
 	{ }
 };
 
diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
index dde2ec9d1f6a..798e62bae29b 100644
--- a/drivers/staging/iio/impedance-analyzer/ad5933.c
+++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
@@ -726,8 +726,8 @@ static int ad5933_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ad5933_id[] = {
-	{ "ad5933" },
-	{ "ad5934" },
+	{ .name = "ad5933" },
+	{ .name = "ad5934" },
 	{ }
 };
 

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.47.3


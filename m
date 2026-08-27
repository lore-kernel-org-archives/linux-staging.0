Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42B34C6F04
	for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 18:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854691; cv=none; b=ngXa1PHPQBen1bGTr/vFilsl+W1GAT7wdkdyK1EAL3+RT9YIYNNHLLX43gPHXfPD6xC0RJ3+R3PdF6z/3tNfepr2+z059enaeZkqiolhArfXJktkyCAbSUfVVlKpf0HTUgK9lU+fK7+NFRDc1rJU0H5U3/ktXfD1DgP1sJmiP28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854691; c=relaxed/simple;
	bh=GY/0GwAYKkdGCB2mGjNb9iNJ3uZoj4B7s9rKLLBlD0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bhb/2OQ4/q4n+PGyWSDDbh8RVgVqCQjW2OHdQQggUeJFQzLEoqXvj3h9bgx41rQ91oqTdzPyJ4T2CPgWYuVkHuIRHbJB3xiu0sNFK4uwp12EySGnSYaWq6tSx02FU0TCrXoofv4MxJ5bC8CwyOAMH2UzIU6KydfIytatAaKaT2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n43zOBIl; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n43zOBIl"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b8f86c6deso245555e9.0
        for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 11:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854688; x=1788459488; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOqePx/fvAb2uUxt/VBHwZXtTfO5bd6bJUnU0qX6xfA=;
        b=n43zOBIlUC2d+/2TPSxaEgT5OCumb4K64tu30rWhbDyj3msPtEKLJ9KGJcaqc2ZDPr
         Iu/GRu2CDuT5qgMjr82oLknpdzqOF3zeT3jbvmMVSkKDiGKJT4yXVHTX4I9J+vMgnES3
         +iV1+zV/GiMqX9V7aviIwFXo5A6S9Hiz90zHx5uC3X+m52iqrqRUqCKHZlNhtwE6eCbO
         rlOfq/Ar5Dt5QqrTvmK2eqIo1Y55l9nsNj0G4CuQd9ITgP+Eo8/zkKcQyWY3FsIZgvcF
         mA+MlsqfqM2ngXxULAjQAMEvyTPAkWeKawnwE632ZaVKF+p1SvZdH0btvjDsMEdnSqsB
         /49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854688; x=1788459488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DOqePx/fvAb2uUxt/VBHwZXtTfO5bd6bJUnU0qX6xfA=;
        b=JrejCiAZKhtaAjb7/7yFFbSjSoWfZTdnnZhNaVNOdoKCRgL1a7p1wa0+HbDDoJv6AQ
         XccExZ/HcvGuVFkC84wKQbXUe5D3kMV5gecjFfPmipRB2Q1C3kTzshwc4lhipn8RdwG2
         jiKcYKV+YVmZVqe0TwDO7IkWvNXR2TZ/+nvvOAZxoBxH2AvY/7zv6V79HZlKQUio3KWW
         pGiTYUPkaQqh3XS/XM9E3Mt9U99CnSGY7j3t/c5tF0B8CvCYL1SjZ0cI3of6USBQSlCv
         /Dpt5hzNWTxswCPsufkhqbu4sPaFRy49MEw94LfhqXeFEQthETZXKETVI8UTNRTvW/gZ
         80jQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrwk7BO7E4ede/4mLm5d5L/OjZhw46nyxS/WXteibdh/e/ed0hWB9l2IlqhBs3zZo6OrTx8qrW10tx78u83@lists.linux.dev
X-Gm-Message-State: AFuF++kQuBfphHZBgSc5m/d1++TGwZoF68TpEnw+7+CRtHik3AUyL89a
	FdxZyv1emFP72Dz7foo91DhM0QIWp3IZHjsTRBnkyeqUT0ZDn+BlCOcD
X-Gm-Gg: AR+sD12T2oJr9hiaQg0Toj/iNy7LqW4l2V99hjx9ZCafMxr44By5TNgZyphlyy6jKvH
	xAYZG7l8ZJ9xmkMWkC9AicFg5XRHukvVcAWEP5+DfcGD90QVskoMYNV2QEEEY1JmzXefDVIZwRK
	y6xJeaP7N7PBtSHnfqOuDyRrCru1gM2CCngHExwZqUm2qnFpGh2HG83C9FiWIOiVJNJrEMPwZhn
	mR8//LOB3L/olQdIcvAe+4/usqT0mTgSGR+IEOUg5Q5J+HjgbDZWIyAi7y3dRYu+4In3wrXkhfK
	Z1AhWbp2MQQM/+U0SYM4dPmyG6ektITTRVqhx3HqpU7e9cpgxr9JU5a4qge91RPkuilMP90XEFl
	IKNMtK+YBY4qwGXrZ5wTnfEsRKaIHbAKhr5RDvmxa5sAnlXwSj+d86ZGVJFsqiq4SP+VWqgb0uG
	h2zywah+CrtOFrW/5aOFw0/9+oyXfhBuD85zndRPy7zyenAdkys7SKE9+m8mfuspxGSqQPP6i7J
	ii/TzzwEFfdS+yvV09k/7JsixU1DQbYTY0RY//MrIQC
X-Received: by 2002:a05:600c:c4aa:b0:499:d513:e507 with SMTP id 5b1f17b1804b1-49b91c17d72mr10375995e9.2.1787854687907;
        Thu, 27 Aug 2026 11:18:07 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm66270655e9.4.2026.08.27.11.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:18:07 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 04/11] media: ov2740: Add OVTI2740 ACPI ID
Date: Thu, 27 Aug 2026 20:17:49 +0200
Message-ID: <20260827181756.2430054-5-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firmware may enumerate OV2740 image sensors using the OVTI2740 ACPI ID.
Add it to the existing ACPI match table.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov2740.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 8f0ad5dbb245..18bb3ac9701f 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1462,6 +1462,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
 	{ .id = "INT3474" },
+	{ .id = "OVTI2740" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);
-- 
2.53.0


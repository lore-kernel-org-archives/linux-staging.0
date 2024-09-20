Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C4BF4ED
	for <linux-staging@lists.linux.dev>; Fri, 20 Sep 2024 15:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726846519; cv=none; b=Dhvdv4IdH0ocyJLKkJVejAagv516MEUzuT/jYnqcBL8nLc3ygIvXsLivr0al4KCXFmvTF/Tg0h1n2249xuCua47kvminc9a9zCmqpCDHRhQebZ55Mywj5QcoVS3XP9XphPLOAXVraLh9e3d5jhh41y8X3Ur7GP8S5l8Efa5jhDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726846519; c=relaxed/simple;
	bh=fBDsfV+zMW/6gxIclc90ZOBd3Ei9flvjpQcmZYFjuek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Z8w/G2V4qxgx+iXIepVIzSvcNshk/zAUET6xbQG5HeIHGBuLjakXxMyDQML4OzNjkouqdql7cvpZlUgG+ZWkITrTjia7ch1B7A1Y/AJtY+lWSi4InbrOblObkjaOfAHmXQKrT7qvYplZfF1N1xK6SJvb6hNXiuGVX1hezfiVriY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KzcNe/ZI; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KzcNe/ZI"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42cd46f3a26so19090645e9.2
        for <linux-staging@lists.linux.dev>; Fri, 20 Sep 2024 08:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726846516; x=1727451316; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WDBilY3MF51Au+X9053VPoQLd9Jy1UvZhSlHoScK4u4=;
        b=KzcNe/ZIMyuyjekyiG++KN11k7iBItJ3/gJLR1d9ltulnfY8OYSyK2b6DgWIiBPjN6
         wKadng8dACwE15hLLmARsF1Qua9KvddGOm1LWcjY9WJsqhiYZNEC8iTGXYJkuEtOTikJ
         TQs7CRMlCPZlH5/KlMKgQw+YkYEZveu4gFEEhR3PoeK/VYwp/dRSfaL6BUq20BxMdcAg
         08JsYEtPM8AzcDrjvcXs/DjaAlF7X1W7jItihUObvGJ508uOfaFrwW5jAjXZ+pvL5FDz
         YSY9lwUhtvf6AELthXqrSJ1UHuG7N45LwzX2clxReyEjh3tCRJM87ycE1NQ01mvC4bPZ
         VGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726846516; x=1727451316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDBilY3MF51Au+X9053VPoQLd9Jy1UvZhSlHoScK4u4=;
        b=mhS3sbjcOmD3aFB6jXm1/rTfXFAMvEveYrsagJeWeEZRrKl58IZ9AfywGTGJgE085w
         4xHbNshKGO3S5vQIqWY5h5UPb+1y6Cb1PH/Q7PFdJ8jRH5mF1BbqjpO4b/CXtwTBdNJy
         ucIFpbzNbFET2OaKF31OxMwS4eAuwODXKyJh8Ui2UCqtfRBWjzQDqpEE0fwf17CD5N4x
         yYfrLkUIVUWPXT3VVkA0E7SNKJzSm7nP794YhpXHFD2gZXa01aW0oaMm9eVs5cQFRXZc
         vqM/8YebdmJMDxXbh1Oo3FmcICiDLzT+Xe0KQgVyHT+HQBW6DzPfAywjnmawlSgcWc8X
         CN0g==
X-Forwarded-Encrypted: i=1; AJvYcCUZfUVwg1XKaaH4b7ikzr1fTiBflQzpmARcTzlFbhgwYL6dfs0c6s03W31EB2u0tMlUPCbkFRqw18eAvdWk@lists.linux.dev
X-Gm-Message-State: AOJu0YxIH0XkeM69h+Cor4vatUANtKGUHFvAp8ZaFZye33xc4arSUrQK
	n+lHanqhDup7aPUPeEMW6x5IMCCab2DQFX+GIEZ7guh8KvV2k+vvyRr73J9ggJ8=
X-Google-Smtp-Source: AGHT+IHn0BMghxdxtJ0DHC1THa81UoIl4HGbRJYCxskkhKFFh4j2Y0d215szNY03Z6Z0Zb5/9QXhmw==
X-Received: by 2002:adf:f347:0:b0:367:8a00:fac3 with SMTP id ffacd0b85a97d-37a422c0271mr1820676f8f.30.1726846515556;
        Fri, 20 Sep 2024 08:35:15 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e73e81e2sm17908035f8f.37.2024.09.20.08.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 08:35:15 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: most: i2c: Drop explicit initialization of struct i2c_device_id::driver_data to 0
Date: Fri, 20 Sep 2024 17:34:33 +0200
Message-ID: <20240920153430.503212-15-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1072; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=fBDsfV+zMW/6gxIclc90ZOBd3Ei9flvjpQcmZYFjuek=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBm7ZYUee/SmuSaNWDOlM0TzjnJ6AghRJ93VYbOa Es8TQ9W4uWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZu2WFAAKCRCPgPtYfRL+ TgIdCACaewcIMksFyONCjczWf3O7OTSx1Gn0TsH81s3vCEE6NH7+eauqkLtv2dNiyTrtNPIAOr6 4F5xF04crRXIhPvAcAEXG3rhxP6mK3K6OlxVaVQvp7OdSEBAgK4LYnQ1XdhkECSDoRfZXxeTgbK XBJv49VGE7Dqv1szD+MqIjJTtAwzGYIs1jrqnL79kBNpyoYU2U5JcvftmJSvcKT+dXA0mfssXPo 6qVaqzf0Cbh7IaVlI0MzgqKkeJDNvQyW34/UbZ4Xd5il1A6Be7vvaG/xFrHNJNOav5VpnZaTLFp qcplZ6XRfKNtOreh2E6N1COgLp0bAN/dxcUtzbGWXl6XWZ33
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

These drivers don't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

While touching the initializer, also remove the comma after the sentinel
entry.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/staging/most/i2c/i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/most/i2c/i2c.c b/drivers/staging/most/i2c/i2c.c
index ce869280a056..184b2dd11fc3 100644
--- a/drivers/staging/most/i2c/i2c.c
+++ b/drivers/staging/most/i2c/i2c.c
@@ -352,8 +352,8 @@ static void i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id i2c_id[] = {
-	{ "most_i2c", 0 },
-	{ }, /* Terminating entry */
+	{ "most_i2c" },
+	{ } /* Terminating entry */
 };
 
 MODULE_DEVICE_TABLE(i2c, i2c_id);

base-commit: 62f92d634458a1e308bb699986b9147a6d670457
-- 
2.45.2


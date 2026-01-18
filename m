Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D8C22B8B0
	for <linux-staging@lists.linux.dev>; Sun, 18 Jan 2026 06:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768716367; cv=none; b=gQkvkD+j4c9J5wOgAvIeGVkvnXWlETrSgF1ZDbJY99udIYDCpt5CuejONs4xgcKGVBTrZtKJWHRLv7ok9jNClkeKr5GVPV3v//dqzLf7ZwxcYHGfjf8R5GltsFUn5Sl+KFamxvuhmJJoLdEUixZcQ/+FAGzoZtzSezN8VnskivA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768716367; c=relaxed/simple;
	bh=0VJ3HWpJOKze4wOboFzoB58uIQtJpgEbIDTAy17hPOY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tzOyscKOZZrammLjl4NsC9oM8GcVdC9RgjTW5PLLQwi3Tb0rcMyXOs8ojOhJ8Myj5yQoRJ7sDpZVUFSZcUWPLC8ybk0qvxw0t3KigRNsfNmlthsDvszbfR0jpDcmVL8rYOsCxzUBda+/b7vMuCvTCJVHcMmQVW2PSOYBrjMjYHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VcSenwVx; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VcSenwVx"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-34cf1e31f85so1747962a91.1
        for <linux-staging@lists.linux.dev>; Sat, 17 Jan 2026 22:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768716363; x=1769321163; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5L/u55ojOMWDoZfJfBy/ViDPd1rJfbOcCEU36M5eKa8=;
        b=VcSenwVx09y2iSFT8s2aMKBd8l3QHfEBPjKlaY4kCXHy2JQFdhmOw7sOIkVMlomUTA
         vrVy/fF2cv1k2f98ymyUY7HJR3vA4I9o9JFjHFr3GaNY4Xu/DResYEbGTMfULLyrlSql
         EnikPzMlXG0k3WwtZb2/VUqAEi5hhOAAH8Qo6+2LvkAnT5Ttl7gh1jtQMRlM90Jcm06C
         +ScADD4fzzVGvNqj0cLSARSTRV+7FUtvj4DkK+4LEtahFR5uhgDiV25LB4r/IXPG56g6
         fPE2M4nkquIDNoF2WjwS8xsz7pl8DHzc4vrOLzWYD1N2WpM5u211skLa7WOalWC1W3+W
         cEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768716363; x=1769321163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5L/u55ojOMWDoZfJfBy/ViDPd1rJfbOcCEU36M5eKa8=;
        b=xOPh8wYAgg+nTSXqefHFTgIFhD/gu1/Va/7Pv6ShJ9ebKVvpQnD25oQKoLCESkbhbK
         BHVI2zJKPptNrsCOYN2o7uPKM17APTTL2y4qp40xpJKGkudBBd+jHOWrPqbNUgrigwwm
         3dBA0V4p6kV1o+BMiyTZbhciqhnEQUPCfWTdV4cs5twldOO2pZOtjKch19QBhLqAKygz
         KrEEFtYbs83PrWhWDFoWo1eH3x1Dt81Ux5u5T/tPgRRtPxQi8PD1wAa1G8u0aB/pfajd
         Q02WhLIJWej5sYjef7ySUOiEGcJTq2y1gWXIGB1DB6f7iCy7Flx4nORS9BooaSxal9W7
         +8mg==
X-Forwarded-Encrypted: i=1; AJvYcCWvK6cB3SVcm/b3OVis5btR5EVTCr4oHD7tBvK8hpnsUhw3ZobiZmDR+i0u6kx0M/6LVBfRo9e8Lmkmyq6m@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1gXhw3VsbhzWTiJb3phBUdU4P/g7RxhoIyPpcn7yeHCaaADpv
	dSygoJ0EFmt9xvwozVn65uOfxzRoDU8tPzMXobHyvbCInkLM7H0lf0nf
X-Gm-Gg: AY/fxX5reSO2ATCVZfKx4axfJsAMq4rD49sxgPFFHab89gktqCHPnwMCjihhADfF0gx
	dAMzc66WiVcJ7aMeZjeHO04g/peWTVJvZQWXMNoR8iOBUGTvjC8zGN2h7erf65mEqkXRNZOHfjd
	Q+qhDR+pfj4eWB5AvIAYPjlLHtaoxYKAg0RFhtch4TV/ViiviXii/p/fCNoZfg31oAoqplxRatr
	fT+9VKhmik+U/OrsqprEnl2BsEbIQTs7pHXZICAHrATI1t4LlPLCRkKueTukAJVs3wcZW16RUnK
	oB3hiJIYep5gIelpLL1zCcEIGoRVunmk/5h32gc7ijz3yaiG+Gtbt+rMaOLdgs1VLXGsD+m/wru
	tV9IgEhPV4yLGL6TcRDFccw8MfRz0Laadmg1xKNUSiu1ZRqWJ4HbGwoDURRzUASIKu/gYG86CSm
	h4FkRYFnD6jM8Um5RZ2lxWEi8yVbD08g==
X-Received: by 2002:a17:90b:350e:b0:33e:30e8:81cb with SMTP id 98e67ed59e1d1-35272edb3b6mr6658940a91.13.1768716362963;
        Sat, 17 Jan 2026 22:06:02 -0800 (PST)
Received: from debian.ari ([152.56.157.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3527305490fsm5730026a91.1.2026.01.17.22.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 22:06:02 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: vireshk@kernel.org,
	johan@kernel.org,
	elder@kernel.org
Cc: gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH 1/1] staging: greybus: fw-core: use %pe for error printing
Date: Sun, 18 Jan 2026 11:35:48 +0530
Message-Id: <20260118060548.24548-2-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260118060548.24548-1-architanant5@gmail.com>
References: <20260118060548.24548-1-architanant5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the %pe printk format specifier to print error codes as symbolic
names (e.g., -ENOMEM) instead of numeric values. This improves
readability of error logs.

Issue identified by coccicheck using the ptr_err_to_pe.cocci script.

Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/staging/greybus/fw-core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/fw-core.c
index 0fb15a60412f..1ad404d69b87 100644
--- a/drivers/staging/greybus/fw-core.c
+++ b/drivers/staging/greybus/fw-core.c
@@ -112,8 +112,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			connection = gb_connection_create(bundle, cport_id,
 							  gb_fw_download_request_handler);
 			if (IS_ERR(connection)) {
-				dev_err(&bundle->dev, "failed to create download connection (%ld)\n",
-					PTR_ERR(connection));
+				dev_err(&bundle->dev, "failed to create download connection (%pe)\n",
+					connection);
 			} else {
 				fw_core->download_connection = connection;
 			}
@@ -131,8 +131,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			connection = gb_connection_create(bundle, cport_id,
 							  NULL);
 			if (IS_ERR(connection)) {
-				dev_err(&bundle->dev, "failed to create SPI connection (%ld)\n",
-					PTR_ERR(connection));
+				dev_err(&bundle->dev, "failed to create SPI connection (%pe)\n",
+					connection);
 			} else {
 				fw_core->spi_connection = connection;
 			}
@@ -149,8 +149,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			connection = gb_connection_create(bundle, cport_id,
 							  NULL);
 			if (IS_ERR(connection)) {
-				dev_err(&bundle->dev, "failed to create Authentication connection (%ld)\n",
-					PTR_ERR(connection));
+				dev_err(&bundle->dev, "failed to create Authentication connection (%pe)\n",
+					connection);
 			} else {
 				fw_core->cap_connection = connection;
 			}
-- 
2.39.5


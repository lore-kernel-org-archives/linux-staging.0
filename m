Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB914B44C6
	for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 17:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791824436; cv=none; b=R32skfvfJ6caRUqTHeKs+Afa1cR9/L7eFsrlcUkN0xYm6fcSN20UnhAs2gBgZeA4kiDu4LtvmK5IVGJkh4rJ2hBQwcVGFL8P1gV2xfuu9KVOSMz7CRbD2/s6FRd7nDQMMUDLcKM6nZ2EjVV8JsJd2cKTiSbfjsqqkc6FMlPtink=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791824436; c=relaxed/simple;
	bh=NChA0uA8/+eZNHQkSxbcV+2zHzjxRFg/wQPl/jusgJw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YDjUFiJDO8HZ2bIUD3a68tGPK8fKLSsvvSj/rpXQJbaWW0Sg+g4L4rWrZ72TBpOmKCDj0GtFo69VrJMyi4aPJYEsSbKh4j/hU2EN5uiH5PM6Oj+GWnMKvgckZNN1ahMiSPwe6/GFmrePn2ULqDslqsh1tomoS8ZypCqyKQqu52w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eIpxvGkh; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eIpxvGkh"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1419d3416ceso2845514c88.0
        for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 10:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791824434; x=1792429234; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s4g8PCfH1fFoEZObwV6RdWowws5NfT3FAx6q9WXCp5o=;
        b=eIpxvGkhdFmnl9EeAUFvH33PaKoBlfNpovesLcHuKtkeAOq3FhUpqxp3UnfT50jF3u
         gsKbwZ6FgeA3f9afGXtjStWy0f+2BW/9+fPAnFn1bIgDo+2pheqzBV7DuVh9pEuK47jy
         zXGH4wLaZvstOdHYQYQm/jzKZuKf7O91Vm+HxcUAur/QFE3Z5FJI8nT9CsiTr89+gRyr
         5TJJHd05uEK3GQuSD/Q29yKNiSzgWehhcldVnsf2hocyw0znjt42ywjOrKFFDXIl1J3i
         DA3/8+be5KKv54QJctABkvw9GNE2LEYQmeadhqChrO+p/74TEYRVRXna+p+zlOzii6eK
         3lIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791824434; x=1792429234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s4g8PCfH1fFoEZObwV6RdWowws5NfT3FAx6q9WXCp5o=;
        b=MBMnCGf1PKpsKOvhyUVvMbM/cU5umYyXv0iRoRMpNBSzCJDr/5pYQ4Ygc2wk/+8q0Z
         CwHSF57ezQorXdiqDYG28+l9KoG4OMfOQvRxmgfmSSV7qXglhnlI2HZ0pDN3oH8unJ2L
         qtqf0w8N13xS5Mbr9i0W5igjXEUWfjAq2U+eJLQtVZ9CyOC4htSglLFIV65LXqygqXJb
         2YPagyIefFlHBVaITiwQnPUlbCZ8pRKF6MS5azIa36caBJXRJHuWF/WtT9aLx+wOmzhc
         TF2ViQi+eEVu0fhwzeNJDyCbxPb9Npy9HurQDBoPGoVN+xuXFNCUofvLMr0LoKUerS+J
         d90g==
X-Forwarded-Encrypted: i=1; AKwUvBwVBMCy09wVTDJ1JMzFfaFlBRc4g6BP/BFQNo8emteHsMb8jOfA6zieR0wOmbxD8ej9bvguEJcu5u3V1BUP@lists.linux.dev
X-Gm-Message-State: AFq9FYJRbKevxn3mOvc8MhGdjZ/TXwqiIKT9Qs7uIT0QHgHnVaIq6Qh5
	6DyU+z22howOdhNchkddGAf11Osru9OZTfjddfKKtolWlfuH5px52zE7
X-Gm-Gg: AYBFou3q3FRuAW6xJljcSlJ7GgIqF5CMW0XoCDzLmDMXaCR2pysQ/0Aeb4p+SL2ILrO
	uGx2jQbnuMgKY7OvQxVuR6skZ2zyU3Z+FGuk9FrpeQBvOFzJ7Y+SZ3AWEdF6t+AC8p1mHVCOeaT
	2mevMbhY4fQ9sQWwRbGW6gvUsGgGIcDkJJM/eKuS/+qVUaBQwggCVc9BYbtDBvsdYiGgw388qgU
	uwJL0OYR9Kxl4IMcTNC27vDvn5j5EW8t3O13yBI8TclwKJ154Eb8xuBGcr05es/SIUf+wRUOuKs
	2SMIrEhkAzquv+IESdJJSwlrblbf5CF2YiBi76HSe9irbkLYxZUiXfOi1Hwr80rKtHKuT0kXFeT
	36D8mE1OHRBez/e9B1NHdp6r9ZxWrQg2XbV5pQPgUHW4KkGjlj3KHkLCmr35DYE7yyU/oi+U8qr
	8Hop96UfXa5qrr44NhVFP5XttC/ZMJkvWIr6EPVM1B4vr5MeoZ+Wb1qPqE3SxlQ22lLCNlLGsx6
	ZkE7N8=
X-Received: by 2002:a05:701b:230c:b0:14f:5cd:f286 with SMTP id a92af1059eb24-16a6203dc73mr15566611c88.34.1791824432780;
        Mon, 12 Oct 2026 10:00:32 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:c154:b925:c82b:b0a0])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567aef5sm31171142c88.19.2026.10.12.10.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 10:00:32 -0700 (PDT)
From: pavankumaryalagada@gmail.com
To: johan@kernel.org,
	gregkh@linuxfoundation.org
Cc: vireshk@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
Subject: [PATCH] staging: greybus: replace PTR_ERR() with %pe in error messages
Date: Mon, 12 Oct 2026 22:30:13 +0530
Message-ID: <20261012170014.68898-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

Use %pe to print error pointers directly and display their
error names.

Keep the other PTR_ERR() call because its return value is
needed for ret.

Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
---
 drivers/staging/greybus/fw-core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/fw-core.c
index 2016a74f137f..7053afa9ab3e 100644
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
2.43.0


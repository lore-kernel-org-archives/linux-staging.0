Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06E82D1F77
	for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 08:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792313424; cv=none; b=g3MnNuXgxh40vkf/eytCn1eQZpfc3M76YKN9WaZ4wRkJhGRLMLSoqUaONKJV7CJk+9Ar9Jzn5mGaMG8SLWLAKA2YITkALHUhKAuBDEcg5m8GbEZyWFGzgCuNSixOx80Z5hrn4zo0DrGa059wG3y9QexIj3PJoO+J/aKHpI1h5ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792313424; c=relaxed/simple;
	bh=+f2w5tSysfWdjOMGNQyyeCgTvy5N0XJDSICe0CScJPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WYAQK/YWSCIwzGs8+b9QH81vMYbMQmxjGFMud7HSg5W+lEGyukU7cd35kOVFS12k6sZ49yYst16HYphcAcdvSqTk4Ikow8vMTui9yqBgLC3rDblqDfzjkAv804Uu+Xp2I/AAUyKzfUye9xwS388qrzo1vXf5OCLl/VRDN9uTiMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fOZFHKUI; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fOZFHKUI"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3514b90bb89so3032012eec.1
        for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 01:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792313422; x=1792918222; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1foRyEVgNVxrvVtoWJyDr59yXaxgx8M7G4qkdLHX8oI=;
        b=fOZFHKUIskS8wWaCZdxiQxVJHHjRD6VNC41Cp665UDXeGtRuhy5DTASkSGcI3NnNA7
         Np57y8YJRHVTf3O27B0+KKdXPUTfsA1a4bZrhFxrVBzpuhvEtoPuy8zxq6py7YDXL7YU
         pNzGnzwhJTjg3TyUstRBv1dlgD8qzpiK6jsNy391BnSQDYVQfHDqrH41J7GDIcTbAVah
         X+ATNEGTM43m4l4r7gxmGVoHXvK+Pa0KIlXHbiRXJPEOjK2n5+h92XlE40B+9My6S2SE
         xKRG32SlLK2e5b0km2Ok3IrFK3o+nU5JrSTBPN37HJC/JywpFLFp0m8LwZn2EirotwDe
         pX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792313422; x=1792918222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1foRyEVgNVxrvVtoWJyDr59yXaxgx8M7G4qkdLHX8oI=;
        b=ls8ncNU9JOl5xRU7aqOwN0W89HVCEl+xJlCDf8LDFWO+pGy/o0VY2XA+LGRMR70HMm
         WHNyvedzAbW2ySop6SCDgiO+wPKDsEFr4Gyx1y2vrpmriFpIyg0yX7r9mnAlZZvpd1mE
         LZhHTW0/6B8CBl8u9oUvWA/FFtnn1rqcvXMVuxcuhNI9lXLWzMSVTstHrI12p6GUCv2F
         f5Liw03C12p1wPwW+/1L9U4pxJaPH5suH+iEZPASgSSlJk7o17MBUettEI38XDm08c87
         JsYhtjkDKks17w6oOSzGLoalixcRB8SuXvnHM/v+Lhv6TZMR2BGjiiAmtNAhv2Mr8hih
         TuaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNUBrUFyAjerPTQ84DF3y5FVvDzQvB2JMJf4ZEP+uwC/BpvnVzyTLdEhH5HwAe6vtnKbxl5daL1tTVaf+6@lists.linux.dev
X-Gm-Message-State: AFq9FYLtjCXn3FxTuZ+FUTqMai0cdCYVSudVATCuGjCi0r4Ua3p1uVzF
	R9E2RJXsK7bxQKjcwKcOxv9oKFmR/o9E6C4SPWCUr7uIR5PTmW9G6BQb
X-Gm-Gg: AYBFou336hOTQn5enDhSWHrJpN+FUi1EFixk2nTfaM0/tiRWXvbDwRNfPtxjWmYZXVo
	ZQ0ApvvGIB0H+ZNs+ncANhskhz4UHrjO0MGAoLTJOIC6IheBeIWsAdRhbquWUs8cQKq/A0aptuz
	KBN7XVy8GaGdqafc87pQ4EpNPV9ikqZyAx2PY51c5E/+hQOTRQphcGBCsZRZbNf+EjKRaiay+AL
	iMeL65FHWT03woidIXVCfJZtSuRxdYoIVm0jv8gp5J9p9DFaaEs9g2ptLOwL30tKlmKKS+njSFi
	Oqe65N74BgXtFJ6BQbVtpR8mjIDKsBCqGZSljkOB/SGQz2SwPszujvlU917gjwyCKlSTg4+jf7W
	T2sVYPrTNRFpRF4n99vjoleJhfdI8Cryik1EFQaQmIH7HeHesVhVbKWqI0euIyli+vFB5WaK4tz
	hSr2Qsz5/3YMcl6en2S7F/ITnynKdyXK76JN6tczpdANrFkjv2pLEbDeZg3ppbqYMAFHDDSsvoF
	dWghQ==
X-Received: by 2002:a05:701b:2608:b0:182:9071:3249 with SMTP id a92af1059eb24-185131076f4mr6206897c88.30.1792313421875;
        Sun, 18 Oct 2026 01:50:21 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:1e01:b34a:8bb9:ed8b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831ca95700sm19342455c88.23.2026.10.18.01.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 01:50:21 -0700 (PDT)
From: pavankumaryalagada@gmail.com
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: johan@kernel.org,
	elder@kernel.org,
	dtwlin@gmail.com,
	vireshk@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
	Alex Elder <elder@riscstar.com>
Subject: [PATCH v5] staging: greybus: use %pe in error messages
Date: Sun, 18 Oct 2026 14:19:25 +0530
Message-ID: <20261018084925.11793-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

Use %pe to print the error pointer directly and display its
error name.

Keep PTR_ERR() calls when the numeric error value is needed
for returning the error code.

Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
Reviewed-by: Alex Elder <elder@riscstar.com>
---
v5:
- Drop arche-apb-ctrl.c and arche-platform.c changes because the
  files were removed.
- keep only the uart.c change, as the fw-core.c changes are already
  present in staging/staging-next.

v4:
- Return error codes directly instead of storing them in ret,
  as suggested by Julia Lawall.
- Remove the unused ret variable.

v3:
- Extend the %pe conversion throughout Greybus, as suggested by Alex Elder.

v2:
- Use %pe in the firmware management case, as suggested by Jeremy Clifton,
  to match the other cases.

v1: https://lore.kernel.org/outreachy/as0nhVbagZa8Birm@user/T/#t
---
 drivers/staging/greybus/uart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index d47f00751e7a..74c9898c0eed 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -956,7 +956,7 @@ static int gb_tty_init(void)
 	gb_tty_driver = tty_alloc_driver(GB_NUM_MINORS, TTY_DRIVER_REAL_RAW |
 					 TTY_DRIVER_DYNAMIC_DEV);
 	if (IS_ERR(gb_tty_driver)) {
-		pr_err("Can not allocate tty driver\n");
+		pr_err("Can not allocate tty driver: %pe\n", gb_tty_driver);
 		retval = PTR_ERR(gb_tty_driver);
 		goto fail_unregister_dev;
 	}
-- 
2.43.0


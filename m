Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3EC47D444
	for <linux-staging@lists.linux.dev>; Sat, 12 Sep 2026 13:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789219555; cv=none; b=Qv0FFv6R9Q2nrVWhml3vNcpKM9Q3OPT051gsHnVrWCHR+q/1pNPLKtv/dL7Vo0dLEbG9W0EU8C2kHZlLNkJpj+3IHDRMP49iKOec5sHjEevCVqVy+pHpu3qD1MBwdcIvxZCLzrKrQvNHk+PHwJUWvYI/YOf5ExGIzw0Xr2e9sG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789219555; c=relaxed/simple;
	bh=wFxXi8Z9WcIxFPd9fUaEH26jlrgztUaT4NJh8D572Es=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=twRdSW0T1YwuYn0yy10BKiUAllf7BeoEjxx5EGevXd6CBE3G5OXUe46u9zHImbcIL1V/Mc7uJqPP0vVzezYpL0ivclcPRUDpOShD8pxMH2cWMkEFDVln4PnVjQ/pkHYNjhRcf+AjLCRZT307mEHcK7Rnf8716coUqpJBxWpXqsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ItkpQ2yW; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ItkpQ2yW"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so1829645e9.0
        for <linux-staging@lists.linux.dev>; Sat, 12 Sep 2026 06:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789219551; x=1789824351; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PW1ixTgxWimSTTjdthxgReSlmPLPKmDhq2QrwAvzdaI=;
        b=ItkpQ2yWOV49lOn+RZMQCVx+MBjArZsaBvITmP9X51o0K+uOjADBINIIjC+ebY4s28
         RtxKStmHEbXy1zdBzn2cqH1cIcN6iBv4RZwjvM2Z4wBD/9v2Xh1Q8xVCAA8cGAojiy2J
         kll3hywjIBFoNV4HfgvZ3PubnEZCZzR+dy03Ao2iSvny0RSXE+h2RpOI43U1LOpmoFxp
         IfiDzDbxhaHgcxudu1/Ld6Wr3PNBy8FBLWeILZ/AnJOTOsF+qWpCyW5Mx5vJLTHuCxt8
         qO8KnBQvaYxLIAspcLb5GrSJXL9kwb6+zW8SVwlypyHPRfyy8rbEXr6glfmyuG9qNE0h
         8ajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789219551; x=1789824351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PW1ixTgxWimSTTjdthxgReSlmPLPKmDhq2QrwAvzdaI=;
        b=fhylfoKUo8S/M5fxKLW+xCw1i0aq/G0UQ2epULxY2mQK502YadD3h3axnsTVaRJ9E7
         NBxpXOwmoh0iqhfAhNlExuAp034738mPQ8s/roIGKf0/nPF9JnybAB6y/YX4EmQakIfa
         88FdpC8PZt1vT3ePokBfXtp0Y8Di0LUz0PhDARnToVdcM25nB5keOBXkbXIv+SMVuQQv
         yNBwSb4NgQYCgEIO4vl7JPSc+x/a1/ISnW+wOCQUsqyK/tBjtLpky5Q+ra/Gpz1AhVwP
         x8OWiHDpM2R7H7O+XqWhPU4utSzfDV+d4Lscd1OQZxNQgUfWqh7bzqsnL/oYyo/HLCyO
         X+YQ==
X-Forwarded-Encrypted: i=1; AKwUvBwozxOT4tzdHk8JrIk10FifkdiDtdbOYVNmMRQ98YyUoywA+3/u0wxURbBCUcSnt2QwE2DGBHLNUwp278Li@lists.linux.dev
X-Gm-Message-State: AFuF++n0jdI9e9S5Svun2oBAsdTmHWqAVB+8JGkIOgNb0m5scGrtrZV6
	RgSg61A5hM/xNccwAmnDQW1inQO3bSzqR4tupHExh5zidRY9fK/afEol
X-Gm-Gg: AYBFou1cUtIUaCeP7mJ3jrkZzfSQCzuDbuV9X5k/sNtXXgsCxe5hX4JTBKN4rS9VPG2
	Ymf3rrYbvCQ+aiHDGhFo7B1k4XWpMefz8HqKVT1U8NxkEnCixTylkyTMIUoFl6cXaSnF34Wa48g
	4K703CjbqlZq+iCe0UVLg+utvtrYZIGALDVbtGjwh272xtEEUzaX1+NBLmMksPaKzqVFJPGFoxw
	sc7E+GSxmM4G8I/G8/xJEIH70oVWwHtDdvBw/pnFw4teZo213O+Qr+Gka+3nUtbV8dFKb96tz3Q
	zMRal/YtuJsqpiVtE2+fEQnmWTKLUDffXC+T8B0V1l0d9Lk1ecAARNmYCrVxel0u0wp2z7Ukxx9
	PX2eocMoFzjzD4TqR8PETJLaY1X1EgAmr3BNc7w8YNiaSv8UngVNeKshlLnkTW1+qbXyyCXRrkc
	v8qOXnHjhNfwBy/gGV+lGg/4QjaxrNhCfNSdbGVxD9PJ9Fw2Itu4vdcbyegKybdBPAuWFIPkgLj
	Zi6ThGSpd2s8u6Pbw==
X-Received: by 2002:a05:600c:19c9:b0:49e:6683:d23c with SMTP id 5b1f17b1804b1-49e6ca4003cmr24788655e9.0.1789219551327;
        Sat, 12 Sep 2026 06:25:51 -0700 (PDT)
Received: from fedora ([154.182.88.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee8bsm12684503f8f.15.2026.09.12.06.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 06:25:50 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	gregkh@linuxfoundation.org,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v6 1/3] staging: iio: adc: ad7816: Sort headers alphabetically
Date: Sat, 12 Sep 2026 16:25:15 +0300
Message-ID: <20260912132517.55686-2-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260912132517.55686-1-abdelnasserhussein11@gmail.com>
References: <20260912132517.55686-1-abdelnasserhussein11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sort the include directives alphabetically to improve readability and
maintainability. This is a precursor cleanup patch to prepare for the
addition of new headers in subsequent changes.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 30644d2d7c54..9e43ce83e071 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -5,19 +5,19 @@
  * Copyright 2010 Analog Devices Inc.
  */
 
-#include <linux/interrupt.h>
-#include <linux/gpio/consumer.h>
 #include <linux/device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/interrupt.h>
 #include <linux/kernel.h>
-#include <linux/slab.h>
-#include <linux/sysfs.h>
 #include <linux/list.h>
-#include <linux/spi/spi.h>
 #include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/spi/spi.h>
+#include <linux/sysfs.h>
 
+#include <linux/iio/events.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
-#include <linux/iio/events.h>
 
 /*
  * AD7816 config masks
-- 
2.54.0


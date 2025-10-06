Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500F134BA22
	for <linux-staging@lists.linux.dev>; Mon,  6 Oct 2025 09:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759743680; cv=none; b=gnEMe0CN5VQObcNLAx0HIYs6FCIS/LZI4ZlOaocAzdXYE0XjZusa60vX25ZTXZMq9wfkWdFMyacsMCqABTVaYhR+DHmwYNwCO6ycTp93cYn55ZG8i8hQNeVO7Jn/1jzGjjtEB4kFuiX3zMgI+B9nUHS8Vfx5Ny1b75HTUgPspEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759743680; c=relaxed/simple;
	bh=24sZmUViPfdoTKlBu2+lcVKxGUTmmLWmXX2XY780LyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R9X3ev9wpZfrUSzJ7PqmkheoF8wsDdmM5l7QUWP3brgdHggON5J7O0yhdZqXjm4xKeiUOPKwfrCECs1EzoaE1f+FfAjA5dM9eWIrpNQmAwOAJVrKSp/iUWcYQNQbqSULLIoDWnbjUhFOt5A4xnuYLu7azhzRFxRnzyf8PB3ejOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kj89/jsD; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kj89/jsD"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-791c287c10dso77175b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 06 Oct 2025 02:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759743678; x=1760348478; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4g2Dt/TcqCZ9Q+bj74Qh0XyQkDPrwX2+n2zSBd62o0=;
        b=Kj89/jsDpHBp8uSphBdRWE567C/ZoKyUtyoB2DMoB26ZdgFWekVrOBuhEubQ5E+0z5
         tNcloJXyjK3e58ffi0IToXA3q724f6LbTpzrLvBp4Jy78zo3WBYy+O8usj/ikaN1lNl6
         /AYxQsowyLGO9KS3ZzkYvs/gAraHrt+AllPfkxVTX0Iz5dWzVV24PHE6lwB+e2n49g2N
         xuMrBmTKGh7cY2N7DFIDZUtalgVYv5Dm7aVRfCNGiJZ+1Ud/rPuG2bNMTHLt0BvsHYWV
         zIyP45C/Zuh3w8bo7CNQti3lEFEJeJKXTdSaOW/2xsraspFYNUYuXGn7ta9jzgElLGr1
         qhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759743678; x=1760348478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E4g2Dt/TcqCZ9Q+bj74Qh0XyQkDPrwX2+n2zSBd62o0=;
        b=ck0rUqEVaGmsUzCxKAyAbJrANoUulVc/eii7vqoxteGdGmpEgnwgWxdy1w+LYUT4aC
         bu2CHxD6/minBYYKV1IqIemvizzTOm/AUYc4In24ean6a5tedDjhUIzqacEYOKQDo5Nf
         UCYubGpmPS4xYtIRVG2X+UZk78iY3o/RVHZEsR3SD9PegraVo+zj6OGoZHTHB4d401h6
         cPKC4hIBF8NSSx9WyDWAwkVx7yLd7NcePBS5UOT0rXlv3y2Z9RdzWgpYKLq6A9ZxlXDQ
         6k4ptH7V6Wk0DlvgxzrT68Ala4ubkKn+ganCugO5Xc7Vte37qgK4Y7sGCN5Rw+Ol/YTu
         XlAw==
X-Forwarded-Encrypted: i=1; AJvYcCW5r/v9PzmSc51UTrs+v9LQmlcdlfaS4eBhOfY6FlD1LaAiZuUwLc3MwLxeilwBKBx6eI2D/NATPgG8d+gz@lists.linux.dev
X-Gm-Message-State: AOJu0YymkFA4dTw0Da0TKargOD9ftoNd5T+PF6qdt+6G/w4QIk87kzvR
	WvrQbvUloYxirQkddoc7fgMvDMcxf6EuJX+TaaxXOCCVr5os/sPvzXiW
X-Gm-Gg: ASbGncsJveVCYAceMCfIH/a/4kQGwYMmMSb1uHxM2NN9RR8Xb2Ue1c5/x2CFNTI4849
	WMY/dbFTihUzx/GDmqAoF0D93Jn0S1E373bGI9Ss6XOMM9zwifhRXvq3FyeC2S8Mtd6ibQqIeFj
	vvI2h7DSqcKItCpiI/YWLe8ScsH9JZ0siQKeBexz57p7a768wnFgtqyGKbP0ZGXzbm9jRlVM61+
	9tDV5cafq73xWa/3KsJkpktV1Xv5KJ9v9C42RKHqxaq1FvHXmQWM4Eoce9ZSPpQ6V0jt7Am9M1b
	RAez6lDb2t006d+WszuoIngkrv2Z0smpnSLWzsZNyedS1qgm/9gcS84PxskMB1pC+eUlEwB+txU
	ZuP+Gg4Vrjueh/IGNeKjcrlVbBeYaES2CRzfpjQ==
X-Google-Smtp-Source: AGHT+IHgfM9EDZrwpjiaW1k4I95OIZfCiOHLduIpkcRPiYnJMWY4Fkb+eSQxUHRYkT1ib759moqT4g==
X-Received: by 2002:a05:6300:218e:b0:2d9:4afc:e1cf with SMTP id adf61e73a8af0-32b620ea86dmr14590976637.47.1759743678561;
        Mon, 06 Oct 2025 02:41:18 -0700 (PDT)
Received: from ASUS ([119.63.139.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b609be239c5sm11325778a12.19.2025.10.06.02.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 02:41:17 -0700 (PDT)
From: Taimoor Zaeem <taimoorzaeem@gmail.com>
To: jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Taimoor Zaeem <taimoorzaeem@gmail.com>
Subject: [PATCH 1/2] staging: iio: ad9834: remove empty ad9834.h file
Date: Mon,  6 Oct 2025 14:40:24 +0500
Message-ID: <20251006094025.259440-2-taimoorzaeem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251006094025.259440-1-taimoorzaeem@gmail.com>
References: <20251006094025.259440-1-taimoorzaeem@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove drivers/staging/iio/frequency/ad9834.h header file
because it contains nothing except the include guards.

Signed-off-by: Taimoor Zaeem <taimoorzaeem@gmail.com>
---
 drivers/staging/iio/frequency/ad9834.c |  3 +--
 drivers/staging/iio/frequency/ad9834.h | 10 ----------
 2 files changed, 1 insertion(+), 12 deletions(-)
 delete mode 100644 drivers/staging/iio/frequency/ad9834.h

diff --git a/drivers/staging/iio/frequency/ad9834.c b/drivers/staging/iio/frequency/ad9834.c
index 0038eb234d40..d339d5e8e043 100644
--- a/drivers/staging/iio/frequency/ad9834.c
+++ b/drivers/staging/iio/frequency/ad9834.c
@@ -21,9 +21,8 @@
 
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
-#include "dds.h"
 
-#include "ad9834.h"
+#include "dds.h"
 
 /* Registers */
 
diff --git a/drivers/staging/iio/frequency/ad9834.h b/drivers/staging/iio/frequency/ad9834.h
deleted file mode 100644
index 521943aa0e61..000000000000
--- a/drivers/staging/iio/frequency/ad9834.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * AD9833/AD9834/AD9837/AD9838 SPI DDS driver
- *
- * Copyright 2010-2011 Analog Devices Inc.
- */
-#ifndef IIO_DDS_AD9834_H_
-#define IIO_DDS_AD9834_H_
-
-#endif /* IIO_DDS_AD9834_H_ */
-- 
2.51.0


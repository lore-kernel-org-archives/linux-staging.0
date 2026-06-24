Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EDC2E7635
	for <linux-staging@lists.linux.dev>; Wed, 24 Jun 2026 07:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782286719; cv=none; b=AAlOjsREy4nsigIVnFF6PtmEtGIev/cwCgOQkre5u7fuNfjAjkIWieL5dvwSfpOV5+TGUip6icaJKBGLQBpui54z70YnZ+oS13RShSwh9aRl7DzNYadx8htccF4XPg+KUrW9zKIGsjpJ7ZSjL/AcDFbKmy+JVRnSLVrJkj1xccQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782286719; c=relaxed/simple;
	bh=5Z/CZfn0CfC8QFnMep1ReEO8WH6JJMbMm3qMgD2ezDU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gKtxBDirGwAHjGv8P/vPDxI6paXRqTdJObvP5Ks4A1cWc5gz7IwAt4CyfDPkFhOzXwYzgDGUVdN7rgdlYf6Dj7ZGOXMnCIxkbE9JU9DrAMRuM44w6knp1SRjQWSkuZZZ3//TlMKfftARzFzMmozivtvHQQYdODBy0hJnYMoZseE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jvsh3BLn; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jvsh3BLn"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4926046fbc5so5543285e9.0
        for <linux-staging@lists.linux.dev>; Wed, 24 Jun 2026 00:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782286716; x=1782891516; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vk2iYqcO7LMBB/0161whJq3oPaKM69uvROOVp1OGQZM=;
        b=jvsh3BLnnW2uo/g05Ilw44rDkMabiwhYxQk2L5EO/VRYK5B18YWsoUy/LyxZScNvXJ
         wMTZfF1TsjXFJ85oBhUJn6KGNXWeBrxWvWfjEyyLJ4a/0jny1pD2VBdE2eHoviAPBLkd
         Ak29tfJdx06bql/JZ/0gHWH4KBap5t91hGSjiyWWlSrq+7/NLnn7yCQybHDNfAJs754A
         I4+Of2jOFHY8yEji27YqY2dkLtL/1TFZhlXP7FapNzJmRbDMjNRiJWHv3D1mPiyhgC55
         gIt6hMWqA+kyjygnUp9YUiSTVdeGKvm2CmYEvkpeRoKPDKfB+lgV5pr0mic7b07DLuQm
         UsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782286716; x=1782891516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vk2iYqcO7LMBB/0161whJq3oPaKM69uvROOVp1OGQZM=;
        b=S1JVzm8hiXUntsVGIsdIdVtd9ldb4oh/PMru2mXz1g+WzopQchkSA5J2102j9iZHLS
         j0OtGRkG+9q9WKDBfIAS1VMfd2Fw8AguhqHEg00gv8mPNUiQoMmMYVsUN93baKQnSBNY
         A1y+eA7JSVQ1Y6iGkvibAmJCtqIbDfQGAIcyBlVdd+No00fZTZmLspiC7bcGblpRfAv5
         4FXFYPiAbiWVuNYmtsmZvVS0a8Al5THtNIEJyFIi7OPHsGw2Ioq34IwcZ/jAHdb5APwu
         QsryRMGSnu/F5nLuwZVcMDQK9f8uZzSnLSQ+Vpouf+q0s4crOIz2ZQAlDjHPYs4yu6WW
         6yBQ==
X-Forwarded-Encrypted: i=1; AFNElJ9v1oRllHC1mrqpa22/S3sk+PZOtIae3ogjEd5H5WanhK0zso4NZU1Jw+G7I6WPI1IlDYDQHCF9aoo47sE9@lists.linux.dev
X-Gm-Message-State: AOJu0YxT1RLBbdHSUNSyUAJaVOg/aVTwVQSWASqU8NXgu4sbw5C3s43u
	ZenaENKTK3iN5gv+oUED6D+EpJX69UY096oJ2KS3QeJoIQUlcGVKrQES
X-Gm-Gg: AfdE7clWkARtXt8/v/acm4avdLazR9RcELM7cvO5yGzTbGWn6QRtwpf3UwVbjoxRqNR
	RbRutSqpfhlsrRoHschm+XoYLrsOVh63/To8EKkYdOe0LlZhJfMh+gnKpRti0Lq9RP9D37dVWBE
	Xfs4Ajplm6FVXo4fAEvWkIBbTjDd69aguW3Jfci/XTyuLThfBfglPuTOpf2KXCSvlK8Orz8pEfe
	lEOIzg9XfsaLEYOBY54eoVXPGynKa8zwK7JJUVkmfLMy0qvq7Rv8a7JQHmXqm8ePaRrJGjEqkEt
	rwDduBqoJfQ3tDEy2DDudaN/GnIMjlctebHfw/I2vofREwuWKavMzXmhLptSJUZx4WCpLeBMKCS
	1HWInRbfvzYrfo7S1lHhffVzIzTyeiAVQyuLL0Sb8iJ3jgILnf+g3EMXXU2EF4Tw6JD84LHius7
	Bic4n4AoHx1CBui5pISdXuii5XYA==
X-Received: by 2002:a05:600c:348e:b0:48f:e230:29f5 with SMTP id 5b1f17b1804b1-4925a0c564dmr93840065e9.16.1782286716400;
        Wed, 24 Jun 2026 00:38:36 -0700 (PDT)
Received: from localhost.localdomain ([115.187.36.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49260915286sm78796755e9.1.2026.06.24.00.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 00:38:36 -0700 (PDT)
From: Joyeta Modak <joyetamdk@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joyeta Modak <joyetamdk@gmail.com>
Subject: [PATCH] staging: fbtft: use ARRAY_SIZE() in NUMARGS macro
Date: Wed, 24 Jun 2026 13:08:04 +0530
Message-ID: <20260624073804.4391-1-joyetamdk@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NUMARGS() computes the number of arguments by dividing the size of a
temporary int array by sizeof(int). Using the standard ARRAY_SIZE()
macro is the correct way to count array elements in the kernel, and
ARRAY_SIZE() also provides a __must_be_array() compile time check. There
are no functional changes.

Found using make coccicheck (scripts/coccinelle/misc/array_size.cocci).

Signed-off-by: Joyeta Modak <joyetamdk@gmail.com>
---
 drivers/staging/fbtft/fbtft.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index c7afb0fd3..48da1503f 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -4,6 +4,7 @@
 #ifndef __LINUX_FBTFT_H
 #define __LINUX_FBTFT_H
 
+#include <linux/array_size.h>
 #include <linux/fb.h>
 #include <linux/spinlock.h>
 #include <linux/spi/spi.h>
@@ -233,7 +234,7 @@ struct fbtft_par {
 	bool polarity;
 };
 
-#define NUMARGS(...)  (sizeof((int[]){__VA_ARGS__}) / sizeof(int))
+#define NUMARGS(...)  ARRAY_SIZE(((int[]){__VA_ARGS__}))
 
 #define write_reg(par, ...)                                            \
 	((par)->fbtftops.write_register(par, NUMARGS(__VA_ARGS__), __VA_ARGS__))
-- 
2.53.0


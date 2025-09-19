Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69CA28725E
	for <linux-staging@lists.linux.dev>; Fri, 19 Sep 2025 07:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758265451; cv=none; b=MGDMNaMnq9sTrEluaMFE1arzGILO7r7Q28E4yFJAQX5M54LP+0NEfEbyIIJbAbkWfPF0xGqhkobD9ltEMm4tDBWnFTKliufCP9sInPXaZkmHD9Dy0S8WqX+sKrWvConwHEJePQH0fmFJDxUKscMBoXDcPRHSi052CIsMbeAjndE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758265451; c=relaxed/simple;
	bh=KU1h4VV1wMSXyouVUU/UtVsEOnDbsRNg47FkuVn8FTY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q3fgzbPKel++g4pC2SmTg/zZcTgepjL9EBtrnY6hXFq6uE16+IsP3MTtpbFYyfRyXvzeJzQ/zbiLMdJ7DXAln7Eg3CEA27q2WfQ2XUBgFfXjkceRWil7ZG4cYmDZBDT2LwWaZNzNQjB+eFbyTgfPD66KbNuGzDpEgQR8Ew3zoxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IyPnNrVn; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IyPnNrVn"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b4c3d8bd21eso1269132a12.2
        for <linux-staging@lists.linux.dev>; Fri, 19 Sep 2025 00:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758265449; x=1758870249; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MttuRBNzmVWlDOV3YcR48SUIZiA43H+TnBEZ6HIEHsY=;
        b=IyPnNrVnC58pbf0FZ5rvvIGtBExKEtLh27noFY+v5M4w3XkFTSUgIPtMxS5YqaNRnj
         MhtuhrEzOI+4kCwFCqc2mnqMEHzWHZRPYz1OhMt5kgR2w/7WxHy6nzsXPBbzzT8srzyW
         VZHRn42O+U/pD+/fJBhU5zbBpyc1su5/+t9pQ/9C7m/f3iSNre48e0r9r9h/71QJjxuJ
         +93W42lZa9MEBdkQ7ZxmhfdiyhBaUgo7r8oMX9cnWb4VkjPiJRCpKaCaA5uPgTnXpBim
         +W/cN74M0ndxhSF1xgMbFBb71KuTxw/Obgu8k6N5X5N21tTwSCqyFK7s9IcK04AEQ8vJ
         klSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758265449; x=1758870249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MttuRBNzmVWlDOV3YcR48SUIZiA43H+TnBEZ6HIEHsY=;
        b=QXngqVLbwlex72VHugSYyvuIsPDAlECfXiLx1QKOgialJEnWgZklspVM27HM78v9nN
         1Hmz2i6sa88C8oCaD0pSbDwt4lPQo1N+gsrf/9C1ogGEgagbsFpHEsfjLTy4eyib0pGF
         uCy0YYPuweJcVsjzTH2Z1CD66AwZd3Rqg9aQb1/rDvFSgxNItPd4bJi1zONHzHykmLWx
         kQR5YuxiNSrXcgBQP/ds4BHUPnUcJvlxLGA35bcU3NmknIchIK1LoecoZfqYnLrwwG3T
         xU4YrfPuYtSgbxQfr+bLv7ix22K2qfAk4m8eN+9fc2SnFcH7pggmv7FCv4u9VnIuzDcF
         UgEw==
X-Forwarded-Encrypted: i=1; AJvYcCVfu0hHsqJbjt5ty0a0EFpng9i1Ufp3Rmo3kLgsz5v+7X6q1ZJ6CxDMW0B5za8ZI93/2E/PCPYcvEzeTTEU@lists.linux.dev
X-Gm-Message-State: AOJu0YwhFnNFr+3Z2mqXhKGVLgtFImZO4itkZzQdnGUmGJ1v3aPzcEHt
	w+y9ICx7bwuDmG8PUYlItRHeFOyW8eRBhnn3Yhn2vPohuKq1mhIm1h4=
X-Gm-Gg: ASbGncvQFpcwGTf2rMzEH9BSFYC5b5QjNI1ktV8YaWAxXTUf1XN88vlcUq/k6n53OZS
	/lJXjEdMGXzV7paeUtcbqUvgcgPhSCo2ZPyCLMZvDkl2UqOW1YUN1674GSNwD1asJgROnz1LkBb
	lTYZWdCI4lydgzmd3bVSkV4sslTCdgOmrnUMb5jlyOpJoZTAAq33S16SOYwLVz0x8MZ1Uix2W9z
	te+OJzoWQzlMKcLHSr+Wa4cO3Mn0c1Od5eYxz5oTh985lx85zX/5KKEFDkkFtVh/RT8KAGkhdhO
	O4sDTbGt3P2uGEelSc6d2Im9utwWlfFjvQcjwzHGPr48vrWASJ3jujCAZ1iDlho3tYZATLhe2Tp
	kSvcfESqsB4yShVfAeG7ngEPojkU=
X-Google-Smtp-Source: AGHT+IHmJKuv+e96jX+1MZEwkVy5fSIJUGxs/wGDLFbRe5tki3wCVU5d+tEKvL9/S3U78ckwSQcHnA==
X-Received: by 2002:a17:903:110c:b0:240:9dd8:219b with SMTP id d9443c01a7336-269ba53e4bfmr31773705ad.49.1758265448958;
        Fri, 19 Sep 2025 00:04:08 -0700 (PDT)
Received: from karyapc.. ([103.105.227.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802debfcsm45519755ad.86.2025.09.19.00.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 00:04:08 -0700 (PDT)
From: Soumya Ranjan Patnaik <soumyaranjan1812@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Soumya Ranjan Patnaik <soumyaranjan1812@gmail.com>
Subject: [PATCH] staging: gpib: enclose macro values in parentheses
Date: Fri, 19 Sep 2025 12:33:48 +0530
Message-ID: <20250919070351.586981-1-soumyaranjan1812@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Macros with complex values should be enclosed in parentheses to avoid
unexpected behavior due to operator precedence or macro expansion issues.
This change wraps the LINVAL macro values in parentheses to comply with
kernel coding style and improve code safety.

Signed-off-by: Soumya Ranjan Patnaik <soumyaranjan1812@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 17884810f..ad82be69d 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -47,10 +47,10 @@
 			dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
 	while (0)

-#define LINVAL gpiod_get_value(DAV),		\
+#define LINVAL (gpiod_get_value(DAV),		\
 		gpiod_get_value(NRFD),		\
 		gpiod_get_value(NDAC),		\
-		gpiod_get_value(SRQ)
+		gpiod_get_value(SRQ))
 #define LINFMT "DAV: %d	 NRFD:%d  NDAC: %d SRQ: %d"

 #include "gpibP.h"
--
2.47.2


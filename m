Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1C6184524
	for <linux-staging@lists.linux.dev>; Fri, 16 Oct 2026 06:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792132702; cv=none; b=bWuHE0rgFq0KWFGRb4jqBNkGPMxzpWLtdPDbwLUk917FlUEUuHxtqJ9KMCM7E9jy3OXrOxRSQfcsuNq+Cy+nDdgXaSuAZbL4hyVk0qdbOGutc7Eb08FPY1uysqwQx3+NfMbF5cbaPiIG8sT2e0+8fCrt1x1R57n40KeQqmCmHgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792132702; c=relaxed/simple;
	bh=zbBYNRqIpU/zXlbS3PL2t380sFU4bLeo0x/J25o3/Yk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A67onV4TTTc+wZH/5Z5bnHqWvDxYz2qbgrH7VO9iz028VYIk1KxCdnh0cFt5roNaklTZb/lXp6t2irfJj4IYk2J1lucVUKyG6g897m576u5U6oZTjtuuP5mnA17/TTEAAJiz6sliX/4MiwhduXCmaw+ATwrAsqfo/9mJf3tTpX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bO7KZwZ6; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bO7KZwZ6"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35b2c599f43so2290152eec.0
        for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 23:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792132700; x=1792737500; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zozTgap9/7XkjDcW6YDxcMncGVIIlLjENhuebqzWUwg=;
        b=bO7KZwZ65Ucz+vT/W4uMUY7Zogcz1aZoW0Y3QudEWGrkTPleSZ6HSLL6jm+XQ43AFO
         16Ffllq2+PiSW96BtKVTNPqBrMiPpy7FAhW+ELVluSvymj8zbCsckRNKnVHoPms8Jwyz
         nUfL3/Tv+2kg35VgIzvqCp1jVgFuv5ta+/l+jmqJin8/MwaD1zDssGznGt7W5LtvYc3o
         93emAZDwQ2qzmik30Fuymn3uH0tx0gKFNe3xK7/hB0Hbd7zqSSSfKFMzwuzdMu7wh6r5
         5cYfvhVmcpG5MHdO3sQLgRfWJ8NCYwo8Smx6EI+RQMbTkfIJHTzxjUYSfnpTgF0dwSKf
         YxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792132700; x=1792737500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zozTgap9/7XkjDcW6YDxcMncGVIIlLjENhuebqzWUwg=;
        b=OqK/5bdXAqRb/9Lm2Yn5FcTqz2zYiQkojPLtE8TJ1A8yESl2Bm4lkUFccCxtA3tTfe
         CWSJH2tUi+jgg5qtKtMgT6xMSqgPY3GcbD9jZXHLd2wwh+src4PWVLXSDcE3Z+KLgV8p
         xZfmlFDJyauuFdiETLfg4PBxUkoI2M20/mFj0QKetkPgKAFcU54i1tsiLKcABD+GXPKi
         aU6I/VOoPCJ7wFgbHGu5UoqcI7lZNAOLe3+Olcq5tTeQFTIkPxKLvpFbku8IRZNhLrf5
         rnPoNPWNQOyQ5pkIMvo4bVQMD0v7CiPPpJLlbl8CGmjh1mWZGw8mIkVwayet/Ie2uBLM
         lVTA==
X-Forwarded-Encrypted: i=1; AKwUvBxp/w9enLCq5UyxhkpGtwC/D2mtvt9VSReCAGocG3VllxkDcoY1AYckeC0ohAPbGluMXMrOQEdmpCZvvhjn@lists.linux.dev
X-Gm-Message-State: AFq9FYL1Yt2HJSAUon0F1u8dWT/jnEOBr+0Hcqp4NMIu4RPkxurv0wr6
	VlrjZLJBbLWwX/e7wZbZzB6kqAWtYXIpJ1dFE+Lp+yL4hM6Xj5e/w2Ig
X-Gm-Gg: AYBFou3f7jPB0nn9Y0HRsws8My2wETtTf+4grXrXefXuyV+i6l0pqyiWVAcCGIhy73k
	NZMu012VycTLdL6LeCQ+n3i84xz37CEJ/BRdAfpuvUW2WN9dIq1aI2bNJSrIRD3jQb6Q6TNURrT
	TD44EtHIc9E5P3GTWqDH25HrqkKah2Z4jTjhIs1FaMcMHrvkAo46aJOkDlgA101BWQl8pFrQLBW
	aZbgUIKdPa+l4U/Qi+o86zaOrHE3/6uE45x2ZW+kMXBqZMUzMlKZMaWiZ9qAf1IhWl3M1j/kcib
	QGaI0Y19zsjAIsuGO+d9nHCYZX+vf6dmLU8mpyYwQU7chdKNhTO3hORayws3jxPs7RegL68O5+T
	JWPxYXEmfQVvG9XJJSHz/6Kxho8EsdojJCwdWB9vEUZXXQ2EIryAjirQpKiiNlhQBKwFgxgihXY
	C3suaj7w/H3lAeLItIX27eibp6Amfn7NjMFXjnzSddoGQkn3IYO6uli5GzawmqSwOqxCL4dmBOD
	Q11jA==
X-Received: by 2002:a05:701b:2305:b0:14f:505d:813 with SMTP id a92af1059eb24-16a60811423mr29806233c88.41.1792132700064;
        Thu, 15 Oct 2026 23:38:20 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:78ea:36df:1d29:86cb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18319d3b880sm2650986c88.10.2026.10.15.23.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:38:19 -0700 (PDT)
From: pavankumaryalagada@gmail.com
To: pure.logic@nexus-software.ie
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	rmfrfs@gmail.com,
	vireshk@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
Subject: [PATCH] staging: greybus: Align function arguments
Date: Fri, 16 Oct 2026 12:06:48 +0530
Message-ID: <20261016063648.22795-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

Align the function arguments to follow the coding style and
improve readability, addressing the alignment warning reported by
checkpatch.pl

Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
---
 drivers/staging/greybus/loopback.c | 3 ++-
 drivers/staging/greybus/spilib.c   | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index 2a623fc2e99b..0f699afc10f2 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -653,7 +653,8 @@ static int gb_loopback_request_handler(struct gb_operation *operation)
 		}
 
 		if (!gb_operation_response_alloc(operation,
-				len + sizeof(*response), GFP_KERNEL)) {
+						 len + sizeof(*response),
+						 GFP_KERNEL)) {
 			dev_err(dev, "error allocating response\n");
 			return -ENOMEM;
 		}
diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
index e4d1ae8308aa..c1982f3fb931 100644
--- a/drivers/staging/greybus/spilib.c
+++ b/drivers/staging/greybus/spilib.c
@@ -160,7 +160,8 @@ static struct spi_transfer *get_next_xfer(struct spi_transfer *xfer,
 
 /* Routines to transfer data */
 static struct gb_operation *gb_spi_operation_create(struct gb_spilib *spi,
-		struct gb_connection *connection, struct spi_message *msg)
+						    struct gb_connection *connection,
+						    struct spi_message *msg)
 {
 	struct gb_spi_transfer_request *request;
 	struct spi_device *dev = msg->spi;
-- 
2.43.0


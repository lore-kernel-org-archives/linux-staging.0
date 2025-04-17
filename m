Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7170B1DF27C
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744850755; cv=none; b=j8FW8kXB/3oZR4QMD+eXABCCA4/2BTM7dMhyTN34eyEcRedxKc8N88rJ1mUC4NxtES1ABj2A1QSYjroBnM3++AazpqyCT/aL4vzl1IUflq+SgiVvoxGO+WGGzv2lQStChtdmUq9QZPgDfC1tHJDgIKHzLUh6Z+Nv1WknSQN0nM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744850755; c=relaxed/simple;
	bh=J/2BjloWZckVQhuvMB1uvXaQEomsSVRjTMmjSOb71fc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SYmqk8JumklJarTc2o+lLD9PBD0J/+scq9ONgITCo9OT9r+6dN4YOK+CwOLUGvD6/rtvoQB+kL+mm105zEgDiZvv8pwnEr2bNZmwSSust/WSStO2J49r+jmr+7SKN9NDZJU0cj9uD8/Gs6LoEOa9O0uVFbPDAZ9UhGgnae+TPvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=aQympBNh; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="aQympBNh"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-227a8cdd241so3111865ad.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744850753; x=1745455553; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oE4wYBK9Y5cNUsygtOoB0ARoJoNyVY3pBnlsFqh8m6U=;
        b=aQympBNhhbDBi+xP97uWAP3M7q02ZWtSWslcUNtIXtmbIlXSjn94jwd8EupMVtvdAM
         Rad1kYR1CEN5y6us4hjOLVS6dV8y54ckk8bgsOYvaK8zB81qY23etycQNQ1MfXXHnubN
         ZipgHBqpPgYJmvT/xDtxmpI9LaQBIcP/DTaI2G3537T8ar32ru6CkAnEacKIqIqiyQYK
         2OeRs2RvSPUvZ2npQNN4nWXH7dNvQDx9VNLXAxup38xnOcEE2ZhM5BZH70xcegtVtZzB
         aeJdct+vsytCX1xTzl2MBi39qbQoKDCmGNucHIO7xr0uzPLbtBPZCDI0wZNSsy9n9KgB
         mg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744850753; x=1745455553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oE4wYBK9Y5cNUsygtOoB0ARoJoNyVY3pBnlsFqh8m6U=;
        b=JCpnCYPpbSAXVbVT+t21UUGQteTSKKn4zI3MSWFg+Ewpuh0ILjuaKlTVuSVhYIfHoy
         1zxMbLkNdjJFScTInCQ4EKiXev3aFe9kkeRYRgsQabeSBTfbD4sCLTZ6fhtkAbxhZ5DZ
         H7l0bFfcggJfT6yRG29HQ46IjbwidAHPG6wzQq+Kjob5BshXN10pt1s8blb+NHArHkaJ
         qIu9JteNRT4+A2UspQa1JOOB3SzYo7jAxl847r2B+Gt5aSGnL0CozlGz97uySzxwWKVY
         b6nu6EE0jY2SHH3F3/S1u0cmkoqKG+QiJF1p/K4JElj/A2o6PSeMqXq20qgbcaYj5Vkz
         iWqg==
X-Gm-Message-State: AOJu0Yx6tZdAlGOihStd42pOPml5yIcI6PCGUWTcX22d0VH6R3gKJ2q5
	dX37KFrYFfvQTFSlFdPJ3a5w6uvlTqzsCHUeq81ieDbk1eqPw1wuWNuL33C86GpZ3OX8zHOU4f4
	=
X-Gm-Gg: ASbGnctds/nU0laH+UnQOcPRwcTYRgtP5jqtZRTNyZa1HDG6N6WAT98N34eC4nsWpKO
	LEoXxgjy72AOBgD/VHdV1Ys+GKCJekzzDuAbN90ElA//wyrfo6jXe/V/B/PVK0twiCpSAMRfsSZ
	xt8da8i8z+A7zZqFtzjXcVzGbPgPIOFD2NvDttEregVsQrmCA6fPa9g2UfyHbBJouFvsFoelZL/
	vMkwUjg7LecBqHyAjomoKHNKE3oXSLJFkSUeUxocouunLkNW4fXPN7X4La1SaeKSQ4UVjalW4E8
	RHtEqu7QKhaumVKjmNqg8RL0BDi5cIaXH80bvL9roXsbPTVTJEkMRtD6lMGJmy9N1If6bHS+VRw
	+2mKfkg==
X-Google-Smtp-Source: AGHT+IGmzmZrkDFcQ2LokFGzzovBf64YFT1R45GKZ3897zaZpcrc8bUJ8p+qhlmw+686pWWDCMQedQ==
X-Received: by 2002:a17:902:d50e:b0:224:c76:5e57 with SMTP id d9443c01a7336-22c359734cemr60143045ad.39.1744850752887;
        Wed, 16 Apr 2025 17:45:52 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fcc24csm20887985ad.183.2025.04.16.17.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:45:52 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 13/14] staging: gpib: lpvo_usb_gpib: u8 over uint8_t
Date: Thu, 17 Apr 2025 00:45:32 +0000
Message-ID: <20250417004533.86765-14-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417004533.86765-1-matchstick@neverthere.org>
References: <20250417004533.86765-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch.pl.

CHECK: Prefer kernel type 'u8' over 'uint8_t'
Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 494cfa21b938..19127ee906c2 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -706,7 +706,7 @@ static int usb_gpib_line_status(const struct gpib_board *board)
 
 /* parallel_poll */
 
-static int usb_gpib_parallel_poll(struct gpib_board *board, uint8_t *result)
+static int usb_gpib_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	/*
 	 * request parallel poll asserting ATN | EOI;
@@ -999,7 +999,7 @@ static int usb_gpib_write(struct gpib_board *board,
 /* parallel_poll configure */
 
 static void usb_gpib_parallel_poll_configure(struct gpib_board *board,
-					     uint8_t configuration)
+					     u8 configuration)
 {
 }
 
@@ -1033,13 +1033,13 @@ static int usb_gpib_secondary_address(struct gpib_board *board,
 
 /* serial_poll_response */
 
-static void usb_gpib_serial_poll_response(struct gpib_board *board, uint8_t status)
+static void usb_gpib_serial_poll_response(struct gpib_board *board, u8 status)
 {
 }
 
 /* serial_poll_status */
 
-static uint8_t usb_gpib_serial_poll_status(struct gpib_board *board)
+static u8 usb_gpib_serial_poll_status(struct gpib_board *board)
 {
 	return 0;
 }
-- 
2.43.0


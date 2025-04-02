Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF8E23A987
	for <linux-staging@lists.linux.dev>; Wed,  2 Apr 2025 12:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598607; cv=none; b=bVpLOur5mwjPJmMcoBcTf+VisQG0Ar/fjvZr2vcGgQs8Avhjc7jy06t8L7NhgWeV/NH++pozll7gWkMEt/1Ws6VPTiTBt2BGsGKF5uPoCCc6PPCZogoi2zSkKQwFueTFKkN3C85aPMCWtH6/a+KmHQrCrP0V/2UPI4NTufyJmOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598607; c=relaxed/simple;
	bh=a0kH7DhOpRrkWCdxZS+dFa+RPfQsm3F5YoqiAgUDg2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SCUE+DoaKFMlg2hpxON2E1PmVA43oG1W/cMMpzYG6t/FQrayGkrzOEA+KcH/y2upGNK/cEG1roEQnUpJarNwjHCDzq4mYT0cjiY361Oqx760drGrfKj7bp0rFc6KYpdsBNu5SIHFYmBIA3pVqCgLOuFLkI6xP45NgtVQZcrpwtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j02D9KH1; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j02D9KH1"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e8f6970326so60979106d6.0
        for <linux-staging@lists.linux.dev>; Wed, 02 Apr 2025 05:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743598605; x=1744203405; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FH5IyGCYpRiXKqw/L0TqblGu3eqXanO2lHgzz7a5Kp8=;
        b=j02D9KH16qLGsaZ+CKdpkptjH5xw7XLPO96lb9aiHr6cJyeP4hwBzBIzAtYLeeXLaU
         ajI6qhCz1tlJzILwTCwaJzOT4+rMxOSdM/HQDECAMoCpLbfGUhSf/S18g/BEpNu9ggiq
         83U3r50MKhzvn6dFhHeVVrIldcAQ0M9TBKKBm17msr5VV2seQ6YvJgsK1hNeThagwS5R
         G1jGPHzFNnqdIHKaMR9VpY9IUM34rX6VmWz7Y7FgvnEp5LRuoxPiliWqOq/9y3SKH4lC
         1nKuZwGDP5Qa2JuWJxlzUAWNA6NaY/AhOCTCzpSeNPxnPcuvtafg3/fOEYAvy+PyxCWs
         48pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743598605; x=1744203405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FH5IyGCYpRiXKqw/L0TqblGu3eqXanO2lHgzz7a5Kp8=;
        b=ryn8rZmtjhxPekQzPmPi7hcP66Gxy4aIDW5crPpo1rAySRjWaK1hsv+igFAo358GM4
         7R6K5S5B2tOjSdm2l2vLQxzuqkFuR7QrurDfG4ozFXu55PTMIl9TrVyoAesmNBjjM/11
         zVqIxNtRbU/9FljcOyPdl21fggNerQH9D25ZmkHSew8cd5o4qjeRmi6AlT66/iGNSFqv
         b2v3M1v4gYad51aB7r2H/2wvgpeE7SVvvkjIvgR86Dr8gkCN5tXrbg4yNQX50/EIthxM
         BdrliECr2V/VmxCL/O0+k+j9CIp/ZTju1RDx2NDSjT1J6NBlM++S6u6UrgP8KJG7+/1d
         Rp9w==
X-Gm-Message-State: AOJu0YwP7Y7mYqYXtQ+JG7DYKLdMG5EiKkx+hyrKQp/57fRETT8pzaeE
	zEy2chf9WRfUiuBMENrmz++5CrE+pX4NN5uPVw51AMERXjWZz+Gw
X-Gm-Gg: ASbGncsygXaeh/4WUbUJqKhNundxCU/lMgkKtxE1uPM9QWe+qCNhS5PkDjmr8/Ni82v
	6l7shE32DPRrQuKy1SnuAuSY7aT6YpyvUExI6Ml8skDuVhjiL4FD1Sg4XfPgfcn3iMdtrmgY8EG
	LGvW09Gd8rK7s0WYcf9aR9uTDee3X4B1hTsjUGP18YxzFECJZbRmeJEWuddwFcxaR2kFE3EfBst
	ToZO1/pqx//HDImR6sHdBZtd3yRODUyewCe/5qSOauyW0BhAe7T6/tovgJqwpoWOiRYsD0ckUAB
	Fdgt59H+1Y/q4g5alvbVYUH3Ow4b3VY2MzgCaacvzA+rhUlcTY1y9RpdcFym5mWMeKpW0md26gM
	WnyA/EnVFF9xZwDlMcd9YnRk=
X-Google-Smtp-Source: AGHT+IFVeFnXd2rDwBfA4/WVsl/sTa59VE0NI1E/4WSKrgf4jCEN6qyYALQBbH3XqEON7AXSHA9Njg==
X-Received: by 2002:a05:6214:450f:b0:6e8:f464:c9a0 with SMTP id 6a1803df08f44-6ef02be9d06mr39391346d6.13.1743598605068;
        Wed, 02 Apr 2025 05:56:45 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec979734dsm73440786d6.114.2025.04.02.05.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:56:44 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-staging@lists.linux.dev,
	slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	skhan@linuxfoundation.org,
	kernelmentees@lists.linuxfoundation.org,
	Gabriel Shahrouzi <gshahrouzi@gmail.com>
Subject: [PATCH v2] staging: media: Remove unnecessary braces for single statement block
Date: Wed,  2 Apr 2025 08:53:48 -0400
Message-ID: <20250402125348.7364-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary braces in single statement block to comply with kernel
coding style.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
Changes since v2:
	* Add missing author
	* Fix title of email
Changes since v3:
	* Resend using git send-email to fix formatting issues in email body.
---
 drivers/staging/media/imx/imx-media-of.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git drivers/staging/media/imx/imx-media-of.c drivers/staging/media/imx/imx-media-of.c
index bb28daa4d713..7413551052ae 100644
--- drivers/staging/media/imx/imx-media-of.c
+++ drivers/staging/media/imx/imx-media-of.c
@@ -57,9 +57,8 @@ int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
 		of_node_put(csi_np);
 		if (ret) {
 			/* unavailable or already added is not an error */
-			if (ret == -ENODEV || ret == -EEXIST) {
+			if (ret == -ENODEV || ret == -EEXIST)
 				continue;
-			}
 
 			/* other error, can't continue */
 			return ret;
-- 
2.43.0


Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8BD288522
	for <linux-staging@lists.linux.dev>; Sun, 15 Feb 2026 12:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771158582; cv=none; b=fK+IKiAKAwjM5r9MW5nR3OWmDm0mpok1sh4M1wJYFDFT8R9KvQlMOJQmhEpDv6OFowxlsPNW806vjQN7qQMbZxkezMe9w8Q8cc8PKNgHE17feasXo7owhPrXo4dHe+MmHHdnU9Rqfnn/34CT/eQftPqQW+mB5B61B9kJhDKhCYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771158582; c=relaxed/simple;
	bh=H9Eag/J8nZ4Fk38+jWaDcZUlZju5JzX5GpaFoz3CMM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e5vrZnmkiE4YF6Zwh/VoheEXmn/x4jWoj8xT5fHqrS1+qUcBfqN4GgtLzh4bBhcSaQaVdfpiG7IgmjvtoWRbGAGRDBnjoFdd1dYseTLHpbopr3EquBG+yld9Bs0B3yHqfWedu1pmn3mcqhFnS5vcEMlm67gDDbcZxqSf+Kwa+Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NiZoWFSD; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NiZoWFSD"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a79998d35aso14984575ad.0
        for <linux-staging@lists.linux.dev>; Sun, 15 Feb 2026 04:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771158580; x=1771763380; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GBpQTjMbL7rVa4GkhcvMwmD9kfre3V9nPWW/pKMHQS8=;
        b=NiZoWFSDcz8AoTk5pqGoJjT0TypW8N5wJ1iGb+1sqXttcCMRi7QcS4cty1Zftj+7te
         Muz6vGJWcgwRx3cUlaSnWMozT8qs9mv/8bwMcU2lEEocNB/MXBxODOQVDbAywSEiVXm7
         7vxA9kS3UoAh1Gwx8w6/4GtalM5cgaq+aZP7gljeILtTjTHUuumb9MniGFGVBO9UdR9r
         QZHold6KrEkqY0vak8BGCviGgDODF0+3kSrOqtkSXS1ApRv5aDY+bh6m0I6xpFK6S4hH
         LJvmREZe6Ppu4dtmFJQZvlsdfI7+XGSx7wqe2VkSMVa/eD4O20otIHb4SVrn1OBm02fu
         u0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771158580; x=1771763380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBpQTjMbL7rVa4GkhcvMwmD9kfre3V9nPWW/pKMHQS8=;
        b=cCbNpME0474pVO35zpSrzoXNm6ClKXxYF5nBsDXJCAGBXB+MHbnX4Vxh1VVNV/SxN7
         tbBLdegNtA1QRt/N5SWPLG+Z+2Twu1Ruj1seV/vtRYhdBQUoZyy5CoxgK3yu2XreMbwr
         /DtY3DhDy8S60uJqBWE4WpHj51k1XMQ0/LdoLsVGsmsUuANUDuKpA+Bb2IOjY9gYzpZ1
         GRzgRmjaSBhbXENmYQcMoRwqX29LmOQsw6yCeVqE26EmFi6lgMCxVmfBOqtto4lqPVzk
         ccjus7rnFJ3X79fN8tbb8t/+1mO976NZSwADi1rAsb32K3zdtqX82SHkZSOT9AUyqrMa
         JW7g==
X-Forwarded-Encrypted: i=1; AJvYcCVK5+2lWUgZlw9KAMS6RrlFlCPTzZhyr9RDs/YAtxobvQi2ZMqfuwW6U2TR1ONonaASIJst1op2L/5cr/qb@lists.linux.dev
X-Gm-Message-State: AOJu0YyTJMfe0IYBQFHuOt+N/ubU3gf6eB+Ra/PSxZveWuJ8do59SeYM
	hI3KLJ/J8XIAlp3OS5wXpeurtZeS54cdYlUFg7cwP2XODMRSxTnhls1L
X-Gm-Gg: AZuq6aLNHBcIeIc0Mda57TS0ePTm1tlaOraKpXQwZNzYCZV3xlOktG3EYGWb9HSMzCc
	F/8ksSTZUnxLzHf2ku4o9o2+ZRT6AnC/jhF6QulVx3pt1Arc57diUud9u0KqNtNza6TET3Ow8d4
	QV1nJZkhGzJRJh8TXvLcP/knCRLxFrLAiWDaYomvIpEzgMw+L9rGy2FdrSOOevEIicB4EmDENIw
	/8BqkKkaaXndzswot7wCx7oxzCj+BJqLpyy4AY4OOCTsN6gRfl0k8aT2QarhdSXmBUzyZhoFXZ+
	pEi+cPzodZvm1q0J+LtodwC2n4GbqFVVQ24vPvnzZ/NwiFdICjHR7HYdtja7HOD9Z7eZtO43z1q
	/obHLxs9YY+bX5YNlS+bztuLgH/widOAWC+JFqLAzuRdI2JN8bosftcR0CD8cApyz68EoA1eaUn
	XolAz4wMGdce8ZB5+AUtEPSISbT7JoPl6XGqOtr4ps+kkgaXglxA==
X-Received: by 2002:a17:902:ccc2:b0:2a7:682b:50af with SMTP id d9443c01a7336-2ab505ca8c6mr89910665ad.40.1771158579679;
        Sun, 15 Feb 2026 04:29:39 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:8817:dac0:96bb:43ff:fec0:e782])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3567e9da8a2sm12868736a91.5.2026.02.15.04.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 04:29:38 -0800 (PST)
From: Samyak <samyak.bambole07@gmail.com>
To: marvin24@gmx.de
Cc: gregkh@linuxfoundation.org,
	ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Samyak Bambole <samyak.bambole07@gmail.com>
Subject: [PATCH] staging: nvec: Use kzalloc_obj instead of kzalloc
Date: Sun, 15 Feb 2026 17:59:13 +0530
Message-ID: <20260215122913.104064-1-samyak.bambole07@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Samyak Bambole <samyak.bambole07@gmail.com>

Replace kzalloc(sizeof(*ptr), GFP_KERNEL) with kzalloc_obj(*ptr,
GFP_KERNEL)

This addresses the following scripts/checkpatch.ph warning:
  WARNING: Prefer kzalloc_obj over kzalloc with sizeof

Signed-off-by: Samyak Bambole <samyak.bambole07@gmail.com>
---
 drivers/staging/nvec/nvec_ps2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec_ps2.c b/drivers/staging/nvec/nvec_ps2.c
index 2db57795ea2f..3422a5213803 100644
--- a/drivers/staging/nvec/nvec_ps2.c
+++ b/drivers/staging/nvec/nvec_ps2.c
@@ -102,7 +102,7 @@ static int nvec_mouse_probe(struct platform_device *pdev)
 	struct nvec_chip *nvec = dev_get_drvdata(pdev->dev.parent);
 	struct serio *ser_dev;
 
-	ser_dev = kzalloc(sizeof(*ser_dev), GFP_KERNEL);
+	ser_dev = kzalloc_obj(*ser_dev, GFP_KERNEL);
 	if (!ser_dev)
 		return -ENOMEM;
 
-- 
2.53.0


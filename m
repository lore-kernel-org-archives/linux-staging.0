Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA2430DEBE
	for <linux-staging@lists.linux.dev>; Tue, 25 Nov 2025 20:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764102238; cv=none; b=gTU1RhggDPAEfZ7ZkpVEOu3mN/UyR+46xxQyO/xCAjsOV2CzYcUIZ8M2TaX7Oo6PdmO3zRP8+jQYFttTlPPpQu6FoBd7dQffjxidABwxEMCRjaYrcR7zC7x08geHCAjRHvgDC8BbQLA1soohRvmSO/D+VTNJmcNL3a96blDmVcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764102238; c=relaxed/simple;
	bh=WFDRo48TY+OGkYnJf8r9lMrykJuNpm83q+h1I+y4LH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K2HHg9MSDlbx3OepN4cwYher03uMlLSBZeRpI/RCjWadLs6hqatbBZpZd3sP8az3IbTwVKbCexjxFimyNl1j13qM4gGXf9u5wVvP9fBwPR5PApq43Com7Qi/+l2ZhPMKGBu16uXBxT2oVpcw7cOTqGxu4DItOW9wSgmTy4dLyC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QkLxJRx4; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QkLxJRx4"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-297f6ccc890so5774655ad.2
        for <linux-staging@lists.linux.dev>; Tue, 25 Nov 2025 12:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764102235; x=1764707035; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v8yo3hO4mjCY+g/iV1oBOKZVnosI+hY7dYxVrjtrKls=;
        b=QkLxJRx48UsPC0sOgBTq+pJRK7pYfvzFDHoSNz0FnXMstn9JLD6C/g+e4592vo7Y3J
         6EKyp/lAgsFfHE7Ftl7R5d5HxLmV095+l5ShAjELUG0i8nSxh+KufcBY0ym1HEr/yTDZ
         +t11VkRENwJqYrcZzn1FKwBFYuKZhcaklodGjFunyyl/VlEGSFTdqpDlkp1h62fG6dDV
         arXSEaOYuaJ2BpLld9LcmIAltjsztENHoqsHIPjCnl5pBSo1qHIevW2HA+f1lN/3OtlL
         cxHjxyVG5Jw2dYSNSG5WQhOFX2gsHVOPIbVG2Sln1iBQKrtDghvU627m8IuxP4vNkxWJ
         +aKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764102235; x=1764707035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8yo3hO4mjCY+g/iV1oBOKZVnosI+hY7dYxVrjtrKls=;
        b=Co+ZWRB3f2P9VlLZ7YCNV3ThLlAfmBITh6pGlxip7WI+SQxj6rUbPCJdc64LJcDNoT
         U6Lsi/oTo/mztYy4iAfH4KxMk1HoZjyac5lSd4MAVT7YWBzQP03Ye44Gcdppvw2fOqza
         GxhgztJ93QNnoH5/BStIE3x3pOvvFYBPa13gV4FC0/h9OxHC7HwK5/kk8ZU1mn+waVIB
         gIXCBeZW6W2P/tj+VKBFiY9Sn7hpOY2iO5VGdycsFJkULEx769fxI25eK84/Au7n0+Pl
         r4nABhstVGHPLI2QZPSFfHZ7X3MlP/Sx9SlscLTCzLIz8ZNTSpDFTRHBB7VEOqz337jn
         0IBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoCncSJNQUXCYqUVzU65UlBjK2wFfaXivj001uwfiRwe7isktdBzJkFjuBTrm4JnLxFpxMzyAFLFriS1+0@lists.linux.dev
X-Gm-Message-State: AOJu0Yw33CFTx49lRcyBnCHFBIVTo1Z81TsXp9xbmkpIdkM+PgqDJO7X
	kaClCtej7zW+pcMNgpLecPaAqgQXtWUSrJ7p7qAolxf3uQtNX3vKEp7J
X-Gm-Gg: ASbGncvr3sBkCfsgwsjF8Eb++z2FF05IoMHh7+r0PK0Kz9wSHwCTS5666S/rr7TiPq9
	nteXW+Uz2rgt6DuAgzUSkm+pSZgOcCDNJ9webQ+NqCynIOl/eFqcNfxmrU4YlBQ0LCrPSpANMYo
	jvxor/RejzcLQ+kK9Og/+L3NBd7uoQYzoj+q+dizGkZMM6U5KMlr8Kqb1z/wn+Jshwl3hm6kRFb
	rQccHZ+QkTokXc5JRwPO3uTjhHGjvDZHr7nv8tnDkVrPebw8EFXwfA0fjAnlRFahxZIFXOHRg6O
	l42Ck+wcSfNHTWMCnjpkiKhcO0VUNRg9DPFBuPwq8JUz/8pgfjppF9Zx5pn9HqwdJsO0Ym71EmE
	hXwGujhR2QYJQoi01u9li92vMigG9qQ5f9mAl6t5eFazLv3n6u/5ne6TfQN67asf3UPudCSg+WP
	8qg/eht1yqz1Us7YE=
X-Google-Smtp-Source: AGHT+IG3RTcRxFUsAo8usCNv69f81QaKk/JOFHEXI37wwk5ElPTb6WtM/qi0Gq+AIsPZSO6XeDWvSQ==
X-Received: by 2002:a17:903:1103:b0:299:bc94:7ded with SMTP id d9443c01a7336-29b6ff75aefmr104832265ad.2.1764102234966;
        Tue, 25 Nov 2025 12:23:54 -0800 (PST)
Received: from Kai.localdomain ([106.222.232.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b25e638sm176386135ad.58.2025.11.25.12.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 12:23:54 -0800 (PST)
From: Ayush Kumar <ayushkr0s@gmail.com>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-newbies@vger.kernel.org,
	Ayush Kumar <ayushkr0s@gmail.com>
Subject: [PATCH] staging: media: Remove unnecessary braces from if statement
Date: Tue, 25 Nov 2025 20:23:31 +0000
Message-ID: <20251125202331.36505-1-ayushkr0s@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhering to Linux kernel coding style guidelines (Chapter 3: Indentation).

Signed-off-by: Ayush Kumar <ayushkr0s@gmail.com>
---
 drivers/staging/media/imx/imx-media-of.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
index bb28daa4d713..7413551052ae 100644
--- a/drivers/staging/media/imx/imx-media-of.c
+++ b/drivers/staging/media/imx/imx-media-of.c
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


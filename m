Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8FD2144A0
	for <linux-staging@lists.linux.dev>; Fri, 10 Jan 2025 23:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736552339; cv=none; b=ODR0SAq00gCTGuLVAZ/IxDA6Wew8V3JXp8eYLV3HwrmnNEsHyeeFzrjGFbWjajQbXg2bYT5Yk/ExBlX4t01Td2FZ+/TfvsgcPEbTu8v7cDt9lgPch9m47AhiLiWjMR6lN/qeSk8BlptzvVbvGxgZBm6fvn81fAppD+loIy5+gus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736552339; c=relaxed/simple;
	bh=7pzrCJjyLaNLhHEDR9GiIC+2NGf0F/BBPJYtfIClDkY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KgkRj2ygA2tDSAWGNr+V+FV91Gg4Wasrxzk13WIJhcdglXSaYwX5aVveZRpaa1Qw0pIMYOq7q9yq2wyOBKi4xwesZOA6HXhsS0AdIOHa/K1pcA+ttJvcn0jkDUB1MYfa8RJKDDWbSLvOH2mMhhcfzbJRQsa3NoF9XXwXUMl9VAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJHnsi8U; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJHnsi8U"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-467918c360aso27028271cf.0
        for <linux-staging@lists.linux.dev>; Fri, 10 Jan 2025 15:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736552335; x=1737157135; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tLYrVFJ3kNmsWFtDUuFMOj716xCeVZBknkTWxEm7N6k=;
        b=PJHnsi8UBTjCKm2DDn+SYgqJweOYDoT3hAno/6Yb2iExv9o0L1wUy7DBlJkfseohHl
         BSGfrkeib1iQYDiNSNqQUbI8ZsfZ4VU2rZwZ9RJGO+1x0AR2NuKS9+1WdmDYlDZhzqmr
         0PDDUg3LKVsjqRcdbmzGA5Y8rbsotUID6dgLW61TuXZC9zrx/s6/UBgZCtC1oavu9szM
         x21JFF12+wBna1hGXma6Ked1mSz0TsDzwYdGZAqvVXIqyidncQYz+rK218SMq9bDw+gG
         o3pjilbX+gLMyXBjQOKEywEFA6s2SoHS9R6YOlzU9M27MrhGPePdYqp4Vfy4DsShA1En
         7fTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736552335; x=1737157135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tLYrVFJ3kNmsWFtDUuFMOj716xCeVZBknkTWxEm7N6k=;
        b=VJsVOJNNdAX0pW2EuNVVfItqYFOwLVglpJP6q/OvDU18DCs1V5/J65PUkor1IPUR8z
         h+jEawbGHbh0EfEUP/fdE9Gymg4jfktG3sL9FNm8ZeicCEaRIpTUQaZxxJZ83vxxzyJi
         CyGsTbiizNRINGtWpZvv5wB1XsBKalkct0E6SsuINT4IAwgMqpYRWH7W5kd677JtnbBU
         BYkHeN+5Xrf3DeHUiy/KmmGQFGy4QVReNnJ4vwryVQJXOT9tL8FpRERfpg2+nRv932MF
         cTha8k0kNTGct6vyLM4u6Uovw7D/pWe1SG4VFKDAJej372kRImj55+zW3Siex9JZFA+N
         mTIw==
X-Gm-Message-State: AOJu0Yx/s7Lhm2f6MTdUuGhCQlvo39Kk5go/CnuzoMKvHyIiu2NzFiD8
	CTo9lOmQvNBhUYSq6CgPt7SwM8Lj1FNc4vEG0/DQnUPU5nasgEVz
X-Gm-Gg: ASbGncteND4biOdMJeQoL2RDeFFuW6IS75G/9URj4rZtSOd/JFKehtrgKrYQkoLHUvB
	NqAc3s3bMtedLTfNR3lGBtEONyiXHkCibVNycJJZ53+703TML5genrfKkbkTFWTEf8OVIf98Msx
	+IpYVZ75tUA3QzBHti7W17KzMHX/Rq3MzbUWf+4KCkLya3q0huFiKJUC4n/DPrFKwXUIDszSH0v
	heIWpNwLMwCiA1ANxbeQeVeR7CEG6yk/SoUUXSVTxXpf2Qe1SF9mhNVq20d
X-Google-Smtp-Source: AGHT+IEV7HJDf18p8kyOtrCCN/AiYXleaiYJ2qmfkbO0868anU6qGJ0hw2Ya0pT1XjaFguhzLgjVPw==
X-Received: by 2002:ac8:5e10:0:b0:463:1577:2412 with SMTP id d75a77b69052e-46c710038fbmr141037081cf.20.1736552335378;
        Fri, 10 Jan 2025 15:38:55 -0800 (PST)
Received: from localhost ([104.28.203.246])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46c8732f9e8sm14573941cf.19.2025.01.10.15.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 15:38:54 -0800 (PST)
From: Sandeep Salwan <salwansandeep5@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sandeep Salwan <salwansandeep5@gmail.com>
Subject: [PATCH v5] staging: gpib: Remove commented-out debug code
Date: Fri, 10 Jan 2025 18:38:34 -0500
Message-ID: <20250110233834.64147-1-salwansandeep5@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Code cleanup. This code has some debug code which is commented out.
Delete it.

Signed-off-by: Sandeep Salwan <salwansandeep5@gmail.com>
---
v5: fix version location
v4: fix title description
v3: remove leftover braces, re-write commit message
v2: removed commented-out code only
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 53006d0cc79c..fd05f15a683e 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -30,11 +30,8 @@ int agilent_82350b_accel_read(gpib_board_t *board, uint8_t *buffer, size_t lengt
 	unsigned short event_status;
 	int i, num_fifo_bytes;
 	//hardware doesn't support checking for end-of-string character when using fifo
-	if (tms_priv->eos_flags & REOS) {
-		//pr_info("ag-rd: using tms9914 read for REOS %x EOS %x\n",tms_priv->eos_flags,
-		// tms_priv->eos);
+	if (tms_priv->eos_flags & REOS)
 		return tms9914_read(board, tms_priv, buffer, length, end, bytes_read);
-	}
 
 	clear_bit(DEV_CLEAR_BN, &tms_priv->state);
 
-- 
2.47.1


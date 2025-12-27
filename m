Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0098D24A06A
	for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 10:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766832989; cv=none; b=qbcZZxx8lT8pk8XjP63NM/xJkFZs+DaAYbXnBnhDAtmrXjRmHn6xBGraKf22EhdP1TZOBS8d5ctWpvhw5iBnNLpLGO9TxcezVkyB8rZKMPV8pofsLWZhN4KBOjzdJv/0gGmBMEAYnN4xqfE3J/dg1xXy9zVvFoeg2GOEJk7AWlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766832989; c=relaxed/simple;
	bh=rwK8Yb8lMppqkdA0k3CGzENNnh2QljvEb2uEw3c5S/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C62JTXNi3V5YG05njZRJZD1H1xRDs0aLk6FHnjyKvDtksF3Je7QVdDIduux6CIbFbyvuWLIn7bc3ZwFBusbQTJgfGYAeVW0lWWN9s/79/zAIHMj7OVieVY7FAqGilzUBv9WkJP9S3NO+hrKN12wUQd+AMtF81/WB+t+rnnpMhVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edxWr4ST; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edxWr4ST"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a110548cdeso109054075ad.0
        for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 02:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766832987; x=1767437787; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LVirW5At3YCuRHq9p7Wco6R/vGAcg0AwQjMQ8Fn6NiU=;
        b=edxWr4STa1PLQHR4TeLGiNOMNFAKdv1YYt/5V1P10ULT2fC34K+ohZ+rJp6sIvJ/ej
         M6UqeHhVtoBROoTf67jiVJk7kQSISi7b0OJsbmsFPgK0ct1hcdgZs0ENhky6Gn0Xo5zm
         iuIN+S7o76yLPkohFVi4fvoOQT9FgO99fTG4OKOAOmBD/JK6KvG3lnZD+/VfGfYQXWW2
         Z+yUFDOB8WQj6rz9xmTBzeQvR7zbQgwJOGSzALWZoJTFBYXOKA/dF+as16CqAkH3ZQor
         CVAHHXkxnynDCgfS2FbcCry2Ephi90HUKoBX4vcpOcPK1FmuLYZ+R2U4oxEAOdblZQ9F
         ft5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766832987; x=1767437787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVirW5At3YCuRHq9p7Wco6R/vGAcg0AwQjMQ8Fn6NiU=;
        b=Ltu4Bd8XLJsKPtkEfUgoj46bXzxDLY4kqR5q3/G12ri9ANEDd5kSpAq1U0pOYY7GOT
         YRTtl5CMW3mowqLH3mLU9hVa4QACtrB+FHaOjF1f3Ll0W+hXNHyFzyce3KC0z0AcxPUP
         jtf87rDrD8bWnzyBvQkz1JdK4II8ipWsOURtrFPEK2AdvuZfg3Hkmkqut9T9tPBoVPo7
         aNMdL0fP306J43gTv/n2wL+Z8I6bzbjdptEajeYIJb2nZO6+N/iCX+k8mLlr69iIgdg0
         sW1xw3Tt4IBk8xqN2WWdYKXZqgggH5th538DB6e2lQn/jufIc38FPWoUcluihEdq4zuh
         DQbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvuSHUVvh417A1ido0xYtAnvjOknu5ij0Yo6tC4aifZUHHAh8gRklneJBxbsYhUo82qIC3i7zV8PWNrOPy@lists.linux.dev
X-Gm-Message-State: AOJu0Yzjf0F+2TJkzSAUfFmjOvZYD4x/FvHAUCp8cv1mpbz5rTHsJzsF
	15f5S7mHnPYfVU0hU+LoA0lKN4SZJoSZgGk3LJ/tRwthrNhptgjm5fGK
X-Gm-Gg: AY/fxX4X2zRVfrAPjevB7xl09foRt2dKGDlFijCuR2b0cw8xrN+PgtOTzIGnt641wY0
	7/r+nClvxm9fj/vUkEkIYhpn32paPT9JHomd5+mSXxQoV/sw+ciBPLrKLMWLORfFHlo30p6LZrs
	gWpuiNO0NBzmjtk/04UiOvJSnNk8BQYFz4i8WZHdYnshQnG9465LIbJtpjygGjkjIPTMlBE/Mm5
	+Er99kdf1/A/NTQXpS7/Eq+1VNYrqCBjy1QSXO0mwZokFcj+xrXFAh95yImZ/xS+A+wcI/f40Aa
	hhyEiImu7hIN2d3AoO5VFkr3GqasXAs+FEDcro0rUuLnpYcxAQU8s/4WbiKFEdulapbuxWJKKkE
	bzgBfmkkQVHQBrYnvHLzm7XuIy6Q6ZuZ18ISq0ERJpB3h5QJ5TmAqnrdGuLebCvX3okjl5OPw+8
	O4txhAQnkavATN1I3P+GQ6aQ==
X-Google-Smtp-Source: AGHT+IGRAYT/ctmH6zSNM1LdV5E+cpyyJcWG5cuzwamCZbhyzUijnn7x7Xah8sTXzyJBA6LMg8AO3g==
X-Received: by 2002:a17:903:2448:b0:2a0:e80e:b118 with SMTP id d9443c01a7336-2a2f2212781mr276888145ad.7.1766832987225;
        Sat, 27 Dec 2025 02:56:27 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8286esm227372435ad.33.2025.12.27.02.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 02:56:26 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH] staging: media: atomisp: fix block comment coding style
Date: Sat, 27 Dec 2025 16:26:13 +0530
Message-ID: <20251227105613.23283-1-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the checkpatch.pl warning:
WARNING: Block comments use a trailing */ on a separate line

This change aligns the block comment at line 1384 with the standard
Linux kernel coding style for better readability.

Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 3a4eb4f6d..327836372 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1380,8 +1380,10 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 	if (atomisp_css_get_grid_info(asd, pipe_id))
 		return;
 
-	/* We must free all buffers because they no longer match
-	   the grid size. */
+	/*
+	 * We must free all buffers because they no longer match
+	 * the grid size.
+	 */
 	atomisp_css_free_stat_buffers(asd);
 
 	err = atomisp_alloc_css_stat_bufs(asd, ATOMISP_INPUT_STREAM_GENERAL);
-- 
2.43.0


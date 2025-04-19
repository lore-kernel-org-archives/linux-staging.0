Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB083A1CD;
	Sat, 19 Apr 2025 01:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745026262; cv=none; b=Sy5zs+7HIc1hqMcwvGm4WOD0H8wEc7XrfTYfk225O60fyUDsgG3sGkym5oIgeJlTKsMrm/S/QLpbYmHYQZNqxQQDFNDBDq6XViTPJthXr+dLjTCNNHsOoAonSvPVzuxSLM/xFHGsFpKeLoodypiTSphslt9Q9f06fGLpqaljvvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745026262; c=relaxed/simple;
	bh=h1I7azrs9dgpknSH+P+IhNbPLmtlQBazARRV3ngykeI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JaQhHuVQUi7dOpg7GFFhCQsjMOxdKPUa5kt9GyYeNS1dIy8vvdkwBlRrIP7iUBAr5gloRBKi0ZdZpZ4lq9Tf6qLXHQIupOGZb2xlMqqMi8FML/8fgSBRvWPYR1pipR7GCSVBCrwLzTbYEBKrktPuhvNg36GV/DVzS5Jb188H5pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hx0iRKv7; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hx0iRKv7"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c08fc20194so477826685a.2;
        Fri, 18 Apr 2025 18:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745026260; x=1745631060; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yWCtJ50FKxjfzSVOv6So7GDOtXW1AyTUmdzzwtUL1F4=;
        b=hx0iRKv7hEEU3g6YTahnDP3/5dXvEtVLYqN9dDxXaoVCBMHReamfYYGSc69YHbgMjB
         NfAr0IVbeOdzbUOm/Znga0MlqIoQavaZUM+9+qvXCh+Vx5BrvVW6c87nOExF/Y6lKK4K
         kVPRqru5q6qEH65gzkHRmZcAdUuvsjo5+Zg7SXfY46k+zy/QV0H8qZh9e44N7Ypc/K63
         AI/mkDNr622BpnHzxDkzQOoR7K/bbLKDPEv04aBTENR8ieEnsZ4xIzR8EeIIhnPqc56q
         PDAsGIfa6MpTwwEIzHRCdzrVr0f6UfA9bXQYusvjC/6GXCq068xSwzkZJNZYbgFtwOBR
         U2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745026260; x=1745631060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yWCtJ50FKxjfzSVOv6So7GDOtXW1AyTUmdzzwtUL1F4=;
        b=KIEk5vdrABAttso2Hn7I1hMMGZBSerMNy8qpLOWOpkwWDnDBa78xIVgWCSCFz8mNze
         PpiNf7kmMg8vH8DVCtGUaY5szrcBHy8TS2uJHPuoUtxrMfWf9MpQEcphAcug4BmbrXHP
         IytVQwRSEHLo+uSa1maopavYxvMOmwKRrejKAl3ioSOrTTP/9VQEv31Dce6FCvEfcxvw
         v7TwM/nfiVlPu0AxispaTVdp9ctQAH2m+zAuPOccmE5pUvoBOJA2rPM5MxiVp9svhAR0
         B+EvnjXrqrNO6PO8dcK8n5jJk0X7eh5u+LxQvSSmZdFQAYB2n7OjZahDH6ohhKJuffSa
         8LKg==
X-Forwarded-Encrypted: i=1; AJvYcCUyU7qqaOK2QhlXuoldPGg5RQoDOwXyc96ZXfWYN5tA8g7Fib8dQDXGTA3Ot+ZKuu1GdR+7Aec8FiZtSv+t0Q==@lists.linux.dev, AJvYcCWeEQdIv4mvKOK75oTt94yg1AWfPxRPF1kek1KCYE+IETLOKgVqbzhhDh5ElsSXsMZGM5cnuKT400XG5aDcj1k2sZnjXQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyLObQoq8foZABN5yYDoQdTtzs/y18gxMFTNP5g1L6ObwK1jpAb
	ZPxsznttcuzrqzJm5f17NrHpfdD+31qWfEwT0B0YVqDD/U+N2+cV
X-Gm-Gg: ASbGncvdwf40WzmUdddT5npGCHIOems0KdnMV/ActnOWoed0m4djNc9GkLLvP5k+GSp
	P/B0fVMA5Vhdfi75gk1FKkpW8UdeW3UMI2i9/jnwGJJPBxE+rP8Rjc8/Qw+icFF0dyAl+HnGnPd
	JY248/FaYUes1sc1AL2afm+b/RwT4nPD8IVu2UT0WmE3Bm1PBDhiP3YCsxSPJdVnJehbWcLkN4t
	pnzN9EBrViKS+WbKY721znh6u/efV0tBtwXT88cxbIV9BDmGFqTTopvlGMsiwzfIJb8q3r8oddr
	iYsm83hIPXSS/uwYoynHG4T7Gk6D/YHmbeCWFf6p9i0tXaUMtu27Chc=
X-Google-Smtp-Source: AGHT+IH2dNoQ71LMwjqMyD04yE+yHrJLLk5w9rj2a4E+sh5ENZAdgWvNcZAqjqEj/zzrNb4XcWw+Iw==
X-Received: by 2002:a05:6214:c88:b0:6ed:1659:76b0 with SMTP id 6a1803df08f44-6f2c456cd92mr69394846d6.20.1745026259950;
        Fri, 18 Apr 2025 18:30:59 -0700 (PDT)
Received: from theriatric.mshome.net ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af14b9sm16649266d6.21.2025.04.18.18.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 18:30:59 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: gregkh@linuxfoundation.org,
	gshahrouzi@gmail.com,
	jacobsfeder@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	sergio.paracuellos@gmail.com
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH] staging: axis-fifo: Correct handling of tx_fifo_depth for size validation
Date: Fri, 18 Apr 2025 21:29:37 -0400
Message-ID: <20250419012937.674924-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove erroneous subtraction of 4 from the total FIFO depth read from
device tree. The stored depth is for checking against total capacity,
not initial vacancy. This prevented writes near the FIFO's full size.

The check performed just before data transfer, which uses live reads of
the TDFV register to determine current vacancy, correctly handles the
initial Depth - 4 hardware state and subsequent FIFO fullness.

Fixes: 4a965c5f89de ("staging: add driver for Xilinx AXI-Stream FIFO v4.1 IP core")
Cc: stable@vger.kernel.org
Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 76db29e4d2828..351f983ef9149 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -770,9 +770,6 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 		goto end;
 	}
 
-	/* IP sets TDFV to fifo depth - 4 so we will do the same */
-	fifo->tx_fifo_depth -= 4;
-
 	ret = get_dts_property(fifo, "xlnx,use-rx-data", &fifo->has_rx_fifo);
 	if (ret) {
 		dev_err(fifo->dt_device, "missing xlnx,use-rx-data property\n");
-- 
2.43.0


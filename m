Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0001528E586
	for <linux-staging@lists.linux.dev>; Tue,  6 May 2025 03:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746502453; cv=none; b=u01pdqOu5Tbxfqa9bPnJuIdnVt6h7uUZG0L8ZUe46WmwmVt2s5NuimVW8XKNYJvG1RjLiZfPbgH3QEFllqZ1zFDF2BeFE9fhAWmYMdJ64UdpEZ9YpNX52qkkhbTWAHn2KW0V1sUZ2j2BoLxRpf5CrVdCgxyWv++L6yww5uj+o40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746502453; c=relaxed/simple;
	bh=QYL9iza8qksAkCLYKPMeAryX0p4dodMnCX2txJs3q0I=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=sBruHXQFbQpoP/kM8tF1wSl5NtXH6uZhvtJ1K4UF6Sa+H0phdp6GaPJ6i8E6MkXm5FGoEps++PoLP/26dKe3ZFA36FrSOIXWj8d1RC6BbtZnbP9MnecNxRcz4GGXwOuWd45KGy4trRAKTUjZbLKpAeAzV+tsnqxoeLjajyAhZfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hgRD5HDc; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hgRD5HDc"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2265a09dbfcso68335605ad.0
        for <linux-staging@lists.linux.dev>; Mon, 05 May 2025 20:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746502451; x=1747107251; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OTniG7IE3xX9P3zbqpr3aXl5LjPn9JBb3AM8ohKnBMI=;
        b=hgRD5HDcNvdPG6om4ut0oFJebb5TMU18WzkA1yYn/Cq2qEgwhiv6LEocD4i2qOFSJQ
         A/tA84m0ewv2uiSPS+ZBXHA03okQ2u+6molWqVqjzH3rS/tVVcJ71P1mI3WaWLipSP9G
         DB18XGminyAyMkITRXcgmSIgsOZ/3OpTh6XAWK4lSWR3vEgPBzX8/GyQx6iGJaxNQFNn
         czHxT/h8cmvr/OeVE/TaWLilcMOLYjCdoW35YzsdWEEwUWG7wAwq+X47t6h33yMl3P8L
         edkuEz9j41aL6BDGzJERT3qMEnjjMAFS71oVBAC1lvBIO8hjS7vGbK5Hku+3es2ZBadL
         sBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746502451; x=1747107251;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OTniG7IE3xX9P3zbqpr3aXl5LjPn9JBb3AM8ohKnBMI=;
        b=jLmZeZTuUlj7c7pO5Z8UiZC+GK0/DbVzSAo0gX7c4ZaIUpxWOWtd4Ek6mh4jTqRg9v
         JpGX9yHsGl0eRvweDpzDdBHQVhoez7eG9PCzdg3dhQbpSfH7FqGtFjcByDem1uj+l7zc
         fiUIr7Ub74sXuL5k16prLBl5m7z3smin26HIw+U8++rFIomqz+mxuY+JYFVIS6Ir2kAO
         jEAgN1IJUtFv+wiYwzML8Pd39oxyqXqRN5PxYSw0yUTfR3bmayajjgbMYaBB3Qm2jpXB
         L2UgfpYZavYsfd2wNUvHkKfYj8BaRDWBqsckCmE871eO99EvfzaxQ20kjrrjpCWXqSZT
         YGlA==
X-Forwarded-Encrypted: i=1; AJvYcCWdCx5LYnGEj3EGMQEWjGBbCHNY+v/ZoZT0eA1B2HFK43UIG5XCtzMs3p64CaOVJ9CsDrKG56l78TjuyqgF@lists.linux.dev
X-Gm-Message-State: AOJu0YxwFpQYipdPgjmXnC3UcHNwnyviu3RYnyQwNcJS2sUibDBCqOSc
	sa4P2HeQ/htGs2JrZmorAk0Krv1YltmE/QtEKgjxywx09p2QHds4C0dx5JeeG0vc7kBgCgaY4Yt
	RmT9dz51SvHpbM18Jzw==
X-Google-Smtp-Source: AGHT+IFWjZYRJEiXFLhjLTzrSR4D3ISD/0V6bYvA5Eq+ZhoMPEht1Ky7kdvoBWJ/wlHcTS6E0fkbiRswi0eStTHz
X-Received: from plsd10.prod.google.com ([2002:a17:902:b70a:b0:220:d81a:8975])
 (user=ericflorin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1aa3:b0:224:a96:e39 with SMTP id d9443c01a7336-22e1e8e9f54mr138686135ad.9.1746502451339;
 Mon, 05 May 2025 20:34:11 -0700 (PDT)
Date: Mon,  5 May 2025 20:30:13 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250506033340.3689818-1-ericflorin@google.com>
Subject: [PATCH] staging: sm750fb: rename `regValue` to `reg_value`
From: Eric Florin <ericflorin@google.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Eric Florin <ericflorin@google.com>
Content-Type: text/plain; charset="UTF-8"

Rename `regValue` to `reg_value` in `write_dpr` to conform with style
guidelines as reported by checkpatch.pl

CHECK: Avoid CamelCase: <regValue>

Signed-off-by: Eric Florin <ericflorin@google.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 44b9e3fe3a41..5648476a8f3c 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -17,9 +17,10 @@
 
 #include "sm750.h"
 #include "sm750_accel.h"
-static inline void write_dpr(struct lynx_accel *accel, int offset, u32 regValue)
+static inline void write_dpr(struct lynx_accel *accel, int offset,
+			     u32 reg_value)
 {
-	writel(regValue, accel->dprBase + offset);
+	writel(reg_value, accel->dprBase + offset);
 }
 
 static inline u32 read_dpr(struct lynx_accel *accel, int offset)
-- 
2.49.0.967.g6a0df3ecc3-goog


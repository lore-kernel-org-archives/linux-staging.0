Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1601A377A81
	for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 19:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784056287; cv=none; b=uHbW82sZTlX3/vLE1n4S6qqi/pFJ9DEcquMP6Geu4dv2CAAw5p3spTUOhfZvkWknt63n6W7m2Cpn/sH1BlxdsP1owwyaV/UllHwjzH+Q5UUP/zWpIL37dFhufiCBewQbXmqMr40dGizITeilrS8l/cvgsFfFXgx8VP1gnjU9Gns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784056287; c=relaxed/simple;
	bh=nOCQSFW7CSkNoMWM8fbJpg3119zaBvpzWx6xv/iqRPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=baNxbzxB4Wu511Q/mgsPesVd1C1TPnliGobyPFI5xRee6GJAPw12KdrZT4w27VhByhhrH6DBAGLQ47MSx/1ycOGSs2/xW28RkbmJsKeWmwT3duu1SX6WuX+2wPEvnmOtULcJFwDOR0fVOsht+Z9uK8E8giVEHZF/6Uy3F4kfVbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhvfeWI6; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhvfeWI6"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47defd0c1c5so1042080f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 12:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784056282; x=1784661082; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8SgW7Vtvc0tFBeUiDAXyhdKRnHwKhXWugDI8a8LDJqs=;
        b=KhvfeWI6FKhl5KtSihJMR3i7V/b/3ZIbq65vDw7xVim+ebYBVBGrveWi+LQEBvPwyB
         /zL1c5/log2v297iJw7xHZoWF75/9gNfdiZONVSZcJgk5VHgBr7SnLcEkdJqo9YlaYG1
         DH9ls9x4rtYNwrYA/kBm3eadiW8KmwYd+igmY74F4vqAfErfYMnVsXSXMHnnQvjBrjGl
         a8qrA4D2FDSAhkxpOVXnD8N5hx9Ez4kANrZUoNcfg4Fe/BQVc++Rxc/XGXAFRVT6ts8W
         A74JANDt1mW28uuhfO0rrxYa/ARbR//cnbb7uYDp3k9+oTT3185Z1PaXPZboI3EeQUFk
         r4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784056282; x=1784661082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8SgW7Vtvc0tFBeUiDAXyhdKRnHwKhXWugDI8a8LDJqs=;
        b=mrkODIhtCAXyx2bxk4EvqcXmEbT2hAXjnB0mTLbOHe3+m/i2pttWVPtPB+glGrDnhv
         lVQhtnCwrDmbLRzmztzw0qQ/mwtDiI5uAOJ8Xbe5rTDr/EqS64whYkAgsF0kXvMbBgyR
         zRXbLBRbivdejSf/OgsnxT5laCCY+Y47uSTCbiRdkNf5k0EtUudVf68pj53rWS1Q4zX7
         SblOJ5uP8FjTEnRC11QMpD/8IfoXj7KkVveMlPno8fuLSgRC5kBxTwTjvSjZv0/ao1F/
         N/X9vr/2/misThYAvD4F7AIU7F/t52ORzCcMw0Ge+QIWehj2YWRNO93qZ9LbfdxFvT21
         aLkg==
X-Forwarded-Encrypted: i=1; AHgh+RowHxcGrcfVTr6J/2Fcp53bZ0Ns4NKwCGk+yaTC7rUgflJ4/0FkOPshMNmHigWdENdJJvK2Sg3TU26B8NwB@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6JEKnyppvmTc/gnnnrAJq/G8E2dDEHGANVQYIGCfRQIE3eG6E
	sxfhV1o48Z0ddzMsgOEx0TrUqs+/xpsj+Kw9q4YgMy0u1ntfp2WwbXzM
X-Gm-Gg: AfdE7cldL0KCgf4MflhVT2jAutH+hVxR7mbG6YmV1p2vf7UzksG1psbTqKfcDWcTgCU
	6BB2j3bjJdsCv9jDZRiNhpYvbPT+z5m0irZyIX25380wtXAuQEKR3PIaX2Q8x7NcbOoAuU8Riwk
	JuOm64fjwLxSM5MB+ZgOve+MkQs2wBiix6zV1ApkOQ2eSf+fuq6P42Rld1kgboFsWCCHg8Wut+J
	A5g5nCFhSPLcdf4B3+PxkKKMHLhYPpABywD/1YPr7LgPlso+T8C8XlCIBK/a9e7DRM1cWKDZWvA
	A6BZZqTFe9qK45QlfO0SRizh5/22RqHHcvVGIN4ChWHkcf5rxBOfcJotn/wR8UXdx8JJcwJFtcp
	o3JFsEt0zMkxpnlL7Nsz2JWfZE5VcUb4Xca73e3DHL/tdi0KJQEBetSV7vDlPoOA2wjLq6Ud+QX
	p+w3WSuKLwGxg6wM6pNQnBrmgtVs//UCyPSdFkykHAavxoip9MPqEV/HhmWZ+CPiTIONUK1DtsH
	X4rw+mJLVY=
X-Received: by 2002:a05:600c:310f:b0:493:ee3a:f05b with SMTP id 5b1f17b1804b1-493f87d7fcdmr147477765e9.7.1784056281449;
        Tue, 14 Jul 2026 12:11:21 -0700 (PDT)
Received: from evil-archie.tail5479a9.ts.net ([2a02:1388:23c0:16c0:aa41:f4ff:fec6:26e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a2f951asm100677815e9.14.2026.07.14.12.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:11:21 -0700 (PDT)
From: Panagiotis Gravias <graviaspanagiotis1@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: namcao@linutronix.de,
	tomasz.unger@yahoo.pl,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Panagiotis Gravias <graviaspanagiotis1@gmail.com>
Subject: [PATCH 1/3] staging/fbtft: Remove prohibited space before close parenthesis
Date: Tue, 14 Jul 2026 22:09:40 +0300
Message-ID: <20260714190958.219437-4-graviaspanagiotis1@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260714190958.219437-2-graviaspanagiotis1@gmail.com>
References: <20260714190958.219437-2-graviaspanagiotis1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error: "space prohibited before that close parenthesis"
in the define_fbtft_write_reg macro.

Signed-off-by: Panagiotis Gravias <graviaspanagiotis1@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff19e4..38697992f5e1 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -62,9 +62,9 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8,)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16,)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.55.0


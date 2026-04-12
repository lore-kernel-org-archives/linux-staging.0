Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFBE289340
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 17:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776014524; cv=none; b=s1Jgf8T96kcklVKAHYyqEFDq0Rf5QDvucioxOMEX8LkiwzbpN5Vaz5/vBqhl+8ZD+eURJvpNsqMzX1PR9Jsd7srjL+qFXoYsmyjXv8pIvv0SBLJKSlMIH3B9t01VZa7WTdzEa0Gf9YCwf0mGnH/B8CJvlL4ecp/0u7+ZLMAtX2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776014524; c=relaxed/simple;
	bh=wIKNV/TU52GcyeaVfrYa9wEhn2NZaQpyu7cNGZKhRuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f+VXpiUcJG9XXdtjwLWFVqqExLOWEK9YRUrP60vcYsiqVh1Ut0dA6od0wA9L+6WCIrqpJ0EBR090yfBmjodo6smpYRdZVTrF9zsH/ZW3Bwa5/U3UXyNNYQY0Hm9qI5MteT1XxHUC3pwPLa0l07fcrOWWYyfj0O8YN2CWsvE2msk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q60Lx22p; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q60Lx22p"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488ba840146so34734305e9.1
        for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 10:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776014522; x=1776619322; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7F4lbNQWtZXtoROCb8OY9JzSy1iP1R3hy25K3QPEtAo=;
        b=Q60Lx22pbO+fjf2VqmTtuavqWaB+hDjdrVeaYQ07mCR463s/zRZjGaKTml4zxmihW6
         v5zNwp1fMLP097q3NQ8fhQ+rYhbly0UcSpPGMthPsslCq35DAmf7xizoHb/tmtUHnjnl
         4Oao9Jr2APjZEGNKv6aG7MQLD1Qq+eDZOyLk/Pd46e3CCMrn4wI74u32pAyu+AFhINnC
         LUvzCtLO/CvsGnuqWWFWoTBnwUgRj1diNPNESkQlcNrEmNfEih2NgiglSry5hTL7U2de
         CFpFLNCjihSq1KlRL1wG27dmns1H6hGFXLngVjYOgRtgIPgxHZdQ6U1JziiybjuxdL5i
         XUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776014522; x=1776619322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7F4lbNQWtZXtoROCb8OY9JzSy1iP1R3hy25K3QPEtAo=;
        b=qQLO/4+GZWpD/NeuIvapQFVxeaPYBX83YQrpZB9ZGUZHb9TYZ2Ne8XsYY0QAs0NeVu
         EJ7D5QpcNgjKFd376P/iKTDr9cG7cLizmhJwrxG06KuBTM34Y4Xq4cRRq98wnYD8tK14
         /CBb4QHIA5ZiuwpSIUfQTsTDDwVKvabuf5nDnr/hEeVBZiSuPNZShH2r59kSlpNzbjB/
         Noue7EOU+EybKHEx6LqwZjNX9vyoQsBoLDd8ZFjuBXlt8l4SewXt8JYyu+y1az485A8S
         t3OxTsKJifZfwzfZpi/WeKF1xTgQxTYkKNgNNRgiMa8brNdKthKE+kX1FqF8bjNudDJw
         lnrw==
X-Forwarded-Encrypted: i=1; AJvYcCW5tVx+zAmOZHkC3kn3DnTQbkQVf0ldcPK2vTROY+zBx/9K8OUNZcO56RVdylj7xAPAfQfrw4fzzTAvT1Pl@lists.linux.dev
X-Gm-Message-State: AOJu0YyCpylL8J5dqhilQJd+b0oOwKX7iFFfmgE4kL0JWkbRlaDQBjm9
	m+/ejHCRvlwaWEihmSYbPkn7BSix9uIkcEQJXfTVogThWw0FjWw8vjdv
X-Gm-Gg: AeBDiespmMD9/4gJm2Q8BRyhFjKpZPF5V9YdZx8Nz88SIihl2pDtQ2E+/rSQDAX/7oK
	NYF5V0JQydHZF8K+WY4qUWsnYBkZlPSuVTR2z9APrvdgqOO4dldEmWPzSyvjMLdAfSwGUdZwsFp
	yWJPD+01mB4X+SN95Su66GB0SVHhYacOmrywMuLzmPr+CVuQbx5PWk8yj5WX+ptRQ//tIMhoCaj
	jkvUmYThGLdQTaCZZAZLz8fHvwdW6iAjIFBb3ynpZmLEHyFQpSuKKUJLr5b42UwnpW5EfyQ4cfb
	I409M6DSCUUxnpo6JWhT1MxjnJ9+Bmnr5Y0pjl0CYuaTQySMUOA12f9aBiTZJPQg21zcS07Il+4
	1WOz9yiXNPb8yk2uGGT7N17zh5pzVVTYxE3jnoW0Y6gXumgldkln+rNIXxAc9qius3biJY1U23m
	2x+B/BkgAfG4Eyvek7VSXu8CqQYNw2/JU=
X-Received: by 2002:a05:600c:a109:b0:488:af7f:7751 with SMTP id 5b1f17b1804b1-488d6836508mr100895415e9.15.1776014521398;
        Sun, 12 Apr 2026 10:22:01 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:58be:2682::3d6:8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5380feesm287047045e9.9.2026.04.12.10.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 10:22:01 -0700 (PDT)
From: Baker <mzndmzn@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baker <mzndmzn@gmail.com>
Subject: [PATCH] staging: fbtft: replace empty macro args with identity converter
Date: Sun, 12 Apr 2026 12:21:47 -0500
Message-ID: <20260412172147.2817-2-mzndmzn@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260412172147.2817-1-mzndmzn@gmail.com>
References: <20260412172147.2817-1-mzndmzn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The define_fbtft_write_reg macro calls 'modifier' as a function.
Passing an empty token as modifier is undefined behavior in C for
fixed-arity macros. Introduce fbtft_no_conv() as an identity
function to replace the empty args in the no-conversion cases.

Signed-off-by: Baker <mzndmzn@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff19e4..8ce263f68ed2 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -11,6 +11,8 @@
  *
  *****************************************************************************/
 
+#define fbtft_no_conv(x) (x)
+
 #define define_fbtft_write_reg(func, buffer_type, data_type, modifier)        \
 void func(struct fbtft_par *par, int len, ...)                                \
 {                                                                             \
@@ -62,9 +64,9 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.47.3


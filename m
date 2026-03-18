Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5269732F742
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 17:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773853708; cv=none; b=YaRHtprLAwt64NC4o5MjwU7vdoiRaccHJ2ES8kb3tsDHc7RJF0SwtIwAKcVmuuO6To7PkiKg7JK4oJP6BAOU0DdDY920PwO2T+pcIMfhsXNxCYmyqVWRXrNimMNsz611jkVfVz9JUFQ62QPXW2lDOhXq2U/sJknNia6U2AwnUjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773853708; c=relaxed/simple;
	bh=w9WnOUm3gx7P+kr6J3qBZQEZN7a3hiNg44hgOxfoVeE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F5O2TaKvOaUCyk+tyHMR91VQej2ZmiXoPK82MIfnqxf/bcjbbDm+ZNSAXzpOMzSHTWLg1fkZNX/anebpFtxUQmIqT6e7KS/coDiG1F7alFXd7YaVAeNfw4CTULBoll/IPrhSuN+BkJrZui1HLQzDJJfovVNp4gV1M1IwlmzcimE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=klNCYpvR; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="klNCYpvR"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso528095e9.2
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 10:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773853706; x=1774458506; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3in0CF5ZS1VdQGlGfnWOdrlKi4RPKBYkQspeAKgMWgI=;
        b=klNCYpvRWLs5Cl3Eq133LqTfgGzdlQbFqG+9Kg5PJj6i/eDhEU0eK/OQgmN7m7yOHy
         eiylnv9QGC1RZ9IEM00THN/KXEtbUrZLWdDWaYFGn+bh4PqhBxV1PYGhxY7ygZkaNT9j
         mzWIQTiR0rlcEpO/Apz3LTN6BR9chxPSsuibM9oOZfYm84dWdyIWmcmJule2GOf6nkcN
         wHlpc8rSp4TwAlEGK5uYDKn/QWW6DPKN6LMzv+RoNDy/uzEQUCIpCAWSVlZbCh3Wu6GE
         pMMDbNg1Dojzt2nlrmNIzeaIUAE2fXzoT92Le58p/K9YSdNyRf+WhECr0WgHfuS/3xE/
         3l0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773853706; x=1774458506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3in0CF5ZS1VdQGlGfnWOdrlKi4RPKBYkQspeAKgMWgI=;
        b=AypgqGNrPoaAEZuVPD6rfUeJPF0w6F47CqNIxhFvzvVUeGjxA1r4NYQHPyzN9TYjm5
         uIkPgkrMa6pawd7En1jt58Cn5h5Ir9Kq/7qbpcIqBVbP353y5PuKa2aRBuZMAi4l+hxm
         lkzn0EC4m1o+pnUzgZ1BfzJyQ+4ZvdtTcxyT+AneCfJKktm1QapqE2dPWZon10GY+RNx
         4SrOrAbSXQV8vwGSJ35nKmcfGvHMZlsu+9eo7yYFB4dLYMK7Hu1j/pHP24tn3sKfWAUS
         rXJNUgFhjKkjb8hwDLC0hGvaasejiutoGSqXfOzO+mBu1qClu5tCpnUiSZCOeK+BsAz1
         bDhw==
X-Gm-Message-State: AOJu0YyfGNSIHcmHhj6HTOgYtVb/OGHRJAk9ilBW63p8J7We99CIKG2w
	IjJuj3t/7HlmDLYSsExMfgTR4nfCa2kMMh47h7kLbW01qXot9CJuoZrW
X-Gm-Gg: ATEYQzwXmIvQ0TI6E7esMLj2KLHM43ScQ2WrTjs/VMSTF2V0KpUIJDzEAC7eV8Vueq6
	qsE5PuFIhjPG9hBjSbVrIGbHDGEQNX8lhhJsLlFE7dnxKzgLUFQ8SeP7azKKJTGaYzetqcy+Vu2
	KaLJDQTe9W9we9917zYzxn4j3Q7Se6h7hpkDWz+B9mYr1ByY70GYzg1O5b6pkTRjvojVm7ZkvkJ
	PVPPEYfABmkie2oO+KwRjNWSOaZp8CudhEj8TZB9b0tS8CaUm2hTG+y6fntOjqbs70bsI/c7SzC
	8YM4WpiQxGF/O/gf8SlifE+RNwhVQL43m/VfpYm2NYyJvRFB/Zi0+eUTfHapmiZ95j31uAxSPzW
	S2q9VU7qtjYH/X7c2El4AtQVvUQc0l56WbeLHpfsF2FAwVlXGoVH9JYr5tRdTdmHALuXNUOffpx
	w8JA6Sc1zxSMG1xzQoGdiXaBmHfgUeoOrCuMlvy4L+5KV7A+Wkgl04XBv8+FqN9OCCm3RUG0Y73
	ZhT/OlmRJTlFA==
X-Received: by 2002:a05:600c:37c7:b0:477:7ab8:aba with SMTP id 5b1f17b1804b1-486f4440ef9mr68157435e9.1.1773853705338;
        Wed, 18 Mar 2026 10:08:25 -0700 (PDT)
Received: from 192.168.1.39 ([105.156.117.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f5e162e2sm19096095e9.34.2026.03.18.10.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 10:08:25 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH v2 0/2] staging: sm750fb: remove Hungarian notation and fix CamelCase
Date: Wed, 18 Mar 2026 17:08:21 +0000
Message-ID: <20260318170823.53345-1-inasj268@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series refactors variable names in the sm750fb staging driver
to align with the Linux kernel coding style and remove Hungarian notation.

The changes are split into two patches:
1. Rename 'pvReg' to 'mmio' to reflect its purpose as a memory-mapped
   I/O pointer.
2. Rename 'pvMem' to 'vram' to better describe the video RAM, and
   convert remaining CamelCase members in 'struct init_status' to
   snake_case.

Changes in v2:
- Replaced 'pvReg' with 'mmio' instead of 'pv_reg'.
- Replaced 'pvMem' with 'vram' instead of 'pv_mem'.
- Split naming changes into separate logical commits.

Jad Keskes (2):
  staging: sm750fb: rename pvReg to mmio
  staging: sm750fb: rename pvMem to vram and fix CamelCase

 drivers/staging/sm750fb/sm750.c    | 34 +++++++++++++++---------------
 drivers/staging/sm750fb/sm750.h    | 12 +++++------
 drivers/staging/sm750fb/sm750_hw.c | 24 ++++++++++-----------
 3 files changed, 35 insertions(+), 35 deletions(-)

-- 
2.53.0


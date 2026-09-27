Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A0C2701B6
	for <linux-staging@lists.linux.dev>; Sun, 27 Sep 2026 09:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790502530; cv=pass; b=upYWuvTVtwL2CWrz0VbhtV7g9j6w2LNIlTJPzqk14FootzuEiMicH5cT6KZUhSEVcuRERG0ckZHWf7S4fiQ6BKm0LAsiY6n3vEb28WQQR3yqonF2FKMMDwFUjmKKledGlqV0Vd42RBqgsqu8DsIpfLNU1EE7DI9QeaU5lip9Sdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790502530; c=relaxed/simple;
	bh=VbNaCBv97oG90I5mvgMS936SO9aqYeDUwCKNKwEYwwA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=mKLyLN5QrXiYrscmpEDgyfJ6j9+i9ePo2GTSJnpl4NjAzJMuvDIIy81lThQDAx2nLj7SO2hW1GCm5HPOe0tyR0CTaechNzQGdMEZewRzjai/eQTFKeIqIjJVMMjAA7J4oIUPALQ4fGxk7zg2QMyesSJbuOE1RgBEnvGjZzBaA+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLKQkJQT; arc=pass smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLKQkJQT"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a64d20990fso19125261fa.1
        for <linux-staging@lists.linux.dev>; Sun, 27 Sep 2026 02:48:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790502521; cv=none;
        d=google.com; s=arc-20260327;
        b=mJxk7s5sJtH7dY8iJV8aPqcA9Ce23YyAATTvxNLjv3Mg4JDD2ZP3czi62zj2YaezqE
         60FkBA/sYx6HeR/oQdEfQwVkBTcjIbCf+0uxT6s+L5Mhp3i8xW5ZdBfwezQ3PMIBAT9C
         vzQUvMh9qbtiCt+3n+UFZ+oPM8rcObo/hyCAPpLbQuUpXsO5TsNsAciYD9HkVIzfQ0jk
         PI1DbpDlh1t/Y6hvRhVuqLQjCB6R+8DkQc4N7eM6O9qIH1VVj5hcodT0KscWCMTHF7ZG
         j3DwdocJFuSbK9vrJsm0/zeAiTraQiMnlwuu8sFg+/cWnJYkWBSDAGrrKxJTPQgIVL10
         qOVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=G1OxfNq/5YdzHTbdOohSN8hvy0lgOzxPTHbFi5QdzsE=;
        fh=Uvp3xIv0gtD3eIem8+NmzWLRPavkgEtQqGjqnkrk0AI=;
        b=oLjVchmeHcCmd+dMHdGvWd6f4rbRebZoYxfhyn27gQkEg4vDCz7gugtIjqZGNhj519
         lv5OTHyRr5c1cStygu+rH9x/d2hlUnQ0b8k4cVimY8EQWKcAah+O2KlM5XB2g9rfBfyq
         9e1HMr0FXwB32SQvH3mnBOm2d5HLBrWVTgfzYvtqvb5K+f2WU+Dl4O5fX+UKNiq298/r
         GBDLQAq3nJH/s0cWso2iPAwleDwqMM0Y5aFs6uB5qx5YUm0F4GkZCEM/yEeNhkyJs5mX
         jgd6JQySNpgXRkRhDPjLKo+p1UDhBp2mU52Os7EoXHol76pFI1uupN3yko3wNsa5QFYF
         btmg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790502521; x=1791107321; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G1OxfNq/5YdzHTbdOohSN8hvy0lgOzxPTHbFi5QdzsE=;
        b=nLKQkJQTczEoOE/OYDokixTVfvBW/MRVecA0A8NpA7cjzAPTJlxba4tIyc5DhMg7b0
         n2R4KjYTFfD11NVH/tyTLaFyge6+nmRxIgtZIyV/fICo1/zl44C4bnGz8N+MIgTFxrIT
         4ywDJiYkxd9vWIyndlMsIt0N7CvVYAAsiB/xiRNM2Ui944kK1BUDmeBzCyKjbz/3I29T
         AakdlEB2Pk09UINnaQdsafHwOTqGsv74aa+ruJxriH9RM45QaHuHIkhcgnB2OMLuiYPT
         D52lrP+BSI1USX6AU+KlCqUJUC5TTfuoIqQLjbeCppdhLJD73ioJuxN3YKa39KIelgcf
         Firg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790502521; x=1791107321;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G1OxfNq/5YdzHTbdOohSN8hvy0lgOzxPTHbFi5QdzsE=;
        b=vRe0NBjZSwG7PThedob7Z/DHEOy6lMgViw+1IO1kUAsJGKNkj89MlBEjcWKhjLM4BO
         XdGVCdWBG2A1/JVV/mDeL7rOmkZDLLATMj5F0r2M/zOQRLYLobgTonMrov/sGoes9No2
         bkI9Ug/idGF47ii+PkxPWyb8zvdIsjT6XGBLeHQ7GPdtbZYi7fZ1fO6Vr5bZ9M/a5leO
         IhHAg+6Q57QsWa0tPkJ30jHQXA9rQBuwxJEyqWODaxU6v01crQJZ3cY77biYzPie206/
         Gy0Z3JhfzWXw6A3e3aELP2C9JUwy8JqPKiPHsm6LNFPzFka5uvviMLRa4+D6OZL5h6LZ
         fQGA==
X-Forwarded-Encrypted: i=1; AKwUvBxxh+pa5B0hAqpWGmA6X9NDHi0Y0/mzc74eC/V3/1i/sstcIlEezg1BnXUF8YW96rAf3g1VP4QSXz+Sm6cA@lists.linux.dev
X-Gm-Message-State: AFq9FYIhHL7vb4+antGITCX/l91aRamveFyITSuJEy5RwApiMtsFyWhu
	o5vSx0/yaYyHBGgwUY2moMyD8Z8LL8rfdr/ED6yUqv/z2fdPEIa6dGaaLJzUoUyriweTQnASbwx
	v91ggkHpGcsYGTsowMdFPJVstiX/GuBU=
X-Gm-Gg: AYBFou1l/xW+gvhdw0hHIF0K+QCCtOHH9N1YsDAUAHwaeLZQiCzPIKChc8B0ykj5Xnk
	0Zc+s+IodF1b9qTrV/C7Ivd0ginAbham7/5s9Ne+cvVAXKVMR/g5gBzXGB6lykfMq6u0sgu9Wv2
	S1piGHqtZ8SjHdb3WzIFz+i7VXDvviG3BoYcMkyPFtdMnqJ9EgDVSADKL/Q732TNZNdui9tJ0GY
	m/o0ZsTOjpg/+dq+xIS9itii8vtv8OnxBH95741NjVwZ5IK4GtPOuaedR/iher3KsvZ+t38+w1q
	+kTcpCX4RW9PqIRWk8xxgETDqhEHFT/D6TZr5nGCapJRiVzcsciuzhtxjP5COHtd5EyvKfog4l1
	2borhgaB38YHow4FNRwAk2hLEUdvWxZjiz5cVkgBCXrGVLuIl7x4JL2M+9SDeUaFMCXxS98KMDY
	j+
X-Received: by 2002:a2e:a812:0:b0:3a3:749e:31a1 with SMTP id
 38308e7fff4ca-3a63de5c715mr24136561fa.21.1790502520622; Sun, 27 Sep 2026
 02:48:40 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 27 Sep 2026 02:48:40 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 27 Sep 2026 02:48:40 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: krishnanand G <krishnanandgeetheswaran@gmail.com>
Date: Sun, 27 Sep 2026 02:48:40 -0700
X-Gm-Features: AclHuK8BTBfNpqz3m6BQ2iIMJxIt6xRy_BCLLwu5RAkXd_Z2NtIUajK6RkAMxFU
Message-ID: <CAG_41BL-nu7tDFjGgehz9Bf+KKPty8kR6A0RUUUfpepJu4doHQ@mail.gmail.com>
Subject: [PATCH] staging: fbtft: fix spacing in macro calls
To: andy@kernel.org
Cc: gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From 5473fd52eeda7ab1f608c414e386dad0ea40bef4 Mon Sep 17 00:00:00 2001
From: Krishnanand G <118352827+Krishnanand-G@users.noreply.github.com>
Date: Sat, 26 Sep 2026 19:41:06 +0530
Subject: [PATCH] staging: fbtft: fix spacing in macro calls

The two calls to define_fbtft_write_reg() that use the default
modifier have a space before the closing parenthesis. This triggers
two checkpatch.pl errors.

Add an inline comment for the intentionally empty modifier argument.
It satisfies the spacing check without changing the macro expansion.

Tests: scripts/checkpatch.pl --no-tree -f --terse --strict
  drivers/staging/fbtft/fbtft-bus.c
Signed-off-by: Krishnanand G <118352827+Krishnanand-G@users.noreply.github.com>
Assisted-by: LLM
---
 drivers/staging/fbtft/fbtft-bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c
b/drivers/staging/fbtft/fbtft-bus.c
index 30e436f..5f320de 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -62,9 +62,9 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);

-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, /* no modifier */)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, /* no modifier */)

 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.39.0.windows.2

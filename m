Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793586554;
	b=KeB/wwdT2KjFbDWm9swFyTCrpAAq/kq22gBCbQ7RaHAdzoVB7rKSzWNfQMIMci341fOc
	 nmD8ehRJxEZBQFAGY4nbnQ1mmJxV6I1urNWS09WGWo1/PAFiuERiwu5eLM+P0kig3AXvs
	 EaMVzOmxME66BYs5ujQTfS2ZwujBFvu47tjmiFMYcR1yrcDKshaIfv0Q6RTrQUyFFo7Pv
	 ujmehWW6NG1yvPZlObCxXQh6GKEedGBn/Y6gZMonQZL7th8ZtOjfbhIpU9JpcM7qMCMKL
	 PmKZmS3fWz9IaxCxJiptg9WaidUtIXqmbo0AB67f/ferZqlBw13885gHfjQY62K00tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793586554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1R/pvYOnxMShbEJj2t9cWr3dLJwjl+MKLrzd1FqSlyY=;
	b=QigO2KbxWZ8efNGEAE4OH6u8Q/erv7CrvzBrzaLVsWwB+gfhxLiW5IWsasiJPj0cgkyu
	 1F9jSyH6sr2CUq2EuaPPImpFpGybkFiH3RP7DRoxDDK/BKkNhH6J7GOVLQi8r5u6o02TV
	 pGm7PlD4OUUx+9L+htbHba69p/8HRkV/uXSSXOUY06uquyiehoY2wx50+JWOF8FEaiJig
	 IaINCeteLtowyfjCOu1VYUqZyZVIxEW9qd11EKUNjSczDtuuq2N2d/BaMqTFZ+S7PLbp8
	 NKbymSXdpm+QLkWBlKW2wQA1LaN3ajpJeZGvu9eUIO/qvirCkKTIUjyukT25EmDMc1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PiMEA9Ld;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6968D606A324
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 02:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6968D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PiMEA9Ld
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso3575452a12.2
        for <linux-staging@lists.linux.dev>; Sun, 01 Nov 2026 18:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793586552; x=1794191352; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1R/pvYOnxMShbEJj2t9cWr3dLJwjl+MKLrzd1FqSlyY=;
        b=PiMEA9LdNOvhdkV20hNpQdrPzL2VK9/1i5mUBxLHKFZ5KkR7F46F6chqu3qhdv4qAC
         0i4O7ttzMvqTdWWmkTQmqluiQJC1ck2NeRRaPTXTgSXv/cvKAHb9jBD/hQqWLIpK6vn8
         sWaVfli/ZIZQ9Zx49bKgGY7gTMTUbY10WdQys4YXWaXs7jY3uytSXT6O+cay7P0BNp4d
         Du7QzFJj3PtEAaHteZfnUCfrdCHash+O5SsrD+9LgaJ1Ne27+MzoAO/gGdPpA+SdbM8L
         fyt8gr+gL6sOLQOvH80Ivsa3xO/eQ27WHr1j71ZPdO1eqlKQD0C367u2T1Vzl1kk4BM8
         o+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793586552; x=1794191352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1R/pvYOnxMShbEJj2t9cWr3dLJwjl+MKLrzd1FqSlyY=;
        b=Q35hZyAb/7e963GtAZWBEKAn+H1W8G/po6ZFOGCZdzjqAvNoTHvM/s88GLKH3E+IAb
         OTJVADjvFS4fgu/B9LgG80KGJZd4T/1Hq++Ai6+vIqiUlazgGrv8zmT3i2OaVMyMrv+M
         wyBSGzpgomV+9ZLzbKzTLm9syBIo7r0aZ72sKCu0WwJcUAXPyKJc7JWAQPNQmmElefSi
         e2kIXVVHVyEgdbQJyfaHuwjD4kgMgohcQYsteVTn0B5O7Pf/K/Zk7zbbdJ5HX+y+4kjo
         KBw14l0tUqP7/FZpsuN0tI9leA5IMA/vma2gBjD2aaQchTS/WbdD3D0mpa4koF1oZfEr
         y13g==
X-Forwarded-Encrypted: i=1; AKwUvBy3mOG4M6S43jK7ihs8Ml1D+dlYeHYt9YpbE2hpz9xSudECdl6b+hItmQyl1mG+bQnIXg0LbP3J0JH389I/@lists.linux.dev
X-Gm-Message-State: APuU4Z+JfohqRK0etseCeMbrGhK29is3qM+RCbkxlj4Ffn+At0aLauUZ
	NYCaVQnn4DxIq9iykYgMiFQw2hrI+HZXemkG+Q7o+3FcfdNwFKgkoZMm
X-Gm-Gg: AYBFou2jnZZdbjS1ZjeYs5lSjYbaHpMMgc2eMAmuUqw4Yq/g5lUUhMjTCGAaK0TKiyL
	Quz+OQ7cgKzwN7eLQu9+w73e58m/KbigC1QfP82hhnelll5QCSvVrAfD/kjFbqxIZbFda2QEE5s
	SGkHb/dtE3UxGEGF1kl1yeGXGwHfMLl70/lif0Gw70zisXTUTYpqZeMatohzqSnvVYp26/SFwx9
	FHi+NqrvAbRRiOqeS3NqeyDWVJsA9UojL2C+Qp8r/1TCesqmn3NhAs8kUlgTKB9jgm9EbTi29A5
	PFUrEx+fhWy8+ekfqboXSi0HpYxu7q9hb9OhZh4vV5s1osREXdDpaGvGBYIMnZfz6H5Z1wmjRPi
	ZbkROlJoRL0nP/CXrXNmW5JYnbHxU6d//Erl8xeExOcwT0jHJQLrdYo09ww+UCsHrDpsIGhtsdb
	alMIcwJH0llKxbDZHhSySvvpmQiNThWKCt0yGRx0IiK/aaU/Vc70HdQE+8qZnm9NMvQ76CgDEHH
	8qWmcsxAxQwbU+H486fNKSPk5yq5aku3yq69o19sK1m5SWihmj3yn9/JspfLAlCrzaowcVE6l99
	3a3FfkH22E0c/HtTtGQo8iCY4wWo+ad0GyrNSPxepPRmI+CwBAfiJWc2QIM9eKfKExtCeAtAz+b
	qGlYRN8hN4YJZoT0W9Q1Dg9ymLAkf1Q48fZz/TI/BG9J8MCpNpHF4gSgf7tnIRJ9lfSU=
X-Received: by 2002:a05:6402:90c:b0:6aa:f0e:a15f with SMTP id 4fb4d7f45d1cf-6b4d534badfmr5935492a12.38.1793586551636;
        Sun, 01 Nov 2026 18:29:11 -0800 (PST)
Received: from maria-VMware-Virtual-Platform ([182.186.37.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca2112bsm2803078a12.32.2026.11.01.18.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 18:29:10 -0800 (PST)
From: Maria Sheikh <mariasheikh812@gmail.com>
To: outreachy@lists.linux.dev,
	gregkh@linuxfoundation.org,
	parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Maria Sheikh <mariasheikh812@gmail.com>
Subject: [PATCH] staging: most: dim2: fix non-kernel-doc comment in errors.h
Date: Mon,  2 Nov 2026 07:28:33 +0500
Message-ID: <20261102022903.5312-1-mariasheikh812@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment above enum dim_errors_t starts with "/**" but it is not in
kernel-doc format, which scripts/kernel-doc -none reports as a warning.
Use a regular comment instead.

Found using scripts/kernel-doc -none

Signed-off-by: Maria Sheikh <mariasheikh812@gmail.com>
---
 drivers/staging/most/dim2/errors.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/most/dim2/errors.h b/drivers/staging/most/dim2/errors.h
index d707daaac3b6..af909560aa93 100644
--- a/drivers/staging/most/dim2/errors.h
+++ b/drivers/staging/most/dim2/errors.h
@@ -9,7 +9,7 @@
 #ifndef _MOST_DIM_ERRORS_H
 #define _MOST_DIM_ERRORS_H
 
-/**
+/*
  * MOST DIM errors.
  */
 enum dim_errors_t {
-- 
2.53.0


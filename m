Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A51435E939
	for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 13:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773753537; cv=none; b=oddWY4qI/ZO54y/bUjqSFHJsftVmo7V7CxpAhLdXK8SxLZAPewksC5d4Wedyl9IawhHlzQoSk3zeWbB5bv14ni/T6Nw1z1N23whYNacbqZKSvwp8EZ1a78Tq0ms4uFQl2rFPydmbSErn5Q7HWp6OSFf+dzbhHCNLA7eh15geuQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773753537; c=relaxed/simple;
	bh=UXkKVao/I+bbMzpZPd/AKjicv7Ph1GI0+dxGpg/uifc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hJE71aMayyEckTLf2ixeGCiQUg53KUZfeFwilBrGBkR4euNKpxJEYJ0wYXuxZnzzvsdM5NoEo6thUtEv1QbHpROyfdaWtZOUuk+L9EwJLifdQvt0STqLh25GUWdjqv2gZd8hX3dDB+OM0iGOT39u67DsdvciRwqwjjAidjPS8mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VY1+qSXs; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VY1+qSXs"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-485409ab264so5333125e9.1
        for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 06:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773753534; x=1774358334; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uun3QFX6Z2Bwrk4QtN4hz17t2FwvTqmuK4C9YCdzGAU=;
        b=VY1+qSXsVkzAECZB+v9+iZs/hpbMYTX45v4PW57t1y7tpCUElj3pRofBsM1B9TunEm
         eEMk3dG+sE5xdQ8IIxf3r6JGMp5XMFNqyIO6xN8P343ME7snmmgNOS3ZLH0t0v1vG6il
         8KndqQ9RgzTJSOj0A2t3QAkkbYZ6ljI0c9dXi0I0n7rBSyVRy052xnI+CYi6zWt0jABk
         5qozeXUttiKIlZR7KNYTBqE9LuS7ORHmpoACZmC/vrkJ0j7Tuh80gHdds8saHWL8uZfi
         gzwh+juPjAVCE+fHiCot0h4xSCXHfbIQkWYKRuGoxSpD1rmoXKKlXL4Q2H91uKZZw6v7
         dgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773753534; x=1774358334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uun3QFX6Z2Bwrk4QtN4hz17t2FwvTqmuK4C9YCdzGAU=;
        b=jmEDQ76QmClGGr1WVRZ+H4I2UcWv6AXNgCS+KQ96450Wh0ji4OnHSohSi2WnAUcU3E
         Wa9RHhgD3wPMh0EG3UK+QvTDE5ma1e3PdFPycMpyVeB23qS3sWcu6zKs4Zg3NiYbrmun
         OKC/+IZ7sXuQ8kz2lu9QzwzqiLp00sAS4/tOdE5m0Ee9oKi7ln/72MdJAOXrnc97cuHP
         7WM0p9JwVCGqq4m0MDbc1YNme3XXOvbn4OS6lHBjkmLfd6P78HS8FjAoyygWxH6GywWp
         KqsjEGF52h+pJJaUCLJ5G1co5o6Vl/NZ9mIUXnFIHj+RKn3OSXHSJXSiZoTN2IRfjJ5x
         Tqbg==
X-Gm-Message-State: AOJu0YyYCOwK/wOF+f1VtNKqs1QlewSWU6esPQmCjEcyw9uvVSfS1qx1
	C8TVh8WChSLgAcVwNL0T5cAbVA+29wHLo6xZRxWQp4P9frMCB/sX7DDq
X-Gm-Gg: ATEYQzzOOkjSMPXmxW2SKNS9rb4nerWcSkvYzTeFz0+sqprU/lQyYV+24K1zjojI3Gr
	1tcisCs+3i6bH+ZOdi3srx3GsuiehAeGlgKZ6OBNdw3Zyl54Li7BVDafcQ2Pz3SWAUxPck624Ps
	TUsiRqT5vCQxJLKhiLjOqGTCTCcn75VF2Sid/TtlIKWoDbMfvLlLBSFX1XwbvapBzjEWctysX9M
	H8f+ApJFV7xJPavEdDXY0jFhtVIsaOxktb30cM2yY10Hqt0CwcK7dcRI+BdJy3D6L1vha0FvRmO
	Wx9dHR6pJRCSGvz+k6NZpbuca4vAMh5sRvpLhs8mJ+B+YAc9CAC4pzEZy4R2qHFNiGby8CHOMIG
	g5OoThKyYfW93/H5nJpviUYY12lNGp4+H5OPD1vNTHlm8qnraGKTpxx7MXGf1qlQGd62g1A0ezK
	wXbsB9lboJN7PkKkHxR5YMP2dG0uOgWIiWCI2nVFgsupa3ulcKCuqhvRKeOWtt8Q==
X-Received: by 2002:a05:600c:5249:b0:485:38f1:5cec with SMTP id 5b1f17b1804b1-4856eac2b35mr58055495e9.7.1773753533536;
        Tue, 17 Mar 2026 06:18:53 -0700 (PDT)
Received: from localhost (mob-194-230-148-148.cgn.sunrise.net. [194.230.148.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea8dd57sm65499785e9.3.2026.03.17.06.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 06:18:53 -0700 (PDT)
From: Teng Liu <27rabbitlt@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Teng Liu <27rabbitlt@gmail.com>
Subject: [PATCH] staging: vme_user: add blank line after declarations in fake_driver struct
Date: Tue, 17 Mar 2026 14:18:22 +0100
Message-ID: <20260317131821.54768-2-27rabbitlt@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a blank line between regular field declarations and function pointer
declarations in struct fake_driver to follow the kernel coding style
convention of separating declarations for improved readability.

This addresses the following checkpatch warning:
  WARNING: Missing a blank line after declarations

Signed-off-by: Teng Liu <27rabbitlt@gmail.com>
---
 drivers/staging/vme_user/vme_fake.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index be4ad47ed..eb918a857 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -67,6 +67,7 @@ struct fake_driver {
 	unsigned long long lm_base;
 	u32 lm_aspace;
 	u32 lm_cycle;
+
 	void (*lm_callback[4])(void *);
 	void *lm_data[4];
 	struct tasklet_struct int_tasklet;
-- 
2.53.0


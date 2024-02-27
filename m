Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B6D14F9D4
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 22:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709071849; cv=none; b=rFzqWx83VqTm+10GVUvFKq2RhM+naLXNCvLNsJOsaLnn5M6cZ7j7HoNVhFxUKC1Aic4iSwrTSLFbPyIe+bzeU9VlH6CsGguyfG0ROicW44+lILPb106p2fiky6AZCJvTZ48rSNdQ7MO395dHMPAdxsdM4YvITBtwYz0LQ1e1Pso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709071849; c=relaxed/simple;
	bh=IdCiQBJhitT9Oq1nzunZ0J4RNw5mODISj+FFI6ItdDA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G1hIAHH/rOblV4JEcWAlUPThZULtTKgWbq3IEXWSD5g5kC2nSTzaOSbQXvveu8dbcPs/RwgTW/i9yEgczWaJn+dEntCzaVZ6DFlzYtPDl1ZaxFFtI7Ym0ALd8rzYW/OEvpVrwlfrBsq5SACYDQk6RPEbwfc6AhWWwtufS8cKirY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cu9Tzrto; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cu9Tzrto"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3392b12dd21so3902718f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 14:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709071846; x=1709676646; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MgkeChhdzdsl3VVE43LHMpQmdoDgIDk5tOvZY9oXyW8=;
        b=cu9TzrtomC+6xIQWJmwicI2D5qA1fzfQQKMiw3h/sA3XDk4ymqJoJ42hPPk9VLcyQz
         u0v/6tenz0TU3DSX0HSRRdaIFR1Wt2MrPipAQD7LWfxlA4u8MDl/SONaWcVe+ykR4TxX
         qIS4NRDnkMBr/g2CLTkWTMqNlr3O533JF66kfg/fKIyBS6+PkDfJ1fKXirNKYMCf8c0w
         RwlV0PDKOD+TePpcPTLwyNctudpOb95SzCqTNNn7SQm0N5fDxbIlDKScPDVz/a1VU+40
         Fxhutz0hrXizw55b5OBA/RnF+7z2YdSDi9Lm+mqOo2M40+nkOvSwUXD4McloiLTCYGeV
         3NhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071846; x=1709676646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MgkeChhdzdsl3VVE43LHMpQmdoDgIDk5tOvZY9oXyW8=;
        b=PgYOsPpGOD9TjrLTFX6lr6IENN1lh9DmkOGlq294rem1UUMA7A+H5PO65lmKUaLXyb
         up9T5piQbD9/mRmX9Y0prtC2mN6Z4HBaVBiSAVgkf/ha7TpqSfV4T0WnyxHsXxoI0cLf
         JFi3FhYdzw3MRSKWc9rApO76nNZCot4Eucoa/8GxqFDVnzX4LDRtyS2xYgVj+IK9ja5D
         f8hcYBw6ELXx+s0GsrsxDSlMK6nyyOp4l1kjoHDYQRsrR9TrwuvryD7kMobnc4sIJ7dF
         vEc7FqURoBsH0MChcqxdDvjczLD9nwm9WgRpfk9ioZw8ZZnIWjp53B/ZpKxTrPo4tJ2g
         Aztw==
X-Gm-Message-State: AOJu0YzpDHY3YajLhMjYE5UH+OcMTdCu5PQPyGNcoWPGc4qyphpvUTf/
	1P02yKf38POt6gpgTbiuxphGqiSaZQuAeSMvIv3W4sPC5CM0hi/6
X-Google-Smtp-Source: AGHT+IEfemwGujGA6Kgnpbu0SwK/+RHs5EYZ9cW5+iN1tIWmNWpoZkRPCzE6At+BVFPrI+MqP+TH9Q==
X-Received: by 2002:adf:ce83:0:b0:33d:27cf:6208 with SMTP id r3-20020adfce83000000b0033d27cf6208mr8420087wrn.7.1709071846024;
        Tue, 27 Feb 2024 14:10:46 -0800 (PST)
Received: from YOGA.local ([2a06:c701:736b:f200:73a5:2235:8954:9b7c])
        by smtp.gmail.com with ESMTPSA id q2-20020adfab02000000b0033cf5094fcesm12562384wrc.36.2024.02.27.14.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 14:10:45 -0800 (PST)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	luca.ceresoli@bootlin.com,
	benjamin.tissoires@redhat.com,
	elder@linaro.org,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] Fix defines in rf69.h
Date: Wed, 28 Feb 2024 00:10:38 +0200
Message-Id: <20240227221043.532938-1-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset fixes several misuses of the define statement in rf69.h.
Duplicted defines.
Define in header instead of source file.
Unused define.
Using units.h macro to define frequency.

v2->v1:
- Fix grammer in commit messages.
- Use units.h macro to define frequency.
- Reorder patches to ensure no conflicts.

Shahar Avidar (5):
  staging: pi433: Remove a duplicated FIFO_SIZE define
  staging: pi433: Remove a duplicated F_OSC define
  staging: pi433: Redefine F_OSC using units.h macro
  staging: pi433: Remove the unused FREQUENCY define
  staging: pi433: Move FIFO_THRESHOLD define to source file

 drivers/staging/pi433/pi433_if.c | 1 +
 drivers/staging/pi433/rf69.c     | 4 ++--
 drivers/staging/pi433/rf69.h     | 4 ----
 3 files changed, 3 insertions(+), 6 deletions(-)


base-commit: 455c5e12a3b7d08c2ab47b7dd54944901c69cdcd
-- 
2.34.1


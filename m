Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF58250FE;
	Thu, 12 Oct 2023 12:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G7aIVhIT"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-27d0a173e61so673794a91.0;
        Thu, 12 Oct 2023 05:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697115057; x=1697719857; darn=lists.linux.dev;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G875lR9e4K6JzzqFQjwIG6tgL2EBPo5TFmSbi4YHY6s=;
        b=G7aIVhITaezZEOjcXMJ1CXFcGBpZJKl8SI6Fouss6H8I6KAzvIIyPvHx16TIhBjAQm
         e8VROvcWZzoF/s2Ep0Vdn1flACD6ZPDGLOov6lI8+M6FGLNeShbAkHCo1nlkxJ82kMsk
         3NliGDZJoz8oWnNgm8IgGjmswR4B7NfdLEpxda8NiJ2Yem76pYklxzSNaPtpKgYA290U
         CKpMlRxcFDXeqZ6lkII/mdsZ08Px6sqnRujHLkMD2uGJR4nghUlAkDqbdl9X4SS94QMd
         FRVdDOAd1cjNLjGFsU8FXeCtB2N+1YByJSvmEnzNckNvDj9tgox1cP3uFfi6btX4jFAI
         Xm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697115057; x=1697719857;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G875lR9e4K6JzzqFQjwIG6tgL2EBPo5TFmSbi4YHY6s=;
        b=wuCuoLup0aGvtveg3sqPn2NAUhj7eV1f9wDComTKSj7GEuAulfXTHlfEqiGm34K6HM
         cL7+d3pHLIR74rdXUkSslKemwIf7MYJZqnLLlzeZHOPRmgPhYPYyox8IIcF9Wd+vjLQn
         1WLhXhHCiZ1Ewb6YaGi5mWop1Iz2IT43LNHs6L1PI83FZ+QPcCmuOIvvS51FMDHsPkkj
         CxcaLS1dVpFrfuAIqI7Y+yVRNoHVRmiWoqhCDiNYUCI+GhSBwZ/NJ07+7wUwcxemGVc2
         oHeZ9ftw9bNpmCEayBS+3cbJMwmuBWahl+3ejJpff0HpLlMYBZ7NgonRQckcdPrUyyB+
         enMQ==
X-Gm-Message-State: AOJu0YwTK3nEIoDRZZkXVPbrdB4kWuhSh/Em0x8DhbTQAxd1lTrG5/Og
	Ce8N1LE2aJMhVAATtz3a9GI=
X-Google-Smtp-Source: AGHT+IF4hfw/QbwiGe1+9mT91FI/lvIRw9/Nkg/diggzdi6I7n7W+x4AsQMJxHKg5rrYah728ADZpA==
X-Received: by 2002:a17:90a:454e:b0:27d:1862:a494 with SMTP id r14-20020a17090a454e00b0027d1862a494mr2691566pjm.11.1697115057224;
        Thu, 12 Oct 2023 05:50:57 -0700 (PDT)
Received: from Negi (2603-8000-b93d-20a0-2184-6fa4-0d39-1c6b.res6.spectrum.com. [2603:8000:b93d:20a0:2184:6fa4:d39:1c6b])
        by smtp.gmail.com with ESMTPSA id gw17-20020a17090b0a5100b002772faee740sm1796252pjb.5.2023.10.12.05.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 05:50:57 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Micky Ching <micky_ching@realsil.com.cn>
Cc: Soumya Negi <soumya.negi97@gmail.com>,
	outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] staging: rts5208: Fix checkpatch macro warnings
Date: Thu, 12 Oct 2023 05:50:21 -0700
Message-Id: <cover.1697113047.git.soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

In the driver staging/rts5208, checkpatch.pl warns of possible precedence 
issues in the header rtsx.h because macro arguments are not parenthesized.
This patch set handles the respective macros differently(as needed) in 
each patch to fix the warnings. Patches can be applied in any order.

Soumya Negi (2):
  staging: rts5208: Refactor macros to static inline functions
  staging: rts5208: Remove macros scsi_lock(), scsi_unlock()

 drivers/staging/rts5208/rtsx.c | 24 ++++++-------
 drivers/staging/rts5208/rtsx.h | 66 ++++++++++++++++++++--------------
 2 files changed, 52 insertions(+), 38 deletions(-)

-- 
2.17.1


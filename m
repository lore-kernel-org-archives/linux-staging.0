Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0585D10E6
	for <linux-staging@lists.linux.dev>; Sun,  8 Oct 2023 02:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUKFUBzR"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3af65455e7fso2560697b6e.3
        for <linux-staging@lists.linux.dev>; Sat, 07 Oct 2023 19:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696731064; x=1697335864; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FMoyoDa/uZ/7MooKLfhy2actdhu9OzZKbzygeWHv0iY=;
        b=WUKFUBzRS/c+ebUe5mF/GpLBAEKPrCSOCuc/kdQABpsbv9LOhyvR7SdT4Bpnr/0m84
         Qz7dAB+gsDx2UDMzUm26k2f0hT6hHPyeuQ6Ye6jOkfO5oB5p/evjBsotZcOd/1m2YdX5
         sHMQz/4cGW+7uVmqTF3l9R2TWTZZfQADzcjC6UXnWztD0C/ajGCdyKEo98qwMg799yhZ
         dWZNIOIzU2Y+mMzsI53ZjU0+HeW3AY4nCmvQF6L+UPdgs9hGEC1ovxOn/v55emkScHpS
         ZAy8D5HW80Sc1kKK3urSXeSGRRKJb4XCGqoKnrR78MYb6bSjFdAz8ta2fu3eaq59ElHo
         As1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696731064; x=1697335864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FMoyoDa/uZ/7MooKLfhy2actdhu9OzZKbzygeWHv0iY=;
        b=iPXp/kmvsOPpd2Sg4m+M8Ciq2KtIiR51PY/jVLwK397PQhCoMtnPNg7sYAdjMHWUa+
         23Im1YUP/IlJEJmxkoU7me1bHrcr25QnlhPa4/iHOMpkbA5cIMySYtx+xMwXg95id11u
         7LgjQELMrOwMyKygTVzyVoOC8ti9FnxeUxgPim4reO7TISqcPYFZ2An82YjdPLeSgJiw
         ya8T+/XLEQnWlhCS7sz7NHeU5anK7/tM77LY+JSkS1HRrnhSKaRPvt29sglEhQIJEhoD
         FLkvuOEk2/MgkRrVtaUpUQOhmWHQcEnDMgPFlcm4GaH9OhNn4Giy9pXKrRrrFs8mYMCt
         oC3g==
X-Gm-Message-State: AOJu0Yw3G8jqiJfdILFmhEGHzlpAThUEcTT6tgtRX+jNe2V+CWLGaZnp
	Hc2ExCRVaAAfspEI7jj69xM=
X-Google-Smtp-Source: AGHT+IHqeRsL2m3+2DgNGHjGQGf6G1YcEKSBGhcTjGMiBlbS1OmdEu7tiW5qB2rPt5auj3TMl/sbNw==
X-Received: by 2002:a05:6808:1448:b0:3af:7956:10d4 with SMTP id x8-20020a056808144800b003af795610d4mr15146943oiv.0.1696731063971;
        Sat, 07 Oct 2023 19:11:03 -0700 (PDT)
Received: from ubuntu.. ([223.178.246.252])
        by smtp.gmail.com with ESMTPSA id x8-20020aa784c8000000b00690fdeb5c0dsm3746125pfn.2.2023.10.07.19.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 19:11:03 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: Pavan Bobba <pavanbobba206@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH
Date: Sun,  8 Oct 2023 07:40:52 +0530
Message-Id: <cover.1696729776.git.opensource206@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

*** BLURB HERE ***

Pavan Bobba (3):
  staging: vt6655: Type encoding info dropped from array name "abyBBVGA"
  staging: vt6655: Type encoding info dropped from variable name
    "byBBVGACurrent"
  staging: vt6655: Type encoding info dropped from variable name
    "byBBVGANew"

 drivers/staging/vt6655/baseband.c    | 40 ++++++++++++++--------------
 drivers/staging/vt6655/channel.c     |  6 ++---
 drivers/staging/vt6655/device.h      |  6 ++---
 drivers/staging/vt6655/device_main.c | 24 ++++++++---------
 4 files changed, 38 insertions(+), 38 deletions(-)

-- 
2.34.1


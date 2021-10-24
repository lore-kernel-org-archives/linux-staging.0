Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3D02C98
	for <linux-staging@lists.linux.dev>; Sun, 24 Oct 2021 21:25:42 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id b4so6060738uaq.9
        for <linux-staging@lists.linux.dev>; Sun, 24 Oct 2021 14:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DqiOv1p3LOB7EKypi/0mOrwTqn1iriyu35ZKspNjngg=;
        b=DKvSVO+p/SFxE0r75HKW9OuNa3MhS2EvqtN+4jkFUbBPoib8QfYDoroxok9N3so9Hn
         exhiDYfvK2JpmUiZ3PfYfOGMAhDkvjZa+gZMlmPsZy+IucG2AQO8nhm5Vwvz0TTVCyAH
         /e8tl2ROV1EWMF1aVd5piqcoYTirX2dcwcX4hvabIBWQ7XoUnJD+mJntHWL/hYKCgBpw
         F+u7+KJaujnOFFeebEBtc58FDEY8TqARz9MRaPik32iYwtL4Y/icdw2c71jJ3ol/zpcM
         1Y1Fjl/u3r2/IydIaNAEyfSBll6J25biOQJwKRpwizoVoK6yv6PRZEiFqz+WcdD78tvG
         4s9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DqiOv1p3LOB7EKypi/0mOrwTqn1iriyu35ZKspNjngg=;
        b=pwOi1Irz1rCgGuvcw9irb16jBpTSR5u0eau/dROY/tm5wNID8Kj4n6YIhr3UJHaQhC
         cpbXje5c1loFR/nfRl0nNbxOihl75Yc3BvqT1mrG3QZjDoVZyaYB1bMWhsVsKgu22G++
         xFIme+p6gj/AmGmGOjEFDmpNGF1YrVszRg8hRSzhPiQaT7PCURtjkCWj1MngC+7J3vpd
         wG6QE26Voq0pIFPrqrc+vanjEXjkYjiri0GWKmcGC7q8+z8DTO/lkFCcjdvbIHsfbdQ6
         3D7FV3ePlKh3YlEYXaSMLY/+pt07q25z8NYRJ9KU0LBc8GoWna0gvkoep5s4nXR8VLXT
         fxcA==
X-Gm-Message-State: AOAM531MyUMcMpRz9GiFdmwKHtAL0xcoOHqr58nyjMdHKIoUsbQUQcfF
	58cLrbhXZHQuSP8ALV8URgz/olWrt8poqw==
X-Google-Smtp-Source: ABdhPJx5a3/eziA4Af2q1yZwIzzKVvrciYGyHTKBotRo8MHzV2NoNC5PYHiWoxrmggMICmrqgmm2pQ==
X-Received: by 2002:a67:d81a:: with SMTP id e26mr11952472vsj.23.1635110740894;
        Sun, 24 Oct 2021 14:25:40 -0700 (PDT)
Received: from localhost.localdomain ([191.83.215.63])
        by smtp.gmail.com with ESMTPSA id 45sm8847869uaq.8.2021.10.24.14.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 14:25:40 -0700 (PDT)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	nsaenz@kernel.org,
	stefan.wahren@i2se.com,
	arnd@arndb.de,
	dan.carpenter@oracle.com,
	ojaswin98@gmail.com,
	amarjargal16@gmail.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH v2 0/8] vchiq_core: various style cleanups
Date: Sun, 24 Oct 2021 18:25:16 -0300
Message-Id: <20211024212524.370078-1-gascoar@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This set of patches consists in some code style fixes.

v1 -> v2:

- Drop change wrongly attributed as a checkpatch fix.
- Unify patches that fix unnecessary blank lines.

Gaston Gonzalez (8):
  staging: vchiq_core: cleanup blank lines
  staging: vchiq_core: cleanup code alignment issues
  staging: vchiq_core.h: fix CamelCase in function declaration
  staging: vchiq_core.h: use preferred kernel types
  staging: vchiq: drop trailing semicolon in macro definition
  staging: vchiq_core: drop extern prefix in function declarations
  staging: vchiq_core: cleanup lines that end with '(' or '['
  staging: vchiq_core: fix quoted strings split across lines

 .../interface/vchiq_arm/vchiq_arm.c           |   4 +-
 .../interface/vchiq_arm/vchiq_core.c          | 763 +++++++-----------
 .../interface/vchiq_arm/vchiq_core.h          |  99 +--
 .../interface/vchiq_arm/vchiq_dev.c           |   4 +-
 4 files changed, 335 insertions(+), 535 deletions(-)

-- 
2.33.1


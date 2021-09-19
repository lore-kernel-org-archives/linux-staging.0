Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917F53FC3
	for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 22:06:23 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id f22so36209287qkm.5
        for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 15:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qnvBHVofCI078vE8ENwQVrZQWxUC8kXdsfVEs8ZqGPc=;
        b=EmPmJimiwzUaOxywPMLvTOyZc0SUnhOlErQoTUmX7st9GVg8SjD/ELsfCeSTEb4zVa
         cu4wJFO6HzK/vKl5K+V2or5TTslnUu/SkhR3sMtLId4M/Lm5VoKRnsuBCzdk5cfoyf01
         bF5eFG3T4UBoLA0rIRcgqbnNK42SKc7pcgXEWYkfwntxMqPRHaKHAtR7BMAcTbaZPF7N
         UyWvHhdjvUhm2P8D93k3BlMlEqIAqeWLPaK79nDaCTRFZPAZYEuFiHLg6EuA13OZm2xL
         09pyZCIMwxovOyVi3cxltpkJJqBliaDxpWrQJXBTPrNd6YvwnVLmU+t/U2y4e3mqKOJM
         KyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qnvBHVofCI078vE8ENwQVrZQWxUC8kXdsfVEs8ZqGPc=;
        b=nS8L6Y8AgyqMd6C5THHpBSkyiw98Zc/gRiwLFJOeaa3u3z/dSb0C1erjbS/Wo2c4DD
         2jYJh6eUkNpFq5VBS01ahXoYJMz3wyLgaAJ2/ds8a0675Y86F93zqSHmXqZWuBQv1fTI
         5NGiAGbfOVvgcKXGSTsXBc0W/mWo6GbaIKkOk89Vc3GE2YqIE+ap1xsggfAgn4/ByBk0
         wAlQw2VUP/g9zI0VpVBt9R3A5lBM2Hj8ntl3RR0XUtJSkU/oVer7CRImMcT8I+AKZkdz
         UKJ21+hOfqorjiM7Pebadfg/NwfAKP6sgHvDBu3hoTlEDY2YaNIxWWC5Xhh7JyCRM2Ny
         o2KQ==
X-Gm-Message-State: AOAM530Tq7JVqF20cCD0j4UCD8B3eVD0i9BR0UjlVF6qTaPtdEUj2OWZ
	PyU03H0nf14NQLMaMRDdgLD13vqF46g=
X-Google-Smtp-Source: ABdhPJzgctTUWico0bxsBx08tGbafnOdLRfiTf++cbU5TqsqExBO43BBC5f5IDmma2KnhiRAYkFaZA==
X-Received: by 2002:a37:a793:: with SMTP id q141mr21055987qke.10.1632089182434;
        Sun, 19 Sep 2021 15:06:22 -0700 (PDT)
Received: from localhost.localdomain ([191.84.236.195])
        by smtp.gmail.com with ESMTPSA id t23sm246313qkj.31.2021.09.19.15.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 15:06:21 -0700 (PDT)
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
Subject: [PATCH v2 0/7] staging: vchiq_arm: Various cleanups
Date: Sun, 19 Sep 2021 18:59:07 -0300
Message-Id: <20210919215914.539805-1-gascoar@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This set of patches consists in some code style fixes.

v1 -> v2:
    - Remove patch vchiq_arm: replace sleep() with usleep_range() from the series
    - Add cover letter to the series

Gaston Gonzalez (7):
  staging: vchiq_arm: cleanup code alignment issues
  staging: vchiq_arm: remove unnecessary space in cast
  staging: vchiq_arm: clarify multiplication expressions
  staging: vchiq_arm: cleanup blank lines
  staging: vchiq_arm: fix quoted strings split across lines
  staging: vchiq_arm: remove extra blank line
  staging: vchiq_arm: use __func__ to get function name in debug message

 .../interface/vchiq_arm/vchiq_arm.c           | 221 +++++++-----------
 .../interface/vchiq_arm/vchiq_arm.h           |   1 -
 2 files changed, 84 insertions(+), 138 deletions(-)

-- 
2.33.0


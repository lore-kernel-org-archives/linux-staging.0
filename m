Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C9D364
	for <linux-staging@lists.linux.dev>; Tue,  3 Oct 2023 03:14:27 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-27752a1e184so316888a91.3
        for <linux-staging@lists.linux.dev>; Mon, 02 Oct 2023 20:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1696302866; x=1696907666; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hu7+B11Hw3uM8Sa5n4kO/9PErxC3pYlTJZiv/P9tfjA=;
        b=jxLQY1S/zZAydzdb5fp5a9GtssIoV25PifEUXJP0duITVqg66eLMWHyERZxiCGAI72
         rXCSjVZm35wo7cJwryFgC6rS+LcvzsbLhVVdCvAMB7LnKL9LRBMaSdDeua9Eh4lXRpg4
         SoVqLIpuXv1sZ1KR50M170ywMRs2qChZup2sU/nHSEH+y74ir8OtxBFKS2P6jCcWReaw
         7NEOOsZgUtiKD29kb3k2eW1t0xEnoMAyelFGKWQq4j2VNnXN3+KBMshHS3IJwzXs/TWD
         t7YPZug1Tte2xS4FQw+VPdh5BA+qF19Fy/Kt6+BMREi9qt+Zt2xdGDjovRT+8CScdRp2
         2ixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696302866; x=1696907666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hu7+B11Hw3uM8Sa5n4kO/9PErxC3pYlTJZiv/P9tfjA=;
        b=jVMUH6PojFa11LEuuIMrf+VhmvUVq3BN9WRJj7s6o2MpWXnOMn4tqqHYxVEnukdVwZ
         7jvhU3AbKrA8CLCUvm67ALqixaXR7dEv8qk92FLGcRg5Ju2ibCRElX30Bj9GGIeCF3qQ
         nbqoarG7mWr8uWYhyZh9V1z8Ipco7+hvKVSHGMEUGKjs6G6v3eZ4uXF7FPgFF5XRaauy
         ZTBCOHE/wsDxg6EWC9YhlnN5RKdXgTijf0nr9EuFtbkhIXrDbStLdDk18IX0B9Gdo/vM
         cqFK+AyGgxTTRs0jHehcTq8vzrjjzqhSjTUSyGijGvN45vjzxZe1ohozGJsQYOWIdgcA
         7eyg==
X-Gm-Message-State: AOJu0YzXIQTLJIA27WrYebWNtqap9U3KS8HcSG0uw7jAns1HfPtY4Au2
	VniTFMZon9JnoUVnkzUyqxQGMQ==
X-Google-Smtp-Source: AGHT+IHqxNV4tPPonq9LPtBza1qpSZfthVa8Rtd8vQ/1LJzQZGXpYnbuPRDajiU27c+Dz06G0oyWfQ==
X-Received: by 2002:a17:90a:17c5:b0:274:87e8:7ce1 with SMTP id q63-20020a17090a17c500b0027487e87ce1mr12865512pja.39.1696302866594;
        Mon, 02 Oct 2023 20:14:26 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 11-20020a17090a004b00b00273fc850342sm7692550pjb.20.2023.10.02.20.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 20:14:26 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 0/3] Staging: rtl8192e: Rename variables pBA, bCurrentHTSupport, and pTSInfo
Date: Mon,  2 Oct 2023 20:18:46 -0700
Message-ID: <20231003031849.176743-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series renames 3 variables to fix checkpatch warning Avoid CamelCase
Thank you in advance to the reviewers
Tree


Tree Davies (3):
  Staging: rtl8192e: Rename variable pTSInfo
  Staging: rtl8192e: Rename variable bCurrentHTSupport
  Staging: rtl8192e: Rename variable pBA

 drivers/staging/rtl8192e/rtl8192e/rtl_core.c |   2 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c   |   2 +-
 drivers/staging/rtl8192e/rtl819x_BAProc.c    | 112 +++++++++----------
 drivers/staging/rtl8192e/rtl819x_HT.h        |   2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c    |  12 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c    |  20 ++--
 drivers/staging/rtl8192e/rtllib.h            |   2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c    |  15 ++-
 drivers/staging/rtl8192e/rtllib_softmac_wx.c |   2 +-
 drivers/staging/rtl8192e/rtllib_tx.c         |   8 +-
 10 files changed, 88 insertions(+), 89 deletions(-)

-- 
2.39.2


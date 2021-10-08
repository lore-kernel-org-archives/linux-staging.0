Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC192C85
	for <linux-staging@lists.linux.dev>; Fri,  8 Oct 2021 10:06:07 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id nn3-20020a17090b38c300b001a03bb6c4ebso4951189pjb.1
        for <linux-staging@lists.linux.dev>; Fri, 08 Oct 2021 03:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OzoTpc5FXnHcSloTlGi/7AXCgf7dBEC1jkxAe77KXeE=;
        b=LpauymSNX9w1tBNgyes0/5NF8kSaIGg2a8v9QUXm3LfmX6BZi2lrszHYLztN3+N9IQ
         Y6qkh4YrIAzDiF4g9Tr8AKSLLK/UP94QF5qqqZWmTKRwS60+cdl4GdvAzoWSNlScmDbg
         gK9gsL5va9SYEExcIy1UcpTF84Ay4Kx0pzZrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OzoTpc5FXnHcSloTlGi/7AXCgf7dBEC1jkxAe77KXeE=;
        b=cGY6FerPE5hpheayZ/LL5+hjH6ENtqqOZWk8ghY+8vgnI7YRiDqaMBDGDCeRTrHwyX
         kL91XVtm/FV+l6dcDRTUaC0eNOZ6iHsKGg5j+8aCszxv0m9pt77T/UW+iJR0G/pcdi3p
         qfY5kRhffvK1lkj0mCYvDHGT2CHb7Rn8V4dPOGbJRct0XAn2FTL/1laALrV8KanGk2Ir
         rUzloEmCF76iyvKfdVchf0PAGncl0FOUC0eJRclxJs4eCOxOtmmZQwIVqDRZkVgKWZdF
         cOIPzQqxIDKGEOpmUVzTSTInCY5TOpDzjD/5nYN9Sp4mah1ZpT9LU3W9Yyy5cBr82wpS
         FhDg==
X-Gm-Message-State: AOAM530w/T76mlEgYcJRc3O/dGNIft+CqTBFacLKoG7LJMA+g1Bt+K7M
	m/Jyen8uQ7Ah4UXAfJ2ODG5JJJn4i7cz9w==
X-Google-Smtp-Source: ABdhPJzJVsYPcjlZMl4UGYSd/jIzybZRW4K3X481JHpKP8/MszRBdV0Jexrh0L7avTtIStwZrTWy8A==
X-Received: by 2002:a17:902:7ec8:b0:13b:9d7a:6396 with SMTP id p8-20020a1709027ec800b0013b9d7a6396mr8603898plb.86.1633687567030;
        Fri, 08 Oct 2021 03:06:07 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:ad8d:f936:2048:d735])
        by smtp.gmail.com with ESMTPSA id a7sm2082255pfn.150.2021.10.08.03.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 03:06:06 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH 0/2] media: rkvdec: Align decoder behavior with Hantro and Cedrus
Date: Fri,  8 Oct 2021 18:04:21 +0800
Message-Id: <20211008100423.739462-1-wenst@chromium.org>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

While working on the rkvdec H.264 decoder for ChromeOS, I noticed some
behavioral differences compared to Hantro and Cedrus:

1. The driver always overrides the sizeimage setting given by userspace
   for the output format. This results in insufficient buffer space when
   running the ChromeOS video_decode_accelerator_tests test program,
   likely due to a small initial resolution followed by dynamic
   resolution change.

2. Doesn't support dynamic resolution change.

This small series fixes both and aligns the behavior with the other two
stateless decoder drivers. This was tested on the downstream ChromeOS
5.10 kernel with ChromeOS. Also compiled tested on mainline but I don't
have any other RK3399 devices set up to test video stuff, so testing
would be very much appreciated.

Also, I'm not sure if user applications are required to check the value
of sizeimage upon S_FMT return. If the value is different or too small,
what can the application do besides fail? AFAICT it can't split the
data of one frame (or slice) between different buffers.

Andrzej, I believe the second patch would conflict with your VP9 series.


Regards
ChenYu

Chen-Yu Tsai (2):
  media: rkvdec: Do not override sizeimage for output format
  media: rkvdec: Support dynamic resolution changes

 drivers/staging/media/rkvdec/rkvdec-h264.c |  5 +--
 drivers/staging/media/rkvdec/rkvdec.c      | 40 +++++++++++-----------
 2 files changed, 23 insertions(+), 22 deletions(-)

-- 
2.33.0.882.g93a45727a2-goog


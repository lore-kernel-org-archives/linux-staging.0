Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC7072
	for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 07:34:34 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id bb10so12792024plb.2
        for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 00:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lNkTYEXPIHbmXpekiqOnuAZdI8FohljR3op2nnwnxx0=;
        b=DWAoq5cGqkbp1FF7x8O2eZiQADrE6eqcBzUE4TnIDGBmr65wpiEtWB0aVDexviKm8v
         vSJMBsRaoytKLDYmvPuVMZPASYnQOzkywQlsyHdsy3vR/b6ows4/2SoM6yzQSetAH41u
         N7Z56p9LGdLmbEyIqEb8cZWCIn6RIpNH9ORcR5Asypg9LPO99AOl9+ssWF+1vMDnvOmt
         gzl4pkoNZofQJqMTPYLUcYSZKNl8hYGkG/9jE+NjUakyMA/FjcaFTwaf4MZy4htrDiV9
         TuW4SaZ/FmlkptE9BwLzL/1XKHvtaXQrwdbkT/DMpi1pz58eyZE3FaggDOLZ7kTbl5z+
         f0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lNkTYEXPIHbmXpekiqOnuAZdI8FohljR3op2nnwnxx0=;
        b=V/MUYKoUeJwEFYNzdisxggWGqKn0Nzb8swb5xUW7aCkwWw5E508IAm1YMP0trWoGkL
         qd9zVldG6znPxDP6xsJSRy9YiSOFujSyyI8/RhKN9+wAjiJE0yDTCRMFvhghQx8wV5xy
         ABvA68/mYd+CajQVYGplHhKsQqsXKDcKw5bK1PHNfj/9+V05/1/q9nCXzSrZS2nF2NPz
         tzalId9R57uhtmJ5IJnQDvXG9LQJBjkBFpTtvScCC7X65BVZgXp7QMbLQm//h5mMbIyE
         IBs7JNI1wEjC6ykJfqMHWPIZoAXD/CT2pMteD2Tf+pC6d9PcGeabdPMXmOQNHgVDJMuh
         jfEA==
X-Gm-Message-State: AOAM532AOZkm4dp6oGk2eP9Dj6ffh2EP6Wz132kCgPEp8DnZRpytwGod
	Dw7eRkzSZRI2czT+A11jTdk=
X-Google-Smtp-Source: ABdhPJxQJTMFlUza/zA2xNAAjujLphEEfiSE60BOhQ7kccP1aA8GRIiiG+Rpi0IFsQsLhC9iuIdWiA==
X-Received: by 2002:a17:90b:38cc:: with SMTP id nn12mr3761588pjb.108.1632209674273;
        Tue, 21 Sep 2021 00:34:34 -0700 (PDT)
Received: from localhost.localdomain ([2402:e280:2130:198:9b25:1cfb:9ff3:2a8f])
        by smtp.gmail.com with ESMTPSA id x8sm16565957pfq.131.2021.09.21.00.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 00:34:34 -0700 (PDT)
From: Benjamin Philip <benjamin.philip495@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Benjamin Philip <benjamin.philip495@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] staging: rts5208: remove unnecessary parentheses in rtsx_transport.c
Date: Tue, 21 Sep 2021 13:03:45 +0530
Message-Id: <2fdcc64fbfa85482917d229163e4eb6c4094b789.1632209460.git.benjamin.philip495@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1632209460.git.benjamin.philip495@gmail.com>
References: <cover.1632209460.git.benjamin.philip495@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit removes unnecessary parentheses, that have been flagged
by checkpatch.pl in rtsx_transport.c.

Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
---
 drivers/staging/rts5208/rtsx_transport.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rts5208/rtsx_transport.c b/drivers/staging/rts5208/rtsx_transport.c
index 909a3e663ef6..805dc18fac0a 100644
--- a/drivers/staging/rts5208/rtsx_transport.c
+++ b/drivers/staging/rts5208/rtsx_transport.c
@@ -326,7 +326,7 @@ static int rtsx_transfer_sglist_adma_partial(struct rtsx_chip *chip, u8 card,
 	struct scatterlist *sg_ptr;
 	u32 val = TRIG_DMA;
 
-	if (!sg || (num_sg <= 0) || !offset || !index)
+	if (!sg || num_sg <= 0 || !offset || !index)
 		return -EIO;
 
 	if (dma_dir == DMA_TO_DEVICE)
@@ -489,7 +489,7 @@ static int rtsx_transfer_sglist_adma(struct rtsx_chip *chip, u8 card,
 	long timeleft;
 	struct scatterlist *sg_ptr;
 
-	if (!sg || (num_sg <= 0))
+	if (!sg || num_sg <= 0)
 		return -EIO;
 
 	if (dma_dir == DMA_TO_DEVICE)
@@ -635,7 +635,7 @@ static int rtsx_transfer_buf(struct rtsx_chip *chip, u8 card, void *buf,
 	u32 val = BIT(31);
 	long timeleft;
 
-	if (!buf || (len <= 0))
+	if (!buf || len <= 0)
 		return -EIO;
 
 	if (dma_dir == DMA_TO_DEVICE)
-- 
2.31.1


Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8713B20E4
	for <linux-staging@lists.linux.dev>; Sun, 20 Mar 2022 04:23:44 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id kc20so5506960qvb.3
        for <linux-staging@lists.linux.dev>; Sat, 19 Mar 2022 21:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jhlV91ifQAUPW5Se8C3/lqG0qPR8p3g2utUbCEWboO0=;
        b=WBz1/kTJ2ypHPEsIYv8F3KK9hQ7D9UFfHUXFyi9fKSbJLE5fTuf/LZ6rUERk3wRsbg
         1yjR7l+Krktuj3y6uM6J6XJOGbFzd4WHZp9EdLEFaPBcYmoTpg8xtPOA5shm6YPJPcm8
         sk/kPJ/UFFjCLudJG/mloDxWHuLrI4Exyh7iB0DJGwepB89+I7r/yuQS0ZcmfxxEnokk
         m6Ozed4ULIMdY1I5EoxMM24RAd1p+yX16GkjilScS92qNNHdGjDRilxRmudPiPVd1HrD
         pCcIxl0gu4Ssq+JXI8A5v6/l6R2pCFYkoGsPqkl1KnUX/CAzGbK10907BQA9OHUUAp7q
         7tiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jhlV91ifQAUPW5Se8C3/lqG0qPR8p3g2utUbCEWboO0=;
        b=Cs0Y/7YHq8w7k04M0BMHxYOnqYj9BsxXOS6yYPc66YykHx25Uw8qVII4YW7bNXvQeD
         8LGPmUJxTGgbVtzA2IvPl8VdKeo97bYB5uRt9f92JPpmisYlYd036509Ez7JdPUOZX2a
         nmC/woFg2GkxPOUcz2FJBkj0iX1S+r9QmlWtphaTeFwBGGw6twB57cAoSGWsae/qPI2Q
         7Ym7qnFlLc3STlQQcrPAdTJx9cmC6ryZWyHkDWDuUrpxy9opLOWmCpQSP8V5P2w8lXHI
         YDCHLA0rwh1PE6/PB6wwA/v6FpwqU0jOc/SpWbtudzIgl5mJsdHQs48rlFB9L6Beg4Qj
         h0lw==
X-Gm-Message-State: AOAM533zG+6B4t1klDjS7YJy15nXW1qRXt35yzg/oU2ohyeeSgoEjidW
	zn5PmMQuMYSuDxVfAa9w69g=
X-Google-Smtp-Source: ABdhPJxlG6nL/g9YxYseZBTdJyktbe5yYMMIqnD3PBoEAh+c7Xoioxj6d11GSE7Q6a9q56nTPzSqKw==
X-Received: by 2002:ad4:404b:0:b0:440:dee0:4ab3 with SMTP id r11-20020ad4404b000000b00440dee04ab3mr11837169qvp.129.1647750223396;
        Sat, 19 Mar 2022 21:23:43 -0700 (PDT)
Received: from localhost.localdomain ([159.223.186.39])
        by smtp.gmail.com with ESMTPSA id c3-20020ac87d83000000b002e1d1b3df15sm9036463qtd.44.2022.03.19.21.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 21:23:43 -0700 (PDT)
From: "Ryan C. England" <rcengland@gmail.com>
To: gregkh@linuxfoundation.com
Cc: lee.jones@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Ryan C. England" <rcengland@gmail.com>
Subject: [PATCH 2/2] staging: axis-fifo: Fixed parenthesis styling issues
Date: Sun, 20 Mar 2022 04:23:40 +0000
Message-Id: <20220320042340.49222-1-rcengland@gmail.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed open parenthesis alignment issues.

Signed-off-by: Ryan C. England <rcengland@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index dfd2b357f484..4720d6f877bc 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -383,10 +383,10 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 		 */
 		mutex_lock(&fifo->read_lock);
 		ret = wait_event_interruptible_timeout(fifo->read_queue,
-			ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
-				 (read_timeout >= 0) ?
-				  msecs_to_jiffies(read_timeout) :
-				  MAX_SCHEDULE_TIMEOUT);
+						       ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
+						       (read_timeout >= 0) ?
+						       msecs_to_jiffies(read_timeout) :
+						       MAX_SCHEDULE_TIMEOUT);
 
 		if (ret <= 0) {
 			if (ret == 0) {
@@ -526,11 +526,11 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		 */
 		mutex_lock(&fifo->write_lock);
 		ret = wait_event_interruptible_timeout(fifo->write_queue,
-			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
-				 >= words_to_write,
-				 (write_timeout >= 0) ?
-				  msecs_to_jiffies(write_timeout) :
-				  MAX_SCHEDULE_TIMEOUT);
+						       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
+						       >= words_to_write,
+						       (write_timeout >= 0) ?
+						       msecs_to_jiffies(write_timeout) :
+						       MAX_SCHEDULE_TIMEOUT);
 
 		if (ret <= 0) {
 			if (ret == 0) {
-- 
2.27.0


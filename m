Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182BC1993C
	for <linux-staging@lists.linux.dev>; Tue, 30 May 2023 13:52:26 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-53f7bef98b7so2257172a12.3
        for <linux-staging@lists.linux.dev>; Tue, 30 May 2023 06:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685454745; x=1688046745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MZIQCOgBOMHXALjgqieEEifK+z8JLOURT7ke2XH+ZqQ=;
        b=g0SDWp9B4DZcM2zDBU+B8vGC6UW9J4pY9ibR1ExH00e/fECd1sDgW8XNhRm5fgSwpM
         IxpXziEE8B/17sC6bJY8L07SXbRaEibjmlQ9aBZAjevvxdOjGt6RNz1uM9f3dnvpSDHZ
         cFAxFxmM9VsYxMVMwP+1Z7xxpl8AdvMTa6zk+UK1pyiTjMvxXMebBSYjs5/eJc0BxHxJ
         hNtI/ml1jXlCGxq7aX3s3C7ofUI3tmLyQ7mIay+YcA9gw8/W4gtlPSPwyYex3eJouO+x
         JQKBLz5qsbXQl5bweDBmi2DZUt/n+poj3OY+CL207O4PlygQ8MIcfarcn6d11tSQ2qbt
         JBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685454745; x=1688046745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MZIQCOgBOMHXALjgqieEEifK+z8JLOURT7ke2XH+ZqQ=;
        b=aTmfZnx82ypQ6F2hwZGAvEFC8rc2YuCy5UV+MvCLypF9weA/1ompmDdFUVGbYx+/Ng
         MP9lMq7bbh6GN6jdWjLPjk+Yj7efH/voulmX625E0nvtoEHTRJaT20h8lAB3H0IWxamj
         CEqZerYfB++sHBKKyn0iZPQtHUdCrRBkVx+LYFol7ZOKrEQxEfK1/7dhNCXp/oJmCmno
         7WPFyhn84rB+hFuF33zNqAlZkPubPrwUUPsU1hrXUsJlKaVCpXdmkAaRPr9VkzuJSg8u
         EkNeeYlM8j3mRmJHrX2ncAfdYd2lr/kJ4F+rXQuSrlu3nBZG9HDG0GK9G7s8XJLP+xoe
         mZKg==
X-Gm-Message-State: AC+VfDw/2d/z7seyugmr+Ld7jSCMB/QwahkG7w8Jorg4iNQQW51nvM7m
	yvMd0xzmk7N5Xx74NhoW1lY=
X-Google-Smtp-Source: ACHHUZ5yPQK/rwAqbQJJTqIy7YWcl6WdJjYVEsunpe2v1CBi5yYWjYGbfi4xfzLjUPET3PErqG6IKw==
X-Received: by 2002:a17:902:a508:b0:1b0:31a8:2f74 with SMTP id s8-20020a170902a50800b001b031a82f74mr1898293plq.68.1685454745464;
        Tue, 30 May 2023 06:52:25 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:682f:3801:8cf:2f92:e53c:5c4])
        by smtp.gmail.com with ESMTPSA id b8-20020a170903228800b00198d7b52eefsm1461385plh.257.2023.05.30.06.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 06:52:25 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>
Subject: [PATCH v5] Staging: rts5208: rtsx: Removed new line in else and else if
Date: Tue, 30 May 2023 19:21:20 +0530
Message-Id: <20230530135120.37637-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed new line in else and else if,
this warning was given by checkpatch.pl

Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>

---
Changes in V5
	- Moved else and else if to the same line
	- Moved comment on else and else if statement to inside of it
---
---
 drivers/staging/rts5208/rtsx.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rts5208/rtsx.c b/drivers/staging/rts5208/rtsx.c
index 2284a96abcff..3f06db93e176 100644
--- a/drivers/staging/rts5208/rtsx.c
+++ b/drivers/staging/rts5208/rtsx.c
@@ -382,27 +382,21 @@ static int rtsx_control_thread(void *__dev)
 		if (chip->srb->sc_data_direction == DMA_BIDIRECTIONAL) {
 			dev_err(&dev->pci->dev, "UNKNOWN data direction\n");
 			chip->srb->result = DID_ERROR << 16;
-		}
-
-		/* reject if target != 0 or if LUN is higher than
-		 * the maximum known LUN
-		 */
-		else if (chip->srb->device->id) {
+		} else if (chip->srb->device->id) {
+			/* reject if target != 0 or if LUN is higher than
+			 * the maximum known LUN
+			 */
 			dev_err(&dev->pci->dev, "Bad target number (%d:%d)\n",
 				chip->srb->device->id,
 				(u8)chip->srb->device->lun);
 			chip->srb->result = DID_BAD_TARGET << 16;
-		}
-
-		else if (chip->srb->device->lun > chip->max_lun) {
+		} else if (chip->srb->device->lun > chip->max_lun) {
 			dev_err(&dev->pci->dev, "Bad LUN (%d:%d)\n",
 				chip->srb->device->id,
 				(u8)chip->srb->device->lun);
 			chip->srb->result = DID_BAD_TARGET << 16;
-		}
-
-		/* we've got a command, let's do it! */
-		else {
+		} else {
+			/* we've got a command, let's do it! */
 			scsi_show_command(chip);
 			rtsx_invoke_transport(chip->srb, chip);
 		}
-- 
2.25.1


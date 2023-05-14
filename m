Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FADD1C08
	for <linux-staging@lists.linux.dev>; Sun, 14 May 2023 06:52:42 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-64ab2a37812so13114407b3a.1
        for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 23:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684047162; x=1686639162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fyq46DYiYFeczNtd5py4N6kycWAKUkPxuVjsobEQu/8=;
        b=CERCoTYfkyyRChuQXQEGV7ZqIc6UqCzzpaPg367AFt4hA6jofj4+mGeG95BttbwTYg
         5F7Tdsxlxqj6ETKb5eQMi8S/FmCRLtKG5c3tCknUESHw7+UTtkb+NNMBs/eFeHCYkxVf
         ODVa6n4sp0Nw+4NhNsQplk1aGg0q37xRfLtmB1sBYReRbzSqlTDLRJ+DRaV5LIj0U1tX
         npRhfadLTeU9kFDY6RHr9z9dJF66fW6VZ9MxDVXNDz5fAMMePhRjFj5vR/L9NyBcRfx7
         83cYU1gqXV8IdsKDa9UJ6gKg1gU6ql7Y20TWrU85Ie5iDvlICyxidFVl3jOZhC4tXvsq
         Wq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684047162; x=1686639162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fyq46DYiYFeczNtd5py4N6kycWAKUkPxuVjsobEQu/8=;
        b=PTfNsFI/H9FK5UHCHDl4yWeeTybDwvcxwu3WpMCIQEz6aapH3OEaBgB2dsLVnCnoIl
         WAqRuy6KS0wbDOIO0JJgQpaBV79dwRLzBuHY2xNUu6xuMia8B3opmBX7ZbT8sNL3ljic
         BUM7E3otYcc3xVrbW21kScFMJkpDUe9pS+WaET2bAh6xKt3ruqMuiC09/XeE2q1p7zRR
         knKITJXxkOLtxmTmmpNLy6LBLDW9mxxWN2n+sSk8OrHs7kP1eVw5SCcHiI7QcLyzKl+a
         mCcoGnR4v4Q4SqfwR7QaztFDZl4GVqKSIlDuuPHb+MMHioy3ZuJIPquJoPozxrEJZgmq
         oZ3g==
X-Gm-Message-State: AC+VfDwPPFSmlDJ1ZQPBI2Z5zKG5uHlVidSmkyy+TTC8n54FovNueKfx
	8cEYA+h4KwMbGsZqt8o4lsQ=
X-Google-Smtp-Source: ACHHUZ7QRGKi5O7EJ5OFWTWGUsrkoDk9VuXnjdXKkNCkx4qJGQu7zSG3S6jpSGS8keN/1GWl7wPsZA==
X-Received: by 2002:a05:6a00:1502:b0:647:157b:cb61 with SMTP id q2-20020a056a00150200b00647157bcb61mr23477519pfu.7.1684047162202;
        Sat, 13 May 2023 23:52:42 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:682f:3808:c449:77a9:2cbd:238f])
        by smtp.gmail.com with ESMTPSA id g17-20020aa78751000000b005aa60d8545esm9569943pfo.61.2023.05.13.23.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 23:52:41 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>
Subject: [PATCH] Staging: rts5208: rtsx: fixed unbalanced braces around else statement
Date: Sun, 14 May 2023 12:19:36 +0530
Message-Id: <20230514064936.7895-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed unbalanced braces around else statement

Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/staging/rts5208/rtsx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rts5208/rtsx.c b/drivers/staging/rts5208/rtsx.c
index 2284a96abcff..0ab9355873f7 100644
--- a/drivers/staging/rts5208/rtsx.c
+++ b/drivers/staging/rts5208/rtsx.c
@@ -399,10 +399,8 @@ static int rtsx_control_thread(void *__dev)
 				chip->srb->device->id,
 				(u8)chip->srb->device->lun);
 			chip->srb->result = DID_BAD_TARGET << 16;
-		}
-
-		/* we've got a command, let's do it! */
-		else {
+		} else {
+			//we've got a command, let's do it!
 			scsi_show_command(chip);
 			rtsx_invoke_transport(chip->srb, chip);
 		}
-- 
2.25.1


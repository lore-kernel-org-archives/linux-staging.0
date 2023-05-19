Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87ABF6FAF
	for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 10:02:38 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-64d30ab1ef2so397864b3a.2
        for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 03:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684490558; x=1687082558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bzq3Pqk8pZIS4OBKRNMcHxRAHqoQcIGGMgWTxxeCr8o=;
        b=b/fsbDPtKzkSjhJgYBibHq2FGgZEylRkGne9JM3bSu5YcnPkTHJwBC5AWTG1z7Zo/v
         PnRJb3YgltwgODJqQdXmY7di2wO+CKBmkCtEV5H9qHVbDgLaqS9b9KfPPSFYW2+4PRPY
         wLo0l4b1nR9LjZbB9QCsZaUyHFyniIfjFVftw//Hj+EhBdHntDeXTNNELfbpvQy1sXDt
         ccOd0RAOtOEwelVloU36T4pkF0HPVBSqijaNH7ZD5KqWoI7Vz9149hCpjEsn18bsyFUA
         oir4/aYRaplYGlf6ajbPLZQF8YIJWdMZ6Sgq5iFrtCVvoBxcJUSm85jVwa94/1Cr3Atj
         zofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684490558; x=1687082558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bzq3Pqk8pZIS4OBKRNMcHxRAHqoQcIGGMgWTxxeCr8o=;
        b=l0/Ibd96KWTsMDeQ/RJkTvhl+fqc6/1341yumzPmNgDLViTXQFWIZZNIQQipStHVaX
         YeGgnkKTlLOwqwc9dMVldrav6J5TlffoP+fKhMqpo2rX4rGrigk20BcfONKkr6ugf+c8
         SIR8dKOawxfZTDo2MJYKNKLo5qt1RrWlKLKvj00Buf+e9ytjdPACZoJWVordOGu3FLB6
         yX8xudo97QshU6lj/DUt+E+Oa3fugytj7L1xRlyEJ2DUlEB+fz4vRu2GMaN5z5BtOWwN
         9JCYCRtg3IZsA+k5mwjOu0/IZIapaSGppV6t1BU+xXG9MPVaWiUQiKLXK6S3UsC1zAFt
         im4A==
X-Gm-Message-State: AC+VfDxmy9UpOjvxgIs0D0CRh98R8V1e9Po6rN2coSHrZG7ut03xof/t
	3Z9aZ8qk/6aXoLCjZ345obM=
X-Google-Smtp-Source: ACHHUZ6TuoypXaIzwGV7YKg30OUvIQCRjONVjfDFaTmc/vZITR66LGJJYCushdEgWVyNpsMp66BPFg==
X-Received: by 2002:a05:6a20:9384:b0:105:b4e:ed71 with SMTP id x4-20020a056a20938400b001050b4eed71mr1939878pzh.32.1684490557737;
        Fri, 19 May 2023 03:02:37 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:682f:3808:92bc:26c4:ce02:816b])
        by smtp.gmail.com with ESMTPSA id i5-20020aa78b45000000b0064858e255d1sm2673663pfd.65.2023.05.19.03.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 03:02:37 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Deepanshu Kartikey <kartikey406@gmail.com>
Subject: [PATCH] [PATCH v2] Staging: rts5208: rtsx: Moved else statement to same line with else if
Date: Fri, 19 May 2023 15:31:19 +0530
Message-Id: <20230519100119.25482-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Moved else statement to same line with else if,
this warning was given by checkpatch.pl

Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>

...
Changes in V2:
    - Moved else to the same line with else if
    - Moved comment on else statement to inside of it
---
 drivers/staging/rts5208/rtsx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rts5208/rtsx.c b/drivers/staging/rts5208/rtsx.c
index 2284a96abcff..47dacef0aaf8 100644
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
+			/* we've got a command, let's do it! */
 			scsi_show_command(chip);
 			rtsx_invoke_transport(chip->srb, chip);
 		}
-- 
2.25.1


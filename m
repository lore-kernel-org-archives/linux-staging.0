Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F406108
	for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 10:06:16 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-52caed90d17so2134133a12.0
        for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 03:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684490776; x=1687082776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bzq3Pqk8pZIS4OBKRNMcHxRAHqoQcIGGMgWTxxeCr8o=;
        b=QheMzGRBNCM1TmgnZZMsfP41tBTiLKXVvJPnLmJPpegqx4NsudjPei3sxTIdOSBAtT
         8AzaTLQKGJ7HBwQfL8z5gRT6ekx9bGu18fjcUJ5zEO1U3k6+IDEeZIbPlKOAGoQniPdp
         WOudB7omPlsQC0V2h1ae1caVeHGxQGeBkNefDvRjtc2Ualb11wUu0p8qtXGDCDcUGaAn
         1OrT/5ul3/laL2UNP+WyGKa65Shoc3MBAfChe98dq4S3XjCFaHXB62mlghDu208q8e9B
         CSwc50Mdm9ZkR58dK31Dr4mutXq1ldwSCoKILoMPcaNFr9Yt+BA2TBGJYw3DJ0ogajqY
         8fmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684490776; x=1687082776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bzq3Pqk8pZIS4OBKRNMcHxRAHqoQcIGGMgWTxxeCr8o=;
        b=ev49WQ1HcMpvd5CGjDRBz93pFf+KwHWYKg/Ojg7JZ0NhUHPfkAvL2z4FLr7JOiMeEP
         J3rWJiIPVKy6M/PnpNoz7C5SO9xsFwErFFWj3Ur1gaPh+3DvNgMlwJ8fhNa4h+T73saP
         miciSv4Wj64i93hQdPHfIaw+xBlRuDPEi5JsOlykCpBARAGXrDOJDZU3p6yAQeaHt+NJ
         DCam7kWlhoIrULpOs73EidAz0RWdzkEkircuOdjpBFoEgxxb1MRulcvXkOZ/1MASkLqC
         DlXJ+muWDBshujWrQN4bK//VgJtIMbcpQdxapoGRgCSz6ao5hJZx6eT0hXrzfGQUKj0Y
         aXjA==
X-Gm-Message-State: AC+VfDyQ6olLpHsQRaJ50JNliXeNkebnODJP357giBK0Ewr9wHP9xpJC
	hX6GLNd0mImqmWOLyATxhZk=
X-Google-Smtp-Source: ACHHUZ7Rxa7TBsEKIb7oCDpopFvMxtvzIC3bSiVEQjPTgEZP2AoYJKbEQyPphXQiCul2S79KyXIo5Q==
X-Received: by 2002:a17:90a:d188:b0:253:4212:9157 with SMTP id fu8-20020a17090ad18800b0025342129157mr1764152pjb.28.1684490776157;
        Fri, 19 May 2023 03:06:16 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:682f:3808:92bc:26c4:ce02:816b])
        by smtp.gmail.com with ESMTPSA id ev23-20020a17090aead700b0023cfdbb6496sm1163733pjb.1.2023.05.19.03.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 03:06:15 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Deepanshu Kartikey <kartikey406@gmail.com>
Subject: [PATCH] [PATCH v2] Staging: rts5208: rtsx: Moved else statement to same line with else if
Date: Fri, 19 May 2023 15:35:58 +0530
Message-Id: <20230519100559.26173-1-kartikey406@gmail.com>
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


Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C456AA0
	for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 10:20:16 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-53469299319so1423916a12.3
        for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 03:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684491616; x=1687083616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wba1YArvykmSZksSn+PRwHxHWmhMmfjRVISgjVjCTk4=;
        b=de0+lVs7fkMKCXKZN1Uo3v1hZWz7Q0rLROV5fVLqv8ZK4RiAwZ4ihjvw9OXZc0TjWZ
         /zXm+CgtQcIJ9lctzjY613itfA6hAd10/oaQX+Uim+w8FDQey/YmF6rmFEEb0mYbeO8S
         PDKb2qdfHgSlBS+LD2+OcTziblsjhcIZP44+9ZPqUvPDcxqPnCYsWA5pIA8uFbmn2YGX
         jXnkaJA/Nk0gPNdc80IbR5sKerOv512segljfyJCBc5XqQKOx/Luksx+uEp/cNwcIh+y
         tSTXMOuqaTHfSPxKIBjS98V1MKWJXtinmIwKWXU9LoW3lnE2PLBoYJXCVL0r6G402lzb
         ZolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684491616; x=1687083616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wba1YArvykmSZksSn+PRwHxHWmhMmfjRVISgjVjCTk4=;
        b=FyajafbADITNb0PQikFldJ1WtM6Ox0b6NqLElgVJPcvqVqUCttBWMxv7/nTT5jmEgO
         CQ3SM01IyIF7mG8C16FO6BtZPU9SricfTnL5kSHUxcoliIiUZ4fIuU4AlM6fuYvNRZaU
         qboasem6G8X8DmmsNr3mEnFjQGkAK4yjoE+0oU6mn6ZZr3wTkoawjdqZTZwSgzyCN3l2
         bh2zRal6yQyrJNIe31h9gukbjQbrSZR/jjxHY0Fk0V/1m0Edc+UotgmI93jLOjb2K59z
         ei4C+/ZbmQHDE7U/OAF2OLwVMQQhXlUkgmxKcnnKFGsfAFTKYJjrpDWSHgcuyqzHkznM
         neBA==
X-Gm-Message-State: AC+VfDwDIWu9LFrw1QtDirV7z3ehrV+jgHgoph1OuRaqti5e9EuouYpo
	hfWQU910VQXuXVBRjYFfbis=
X-Google-Smtp-Source: ACHHUZ4iDDAHgVYfvn93q6kUTIsh196jK6e4uGk1QBRgVFTeo4UoDjg08LB76NZrjlzPoz0t7WrbyQ==
X-Received: by 2002:a17:90a:8c10:b0:250:1905:ae78 with SMTP id a16-20020a17090a8c1000b002501905ae78mr1651705pjo.15.1684491615776;
        Fri, 19 May 2023 03:20:15 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:682f:3808:92bc:26c4:ce02:816b])
        by smtp.gmail.com with ESMTPSA id t7-20020a17090a3b4700b0025374fedab4sm1239643pjf.22.2023.05.19.03.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 03:20:15 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Deepanshu Kartikey <kartikey406@gmail.com>
Subject: [PATCH v2] Staging: rts5208: rtsx: Moved else statement to same line with else if
Date: Fri, 19 May 2023 15:49:20 +0530
Message-Id: <20230519101920.27342-2-kartikey406@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230519101920.27342-1-kartikey406@gmail.com>
References: <20230519101920.27342-1-kartikey406@gmail.com>
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

---
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


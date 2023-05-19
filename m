Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7CC6AA0
	for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 10:20:11 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-253570deb8dso1690038a91.1
        for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 03:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684491611; x=1687083611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wba1YArvykmSZksSn+PRwHxHWmhMmfjRVISgjVjCTk4=;
        b=r+7NWjZWVcWmma20ropjBAVlRiDX88ySFCqwHU/iGNGMjO4nwzeYgtuz2/2mYn7sbd
         2duhvUxTPNcRZfDYB8iNwLX9J3x0Cj/NiP7qlNjf1+kvk3EUbhLdayVpvye8f6LE/l0m
         tB2poaw72qFJmc3Dv/aMLEeN1QWbUlm08z+cq9hqyr9VG3Ujqavzh3+p6hqTbGlhbAa+
         9/CGpc/6uBRzuNwGghhybADvueP5g/TpMG4c0i50zQzhkavYr01AAwhDeyclrpnyfgCT
         afQEgmm5aCJjjW+ijynifNz9VJZ3ORZDq+3gRN8yEQId4l1CB1BAW0HV4tCIAj7mRrtW
         +E3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684491611; x=1687083611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wba1YArvykmSZksSn+PRwHxHWmhMmfjRVISgjVjCTk4=;
        b=D4N8KYACiaqt0VCyLGrmx3aUv+WxxFgRJRWpDCEMUqLdvu2OVfVqKsD62ErXlE54v9
         KMFvMcT5lUDRFRMqWk5MXCBZUele1VZ0Jk5bjFwZnCF4dWfzoqbUH2GaHPZWWzedG8yl
         FAR4VwMj1wPwN82Pk2pQQCZ7sfpQV3BY/FbmmEDL7ZQD4SeJW9wm41Hkm3EBqLq4uEHl
         JjNYorwCDTYixz0mEqcr0Wm7EtBQxP6xFc1qFuf9jJltIzBxsPm4XlvvmdBe+ggzHe8E
         /RB8wLwQNsr326o2XAz9WfDdYkhuEx6sUOmg+dm8zXk9SSRx7ontuA6RZocYZ91lKAT+
         ADQw==
X-Gm-Message-State: AC+VfDzWKZineVOvqp4w5exoQrcfuJiOEUMTSn43a+k8WAh8GBOMlFq6
	QdEGbKJeMHueHoEkiTSzkFU=
X-Google-Smtp-Source: ACHHUZ6SUGdXo0L79y50osdj51y3rTdr1BqzA3o2k+ZO/cPnnVD/3MDRCNTkiyZLCFaPTV/cEAt2Xg==
X-Received: by 2002:a17:90a:2e12:b0:253:3ce4:b421 with SMTP id q18-20020a17090a2e1200b002533ce4b421mr1721376pjd.1.1684491611042;
        Fri, 19 May 2023 03:20:11 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:682f:3808:92bc:26c4:ce02:816b])
        by smtp.gmail.com with ESMTPSA id t7-20020a17090a3b4700b0025374fedab4sm1239643pjf.22.2023.05.19.03.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 03:20:10 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Deepanshu Kartikey <kartikey406@gmail.com>
Subject: [PATCH] Staging: rts5208: rtsx: Moved else statement to same line with else if
Date: Fri, 19 May 2023 15:49:19 +0530
Message-Id: <20230519101920.27342-1-kartikey406@gmail.com>
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


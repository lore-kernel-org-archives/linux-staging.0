Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E8CA3D
	for <linux-staging@lists.linux.dev>; Tue, 30 May 2023 02:23:41 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-52cb78647ecso2403414a12.1
        for <linux-staging@lists.linux.dev>; Mon, 29 May 2023 19:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685413421; x=1688005421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F7yxoBalJu1ZCTXrRuET/e/J8+mI0agu1V6HCaCfZ5Y=;
        b=JInACbaRG6zCY54oNSpmPgvZZumFjCPunkuf/OzCrnpLD69mSnpE4jRqYh1leO/FvZ
         j+0KrSwqplZ2flR8iwKpTRSeYdkMHKFqEOY8eF/xG+NqllhjxsecM7R/jxLGWLrQeTYy
         uQRjPMMDA5PyDPTlgHT+08D8KFINy9sEz7vOSojUnNlScDO8HD/lAmMgLA2vrlBgoZi4
         OuQ9oPUx47kDoIO7ZRoGDoTr4NFi862+JQSooIP7fppA57LipQ5PdV/jLs4ydSs9MK8C
         ywpuTKcqaK2Ucw8g0nC7aEEKAIIi1uOFqzVNv5O3hoDlJdB/39D5vX/Ys3XtxKF12Akg
         6pZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685413421; x=1688005421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F7yxoBalJu1ZCTXrRuET/e/J8+mI0agu1V6HCaCfZ5Y=;
        b=Jl78CiXXNHgUK1sYqaOqMij6AXaKk8H2V0qd+wc/iDBjRrfeOTh7qb2exUkbOc1ebb
         jBO2gA2l1pA81EVAwA2H4aSUOrLBB3rkX8eL1/uixF9J6U55QWrPiS3pGfYu6J9L5UUb
         YmeVxz9kCGgfDRcY2U6viDaaqB550Y+e472g6b0PtUa9rF/tK1/oHC9PyjP92CLVrTJP
         RuCbnvsaR10Tid09cpV7xhLAL8KQ5M7cMuCmTDn+KyLqMF1lf3mZ9xln/77uxSe3+9f8
         Rgci67pXnwsYqFsGZLZtiJpJPqfagJKMRPCb4lBex14f3yQK2gjn3LR36AaOCuZHLYYQ
         JutQ==
X-Gm-Message-State: AC+VfDzFdRFwNs6gRR8khSJFCS66Hn+eGK4oJYV71oDIWEnlctsW1Jxj
	UyFTjkF2Yw97wy44x3ARV4g=
X-Google-Smtp-Source: ACHHUZ4vB8xYir+2LzLQmGt/Drl5uVOTpk3tEFPqW+VM/JpJ/UJY9c9iUM6YYMknkbkVQS0OBTEOYA==
X-Received: by 2002:a17:903:124a:b0:1af:daf7:7240 with SMTP id u10-20020a170903124a00b001afdaf77240mr946768plh.58.1685413420941;
        Mon, 29 May 2023 19:23:40 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:682f:3801:cfd9:6060:fe9:235b])
        by smtp.gmail.com with ESMTPSA id u6-20020a17090282c600b001ae6b4b28adsm6236998plz.130.2023.05.29.19.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 19:23:40 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>
Subject: [PATCH v4] Staging: rts5208: rtsx: Moved else statement to same line with else if
Date: Tue, 30 May 2023 07:52:59 +0530
Message-Id: <20230530022259.24094-1-kartikey406@gmail.com>
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
Changes in V4:
	- Moved else to the same line with else if
	- Moved comment on else statement to inside of it
---
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


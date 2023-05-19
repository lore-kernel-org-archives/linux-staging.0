Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5506420F2
	for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 10:09:14 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-64d3bc502ddso241560b3a.0
        for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 03:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684490954; x=1687082954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bzq3Pqk8pZIS4OBKRNMcHxRAHqoQcIGGMgWTxxeCr8o=;
        b=OJam3IMO9AgyKpxdwOimHPpW0Y49CHC5KRE5ZlwDcE5T8WhEmlo3Ct54blrPovaupf
         CFaI9uTdtq2zP5gjlXUpJ4ZAB8bX3Ynhp6bKrBX44KCWK5iklRbJ4HBlNShGF8ZNf4ab
         Ykv2NM7I92qqDk46tPADtyPid0sNpk/+2xOkte1PtJIAe0Jb5Q8iWtsFt6OdZwV3q+lG
         s6Lx3Rtt/K9nDTpFbCRHgXWEC2iqoajdhG/4EXBxIc+PZGxouJqqXS0UgouUSdGoJJDQ
         V8wKLVAMJcelRB3+r4qOiFV4PX5GTtkhkGCPSvTbLyaEQbAzrei3xrn3PSx2ISmeoB+6
         +uKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684490954; x=1687082954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bzq3Pqk8pZIS4OBKRNMcHxRAHqoQcIGGMgWTxxeCr8o=;
        b=BaoEli980xbgnuy4xG05yP7wqh+qZ+GFI0plrko4jFh87P0BOIkkofZNEQitTxKzDE
         XfbjPrqDsFap+z2FRB51vI32r4OdZRjSItK+IFkqUPX9LymZr6bsFklujprz4kVO4dU8
         eH5TN8hDIdY3xAwiGe3xMueHOvqNvfB5/ax+/1a6NpV6N0cg7iWWmOIxsVTIRipQIE7z
         z+T1UPrIkfOW5m1qBPvzyopBWz7+aK2f2bY0/OqnzTYoU2T1GPrMYjBcofdnnq4RVUQq
         0MQKU0XlCKfAYYOgDRdNZrLYUdzjpWf8PkJQpKtg+iRZt7b93H6k73ORfa/YeBnRam3b
         oP8A==
X-Gm-Message-State: AC+VfDxzj2ZzgNS3uKtAh0kNkAK+9UOwjaoYqXawTvTroHVcFpkTkX9o
	4vf9TnFnL1HLUvkz2Ri+5ck=
X-Google-Smtp-Source: ACHHUZ6tDkUURnf4GoTlMypuJO/5CCs2NmlipjXwYx9bn8Zn090gRWIw5rXermFNfH2KRWXGqbJ6YA==
X-Received: by 2002:a05:6a00:2490:b0:63d:3f74:9df7 with SMTP id c16-20020a056a00249000b0063d3f749df7mr2781219pfv.34.1684490953774;
        Fri, 19 May 2023 03:09:13 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:682f:3808:92bc:26c4:ce02:816b])
        by smtp.gmail.com with ESMTPSA id g10-20020aa7874a000000b006439ad979cbsm2687554pfo.152.2023.05.19.03.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 03:09:13 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Deepanshu Kartikey <kartikey406@gmail.com>
Subject: [PATCH] Staging: rts5208: rtsx: Moved else statement to same line with else if
Date: Fri, 19 May 2023 15:38:57 +0530
Message-Id: <20230519100858.26508-1-kartikey406@gmail.com>
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


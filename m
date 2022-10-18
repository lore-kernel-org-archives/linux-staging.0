Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9434C8A;
	Tue, 18 Oct 2022 16:04:05 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id r22so18526112ljn.10;
        Tue, 18 Oct 2022 09:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=APq/4ao2w3wM3w7dcXNTLMlvNyes52nnBtuQjcx7EAg=;
        b=mAYUdBVX9g0h7NVEsuArwdO+JSkTYINBI9eZ9SZP/HN1C28OzOzJFvyKJ7HWDvfuR+
         ncjq9cqJiYAoowUdIMYtYwgu2CBQnKus2tJAPA8Wbv25BnCyqru7+yMa0n1Wc/g/b+tJ
         LYDVxVxEyeXNaZclFdXvci+Bn8Hd2IlqxBU+6QRev104SvVpDc5r8rI7mjqlJ8z57vKa
         T+d9YFon6GhU0JC5SBnQt1DQRpBiVFGkOizCTTxQePe274xFh4s+7Paymc8y/UsfZn1k
         m7syJJNF9ptZ8MZHEKbEkunJ+svNoDlC+HXUM0w2et72jP1HztzI+RkLlC7QPZI/PtHI
         Eo1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=APq/4ao2w3wM3w7dcXNTLMlvNyes52nnBtuQjcx7EAg=;
        b=RSeL2cwpaRSn2uqKu2VmIr+K99/xuWfeHD0lplajHSnbepY5f4QLl7XtQWs70u/YJu
         dHXqRZyHz1rlcqPo25XIe/us2vX6NEs7KvYO7TeRonzeuyKm1d5HHOjlszBcA1XnJQap
         5xUyk3F3cQAq18N5nbSuKUA0wRILiTdEbD8aaTwYdWSmm/btwYK+p45MMIg/5xEs8wp9
         Yk0lraC/X1cjIfid90AUwzAUU/aCm7AKCSMmjp4Tbn0M0HFuOsv4vWWuoZtNE4b70qZV
         1ppfC5KnQVvwR+HrYHI9g3gOcKvGz1c1DWxwBpOIgXNTdVR3lYigqDN1EG2xWtGDBwwi
         tJ7A==
X-Gm-Message-State: ACrzQf1L1CND5JJsbi72POQQFsIN9LPuFH9v0vil3oSoXwLGBb2QwBex
	A8zlU632onBnCOll2aQGYI07YAYHvI7M8rv0
X-Google-Smtp-Source: AMsMyM78/En+eyLIgaDhn666Ec/5nqOrgtZGxs9ntdlCa6Pxh2z0qVC5KTLlHL1Li9Y18RJ5qV4wZQ==
X-Received: by 2002:a05:651c:194a:b0:26f:decf:a6b5 with SMTP id bs10-20020a05651c194a00b0026fdecfa6b5mr1392362ljb.240.1666109043367;
        Tue, 18 Oct 2022 09:04:03 -0700 (PDT)
Received: from elroy-temp-vm ([20.240.130.248])
        by smtp.gmail.com with ESMTPSA id v8-20020a056512348800b004a25468d86asm1905039lfr.68.2022.10.18.09.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 09:04:02 -0700 (PDT)
Date: Tue, 18 Oct 2022 16:04:02 +0000
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: [PATCH v2] staging: rts5208: Replace instances of udelay by
 usleep_range
Message-ID: <Y07OcqPNjSihOByt@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace the use of udelay by usleep_range as suggested by checkpatch:

CHECK: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.rst
+               udelay(30);

CHECK: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.rst
+               udelay(50);

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---

v2: changed the max values of the usleep_rage instances as they cannot
be equal to the min values as suggested by checkpatch

 drivers/staging/rts5208/ms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rts5208/ms.c b/drivers/staging/rts5208/ms.c
index 14449f8afad5..a9724ca5eccf 100644
--- a/drivers/staging/rts5208/ms.c
+++ b/drivers/staging/rts5208/ms.c
@@ -3235,7 +3235,7 @@ static int ms_write_multiple_pages(struct rtsx_chip *chip, u16 old_blk,
 			return STATUS_FAIL;
 		}
 
-		udelay(30);
+		usleep_range(30, 31);
 
 		rtsx_init_cmd(chip);
 
@@ -4157,7 +4157,7 @@ int mg_set_ICV(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 
 #ifdef MG_SET_ICV_SLOW
 	for (i = 0; i < 2; i++) {
-		udelay(50);
+		usleep_range(50, 51);
 
 		rtsx_init_cmd(chip);
 
-- 
2.34.1


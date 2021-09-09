Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7102D3FE1
	for <linux-staging@lists.linux.dev>; Thu,  9 Sep 2021 11:59:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7BA946329C;
	Thu,  9 Sep 2021 11:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631188791;
	bh=GRhJGOE30nH8bfCQst7rI7i6KlEzDKNJgdHyLz+qXcc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YjI1kk8/vnpazE1FdIi2n4kIDCrBTUkTnyarez3hihIUuoMnC4NLCBYqae/r46l5H
	 yHNEx5lJFrHvii35jq+vtiKuV+zT5gk/WCE1yLb0vgGxdsJBlCk8flchAzEV9oKBz8
	 cw3SWBmtyGqu0c61jeeFm4Qx0JNvF0+cgNiT2JsrLYJ7vqI7Pl5vZFScX/Y1cunuYw
	 tKLCLeB2iKdYVlU1TP07ZiI5/EmWoW3CgrMqKaiMIzoT1Mc1r/AoVFhhWYvEYBZB1+
	 Qe14h3hqt1Xk9peDh3h3G88WJlKrgwtop+cf2srHZ43s6CfR2HowgsrzGWhf6GdAZm
	 YPGV9hxuTm1cw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.14 40/59] staging: rts5208: Fix get_ms_information() heap buffer size
Date: Thu,  9 Sep 2021 07:58:41 -0400
Message-Id: <20210909115900.149795-40-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909115900.149795-1-sashal@kernel.org>
References: <20210909115900.149795-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Kees Cook <keescook@chromium.org>

[ Upstream commit cbe34165cc1b7d1110b268ba8b9f30843c941639 ]

Fix buf allocation size (it needs to be 2 bytes larger). Found when
__alloc_size() annotations were added to kmalloc() interfaces.

In file included from ./include/linux/string.h:253,
                 from ./include/linux/bitmap.h:10,
                 from ./include/linux/cpumask.h:12,
                 from ./arch/x86/include/asm/paravirt.h:17,
                 from ./arch/x86/include/asm/irqflags.h:63,
                 from ./include/linux/irqflags.h:16,
                 from ./include/linux/rcupdate.h:26,
                 from ./include/linux/rculist.h:11,
                 from ./include/linux/pid.h:5,
                 from ./include/linux/sched.h:14,
                 from ./include/linux/blkdev.h:5,
                 from drivers/staging/rts5208/rtsx_scsi.c:12:
In function 'get_ms_information',
    inlined from 'ms_sp_cmnd' at drivers/staging/rts5208/rtsx_scsi.c:2877:12,
    inlined from 'rtsx_scsi_handler' at drivers/staging/rts5208/rtsx_scsi.c:3247:12:
./include/linux/fortify-string.h:54:29: warning: '__builtin_memcpy' forming offset [106, 107] is out
 of the bounds [0, 106] [-Warray-bounds]
   54 | #define __underlying_memcpy __builtin_memcpy
      |                             ^
./include/linux/fortify-string.h:417:2: note: in expansion of macro '__underlying_memcpy'
  417 |  __underlying_##op(p, q, __fortify_size);   \
      |  ^~~~~~~~~~~~~
./include/linux/fortify-string.h:463:26: note: in expansion of macro '__fortify_memcpy_chk'
  463 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,   \
      |                          ^~~~~~~~~~~~~~~~~~~~
drivers/staging/rts5208/rtsx_scsi.c:2851:3: note: in expansion of macro 'memcpy'
 2851 |   memcpy(buf + i, ms_card->raw_sys_info, 96);
      |   ^~~~~~

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Kees Cook <keescook@chromium.org>
Link: https://lore.kernel.org/r/20210818044252.1533634-1-keescook@chromium.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/rts5208/rtsx_scsi.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rts5208/rtsx_scsi.c b/drivers/staging/rts5208/rtsx_scsi.c
index a401b13f5f5e..c46ac0e5e852 100644
--- a/drivers/staging/rts5208/rtsx_scsi.c
+++ b/drivers/staging/rts5208/rtsx_scsi.c
@@ -3026,10 +3026,10 @@ static int get_ms_information(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 	}
 
 	if (dev_info_id == 0x15) {
-		buf_len = 0x3A;
+		buf_len = 0x3C;
 		data_len = 0x3A;
 	} else {
-		buf_len = 0x6A;
+		buf_len = 0x6C;
 		data_len = 0x6A;
 	}
 
@@ -3081,11 +3081,7 @@ static int get_ms_information(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 	}
 
 	rtsx_stor_set_xfer_buf(buf, buf_len, srb);
-
-	if (dev_info_id == 0x15)
-		scsi_set_resid(srb, scsi_bufflen(srb) - 0x3C);
-	else
-		scsi_set_resid(srb, scsi_bufflen(srb) - 0x6C);
+	scsi_set_resid(srb, scsi_bufflen(srb) - buf_len);
 
 	kfree(buf);
 	return STATUS_SUCCESS;
-- 
2.30.2


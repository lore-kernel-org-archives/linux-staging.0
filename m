Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2BD432313
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 19:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970633; cv=none; b=HlRVE/mqWdmzt+0JLDGHfy13gCFZY20nWbX+vir6ogHYUrpmkeyXSN4R2/hOlyPDfeeb6OQv4diKjW7YojmNiCcKJPMEmNld8miv96Phx4QNVCsgPZttRZv/U3LT1Pi5y7C3ljIlNSa3pJfDSDplvUCcl0kSwU+d4zUt97EACac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970633; c=relaxed/simple;
	bh=jPry0ZxZWH2qI0ULrUX+JCx/FGm9iZZhCbMohyCfLZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pE2eX4/P2tf/C2gXgsshQsQKctcaQNEchPvrIAEBvR92++hsrlQqDZggdzlU4q0C5Qfp9ruG1JEMetQ2qD6xRiT1Tpg/lcOp0lkEnj3K3cLTOCbigJKm7pVz9Pubfxm4xseCXwE7B1MRh5AnLH0q4aqsJ5Mxp68BujC/tsmkIdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=E1NSgxtK; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="E1NSgxtK"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-144f79153f5so485581c88.0
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 12:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790970621; x=1791575421; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c+Pr+0S1JlOBX/miOeDu7Q4SuyRTaEP5yuhanTP5lUc=;
        b=E1NSgxtKfk1KVdoZtMsTAZ581lpJvmyQCQOi8nZJCIuQcCI6A+Ssu9nxx9SQzQZxKF
         CNk15WeuwFe/4R4SBB0soeCuHNMNKgTkZpz6HwJv8SuqCK5NUyAPQAIwpdcZRsBUkbY7
         pJjAskPGUQ9bC/oX9I4D+LOUVI6/+p93J6PpivdxzNK0dXOP9E2hbZ0ZwfbQEC8iujTR
         POfMzotDb46vRcMNSEFtz9iWd5NcMQySkJ3gCsGuM0YkwKxQ4COSiSBjBdV9vPM8rIPg
         h5Hw0tZu33sVbfLTBWCf3LkgxG/rSuBpqPZnaADgaDvVTs5kojKZyvWoMX3sGB4vmJf9
         Ad7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970621; x=1791575421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c+Pr+0S1JlOBX/miOeDu7Q4SuyRTaEP5yuhanTP5lUc=;
        b=O6+euNxrXS9sJT1ygvTzG4s7ok6xQP/pV/CwvS2nUxYy8MiKjRbM69ZRxYmQxbSvhD
         xMM5CAlcUmLA7UByuh4CGAxXDptvIZE1HMKeXRYHSnT0rTf25Tob7KMZPL27xdhve8Pq
         hWft/Y8JvEzX7H0BQK3BrWGH0IIXGJ7zFfayPl6yyQH7f/56ZnUGDbIb1Mpv4KAv6YXt
         F2VpkTICpcughZsWBCLwXEvl7oemfruOwbPysTB5exg/XwtJPIwuH7M85yW5Jr8UiY0w
         t4jTFaQ8ArG+qv+23FK7yWEvwC0fjFKcCFY/YTJ6ln5TG+ID/p++OCfS8/58PuYKt4bz
         ImuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZOaArbJXiR6h5LwxYaT9wvuzs6/yN0jTWfA5JL8mwp0Nl2O/9OtPYJekiZPPXEgm2RuxE0WDH9x+5ydZv@lists.linux.dev
X-Gm-Message-State: AFuF++km88m1t+qzoIUURqhaAyyxLSuXyDwnaxiduQUY/UOafOJ7w+pj
	36WdvsfxLY1lhhnJr846g8L9o6Xx3EdQcoIC+Ae/CJLUbeyVMCI/1I5rfZIUv/BuMbbeNyTNbMS
	kuHRd+KMHwA==
X-Gm-Gg: AYBFou11ZKhHoyt9cWFpWeh9nGFRWIpz/HYEX4oXY2zRA9M+12JH+fTZV1M4bWBL4rn
	oc0APJ+KhAlp22U9U/bOC2hJROng1JPhF2Mkh1eikLae3kmc9l1cF1A5bITQO4Gv5FY4AoY6ewp
	TmO4fIAeiXbDzHcINUl7kBvzkZkGfF1e8a2GugTBOkU7WzhegR3ZF53cd5Wg69dr7MG0e5XUY9M
	sob2cgX+9KPqcKbQaWR6dvXO45fSD3G6zDtSF0DxV/UNPr5oLz5EPHGpluWFkFuGJIEJhAp9uvI
	sDIsPjHQ2rX7UrrFvfvLSePDD1zT5bwd9jD0PeMYHPrYUv26opmsXedMTR4aPVtk6oElUnVMy4a
	4jaGuy9aHD9PnHOkCNGcoNcpsfxMgDth8Uo9eWGBZkcEUE6WxlOmkwrTlC3AmygSoH6lfl4r7o7
	x4G5Rb8rOE1YYC/vIjhFVwDdnbi0yLWBQ45PRS6ebFH1Ol+k/ZIOJIa9kuTmtfmeockyf7Lh1SY
	2T5JWwj0sxSyOL2VxuMytBOoYKn36uxrqQWy6yPz7FoO70QOkOdKV1awy4+YpedOwQ7Of8=
X-Received: by 2002:a05:7022:1587:b0:148:516e:53e with SMTP id a92af1059eb24-14dd07fbc16mr9332303c88.6.1790970620487;
        Fri, 02 Oct 2026 12:50:20 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bcf9:6140:24a9:d1e7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f410725e2sm7157041c88.0.2026.10.02.12.50.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 02 Oct 2026 12:50:20 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6.1.y] media: av7110: fix a spectre vulnerability
Date: Fri,  2 Oct 2026 15:50:15 -0400
Message-ID: <20261002195016.21386-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

[ Upstream commit 458ea1c0be991573ec436aa0afa23baacfae101a ]

As warned by smatch:
	drivers/staging/media/av7110/av7110_ca.c:270 dvb_ca_ioctl() warn: potential spectre issue 'av7110->ci_slot' [w] (local cap)

There is a spectre-related vulnerability at the code. Fix it.

[ Backport to 6.1.y: added the explicit linux/nospec.h include required
  by the older source. ]

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and media av7110 maintainers,

I am working through the small CVE backports still missing from 6.1.y.
This one addresses CVE-2024-50289. It masks the validated CI-slot index
before using it in the av7110 array lookup.

The corresponding 6.6.y backport is already in the 6.6.y stable queue.
The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not
in 6.1.y.
The target-specific adjustment is recorded in the bracketed note above.

Could you please queue it for 6.1.y?

CVE: CVE-2024-50289
Upstream: 458ea1c0be991573ec436aa0afa23baacfae101a

AI assistance: An LLM helped identify, adapt, and validate this backport; I
reviewed the resulting code and validation evidence.

Thanks,
Artem Dinaburg

 .../media/deprecated/saa7146/av7110/av7110.h  |  4 ++-
 .../deprecated/saa7146/av7110/av7110_ca.c     | 26 +++++++++++++------
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/deprecated/saa7146/av7110/av7110.h b/drivers/staging/media/deprecated/saa7146/av7110/av7110.h
index 9fde69b38f1ce3..c2956c23d9c1e4 100644
--- a/drivers/staging/media/deprecated/saa7146/av7110/av7110.h
+++ b/drivers/staging/media/deprecated/saa7146/av7110/av7110.h
@@ -86,6 +86,8 @@ struct infrared {
 	u32			ir_config;
 };
 
+#define MAX_CI_SLOTS	2
+
 /* place to store all the necessary device information */
 struct av7110 {
 
@@ -166,7 +168,7 @@ struct av7110 {
 
 	/* CA */
 
-	struct ca_slot_info	ci_slot[2];
+	struct ca_slot_info	ci_slot[MAX_CI_SLOTS];
 
 	enum av7110_video_mode	vidmode;
 	struct dmxdev		dmxdev;
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/av7110_ca.c b/drivers/staging/media/deprecated/saa7146/av7110/av7110_ca.c
index c1338e074a3dc1..642af03fbac810 100644
--- a/drivers/staging/media/deprecated/saa7146/av7110/av7110_ca.c
+++ b/drivers/staging/media/deprecated/saa7146/av7110/av7110_ca.c
@@ -12,6 +12,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/nospec.h>
 #include <linux/types.h>
 #include <linux/delay.h>
 #include <linux/fs.h>
@@ -26,23 +27,28 @@
 
 void CI_handle(struct av7110 *av7110, u8 *data, u16 len)
 {
+	unsigned slot_num;
+
 	dprintk(8, "av7110:%p\n",av7110);
 
 	if (len < 3)
 		return;
 	switch (data[0]) {
 	case CI_MSG_CI_INFO:
-		if (data[2] != 1 && data[2] != 2)
+		if (data[2] != 1 && data[2] != MAX_CI_SLOTS)
 			break;
+
+		slot_num = array_index_nospec(data[2] - 1, MAX_CI_SLOTS);
+
 		switch (data[1]) {
 		case 0:
-			av7110->ci_slot[data[2] - 1].flags = 0;
+			av7110->ci_slot[slot_num].flags = 0;
 			break;
 		case 1:
-			av7110->ci_slot[data[2] - 1].flags |= CA_CI_MODULE_PRESENT;
+			av7110->ci_slot[slot_num].flags |= CA_CI_MODULE_PRESENT;
 			break;
 		case 2:
-			av7110->ci_slot[data[2] - 1].flags |= CA_CI_MODULE_READY;
+			av7110->ci_slot[slot_num].flags |= CA_CI_MODULE_READY;
 			break;
 		}
 		break;
@@ -264,15 +270,19 @@ static int dvb_ca_ioctl(struct file *file, unsigned int cmd, void *parg)
 	case CA_GET_SLOT_INFO:
 	{
 		struct ca_slot_info *info=(struct ca_slot_info *)parg;
+		unsigned int slot_num;
 
 		if (info->num < 0 || info->num > 1) {
 			mutex_unlock(&av7110->ioctl_mutex);
 			return -EINVAL;
 		}
-		av7110->ci_slot[info->num].num = info->num;
-		av7110->ci_slot[info->num].type = FW_CI_LL_SUPPORT(av7110->arm_app) ?
-							CA_CI_LINK : CA_CI;
-		memcpy(info, &av7110->ci_slot[info->num], sizeof(struct ca_slot_info));
+		slot_num = array_index_nospec(info->num, MAX_CI_SLOTS);
+
+		av7110->ci_slot[slot_num].num = info->num;
+		av7110->ci_slot[slot_num].type = FW_CI_LL_SUPPORT(av7110->arm_app) ?
+						 CA_CI_LINK : CA_CI;
+		memcpy(info, &av7110->ci_slot[slot_num],
+		       sizeof(struct ca_slot_info));
 		break;
 	}
 
-- 
2.39.5


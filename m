Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7F037F8B1
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 20:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776027169; cv=none; b=PsFH43fZPcMsbeEV6/hDJITt1VaSVLzciYV2y6KT2kB8otXQWPxqMEilT03zXVSk+5yXJy2NpAPu1vkHtrzvZKLRSnEcK9vMd6cvWCai8OxjBQ9w/kQ+TKTi7T5YHmw7KdqfgCTXMI3lqdX7F+dynnT7tMyj4dOmqNjOoB4JkTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776027169; c=relaxed/simple;
	bh=PT3xs71fHd+54WioIwbDh1RrwxMQVhrEdhvCl0wP16c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YMFiQoOQyx950vt1TPd4UE2sm/CKrERSQxRgWGSirKKjfBNy44Mum9SXFaXqkxTk2ydLWFSHprR5AWWgWutd/KTGHfuP+Iw0ODD9X5pYwifTUKgbdGxmviXgw/TEl+r+6Flx88adgJ0YgjVAP7I9JqO7/NtPu8Qib29mS1la+TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sMkiYQWZ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sMkiYQWZ"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b980b35534eso523208866b.1
        for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 13:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776027166; x=1776631966; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NmfBAQ0D3Sa5sjeFp529b93qLEW05p6njf5APTbVpD8=;
        b=sMkiYQWZV73mgbE64dtc02y6BGk4gEWtkYlRSkNszYsEVuPDb9c51Ucsb0gdZ717rq
         Mf0vie5XNyjlvj+FApQ66kp77VRNCu/X1NGa4fdQ6JKnBboH4L7NGqZ3e/3g8htS+Eqh
         m7EDIVuMHiRK7gJ8V+PQfaiP74o7R54wnUIR7kQGHCPrD3mWam4Qb1TdO24dJyA9KndJ
         1+wYPUwz4wEcPnXiBmD9iWJ04NLqmVJ8QtBo5J5IG8q8c2zpCrsNwjMn8giVailqxL4v
         o31RXLQAcLv6RREWKtLkcqMSviHFF8Gje65RUB6jHKYjPg+fSqI5YTvGflE8zgEg9qgv
         0rPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776027166; x=1776631966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmfBAQ0D3Sa5sjeFp529b93qLEW05p6njf5APTbVpD8=;
        b=OwClRv+JSxcjLGH6Sofn3DsYAWBD+t1FfpdCccgbsb6S3jF23lllzCVdeJk69nPged
         am036s3+A3dMuXG3GnypdXDbrM/TzcTtzkQ86iULfbSAyqNML00EbdGpakbju7ToZvMU
         8JxF6Nz5BnUM/RlzIwqgFoXMW5UoI1vbbXhdUUiIjitEMbmGcqz05YjdaGxKz/ATUReO
         DqlJHCkwTaKdEh06q8ZHJ8A+uhPjzhkKvPCDysObxSPdNbBvh/UE62KKDbnPMcPXjBv6
         G9hH+uJoEeNHSFWxuphXhGoXWzBUczbkd4qmqpEThy0jphDrhXCb5MkcRNE+Jmw/rpkG
         ia1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/YR7HKca6sZ5cagjSxl2rEvRgsNqc+ap5Xs9ix9s1KGpYznNdUW+aRTVtzk9wLFutZP2xL9NUvmV6vLV5W@lists.linux.dev
X-Gm-Message-State: AOJu0YwBJPnHbwpAn582aCKBSS2lvGNdsyw60qA/zH3YGGRF0HfNsVQp
	nhQNdOB82jjYp8SwLuWJbNSnYarWJrlsxQPvq9Ho8hDpZJggiec+t7Bb
X-Gm-Gg: AeBDiet3Ddkxk92y/s78+aYAy/0OCy3fLzGnDKv/ntjDGGVkrEw6N9xu+BprCKzEZdd
	fIqB1Yl5HVzzdNugJ5EgYJjOQ97wT70GcBs7jbqhs0Oi530kHvOZy9WNPDwO6d2JfOiv7fX7vtR
	ltsW4eW6sp1pwk1gM1BzFYEIil/AjH0tSBB+y7+uteeCpCEdHl4ea4EwbKbMHxOiXYCRiVz77hJ
	3T+xWELbtP5Ko15KDpHowJ0pI34P3rwIs8F1GBFLSCqKiIYL4YJXsvdxYD0AecvLR2hRnLBOcHR
	tD03Cx5gWmh4/pBG2ZBVEwaRRw75eBiI7BlatHfL7gaNn60lke/bLq9c90UsArUgIO+Ng7PzybW
	5LqDonDwquhsAvMIf+7XrQGJ7/N1f1pwkLhyYoskw6I7VszUL9gUqeaaiqFgNQNKhbBgpTzjaBy
	DVX/xT44OoE7rmb+tpF7pSJuDbmTOLFKHjMDg62NkYA/MckQpEjZHS+V9cGXo1uC5ECeSpeMjW8
	+Ny5yLaskvhMcxhRJeyaoI6QSY6pyQ5Qy9u66dvWLwhNsR6NtHe103RAwe9/C6w4lVeqAm0N4Hr
	pTx/lmSQooHXV+Tp
X-Received: by 2002:a17:907:1b22:b0:b97:fec5:eced with SMTP id a640c23a62f3a-b9d45b64482mr763764166b.0.1776027165602;
        Sun, 12 Apr 2026 13:52:45 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd78f6sm263126266b.26.2026.04.12.13.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 13:52:44 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: linux-tegra@vger.kernel.org
Cc: marvin24@gmx.de,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH 3/5] staging: nvec: fix use-after-free in nvec_rx_completed()
Date: Sun, 12 Apr 2026 22:51:16 +0200
Message-ID: <20260412205117.387125-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In nvec_rx_completed(), when an incomplete RX transfer is detected,
nvec_msg_free() is called to return the message back to the pool by
clearing its 'used' atomic flag. Immediately after this, the code
accesses nvec->rx->data[0] to check the message type.

Since nvec_msg_free() marks the pool slot as available via atomic_set(),
any concurrent or subsequent call to nvec_msg_alloc() could claim that
same slot and overwrite its data[] array. Reading nvec->rx->data[0] after
freeing the message is therefore a use-after-free.

Fix this by saving the message type byte before calling nvec_msg_free(),
then using the saved value for the battery quirk check.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/nvec/nvec.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 952c5a849a56..75877038847f 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -498,11 +498,14 @@ static void nvec_rx_completed(struct nvec_chip *nvec)
 			(uint)nvec_msg_size(nvec->rx),
 			(uint)nvec->rx->pos);
 
+		/* Save before freeing to avoid use-after-free */
+		unsigned char msg_type = nvec->rx->data[0];
+
 		nvec_msg_free(nvec, nvec->rx);
 		nvec->state = 0;
 
 		/* Battery quirk - Often incomplete, and likes to crash */
-		if (nvec->rx->data[0] == NVEC_BAT)
+		if (msg_type == NVEC_BAT)
 			complete(&nvec->ec_transfer);
 
 		return;
-- 
2.53.0


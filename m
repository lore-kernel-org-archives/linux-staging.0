Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5943B3C1C
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 16:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773074191; cv=none; b=myq72GMzMEaAhHrr/bWGCWKopqCbbU8jA0mtexxEQKu370D/erwpeLc7sn5XVoLf1arWLNfYA31r8dv/lNrCvaCZ8DqaP27XraLT3sqByxvmNfMu72j8YdJTdGbC4boMUaas8HoUdn2SkfYLxefsKLH+FDazQgXNACWQumBehJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773074191; c=relaxed/simple;
	bh=jxEri6n9IkuCZ3pmrcgo0GGE1NUE7KcRG433Oye3t/w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pvHKr4btfG/aEnA2WCpuaV+SRQ/iTMoBPwSzLbs1EJlIjEBcRFrYkh2MwzspjLWQIY4gZUeqvmkKnw2QWIqG3ulaVUu1GSqPBS+1W/wR9jAkXm8KvYYHLp5/iF6oqAasbtZlOT+L5yVXQDhWlyegU6ixQaYaujzbIN7sCu8Z7Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbKuvwY6; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbKuvwY6"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56b255b1dd0so1163436e0c.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 09:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773074189; x=1773678989; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DxT2m6np7uo0cABB26Cll0PvxysiDz7Z+Coo5DaUKlI=;
        b=XbKuvwY6KtN+ePanUi8KAVHeKI2zqPzNXHtTKpEfS/FTXl2pPS9sAJmWOm7jKCnPjP
         bae1OSTeM2zGobRMCscMsj7RAP+zh0veeD1C4Rlcw1+HXLJTD4banrV3W7tznAH16iES
         zcHxv9oj96Xt7VOWXP/F4cYxym8C88Do4X9s0O/+JLhJtyY83nfDYAisdsXRwHMMYsew
         K2JQS9JNzZXlTbNsfyK923C8cHKtMl4NvCyPtvNwOx98Ww/oaIQhKv/fb2yqrxI608WK
         jpxWJc1qhybMzEL6IlgIBHejfa965GKbBQdJoxYUXZA1P8TRQ223GNHflj+5cLKtXbIR
         IVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773074189; x=1773678989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxT2m6np7uo0cABB26Cll0PvxysiDz7Z+Coo5DaUKlI=;
        b=YrRbvFpeGTPH6KlSks2kmL4aqSmiZB39NmiqEtYKmh/fCMmH83mXPgmVsaspQE77ii
         HykRiISo9RWqVQGLxJvAqrcyLDB438FSuljMmpH6gyHQbvOqqrLH4y0xQvR74nKiTnRz
         j0Vp1G0laqxN0LsiUTf7L3sYq/BdVJEsnSf2XE9zE0XvKQA78Di+2Tlbc8EzD6FY5FL0
         Vf+JQeoYykZ9k81eeAH3WozNL7XixJcCoBkgRnerQfT1BCtvjmXBWsN6nSAhRO/aweL+
         lLLNSi9KZ9acrCs7jVxQ/yD5BusDPd18Mj/SW5lODH+/5Zp0YeM2iCENa3/toqgQljMV
         E2oA==
X-Forwarded-Encrypted: i=1; AJvYcCUKVcqIgFBb2V4dSGoCjtrDg2SU1f86xWPPE+ZlT0xJTMNSChjGimVBtyI9xa/sJq+3A61ClkucSEhMHztJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzDySY8WjJoiecAvsNiWj1Wr6TE2qsxxqp3Vcaq0aH/ywcfAq8y
	ObNDot6GWhrFTyQjfhkbIexkWyj87/N/NIU7Oh6rTdAMGpRfsmMaSUV3
X-Gm-Gg: ATEYQzyPw+qoZkkGjn7niu1QBiHWUO6eOk8AmpS/hsXGYeRjN+9QD2vdb+QRqXdfrYf
	MdbPMDPQr3yoIhWaA0aZeIKeVw85iiTZHlQuK5L99jM+OkkJQcJ+4CxwY3S5c6zeETcZdMcNHfN
	4XVV34MCrsTNIRSwU+hPYoH/xIP8L8UoYMnFJ+dGHzupLxEdn4M2c/FoAnKGcLFhdCXzTnF9yTq
	8XA5BUN+7E4FVF1KtPozpUWeJnPFyfS9xsyLvtWmwj5v8odYngja/LrMLZBCyqBLVPAocyH4BWr
	gMAszq3w7mdeCotdI253kuStHL9kqGuWH2GumZwWsE6axBfOkmLRzqQx3NCpFX1VumrNGifmP7a
	hnOozTd6HSrkc6y034uTy/3+pabH+tWrXG929GLnijYE3mJA/XidE+DxwgR0TlnwI1d1cSZ8qHh
	tP42FqaeIlqchvzg==
X-Received: by 2002:a05:6122:20a9:b0:559:6960:be0d with SMTP id 71dfb90a1353d-56b07e8ab81mr5145281e0c.13.1773074188731;
        Mon, 09 Mar 2026 09:36:28 -0700 (PDT)
Received: from horus ([138.97.160.237])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b09b20d02sm10493072e0c.15.2026.03.09.09.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 09:36:28 -0700 (PDT)
From: Luis Soza Rodriguez <luistermc789@gmail.com>
X-Google-Original-From: Luis Soza Rodriguez <contact@sluisr.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luis Soza Rodriguez <contact@sluisr.com>
Subject: [PATCH] staging: nvec: fix block comment format
Date: Mon,  9 Mar 2026 10:36:25 -0600
Message-ID: <20260309163625.18014-1-contact@sluisr.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the checkpatch.pl warnings:
WARNING: Block comments use * on subsequent lines
WARNING: Block comments use a trailing */ on a separate line
by reformatting the block comment in nvec.c to use the standard kernel style.

Signed-off-by: Luis Soza Rodriguez <contact@sluisr.com>
---
 drivers/staging/nvec/nvec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08..62013019a 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -659,8 +659,10 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			nvec_tx_set(nvec);
 			to_send = nvec->tx->data[0];
 			nvec->tx->pos = 1;
-			/* delay ACK due to AP20 HW Bug
-			   do not replace by usleep_range */
+			/*
+			 * delay ACK due to AP20 HW Bug
+			 * do not replace by usleep_range
+			 */
 			udelay(33);
 		} else if (status == (I2C_SL_IRQ)) {
 			nvec->rx->data[1] = received;
-- 
2.53.0


Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59E44183B5
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 17:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781544584; cv=none; b=saK5tseNa9BL0js7w5HKTjzAqWr9b7CZKLcbNUr+eT2vOLquIh5zPACqnzQKCE7uyZ1/WOCiXw1rST8f7ZRsxPFZqrQpWUhSf76q2E4QAyOIpmKGFHRzQ8NH4EbXxaVu5/CetQreVROjfeG/fdVPLfSl47PI4Kfb7dRd8CQbyMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781544584; c=relaxed/simple;
	bh=zjJaFdjvPiCMQQinHXGS/Lj0fAMMTQSVc9jvt4DzchI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m9YxFq1DZPn6cI/vS0sFH9siJp2hs42MubC7sW/rgbvU+AXPJnPSW7+3/9li8leg10aQMRL5yCp9peDHuUBKQZqNwoC/0Gu5rvk9wWIWtul090IX6dcM9Tvv/CwoR0dc1/jbqcgXSe5ghdG5OVDXq/UUMUUWQr6r3QBGxanJspU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUdMMMx+; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUdMMMx+"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c6770f12e4so1319695ad.0
        for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 10:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781544582; x=1782149382; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SvlWKrsshSGlU2CfP5kimPXzzn2s1m0s/Uam/zRnJWE=;
        b=JUdMMMx+nvLiLfZ0xi+bkfXqQ03Zycm+jPNUxmyC+oHFV53ijFo9OBEYkwc8diVqP/
         aaAIyllL2WZh7hMYbXBQ3CFSJZSO+ZoJLv7HqBm3NRrsiK1jPaG6AaacXkRxFOsPkjej
         yZHa6QeasEBf2h3LC2PqiFg0LKMMz2p2nsWDB/IuoEiVZEmakrm9zSLS9pq1yrbXK3c4
         FlQVUxUfjy06OG0ZSa+BD+ufGZ5xrTv9JINteA51myHJoEfQO/xDgpiWF9eNjqeQOMSE
         WrK5o1ZZ84NGg+YoJNNULeYNZMESrAMsozLFevke7+2wxViOXozNKojWfey16gdfM2VE
         tAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781544582; x=1782149382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvlWKrsshSGlU2CfP5kimPXzzn2s1m0s/Uam/zRnJWE=;
        b=jQmhU90TH6ugriGYDsuqYnp7cLH17aVgz5W+khMbX3sZJvJXBuY/YHaE9PsXWtoOXe
         bD2ZWHo4TLJSdQVyzRQQKBIvsXkSIP+di6sxj5rbquVHz+XHkGaIU7KjZx4poA3FHCFq
         CMe92i+nqasgunfRdUNUVD1yWTjfJj4iorzoB7ahbztiJMhPQKCtf4hdlj+UbZKxdXrC
         tOFsbR/XLswRAzu1rqLPKjevm2kaVy+tlKJHLG+KAar79L17sNozSYTmRz9oDE0FJdnM
         I7BvahqBpV1SKOgQxkj4ybFllRZXMiwUWcJx4DBuY4PN+yyC0AXmmQnJAeC+1+VnqGG4
         E6zA==
X-Gm-Message-State: AOJu0YydbY6G8GI02eZ0jptOswDpmCoVlqCM7gR8syfr7TyC0qhrA8nR
	q2sftYxfALKU3KaEggiR+7zS9axX3y29PZBms1zYX3vcXAVkDVH+GU8f
X-Gm-Gg: Acq92OE7bf46xUmA2QQKhhYmEdZO0mnTsCS71pRYqr/noCOewbf/H3723ZM764LdZvG
	N6kCxCq22UFXJXNGHb8jMgQPi2vE8aoiPoOI1ordLnmYyw/FeqFKLXR9G5vf7ZvsGp6v481v9vV
	/M3DsgJvYmE2sYjqKSaBSa/TtlZ2kP+N3tkA3qF+oFola8LyskFjhl+UHkq5ObC9s8Pi0qtGsze
	5Q3kL7wD7E+/ceqS8e/xIKA6EkQbPvSuUpqOsuoMbCSPyWmpTB0NfwLbyZmur10Mnmvjdedj8Hz
	8bRWzeArB3RFO9m4rptyln6XzVIHcOYT3MJdsxQfvcmYvMQaMA7LrxAcRy/uljrzGf51Mfv2Hvn
	qQrZQRGdEu8FMuZX0aqW24Vw7nu7PWtmckoSa7kihWkhWC68yugNNJ4r9oUG3gtI3nA8IAUU2Lz
	e1Q8OOJHor90TItXjUoQoBJ92FlNA3COOJlBmZY55rqTaGAu+gPU0jnrWNMOGryKT9vrpG/pZrW
	b6Fyu8Ana4/7FlN/N2M7l4QS3w=
X-Received: by 2002:a17:902:ce03:b0:2bf:32a5:dbdd with SMTP id d9443c01a7336-2c41245866cmr82743195ad.5.1781544582270;
        Mon, 15 Jun 2026 10:29:42 -0700 (PDT)
Received: from fedora ([2401:4900:7c8e:5373:4159:c5ca:b737:78a0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42fbb5411sm105001775ad.32.2026.06.15.10.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:29:41 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	Ayush Mukkanwar <ayushmukkanwar@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2 1/2] staging: octeon: add missing tasklet_kill in cvm_oct_tx_shutdown
Date: Mon, 15 Jun 2026 22:57:33 +0530
Message-ID: <20260615172734.42038-1-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TX cleanup tasklet can be scheduled by the watchdog IRQ handler
to execute cvm_oct_tx_do_cleanup. There can be a pending tasklet in
the queue which might run after the cvm_oct_remove() frees net_device
structures, causing a use-after-free in cvm_oct_tx_do_cleanup() as it
iterates cvm_oct_device[] which is an array of netdevice pointers.
Add tasklet_kill() after free_irq() to ensure the tasklet is no longer
scheduled or running before teardown proceeds.

Fixes: 4898c560103f ("Staging: Octeon:  Free transmit SKBs in a timely manner")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260511150931.93382-1-ayushmukkanwar%40gmail.com
Signed-off-by: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
---
Changes since v1:
  - Added Fixes, Reported-by and Closes tags 
  - Added compile-tested-only note

Note: This patch has only been compile tested. No runtime testing was
performed as I do not have access to Octeon hardware.

Sashiko also reviewed the v1 of this patch and found that cvm_oct_xmit
can still schedule a tasklet even after tasklet_kill is called. I was
planning to reorder the tear down so that the net devs are unregistered
before the tasklet_kill is called in a follow up patch.
link to that report:
https://sashiko.dev/#/patchset/20260614114739.87061-1-ayushmukkanwar%40gmail.com

 drivers/staging/octeon/ethernet-tx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
index 14d10659bce7..785c6492f170 100644
--- a/drivers/staging/octeon/ethernet-tx.c
+++ b/drivers/staging/octeon/ethernet-tx.c
@@ -668,4 +668,6 @@ void cvm_oct_tx_shutdown(void)
 {
 	/* Free the interrupt handler */
 	free_irq(OCTEON_IRQ_TIMER1, cvm_oct_device);
+
+	tasklet_kill(&cvm_oct_tx_cleanup_tasklet);
 }
-- 
2.54.0


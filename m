Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9EB285C8B
	for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 11:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781437739; cv=none; b=cFK3EUBrVAmrqQoF54N5KyRjyMWR/lZzs6p+VxHyZImV5LsIEjv69/G7The1yQrrI/mJkPaYIq6IbJxx/EBsEpGG5DkyxvuQGRVOJ1Y0NTsLQnmuHgmkpmLYryDqSJ2M60JXGjTfsAaS9FVBUcTQJojuGrq9QPo6UHjGPrcQ2Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781437739; c=relaxed/simple;
	bh=ll40Wdsw5Beb5SEWvKZ7o8ZFRW5ZvL3rqlsZ87zKu/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iDRbmA1PGnFD4TgVj/LQhS/JBRgISRCV04krKyDNQcoWDIYaZOLs/yasGEWnZn564TalxBV52jHkOBh1t2fO4JYpCHuyJOcye8xH8qxU0cIQJfUXI6iGRfsQFb8VC8tJY63sIQKkf+VRPnhtfmAh7LlId+pSzYPd5jUgnD/N8Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nPXyUsnV; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPXyUsnV"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36ff2543359so342587a91.2
        for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 04:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781437738; x=1782042538; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mE+74dY5/0xayTn2/a4ziQg7s4J1BN3ftMLZ3hA9Rvw=;
        b=nPXyUsnV+79KSzrVIMJ+mS8K6mBkCNKws16xT6dPQ2KrCYiSAhOa8sbO7Jwo/DcdJU
         7NO9hBgw/gE0CQXRSBvLgF0z1HDwyWs/5i3V2npkkLcxP/ddRVpfxVN4K5dpHQwAo8QI
         Tc2xp7Kh23pW7hr9Cax1qlSn6KpVgno9NbTCdeNKmluC2gR6LH8rf8iI2/ZqIw6BXZJm
         sY9HumCptzf5C7kjQxg+7ovUzzaUXP05Zrce2PCQlavqYdG1CHuvRbGFHfWSOculAXm5
         K12F+3Jj1F860CGH1Vcev2RZDjjXURe1AjhQKzZ+EZDDVR+Ta+fcxn2KcWRjMqZA/X6w
         puiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781437738; x=1782042538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mE+74dY5/0xayTn2/a4ziQg7s4J1BN3ftMLZ3hA9Rvw=;
        b=UQ5NC5f8p4bWS+k70hKQhvwaRxw3S9P8Y6WPn53ObH5tD0Ht+bALfELoVSo5PVvYMt
         Ho6mEA+d675vFifUOnQBQXJ9ghuViAizZH+Kbr1umS8w1lR9KJ3kY9dY1BcFIij9gFUL
         fsNVGotjdIlfXaEIrpgZ8TxSARBFcX6rO/+cwSBjyAaO3jYIVMd3bMH2ulSCVNY7IPZ5
         7Ee9nWX5B1gbQIuYyJKNzdudSbYouHLS+XmkecrMUq8Gc64dr8y8Mfs/AY/2rMfq4Y1Q
         nnsBPmuemeDJt2LNKSEhxTeHOSkIcyR6JT2f9gZ61/P1boXT3MY75EagAVxiriAVT6jj
         KAIA==
X-Gm-Message-State: AOJu0YwTTxgM4MEOPzLUkqkjog/0CygtXq2fa4b0cWk9oYr+hzWbKSUP
	i0WSYOpq/aCe0np65CH1KwZRbQDjsHPPpiftkLGND3zFkMEG2Qyitven
X-Gm-Gg: Acq92OHBS8A427I9YQ5VzhuENv9RNIG66gRbeRUakqO22Hxb/+1wDvo36/j0Z7WGfCX
	RyDMsywoCvYl/n8LSoHadDVxFPRR7ymOk7qrv7rX9E5btE5AiX73fsJSituxCDeM4uPWqqVD5Z+
	teOcW0KaP/peU5R8DbwLPySxuSJ6/crG4lyZzsHeZbzCwTm8b/TxlNSgAcYvUrVS4GDtGDrK15Q
	FGJLOGsUrLl9+cbyJXUF72/U/q9AD7ThG+tzvMEWFd94U9OClCCniXK4j6gXeLiM2TqDkCHAWKi
	gg0syiX4PajB0yEn/NrgldsGaLC+294wtQJr5CIJYBaCEFZHwxrX8Q6Z60FT344STREj99hCMLJ
	4l9DnbZyLuldqtsU4ojjAJV0yshZux+hhpCLNRKTMqsAbSGVyZzdq5ekvD/+dNPg1DAFDRg6XaW
	jjOkdCeDq8d0f4Iu90/fYqqK+VTtNqymmKLuGsTL3JsYPiTJVqOpR7/gwmv+a4DFWKZ/oLt8/S9
	Vvfi+/MIoWGG6QZ
X-Received: by 2002:a17:90b:3901:b0:36d:de94:f31 with SMTP id 98e67ed59e1d1-37a03fb813fmr5350117a91.7.1781437737852;
        Sun, 14 Jun 2026 04:48:57 -0700 (PDT)
Received: from fedora ([2401:4900:79eb:8cfe:b4fc:6fb1:4b23:8420])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a2179d743sm7388808a91.17.2026.06.14.04.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 04:48:57 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Subject: [PATCH 1/2] staging: octeon: add missing tasklet_kill in cvm_oct_tx_shutdown
Date: Sun, 14 Jun 2026 17:17:38 +0530
Message-ID: <20260614114739.87061-1-ayushmukkanwar@gmail.com>
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

Signed-off-by: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
---
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


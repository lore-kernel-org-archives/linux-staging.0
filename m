Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E2D2134B
	for <linux-staging@lists.linux.dev>; Fri, 29 Mar 2024 20:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711744401; cv=none; b=u1ksuPSiTPQGEq2OvdwcFZfvcu31CTGKd+JoFf1moF6wrhdNZeiCNkVwEwk/vVnGeyNZ0S1AWNbTyo/u/C/dddPwvnWPhG2RhFPBe7ITvxQx6h+BOn7n/zgwysRb6QdccXuYlIci/ES54aALbNXqFYvR+WsUtE9UvTqw38vIcmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711744401; c=relaxed/simple;
	bh=MmKPUNxZ+susb4kr/ZOyBooFet2Ni9V6EkAgfthmPGg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eM7AR9T7dpbyRK6baVBAbGwCRx5D2EY395moEytKOwQ3qdDU1InM+3PyEOamXUzrf/6Pl+xycJVTi/JlLi4GdQisKwAkDB7Lt1f0ueQZus3CMYc4p8c0UZZSKRt/Q65TGEuVAlK7+5oyb5e/5cG9KbdyCqGElCCa7PbarJk39/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYtvL5Cy; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYtvL5Cy"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso1648235a12.3
        for <linux-staging@lists.linux.dev>; Fri, 29 Mar 2024 13:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711744399; x=1712349199; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9y/dxoUHYnuLJXM/FbNFKWazEIf0YDN2gZikUVSS61Y=;
        b=VYtvL5CywtoxiSPZHpWEd3/5XJKa0olqtgLaTOWRMM5EXLA6r7k+v+/mjNlAavluYI
         5Qw5mAoCjRwO7S/2ypg4tiMXyiiC9dfJqkTaYWi/FrKWPA725StZRRcAL/6WcPlliCrm
         clhUM+MfiE05FbEKrr7ZFKFMPkKhTWxn4qOdLlGBts9xfEdJ0eQBNpWBt7/dwaoPf7Sv
         3x2LD7EFlZ4h4nCSAOr4kRojdAbhiu/MTkVKmkNget/+gFmPzW4QkRe1748nxJ+ufl++
         fjjmIBDiErEEgRQrBqZlmxQbYORFshM9MjRSFjN/knqao4CmVoq/67vylmQgZui9ZuPS
         Bqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711744399; x=1712349199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9y/dxoUHYnuLJXM/FbNFKWazEIf0YDN2gZikUVSS61Y=;
        b=s9+rRJn1kpByPpYCT3xnHw/jony9TZTHEqVCJJkGeLekKnXbz4PktigDOXrJkO+fxQ
         rMO5NMrkN/J5DU6+sFiqAVzHDAAnfIwz29uxYWEf8nIWguwTnwNrT4AwT6RICmnE5UgT
         9uNMigr0PKHMyn+MTaz0DJpy5iBXBvbTAwk/1Ad0QWwXiKIBMNmM9fOuwaDiAv5E+zfe
         Gjfm/Lxag+ypt5zvSIfI/+3BZFn0Y43hL4nV1aqRt9M+bbgvQS3Nfq2srq0JYAdqFOLB
         OC8f9CrZiIKWS6T+fpFlrHLY2emPiryPFPJwAKyFd61ifwm2YtkZolvL6pgFzn9343nZ
         ii5A==
X-Gm-Message-State: AOJu0YzOql49+YSxJls4RwBKUeY2P6TzgvysWk5jIMKMPFOFVza5L9Or
	UJeLPd+rq/njOK+F7Nxps5xU2qvhweeTKDmEbtSWXxqRlSvlzrgD
X-Google-Smtp-Source: AGHT+IENv1wF/FlhJUBdDw7gbHcuc9C7OqOL6VgCxshez/VMiYYzHneKoAE1DtcwhSriDloEUjcrhg==
X-Received: by 2002:a05:6a20:3d07:b0:1a7:1c5:4746 with SMTP id y7-20020a056a203d0700b001a701c54746mr1717945pzi.1.1711744398901;
        Fri, 29 Mar 2024 13:33:18 -0700 (PDT)
Received: from localhost.localdomain ([122.161.51.128])
        by smtp.gmail.com with ESMTPSA id w26-20020a62c71a000000b006e635740126sm3524177pfg.112.2024.03.29.13.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:33:18 -0700 (PDT)
From: Shresth Prasad <shresthprasad7@gmail.com>
To: gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	christophe.jaillet@wanadoo.fr,
	prathubaronia2011@gmail.com,
	luca.ceresoli@bootlin.com,
	robh@kernel.org,
	u.kleine-koenig@pengutronix.de,
	frank.li@vivo.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	Shresth Prasad <shresthprasad7@gmail.com>
Subject: [PATCH] staging: axis-fifo: align arguments to open parenthesis in axis-fifo.c
Date: Sat, 30 Mar 2024 02:02:24 +0530
Message-ID: <20240329203222.12889-3-shresthprasad7@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align some function arguments to the opening parenthesis of the
function as reported by checkpatch:

CHECK: Alignment should match open parenthesis

Signed-off-by: Shresth Prasad <shresthprasad7@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index c51818c56dd2..a70af76be7fb 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -376,8 +376,8 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 		 */
 		mutex_lock(&fifo->read_lock);
 		ret = wait_event_interruptible_timeout(fifo->read_queue,
-			ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
-			read_timeout);
+						       ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
+						       read_timeout);
 
 		if (ret <= 0) {
 			if (ret == 0) {
@@ -517,9 +517,9 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		 */
 		mutex_lock(&fifo->write_lock);
 		ret = wait_event_interruptible_timeout(fifo->write_queue,
-			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
-				 >= words_to_write,
-			write_timeout);
+						       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
+						       >= words_to_write,
+						       write_timeout);
 
 		if (ret <= 0) {
 			if (ret == 0) {
-- 
2.44.0


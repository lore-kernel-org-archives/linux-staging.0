Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8313B37D12C
	for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 12:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779710493; cv=none; b=qukJJE/ry82UAKLUCUw2pR9YO64PrMQ2hAYTgR8+9iYOXHDttegk6Y2Dogo/kjC8WSgIM10sWLrfXLZNMauvXCDTBsJT/YjoxryydC/HpoqJ37Ms84ek7dgri1p/2b9mBfaDMeT/d+esOC83PBbCAlxaSL6KQ7t6TiPDRLM9ky4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779710493; c=relaxed/simple;
	bh=okqegqtxzIPSuZwTDVV8IKztP/IV3ayR2nT0EXNGgQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AbXGQrpWtcaJ2Q0glVToDjCZezHFf6mw5eKJnQrW7IQ7WK1H+kNo9vVDm9lha47D8Fl9PamzJHXzp1QN++dmPxHABdxVymwk9DgIMtVEpzOWGCRlEsSPZepF0yS9+2bWzaJ5ZafMuEK3hVeYjNDUKW1pXD4uGk4IxI0GhNIBsm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f3fpvzhv; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f3fpvzhv"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-365d8e43759so4845151a91.0
        for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 05:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779710492; x=1780315292; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PLf/LLZ49E5TECjii3dbLEKv4yHLEddxmqn3z8enwzs=;
        b=f3fpvzhvjrl84Y0fBmTVIIatD0Px+KgC1Bk4jUigO3jIZti9pYNMSaSF26iL3nFzq0
         ouPPdLO9E+hK2iwnGFdd6/qd85gRQ6GYpNyYXXpMi7AXdtZHr7hVaEPUAuGZ/z4LTwZG
         1K0w13uhKzfUGh1kvS0WnuQ6Y3WRDd7pc6Mbu64wd4EOvSLL9EyeJLge1k1zSKXG0ScA
         aEzlcxpiXmudLIId+fS1XWh+v0jTcePQHwHC8QqTzqEbLVykpkDHSz+vNlxvmgPMNLYi
         89TH2cvLepMqav/WtACC9WAc6Nv9Un8SATTAhJ4bwt6qpgmjfRnX+Ywg7ffrpmq19qcg
         qY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779710492; x=1780315292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLf/LLZ49E5TECjii3dbLEKv4yHLEddxmqn3z8enwzs=;
        b=NUP+8C3haZxusg5sbWfQ1UFJfN/+ZmkV826Wq2X2Mc+Ucz7/+iHs+POUGtnPpWa0OG
         jN8vndHB17a8Kc+8lg1gUt0eS54Xt2iVCq54Kvh6vWxfy/dWjBPZZOnsA4IwXTu/L1S6
         ZaZek/8OMiPE+kqSe27yy/czA0dpMvCl8zzJ4QRdSZH5tUhpoxfHjI3gYUnYHhpdc3SA
         /iHc666bckGOqASW8KadSpAYIa+k/O9qaDxjitqNPqLd0vgJS2Dy6/OlA2BF3yvwbfmn
         O2L5gBvpeIJ2sq6KxI+dUg4wYP0/HaJuon7f3TM31uBpJKUF9Bav0jDMdEnYuPy6FsJt
         /Erg==
X-Gm-Message-State: AOJu0YxSyyh7RiDVafh0iP5QrFWiIpNteUhrhyXnQkMVzZv3W5vYXorG
	JPwvTgKszcFByXzlnNx9guuWLkahEdQi5rQg+Km+kICdmFw8idzmeMo=
X-Gm-Gg: Acq92OHlIZXpJHrF1Sn9q3BhcmOXv1Z5MiKdd/jhpybwXQsWPdpXgKSz+WvWgEW+5uj
	6F6JaAEC3C23UzHSQ0gjDLUiXEJCnZl551ZekaJhEI2NkB9bzkwDYLo2e+sUUNrk2M+9bxo5q46
	CTBZwwj6ClXBsyIWUgPI37F6fObiw0oy3ai7yZx/iDqQi/syhXAgzojpbbwvzCpko7PiXkDv2Af
	8AD3b4eTBkWpk7Ir3jiQ4NoM6rT3lHaDy9VTgTACgMC+hv22eOQkAAhwjHsIfkAUdr3Gg0bB041
	svnknDOsISUN+6zU+bNfVRNtTu5QrAg/4XTDMe3fC17nBmjK6FJK9Ck+kmxHO/moVbJbp3ahejv
	/+ugjV1s9ojhBWKrsbwpwzWKWgzbDafb+TE6AbkOFdQn6nW/ZtTk7QbFzgpsq+T3LnrJw9pomfG
	rXsg2VxiaSz781hNCgDVcb5rZx860=
X-Received: by 2002:a17:90b:2d8f:b0:366:5283:cddf with SMTP id 98e67ed59e1d1-36a6c6531ecmr10069265a91.9.1779710491632;
        Mon, 25 May 2026 05:01:31 -0700 (PDT)
Received: from zero-fedora ([2405:201:3003:2974:90de:e8ad:aa6:53b4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a723cee01sm9241673a91.14.2026.05.25.05.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 05:01:30 -0700 (PDT)
From: Condition00 <anant.kavuru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ovidiu.panait.oss@gmail.com,
	error27@gmail.com,
	gustavopiazdasilva2102@gmail.com,
	Condition00 <anant.kavuru@gmail.com>
Subject: [PATCH] staging: axis-fifo: fix wait_event_interruptable() continuation alignment
Date: Mon, 25 May 2026 17:31:16 +0530
Message-ID: <20260525120116.86216-1-anant.kavuru@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed the continuation indentation in axis-fifo_write() so the code matches
the kernel style and passes the checks by scripts/checkpatch.pl.

Signed-off-by: Condition00 <anant.kavuru@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 3aa2aa870ea9..7b96be052c55 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -246,7 +246,9 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		mutex_lock(&fifo->write_lock);
 
 		ret = wait_event_interruptible(fifo->write_queue,
-			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
+					       ioread32(fifo->base_addr +
+							   XLLF_TDFV_OFFSET) >=
+					       words_to_write);
 		if (ret)
 			goto end_unlock;
 	}
-- 
2.54.0


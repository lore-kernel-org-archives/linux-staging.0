Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3817038B7D5
	for <linux-staging@lists.linux.dev>; Thu, 12 Mar 2026 09:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773308250; cv=none; b=ggSTMczVWgI+10oDZqMTod+tczofJx86oLppJnMf/wrCChBu0/Q7d7UlUd4T1q9vYYahIWTaOyYjd03h9bWoFmJQIpWoRfWDD7+0nynV1C55qMgGovl1hcMQ30RrLB94u8ENyjny7RK9anB25dp+9Vm07SLkAuMxA7fGGouyMQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773308250; c=relaxed/simple;
	bh=nDguUz5jWONFB8YlQa2njJdAmhebG5IUaYMxwAqz5Uc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cFOPbZTRMY/eDwdQUdA5y5ZgS9pAcYci6yskGpmWz0VVECGU0ik1Bih4iSFqqqLgMdGbLnc5X4eMAtNX4/8UdfAPGQvXobAUZFmNC7MHV2v48PKhxEhzt05MnYnmnvcpgq9naPtmeQ0U6rSTyeT5eBwFYLJrfc6dSuYxetnRpkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gbq3Y0sJ; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gbq3Y0sJ"
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-c70f91776fcso361404a12.0
        for <linux-staging@lists.linux.dev>; Thu, 12 Mar 2026 02:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773308247; x=1773913047; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jhY9mZgpRbf1QA0YznPU7J2EgiopISI9ez2TrqU3Cxg=;
        b=Gbq3Y0sJl8Mlmz95SR01KOMgCOD2z38v3FtBGWFUwsJvGUix4XqDbSqe05jVoBs29E
         zDF87EvGHpUnryfb2LMOCZxT0tmZh6RDcqWXp3RVDTkCXTjKBJrWALp86HHGe3H+KzNR
         4Ul4C4jE6njvPxFLWn+9AEgDjak/WdcPpHUmDC45NHPkcKEBgdi2V+J/AifL4WQgWfly
         HbyyEHRAlC+LfjEALeL77KaYmTjpCz2UkOXP0o0aZ9hdhtoN7NwHtBiNDQC1PjKPS1qm
         hSMD8xmTCzoAz1MhzWuifvA8QHvHk2NZAYx6wU0PSeHimm0CIxmQLFxrvuFRc/2aDoXu
         BPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773308247; x=1773913047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jhY9mZgpRbf1QA0YznPU7J2EgiopISI9ez2TrqU3Cxg=;
        b=MfiIKjFNI+9Z/VTaJqbHV6HQMdDJuUxbCvJvEHUVOQg9v3M0wYOXNIC38V7zXQTE8W
         in+vwnNs8hlt2X5+hU8/q7gZ8z3zElwXPfmknan1j+Xict3uCFGTQvyJtkZEjU1bWzyy
         KBwcpliG6J4upcpwAjgQ9zA7xH+HefCs8lwAnU3q/NCyb130OxhXmX055a+kYMowcV+2
         01ooAfW4E1XFtY3uNgw4m25poqaNutmARTmdonCzq0g2vO8EguCv+KDgyfo8Urociy3N
         kHRlw0YyPM7TAfmT+kEvltTyGV8dE2HVSUQX+foTMF+LzXMIQ+WYCBJCTZ51G7yuH02L
         Jb6w==
X-Forwarded-Encrypted: i=1; AJvYcCUgpLznPGFGJob/4Se5zASubpq8AfzmYHAcRgvQT7s0a+zaS8CfYL/A45MbwIA5ODgrCYgeSK1j1G3NKPSE@lists.linux.dev
X-Gm-Message-State: AOJu0YxadbrSPMlrP61Z2e3XbTVO0FyMhG8qQFD4wXDU2NH2kmv4Xqgu
	T6akD67rW2iufguk+b3shyhIz4dbL3UIwAUYhdjO9vR3KMVLsKdtoQoC/RM0X9L92nnXRiPP
X-Gm-Gg: ATEYQzymXbq7dVGksF/EeMwpkHPsPf2y8ngYiz0ZfBV7ppaGi8Gh3ehIvDir9F6s8DV
	zQLgX20ESdf2BH5PKi89Fm1IvkiOlKomSroLaTI+1x4lwEq5eX3OyV1RK8KYXBZL8PzOoxu+keE
	ED7Bhyx6D5UwRtX5DNorDkfYjSctfNynk6Var34ZC9Q/sDE4Ua2Ri3uibx3Zt1+tUZpvFNPQ7RH
	2xbAWLAyHkKso3Xq3sE5ZDCZI/ZD96QwMS0ueIjo86etpEeC58P579lRBqrIIBQtJ8Z3Jrq6TRt
	9yAci6Qho3O2XMrrdFDIIwwkVY14WZEHLq6KEVDqB5OR1ecjpIbdRhNcGjtBTXgmzcbFHp/gxce
	Up3qdzQzteuPQwEbzpTWUrYULNHsUcIVncXVPuVMGkKO3ZuXYP36b8wUr4295adWQx1Luy1X9fq
	rKxJLcpxLOgUiaYwUEb+hyAbh2iXgGqatBdSWTmYs1YhsieWq4g5Aqtd6X9ea3P2uiOu+B3y1Rh
	Ho=
X-Received: by 2002:a05:6a21:46c5:b0:398:c2d8:14c with SMTP id adf61e73a8af0-398c5e6e2bcmr4972430637.7.1773308247493;
        Thu, 12 Mar 2026 02:37:27 -0700 (PDT)
Received: from CN4GKQDX76.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73cdf32cfcsm4564753a12.15.2026.03.12.02.37.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Mar 2026 02:37:26 -0700 (PDT)
From: Zile Xiong <xiongzile99@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zile Xiong <xiongzile99@gmail.com>
Subject: [PATCH] staging: axis-fifo: fix indentation
Date: Thu, 12 Mar 2026 17:37:21 +0800
Message-ID: <20260312093721.84291-1-xiongzile99@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix indentation to satisfy checkpatch.pl:

CHECK: Alignment should match open parenthesis

No functional change intended.

Signed-off-by: Zile Xiong <xiongzile99@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index aa90b27197cf..c64a7249feca 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -246,7 +246,8 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		mutex_lock(&fifo->write_lock);
 
 		ret = wait_event_interruptible(fifo->write_queue,
-			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
+					       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
+					       >= words_to_write);
 		if (ret)
 			goto end_unlock;
 	}
-- 
2.20.1


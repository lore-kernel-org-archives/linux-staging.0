Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525423B27DE
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 17:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778432859; cv=none; b=ORCgIjNeP5nZvQ5E1OlqdX1hcKWLmpdx69O+NEUHYODvOE+wGLFrGyvWffBHqmOKDn7U23MqTIFl/Id/ZRgc66eIBGHjaefqRcMXTrlB6a012GqhsM3uAtne/zIP63t8egiXTQdEKb1lhSy9oFRZd1YTqlpE8j0dpb4K9c4mZcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778432859; c=relaxed/simple;
	bh=WxET8MtZ9b7hWcRP/dNghj/gLWY8wxwvpRaPYZStInI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EuiFz5ew4prBB2rxAFJvqrezgxv/9WVklusc6L2p68PC+qfh/IHHi4P+m5NQVANmOTjRMq4bnfhsst5YU26JzLzKeUICbGkBhuqRaxvShmgCIbttGZ+FEinftRRdF35/qAhffbC0Erx4n3KJcLCbHe8zqcqIFfsQacoAfUmxXRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e45wGmax; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e45wGmax"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c70c112cb61so2655451a12.0
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 10:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778432858; x=1779037658; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UCMpHYx5OdqRfXIxqGMrAzgJT1FnJhzePaoBJ4MAlLs=;
        b=e45wGmaxbBM8NFqDmTNso2hyY4uFBsTQkAhhTs5vusGRINIziEcTV5wtqEfZj1C+DM
         4Od0EgDssqs5v7xB+rWajeJMIfIWgeWeqnwWB9yAPYVPqz7rHTxFDyaZ9zSMfvx1RwUK
         oMtzgqQnMSO+8gdIf3tCUJS/PPZQ5y6zLnyoSdpB+COY3XXBJurszrh6w612UlS7jbUT
         ghGKFK8rajXdy0S6IkUZ+HEtQU1RgSYENNc/8PujRORE4FM7VUM/l7Aysz588fDkQer8
         gsKxhBV3tu7zBNWeFMbUwuNAv2Y4nOCAl24VflGOSqRlelEN7R0+btkYVtbLlk+kSvyX
         rJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778432858; x=1779037658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCMpHYx5OdqRfXIxqGMrAzgJT1FnJhzePaoBJ4MAlLs=;
        b=q+UeKctcJGd2gFJgE17DFZYIJogfer8EF5A4cpf9q8wOZzlEuxCob0wRWAy1P6qZGk
         nN1LRNCfbo+cwqqKtuAAmITptzzADPBT+j0R93K0b1W+N0rIVFsyozg1UkvAu5ihhQF9
         3q1Zvvk7bMSYv2VlAejyZlcKyaCT0ggX0pzaY9l7WIsud6N4Es107zksbv+A65+ggrqY
         i9n8Lek3z+YV6s6UB9h5d7YQCPZXY8cNWMOocHxS2t5wOotFcARd5jxONrsy/avq4Owa
         mhVYhlRTt1i8UIKOrL7oEZ34hZp3s3xUevJ+4YtwygKlEQezXHMxBHNZJ5sl3swQkoFb
         MAQw==
X-Gm-Message-State: AOJu0YxIB30Cwwhtr1nE2zNuV8YVmFMZPYNGYq2Z60XKqlvSviQ3HB2Y
	RJanjP98oGT13spMuGujyc8pIrFwifWzING66Fvj3h0Mf5zlo53y2Z6x
X-Gm-Gg: Acq92OF3IGo/BvAEVQIE9/RixrPJjxJP/EeLyzR4H3PM9UIbd0iyQSfqXZtQ8OEhYB0
	fl3ramnrcj0vdomNOQ/z1scmVthO1LCLrH8LDWW0057jmgVgrPwEyfrEX6SaxM3UYKfpSFhLxq3
	x4lLetnaX3xE7OKvCsV6Bt54wAYEw2iVbGjQVjv2lQtwXB/W5/vAoDaBGxYexQg7JDJYAclry0b
	bIIZn+t2CvNML+Jn8t9TxgzO1AxvJLyDDExNmXxMeXngpKCtVJV6BwuFpJoR6uEpk8d1UTiuozy
	98ucCHSMUggEYMaJvdMXL+L5O8EULCFYI+cOraiI3+SNK08SpmZQAKxWKNy9dJmrnbyyhSEGJb4
	Q8kGDI6M/kBryLYGpBw+MSNz+C7H1fM2CTe83pa6UmNSpQlpCDrUddviDhCgmNsect8jgc5AXkz
	N5F4hD9jHLo1nXmTFVBu7Bd8YuWJQLD/CVOlc1ylDP
X-Received: by 2002:a05:6a20:958e:b0:3ab:13f4:c71f with SMTP id adf61e73a8af0-3ab13f4f529mr335413637.55.1778432857598;
        Sun, 10 May 2026 10:07:37 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d008:80b:a00:27ff:feb6:42dd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826771e730sm6867689a12.26.2026.05.10.10.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 10:07:37 -0700 (PDT)
From: Pramod Maurya <pramod.nexgen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	singhigeet1729@gmail.com,
	jacobsfeder@gmail.com,
	pramod.nexgen@gmail.com,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Subject: [PATCH v2] staging: axis-fifo: Fix alignment of wait_event_interruptible in write path
Date: Sun, 10 May 2026 13:06:59 -0400
Message-ID: <20260510170703.532005-1-pramod.nexgen@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 87d653a894a4 ("staging: axis-fifo: Remove read/write timeout
module parameters") converted wait_event_interruptible_timeout() to
wait_event_interruptible() in both the read and write paths, but used
a single tab to indent the condition argument instead of aligning it
to the opening parenthesis.

Commit 72000df579c7 ("staging: axis-fifo: Fix indentation") corrected
the read path in axis_fifo_read(), but the write path in
axis_fifo_write() was left with the same misalignment:

  ret = wait_event_interruptible(fifo->write_queue,
          ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);

Fix this remaining instance by aligning the condition argument and its
continuation to the opening parenthesis.

Fixes: 87d653a894a4 ("staging: axis-fifo: Remove read/write timeout module parameters")
Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 3aa2aa870ea9..1c34de020cf8 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -246,7 +246,8 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		mutex_lock(&fifo->write_lock);
 
 		ret = wait_event_interruptible(fifo->write_queue,
-			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
+					       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >=
+					       words_to_write);
 		if (ret)
 			goto end_unlock;
 	}
-- 
2.52.0


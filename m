Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9029B269CE6
	for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 19:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779565142; cv=none; b=YCJ44AKHZEDAqVr9M9QLglCl196Ip1bDGX9LIAhoqJMUWV7EwTInU9ruTfUgRRA+8BFvvMeoxhPhy9W0QStt58JjnSTl07Rm6tPB1MhBCVTzF8TiLwAoQzJB0jvro5EmRvSCHDDtlIaU33GUa0bzNSELVINmx1MC6YJDFFxSWBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779565142; c=relaxed/simple;
	bh=SseiSLKnC7BB8OSzRY/2FWwMvzxBKRFtpHRjtRwAxcs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EwhhYpFDHwJWA3UT6169YhKTdZsDtLVBzhVVmSrWonRyiMoLLz5Q6cs7mwvGU7TAfxOtAzDASZdgZifi/aYEIe+aN3eUQ+JHe0l18e4GSLxsJxzeLeD6bT1lpD3dQbz/P/JVqFjvS4+lG7bIJc1JMPg6mLHhquRiG7XiO4TJJp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AdQvysh5; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AdQvysh5"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2baca4df358so52289545ad.2
        for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 12:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779565139; x=1780169939; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SZcqqYXzKaM7BhrdJnhxJU/lAI9v96ZDgNls+UN5FmA=;
        b=AdQvysh5XkU88VTIjaLL8bcPTWBvm+BsvZYYjv+UEqnCa5+UQ5epjw6coF4m6Yl4T1
         lCS9WtZhdtcw6raps29Tu4fA956nQsklgWumGKeC3AOn6OFCVBYrHiZE16c6xZiAlANQ
         TjmJ44BnJklU+ao0p8MKv1c+EMcVLLijzWSblcyEaRkY3BYCdfExJkVS2Akg6iBGrqss
         ojiPMFunAJp6IufKWQwxh3crJbcHOpUU+hFyV7b9lCAnZ1XGZUMwiX6oJIhxx/PJSl50
         xWd6tIkoZNWZeMFnB/p6EG3ZA+lPOzAKLR9nDk4q6hHsiAHhRMBLvaVVCpcl9R4bOVK8
         PSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779565139; x=1780169939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZcqqYXzKaM7BhrdJnhxJU/lAI9v96ZDgNls+UN5FmA=;
        b=RxzRSOC1i6xc68WECd65P+AOgTP3UeNSRC+FGd+jlovORoZoQVdhdNIXRDCeK7Ylc4
         D1mdr2S02+UFxqb1sqwZkZ1X4BaECvHe4d34mbkMfgnr7U2slCzu6C/+UBghX8B/RZ6b
         sZ/FAqwc8LoIeKlKDpr7VtoRoQDUXsEePB365DSaa7nZTt6icvEPOIJPE8oL6nn5Tj9G
         VYeQT/ybXUBPeqiCgETNfQGasTP/6PKfPy/xpQzrudas2DDWuED5ubs1ZSCmq5wprg3F
         MYV1RZDxMyISttf9zMZ2zfqun7dbj15JEFw2A5859uEvuZS9MwY1uf3rUqttfnN7R7/c
         jP4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+ctsT3wQOV2XwSNZLOavas3BctwuoUrNK5As6eX63twbZrNITIFgj5HSSlfDplJiYPL5ijiILuZfd3u+h0@lists.linux.dev
X-Gm-Message-State: AOJu0YzVFE9WIhwxMYO/41QkBbT764F7cj8Fmijnwfu+1+xVk6l+07sD
	rbdM4rlGpemwkfH6y+BLQB+IXaR3MrgrTr5it43Zu2eWKlFDmc99TkcM
X-Gm-Gg: Acq92OFPWb6NzXC4LIrhPGxq11/DFx56x5QLVK8xXUuvzN8OmQkmU+l018URvzxqOet
	fwhlF/abM5wF5fyGgCOnhxbKiuAeWuWSgJVBCY6hY1IOZLXG7fEFHIX2i/8SCHIvzzePW3Cq9ri
	Gx6SLi/RHc9stE8rRzA5Qh6vQGHrXJfWGqxtiGIp8qIjO3IwliMinJC6GEBxzUKqdPmNW97yZtQ
	Gw5Z0U4KDtILd89FAnqoLxYDTptuJV6OZsLcrHzcb10LCaUAjkth4rblc6GVVBL6QretXnpUeqd
	vI/mRx/jmEtupaW+nVvNVa2BkFydCD9ZcC+XJFWFgbqUiBHodP1ZJW4r4zCapqNGt74jOjq1LIr
	dzOyubW02wo9Ag9RK6JXEc3MK4D0ZAxP7GGLBDMiDJ6kNM0yr5fZkSvnWoZpXtPzuyK34CAK9m5
	xdOoM6ka2HIkUF6MpMRizXQ3HOb9kWx/MdzKOHk8+5
X-Received: by 2002:a17:903:3808:b0:2ba:5f24:cae2 with SMTP id d9443c01a7336-2beb07bb69dmr97431435ad.35.1779565138756;
        Sat, 23 May 2026 12:38:58 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d008:80b:a00:27ff:feb6:42dd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58db336sm49896775ad.68.2026.05.23.12.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 12:38:58 -0700 (PDT)
From: Pramod Maurya <pramod.nexgen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ovidiu.panait.oss@gmail.com,
	gustavopiazdasilva2102@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pramod Maurya <pramod.nexgen@gmail.com>
Subject: [PATCH] staging: axis-fifo: Fix alignment of wait_event_interruptible arguments
Date: Sat, 23 May 2026 15:38:45 -0400
Message-ID: <20260523193845.195475-1-pramod.nexgen@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Cc: linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org

The second argument to wait_event_interruptible() was indented with a
single tab instead of being aligned to the opening parenthesis. Since
the fully-aligned form exceeds 80 columns, break the condition at the
comparison operator and align the continuation line to the opening
parenthesis.

Fixes the following checkpatch.pl warning:
  CHECK: Alignment should match open parenthesis

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

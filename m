Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C829C3491E1
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 10:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771671255; cv=none; b=KdtYpjoIugeF8zEtlcXURB/dPpZBmbTbv8LQBK6o1uLa8DlZT+euKDxs3F5IlJYFZP4uJl2RZ5RYDPvsrPh5/QG312nnlAPhq/U712dfdNqUXewlWyE9qdrPXgxsZeZfBrCnktBqaNUPtdUGR1eVlWBrKqWVbMhiULGlGxVLP/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771671255; c=relaxed/simple;
	bh=uJQgnif6MIyUlqx4Op5Icf789J2Mcb+AdnCQJKDmy7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sqRqvHrlZQ4EMgUjRtTGTJ/E+SjCrAIbeFb940/tpJcYqwwwyeVR+RfE8JE9H+/NhjcI8cHuxYyljJAij7wiioPV0bCZw92ZglSDxC57rWBVWW+JxWl5ujE3wa90JQpMERwdr5oR6+rKqHlneSUFaPeDi/Ef2N+O9INp/Er7fss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZVdC3SSD; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVdC3SSD"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-483708b697cso3652415e9.3
        for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 02:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771671252; x=1772276052; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0RY69XowGKEoPGhAubSEw98qWQcB1KS4lcco0wYD4oY=;
        b=ZVdC3SSDIS+8/dqF4h8IS3PhNu7KgSc9MywowRXd470vCpXF0AQCEDRLy7Wyke3VTA
         fnEmfsczV+I9GqKg7AWVnyRSTWFJKezvGLibTASCDQSTcJnx9WJqhS+cmZS1Xer9Z2Hr
         lOlt0KWGYd2kS8w480Uz0JAlgT99gqHGhZSHPKIrS80EgAUblyjILyOo+/noTju4qGGD
         TxanMhi5T3gKs4yGaoYtlEDZSvcQVYJ9CTTgqCj8idFQrfhCiUnI+Oojk8ZQ7SkKltt9
         LSkoyJG+N1zXB0Ubr3Na0wgrTttuT73ewp2a2VS9IgQctXMq9kBSL66SnMjU+1sbBUlc
         FkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771671252; x=1772276052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0RY69XowGKEoPGhAubSEw98qWQcB1KS4lcco0wYD4oY=;
        b=Yo3AVFEkR2JQk0OzSpCKqDjYrq/f/ZBvvjfvIDzuOpEH4pikS97n2Lctfo9sWzfaH2
         yxdFRLwaTL8XjY7xdXy+dJTFC+oLbpyvq+TnXr/eMEYL5Rr0b6k++xNpXjl/WxLZ7A1L
         4A6T5yWOCKwgRHFG4wrpcL1xpSW2OG9BwK1eHfeiyhFtRr6wElUoGyFxit3lFT3rSqC7
         pOmZIgJRXEsFyhgD/mb/QjM9NQap6Jcwq5BOIwvfw5yD+e30wu/QMqvDzSiE8WOj7uHn
         wOJnrO4M4WJ6CibGW/wgS78DfVW9Phzqvrk9gnuOFmZF6TZRF40HOFB0WanFQsxhlPDa
         49rA==
X-Forwarded-Encrypted: i=1; AJvYcCW7MG0DzM8FEcom4BYc5A9/iM0Arve7ZNA/opJyg++FOrriDjRsD0ZHHcYK+02yXfCaV6TraR4MrRj3EMrj@lists.linux.dev
X-Gm-Message-State: AOJu0YyoIMXkIn5Z0VztOW0FfkWgSK4U3cHmcecz5MM0Pwnn67MhLEt4
	1epVsXS8rSfDA+8uUxRWqzdOvJ3Z4eRdP0JinUAspAdeJzMbFPsxTrxaSj97r3/rOe4=
X-Gm-Gg: AZuq6aK4i0FoaJq0ByV/NvbzZbAc2oax0fa3ePt4XETupjzjAKf0Tnw9zQDsA0vfeGA
	kDohitzpzU4kJbKv3aa+LjzfS6J7fDZCWhwnwkJF4whA9ccrzbWn+WmkQWXAV5NFWfO721jDh5H
	Z6aJABSapZnGHcRdPq1hmocK2qOZ211T3lTxSNC63HLVFshwDrWD4g3h5MqoEuBoYV6hM6Y3YD+
	GKmFTB69SaWzyw3xjeRcHXZ0VxU6jKK9+ZxsDpOi/FsxJ10v1t7LarQ33YbeJ5RmkQqQsSn4lF6
	xxHOL3KHKHZy5Sn5i6SjBPgzUVvybcUkhJ9dCBvkb1ek/jEEnA79xVxZQ74LDIE6Q+KkKC4Al6m
	VuEOXOJ43aj03lvBolJmXljy8DN56WsAcarepYbgBhgDFeh7+7vvtMrqtQEIWlREa8cYQaA3ovd
	G6mIzZFilQy8l1uwwnnKBGRashYobtj4FTSP0UasGdEYf5o8cP6U1x1G8j+KfaokAzep2wAd7Mu
	tPp57EhEjKs6iapYUww/f4UvIv0mWdyuOIZNQSmazCnbYe3bHYYWW9y2n38Yko=
X-Received: by 2002:a05:6000:22ca:b0:432:86e2:8fb5 with SMTP id ffacd0b85a97d-4396f114890mr2680016f8f.0.1771671251722;
        Sat, 21 Feb 2026 02:54:11 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9ff5sm5068038f8f.4.2026.02.21.02.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 02:54:11 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Use kmemdup in sdio_ops.c
Date: Sat, 21 Feb 2026 14:51:49 +0400
Message-ID: <20260221105148.309255-2-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace kmalloc() + memcpy() with kmemdup() to simplify the code.
No functional change.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_ops.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index c9cb20c61a2b..6e03d3d8a6ab 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -583,11 +583,10 @@ s32 sdio_local_write(
 	)
 		return sd_cmd52_write(intfhdl, addr, cnt, buf);
 
-	tmpbuf = kmalloc(cnt, GFP_ATOMIC);
+	tmpbuf = kmemdup(buf, cnt, GFP_ATOMIC);
 	if (!tmpbuf)
 		return -ENOMEM;
 
-	memcpy(tmpbuf, buf, cnt);
 
 	err = sd_write(intfhdl, addr, cnt, tmpbuf);
 
-- 
2.52.0


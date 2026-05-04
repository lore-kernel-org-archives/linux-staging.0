Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7E43E51D1
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 14:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777905978; cv=none; b=L6lGPvQR9pvcNJ2aulN9xicyVNrwjSe18UY8YO79h4MrpgCdDbErMFvYmsdq7gB5FTa7m8fuFY0lMTNMPGw56nlZtvhILyxOEFA37eEeJYfkJt9h9D7WwUcLKEunpUjW7m0D0fgJCf8q3mL0Vlv6ESliqAVguY0sDC2/2XnOaR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777905978; c=relaxed/simple;
	bh=pU/IZ3Cb0ZdLTOUut/XZ7b0zkUm07w6ooKgbv1GpEKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LorGmckBxfilQi8YhkDOUck7IgAehr9vdrNbHEUpgSiZYIpHznbln/RXwp72EkZZSibt+p7q1Lm9TW+SQ7vrsqz4BZ5N1+mGkGFGeJNSsR3tkZ3w5gXqdpyvT7iW6SwbMeWNp5OzkFuw+JIC2JzmnLLu5IKwm6zgTV05JvUz9Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MejxYCW7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MejxYCW7"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48d10c981e4so1773995e9.0
        for <linux-staging@lists.linux.dev>; Mon, 04 May 2026 07:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777905975; x=1778510775; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2F5ypXoNBfSK2GDWueaCHZ2LLEzn8ANr0z5NfQhFyfc=;
        b=MejxYCW7gTXAN1LrR69xo0WzO7VTB52kUPGUDuocRnhfTNqaMVuQqlqFu07yBH1cFS
         5F9lswupt9S5k0896mOvptj6UNuFRTx/Ec9cHrT1yQ9vX6z7AJ3CaYDbXx1tEc9NA5bE
         OGg4XDngK2MmWFN2f+rl4UVmpZYNGlNFaXC2INaosdRwMVyqP3nURTCVLO9BiTFaxjlq
         2RmXWSQNbINpk6QCuP7dDok7E8/OtrpEG/ruNXvfl0eGtoHib4snAiyEvBQARnHKitaX
         fR7C8XUSZQauhih4xJOKLcuO7W6c6z4O3lPzxO3HC2A+4XuM3SC+X+E3xwVL+lI7ebIZ
         AY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777905975; x=1778510775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2F5ypXoNBfSK2GDWueaCHZ2LLEzn8ANr0z5NfQhFyfc=;
        b=qZk0OD4vfIRYOE2oGn7aLlYjC05fpy9ghryY4ycBIBFPoPKXBV9+ZHR93P8NWmDJKt
         tBnvt2UfM1otnGuXY5drbwFDvMCmmYMFacKrlT9CUwmkCCbS8ORiwxmrsm5DF8px69DA
         Ts476iqXJcwFaqWkeT3W3KMtUoDsuu5A12q1GT/MiHu1Pzth4X7mPmx/i0CoUsdxbGwg
         1KlgrhpMKpZBK8rAMJp7KFVbgaG0y83Pz3/PqAsg5FR7HKuVyz+MlkYbeVmyx17lFjE3
         TmVjoVt1TN1LTCeg2aaDuH8uPBvu29mpTP15HrzVXJNH4QSF5WzJLNjT9ltMbj1k9ScA
         /zYQ==
X-Gm-Message-State: AOJu0YwigcHJ1poy0Jx0cK1YWBs2dAzyrOXcJ4MqXbltSErzKQGCNm0v
	Cfv6XBfPdWtvVxZ/1+jmXcRsJDYn3EPZoPQgd8zbuPA+r+jzRQOWFWkO
X-Gm-Gg: AeBDiesVoFcqpG00ZM8iXIN6DxgArZAOCrheTgHl13EOVuitQXwCvz6lGpkXjhbhVmO
	LTMOGmbsiLXGtDdg+O8PUtPcYJVX25E1/yVSL+FJIalsidfVLCQkdcrytAHVhQtsJKUJrSrTNHK
	3r3x2jYzOMfees4XzkNSb2v/G7nV/bu+Pn4CX7A4tpY1lN6sNXE3/dgeHJC46adjPlKoKD+6JUc
	FkUD4XzAKV9naZLXjsO0dZmM9b2I5a4WoLmZF1OES+6EmARJq47nH0AUQhFSD1hzxhwZ8dYNP3V
	iCVAeSMdnoREg7Pfav7B43e4sjlFLMMlqmtrZGLmX9VaOzAAIIUjYs+wXCbVBh1JFZji+JTtp1v
	ibc6Z+wxpAfVTzYWU0nwFx0EJYJVjj3KVxhLsizO9X1V/YtiftftF74hULJ43rSzxbQiUCnQkF+
	g8jgkL1b0uG6t5fnqMkIf9
X-Received: by 2002:a05:600c:5253:b0:48a:56d4:7274 with SMTP id 5b1f17b1804b1-48a9865d363mr85548285e9.3.1777905975009;
        Mon, 04 May 2026 07:46:15 -0700 (PDT)
Received: from lucas ([2a01:e0a:354:c290:234c:5dad:48b0:9188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a981ded99sm27133296f8f.18.2026.05.04.07.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:46:14 -0700 (PDT)
From: Lucas Poupeau <lucasp.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Lucas Poupeau <anonymecode077@gmail.com>
Subject: [PATCH] staging: vme_user: add missing blank line after declarations
Date: Mon,  4 May 2026 16:46:12 +0200
Message-ID: <20260504144612.12727-1-lucasp.linux@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lucas Poupeau <anonymecode077@gmail.com>

Fix the following checkpatch.pl warning:
WARNING: Missing a blank line after declarations

Signed-off-by: Lucas Poupeau <anonymecode077@gmail.com>
---
 drivers/staging/vme_user/vme_fake.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index be4ad47ed526..d108f9549b0d 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -67,7 +67,9 @@ struct fake_driver {
 	unsigned long long lm_base;
 	u32 lm_aspace;
 	u32 lm_cycle;
+
 	void (*lm_callback[4])(void *);
+
 	void *lm_data[4];
 	struct tasklet_struct int_tasklet;
 	int int_level;
-- 
2.54.0


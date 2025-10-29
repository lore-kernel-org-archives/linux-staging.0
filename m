Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CC42236F7
	for <linux-staging@lists.linux.dev>; Wed, 29 Oct 2025 02:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761704412; cv=none; b=U6FoiNifuIqQ4AspY2vGssUjaITU+0Lz66SDG5AjPLdvu91ZCD+r73ehAAcieVLMWodjWNpyNBpmiSnq/jETv44IOI+1H4ygFWDftX0W4K0K9vFL1b/5DbeegvB49avmDx8vJ/EIbEDcsxOmOZ8Rj1dMW8d1w43NKcSCRvuKM6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761704412; c=relaxed/simple;
	bh=12I7O+T/BB5vXrNWDf+G6+4oR7EW0ESEut/5OnczsIY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=emd1hXhtWoZXANzRKSO5cz6pNfIi6LPq1qFtX21BpdiWS54mq7hGArHRIpiLgicUAeDpNxNQQ73niId1hH33CGd7/YAMGPYR7meaTeG+nPRy239qXEMgthr83IFjW8HidufDcZlmaH7w2fVUslK33XkZLBgYOszudH4pH/duXT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b6SocqV3; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6SocqV3"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7c2878bdf27so4243486a34.2
        for <linux-staging@lists.linux.dev>; Tue, 28 Oct 2025 19:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761704410; x=1762309210; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FHoGag4qYuBHkU394iiXcv5SpnjOGE5n7s42K/stQF0=;
        b=b6SocqV3T2xCnSaJQ1ChQsBEztwHT4dcRUM8iD6RHB2+m7DqON+TkXnH73Gi8JhSv+
         MQOjoaipMD6UykD1ZbDiGtwwsGhe8tzz2K2nzShawn3WRhCBk95nRKbQOpKx0zX4z8rO
         fM7toP3uXzWtavk3bWQYN9+9m+rYquY1fzEo6T03mXEQ+8dYrk7JZMVwCaooEC0KOm68
         pid6fle2YFYeUVaALuRFlYAQ2yzes+5VYaZF8AhWEpCag188aC/aOBP+B9ERMIZe1bdv
         vI9jWTKhP0QpnyIYHLhCJ1W0aCBAO56mxo47ma2j8hHTWmuO9JgQkntV8DN/AwW+ETVD
         +dVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761704410; x=1762309210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHoGag4qYuBHkU394iiXcv5SpnjOGE5n7s42K/stQF0=;
        b=TLlKetsA8gMa7BobZAPHCm8uLB/IEARyAWAMF/DgfeVfGOoJpMmXIvzezRvNuM3Qjq
         WF2Z7UHqzMydAypmF/e2+CHKAPX8wl8RKA1jmqfDNAvDYkTtl/Su/yTj3Wh+pj/REJ3q
         5gLBYxIKPYjl+J7GjgOT6nvJZm6FDHH2PrS07UUZI/sljHOfOxu8zjeJmqIk9b8BuJAk
         pgYePWKthDR5yaol5mtt+UKIrtRlNRG9xuw8hXl+P0WygZ3l3nCvNqddyvSGdc6l4iia
         rCEZlA8jF7dF2wyT5vWYhS/iV4lNtk7hUShEAomBWpUiAEMUiwZVqdCYixXN/hrnAiP8
         mHSw==
X-Forwarded-Encrypted: i=1; AJvYcCWrSLw06LWKq+G61rMwHnfzOazcglIHVNL2v5OiT4BVLBCblsgBVZhgNOnMz9daclN/N0zxRnWPgrd6A70g@lists.linux.dev
X-Gm-Message-State: AOJu0YwGli29O/jux4YwETb3QaSoJMOQL3T+QujYNe/mU1YcxTN/dEMC
	71YyEtYkJREempAs/S7aCQrqnGSMBefmU3OsBJd2Liir7awqhWGg4FZ5
X-Gm-Gg: ASbGncvdNFotTRZ5Ct8sNaOja8XhSXff1uw6i/hl4Sz3KYzfirDXazpfN4I6puEEEZe
	WwsRfE1F8Rv0QgvIJaqqYilT7P/ci2yNqYuttidV6E0g4AYcIdeEhlolNdiYgKE3kbqt/1BXU/T
	YAYoMiWuRNiOISGPnxtgBfvh/l1Bn406YC9eOu4UZqRI4sj0uKlM1g65bph5rrFjYxcQlmXEz9q
	E/4qYKKBAMG/9Ywr0RaqBMCq/5cZLMiQAw5YN6DGh64kmnOQunM5JkxWLkAMyVV4ApDwq4gTXV6
	OUcjdAEpw1wL/4eb6NWcM7bT2qvOc+DVwX33QgSMjz7N5pDvY/VWO0LJYeghwazXXRpLeXtkJ5X
	9fycVr0JrWMe/Nub8b8IEK62C6zdwgNqzeSsmx6nrHw3dGdksoQcW1J9aQ9Hla4m44G/JF9W+Vo
	FiIY3H2NTgbwFITMHBSsUzuxS362xdAisN
X-Google-Smtp-Source: AGHT+IG8RadSfTV9b/Jcr3hAcs46CGuklm2tmbfKHoIvqZk7EadHgn5d3EWjSr6/j4EfcF3GDY6P2g==
X-Received: by 2002:a05:6830:7107:b0:7bc:6cc3:a624 with SMTP id 46e09a7af769-7c68318995cmr940907a34.32.1761704409994;
        Tue, 28 Oct 2025 19:20:09 -0700 (PDT)
Received: from localhost.localdomain ([104.247.98.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c681eb5595sm499344a34.3.2025.10.28.19.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 19:20:09 -0700 (PDT)
From: Cristian Del Gobbo <cristiandelgobbo87@gmail.com>
To: sudip.mukherjee@gmail.com
Cc: teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cristian Del Gobbo <cristiandelgobbo87@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH v2] staging: sm750fb: style fixes: align call and split chained assignment
Date: Wed, 29 Oct 2025 03:20:02 +0100
Message-Id: <20251029022002.5812-1-cristiandelgobbo87@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Drop previous change that made g_fbmode[] elements const (broke build).
- Align the continued arguments of sm750_hw_cursor_set_size() with the
  opening parenthesis.
- Replace a chained assignment of red/green/blue with a temporary
  variable to satisfy checkpatch and improve readability.

No functional change intended.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

Signed-off-by: Cristian Del Gobbo <cristiandelgobbo87@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 3659af7e519d..94a99af4320e 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -121,8 +121,8 @@ static int lynxfb_ops_cursor(struct fb_info *info, struct fb_cursor *fbcursor)
 	sm750_hw_cursor_disable(cursor);
 	if (fbcursor->set & FB_CUR_SETSIZE)
 		sm750_hw_cursor_set_size(cursor,
-					fbcursor->image.width,
-					fbcursor->image.height);
+					 fbcursor->image.width,
+					 fbcursor->image.height);
 
 	if (fbcursor->set & FB_CUR_SETPOS)
 		sm750_hw_cursor_set_pos(cursor,
@@ -538,7 +538,11 @@ static int lynxfb_ops_setcolreg(unsigned int regno,
 	}
 
 	if (info->var.grayscale)
-		red = green = blue = (red * 77 + green * 151 + blue * 28) >> 8;
+		int y = (red * 77 + green * 151 + blue * 28) >> 8;
+
+		red = y;
+		green = y;
+		blue = y;
 
 	if (var->bits_per_pixel == 8 &&
 	    info->fix.visual == FB_VISUAL_PSEUDOCOLOR) {
-- 
2.34.1


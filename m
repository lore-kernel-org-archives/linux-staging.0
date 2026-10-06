Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781D049C4DF
	for <linux-staging@lists.linux.dev>; Tue,  6 Oct 2026 16:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791304276; cv=none; b=UAqUY1OX3mSF6DLdmCKZzG907WuGZWEQJH/3SJ5aSk+SpZ84/tjJ7YqKzaMJI3me9fmO+DFPLi3+AE1KuJWqLsCDsKpdLE/ADiMjaivA/WEhz0LI8BZfBDebkW5Qskt6ulHiXManSp2WoG67uH5cjqFlcp0jPrIJc0EVI621a6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791304276; c=relaxed/simple;
	bh=WXcly/MABuM+KHwXWL2hf3oERsAi0yaIkHJOZ6o97cA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rljGGXu0JxDCnY9L09s1gpkh1DdAk1pIo2dw7n3bryagmu2ihVSvTg5RurRQDKBluFORnlZCghxCVl9X45RI6U8OVrY6PDP5cfqJkep0DT3zo1C3UbtWnrMYK+CA6U5+AsGI3iAWdiRus5UE5HLJaaOuOYV7iJhu7rwjt97LTJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pGWAvI90; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pGWAvI90"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7c3b75caad1so409920137.0
        for <linux-staging@lists.linux.dev>; Tue, 06 Oct 2026 09:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791304273; x=1791909073; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ywN4tNJNNqDRUPP3AsT8Nesevvk83PmWOswuYVqECKw=;
        b=pGWAvI908sqRQ2Qptpuow0dK8zX8dUCx0KmX6r3vqhdxlWJsnRqlQ3QjxvAnzN6xb0
         TXx3/I6mOqecytiGLyHmtCILGnpr8oJQBY91vmYbhZ0CrKoaadNNnk8hW0Nd6AzFgOfY
         jl4e2aGFl8Zwq3jifQpDGfk4di9TASYxi7juiaDTEV2Le6lkJ91tp18CLMjJrHQl8URn
         p2W/YImVIYpsuKo9JedroBsDDkqMOEHTbG/t4cyiPGfgjnFJ8+fEZ3J3VSM3J8tkAH/f
         v6XmSFseu9913ARGiPlQcTwM4pq8vqzX1vZO1l643TN+xM3TAZHmTC11QcQQNabfiReN
         vxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791304273; x=1791909073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ywN4tNJNNqDRUPP3AsT8Nesevvk83PmWOswuYVqECKw=;
        b=RTdQIsaS7YeA16zEX/PwKwE/3Ajg003phslpeXo2i30jkePINKfBILX68AvfZNCVr9
         iB/yTaTPnn1dSDrEku5CzDjnCrzK+Fh1IbhZQdUpmWTc+mQ7FvgMSCZIFY6KI9NrXnP+
         EWxDVULJ3euB0r97oQ0F0B6ENZu8lB5yvcF3yZQUTKmmpyQYCT8MmWwa7Ovx5xV03jdL
         /2Ur4xJPlbgEtsmzgjuAgrHqVDkakqWdKZSBet1iCp+Rl8cC3oWp6ZUMJOxIeVx6CrpM
         Hvo3VVp0gWolcR1bkjss1ISUjO1t588tx+yYDAZCukEn3abuNAT4wvFKtA+xy7hNi7eR
         Ozgw==
X-Forwarded-Encrypted: i=1; AKwUvBy8UwJYn0MZvxXlF51Y5j5acvEh3k4BsVZSq3CPsqR6a5w8Si07vW31FOlux9U1uofEhoLKn5jaC5LlW9c2@lists.linux.dev
X-Gm-Message-State: AFq9FYLV92Yzk/LF9KhqWoMt2Xsmrr3ZBF5UZdL4D8HlJC2RLtbz7d6Q
	VsFbkLscyFXrKGHoUmMTGApQZ4vna0LOEX7ss3LeGmLXiiuCxxONNORf
X-Gm-Gg: AYBFou3Mr3hpLZdkpNTyGVxkND4dnuCj8vP8LtwPOmzd9sxAr53Ph8ifq7Qlghfsa81
	yvhWLxOp/FH2F9x6H4dN9TZXLtiJehwV9gQNmsulBxxhEH3SpkF7DO0rKhDfmlOk5Zpjs3mQh9+
	fd5gqhj477MvCSjV5BPYXxHtFPkNYFx5FSdK3Odxt2PsXkduiWV690x9ny/mb4u5H6EKkfp5oHJ
	w23tigf7ccNjQfjv3AhdmABrbf9FVzOmvrQavQfZlI7+joD9U9rZ+IysvE9aO+2fWClF8ZTBJkJ
	AEz1FpMVMKnliRfprF4hwRPjxx/0rRkasSYfMWszHGYonU9d/7KP3pJFF3zBzl8GlOT79sRqDIu
	FFGeHE5HwmWhqm3cfKNflDioLGiQ+iiPgoo+SMri2jsK4AFaYZQ9cax/qof1589iERV9UPDBVNW
	wyZOtHYpi6bhQJbUV4kLZWzz1YqpuJ8phLIs5lwR9zxFaSqbsAcF8FBid2Sb/leMMwArXLCcYaz
	0VXi0dDue4V44VUdomd+z0tNLDpPSgsqDzZExDO
X-Received: by 2002:a05:6102:1628:b0:7b3:32fe:77b6 with SMTP id ada2fe7eead31-7c875583d16mr612192137.3.1791304273204;
        Tue, 06 Oct 2026 09:31:13 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:65e4:8ceb:88c7:bff4:c488:f682])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7c0ff5c49a9sm13562366137.4.2026.10.06.09.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:31:12 -0700 (PDT)
From: Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
To: sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
Subject: [PATCH] media: staging/ipu7: fix typo in comment
Date: Tue,  6 Oct 2026 13:30:55 -0300
Message-ID: <20261006163055.66095-1-contatocaio.ferreira7@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a spelling mistake in a comment: utlization -> utilization.

Signed-off-by: Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
---
 drivers/staging/media/ipu7/ipu7.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu7/ipu7.h b/drivers/staging/media/ipu7/ipu7.h
index ac8ac0689468..d045e16bbcf0 100644
--- a/drivers/staging/media/ipu7/ipu7.h
+++ b/drivers/staging/media/ipu7/ipu7.h
@@ -114,7 +114,7 @@ struct ipu7_device {
 #define IPU_UAO_PLANE_MAX_NUM		64U
 
 /*
- * To maximize the IOSF utlization, IPU need to send requests in bursts.
+ * To maximize the IOSF utilization, IPU need to send requests in bursts.
  * At the DMA interface with the buttress, there are CDC FIFOs with burst
  * collection capability. CDC FIFO burst collectors have a configurable
  * threshold and is configured based on the outcome of performance measurements.
-- 
2.56.0


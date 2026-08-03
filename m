Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7C3313540
	for <linux-staging@lists.linux.dev>; Mon,  3 Aug 2026 20:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785790107; cv=none; b=coYW0fn9Rt5cjiLjdI3k2+RLEEFoIDacD0z0il00x3MWeLa4V2vOnN/IW0v7KLIiPVEF2h/ftaqGeXPF7LkDGxxPcTq9fz+jjQfSTb7E/vpz9MkDlR4szsba2HglX7a9jsmLJ4SMVqSlbMzLDjL6CkZdraFBsetFbgq0FBp22Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785790107; c=relaxed/simple;
	bh=VvhwB07568DvV5bgQyv72ny+KgKuvscAVdE9pek1CBo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mIdcHCbpGLv4l4HiZySkezbnjSy5fgiCLfRjvzXhVqkmM8Nz21Sf9FM0tZ8Ln58qHkVfMpzfG7kz0XMVyPFjdgWslgE/tfwth6yeOH0wZectBFEQs2zNVeAC51ekVygZ4GKrxu7B4+zODG1E8uxF8l7LhkQM0yoWysSi9Z1MCik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXw5skl6; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXw5skl6"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso2195029a12.0
        for <linux-staging@lists.linux.dev>; Mon, 03 Aug 2026 13:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785790105; x=1786394905; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G3fO8E2RYbXGGnjlyg7CAHFcqpIi7gcn95UKTVR+HcU=;
        b=WXw5skl6kv+LF9nDPGx2fDfw+v76/XQkxZJFpKd1hoazBnuOCGstJkYIOYXETiXfdQ
         KMqmz49jV6Eb/C5CqnHneZRSTgjDLHGK0PNeDW5/J/Yjp78Va9w03C9pb5SyJNtGQcHq
         iDYNG50qLMlAmW3JfDcPIIn31KFUX7lkIsvP21GIAPxdgMfL9vbCD+Zsut6vepOllfUp
         +8t+GMn9bM4AEqql80NUSkUpTyAJD8vSlLZfjTQzX0r7M9EPMEZG5z4yEN7VFz8DDhwo
         uKWmZ1li1nVHb+w+pekRq14pKH/kWVImZ8mG75IK7S4ZNqhoEqGmfIFx1VAtyvNSy0ve
         +4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785790105; x=1786394905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G3fO8E2RYbXGGnjlyg7CAHFcqpIi7gcn95UKTVR+HcU=;
        b=oaHn4Vw6zsqkSww2g/cECXVRI/zwY0Eoi8ml9W66/jjfI90IQ1IsoQOWOhONqEmcIP
         HypmPatkhZtPCGyD2b9uKec/XJEvLfdpX2cr5YFFG6EurF+svrH9+OG2QkLoE0dhmIud
         PTLexW4aDHLR6X5RWrV0atym2V0Y/hoblLYTmHlukPkGfZuRcfxj3wNLAvAO4lrPPKk/
         cJr7DF/NWp402Q4Lz+/m8Tgk/ypJmzKPkKNcoLCIWZSjTJX9D/r4uCt6Ah1nQEqriPhV
         iO5L+Oz2ylR1Nkr44aI0tBK1hvq89grRM1JnTarERi1koPsY4ATKnGDUp7y6T53nwe+Y
         vc3A==
X-Forwarded-Encrypted: i=1; AHgh+RqwRrb1wr6oUP8MlnUuhtMD6SoLISjANsxjou/HNxEX5koiNbBN6G4bu8C4ogfXF8jElfF6H7zTk61Sh9Fb@lists.linux.dev
X-Gm-Message-State: AOJu0YwK6RCIfxtrceuhypO1Iy1evnK1XZYodHV+gLah7p2S0uVum6MM
	LSelYyVOylYoblMX6u5ed5jmDc8jk0QZOAspOY9W1e/ZGRagXiefXwW3
X-Gm-Gg: AR+sD11gMTH54ZFuGC8k0L1bBIp575TJNfX9iIifiEArtuQzegrCotJIcZzy8Tg1QNE
	L2l/qmU6sa/cymO64z2BzFISmTMkzkcdOm7s6OeBnRYx8aNy9uE0m7U7RzO4zdAuhCy7oQhIwQB
	6LaoOA8NpjXC+gGcMLV8/StY9Yjh1KLkyPWuHvZ7qF7/oeEffWKjv4R/xNUGY30Mc2OAWwRTbg1
	Xdxwptrtwq99Nelu0o4EJau00o8TupL/mYn1E07iiix7TO2ob8v36t41A9ntwH8IDYfrBJ7lm/7
	Oapby0vkZY4AOio171e4kQllCXbcx+FXxcwe4ccKb6oqLhg4m3BOd9PPgfGBR8gu22kcth8Po0r
	zEtJPZb+kdEl49weEm9grG+qNokhYLYkztGcLUzRi7segoq9qoVE4onPc4h76Ie4fBncd7w/pBH
	mlBv1fJYcTah9LMD5D1QisPMr2S1l3uu70BEaZNrAOEQ0YFHM=
X-Received: by 2002:a05:6a21:9983:b0:3bf:7eb5:9459 with SMTP id adf61e73a8af0-3c92a5b2207mr11427109637.20.1785790105229;
        Mon, 03 Aug 2026 13:48:25 -0700 (PDT)
Received: from fedora ([2804:d59:8b31:f700:e09d:f90b:1a15:729c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153ddd7a33sm38411525eec.12.2026.08.03.13.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 13:48:24 -0700 (PDT)
From: Pedro Amorim <pedro.aml.dev@gmail.com>
To: pure.logic@nexus-software.ie
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pedro Amorim <pedro.aml.dev@gmail.com>
Subject: [PATCH] staging: greybus: Align wrapped function parameter
Date: Mon,  3 Aug 2026 16:47:43 -0400
Message-ID: <20260803204743.335743-1-pedro.aml.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align the wrapped function parameter declaration with the
kernel coding style to improve readability.

Signed-off-by: Pedro Amorim <pedro.aml.dev@gmail.com>
---
 drivers/staging/greybus/loopback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index ea57b1f5d156..374ff4c4ca15 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -589,7 +589,7 @@ static int gb_loopback_async_sink(struct gb_loopback *gb, u32 len)
 }
 
 static int gb_loopback_async_transfer_complete(
-				struct gb_loopback_async_operation *op_async)
+	struct gb_loopback_async_operation *op_async)
 {
 	struct gb_loopback *gb;
 	struct gb_operation *operation;
-- 
2.55.0


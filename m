Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0458D40DFA1
	for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 22:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773525940; cv=none; b=hpB4xm2bjaZZ7QcAT0hkmKoToTqqHvMjpUYOioRmlAt1WEFZKJv6p0xPwloJy/Wqc4DFTiVI1fJGm0KBI3IB7Tiyiywj5sXFmiK4HqNmnTQxmvp/YgLCHG9uX5576tI1q1rr9HNtrZiKtAGIlVsp9tE2E8hh2uibR0DOgp9CoGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773525940; c=relaxed/simple;
	bh=xa/aOcrttHmgmtbaKMFmXEcJSwQCHdD3mjNHoiWUeQw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Eg1PCYccLCAr4IoBGKEY3weuFWv/6MLQI9VpKyGaO8S7tlQYMmUk90WE9Cwj51dT/p6c8PgF7ouuS4bIoUv5orKnc0vT7c2ffhv+cEr/CQ8+yHOhAwErZQD4bun2nhKnFo28Dm+ODPdwE9kaDJAm7rGbMRh3eEL6qNhJ4eFpmA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gtw3sy3r; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gtw3sy3r"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so16684545e9.0
        for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 15:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773525937; x=1774130737; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k5Jx/aKN/ZSZum6El7zV0pYvlen5XHjJJe/k6Vt7vac=;
        b=Gtw3sy3rv2+Ll4lLyEMR3jOTX+Rl3FNVVuu0yB1Dkfbaa39GTc+6UHpOYT9v7OUsVI
         UQ+39yjeFArSqnGifODzm7j5e9tQmde9j69CyML4qU282ychLIgH3ISVd/hwFwNGGlO0
         9RyZJAw5yF7oJUz6sm+PCsboc+pTw8LAvfRo2p0Ukihq33QIuoBkT1b5f4pzX8r4GIrE
         nsGb67V65wMKNZY7qS856xQ0rmHLVWWAsvYnKgYpKlMwDv+P/EIW5ClK2VHZRU9nJczO
         /TfXmuUaK+adtU3CsbVmnwVhJTIhoSe3n/7sDV0ATcAokPvYTJGTFkUy6kZHCOQN9AZL
         Z7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773525937; x=1774130737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5Jx/aKN/ZSZum6El7zV0pYvlen5XHjJJe/k6Vt7vac=;
        b=HWm73KmfSnrCuG1JrTCn+Iv/SYCShlzZthecE/w1pptaopZ0czZEmk9UkVlHhtkmK+
         2eC8Za3QucQPaXWgshEmdV0fmo5EOoHTVkzj1m0ZFiKc7sBQhQ4J/UjVK9xiP617gYMB
         K/QSRZb12pI87tOVMqKo2xGWwvQkPjdXEI8ciDTYgLnUEkZx3pLbLdB6Qyr/QVKZjqVB
         MjuLqVd5y0Y6gHHr38UgSQumPFNlL1uoHIlvvVtCm1HUQdiBtnq3kuROXfLNmtxn+SWj
         b+dSAVPcRtAyHEEL9CBasXmb+ON2J5lJ/HjVCfwHH1axXBHNVTZ8gQ46Htf4RU2Fmt1J
         cT8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwZ2hP1D3tv5hQpoef7u92NWq/qHWN85M0w7PuJYlaJJ9cwLqVe4YqUMOotjGFfeIGBf8VQlsd1MEllzoM@lists.linux.dev
X-Gm-Message-State: AOJu0YzdWjZzIbkgfczW5K5kE2DvTQLiHPrMD2brSEEb5OxtrPwCyfD3
	gK2RF4uRB2dClVTuRAh73m52BobKeuz14k4neu3dQopY4h3HVbRnSB1d
X-Gm-Gg: ATEYQzxiwp7A98KHR0ob1p9sSfQZJZqLUt7yiT446qaD8XAdtpuab3rGlG2AIUcgZni
	6goXafWLnLx/EteRufVZelXtLXudaCVPGVE2dr3hAgpgsRwbM5Bfl/ip7K+REO6eN2v9lBQ/Zxx
	s4pWb5nnEJnaO04gIJf/1bFpJ9c5PKvz/nlfDn8ygqhCX9aUZGgJt9305fGYNhl8DF+5ECtw0R4
	/qFlds4APrp+WBTDL1y6Vp6hMp7jLOiAWPBtY84zfzpl/hSm7Q+XBH5qLjJSXTP9dpg98G0KUNS
	FdmHeCHi67gY2reeb3Y8IcBFZy7Hojvp/o8pn14m8CfObGOwyakRa1EQAVFDBWRPXlbpmsevMGk
	i/ktDfo3E3pcic15UjwaJwNGmlwGy90smvl5oeyKDozunyQxAo3jswZvXJ9sDRZjv5RLEUJLIba
	KVeB7JPw7affhLvALahkiR0WHobgUSG47iOCsrXmQgRP7lszLDKakQX5ocShfH8eCWxszhwGykA
	4JowTWfif2WIbcC6RSlQL9EQSliswdWEQ==
X-Received: by 2002:a05:600c:3b14:b0:485:46fd:7887 with SMTP id 5b1f17b1804b1-485566d94afmr111840235e9.13.1773525937120;
        Sat, 14 Mar 2026 15:05:37 -0700 (PDT)
Received: from misharch.salamander-pythagorean.ts.net (net-93-146-220-2.cust.vodafonedsl.it. [93.146.220.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aa73dasm1009955495e9.2.2026.03.14.15.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 15:05:35 -0700 (PDT)
From: Giacomo Di Clerico <giacomodiclerico@gmail.com>
To: gregkh@linuxfoundation.org
Cc: akhilesh@ee.iitb.ac.in,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Giacomo Di Clerico <giacomodiclerico@gmail.com>
Subject: [PATCH] staging: vme_user: fix missing blank line after declaration
Date: Sat, 14 Mar 2026 23:05:03 +0100
Message-ID: <20260314220503.35991-1-giacomodiclerico@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a blank line between the last variable declaration and the
function pointer declaration in struct tsi148_driver, as required
by the kernel coding style.

Signed-off-by: Giacomo Di Clerico <giacomodiclerico@gmail.com>
---
 drivers/staging/vme_user/vme_tsi148.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/vme_user/vme_tsi148.h b/drivers/staging/vme_user/vme_tsi148.h
index f73ac92320bb..3102b94a0a86 100644
--- a/drivers/staging/vme_user/vme_tsi148.h
+++ b/drivers/staging/vme_user/vme_tsi148.h
@@ -34,6 +34,7 @@ struct tsi148_driver {
 	void __iomem *base;	/* Base Address of device registers */
 	wait_queue_head_t dma_queue[2];
 	wait_queue_head_t iack_queue;
+
 	void (*lm_callback[4])(void *);	/* Called in interrupt handler */
 	void *lm_data[4];
 	void *crcsr_kernel;
-- 
2.53.0


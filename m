Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20A227B516
	for <linux-staging@lists.linux.dev>; Sun, 15 Jun 2025 23:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750029108; cv=none; b=GG6mfoT7APiXkOMRHctJ/8KutEl4PJl0yjWa5BFzdpsoCcHa7/hDDIN47+on+uiXFtr/nMsaenIrOlTTN+4zykCe9VMNM5uVMAf6EQvR7bjvfkw1te5UPlKNz5zj4T8xpjjnFOkZcEot+NAx+38KCw8pXpyfBR62BtQdH73rAJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750029108; c=relaxed/simple;
	bh=4HDa+kZfszLMUgYNYONQFzq5OXdyA7J5cTxvAeHxi78=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cXVR6ZJwNEYyqWehpbsv+YTzq7RucfxQPcHmmeWLbqGnkeH3rDtO0R4yzk8EgC1zDTaKC1w4NBVH+6hdPLcXx6Mmu84Ck9jERotVzNlxF/hz3vB5YkrugR3ogpRiRtOI4WUxfwedORoXyvb4xECO9obswuta0hJ4qmqR6OYNA2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aOJI9m5U; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aOJI9m5U"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-adb2bb25105so672784366b.0
        for <linux-staging@lists.linux.dev>; Sun, 15 Jun 2025 16:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750029105; x=1750633905; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcvIE+9LcHgBj6QzseTYwWoeEVndXUkqFgV+umJPgZ0=;
        b=aOJI9m5UFdd5lQubsnFk8FgZVHymGEJvEIBCbofPQwN4m0xZfy4Vjg6fYCVuTEQ2Oz
         qnespxpwLRYdzYv/D2fmRv+Jd5AXJzaIKY+G6/x3/5DbkZBFKHMeFSJJxSgv+J36E/pI
         d8ui27b95SvRm3kwaDOAlpD8AxFTFtg8+QnyruC3+62B3aiDVLZcpkF+O0G4MLxY+1FC
         sq8mlBYjYE9Udr6NHgRkGk4wZbeI64CPL7tABV+mDD1BXXXbQMTy5hqkjQv5R37QFnu/
         lFWP2F1ks6ZdA9fAmuqpzuQdMoLVLB8RKERil5NrgZoBPZ+Vgjd8yPKZyA/pjM/Mf4fs
         FiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750029105; x=1750633905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HcvIE+9LcHgBj6QzseTYwWoeEVndXUkqFgV+umJPgZ0=;
        b=IeA0TElLSiWycv8NGR5K5y6XgoRL2vtB32JSOXV8Hzte5SvUUNjGwjplxUBHR0NgTn
         HnOUNCXb8KmV3lKZ9JPUcn6qP0lm8GEwW/0CEmUjpvynSWb8smcWopjOhq8Jf4ntYVSx
         wL0U9EFvScnB1D9cFgSrfelryhnl7Xl29snQNvRbjqPIR+2PEyO6aoXxVPbWnm21MRfy
         YGQPj39X1zPivYRskuxulu4PWmCQis5vw1zIoWj9r3oDuMmWUbxR1HZTF0xaOb7/jKBw
         SvWibz+/CyFUO1gY6hjiDeZaWxeSqnwXykQlpRO0b28s4k83nfXzeYoKgAcb0USmcB7I
         BWyg==
X-Forwarded-Encrypted: i=1; AJvYcCVqok2bWFQR3BVTHInok8lUNi0XvM6EvhcZoL8H7LMxtk9d8ScA4l8mnLk82Ibzv52A6Rp6h4ZRvfIaaIrf@lists.linux.dev
X-Gm-Message-State: AOJu0YxDYsAguGRuKE0mWse5igfVWiBuwtJCzZsEIabJbMETMpeqRQan
	m737vgRtMOCjpGeKOVFJsbGMrbsMwJeYDeb1qirEeQRvOjbZfcikpG0kPKrpmI/9Xmd1IUMk
X-Gm-Gg: ASbGncszu9gWjy2GSGomBfVP8jVlOUCw43P/yYDA5W0Szb47cds5htHSAw+fr3a+ldH
	779CrzCcUe+OOKtgib+1ofs43K3e3QDHzJCFHLFx6+FTmQvDMKbpOxJL836AqIsdSchDNAHxGfZ
	Sz2WN2jZB36miH/JcbVIa7InQ03Q1rGys4HLCvksp2eZbByfS+3qp/xwKvfBogungJEB1kGVG1V
	yecgsCNyBcScpvem/NDwTKNv9Izzi0EstJGtwmJMJs6EZ9LAphO2Jpig01aKMNL6yAcBKAPUMiS
	xr6RFwNxTdZAlVcGnTUYZ2X3gtR9Y0XpOgFVw+iJizk2lBIMgXgJtpdQg6qWG+hMEhmvhL1UIrr
	bkSsD2MKsY+bPkONHxpYW3wyPcS92Jx4ZGzpcFwh/bt0aZo1VGIHmcRXhfTfypuHetyaPlzE7nt
	vo5rk3YOeBYh/YO1PSD5uhbZU=
X-Google-Smtp-Source: AGHT+IF7JhUsm0FGPzBzpz4BiVYQgWKUlm55RLUwDD8GmQAi8WR3r224UP/NzLqu8111/AuQiZs2pg==
X-Received: by 2002:a17:906:6a1b:b0:adb:4203:cc9c with SMTP id a640c23a62f3a-adfad46a361mr659102766b.50.1750029105340;
        Sun, 15 Jun 2025 16:11:45 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0704-3500-b0b7-97b6-556d-11c4.cable.dynamic.v6.ziggo.nl. [2001:1c08:704:3500:b0b7:97b6:556d:11c4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81baf3esm546347666b.40.2025.06.15.16.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 16:11:45 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: hansg@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 3/5] Staging: media: atomisp: i2c: sleep time
Date: Mon, 16 Jun 2025 01:11:41 +0200
Message-Id: <20250615231143.1558392-3-thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250615231143.1558392-1-thomas.andreatta2000@gmail.com>
References: <20250615231143.1558392-1-thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

moved to usleep_range instead of using msleep which could sleep up to 20ms

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index f35d1a16f627..48ec2cb03806 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -433,7 +433,7 @@ static int power_up(struct v4l2_subdev *sd)
 			goto fail_power;
 	}
 
-	msleep(5);
+	usleep_range(5000, 6000);
 	return 0;
 
 fail_clk:
-- 
2.34.1


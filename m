Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DF41DED6F
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849981; cv=none; b=htdzUY/HVDzzfZ6R/aE7s06PO6SjJ8m1y0kgKnM0IU1N9100l8eMqdAvsUaZkpkuBgl9WO+BNfViXuV/aKQxBm8RNCvGzzi2eAZuEZsyVK1L54FVc0h/4ce9VSLhu2y6FncJTyd+jL/itmzd/A59PmamSVPSVUuvJwqWk7thQgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849981; c=relaxed/simple;
	bh=oZv9J6EAs+La9Yoz4jWDKoBjoVKNXoiy6YS2fSQlpKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZFVPT4OdwDpX0j2dO8IfyEM8/xuauq3cfBYYRf1Q95sFG8EGs6yHoWMBBPVyREsJ6EMKqx9EI1p8rhzaIiO5Mn93T9R/u9ciBF6lkKFck584KU8kW8hHllqAZpyAtSPdaSpVx5HV4pHcgZXoJdhGisovKDmm1CflUX9Lcy7MQh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=ggVGTrwI; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="ggVGTrwI"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7370a2d1981so136898b3a.2
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849979; x=1745454779; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OaGk/ulT5DmrCZA9B/47jOByqfYQN8rvXLp/mrP0bU0=;
        b=ggVGTrwIPJAEqS9f2/U67DA71zCEGjCqf0Le40vModCa70mdGxL4p78MyvuJi1RCFw
         oMgyn4uGOCU3TNtkfjuqBn2G+fSpuvsdAco105bw+PCRJXemrD44ZIB08nhlD30PPGvw
         ff8QvqvZm4BfR6karPkd797yn4+ZmqILlNfsj9jnBGjNJnHI2wM6q8b2RVxfO7iJ4JYP
         wDtgtQ9TqyKPLfEf2oCufeGXFCuiLSTuzN2W0kpPC93zriZinoHVH9FFmzDhqwiZKE/D
         1uPAcV1/2Wdjm86tMDHlrLSD6gQMtzCduLdrbOoI+1FL6ZrmCtOgFou0wmAw5MnVnPbg
         Wfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849979; x=1745454779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OaGk/ulT5DmrCZA9B/47jOByqfYQN8rvXLp/mrP0bU0=;
        b=YdgvUPxw/shPniILvbDn/EoEeQMV5HxzLh61XZvNFfOqnmaik60SZPPcfoQ6ocq7JD
         7Czube5KIQezP/6/rWyqws1NRPMya1QsdWNEDXq7Bu2K2GugrDNQ6mMOolwLq6dBCOPu
         CYhUA4BhlVqidk/shqpfA/m+0uPPe6Ugr/iEoYI3j5JB3c6OxdYF2/6a299ajsyNdm7F
         ERsKqUDtc+JUf6F634AcK/QU11ZHfpsB48sWQ7sFA/YS2DAm9amjChdNlFbGd/dIgmUn
         fpJq1oKzsARtqtUpYYkFUzfx8yB8r886ZCSIhBf74hYuJl2pNIjYYidCu30INVTnhK+5
         47Iw==
X-Gm-Message-State: AOJu0Yw6ogGjGMcoOhfy/axS3/kOreMZg8wncvRDj97D17pmtjFWGzJE
	ur3DC4L3li26UJ3BINrUhY+0IfvLbsmZwjFqNGnQJkd6io9RTZ9Cv+0JbNVsrw==
X-Gm-Gg: ASbGncvJJaPPY/aKcfAMOiivJKQhzW8YB23n7a8zNIKuZuWFPMGTAFkqPVxmkM2cDiE
	baW9NY7+ymAtJj/PAzz2rx4Cs8rjSz06f+n4Gb6lpLn7iTsUl15geYNpeSm1Up0hMoqnL8Q9F4H
	MxIZRlKio8oFzAXrKSCsNUFJHq7dW29q2G7xKP43e5wwXrxdIUHIaBGpmcJ8WKC+D9lROL9+g5B
	fWhjIwXu5+US8+cxjpdEvSvy2ERGPXeEETxVXzfDG/Y7UHGCcVheFtN7a9YDsSHoIj9Xp2neYSO
	3UTg0ISiVtNZ9zYwI4AsnRq+xgBLaa+1GO/tcO48fZnXoJznKa4txI9XS4JmOEG6OQTQTgTr+85
	0VkxcTA==
X-Google-Smtp-Source: AGHT+IHZ74Gy3mFf0si5N56++CDIea8yCXo2gljGHNPnJQwNQOT0xFDB9iIxO3BakfxEu0PW/JmimA==
X-Received: by 2002:aa7:9301:0:b0:736:6ac4:d204 with SMTP id d2e1a72fcca58-73c26722b44mr5134846b3a.11.1744849979201;
        Wed, 16 Apr 2025 17:32:59 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0b220fc3b3sm1580948a12.43.2025.04.16.17.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:32:59 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 09/18] staging: gpib: gpio: struct gpib_interface
Date: Thu, 17 Apr 2025 00:32:37 +0000
Message-ID: <20250417003246.84445-10-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417003246.84445-1-matchstick@neverthere.org>
References: <20250417003246.84445-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 87622ee841c7..443d739c7edf 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -1308,7 +1308,7 @@ static int bb_attach(struct gpib_board *board, const struct gpib_board_config *c
 	return retval;
 }
 
-static gpib_interface_t bb_interface = {
+static struct gpib_interface bb_interface = {
 	.name =	NAME,
 	.attach = bb_attach,
 	.detach = bb_detach,
-- 
2.43.0


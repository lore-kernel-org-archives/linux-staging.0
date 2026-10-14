Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939424F5DF3
	for <linux-staging@lists.linux.dev>; Wed, 14 Oct 2026 11:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976360; cv=none; b=k0dw52epKCqnhnYPjwRA/NxFOcS0wDWO4ZZ6BS19IxKF19g4qtip0CHQlpsOhNA3k1yWmn+Vi6GfnJQtSa70quVsnlGQrAquRDUrUbyYHkKN94qHE1oNlaUnMS8m4RO7ikdIr9VRngOxRtO+RM2MEdqsNKtCzr5SNvDgRCU7biA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976360; c=relaxed/simple;
	bh=MeI3zB/x7HcysOTsREw/8vgJnOEIiDaS84Ud2PBmxd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PX8PLWfrAxE8/XWz6C8u3idwM7dxMdfHowus3nLz2PTVeJyKgWDiA/t/6u1KkTBCkblbu/zD0Jv1AwSJRQD81kPk8+WdFIhbHSaZiWIw3Kmr0LrE26jtQHySJhAPca2iOXlQU48xuAEwjKYnfY8+EJirIpzzSmGO5llkdvt2fw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rBzv35Mx; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rBzv35Mx"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b060ec084so2602394f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 14 Oct 2026 04:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791976354; x=1792581154; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bC6aVvICfoTaA3av0KP2hPJj4J889q6ls+h6HZwfSMo=;
        b=rBzv35MxrO4jYCPhIJTe1UjKkJ/bSOS3RnPWUPH0tVTl6xp1r/4FTieTCXkRrvaLBA
         BEu+SA7LdSQ0WpzlDN0t3p01SoZ9zHiwnksLaFqOOh16NSwZqgkDwNs1A5geLRajZSji
         5hzLVhSEjZXGNfWto8UuqRIHLwJuYoZJnPQIeoAzcnY+irCQvnie26geLoH/TaySV8yO
         bdVZM/6JQXH0W6rIQCUEI0ZR3CWthmhfq7G1YRgUS5jilg91qqpH1xxSpemx3lH/oCat
         tq8eyWCJv6xqBs8Ij5/7CcifrB1S7Agwmvqy2EDHKfQCp2CwFmDuvrusZHzxtvF99W/U
         8KVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791976354; x=1792581154;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bC6aVvICfoTaA3av0KP2hPJj4J889q6ls+h6HZwfSMo=;
        b=SLW3mrtUKHqHaMFJhzcTKff9ks4D5uKsncvQl2FleNU+61aj8FBDHtYvdUx8Wk97ik
         jWxKrnNrT16lm62MTCg5SgUCLuC/MX3ebH2cT7hWuMFx3dl1ke3nRrBv4M1DKOp9DMSW
         wFJgGgJAwMxNOLnRq7GG3w/eI8iA/2/uAUUvksPesk1iB99nhKyByFTavlOQArhAKpDt
         Mo7xYAAbDOJuWQ16gUZ3ZgZAUs9aakjOUKD9Lm0X29ZQIJZSRadb4JOG3m+XSZmM4ulk
         Y3qduCT3prACQSkDHxeRBfejCSRVLFWn7bMrpRHKRFc54T+cp8mHses9cfdBBKwFWjqa
         +kFg==
X-Forwarded-Encrypted: i=1; AKwUvBxdL7cQjw8xQzT0TLw/G7MrBBNOBRifQ9lj1ndBNCCMFKL10VeRRhEcc1flkUPDmLyCuMvhUUr1WQ1i7IIl@lists.linux.dev
X-Gm-Message-State: AFq9FYIs15JSJd2W+v75mocQ/KQfVBXWr83hDWKGlIUW37oZwcTBmRZF
	hZMaZSu4FHMz1HgieMWvatek0fFolnFSXqW9DqseirI9nSfMWIh8yxRo
X-Gm-Gg: AYBFou2RUXZkbqJ1Nbt3leN1D3dWYyzbTJatdsbunxIAcSPnW3wGsuF3iFiR487B+By
	hep6Vz73zpLTqzZSqFDjLXsDuVW9j5rDlR5HofLxmqGRa67WBl8UTlmIhZZ00lUSY4HTg0rm7aN
	oijJqAyhwkECb0/cq9XeydwTfq1lEOiNsiiWsZ/4eUjP2J73L7HW98NIF+avl8GEcLc45u0POOs
	gNzwp8tgMiOsbonDen7LXZbDvWNH2NDtjtuHsrEwoFTiaLFTHz5nWU+apc3Spw3kbuHf4JR1VKs
	yn44WsodlzGiEUaPkyqo6jTFRsO5SCoAYRDkc2MUGp2nl1OYvWkhb4lGzpMN78RhV0V2+gKnnSw
	bKSMr4XrXvlOehtmIzfZTez3iElL2SMuXOCRyOm/YcDIhtquvsIuM1e81oSQKkP30RSpfjp0n4m
	OEG5IW0xJqU55UzWNK4kSWVHq9J9UoWaWjPyqPHhFwcZAX8gSZh0zgIemKJ79MC6kxHnOw8jm9k
	GQw0Wgp1tsZDdK+R7CUUQ==
X-Received: by 2002:a05:6000:e0e:b0:48b:1ed:db34 with SMTP id ffacd0b85a97d-48dbaceeccfmr22523693f8f.45.1791976354227;
        Wed, 14 Oct 2026 04:12:34 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48deeadc0b5sm1846481f8f.6.2026.10.14.04.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:12:33 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
Subject: [PATCH v2 1/4] media: atomisp: sh_css_mipi: include assert_support.h directly
Date: Wed, 14 Oct 2026 11:12:10 +0000
Message-ID: <20261014111213.1967452-2-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014111213.1967452-1-vladurares@gmail.com>
References: <20261014111213.1967452-1-vladurares@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

sh_css_mipi.c uses assert() but only gets its definition indirectly
through the circbuf headers. Include assert_support.h directly so the
file does not depend on that include chain.

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_mipi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 971b685cdb58b..83424b6ce1713 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2015, Intel Corporation.
  */
 
+#include "assert_support.h"
 #include "ia_css_mipi.h"
 #include "sh_css_mipi.h"
 #include <type_support.h>
-- 
2.43.0


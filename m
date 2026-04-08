Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CD42192FA
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 09:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775638830; cv=none; b=cghjC/mKlivkE430+bMihqYOmB4UyJE57UDt0Ykd5yKgz6sFbohowcM3D2/nFArcw968OWXk4DuJZ2IsAfoLdppT2jkA9yJTYFdW+Ew0J6Ak1kqspCh6kRHNm4c67AkdXI292T7dTFeqA/t1arpWU3AYiLnsQMO6wbgzp8B8v/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775638830; c=relaxed/simple;
	bh=waVPH/EP6iS7b8jTIbnBHZn+7NDcICGmu1/TlgYH8Zc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G16+WCXR0JC+M00oHJr/y0iN6pRP5JVgQUbI1dH0utQQgQ6vmbfjkY//QM6Rvc4f9ShvpB7FZvvW0jeiCih/uRqqJrmMMy4CXJMF0QABAxj5JFEjv/fzr5fkAoSeD0VcbQdhVyXMYwAET1W2eTiLMbX00bLoPmE4Mm8jy9kv+bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BdRxAdSy; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BdRxAdSy"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48374014a77so80463635e9.3
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 02:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775638827; x=1776243627; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l7Q0evWVLUiOzV/UleyvPWFrIfE+z2VYAYcRw5GhBi8=;
        b=BdRxAdSyQtrS5KWZpumVf4LRalmJPUR0dRBS7Tf2RBeitwplJppMzD2OyFYqZG+xXq
         m041ckyNM+I26BDnHZvOIjdXlPTtr6/7Dv3P2Q/HRFkM36SD0DVPE6OOMjStUDf+9leF
         NUe+/2+OUxg3uNXxmb1ryFYO+N28tVdLFpUZ9+RBE61oPGsFygKwBoafQw5ytOdvUoEc
         sfUYUYIpNTN8RWKfpWWZBFHVQy4e/qzKWse16eaRjvXmk+XcNuaBo6aJfV26Mswwr9dc
         kltvPToGqpUkYWmjIKaKcyIhHgs/5rg6vuC5DptjAqRCc98+epvm8lbVnhAztQtXCF2V
         nB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775638827; x=1776243627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l7Q0evWVLUiOzV/UleyvPWFrIfE+z2VYAYcRw5GhBi8=;
        b=QWwb0vKyLI4n6+tCSypXs4DiTYwxiIfPm3hAwV6lx3Trf04vO9PC/9I+wvA0kvBgD6
         mp79kwSBGRAFmkNKewGOhFddHc9cY8ygRiBnaKLFv2iOtVV+ghkbPL8kmdfeez23zF0i
         KCdlt080QaoBuebSVW85YQoXaC097BjuyIZOTjRqjxS1JHZrwvUCbiVVkbN+tQ8u6Ytv
         +VD7cbj2hpCoViMSxg1MQMwhQj5G5HjUQP0P22qc61Ux0GTNqiH6hnbyL9/dcYsatfVQ
         WQfvnyMwQS5d+N+g3YdRNB47gO5p9Abw5cG7aZBb8d8RB+lq8hYp0ZymAMMKJqpzBcuw
         DPag==
X-Forwarded-Encrypted: i=1; AJvYcCVDO3j0WBIpd80otssGxjttKirk7ijUU6eYWV6/dQnkGyQhknJeKTmHJ7NgRsvVFCqnmPZRsKY8AMd9wCxw@lists.linux.dev
X-Gm-Message-State: AOJu0Yyw81MEHYRkHLbX8bbi0/HioipggzPk0I76p2y16EklcJ+LOQFf
	jm4soXC5VIV38e2WFoIqqe71m2Rnho/BjDVt+25yAaoZmjkK83Ifd0YQ
X-Gm-Gg: AeBDies225ZJQvHrtdiHujL0d+WGAMtjNof0EAnFyqijUJXlDymp17rmlL1OuxA6i7R
	yd8RQmJanh9OYDrf23ylf0B1LFJXe4z3DYlTtVAcXLsiPdpajXtW07GoFgy1htTZsPAhcleEoY1
	800a4IavBaciRIlSo2NII2FzoI4tn2qVuK3HJ3QC4tqApVEfYQ2+UEfvd4pWgBHW80XS0DTzYfP
	kjo8CnUYx177W49GzmtXuY1VvB9KrOQqwTpHTysGQhzI7d6t8G1iJu8U+8xLySo35xIVbyZdOgg
	kBT5fnIXjmEYUcJh/2TH7VWgHyAMH2xkWQpRCaffNP3ls1T9Crgb0Bt+funMysHM2ORcowUFedc
	xEJRfxooXhySxxB9/QXhbqaaLBuFMN2phgL9WzgmRTDjSRCdsT6VVRaS5L6bc8ggCbaQRHqBtXs
	gkrIqdGmygX47Q+uj2ud5egKVLjzVRRaMGSeFSVIdPS9XwzsNniUeJ
X-Received: by 2002:a05:600c:3f08:b0:485:40db:d40c with SMTP id 5b1f17b1804b1-488996d2323mr330911695e9.3.1775638826590;
        Wed, 08 Apr 2026 02:00:26 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:6c9b:a000:d997:3078:a4d3:4f51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a952a03asm293568415e9.0.2026.04.08.02.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 02:00:26 -0700 (PDT)
From: Gabriel Rondon <grondon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Christian Gromm <christian.gromm@microchip.com>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: most: video: replace BUG_ON() with WARN_ON() in comp_exit()
Date: Wed,  8 Apr 2026 10:00:24 +0100
Message-Id: <20260408090024.51814-1-grondon@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace BUG_ON(!list_empty(&video_devices)) with WARN_ON() in the
module exit function. BUG_ON() is deprecated as it crashes the entire
kernel on assertion failure (see Documentation/process/deprecated.rst).
WARN_ON() logs the unexpected condition without bringing down the
system.

This is the last remaining BUG_ON() in the staging/most subsystem,
following the dim2 series that replaced five BUG_ON() calls.

Signed-off-by: Gabriel Rondon <grondon@gmail.com>
---
 drivers/staging/most/video/video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 04351f8ccccf..17cdbea2e55a 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -577,7 +577,7 @@ static void __exit comp_exit(void)
 
 	most_deregister_configfs_subsys(&comp);
 	most_deregister_component(&comp);
-	BUG_ON(!list_empty(&video_devices));
+	WARN_ON(!list_empty(&video_devices));
 }
 
 module_init(comp_init);
-- 
2.33.0


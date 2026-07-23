Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA92456DE3
	for <linux-staging@lists.linux.dev>; Thu, 23 Jul 2026 16:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784823541; cv=none; b=Fo8lndLOLtLNVyv2MQwhrWHLBz18FCY/yvz45FISmu3JvA/0QkrLqykGqIPLD6noj975QCWTaoZ9OO4ZoKVFxiTE37ULqAxP9j2QEGtpGNLYCiiWHPoOf0gsMy7v7/8cRuSQ6gcEEMqMgqe9ku7zKNvay7zLm3/4aGf7jbSjovY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784823541; c=relaxed/simple;
	bh=NpnKO/51+etpeqJ25cg/EF74MiQwdswhazoXGAAjbFE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GUeck/P9PYsgzp+ibAWDCSurCEfcTH/wwAaux9sWbe+2cV67c5uWB56kmUnFMsX7upsAOJbpN9y1Pc6l2nHxoSte36lAxqqeY8Mch7bUBkbpVXbMLpWk4maSKJc6sYwkBOi3F6lx3EU8DBnB8i0cg2b0gqMq/AT3shIOOUuwYp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=orEqa4hn; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="orEqa4hn"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b0231a3e86so943768e87.0
        for <linux-staging@lists.linux.dev>; Thu, 23 Jul 2026 09:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784823527; x=1785428327; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LqbiPvOO3ZvJwq5MwuKHTtbfwKr6s4CP7Qh/+Zyyw4w=;
        b=orEqa4hnY2x/9BStIUGe58uNJOBkBqfJUcuEu91zgu1tdUNhqSW4CIvUxSYGotwdHl
         lrOJBUD+6hx845EPbvKccTGGa/vSw/x1bpTfI+3qQ4skdYcjL6WHyk5NpOHNCx3QZJwM
         1ruiFKIy50KnhcoJnv4VimcURY4oUYHo0cUV9q+UpLJmAeSrDUWRGD3yDV4XeO7+oKh1
         1AfklgaHyUs7oyjNmcKjmN++p15WPjUH025YTOKUeB66zdJXzhDn8uIC0HKnVt1gN+G0
         EFCcoFh6tkCTE4zTUO4pg4N88v986MhDC4P5xviuimIPFGQx73BDSRy23Dh1cXPx2Vca
         kT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784823527; x=1785428327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LqbiPvOO3ZvJwq5MwuKHTtbfwKr6s4CP7Qh/+Zyyw4w=;
        b=YRs4Tv40h1SxV0qAhJvEDulveagEXY95vjlY3KeyOyFOdaLXDKXcb3VFAicrkhLl/W
         AgmOASWYa+zLTVUXmc1PDdMh8o5SxdUmWiKwsz46r0Kv/CGpE+hlx4KYxovSd/ku3z8o
         2ob1OkAFsUzNWNnbSKu1dyQfU3Zaf4KzvYn7F61r1FlOQMNaFpTHTeIWprscoum044aq
         eDuDcDbwD7YAj5voyimKNcGuW1pJdLO6Xx/iEgfc6EWOz+BKisms+t3Zx6peVWEe/Y+p
         j5150qw3F3O2Wyzzp3UdC3/ToT9DnseadfFBcvy1jovU1FhFrdyFOaogmcv6LGawh7qM
         eo0w==
X-Gm-Message-State: AOJu0YzCp3Vvy4pH/KiQvApvR62zfcb4M4JttuENCnZiXyqLoVNWZE0T
	eDsDi6+mScZyz3u3D9adG3F1X5PMNnXqqCTndrOHEYCnfdNcc/8BfIaWzMAAxYyCESA=
X-Gm-Gg: AR+sD10OTKGzqmaMbI+cYvJyN50Pl5CZS1/OeOv1CbYjpcLk2yVf60NTqOSsU2oOJyK
	/voFFburEfA2/JirWcCm0X3GQynCYzk3sUv4rvcXl0/GetSJlztpTtZbm0QBd9OpDI0kWs3h+jH
	X7muL5Oq4VUc4GV6Jzt/mHZMQlc5MOQnhvKdoY615K17sbU8p/ZVA5K1BaW3HX8szQaEKUaGPVK
	wtvZ6uARSZmVEFN4pvz1kihI8Yf75sSOsrzym8Ktny3/XIrbjF2j/LLNLesUY9bdaB6kN8adHQe
	pkR5kARKw0pkvrJFkcSLD3nSQ3vtGKvsYju3CG1dryQMdVQ5ZUbaN7GRTNyhXNE3U4lT8CSI8E4
	Q8e8uADwTGg89bhDLb47AR+1i9OOzdjho3i8TtgYrNvXqiUVRgxdjwGKPwkhk9cAoOI9Ns6eBKM
	/ZR7JOw/6JiC+NE0lYzOMhmPhsY1n4LYB2MWppx/pkY7ove2fc4RcWC21FHfIN6qSHyvmd62gZ7
	4mzu0/vOL2BX4g=
X-Received: by 2002:a05:6512:acc:b0:5ae:b250:5fa9 with SMTP id 2adb3069b0e04-5b2b2f6a795mr904040e87.31.1784823527194;
        Thu, 23 Jul 2026 09:18:47 -0700 (PDT)
Received: from localhost.localdomain (46-138-176-102.dynamic.spd-mgts.ru. [46.138.176.102])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c0a9sm1125783e87.17.2026.07.23.09.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 09:18:46 -0700 (PDT)
From: Artem Lytkin <iprintercanon@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	marvin24@gmx.de,
	linux-tegra@vger.kernel.org
Subject: [PATCH RESEND] staging: nvec: use strcmp() instead of strncmp() with magic length
Date: Thu, 23 Jul 2026 19:18:23 +0300
Message-ID: <20260723161823.23921-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace strncmp() with a hardcoded length of 30 with strcmp().
The bat_type string is already null-terminated (set two lines above),
so strncmp() with an arbitrary length is misleading and functionally
equivalent to strcmp().

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/nvec/nvec_power.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/nvec_power.c
index 2faab9fdedef7..89dd997aaf36b 100644
--- a/drivers/staging/nvec/nvec_power.c
+++ b/drivers/staging/nvec/nvec_power.c
@@ -207,7 +207,7 @@ static int nvec_power_bat_notifier(struct notifier_block *nb,
 		 * This differs a little from the spec fill in more if you find
 		 * some.
 		 */
-		if (!strncmp(power->bat_type, "Li", 30))
+		if (!strcmp(power->bat_type, "Li"))
 			power->bat_type_enum = POWER_SUPPLY_TECHNOLOGY_LION;
 		else
 			power->bat_type_enum = POWER_SUPPLY_TECHNOLOGY_UNKNOWN;
-- 
2.43.0


Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A828004F
	for <linux-staging@lists.linux.dev>; Sat, 17 Feb 2024 21:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708204423; cv=none; b=BWExZIXWM8lKlVY0eiGPMPT5YEUQgAD6Q4opEZ70y48gliebGENmodToMzXGperdYdq8SO8KlFTAflOHjM93YLmMbExMss5ZEAPSJiym059uIlKANWMxa3K1De7TunG6tq4DbkX0DEeAlmwJHPD7T1uP3ERieOOx5WO+mwF+sw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708204423; c=relaxed/simple;
	bh=Lqe/eh4edoLNExmGQW5FnAVKYcgYlc53IcedPkXMnAM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BnLXLtqmznAK59lQ4GtUmZDguqEgQ7WCnkSmWvwcZ1CI5k96vUk3a1lrK3B/VmmeaojxF/YF+y0yDy61riAJEuOjW6KODtAXboOD1fXKx1NGoikiGmOAYJ1fR78OT+PmnddLZd16m30s+QkO9bT0iU4KrPl8UqtILmg9l8mkc4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d3smXWhm; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d3smXWhm"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d10ae127ffso41509241fa.3
        for <linux-staging@lists.linux.dev>; Sat, 17 Feb 2024 13:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708204420; x=1708809220; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwzE+HW50uBtxpNueeebTnFB3RH1F9CMaB4/QKSCdA4=;
        b=d3smXWhm21MURylBVZndy2y5XhEbSYRumKO+TZudNkhIFgLhCzkJ2qB1yAWbqAp+pC
         oatT47Ltdgb9Zlhj2H8VaODnIkIYJP9pWmySymXcsT/fte+YA39e3mVzP0oprnNOkzkb
         +GfwREzt0091Fxv3RrHoT4HF7xzzSi/BlCY/1RQPIATkhO3wGTUeA0Iu0Ih+ukiHj1UM
         QL+MuLajFdUaiDD9OOow+IE5SY03e3BKvQHAN7eCegekLwp1B4ZqWMtojatiYKLnsDkN
         WIP5RCmXnefxlhF8iKvtix63dZ7yUDsS1Aovocdrso0S0pMMBY/j7Y3R2ts2b8Cgebcy
         wu3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708204420; x=1708809220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwzE+HW50uBtxpNueeebTnFB3RH1F9CMaB4/QKSCdA4=;
        b=J/35WvwPg1wwhrDEqhYkH4VXPTbFKQFPT1Di9nSQVcg9Kf8qqYFQg/ykA/WwG82puM
         Nu0E42g2CvI9gX9GXjEjcAMYScpZ6suaJKaIHBynnUh3+p5FljkDkgsGUKzBjYZOw0Gk
         UbQHQ2Cx/djnqVWJo9CCmw/bIBcxnsMEaSRxKsQu0kN8S0zyhlllr7vdk8mk+pjafidb
         ZeBriIjPQkq6hKrYJBxPvSGxVbYS2tMUwXw4oW0mUZyGjOpkMpvk2e4NIsoxr7x8g6O+
         BwcAfXyg7ySz2adx1b3UZJJlsu77ZuhQlZdnv1dIKl9m9ZFIRfT0K+nWBtlcn20bkIaf
         MYFw==
X-Gm-Message-State: AOJu0YzEPifqvfOUkbVidEkxQ/aSgn8wj4fsWqNhPdRkeZl4juu9zVy5
	5++MxN1WQ2V5i3j/J4dy33EBAHyJtCeipPSO1kNX5M4AgkkfvK4o
X-Google-Smtp-Source: AGHT+IHXk3qWQV+bKRSd+5nTEjZcSXqE/wa9eEPEqHCenqKtjQ2GVmUO279LV584cCqrqG3qXtjJDw==
X-Received: by 2002:a2e:7206:0:b0:2d2:299d:af0a with SMTP id n6-20020a2e7206000000b002d2299daf0amr1617273ljc.14.1708204420495;
        Sat, 17 Feb 2024 13:13:40 -0800 (PST)
Received: from pinguine.lan (ip-176-198-146-182.um43.pools.vodafone-ip.de. [176.198.146.182])
        by smtp.gmail.com with ESMTPSA id n3-20020a05640206c300b005644eca3befsm132087edy.85.2024.02.17.13.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 13:13:40 -0800 (PST)
From: "Moritz C. Weber" <mo.c.weber@gmail.com>
To: florian.fainelli@broadcom.com
Cc: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Moritz C. Weber" <mo.c.weber@gmail.com>
Subject: [PATCH v2 7/8] Staging: vc04_services: bcm2835-camera: fix brace code style check
Date: Sat, 17 Feb 2024 22:12:45 +0100
Message-Id: <20240217211246.28882-8-mo.c.weber@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240217211246.28882-1-mo.c.weber@gmail.com>
References: <20240217211246.28882-1-mo.c.weber@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reformat function parameters to fix checkpatch check:
Increase readability and consistency

Signed-off-by: Moritz C. Weber <mo.c.weber@gmail.com>
---
 drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index a25a361c8..9cd79850b 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -1037,8 +1037,8 @@ static int mmal_setup_video_component(struct bcm2835_mmal_dev *dev,
 
 	if (overlay_enabled) {
 		ret = vchiq_mmal_port_connect_tunnel(dev->instance,
-				preview_port,
-				&dev->component[COMP_PREVIEW]->input[0]);
+						     preview_port,
+						     &dev->component[COMP_PREVIEW]->input[0]);
 		if (ret)
 			return ret;
 
-- 
2.30.2


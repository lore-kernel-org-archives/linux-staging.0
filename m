Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012A28060D
	for <linux-staging@lists.linux.dev>; Sat, 17 Feb 2024 21:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708204424; cv=none; b=PhSAi/WJ6HTIfAMrgtAMjK8JoHjHO5iz4zI4QovQsYEbpTlWSy4/Ctf1nT4b/8vJquAxoEEQ4KmVhKr0lKwhpIoL3/j0/3yHDGWKrWObtj9JctS7yzz6T2uI85Nn64wsTLj2bcnCKeWSjCNoLEvyxlxkhMPuq1P888LLlGVlXqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708204424; c=relaxed/simple;
	bh=Egs5AAdslHfC4udI6Z6vOJIl9ypQt5Bm3xmTh5+bEAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LTg3X8pgMF6W+CairKAAxm+0z/K3elzd1WVe5yJhVbst41osYIhTtmIOTpPlnizjzeeykPu1A7CUS9zSKDaZlatnssjIER8r/F8C1bkyp47H8X6gBDcB/+sQYe/XO7IYWIWJt/FEX0sJnneRcIK0+kAojCkKl/KrMmnAJveO9XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4biNuO1; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4biNuO1"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d107900457so44499391fa.1
        for <linux-staging@lists.linux.dev>; Sat, 17 Feb 2024 13:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708204421; x=1708809221; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9eEAN/dOCoAmlP3G0zjBQsaiJN7xwf1Z8pHlWa8opt4=;
        b=P4biNuO1HhIoRXDcU88kc3ih7oRanOvhmHZpKiLywaH6yiJD+I1o4BCndGshdT+e/j
         MTZVTRs3CW47XvmfFGKqfxh5jbCwqKPjUkG7Cl5q4FOI+JXG+kRCMF0GatEUJ3Ey/8c/
         6qh4sU/afy6NgK+BmHCqZVii8A0MT7ECXcdeBJcOA9IpKuCE4U6klu+uKfugX9vaLHRT
         Y52fk5sNDyzh02pEu9dNj+NOgJXsZdm4VCAGn7BFbB99admv9AUIO4dr7Q3OMbS4T+o7
         r8BBddVjftfH2B3rOmECEJ3UF7/DFcG8ooDi9QzlKF7+XWo2yrnSIDAbSnDrSG0QXZ3h
         uZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708204421; x=1708809221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9eEAN/dOCoAmlP3G0zjBQsaiJN7xwf1Z8pHlWa8opt4=;
        b=UeSaBZEPTL5qnd8MZ7Zu0HjE7si48+7lGpIYhA2ZwFV3QPqSWS9IoOH2IrgDZFY7Ul
         +9r3Rw8N39MZ+r8pPZHZJeAiNkwrV84YzB1GmDGPBRdhGx3IzIMQoIQ7TTiTuTfM1qjh
         7VgQki9xUPpapyXEgS/4qUsxRPm+wrc/8CGjo5tcws/Lv6IR2b/O0I7LDEhE93v6r3OG
         f5HcOlPAMBfQcUpVBe5kbs99N8lw2leI6rwf4Fu7RybM8oKQ24QNQdrnrWQPL6hK7+tY
         DBKTWeiY/8cGUaU1CsVDAvpwK0Z4G4Al19FuNCAH1foLCH11HuAB8/QsZA/0qZBXAS9I
         NYwQ==
X-Gm-Message-State: AOJu0Yz3AujME4puYjN602YbKZX/j/VgzFedVpB2G8PZIzvG0JoD+OTf
	baL+k7dcI1PzqirpD/TbMhy9nOPVBPxV1nxuqO9c4BaUqXgKackX8yznVG6A
X-Google-Smtp-Source: AGHT+IHSe8QVXIsEhkK8QsiBuEezrULoPTmBu5wXHDINdwXtgs/KS2xhsazL+Kx6Wpw3kzLujnylNg==
X-Received: by 2002:a2e:9083:0:b0:2d0:c101:7a71 with SMTP id l3-20020a2e9083000000b002d0c1017a71mr5017928ljg.35.1708204421127;
        Sat, 17 Feb 2024 13:13:41 -0800 (PST)
Received: from pinguine.lan (ip-176-198-146-182.um43.pools.vodafone-ip.de. [176.198.146.182])
        by smtp.gmail.com with ESMTPSA id n3-20020a05640206c300b005644eca3befsm132087edy.85.2024.02.17.13.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 13:13:40 -0800 (PST)
From: "Moritz C. Weber" <mo.c.weber@gmail.com>
To: florian.fainelli@broadcom.com
Cc: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Moritz C. Weber" <mo.c.weber@gmail.com>
Subject: [PATCH v2 8/8] Staging: vc04_services: bcm2835-camera: fix brace code style check
Date: Sat, 17 Feb 2024 22:12:46 +0100
Message-Id: <20240217211246.28882-9-mo.c.weber@gmail.com>
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
 .../vc04_services/bcm2835-camera/bcm2835-camera.c      | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index 9cd79850b..c3ba490e5 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -1715,11 +1715,11 @@ static int mmal_init(struct bcm2835_mmal_dev *dev)
 	{
 		unsigned int enable = 1;
 
-		vchiq_mmal_port_parameter_set(
-			dev->instance,
-			&dev->component[COMP_VIDEO_ENCODE]->control,
-			MMAL_PARAMETER_VIDEO_IMMUTABLE_INPUT,
-			&enable, sizeof(enable));
+		vchiq_mmal_port_parameter_set(dev->instance,
+					      &dev->component[COMP_VIDEO_ENCODE]->control,
+					      MMAL_PARAMETER_VIDEO_IMMUTABLE_INPUT,
+					      &enable,
+					      sizeof(enable));
 
 		vchiq_mmal_port_parameter_set(dev->instance,
 					      &dev->component[COMP_VIDEO_ENCODE]->control,
-- 
2.30.2


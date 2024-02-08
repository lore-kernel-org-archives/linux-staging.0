Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F2836B0D
	for <linux-staging@lists.linux.dev>; Thu,  8 Feb 2024 19:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707419848; cv=none; b=RuT3g6EDFNJE4PxOJ8Le1VRtWYLFaHrc6mmYA3sFH0BK/plHTmd5ruf1QggO3qBf+THpydP+H/1C6AQ6ifxRB+YC/151EB9wzIG0f1FWMyd1dsdIet8kRjMKYq3o7CcV2HQm+FFYdOJWq9HsX4nklAidmNHh/+JKqrsMCODqVz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707419848; c=relaxed/simple;
	bh=9cNNhlkh8Qz2Cmmyb82krEPKz/SNHddqSojZKEbTrIA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Uf2xLy+ACQBoWbFxXhe2iUFSewy0foEezxyEv2YjkEacKjzj60zn0bPqWSU14CoyzZBywR8y0/+iz5rts+o2R4HmwVZ/pV8Qvk9X4PRL7t4spWLWjEsoze2NQc/nGsqUWjWvsBTB+csHdiuhPMHv52k732DbYvfBHlEDQYgCQ9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=EVZrxks5; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="EVZrxks5"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5d42e7ab8a9so66886a12.3
        for <linux-staging@lists.linux.dev>; Thu, 08 Feb 2024 11:17:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707419846; x=1708024646;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:dkim-signature:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Sreg/nLMHjq+iQy8A5DInSHIYJrri4bRObJLJzGOHm8=;
        b=mYp744uPdzt+6vhb3ji+lfeyABNupaoKSAi+235/QO3625Z7VTmO9Ftg1E8UL5OuaC
         B694YJwtpf+//PG6DDfTyr55Lis6xk7ST2EV08uXcmMgaojD3LXbrATSCWghumqwTjT4
         XndCMivd7I46V86TGOFX1fkIlehiDINs23xuf4mgnSBABAceNQdvVWRFyvBeXfNDQtkc
         xf1rBSNgqSl3KbMU3U5RU+NLwobJC4GE0OB1paF0bNlD8Ms/xioL2M0w+6Sk3lQ4TUi0
         FqsVbRIPwW19R/kBNIF183s+PouDwguRuX01wz3ryFSVvt1Z9J1tTNI+TadAEGgOt/BV
         6QmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWelrKchssDUouKLSPH1GunI6ioxpadK+fdRpAgN9dFiepGSj1ilnr0l349/gomQfqXx9V3NzEjv+h35EAQhvdCF1CHc0tlULDFqumXWA==
X-Gm-Message-State: AOJu0Yz/Msh5sbo+DdaC9rw4fopCxGr7KadOovkO727ebfWrQP6Cjk8m
	0B3nPDHuOXW2rssE4BwSxKJUVvkKDn9tsIWXVSXt5UuDKh8WJp4i
X-Google-Smtp-Source: AGHT+IFAZc4PZltUqL0FnqQ/LlmQm/h47cW7se6PRIqYHEYfRe0NMJ53amNgXdvAl2sxtU5H299UMw==
X-Received: by 2002:a05:6a21:3409:b0:19e:986d:7a6a with SMTP id yn9-20020a056a21340900b0019e986d7a6amr473014pzb.7.1707419845971;
        Thu, 08 Feb 2024 11:17:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWw1LvNt5maBy7bJyCukB1p0DCZEK5YiXYWUVQ4UIONJ36yLJG/slxxmXpRmWVSg2Q9jxDHi265QdALR+EC0wcThl6+2m+yPujF+BHJpw88ikaA19NOQ7PYguSJ9ydolzx11Pz4PnyneAy8g5wKD25QLS2B5QtIWw3FF+U+fz6nCR4BrFAT5FcOby4HtfFSgLoF85EiklqvJU9b0FshrUNUXnASVBURdfvJMjltP8s8WLE4Ew3qfNNIWrTmq1tpdCW6m3vaiHUwEDgLpw6mxBAPOSHfUw==
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id n50-20020a056a000d7200b006e0503f467bsm98003pfv.39.2024.02.08.11.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 11:17:25 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1707419843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Sreg/nLMHjq+iQy8A5DInSHIYJrri4bRObJLJzGOHm8=;
	b=EVZrxks5I47CVRDMg84D5SQASNnFBGLFAgxv8Mzb/luMjH9MC3wxcGG0LjZBNHqPP8u0oe
	P4KfUqMXFvbou/VUX1DW4Uk4Mgo83fMtTfbc922wDJ9xptlaJPW/oTJBlLFBPSWWLdfYY/
	6nFfaSoviHF8R8UGrOE1asQAowbdbThlceXdVuh5HajDR4gf5bnbc3WkkolrRjw/9pbKID
	LBxyvFegZzp0ftqfh1QX9dbf6Daa/mHZ+YqS1HJV8qilqEECL7n4oDcE1F65Ognrc6vnOb
	xo1asbEYx7TdXmr1ToG9tVY88n46pUVBVAAnIjEeZMFwVYScXKyaCLcfuK4Jzw==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Subject: [PATCH 0/2] staging: struct bus_type cleanup
Date: Thu, 08 Feb 2024 16:17:50 -0300
Message-Id: <20240208-bus_cleanup-staging2-v1-0-cfe906133a2c@marliere.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN8oxWUC/x3MQQqAIBBA0avErBMmidCuEhGWkw2EhVMRRHdPW
 r7F/w8IJSaBtngg0cXCW8yoygKmxcVAin02aNQ1ajRqPGWYVnLx3JUcLnAMWnljsRnRzpVHyOm
 eaOb733b9+34idUN5ZgAAAA==
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, "Ricardo B. Marliere" <ricardo@marliere.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=799; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=9cNNhlkh8Qz2Cmmyb82krEPKz/SNHddqSojZKEbTrIA=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBlxSjk0lUI+Szg7cK31L67bGEkflVZVQjlODBBm
 jxpGp4y/HiJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZcUo5AAKCRDJC4p8Y4ZY
 psCjD/40tiSMChC32uLtdr/zyTwVOGHSFCv1BqsR/L6+a5XucBwWL5yS80w1qFvytoiDAboatus
 us2yXTgwo5QewkZgYXVuXewzuj9CkJL5I0KdN6Y5k12VVtlTodX44I00j3d+xxLGtQjrRtfemtC
 RyYmU28Gz9lKgIe76JkeKFtPOIl+2hpujrNkqq9t3SqujwI3i2qZkqb13ESZ/h+7pYXhP/so2dG
 wEpNHlydggdQK8rMpGjLh/n4isgfH/R/CS5B5dbF8gH8DBaBDr+8gvtXNFL/QIHUWVrVkpyKMTl
 DapfHSdwdiIrb8CzSGeukW1JnyuB1vz87o+86hZlb2KXniNxTJ+cP0EyAIraK/noSKbJSqvDBHK
 ncrWtHhcuajzQ/VzCCW2NyFlFO+UL5dXWKqYS+k46UUDYfiu3B+Oor3Wt0jXeu6Pj3jV9BvWSF9
 dDKKw5feWN29tHTc2H1w2YQ1jvazOLAevsNJO8rn19esXCjhxFVukd6KzIKR+fLQZsqhvjEPt6Q
 3Lk7ElqxWbZCcU+OzyfmKINPa0vYDzasVCpux9iM4cHj3R2qnBex+Cs0V3zCh7wFn38DLUu0leM
 X/cEn0ng7w1vobGuF8MN88iAdFN7Ek6N+chjHRPh4vYJPmCf8HbrvT9pYbhVyXdSZut8kQVti9B
 5OfJqD/pMPXIRUA==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6

This series is part of an effort to cleanup the users of the driver
core.

Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
Ricardo B. Marliere (2):
      staging: vc04_services: vchiq_arm: make vchiq_bus_type const
      staging: vme: make vme_bus_type const

 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c | 2 +-
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.h | 2 +-
 drivers/staging/vme_user/vme.c                                | 2 +-
 drivers/staging/vme_user/vme.h                                | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: ce54e9342124ededf0a00ed4e8a8aee535bfbf00
change-id: 20240208-bus_cleanup-staging2-d8906b09f1d0

Best regards,
-- 
Ricardo B. Marliere <ricardo@marliere.net>


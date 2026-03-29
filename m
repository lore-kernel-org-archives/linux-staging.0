Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B489E38734D
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 18:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774810167; cv=none; b=WAvbk36Q5iJHX1m7/eEpjTDA9Q9Gz1qNQOtPd8Tqw6aEappJCcF5UZJ3g+7qlimkqRe43e+FtR6jO0CJmND2l6HWxP+2UjD8Shm0oPmc4nSwcbGXWQD3jAJfpklPTW2VAazqNwPULwHGnGnxi2ojLX9p9kbmfAwlYQOQH6RZUwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774810167; c=relaxed/simple;
	bh=6waufSmesp2JgfF19DKXBQuLDjcjbl+OJb3oAYIjJSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BA0LJlgAgDhdVzaePLmJ4UnH6wecPGZsDFdc5Fu8CSBxgyxJ3obst3+RizZs80wLbGxVjZUZzgPE452NbxvcW579hHOprr41iIoJZRugjxr33pDbkQ2ySPKHJlvsGqLfr/9Ar/ZUQM9/VWPz4BoMiYigd6f5cTpjMiC9VAQNKyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/vDuXyF; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/vDuXyF"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43b87970468so3413744f8f.3
        for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 11:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774810162; x=1775414962; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12hnKdjz6/Mr8B3it9Q0v2b6LVUl8V91nVrdlKXH76o=;
        b=U/vDuXyFzP6EtS8cFprHVipVtqeED0V5RMuAD7Cmpo0L5vGbyVWACAcmoUod9XlB9w
         wfXtG+8Dj3p+TJfSoADgUhHQIahwzOcHvCsdIulB2OZQJyUONMhL8z2R89d6yT3856Ee
         usR96r+Loy/zEgLEXoBgs1ovRmXt75HZKoMX75lJ/QSdk6x0cKUmMZOZoQYebOfJy7yD
         PCkkcQch+osyg9N/ZKwiSGY7zHUWLcXFm+IzgURrgQYZIGDqVUc06tX7G9ok6nZ/OQLB
         BYfkpT5ptv7vHx/wjQvbGXL91Ph5noT8IMW2q2L8gHEdLBe0grieMAhLkWM3vhurYLiX
         YQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774810162; x=1775414962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=12hnKdjz6/Mr8B3it9Q0v2b6LVUl8V91nVrdlKXH76o=;
        b=hVBMurYBED4gjZLl0+CqeEPWO0kW6msACLQO0CtiC0PKbjtCrMNKMSLZ5EWFCC5oII
         dEejhd7joncPo6uhT98rF2S8HK64J+8Ao8aVKCixZMQU5MO7QEiGMkdaBUu8MYMset+f
         3aYJPR/rEIJmRNKTRqxVpK8Y4mJTlW7nYs4OrX2T08/3PvhB/cFrTqBAwN3VGZHql+x6
         nx72Xq9puVUM9jV9KhuKcBT86aHJVpWrFeLqLPQnE56j3zDOnSRQP3JJhTlM/wBUxdu9
         6GfVBJoYk4V3Z0hZnZppi4+Fze0f/vJXILySjvKpeAp9q25AdHfzJ3albrTa4okaES4X
         EvIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkYnyU3Lfyfqp+vF2+FkauPakqZTi5i51H5sokbE9VUq0kzAOD+e2s0toUkdrenhxuaWNvT5rWUWshmzoc@lists.linux.dev
X-Gm-Message-State: AOJu0Yy45rwgy+1Qw7v1wzzRMBU//nUn9RmM9Bxe+kj67JUOQEGMcGvN
	HGF3QunLQhEXsiMvAcctxl2YfQfScOAJPQ0mtFH56eSHhxNMSQPwfDPZ
X-Gm-Gg: ATEYQzyVQIZD1vxxoJgiVmwbjCJpKuQyeLluz8NEo13hpGbvRD+Cr78gJURUebQ/atn
	sPhCDWPNfc8Gb5sV/U72sr4CqpFM4afWpoU5aJH0dCDSJjfFX8TN4eoNdR2U0DzPWY6AvpsCx3I
	eIkgvk37HT/ri+Xad3F35xn33YAwhAQE1qXReCvw1dx5pCqFfqc9Qj07Awl2TYOgIZJYUflzLHK
	jpDgDiE5K0qNc44Z4YZyoMr0f9rvb4K3Tcs32s5V8lJ+n4ftMtRoBI8AszUJ27C3Oa7didEoOPr
	nj8fhJhSW4pmhuAJ3iOER3F8yUJU+gEicZ8ogMrElvX465fjVSnuZw37ZUMF7q/ft5gjtOalS9P
	tVulcdEiEW8uaZgd6V8Ut5giz8WcZlZIUUBe+vKZMTW6WlONuFwAjjgJWnOPXiVzYY9rx6tRCkF
	cU69OcTMZCiWNq25Shgxj9whEglJQV+P82u0db0AFmyDnJUcvOM3SMhCY3EwomIw==
X-Received: by 2002:a05:6000:2511:b0:43b:9c08:4a30 with SMTP id ffacd0b85a97d-43b9ea16d7amr15928290f8f.11.1774810161650;
        Sun, 29 Mar 2026 11:49:21 -0700 (PDT)
Received: from DESKTOP-IHE0QGF.localdomain ([86.121.12.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21eba4dsm14058443f8f.11.2026.03.29.11.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 11:49:21 -0700 (PDT)
From: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	daniel.baluta@nxp.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Serban-Pascu Robert <robyserbanpascu06@gmail.com>
Subject: [PATCH v3 1/4] staging: media: atomisp: fix SPDX license identifier style
Date: Sun, 29 Mar 2026 21:48:07 +0300
Message-ID: <20260329184810.455285-2-robyserbanpascu06@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329184810.455285-1-robyserbanpascu06@gmail.com>
References: <20260329184810.455285-1-robyserbanpascu06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the C-style block comment for the SPDX license identifier in the
header file as per Linux kernel coding standards.

Signed-off-by: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
---
 drivers/staging/media/atomisp/pci/system_global.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/system_global.h b/drivers/staging/media/atomisp/pci/system_global.h
index e8a29f73d67a..c99fb649fb5f 100644
--- a/drivers/staging/media/atomisp/pci/system_global.h
+++ b/drivers/staging/media/atomisp/pci/system_global.h
@@ -1,5 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-// SPDX-License-Identifier: GPL-2.0-or-later
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *    (c) 2020 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  */
-- 
2.43.0


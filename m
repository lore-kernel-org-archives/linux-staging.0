Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BE715B543
	for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 10:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727431364; cv=none; b=e67V+ynYfySBcEpN+qFaYuCvCvaJ8v5ATsCNLwLNxiFPfSwLCCY9CtFc7yYxHIFdUaZhGLCEVP9qBwoPTpAs7pfMPt84U1KQ8iIoxnsPeV3PkOg+1TXWZPXbC1E3QaRTTw0I2Y0481tAQYAo6PZ0O+9UK2GmiUZghRHnveAfeyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727431364; c=relaxed/simple;
	bh=714tcmA69jYCf49amVdt/+5qp+u9/EL6t0lYFKZfwIM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=txxSCA1aWA2YneLk4RfuFLyZ8LBT1Tlwr/46juWmAygBK68zcBZDF+nceLmmbdCZRlgtRvdDeGSZlsyKn0m7+ZqToxGKiAqTSHy6c+Zg4Coxa9xS46CGW9qdBJSLFqJChXcKXofe89RH9tmHRm4GnZydxPPcXkw9dTBNWX0aWRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Zd+nzbIZ; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Zd+nzbIZ"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4585e25f42bso15632841cf.2
        for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 03:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727431361; x=1728036161; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3dKRhm+hxvd20V+RfyZH2y9WeFmXxaHJfSQ5cudFct0=;
        b=Zd+nzbIZvBUPBY6F5/oJ71iCVtOhaDKm8AlUAHRjLNKIIUZCvVQM8/bB5+HPuJXSie
         7wSaTHt3yS7SxxNsdVQz72rhB/LgwJ802Abstu+on4Z/V7L55WdCaN6JnSiSvT7RZOun
         Bmtsp0RMpu7V1DWf79Kk68WCPIqqg+pG9BX/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727431361; x=1728036161;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3dKRhm+hxvd20V+RfyZH2y9WeFmXxaHJfSQ5cudFct0=;
        b=a/nRqF5pM9UZsoF7/40Ut6yovDiC5nZ3opoVuedxcPR7QJ6FzJtxhwt04VcTYqrYyL
         3G1UKo9J/rRUjBA3ScEoovJsG+qZb1cim96THEfHDXG+DC+8ChtYotyArM5/SrteJDf6
         Sd0MgZAGTSTyX72arNDmvY2y6rKAD8q2f+Oqj8YqvnpL7xGPWywkZLfRphAfGPsXwrI8
         q8+fvbMmFv54IH9gBXQHjJzuE3v75ai3UlEHIqFoWw8Uu1zOPUN5qH7ZyMX78nbmLQeo
         Bli1cLYS6fIi7EcHR/3/OIO9NcdlGNRU5YI4eoRU05J7mR3ykJpYlclZY5tGjIly/dpp
         T4bg==
X-Forwarded-Encrypted: i=1; AJvYcCWvAn0YpAmocNK9IOqoN1WgKY/VXVhgq1lfDF/35FldNv6e2w8aeyS07gOTYydN+5l2EaMQ+cly9vCPZ7iP@lists.linux.dev
X-Gm-Message-State: AOJu0YwHIoGNu/7YkTEy1EZZzdo0RjSayO+Tyd5NX8m34NRKyB90rOcU
	B9CUsn2z5rq/Bpm3z66ELDSYI3C8+kupH9HZru6xEh7C083BG1yKPuPqg9oXsA==
X-Google-Smtp-Source: AGHT+IGwjy4L9j91AvvJoFPs1lbJmSSAza6n2s2jdGdo0BYw5vYnwd6nQ+ES2VVTBgPk7iM/xKrtFg==
X-Received: by 2002:ac8:5f54:0:b0:458:37c6:46fa with SMTP id d75a77b69052e-45c9f230381mr40089251cf.28.1727431361423;
        Fri, 27 Sep 2024 03:02:41 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45c9f353f08sm6341091cf.94.2024.09.27.03.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 03:02:40 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/3] media: static-analyzers: Fix 6.12-rc1 cocci
 warnings
Date: Fri, 27 Sep 2024 10:02:31 +0000
Message-Id: <20240927-cocci-6-12-v2-0-1c6ad931959b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALeC9mYC/23MOw7CMBBF0a1EUzPINiYfKvaBUoTxEE+ROLLBA
 kXZOyY15X3SOyskjsIJLtUKkbMkCXMJc6iA/DCPjOJKg1HGqs40SIFIsEZt0NK50XdquXMOymG
 J/JD3jt360l7SM8TPbmf9W/8yWaPC4aRbZ7kedOeu5GOY5DUdQxyh37btCw7ZNOqnAAAA
To: Benoit Parrot <bparrot@ti.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

This patchset introduces fixes for all the new warnings introduced in
Linux 6.12-rc1

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2: Thanks Andy and Hans
- Replace max with if
- Fix style in subject
- Link to v1: https://lore.kernel.org/r/20240927-cocci-6-12-v1-0-a318d4e6a19d@chromium.org

---
Ricardo Ribalda (3):
      media: ti: cal: Use str_up_down()
      staging: media: ipu3: Use str_down_up()
      media: atomisp: Use max() macros

 drivers/media/platform/ti/cal/cal-camerarx.c    | 2 +-
 drivers/staging/media/atomisp/pci/sh_css_frac.h | 6 ++++--
 drivers/staging/media/ipu3/ipu3-css.c           | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)
---
base-commit: 075dbe9f6e3c21596c5245826a4ee1f1c1676eb8
change-id: 20240927-cocci-6-12-4c571bc8e9dd

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AD01BAEC0
	for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 09:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727430139; cv=none; b=VODCUTcnum74iXZHEWw/GO4lBkCRHROgPaNDjMyJY0S72U18OPPbrH319jfsP3dnyB9t5zgrLyR6v391ZtoOfyhIacrdti94uW6L/zFnJFu3vKOKGwVe2XWWiataJuEI3/f9yQyweyPwI5p8FwfZdb9EXd2JEKHaVWu1TGstz9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727430139; c=relaxed/simple;
	bh=EFR/ANWPCKmDg0b6+GGTqssw5qCBOHgmT1Lnn5oCYQI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mMByBv+gUoGHlA9eZzuWMh3DXnBsdL4hjM+TQwyj6sFqh6JiqFheMvpaXNcjwL9vKxyodC3ubSatZNPqRjrPD02GokXpTMZtYicIbCZS4VCMHX1JNe/N8sbgJzYlA5oeVcmUFTiCqxS3p5jhEHqN24pWlzHjazbFmMQ/XA+IJ54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mQeLir1t; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mQeLir1t"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6cb2f272f8bso15111436d6.0
        for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 02:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727430137; x=1728034937; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=viz2TzhohWKxeTATpvOhL62kLKmbL4Cojnm7H5/tiU4=;
        b=mQeLir1tMwQ7K87ElJYZZPIXDVG7stl2A4TgfcxgCzQstNnb5sSxvltd+bEIomgm7V
         AZg7boyj/Uzcb+WI1b6aqDoA/XWmJIfGp5mXuxDmG+m77Cw2vjZRAOjeXGRfFSRplB3j
         Ckizz/f5jZ63gHoqT2YSM8bkV7+MpA+D2gzIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727430137; x=1728034937;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=viz2TzhohWKxeTATpvOhL62kLKmbL4Cojnm7H5/tiU4=;
        b=rz47+goMg86Yup/UyiVWx8kD/a1pJNy/00UPFPC0i9PqwfGmsWqTK1++JEn7hPa9Um
         gNsCv161m3J+mfM1h9UoxOB82/oWpxHSxJF1oG++S4BR6MKEAEXFJyE5GYfmFUyp/NE9
         goS1MwZ4v8dHIrYRVin8BQZmbwxjHvL1zKRFaDJnS08tARcv1k68cO3uF9uXXHsOifWO
         AsFgOu5m4WELf9Xn24MGVOLPi+uglUnRGio1eia1AHDc65B5jzcmXxxOjnTjnFvquJXL
         KJ1XuyX/Xw0EavcLdaxIvHykZdMQmVXWyI3htzYLxd//qrNyawziE8UL7yJhhwkQHzzG
         PeWg==
X-Forwarded-Encrypted: i=1; AJvYcCXCycgfekqaywGMnwNiGPRlK+LSvl95S1y0UM4XnnlxjjTK0+2l21+cdpnvu0jRY1ImOT74XbuuuRtQm08g@lists.linux.dev
X-Gm-Message-State: AOJu0YxQ7neJH6V8hc1dCs0pmf8kAOt/7HkctPJCyFd9NmlmLl9H7pM8
	r7EXbOT9f4QIDHva22WJWoN/vIKJR/lFI64jWACNQseGP+B2pe36YcLbv7DqIw==
X-Google-Smtp-Source: AGHT+IFsTN8CFq2x0Pg4RmTcoxyR4STd3A5CNEsdWGLsHPgu10qVTYe1JETF4NlcDf2XSH+FN50qMA==
X-Received: by 2002:a05:6214:2b91:b0:6ca:756d:68a8 with SMTP id 6a1803df08f44-6cb3b5f853amr31175796d6.15.1727430136764;
        Fri, 27 Sep 2024 02:42:16 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b5ff594sm7231606d6.14.2024.09.27.02.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 02:42:15 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/3] media: static-analyzers: Fix 6.12-rc1 cocci warnings
Date: Fri, 27 Sep 2024 09:42:12 +0000
Message-Id: <20240927-cocci-6-12-v1-0-a318d4e6a19d@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPR99mYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDSyNz3eT85ORMXTNdQyNdk2RTc8OkZItUy5QUJaCGgqLUtMwKsGHRsbW
 1AKKZfgdcAAAA
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
Ricardo Ribalda (3):
      media: ti: cal: Use str_up_down()
      staging: media: ipu3:Use str_down_up()
      media: atomisp: Use max() macros

 drivers/media/platform/ti/cal/cal-camerarx.c    | 2 +-
 drivers/staging/media/atomisp/pci/sh_css_frac.h | 4 ++--
 drivers/staging/media/ipu3/ipu3-css.c           | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: 075dbe9f6e3c21596c5245826a4ee1f1c1676eb8
change-id: 20240927-cocci-6-12-4c571bc8e9dd

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


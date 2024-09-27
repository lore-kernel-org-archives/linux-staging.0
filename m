Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15E81BD023
	for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 10:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727431370; cv=none; b=f/fmn4P9PnOUBijdwZBtlecbEbJASQei+H/kQXKAj8JNGgp8Mae7PnZvKuyFrbzV534Ykq87oLffPo09EFc9eGBdjaZGyWS//jDeU0jTSXKdzHnFCEaVNq8lqo2ppt5ooOx8pA7UnxKE/LeeS5fsqgLmIYcmigVxYmGjDGG5Bkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727431370; c=relaxed/simple;
	bh=uw0K97JV9fivxdnVN2cUQwyp6nbgfNRKN3h76jkLFYY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lCULFzq55HSBWsGcK/j9qQI+CgS/GyQiJwXb+19E64Ep6wjoOHhZ7AuqL7kpoAxEVSDJn0sMUIUa6alanYDYKIfwJpEWRy7DHcRIXSLhLjzMqmWcaTRc84DnU+xHiOGbp/l6MRvLiA/1kjsx3+8LakmIrHWpt/VQAe+0mFWNsL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mFOb+aRT; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mFOb+aRT"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6cb29ff33c5so15746246d6.2
        for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 03:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727431368; x=1728036168; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mSjw1khDQimJSSBzxeMp5r4khGbQqGrktSmSipAyKGM=;
        b=mFOb+aRToCeyRX4YQKLNBsvPDpdhhFg9w0YHybg/BAVr4mDY/V3Y8ZQn5DpQcKpRZ8
         EFP1m08dXJMLMe5Ef5oZSD63aq02V+HBYs69NYRnNBkreeupkxMA7uzH9y8zZDkkmuLQ
         SOSyaf1YKRng3JyF/JmNeVIWOVCtpucxRVosA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727431368; x=1728036168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSjw1khDQimJSSBzxeMp5r4khGbQqGrktSmSipAyKGM=;
        b=m8ZZFLsYNarHNazr73SEq5EXJcRpBHllo3CQL6th1rclPHSfa+0V2wZ67MVlU24//n
         724mgBVI0xD7womaDlrTgR5+17KcTWpAHGcbueM954VYO5S/YmKbsHSeDoQ0+jLcuLvk
         VyIIpNBKi0dxIXx32Ic9Kt3yX2iAcfLORIgi4Dm/e4f0lGCaNbTaJlqkadyM4QbGhhzX
         N7+wZScif6izsJ6nniITH5DiFCeaBGLhX9MUYpimBhBjT42pkxT5Wwv8zKAB0SwrhxXo
         5Bf7ev8f7CdZBIEXO6jt6SLybquNazPYqqFTpEHYD/E3gTzOdiaMDnO8lha53+Ih3wtT
         sYfw==
X-Forwarded-Encrypted: i=1; AJvYcCXHl3LTP2TUKdpPUhcAJ9XmgR/B3GWCcCeXw5oLUs1LG8ik059ZcmR7LdsBcHsGpmBee/hDrN4wTNjz/xAO@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+7j498/7oCw2R6se7JJaPw02ZtOKNxbzNFkc2XjO+ZlkGJpwH
	4OLIn9/1GCjZOB4BljquKjv9oE0WwNqry1LSGNJskvw1nbdjoRgpFLKG8sWFng==
X-Google-Smtp-Source: AGHT+IGmj2VIw5fwcR7lMfdlhGfeKlUZ5ZB5sGNgsSChCVQ89YCG0Pdjs36ucyYbgh9Wu38SUEf4+Q==
X-Received: by 2002:a05:6214:3d8a:b0:6c5:3123:4efd with SMTP id 6a1803df08f44-6cb3b5b663bmr52445036d6.1.1727431367752;
        Fri, 27 Sep 2024 03:02:47 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45c9f353f08sm6341091cf.94.2024.09.27.03.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 03:02:46 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 27 Sep 2024 10:02:34 +0000
Subject: [PATCH v2 3/3] media: atomisp: Use max() macros
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-cocci-6-12-v2-3-1c6ad931959b@chromium.org>
References: <20240927-cocci-6-12-v2-0-1c6ad931959b@chromium.org>
In-Reply-To: <20240927-cocci-6-12-v2-0-1c6ad931959b@chromium.org>
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

The max() macro produce nicer code and also fixes the following cocci
errors:

drivers/staging/media/atomisp/pci/sh_css_frac.h:40:17-18: WARNING opportunity for max()
drivers/staging/media/atomisp/pci/sh_css_frac.h:50:17-18: WARNING opportunity for max()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/atomisp/pci/sh_css_frac.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_frac.h b/drivers/staging/media/atomisp/pci/sh_css_frac.h
index 8ba65161f7a9..3191d2858f59 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_frac.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_frac.h
@@ -37,7 +37,8 @@ static inline int sDIGIT_FITTING(int v, int a, int b)
 	int fit_shift = sFRACTION_BITS_FITTING(a) - b;
 
 	v >>= sSHIFT;
-	v >>= fit_shift > 0 ? fit_shift : 0;
+	if (fit_shift > 0)
+		v >>= fit_shift;
 
 	return clamp_t(int, v, sISP_VAL_MIN, sISP_VAL_MAX);
 }
@@ -47,7 +48,8 @@ static inline unsigned int uDIGIT_FITTING(unsigned int v, int a, int b)
 	int fit_shift = uFRACTION_BITS_FITTING(a) - b;
 
 	v >>= uSHIFT;
-	v >>= fit_shift > 0 ? fit_shift : 0;
+	if (fit_shift > 0)
+		v >>= fit_shift;
 
 	return clamp_t(unsigned int, v, uISP_VAL_MIN, uISP_VAL_MAX);
 }

-- 
2.46.1.824.gd892dcdcdd-goog


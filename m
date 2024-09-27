Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB811BBBDB
	for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 09:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727430146; cv=none; b=aKxaJ8Rxz5v8EL73jetIznsauMchyOqkvWPJWt/440Gzo32u4C/u8N1miCfFRTDhlaCgdXLAFFZXXiRzswt9cRLFjb0nsivnU+4UdZZJHvMyJGDsIcXfkhRHx+UN6vvs/fIYc/A9UWgFZwh2a4gAqumVlAyaONifePJ4CEVbd/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727430146; c=relaxed/simple;
	bh=VyNnQQDdJJNeW/LwMh2KTy2Bsd63Uen2yuUOk3ftr40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U7Ifapjt9b/VicV/NrkPUuEgL3rIS+MzDkIS24qsJKkDjJUYPa5F5vtjZDC5BOA3t4NbHeK+Y7BWTxLY5y+lIdlQjLD+pfEozX1AlPkji+f8SYHgZ1VgseIM42VhtFOlr5JrAc1nAiJ4afI46Tep3AG4jRApGCEYLncSQZpX/fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cqt3VeZg; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cqt3VeZg"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6cb3d2ce75eso5506136d6.0
        for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 02:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727430143; x=1728034943; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H5LcjuiiFLMydGICnxC7Y1POK5qtShnTkO1KY/L5xYc=;
        b=cqt3VeZg36AcYUTtu6BIN7152FhYUdCKzH/XGLRqnkmi3BcK9weqYcPCRSe0wYv4YE
         uMQ7ZrpxsWHagEnsUrBtrHF/8ikH/hLrGCCL6PRU+jgbqTb7IujcailE4xlklcvTSQln
         VB8aUI3ayTMit0QTtscxmdylVx4jGWMeAF+7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727430143; x=1728034943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H5LcjuiiFLMydGICnxC7Y1POK5qtShnTkO1KY/L5xYc=;
        b=dEQFAI7CxLx5PDvU3Apqdw+Mq63s6JURK0mV+e20dxmTJc+0kqouRlniW9CcyhJuZ3
         MW24hkT9mGuBBe9StvcB3YKUmYrMaC0B4SvvJfvwnCMyKhOV5aJWDLyMWx4F94534imF
         BSIP978GHhzq78a8fKkofhcD+7IZuaf2NANm3f8D7aqaeU4OT6B/Vv3wINZRWHPTaR4Q
         O6EiJzUENYnJSuk9OQWDWWxlW+dHZ5JVWrEOZTIQaPR+uCwEzLQ70t1rYzOEN9m8Um+S
         js2EsvFsV98wCs+zIDLPX4s9USGfOEeHZGgAuHnSTwzUY4SG6vdL/xB9bJsotQcWAAtq
         q0Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVPrmEAFSoo34Ew0PFOPQOeknZevFDDmMmpaKeLp7cy6MtUh8fMetUcDC8Odww+21od55W1RxS9U/I/xJq6@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3VFkXifd0eAcGoaZ66ENrTm+MrSj1ur32n4NuhNir1YPNFX+z
	iP0YCkMbiPvdTb7wYaJY2SWmD/TdvIaFxgUyQoDPtt9q1l/Ch52mu9BaxhvNOA==
X-Google-Smtp-Source: AGHT+IHqAWy4X2erODR4y6wB6ll6Vg8M7MrsnkD9K4fU/rxNaepW2iQICN+JlQ+jvD6Nif1cTzZ8/A==
X-Received: by 2002:a05:6214:2583:b0:6cb:46b4:5771 with SMTP id 6a1803df08f44-6cb46b45b01mr7123196d6.13.1727430143583;
        Fri, 27 Sep 2024 02:42:23 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b5ff594sm7231606d6.14.2024.09.27.02.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 02:42:21 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 27 Sep 2024 09:42:15 +0000
Subject: [PATCH 3/3] media: atomisp: Use max() macros
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-cocci-6-12-v1-3-a318d4e6a19d@chromium.org>
References: <20240927-cocci-6-12-v1-0-a318d4e6a19d@chromium.org>
In-Reply-To: <20240927-cocci-6-12-v1-0-a318d4e6a19d@chromium.org>
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
 drivers/staging/media/atomisp/pci/sh_css_frac.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_frac.h b/drivers/staging/media/atomisp/pci/sh_css_frac.h
index 8ba65161f7a9..9642506d2388 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_frac.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_frac.h
@@ -37,7 +37,7 @@ static inline int sDIGIT_FITTING(int v, int a, int b)
 	int fit_shift = sFRACTION_BITS_FITTING(a) - b;
 
 	v >>= sSHIFT;
-	v >>= fit_shift > 0 ? fit_shift : 0;
+	v >>= max(fit_shift, 0);
 
 	return clamp_t(int, v, sISP_VAL_MIN, sISP_VAL_MAX);
 }
@@ -47,7 +47,7 @@ static inline unsigned int uDIGIT_FITTING(unsigned int v, int a, int b)
 	int fit_shift = uFRACTION_BITS_FITTING(a) - b;
 
 	v >>= uSHIFT;
-	v >>= fit_shift > 0 ? fit_shift : 0;
+	v >>= max(fit_shift, 0);
 
 	return clamp_t(unsigned int, v, uISP_VAL_MIN, uISP_VAL_MAX);
 }

-- 
2.46.1.824.gd892dcdcdd-goog


Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F02145B21
	for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 14:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711378229; cv=none; b=iDiRPT+DfZYRHd6LEahi8L94qfB7CCoDRSscA55ZGrZLOgpOg2A7LqojSeL/NgQ2116hHpq/RmNiu9O5fs4b2OLDDLcGVErgJub7gHCRXEhvENQEWJjrfDEnDvOjRqv/4j4N6MrR8bNGOar2HAn8ARZbguqfPDNDbuwFUgzETgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711378229; c=relaxed/simple;
	bh=2dAG+Jyz81+oh8AF6DeyE+UyRu22SiDEL635nHH+73Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oNO7sqdoWjpyCE3CnY3aW83X4yR3mjq6GWCdBiraoIIWldBJbyRQTiP8cn+RMrInWoplMmCP7sBc+rzexxy0V27RpzD+5rv/w/URSTQQYoVVvwvhSPSrsycIxe7XOxHndQufukQRDTwHc+spFyJd9uAmW7jMUYnVLgfmts952Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=D1+k5yWG; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D1+k5yWG"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-42ee23c64e3so18533411cf.2
        for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 07:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711378226; x=1711983026; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8QTboKNFlxJkYJ1An2aW3V7umhSjhO/WM5O6LoVCcU=;
        b=D1+k5yWGqNRBy8G29gD0hZbhQADwc+D96fcc1DJsZaze4MGVFWG5KzSu9qetyVgYpR
         YR5U0k4Gg9vP0PJ/WSbs998/pYxv48UrLbGmOzrX4x/EfajbAZT+g7i80l3wazm/y+7U
         bfzhMkqeAFDUqIHhje24Ijjh9yH5kcPYkOP58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711378226; x=1711983026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8QTboKNFlxJkYJ1An2aW3V7umhSjhO/WM5O6LoVCcU=;
        b=IeaLYZ24grvvWWYVMRi7/SEEQruzGdli/X7wYP/RxI2VcbfrwqiEipL3ALTwiYDNMK
         cFag6sq3RKwT+WJNI2mm1e+z1VYmdaYwDKjQn/xeINFW56C3mR88LRiG8gwHVM8UqNaC
         W3n1HhI2/1kbAdy+eMxVznDqYxoi1y0djxAb8qFnSWCJ2aOteoMiD7lR8PAiVV6SQjCv
         Akgrxr9er1B5nE70yL8Upq8BRCTquT3j318fYWo/JTLsCDlQDb6tRsWPX3ON1AoldLev
         UryAyO0wUOPAN8WTOeKzUAeZSpu/Yetgh3Sd2bIAlBKyM4vY2lnwaW0rIXwC8RPQeTGh
         53Iw==
X-Forwarded-Encrypted: i=1; AJvYcCWUJ1KCZFKpipxEfx/hxIHGs8izuxjSHRhXtqO4Mi3zRvRryQFkHwnG8JSL/SOILkEaMWFQcgzGJfJy+tF+YEDYH9DodSwqYGF5UH3H6w==
X-Gm-Message-State: AOJu0Yx0eSyrlUnj5RPZ6CNmr0tnxJWDa5KI8Nxhm5VW/3sS5MOLgROu
	QhzKoMgfoZbfkoIJwNIHkI4HiYgmykkhNaRrzlCQ1Nq+qrZANSYnIS2Xb342IA==
X-Google-Smtp-Source: AGHT+IEqb/RgrM1Zmsk/Hg4wuXRP1MFf283Gr9y7uqBgTIorav1xkqxxl139xGt4TwsfJtE9o1cPMg==
X-Received: by 2002:ac8:5d10:0:b0:431:38a4:ef47 with SMTP id f16-20020ac85d10000000b0043138a4ef47mr9187432qtx.48.1711378226517;
        Mon, 25 Mar 2024 07:50:26 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id eq17-20020a05622a5e1100b004313f54aaa9sm2491449qtb.5.2024.03.25.07.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 07:50:25 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 25 Mar 2024 14:50:24 +0000
Subject: [PATCH v3 2/3] media: radio-shark2: Avoid led_names truncations
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240325-gcc-arm-warnings-v3-2-81b8c10dc18a@chromium.org>
References: <20240325-gcc-arm-warnings-v3-0-81b8c10dc18a@chromium.org>
In-Reply-To: <20240325-gcc-arm-warnings-v3-0-81b8c10dc18a@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Increase the size of led_names so it can fit any valid v4l2 device name.

Fixes:
drivers/media/radio/radio-shark2.c:197:17: warning: ‘%s’ directive output may be truncated writing up to 35 bytes into a region of size 32 [-Wformat-truncation=]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/radio/radio-shark2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/radio/radio-shark2.c b/drivers/media/radio/radio-shark2.c
index f1c5c0a6a335c..e3e6aa87fe081 100644
--- a/drivers/media/radio/radio-shark2.c
+++ b/drivers/media/radio/radio-shark2.c
@@ -62,7 +62,7 @@ struct shark_device {
 #ifdef SHARK_USE_LEDS
 	struct work_struct led_work;
 	struct led_classdev leds[NO_LEDS];
-	char led_names[NO_LEDS][32];
+	char led_names[NO_LEDS][64];
 	atomic_t brightness[NO_LEDS];
 	unsigned long brightness_new;
 #endif

-- 
2.44.0.396.g6e790dbe36-goog


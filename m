Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08ECA12FB0E
	for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 14:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711376400; cv=none; b=HVRicTAzP+SWQO0DMR1e9WWFtllIiynW8CIgQf860GIvUl78pUXMjHbhmmXz0lL7jzWSZCTFSwJmtHTl1X1LScY8UBpgid4tUtC4Q5YCi2ZgiWR5gEci3jaDIAtS+58iHP1eKNtlfi7QcfDIoJ9HHZS4iH4wyLFMrRpsdWVTegM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711376400; c=relaxed/simple;
	bh=2dAG+Jyz81+oh8AF6DeyE+UyRu22SiDEL635nHH+73Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oKcoJh8KPeyjwWjPhCel3jAeKHbcJq3B6CBdgfAckstkD0eZugggznEJ8rluFqShk1D3exwW5sVWENBUMapizK/bwiKaO5anXe1EQNpS1g9rFnVzSp2pq02WtdTk9HOEEXptofLiX5pBg1ehSxA9LxbEUtOqbmfxOT3i0Dxd5cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lAU1U9TV; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lAU1U9TV"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-430c76fbf05so28914631cf.0
        for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 07:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711376397; x=1711981197; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8QTboKNFlxJkYJ1An2aW3V7umhSjhO/WM5O6LoVCcU=;
        b=lAU1U9TViHGycu6/xKJwdmwyg9+5u7AYGoKARSSF2gooOPtlXlGPXdu7NFHsr85/47
         eVtoviAlIlXCTTKDPHIapEcWnzM8FNUN4wB4iq5Cto40l/qNoW6wTy1JNouRUa8G/3V6
         n30B6v8XxePIPTjXQo7WioZKx9q8uIVcFyPjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711376397; x=1711981197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8QTboKNFlxJkYJ1An2aW3V7umhSjhO/WM5O6LoVCcU=;
        b=nnxWICPBximb21zNuIu/mb5tBQ+hU1YwtknC/KT0H3ifxIn0tLFaPzd1RrTphyd0Y2
         BFXlovawx/SEAelZCZHPdpfXwsT0NsBLot7+eisYvTeHijLgLBCvtwJRi6DHwQ3adbHe
         lIQn3Yxikv9bjaNIUHeKm2kXvhkY2pNqwUHFMlKDgRIw6h3RNkVaNRcjPNqzNNKaFV7i
         8pG20NlIDGziSoWJXM/8kG5sxxj1IRf4gQn3kcpjKxH4FZmirtCyl7MrY/O2zqeOm1Y7
         4zzDOkZf1zB741QNVE39ZbBDSzjofa9gwtBZC/W5lml0fbKOgapzki/ISnWjgVUSOBCa
         GZig==
X-Forwarded-Encrypted: i=1; AJvYcCVQui5OhWxbIivCiUym1uelSa6nlSNlJY5on2DRQ5non3KGNKvGWy53+GiSoGgo62WOTxwYAUWhAZQ3SPa1d3J8zGjyX/Z3Ad/QfH9Dzw==
X-Gm-Message-State: AOJu0YzLLn3iSbz/bbBKvg87txzDtmx+XRedKFHhSMY3mmjd7jwT3Mdn
	MKHrt5gXYADFgK+WhRob6iCqqHsHpo3FWyXbfvnwtdI+aOJxzhy6NhWYteVZPtdEMsvFurgkvZ6
	F6A==
X-Google-Smtp-Source: AGHT+IFz1M7TzNsRqhapaOB4EMIJCF8pxeNEAz5599OCzPaIO+sM6oRyyPofmo2f9pFg+HoTstBcEA==
X-Received: by 2002:a05:622a:652:b0:431:4905:bb79 with SMTP id a18-20020a05622a065200b004314905bb79mr5865639qtb.41.1711376397204;
        Mon, 25 Mar 2024 07:19:57 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id br11-20020a05622a1e0b00b00430a9b20a55sm2618759qtb.69.2024.03.25.07.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 07:19:56 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 25 Mar 2024 14:19:54 +0000
Subject: [PATCH v2 2/3] media: radio-shark2: Avoid led_names truncations
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240325-gcc-arm-warnings-v2-2-47523cf5c8ca@chromium.org>
References: <20240325-gcc-arm-warnings-v2-0-47523cf5c8ca@chromium.org>
In-Reply-To: <20240325-gcc-arm-warnings-v2-0-47523cf5c8ca@chromium.org>
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


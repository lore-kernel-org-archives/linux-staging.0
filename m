Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4855B214209
	for <linux-staging@lists.linux.dev>; Mon,  3 Mar 2025 14:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741012804; cv=none; b=PGuWD/aN8dq5QDBtrtbSsBUBDn4diWK4pPV1mOXclkbFYSzFRUXsyCZcR9iNp4tvwRX+rCMeEqcBYEuox/6qIMO9nG/QNTlfyVEfzAFtmuDEgFAxL2YO6+nKN08uE3adkWUFEf1hX5hCmjwtFoG2lL/4vD58hG/delOPv4fwHcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741012804; c=relaxed/simple;
	bh=huTITU+3NLOlGIQKUO1Q57DNwMMY/Xb18Ro9MUcuAZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=atxSmbNPNzNNCjUKbzGVn7vxTpjuxg26AznpPNl+d+BXowBFtwHh6DkxYzSgkfda9m8JfyP71N3PZxHHwfJCxmuWYcqdEiO6K+Hrcs4Eu4x+0k289b70viOSEMElrtid4iouEO3DeygOwrAPW8daajuHAv51MjjQtBHs/RpRjo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZZcYIziv; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZZcYIziv"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-390e702d481so1907128f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 03 Mar 2025 06:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741012800; x=1741617600; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cCvz2PQitaL3G15KvIJkAOr8tNO1gvVwjPom0Ibxufk=;
        b=ZZcYIzivXuHufF059GYc+4koOrUkfcszApLgtHHvzYelWwFr8hHClpPMoL8TqLYmhT
         JZrVseFizjOMGOzI+mLqNk308GG5Eu7ZE30Lu8ZtKLwt3TTImJA5pysh2+KaubCbGxQW
         3f6SP37Gk8FUSFiu88tgjeEvx6uXC+lNFAyCK/KT6diJY8mfRpwuG6NXpcq6vUZ/KDYs
         YotTJ79NUpu5YzX35tGFLc0gbEY+JBT8m2w1GKaxi9kFVQBNaXYd97Ju073NkZIMIBu4
         HVmrKn++WHvAtYyu6TuiIbwTS8A2hSBWXonQSVvaAhLNJiDJSEQs78dM8hKLrmygAwrM
         T8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741012800; x=1741617600;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cCvz2PQitaL3G15KvIJkAOr8tNO1gvVwjPom0Ibxufk=;
        b=PNIZB+nldDoox/n0WAjj4hoqA8alq7hG6JF2UO0l1T0li0mFT+SesUAYnjXGjCf2zQ
         cjiGZppS6hMkmcx+49uQ+1XAVLRK0xKdA5+97Ls2TjPiO4XD4yw2JLz7tGhQ4MqE1WXn
         Tma3KpnG4gyCoq9C4t8cPTvwZHw/dyAql5mHHhlFbmxqce3E+vzdlvOLSqvu0CrWB1Vo
         6Sq0guJOyP5RivId+9Z1hxN9QVTFKvlkFD80AgJMuq26QkoGvQ7zFS/azoX3QZsTkAoH
         v7uImQwxy5shyp/QULSC8X1/7GZ2os1Ynpl6JpSwvr2hESuR1rCanKkanwqtZv3Y8Tin
         VcnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpenj4VGFUiCsC+JLQXGVNHomBUMyRClEx+cyafEXPWaS3Pz1CO9uY2VXHx6nHx5bjVycNDQR3ujgqbKre@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4hb5z15Xfp/Gf6tg74TrPCxQi175shAwXZVpap63q7oYlkS/a
	OLLnejw8BJb5JVtjjnGV4nNo6k4KEmIlN1z4zhc4xAfnp+KhpOCteL+M3Krjc8U=
X-Gm-Gg: ASbGnct2XU6/cSsHVTHA9K+gckzGEaU9gCdpLrusTjU8PfpuGRzuF94OQHqnxIgVDPK
	+YKX3UqHaz9+UTB0pE2B6jnXyxeWEVLNcOIjz92JpiKfHyhgA3XgEYMPx+bAx5PJym+JZmcrjsu
	mC/7kGqcAA7BqfHnTuHMVF+/pbJWEJelvZoOxqCS+DsJ5Z0P3BLZU+CzLjG9XDDGTKkjkJhROJX
	LUpG82gxih8A5L013NjMJFkxEMTBJOw2/li3M3GQulxWwVqH/WbHk+Y0H4S6/qIyDZmXSErnfl9
	Oi9dbVq4+E0pZNxVqcwXqdHrWiDWnZ4D16IZWmjrnmk8VxEyI/uuAbf+30c78sd/+3e4yVYoTUH
	CUZB8TQ05ivVEtqdOONqDDLoCHzk+
X-Google-Smtp-Source: AGHT+IFGoay4YJM6YSXz0DZ05o3quafyCNLOWh8vQu4Eq4apk6qCX8ogXLL13gs5Zle+ply0NrLrLg==
X-Received: by 2002:a05:6000:1f8b:b0:391:ccf:2d1b with SMTP id ffacd0b85a97d-3910ccf2dcdmr2532910f8f.49.1741012800564;
        Mon, 03 Mar 2025 06:40:00 -0800 (PST)
Received: from [127.0.1.1] (amontpellier-556-1-148-206.w109-210.abo.wanadoo.fr. [109.210.4.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b7c43sm14394801f8f.49.2025.03.03.06.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 06:40:00 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 03 Mar 2025 14:39:57 +0000
Subject: [PATCH] MAINTAINERS: remove adi,ad7606.yaml from SEPS525
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-maintainers-remove-adi-ad7606-yaml-from-seps525-lcd-controller-v1-1-a4e4f1b824ab@baylibre.com>
X-B4-Tracking: v=1; b=H4sIADy/xWcC/x2OywrDIBAAfyXsuQs20Qj9ldKD0bVd8BHWEFJC/
 r3SwxzmNHNCI2Fq8BhOENq5cS1d7rcB/MeVNyGH7jCq0ahJTZgdl61D0lAo153QBe7YWc34dTl
 hlJqx0drMaDD5gL6WTWpKJLhYG7TXSzTaQY+sQpGP/8DzdV0/McmlB5AAAAA=
X-Change-ID: 20250303-maintainers-remove-adi-ad7606-yaml-from-seps525-lcd-controller-b77d4c4bf54a
To: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-fbdev@vger.kernel.org, linux-iio@vger.kernel.org, 
 Michael Hennerich <michael.hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2

Remove Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml from
STAGING - SEPS525 LCD CONTROLLER DRIVERS. This was likley a copy/paste
mistake. There is no bindings file for SEPS525 since it is only in
staging.

The removed file matches Documentation/devicetree/bindings/iio/*/adi,*
under ANALOG DEVICES INC IIO DRIVERS already so wasn't just misplaced.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
This falls under FBTFT which is currently orphaned, so someone else will
have to volunteer to pick this up.
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8e0736dc2ee0e33544fa373a4978b7dae18c040c..215dbaeedced8473b5b339329b3596a2fbfd13b1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22512,7 +22512,6 @@ STAGING - SEPS525 LCD CONTROLLER DRIVERS
 M:	Michael Hennerich <michael.hennerich@analog.com>
 L:	linux-fbdev@vger.kernel.org
 S:	Supported
-F:	Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
 F:	drivers/staging/fbtft/fb_seps525.c
 
 STAGING - SILICON MOTION SM750 FRAME BUFFER DRIVER

---
base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
change-id: 20250303-maintainers-remove-adi-ad7606-yaml-from-seps525-lcd-controller-b77d4c4bf54a

Best regards,
-- 
David Lechner <dlechner@baylibre.com>


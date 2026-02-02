Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E7122DFA4
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 20:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770064534; cv=none; b=qpQqPx+wpRc/0XVWeNGs4k7Gat3U/2xjduZ3zyGm28H7wC5SSvWJet/qcXRfuLFCmC4TrFSseFaqknQxPSuDFRptZeRDcQzxcAwLaCeyOxJB+63aj2cXQKtefG/3dwAtkmjrinB3w8geb30dHNxhr4ZF1ygWeqlykOJES3FoPCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770064534; c=relaxed/simple;
	bh=Cd/YOadTvtLSs73zO4+ovdHdcBWNDgZWZhpFONPuD5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YO1DWEQ/KX/M0COj4y/OhZ/6fVWBBJDSJaWY4jbCA4zdWfhhSFFxonHhSp9kOUvFcBbvZthk005PdpkiPVTuJ/Udds1i8C5lUluREph5/owZ6BVRjEN9VNju70YR8eIO+iRyTLcFkFyuWC/wHBJFRWgVpdM5dHNUvfNCZ4dtKU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwsoGc3r; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwsoGc3r"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3545cf80e1dso870569a91.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 12:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770064532; x=1770669332; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p46sF3aEqykhE3ThZZaR/iwrX+CzUiufVqNSIHlovws=;
        b=RwsoGc3r3v9Eb9W+TJA6GszlCZbu93WfQzz1KYg/T7aT3RiLvIXSIzXVueJv8Z9+6P
         0/OFRPr/AmZV7qXt9+7msoJAfqrlFC5OVXJHVSPTus6mXblP38mFdCsSB+5dauBc5Qkq
         6BUqyCTd/enDFoF+Y5VcFpp4L/kYDUWQuUua+tqZNdiL6alAxbiedeTTsF5EIjN6oIIK
         f3w2QOztLrzfGpkHfWFFyexrlbcxc7A0RgVV7BgOBJODygoZFDkQpgM3JuygVBUP9ECU
         johcut2ALPiNmvodCUzftC0PILgjG+SOxq4UWF6LytpYkG738YtTggZO6OCfxcbD7er/
         HctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770064532; x=1770669332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p46sF3aEqykhE3ThZZaR/iwrX+CzUiufVqNSIHlovws=;
        b=LaTc771g/qGgb6LbNKppzlp0kfTmc9IADD83IpqqPljXaQu3Lp9uy1A6uDTtDy3062
         HEEEd+6T/q3cKxJyAeUFs32Vp0G0Y4txeT+agZHnSNAvAFLaU+2ZnYcOBemMBM0GEdVj
         Cim2AaboHI+VIS0MvFa0cJ2G+EselsAcxjaRsUlSx9HGoDv61KEXXIIcWd+O+G3teTP0
         0YmY5xi882QFMR3pxyaVOHRb3tAvM/ILrADHH1TPoUjqg6+CIA61tzaoGM9CT7ES0GnQ
         rweS9kvy1ddkz53XSXbkJimqMLyKyYYOUQVzpck9TSgY4l5m06nj9QYMYByB+ROOQVNF
         +C7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWwXQ7ccmk2OhEePhxW1QXAq3qUW8bulrmORZA0nJ9eUcMTakM2jWhvVT/Z4+0FQog9QbOgJxF9RTvLFbCS@lists.linux.dev
X-Gm-Message-State: AOJu0YyC4SRKMjQn2CNGOAxy6CU3KBg86B5oE7jcUjIaYyOzVJAgQBxA
	t/eec9W5gdYctjFO0i6BcCHq+iHbB/w4i7P8Q0igPKA9WX4cCUbqSNpjIOwA5i4d
X-Gm-Gg: AZuq6aJOCzVuogbbOdXD77ClyDZfjjoNJ4os2adjxYsOdRW46MtE/bBXZUnt7fVfyml
	NGZuamsqVFLwusGBhiA4ad8/gaAmrW2UUtclC8pD7TL6Ekr43VqE1cM8XbtETzkNtM6S4epojPb
	yc/1Wd3TWz02qaj06UMX7HTldE45FSEsvOL41zYBi3wtCO/tf9jKuOYutuSa1LeMOuQcGLf1abz
	ajkYmTraZPlGn9zqzhlOnvNFF6R/Bogf2CZDsxAFrlkrR4IAhX6xGZ5O3tq/qYp9hLeLhgGKUdE
	98RFAY5at9fShFc4+49m2A11IddQUfcWKIAFLnIQmhpPMjKI3AC94nEsgiJRppMBMoBjexFzOkG
	4IWZCpkaZ8muRA87INEU9Het/Q44w9DSMVGbhKq4dPb8840No/F5ZOIPCUirUSHXMJheSVhpQ7r
	ubyTInxyI8lv+j9h1am+3vnG/SVVlE
X-Received: by 2002:a17:90b:3ccd:b0:353:49f2:1e7a with SMTP id 98e67ed59e1d1-3543b398127mr13163131a91.17.1770064532331;
        Mon, 02 Feb 2026 12:35:32 -0800 (PST)
Received: from DESKTOP-7ISABPS.localdomain ([223.233.86.133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3543d52c396sm6316663a91.4.2026.02.02.12.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 12:35:31 -0800 (PST)
From: Rachit Dhar <rchtdhr@gmail.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rachit Dhar <rchtdhr@gmail.com>
Subject: [PATCH 3/3] staging: greybus: resolved checkpatch checks for light.c
Date: Mon,  2 Feb 2026 20:35:19 +0000
Message-ID: <20260202203519.160271-1-rchtdhr@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added comment to mutex declarations, to resolve checkpatch.pl checks.

Signed-off-by: Rachit Dhar <rchtdhr@gmail.com>
---
 drivers/staging/greybus/light.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index e509fdc715db..1f2faa6d545d 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -37,7 +37,7 @@ struct gb_channel {
 	bool				releasing;
 	bool				strobe_state;
 	bool				active;
-	struct mutex			lock;
+	struct mutex			lock; /* protects gb_channel->active */
 };
 
 struct gb_light {
@@ -59,7 +59,7 @@ struct gb_lights {
 	struct gb_connection	*connection;
 	u8			lights_count;
 	struct gb_light		*lights;
-	struct mutex		lights_lock;
+	struct mutex		lights_lock; /* protects gb_lights->lights */
 };
 
 static void gb_lights_channel_free(struct gb_channel *channel);
-- 
2.43.0


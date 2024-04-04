Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D461CA8D
	for <linux-staging@lists.linux.dev>; Thu,  4 Apr 2024 00:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712189871; cv=none; b=YABJoxNWiBmtTJpzYOwejN7s0oP+allc7Du2nKwEa0YcJHlwfLWD25Lk0y+GX46Fy5lezMHflBT7gLNMqOx1WvzoYOuvPDNf87IuJouZErTKjTghDy5zY3ItGFZ6MkrHhrwlijlpQ+W8BODK9r2a7vR8iMO+eRDC0miThC2M6nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712189871; c=relaxed/simple;
	bh=B7R3hnTJRgCRWl5nF3InAG07B70C9XWTY07YjD3CY9Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s/0jqccmCOi447MA9XupYqeiymDERYA6TM98zQDI9jQo1CD6A2x6aMm2M++VI+AZpIkrLBBhS4vYJ19zPRKktK8OAQFeS3XwLF1MR+1NLIky+HDMcO6RUg/pI6TQuW5luEu0MaPwmZoiWtPeCZtwrqCJfSJj0fWpkt/+NS5xuqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lCqLntaP; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lCqLntaP"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-29fa10274e5so251332a91.3
        for <linux-staging@lists.linux.dev>; Wed, 03 Apr 2024 17:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712189869; x=1712794669; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NEhL3R0CV+V3IuuciSTia1iTNDXKvNOyBjkJ1bb1xuA=;
        b=lCqLntaPAUWdpubHr545Xoci+X6SsrzK9etjbbosLiAUrEqyvhGsTRo/Svu5/MQqXk
         xdU8w14AlZNfWdYnjEwHupSDvmPp7rL+xZCZBTqvFU2TkhAxnLBKOZKNvzElSxE3F+uq
         THiooWJpUZY/2D+X8Bw4c4W2Y7Ub2SMtoTHfRcsEJROQlNwMaJ28eVbhyv5RvE2HMIfC
         XV/kVqYwUAkVlQ7q3qKqXQdfouIzkWpaYK0VgzXUZKEETgRVuBqdBkMUn4oDDEIvWs2O
         1Ek9Mk0aO77+TaOzWOe4UmFsCbwTeFBwGyQr5fmzKrdKEWiTMWppCz45e62tHHoVD9NA
         kimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712189869; x=1712794669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEhL3R0CV+V3IuuciSTia1iTNDXKvNOyBjkJ1bb1xuA=;
        b=YEAZSWBP/xhVWpLLGQ6qG8b5BMZpTJWfZtS9UlOfRKPAxfyTHJU19IYQrdGmJtvWFR
         5j7UaZY+Ni4V+a4UmhaKIp7CIKJ8FZWLd0LpV8EuY2LfqX76kbjFo/LM+1KDYW8ERFXN
         X98U6qczic0+Gdmmr0v0lheGrcC4B+zjaeuEz6gbB8/9kGBN4ZU1g944Xt0zJExlNw6Q
         ajQSyD9+OGbzOtJsX5ChO93DzBgubxrmBv7axSQv6M2YG3j/U1luKXYw67IChpBfJqU/
         idOpj8EAqoJCKXSnyKKPisP2/zLwCpNUZb34VwaKbXKstvx8QzpGM5b5YDLX//VQH2En
         9jzg==
X-Forwarded-Encrypted: i=1; AJvYcCUnAqw+CfnXxIAlGOJHqARYeZpQc5RSUT+ytgESEX65uOTUXxxiEeKZeima/bm1fxfxDSxIcIjn7+/b4rBS+jguFfyGfoSs2IAzM6TbeQ==
X-Gm-Message-State: AOJu0Yy6WVg8yHR600tMVtNf1EyTzJCgUd1HSfcXLXJqx/MtwMZkaMZg
	Bn/cCCpZZE+9UNHKOpX75las8ctPJvwWqLOV94MbEdblp2ADYXxE
X-Google-Smtp-Source: AGHT+IFvRGBLmr18Nxk1BlgrtjmU4Hpm+bSbf901S7+dDxgwigEa/yJT6NNfNLt7go4I4DJzMOm6Rw==
X-Received: by 2002:a17:90a:c587:b0:2a2:775:9830 with SMTP id l7-20020a17090ac58700b002a207759830mr1144439pjt.11.1712189869444;
        Wed, 03 Apr 2024 17:17:49 -0700 (PDT)
Received: from jc-ubuntu-dev-korn-1 (c-98-210-1-68.hsd1.ca.comcast.net. [98.210.1.68])
        by smtp.gmail.com with ESMTPSA id q94-20020a17090a17e700b0029facfb3f25sm338726pja.45.2024.04.03.17.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 17:17:49 -0700 (PDT)
From: Jackson Chui <jacksonchui.qwerty@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jackson Chui <jacksonchui.qwerty@gmail.com>
Subject: [PATCH] staging: greybus: Clear up precedence for gcam logging macros
Date: Wed,  3 Apr 2024 17:16:28 -0700
Message-Id: <20240404001627.94858-1-jacksonchui.qwerty@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch:

CHECK: Macro argument 'gcam' may be better as '(gcam)' to avoid
precedence issues

Disambiguates '&' (address-of) operator and '->' operator precedence,
accounting for how '(gcam)->bundle->dev' is a 'struct device' and not a
'struct device*', which is required by the dev_{dbg,info,err} driver
model diagnostic macros. Issue found by checkpatch.

Signed-off-by: Jackson Chui <jacksonchui.qwerty@gmail.com>
---
 drivers/staging/greybus/camera.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index a8173aa3a995..d82a2d2abdca 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
@@ -180,9 +180,9 @@ static const struct gb_camera_fmt_info *gb_camera_get_format_info(u16 gb_fmt)
 
 #define GB_CAMERA_MAX_SETTINGS_SIZE	8192
 
-#define gcam_dbg(gcam, format...)	dev_dbg(&gcam->bundle->dev, format)
-#define gcam_info(gcam, format...)	dev_info(&gcam->bundle->dev, format)
-#define gcam_err(gcam, format...)	dev_err(&gcam->bundle->dev, format)
+#define gcam_dbg(gcam, format...)	dev_dbg(&((gcam)->bundle->dev), format)
+#define gcam_info(gcam, format...)	dev_info(&((gcam)->bundle->dev), format)
+#define gcam_err(gcam, format...)	dev_err(&((gcam)->bundle->dev), format)
 
 static int gb_camera_operation_sync_flags(struct gb_connection *connection,
 					  int type, unsigned int flags,
-- 
2.34.1


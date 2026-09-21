Received: from mail-ej2-f7.google.com (mail-ej2-f7.google.com [74.125.228.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E43496D24
	for <linux-staging@lists.linux.dev>; Mon, 21 Sep 2026 12:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993763; cv=none; b=butfpGDxsTm+ROQO5qLjLIcISOMa0FJ7ZnH6zOO3DSJEWR5m9mb7WVnyW16oF7oIEg2nnzc6x7EbLVbhsseSH5yD0elvbJS1NLOGv5dRnqQu0ul6YDkd9Jz8KijndehobQVkfN60z63TgVemLflt7BOpF4cKSTdGqVfFrbZk63s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993763; c=relaxed/simple;
	bh=6M9FazVj+DbUfCbuCmYOiI1XUvXHH6T+s1r+rcmuMfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aqjjKDwkj9JSz2PsoaOE3Kr7TmxQ1r2ciOcd6BVJLksITSt9rLx8Q5GqdoNg0NZiqh8Yw+90jTwINRPKTYUMTtS/P/ny7+I6EJiK2XXiNdNftvg/MBdY4kJge9nkNXZXSBgC7hNOpywq4nFOhHdmW0NkiWEXT3fn41Y/cW0BKd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dhsx0UWN; arc=none smtp.client-ip=74.125.228.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dhsx0UWN"
Received: by mail-ej2-f7.google.com with SMTP id a640c23a62f3a-c29390fa872so193092966b.1
        for <linux-staging@lists.linux.dev>; Mon, 21 Sep 2026 05:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789993758; x=1790598558; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vnd9DS7i3eXzdfiPj8lMjSd3o44xvRHY05JJYgfAitM=;
        b=Dhsx0UWN9V6aSdmf2/DqnXP+rEU5t9bForMSwMo2IzkZUqupkT1bZBcWTW+MCC8xA0
         hSodF3tKcALX3oM9rJ8KZH6KODCnzA+dCPAP/wJuMXkTqDd6Yax9iNPYWXCCRff9AcGE
         R87xJOfNoBQRiu1I+O2k7yuWHIwmgc2JkPPgeYy36n83iOvNoSeHm5qxA+me5b0cm6aT
         ufYlTExM7QB1kOPEpTHg/xtOeckm++F3VPi8fehDjx0UlHcoJtTd06+uLXax7YfORuxB
         MQ4xFo5fus5C7WUVWjD4L7spy8RwmIBsWEYORc81bSiFvhBp4gbP7K5FjYcF7OeyqX8Z
         /P3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993758; x=1790598558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vnd9DS7i3eXzdfiPj8lMjSd3o44xvRHY05JJYgfAitM=;
        b=k97PsmBBnoSS50i3TZObU0M32+VqRSIFLy/qjVCKCyaS9WcL0rz3u/ZO5FOwzXE2py
         ObqswJQsAIFDT5sdxra8N8MAUUdgGiDH1BVBYDL6aIPrYg4TwNJql6PrJgYx7ZMZFPqA
         ibBW77vGYgrUoE3TzS34XGye85ILd79cNWhGMpM9Vm5IW5RKoqY5gRUD9PGnnAh93Hnk
         15nB+4KpU+Sd9YzZTgOTR9+rxML8hCgvzrUQee6dRPL3z4tp3lK+8yCbqg52LVfCtSYr
         CX3NmZvxf3osUGt/6vWaSmTlrnyHBZwaR2I5hWyygi1qU2Vy7/LmCJlXa5LUJ5W/rTLM
         mWSA==
X-Forwarded-Encrypted: i=1; AKwUvByWtp3q8Ns2JhKAZhXmtmSBg2LOaNCzpN780WmLWG/zcUq9dKnUF6su7EbdUOLvGDeA5GKgOlHAGIBb3qrm@lists.linux.dev
X-Gm-Message-State: AFuF++kof6YTfazRpmBoqbIMgBCJh88+IYerqG0V2rAo/qgb5zRxA7E+
	uOW/BjiJ1XaDLhN6vbHtzCqIohqmeqclnY9ovKUKkrI25tq9cpaJDb81
X-Gm-Gg: AYBFou1i57C+3RtJ8khAbsFQtrlAn0rHOHxGEBoHkpJNA3JyyPLGGsHflpx5JK+So7T
	OPkWErGzdFh7xm5Vuh8EQJBVpaMRA577LjAoW5Q/chkVy258/wZElRwmVtayZrrW/2zJSHRd1c2
	smCA31BBD6bZQ0w2cOFVGYIgNpUiBD3TbzVJa6iAenZBLy4vkEHJY/9voS4F4e5910EfwEozy/q
	LvWcgJrMM9DmnhCr2uvhbkXU83MEEp1UnwCGQQyhuLwsKgsWhwQ6zCwQevuvMn1vym/MjA40HLp
	xzqzjKc3GKbRgYUV4jC+fD8L/U/sSdPBlcouIJ4Ge3UjFcvANgC4OeN+iEdLHpc0VWWfgN22Xaf
	ce20qPMjmOQCuH4zCzLn5VzycaaVQm4byuYUOB17ciW2idkP3DV1yWfqHXL1cPyieRARsdxieL3
	km/w3ExsiQFIh8jQqzoNtSj6xrGlqOVriVRV0wxt2cfrDUW1T1c9a2k6edHXFKBpVO+SPsG4k6e
	qRkH+4vpMYd2LTS
X-Received: by 2002:a17:907:3f9c:b0:c29:3711:626f with SMTP id a640c23a62f3a-c2a15aeb6damr863923666b.24.1789993758165;
        Mon, 21 Sep 2026 05:29:18 -0700 (PDT)
Received: from gbox.chicasongroup.com ([197.210.105.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a358d32b9sm298863066b.56.2026.09.21.05.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:29:17 -0700 (PDT)
From: UgwuRhema <hikarialiyev@gmail.com>
To: johan@kernel.org
Cc: UgwuRhema <hikarialiyev@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: gpio: add comment describing irq_lock mutex
Date: Mon, 21 Sep 2026 12:28:43 +0000
Message-ID: <20260921122844.42816-1-hikarialiyev@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a description comment for irq_lock to clarify what the mutex
protects and satisfy checkpatch checks.

Signed-off-by: UgwuRhema <hikarialiyev@gmail.com>
---
 drivers/staging/greybus/gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
index 12185f7a9..7f19b3275 100644
--- a/drivers/staging/greybus/gpio.c
+++ b/drivers/staging/greybus/gpio.c
@@ -39,7 +39,7 @@ struct gb_gpio_controller {
 
 	struct gpio_chip	chip;
 	struct irq_chip		irqc;
-	struct mutex		irq_lock;
+	struct mutex		irq_lock; /* protects IRQ configuration and hardware state */
 };
 
 static struct gpio_chip *irq_data_to_gpio_chip(struct irq_data *d)
-- 
2.55.0


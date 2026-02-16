Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444082D29AA
	for <linux-staging@lists.linux.dev>; Mon, 16 Feb 2026 05:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771221279; cv=none; b=Pt0E37P2MqDOfslJTbAeP9IK0qXlKeT5C5uYwt/KdZbdPH4t7Y2mWaLSO2hR047Hk7Cbc7Q1ULv4kwL24wSxD0PG3tuZ+Uu2Kcy8LT8chc7HoMl6j72MtF8NWvQntEJhuG15HoVEbA4wqH/DzEZHTz6bsuDJKrU6Qg0nO5Df/Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771221279; c=relaxed/simple;
	bh=GhrmOn41U3WUl7uPLfTFCt4UxQ9C9aniy7+tP1H3kfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nnqY1dSyjtYiNggYl7SquU5o2qxodnuzaL2T2jycTkyQKyYaUb+XUnd3OqxFmOyOFHUCtlydFOtsjs6dKQ0NzwUgx/rOWFuGIU/znLZ+1JD2Co0GmBYrbST83l2zIzJ06GIsK7Jqx/fQR981asFCfKwKiR66fc5n2GpyZZQLNuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aeq64s/h; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aeq64s/h"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-483708b697cso2676595e9.3
        for <linux-staging@lists.linux.dev>; Sun, 15 Feb 2026 21:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771221277; x=1771826077; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+JRRMnLMntXZ9UIdMEhQ04MdCYJ0YiQvcx8U51Wiv1g=;
        b=aeq64s/hxGPN+67E8B3R2reAWLmjdJ+25DLsvb+ldCFqN8hxg61V31StXYSFf6Vzzr
         Yc3HvlSeVm0PHtvlm6upQwlemrbKAifG5n/Roxi7JqoT3YGJP8E3SSVUvvoWpam1gAt0
         w+EvN9fuJdleqzUGSkfEm0sPpC+CL3mnFVr7Jt7nmb0/YaT+V7djfwOjp6ESxc4GPQ4I
         P+lgjYVXRBhzQ19Vvg/bUOmMYmwQTS4UZtpo4iuG/ZBD9I5G5xmc0hp0yuNfInkU2Nkv
         BdpG+hn2HIcemn1CD5jBroDp8K/Dt4eBv2Vuj8qj9Y5uQu5D2Ady78fF/Q+7YAMm1hnJ
         iTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771221277; x=1771826077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JRRMnLMntXZ9UIdMEhQ04MdCYJ0YiQvcx8U51Wiv1g=;
        b=KWhh5k47i9rjdc3BViwuRm61Ku4BSSwkN7yA+c8Dor+0a8yZ0vGW5Eie1kVir9wJqB
         HogXuBAMIEEccscv5FZBUdmLuQ6HeJ5lsXjCAZolYKLiUdGpW7sbrKXLTbkmymxh+jeI
         BgHUni0zDb4RQMalOl3Q8h1LG+6c8OGxzMXknpXcYXmgRl0mx8ob1Q7ArtB+TZ9DbLwV
         gBuguB0b/X3AgB0lDFB12R93jnq1zDob+OsNroDiJIRMRTEZIjPL8Ez1xnOLm27+iHyC
         NZ9aRjoBjhQV5yPoMEhf4rnxlVCgpJ2WXhZp0jgmPDAFHNy2+JlR8+ldVA1996DAjEuU
         Uaag==
X-Forwarded-Encrypted: i=1; AJvYcCValu9uKIttDPa2juaWitAp8/iVlN0TI9PLKbdrj3Ounkl/28MWbkhOyeBMHcwm3hKxLktkz1aaTdAhuQC/@lists.linux.dev
X-Gm-Message-State: AOJu0YyJ/x8sSX2zr3hDoKvz6T1QvAGLOYAkUywYfu0NduSlg0N2dNBp
	inUwqyobrmJEAeuDliObGABZ43S2fDL0H8KxFd2SiaYMXYthvlf7hmp3Cj4EyHKn
X-Gm-Gg: AZuq6aK0QrMqEC7w1E/TBVLxwgVjyQxGg0TsNaWqBeZe/vPmEk0KdkerPuvjIj1HCht
	H7tpyb7GwnvPcUAUJHc89uTBgfuFuu4ZVW+C1Pv0FExv2WghA8g1a7348ATTd5WY8Hz+Hvd51ng
	9h1JbKjqBojEoKWHmPDXX3BtV1B4afIANjrgGzvem3D3WoCY15DDB7lbJsOVrfUJQy/GWCR2Lh0
	mwe8HiTd9rFAivcqGp9mUEkofs+T7kpjT4Xe+/IA0T/7uCRqA+wERac1K4KFBXdbCA+dG6fQoYz
	N0nP8/+iVx/+wrSWB2MDKdfhUmvS6iDCvYHFsq4nBm67cZJnQgCOP7wiHfNA+8mfBivXTJ8wyBj
	DwG6h63aOv2U5MlE/NeQ1Lv3ScRus9LewGfNOmz6e8bbBfp/UvDP3qk5fSBFlTgtgbnwmQpPCEZ
	+9X5WBmUIKnkEO+o+z5FmFG7omYKqI376jkmutE9AvafnNRaYB5RbimYGMU4x6GqgHk/cz722wd
	xTKcNLZE+Jsdl5O3xMLOeXrGMtYI3XihOVRYVzK2KWyWih4zQXf
X-Received: by 2002:a05:600c:4448:b0:47b:d992:601e with SMTP id 5b1f17b1804b1-48370e2b6bemr114399415e9.2.1771221276428;
        Sun, 15 Feb 2026 21:54:36 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d834ebesm436290115e9.13.2026.02.15.21.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 21:54:36 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: johan@kernel.org,
	elder@kernel.org,
	linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH] staging: greybus: sdio: Fix typo in comment
Date: Mon, 16 Feb 2026 09:53:45 +0400
Message-ID: <20260216055344.17033-2-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a grammatical typo in a comment: change "is" to "if".
The sentence should read "check if a stop transmission is pending".

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 drivers/staging/greybus/sdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/sdio.c b/drivers/staging/greybus/sdio.c
index 12c36a5e1d8c..a570dc06b380 100644
--- a/drivers/staging/greybus/sdio.c
+++ b/drivers/staging/greybus/sdio.c
@@ -372,7 +372,7 @@ static int gb_sdio_transfer(struct gb_sdio_host *host, struct mmc_data *data)
 	left = data->blksz * data->blocks;
 
 	while (left) {
-		/* check is a stop transmission is pending */
+		/* check if a stop transmission is pending */
 		spin_lock(&host->xfer);
 		if (host->xfer_stop) {
 			host->xfer_stop = false;
-- 
2.52.0


Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B264213249F
	for <linux-staging@lists.linux.dev>; Fri, 29 Mar 2024 17:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711732265; cv=none; b=gbRQDdzP2wvsqEIgzC1py6Lio7cMOleBJegt1k0yQG+qirCG3YdGJ/wyglMfOxEKdUwk0fYqa4rX+XWaLmkWjZQG48otFea8xTTf0x0csLVPR2yOQ6damdSsBSpkahqzqgtCgIFy8hiJBliowpJPGcbXQEBIhP+fnE0lhHm/hhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711732265; c=relaxed/simple;
	bh=iVuldd3zGuXruFJTlBanSQRHUsm+LTMasUSVVj1m7E8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QPzhwn9LE0/q0SznkRKlDeOv2BtX5hg4/lMmSwxCWvfshKcZFEDqGCLxD1NuN+JCzQpqV3v4WpNl29rk04B4pi7QWvOHBU8L9q/hSUTROMJ0BmSzh2apPritChpxlcluoIRhZbDsgzm3EY1WuWMfhMZzFQhuXUzSP8xmNUfAsJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uW9t0KvF; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uW9t0KvF"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33eee0258abso1234013f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 29 Mar 2024 10:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711732262; x=1712337062; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JxYuhYq68BUhDKF2jZeLoM0cvM8ATn+yZuvCJEa55cQ=;
        b=uW9t0KvF7lK9GUyOTA2W4UGK1nP+VuJ5M3RJiAtTygvOrXAA7MTV/hIXN8Zf+KG1jw
         bczTaEnQmsitMzI6vDi+vdRtT2UbG12aKk3c4+F7cjGE0Ne7F+UDQ7JQdRgcwMntdovW
         SRb3Ds+c5/74sbebo//hP7up8uNxKQOdmHErO66Otg3CIhBxZUOuSmThzom3VqJBNt1i
         DrDZNmzMHF32lOlL1dHn8KYTBjLVO7yJBC4wShC6bNBUv3YakSawc4ElHODwydaT6iw7
         ebN5glcV/PlgP2q8MduwVXzMF73vzphncMLxZvo5Ijmy4psOXxEoKNrooXqSvb8riJjX
         henA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711732262; x=1712337062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JxYuhYq68BUhDKF2jZeLoM0cvM8ATn+yZuvCJEa55cQ=;
        b=J6NpN1W9iIapodR5Gm8a+95E9eHTBZ3Y/OevGVVNoHpYC1N6G42LWB0WPiUxcyhyyu
         vmBXMsoaC8DYlwnTQo7Ig8sMYoVI8G66CcJE55GhkahexeagSb7sVRp94yM0fR5vKjUF
         JPFpzyjisBeHpsKW95PPezHMf/hmNMZlyj9ffFfDm2w2fqkFpbVtfsw9Mgt66PhwSq/7
         YOX5/IF4IsfETKBY4gf+HecU+CL4ot8FRMyVOP6Vj9gWsLf4CqI9wt+ISSy159/hhGyv
         /eHrE+skL/yERWUzIKy09nrqg6fJLlcL9LtyR6AQUujh9qcQLedwR0+0odA46USju1SZ
         1pKA==
X-Forwarded-Encrypted: i=1; AJvYcCVn6tvJ0tpI1mUns4MzPOY3zb6jyEJcusWRGsQqeacQnU90blGGzwIam0PVKu4dmTWh/fik6xMCrDg9lSzvDsuKJWMF53n8AJn7zBrmAw==
X-Gm-Message-State: AOJu0YwPt4Wbmw/SZfKcn9PNZ3lFA/UniDos3xR6ZZMqK83U7II0nWgb
	d8MCHdAGCLPHdilK9soWXVzYjgC45ti5HTxmQRS3tT5w0cWM8HP/3+8wdPZOnXE=
X-Google-Smtp-Source: AGHT+IEql1KWL7gbjAJiEVRC+a0bTlmY+nDECzR4kdrCYHwhtXISgDRBSpeCfAYP3beUvld2/mnGzg==
X-Received: by 2002:adf:f142:0:b0:341:7656:d358 with SMTP id y2-20020adff142000000b003417656d358mr1907415wro.38.1711732262206;
        Fri, 29 Mar 2024 10:11:02 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id l2-20020a5d4bc2000000b0033e7e9c8657sm4592161wrt.45.2024.03.29.10.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 10:11:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] staging: ks7010: replace open-coded module_sdio_driver()
Date: Fri, 29 Mar 2024 18:10:57 +0100
Message-Id: <20240329171057.63941-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use module_sdio_driver() instead of open-coding it.  No functional
difference.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/staging/ks7010/ks7010_sdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
index f1d44e4955fc..8df0e77b57f6 100644
--- a/drivers/staging/ks7010/ks7010_sdio.c
+++ b/drivers/staging/ks7010/ks7010_sdio.c
@@ -1136,7 +1136,7 @@ static struct sdio_driver ks7010_sdio_driver = {
 	.remove = ks7010_sdio_remove,
 };
 
-module_driver(ks7010_sdio_driver, sdio_register_driver, sdio_unregister_driver);
+module_sdio_driver(ks7010_sdio_driver);
 MODULE_AUTHOR("Sang Engineering, Qi-Hardware, KeyStream");
 MODULE_DESCRIPTION("Driver for KeyStream KS7010 based SDIO cards");
 MODULE_LICENSE("GPL v2");
-- 
2.34.1


Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBE213BC0E
	for <linux-staging@lists.linux.dev>; Sun, 15 Sep 2024 06:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726382471; cv=none; b=GyHgUupmsVeqy7s8rcY84Ogjwqs7d3HKf0r08tXcypL1eNZirzCYpN8Za/Z8Ll8o3uXCBjY2vd3TYOFcvbAxOcDi24mIMEPFPmPK5kYllAvx/No33D4hlutnoGlU9gW2zXS88r/9iAXbS2qTVU8qnPM/cttQDvfyvi9Igf5gBCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726382471; c=relaxed/simple;
	bh=WoL/PTd1sRmgeYcsxwtLPZRRotqfs0ky1+jf+8qcOes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OHHm+VIrO/c5I3+M/7WMCfjhuemz1FCvXVzAHjAAF+ThE9PyQC2JzAVkv4K1MNB9+sIO2Lc+XpE5/ka6d54IyWJlqcDRe+u5QyASrLRi1cgxWrdo3Fyv8cBMZhgd+Fug8IUsqKKjF8cWV8Uz9GwdWh/JFCxdXhq9N9ZXIdsLoL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IrzDht2P; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IrzDht2P"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a8d43657255so317477066b.0
        for <linux-staging@lists.linux.dev>; Sat, 14 Sep 2024 23:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726382468; x=1726987268; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQBeiDljOfj9wIe8fH/XKSTxxaoSaepwKmK4x/egpJI=;
        b=IrzDht2P60vnusvHEpqOizTkvbs8yYNbqtFCHKBVsK34eu90Qd1GxhDNDl7uqmaD2J
         TaUKpO+Q4ticI+Ym3YOBiAWNSt2/Ek4NDYqQfD92LxbXRf5XPHDuZEiMfEFr1zuPUZiE
         jWSc8EYYRNPQaVw2cYr38Xmi3ef2c6L7FQPiA0sE23+2mZ9pa/zoDnNeSTLlvvhi7PFc
         +8qcvVu65gkXaCwNGQz9fcWRwONk9+aOxlA6H2KCubojhjjys5GXIv1R6dTc6SaDSbAK
         DedZz1AuNOIYgfBxPssj8Np05dtlH5UY05G/Po+DiGFFRHyzPNzvg5DoUtMdpyIxrUDR
         PMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726382468; x=1726987268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uQBeiDljOfj9wIe8fH/XKSTxxaoSaepwKmK4x/egpJI=;
        b=ZbF08h0tbbM3X9l/Nsd5E+O2+9pVGQviVskDoNkJy0Ca6gclq3ReANm8Eon4m8ilx0
         zNXULOm5Eta7vg4tWACYIl7p1Lgb2pa+HAHR1NvdHktcx5yvokawUDd57AxeELOgDGdn
         PTzz4P4HPsg/b+Zza9eXR4wVN4VmpZ+z1IH1rLC9lZNjW5Z+kPMGGs/BVpGuFck6tJn4
         wSEuJxwN0RB/aiQnkPlPYCo2Fll5dxdrE5yT31fTsXOLNx5HwFXFD41ZwpdwCaaOMbtb
         jflgE12vtZaeI/u8QWljCQ7+HepFB7c0ZeV3QnkOGdiAF6c/KoXwBW1rAFaAlROeDZ+B
         M1PQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpZwqL5ho1gV76PdGDVBZTwTmHk9gcI7NEKK+Z1URSVLhL1lmRXhN09iITjElt3pFrxfE/4Fkrjy4JN8+u@lists.linux.dev
X-Gm-Message-State: AOJu0YwPi5VRz7NnhpNX3ACyBTzW9rfMZwoq04j8CFRD5m6ZBaA0Gnto
	7k7yVFckJbB8PFu/ES11tSnz4SuIt+Tw6iqUlMIrbsb7FiNckVQL
X-Google-Smtp-Source: AGHT+IHEW0BPRmyOtAGPFQJLkfiSx58u2eQXPrBHSTGxIdINUbHXVmZv+gSeir/SJ9RNNwmb9aTl6A==
X-Received: by 2002:a17:907:3d8e:b0:a86:ac05:2112 with SMTP id a640c23a62f3a-a9048041b67mr801205866b.51.1726382468200;
        Sat, 14 Sep 2024 23:41:08 -0700 (PDT)
Received: from kernel-710.speedport.ip (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610967bbsm160201066b.8.2024.09.14.23.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 23:41:07 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 17/17] staging: rtl8723bs: Remove unused enum with first entry IFACE_PORT0
Date: Sun, 15 Sep 2024 08:38:31 +0200
Message-ID: <ff820d921ba3e3cd777d76213f39d8a1ad93f7f9.1726339782.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1726339782.git.philipp.g.hortmann@gmail.com>
References: <cover.1726339782.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused enum with first entry IFACE_PORT0.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/include/drv_types.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 57cbe2876838..7b0e824e05a9 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -318,12 +318,6 @@ static inline struct device *dvobj_to_dev(struct dvobj_priv *dvobj)
 	return &dvobj->intf_data.func->dev;
 }
 
-enum {
-	IFACE_PORT0, /* mapping to port0 for C/D series chips */
-	IFACE_PORT1, /* mapping to port1 for C/D series chip */
-	MAX_IFACE_PORT,
-};
-
 enum {
 	DRIVER_NORMAL = 0,
 	DRIVER_DISAPPEAR = 1,
-- 
2.43.0


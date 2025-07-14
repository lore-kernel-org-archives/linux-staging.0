Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F92A24A044
	for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 14:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752503269; cv=none; b=Sgs5TAcslze0uqMWp/g8gYwMVG0Cop5F0DM/7d36fjDsysm1jFC1ilukt7c4gMxSXakkCXfTOFx9qfKISVdjO73mpFz5tboeKXyGYtZ8FbzvR1oY7l32Ssf/6mg5jzOiHf9vSDq7kexZoALNszmbPyJwCUgxV3q4/Pm8kRMHXWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752503269; c=relaxed/simple;
	bh=eROD8KsMAjiCsZj+peKBcTcIjpOrv+DsbDLjV910f5A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kNcPK3nn18UajnwtwjwWeWFPx8FQR8NyUynIy69BqMQnbdkk6Q/DKp3/YxEA0DjETECO2oOiyjNTWZW91OcqnFsh5Axup0kJIDS+cFA1GS+fZFmaErnsDmEJfvIFpN9Ci9mgd9UQW+UBwXFGWzlQ6Dugh+8HqlUTcCe6mnSjXiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VapsbDxv; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VapsbDxv"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-714078015edso39456637b3.2
        for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 07:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752503267; x=1753108067; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NZ4i2QhyUjJCdRWaTj6VHcTAkDZaF8Fq1MoG4qKDJRc=;
        b=VapsbDxvIWFz4YynEjehc4r20tXgVi/vuqYTmpqvobDJ95HOC1nqW4Bpw8iOpMkpfB
         Pk6gSOr0HE3tMQxjR4HYGA/oSKii3QQGupGueaSg6bMVpzBAwXfoWxBWMtssCst9saLm
         ZBrIwEqmW+uAr2VNDXAkU/t58nKtMUwDEzSA0Gq2NPCHV0opAzr5oBsjKOPFy5DEjgqW
         /lzVjXIT1Mq1WGpXsbzOcvmaEWYnfDfIkpKf0D1g7uGRYEtd8S3bMFFxpTdMfg/LEGUz
         jDpiNVrsxBw/knlSxs10uyZP/ucYZuvVF5HHTQbrU6zSdUgxZWn4cKAZz0lVtZ+R4yu0
         ja8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752503267; x=1753108067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZ4i2QhyUjJCdRWaTj6VHcTAkDZaF8Fq1MoG4qKDJRc=;
        b=vRXwJSIjzgeProsXdT5a4tJ6f24f7qbKpvN20lzKnsnJL0g/jpvBTdi6v8O9mcepwV
         a/Al9WK45k+4Fq746iyGmN710anLcuzyv+VCmGteZZSyrV+J+b/wXorBH9vmlgvVGazI
         TannXLu1jt/rEOj7QBPLGcvFYJuSrvARqSDp9+pxVc8exz+WUemaczBLQhVif5iiNIEY
         E4/OssKre/g8iHLH3Pz0XWlIs3I+3fi2ogDkAuyMTVpX4N2kejwZSxY6IMdks3d06MzG
         JsOsC04lbZM+H87D+cN8HymwBmIUygnFdHV0uG5zA0WVVO6GM2rfd3D5Cs1dfU7wq4QU
         89TA==
X-Forwarded-Encrypted: i=1; AJvYcCUkdidcPpAp6RbCQegXfR62nMvq/FOJd1ZDdAgPdyzYI8bOz/29OvXiCtTtutyfc2wBzeXUaYmMxu9tNCwN@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2Fj7Hgj4gl5rTJPOtQzeU9IkD1NDWGwJ65XKZASSG0YxUiwzw
	U7BkdNAyk4jT5ZngVeAP2x2cRK3154DMWTl4wZgSxDClI/2i3pqvkSqE
X-Gm-Gg: ASbGncudhmKjlr6YGTUFfqOoU2kSJD5ZManf/vCW001ayPo8QCrn3AttfmKfX2jlR1A
	sM3zyIdcNfA7JdD4qE00L5MvBGMY2+bzRHKmGY+F8puFIOBGH8V/sKC6eGCnnAZ8XAijtee4+5a
	1jkhXqbqX/8ATkOrkhTYzoy32D0IK4wAE4I5WIOWyNa/onuMFej71lxV41M54+QekVbeMR1y8j3
	O24+/rB55t2M6i+Kc52d5hE6zdKUOPpj9qpSE4hCJrMhPgzECK9mFiBvkUSnpE/GpW7rL29YJhz
	T4++fbAKrjpzwdomC79qy2ygQ3RdZaK7b5t2u5phlFsK+qxUxkcqBXeh8WHhTit/JYoDz00lehk
	hdwMAMKh3VufN20FIemg7T3408KqEf66vjXU23b9SdPp+sg==
X-Google-Smtp-Source: AGHT+IFk0Te0RtNbe5N1idQ48Qj3Nr77oph+AIUdsQ4GoiZojewVBZI+1fIRjgW1gcYPi/qlrRAffw==
X-Received: by 2002:a05:690c:2505:b0:710:f55f:7922 with SMTP id 00721157ae682-717d7a65c42mr212019617b3.34.1752503267247;
        Mon, 14 Jul 2025 07:27:47 -0700 (PDT)
Received: from sshe480.ammonoidea.ammonit.de ([2a00:5881:3041:2700:c83f:4374:166:4a71])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-717c61b64e3sm19669277b3.56.2025.07.14.07.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 07:27:46 -0700 (PDT)
From: sina hosseinizad <sina.hz@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	sina hosseinizad <sina.hz@gmail.com>
Subject: [PATCH] media: staging: atomisp: stylefix
Date: Mon, 14 Jul 2025 16:26:45 +0200
Message-Id: <20250714142645.88038-1-sina.hz@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

change the spaces at the beginning of the line to tabs

Signed-off-by: sina hosseinizad <sina.hz@gmail.com>
---
My first contribution to the linux kernel, so starting out with a stylefix
---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index bc97fa2c374c..bd3a017490ef 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -2347,7 +2347,7 @@ int atomisp_css_video_configure_output(struct atomisp_sub_device *asd,
 }
 
 int atomisp_css_video_configure_viewfinder(
-    struct atomisp_sub_device *asd,
+	struct atomisp_sub_device *asd,
     unsigned int width, unsigned int height,
     unsigned int min_width,
     enum ia_css_frame_format format)
-- 
2.39.5


Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5CE34D923
	for <linux-staging@lists.linux.dev>; Sat,  7 Mar 2026 11:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883635; cv=none; b=HAGw3TFCg+tHuxFlAiKWCTNFnXtVGsa9MS8qdGf8TGvq/wbwIcYVSatP3s+GJVZDQOh9Z+Idt5+xb6YxxaNOU76UUPTZEuSv36MAuWREOqmth82JD4XrlRCETXVIT5MHT2QGWcDVlpxEipnSckK5/mPndcIo65ijBZWqSDifnII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883635; c=relaxed/simple;
	bh=oP5WUTpvxyX26pkLHEGcAdu8EeQZAzjN9JLIOOy+WBA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nGpZTsEZ7GIfdLHyRIABJdVFFMX/Q4VuyvkHqIyFENNEAdZ/DISZ/xuc343aLb+4DLeKNv7EElj8cNCGKIlVjsQCuuTIIULWYdwmW5Fjsjo6j06+O92ZP1cfUAnEcXAYTUuRjS01EI2fxAj5L1CoOp6u8sbAisbBw7jjNEKVSj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g8valxuQ; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8valxuQ"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439b94f879aso404480f8f.2
        for <linux-staging@lists.linux.dev>; Sat, 07 Mar 2026 03:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772883632; x=1773488432; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V+aRpeNbmemOAr39VqgQTIDMzJZuCkEyaB99ZGHYYww=;
        b=g8valxuQWMDuUsEgfKe+1YAe7EScFpj43dVPnFAGwzZoi4wvo3qa4jksIbdC1qEZBN
         SCXLgh/Mijp4jGkNZ7BQKjCwiHc9zF5Fcl7PqlRVNTEJVeP/+YpHpaLPtQoC/xrGwANK
         4JmKQwlV3A54/Q9dOzhYss5c7SHJU498UVz5qQTkbgSG4e4HU3uS/mQtwF9ouU9bwFLH
         t0CsGsY6hyMVxFvJFSBYo+mdUIHNCwD38aytwWjZJauxek4b33VJFbGELamxOBRfwLBl
         tlIsV3ql4MHRd5k+kYpTksAgBgGgvLqoaVfLhSryiTy8jEuQDtpQ2NI3hxXSDdCvGvje
         t98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883632; x=1773488432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+aRpeNbmemOAr39VqgQTIDMzJZuCkEyaB99ZGHYYww=;
        b=iGUMp84IxyH3rL1Rgr77e1r3JLjVRlhp28bXHXc/fA3CeaHOHMc2JRrrvymTf2Sx0m
         OVFD16Q0Ztb1EM9X5/dl4fHYwz8IcCP1SWk6Ddih+WpwvpUvqrZSQUw1LpH+9Tmpk+Wl
         1B+pOH+q+tPhb3CBrYG3xrRci992Ze8Vkfuuty2VuKgqjyKJ0NAjP20HEbXQdkcJwSsx
         7lzAlCvxHAFxW/p6AjjoWLqwiGPzDeJZFy4ovYp7MS3vaFuiqREzUotj4XzofEedajd0
         lDtUbv/k34y8VCR2Zh5lg1fT0Ul5ZbaJSN0Ol4wkXZcoiVna7Md6EYxYh3EjPfdQCVdf
         r5Mg==
X-Gm-Message-State: AOJu0YwYhkT6sR27Anel+GQEic0umdK5Fu/5SU6drOcwRYIG9qO3QXyZ
	38Ry6/uaeUraBID4GDrnttC21JIYp2ca8Qcbar6604pjUW6ExdOicF2n
X-Gm-Gg: ATEYQzxzQ8ttxCMV4IoTZPO2Uolr6gtnEYWJEZ8KxsyGS+kEbV4cqBd7QLjKX+Y7N8l
	hJfodeGQ9qpOJ+c+ObLYzZXGLYKytEMci9KlynaqX5z7Zuxp4SRTntXg63Fc49Ml8qFsdXjkoq1
	tBVTkpb9yIv0I5wHeZ4mvJfPO7zjWIPwfS6IZgu+dNzZnetSouKKN5FcuKwAcjh9oM8uUqNDWkm
	zTvXJTDdvXaTP0gE76SVQZRr2O7wf1RPdtWEhSRXi15Q9oq+7QpTbAvCfOe/ZS13QH131GIHSyj
	5Vm+dVPw3SYS8KKOfgjSnaH93UvmxYfqRfLrjPZ+oq78fpgKR9NZpmsxJiGp1SQa2ioJcONyTQN
	QUZArvK4yGzKZdI9cnuNC4QOROm6lXCUmAb6SY7XPp5lz6ITQOn1JrXo1W4gPfnDahBIB5DJdN+
	CWi6xqDLeh5XoWt6gAg3k/wcMnbYtlj2Hb7nwzjBABVeVXphNCD+t/FqbCffR0NKOMdPM1Q/e39
	k9QbywraAAvIKEnLDw3QExQOYmcklFRN0pzgSlDRH+aXetUf20k
X-Received: by 2002:a05:600c:4ecb:b0:480:6612:253 with SMTP id 5b1f17b1804b1-48526958b91mr47020715e9.3.1772883631676;
        Sat, 07 Mar 2026 03:40:31 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485276b7571sm102709605e9.13.2026.03.07.03.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 03:40:31 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH] staging: media: atomisp: circbuf: Fix leading space indentation
Date: Sat,  7 Mar 2026 15:40:00 +0400
Message-ID: <20260307113959.67116-2-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix lines starting with spaces instead of tabs to comply with 
kernel coding style.

No functional change.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 .../staging/media/atomisp/pci/base/circbuf/src/circbuf.c    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
index cb34d0b5abb5..9aa10cb1185d 100644
--- a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
+++ b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
@@ -192,9 +192,9 @@ uint32_t ia_css_circbuf_peek_from_start(ia_css_circbuf_t *cb, int offset)
  * Please refer to "ia_css_circbuf.h" for details.
  */
 bool ia_css_circbuf_increase_size(
-    ia_css_circbuf_t *cb,
-    unsigned int sz_delta,
-    ia_css_circbuf_elem_t *elems)
+	ia_css_circbuf_t *cb,
+	unsigned int sz_delta,
+	ia_css_circbuf_elem_t *elems)
 {
 	u8 curr_size;
 	u8 curr_end;
-- 
2.52.0


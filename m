Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251FF2E8B83
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 21:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775770943; cv=none; b=Q8pt0jnQ9CruO9bcPYKKoKZCYiyePujaIsyfViD3IiB/qIJrzak8X4MY5gTprB8ruQEMuRW8T/eD4oWPyOkUUjBTeECmKHuz697UJV3nlbp4G/wwQQN4o1Cm744MT9x8CqelJ+9eAGHNgo/+yydDLFNejdx9NDYi2uBk2TaOL+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775770943; c=relaxed/simple;
	bh=b07lhGhDVK50WNDJbuRFqLpuGn6W7XK//YTTs0ila64=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H7cwduChp+u2DwqMuH4YCqq33GwY+9BypXya8mbQsVIXrWpECTsd6tTCmzZtkDAxdU7LTVKIZ54wqq8lrHmgs/TiD+iVkBbIOrBXZNTzhlHqf4u1Fd02pUhfXjZuCZ0/CYyOU0MbbJJe0OcNxVQyh+Pnmmfn1rqSyfhQ6tT4Lik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bguPz3FT; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bguPz3FT"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso15262985e9.3
        for <linux-staging@lists.linux.dev>; Thu, 09 Apr 2026 14:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775770939; x=1776375739; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=swSed9MUGsB0gPy7tBfpl1IlkUtjnf0/4lv9+O0gYWg=;
        b=bguPz3FTjzZmtVsVut3gdjYbRuMEaUs3sQQ/qj1uKNVWMsVSDGLYH+R05xIDa3Peb2
         BkeWM0mdBAyRF4dQooi2s0LOyTZf/mtJU/Q8rnPlXyqdCCXov6PIjfPEuVZHShNyAidY
         5QceYYueOLzCeYWazn+rWMotAColDhsrozqLiVghJFY937BW+r0uuovZeCeU2/Xh041l
         vkq/wsZwzPzcoBjLeGszHp42sofuxxHFj4/lYVLuApk7HL3qyMmCR5LUOrvutyr61Q04
         jtXZpZqKqHYmprsy5LJRZojknZ+/aw2i9Mq/eWpIVW2JnxEJh05oM7yBvTid12wqLKx4
         QC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775770939; x=1776375739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=swSed9MUGsB0gPy7tBfpl1IlkUtjnf0/4lv9+O0gYWg=;
        b=imnRr5E11PtQpzZy41LGXgN9PkixNP6j8+0Xq56ZwKgL3aYGDFiCLh5EkbC76P6VSf
         cZ+cQ3Ds86JTJP0OYVxC6wvNaEGIm//uA10TrftGLEuNXbAk63kdarnlsmSGF0ZAggMn
         DVbw2thDVLTWtkZWDWhDnl3bgsolY67LtGy60hD4deyxAy5+Qz4754EVim8g5tkP6GCq
         4WYFl7EolYY+WRPrfz6JZW+0lfJjihW1i4fISIHxEyi9yRiu8MzK4V4waVOQQrHxxBCs
         BEEpFQO+Hs6cnQ6x3vhNWpaPaV5LCwv25RkiDIeRPwBp77dPYyLxoNwmp/GWvmJbGZRQ
         2woA==
X-Forwarded-Encrypted: i=1; AJvYcCWYTjveLyToge47FG0dhs/D6cNNhm0oitKve/qYQx8soJ/bGi4u7Nt8p3lWgb7KltfvyHG96GGp2Gh1TNfQ@lists.linux.dev
X-Gm-Message-State: AOJu0YxYR6Qr5gLrmKfClvfNpnw85wGs03OmYCvNuoJ97s9FhGCssaTA
	yRFSv6wCa1RBx590GUQW77/s5AokPQhLrGUjiEvI6nFjE5R1vRD9fTaU
X-Gm-Gg: AeBDietaoDce4KfI9kIwILWL6e2QkHcpy/wxH7N9uNDF8T9PUbJ9io1FIo6v1G9hVkG
	H2fzIkPeygK/p5VwvDrDqvSytVn6THvHu0Z6K7Yrs+IfT09wdAVi2phAagRlUEPusMb7ozun90C
	ABHORp+WhmOSq2J+9X+2Q6C1QOfhkD2M/hB8HYtCpdseDvfCq60zQiVfK0qsHDR78fIVzmStFdF
	Irh7iTqv38yWzIwEpe8CUWM0H3MBhwKWiEkKzyo5IJYloIIspoekeqSmwQOMoDp6ve4nFya7iAj
	2TCt7xG/cJf+lA+eILCD/DdQqyVcGK7NaT1M4gyK5WWGryte6+n3c2s7DPxLf+iLEMV9Qww3Ek3
	cudXArRmkjMJL9cRr+ndMxTiyZaCVSQRUttPkc+68CMZ0pEcmKanRUcJwjWFrC6afHStKYiupxT
	OzGyMVjxw4OdLSc22GDuPlq1QZFZ0=
X-Received: by 2002:a05:6000:2383:b0:43d:855:f161 with SMTP id ffacd0b85a97d-43d6424c218mr928785f8f.11.1775770939347;
        Thu, 09 Apr 2026 14:42:19 -0700 (PDT)
Received: from DESKTOP-D4E07GJ.localdomain ([94.187.23.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm1745525f8f.33.2026.04.09.14.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:42:18 -0700 (PDT)
From: Mohamed El Harake <mohamedharake2006@gmail.com>
To: hansg@kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mohamad El Harake <mohamedharake2006@gmail.com>
Subject: [PATCH] media: atomisp: avoid ACPI package count underflow in gmin_cfg_get_dsm
Date: Fri, 10 Apr 2026 00:41:58 +0300
Message-ID: <20260409214158.3248-1-mohamedharake2006@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mohamad El Harake <mohamedharake2006@gmail.com>

gmin_cfg_get_dsm() iterates over ACPI _DSM package elements as
key/value pairs using obj->package.count - 1 as the loop bound.

If package.count is 0, the subtraction underflows and may lead
to out-of-bounds access.

Use i + 1 < obj->package.count instead.

Signed-off-by: Mohamad El Harake <mohamedharake2006@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index ba61cc28fac1..cca91c6d71a5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -113,7 +113,7 @@ static char *gmin_cfg_get_dsm(struct acpi_device *adev, const char *key)
 	if (!obj)
 		return NULL;
 
-	for (i = 0; i < obj->package.count - 1; i += 2) {
+	for (i = 0; i + 1 < obj->package.count; i += 2) {
 		key_el = &obj->package.elements[i + 0];
 		val_el = &obj->package.elements[i + 1];
 
-- 
2.43.0


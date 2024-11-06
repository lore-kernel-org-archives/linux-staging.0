Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DB5208231
	for <linux-staging@lists.linux.dev>; Wed,  6 Nov 2024 18:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730918045; cv=none; b=dOqzX/+PkwYdSzsmwQZdK/gven17oYX5jbPMEN7T5I2Pd01QOgl9ZOqaA+znMmZ9KjC8rdeo1OoSw7j6zXuAfVSsYakP4NSU2nsINshI9MKsjeAjBHTgO97qJ1yuVMyn3/QiBW8jKwuHSFiGEX2ZvrRju2BxMrR6EK8owsUJD2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730918045; c=relaxed/simple;
	bh=BRamlqcU9smyKVEO1s9mrweQyRqmIhJQTYicabrXoMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YfV9fHxD7SQfx0ZIwCYWoXNKZEdc+1woGASzxhDQVgUzlS+3c/RtoG8KN7P0t1agj5R8mmKAOnBhZvzbifrSxJdKgkQfomhiSo0BqyHWUttjrMdbj8pnpcq4mZeYzjfhk9iEeGkjJNerRb0/nObKFYKgR+ha4N+S+eYj8qKy394=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKYTvAAC; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKYTvAAC"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4316cce103dso1310235e9.3
        for <linux-staging@lists.linux.dev>; Wed, 06 Nov 2024 10:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730918042; x=1731522842; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyLzRQG7ihdVYjFiiq9DJdAmiKxXolSxLLfYzOn7lDg=;
        b=UKYTvAAChgIczPh3dChi4WmKlRXhzKxEM+NdmuBoQUIkmIeGguWU0l3Z5npDFmbrGA
         AVcz9o6n4FHxde9vd66JvzseAaLuGpnmH1kmqKqQqFd8yQpt/ukQ+SFwArUf95I0fXpK
         wouZmshATWKOkedhIcVsFfFGh+P4GdFcEmfiXEVa9OWy7fKNmUjAthYnevA4jZzm81QZ
         Sw3/n6FZoIPOb2sQxZFLqXOThQXpX2kVOdakInL9aboE6wyI25CqKXRFoeMLxNFHQPUC
         hWhNL4JanKu0HETo6Z8JAzQANbXIMWmVULaIN7MSKpABaZ/LSu0+43hcItcas7KoPaae
         kkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730918042; x=1731522842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyLzRQG7ihdVYjFiiq9DJdAmiKxXolSxLLfYzOn7lDg=;
        b=E6+goQPjdxOCvxpa1HQBSnSFe32RsGPiHkMtGkbC39rx/H3+OEyotXi4sASoWRvGAb
         4lZAlJMbpEjWmy4YmFMCZW3GgoUr+i3EytCMZfhitIA8IeRBcX/peV76eCW7ELMvLG7m
         QYkL3xPmnDORW9Cu05J7tdv8ODSIdEJ/OLFLpP2jpgbWKG2uWXLDxTFf30sedpQ9cCsK
         CCmkY7nCzUS+/ynlHUGi1uaNEUx25XWlPOyFhlZCz2iEmWjVHO5eGF0c0avUw1/Nx/JZ
         Gm9QfoulEA8CZfhLx53HjIAXM7skbGMiqwPEdzk8FkX7gGKxTg/PU3xWTeSoUuEsLlT6
         BFow==
X-Forwarded-Encrypted: i=1; AJvYcCVTLlID0C8oY1iifDsCu92DkTToqxaCUOIzObjhc3f4Ked3sQIZJS0LCVKC0u9m4dv7jPXDsuGQrGvYgaoh@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9OvMyQxOHDTdeuzR4DTQLpTV4g902AgMg6Pu1LEeDZIIn+m3k
	aWpbWvXl7RRLqDnIMvxUOEiYhmi1SOVsZbDVwxocVyp3EbhEMi6q
X-Google-Smtp-Source: AGHT+IFjuWtWMDwHauyIWQ6P4zJUpK0pb6PnGe7aA5sK+TB19g+3jJkYFGG6MD9MZmLpxBwDgcN7aw==
X-Received: by 2002:a05:6000:1848:b0:37d:5359:6753 with SMTP id ffacd0b85a97d-381c7a5ccbamr21342955f8f.15.1730918041628;
        Wed, 06 Nov 2024 10:34:01 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb1813a07sm315298966b.190.2024.11.06.10.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 10:34:01 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 12/16] staging: rtl8723bs: Remove unused function hal_EfusePgCheckAvailableAddr
Date: Wed,  6 Nov 2024 19:33:41 +0100
Message-ID: <414a3575073d4f78bd1132ccee6851d93cb59284.1730916582.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1730916582.git.philipp.g.hortmann@gmail.com>
References: <cover.1730916582.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused function hal_EfusePgCheckAvailableAddr to shorten code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c   | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index acd9c8128f94..9231a4bffb5f 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1151,23 +1151,6 @@ static u8 Hal_EfuseWordEnableDataWrite(
 	return badworden;
 }
 
-static u8 hal_EfusePgCheckAvailableAddr(
-	struct adapter *padapter, u8 efuseType, u8 bPseudoTest
-)
-{
-	u16 max_available = 0;
-	u16 current_size;
-
-
-	EFUSE_GetEfuseDefinition(padapter, efuseType, TYPE_AVAILABLE_EFUSE_BYTES_TOTAL, &max_available, bPseudoTest);
-
-	current_size = Efuse_GetCurrentSize(padapter, efuseType, bPseudoTest);
-	if (current_size >= max_available)
-		return false;
-
-	return true;
-}
-
 static u8 hal_EfusePgPacketWrite1ByteHeader(
 	struct adapter *padapter,
 	u8 efuseType,
-- 
2.43.0


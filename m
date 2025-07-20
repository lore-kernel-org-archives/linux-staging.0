Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA3D21ABC1
	for <linux-staging@lists.linux.dev>; Sun, 20 Jul 2025 14:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753023389; cv=none; b=mNkF9Eq70U7Cicg94kgtHcf/Q/cWya/vaIzpPtd1jXyA8xcPwo2aHwmohmZXNrqH1rmYbBof/Ign0Tn6QulhiBF9W5XnFzpEqZRJ6Xs5Kxr38Vxkp/l0IpQol05zrUlyZuyAd8ONhSKcM/UQTYuQFMRGZoRIiiZlRa9Tw4PQqg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753023389; c=relaxed/simple;
	bh=ribTfZgfN4Swj4DCnf2k0fCVnzcMOJAmpeD925EJ0wQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZQHHHlV72hM60Ljd+EVrvJrTYkpbsa5xbiVE1Azs/Y8EYGXvUVCHztj0+zbMkh+S8OMaqn5Rh+2yRQs8K3Ni6c0R9OX3z+ZdX1WztIjItZnTQapPW7HLJ3V18cbqERAhISQneRXXQ3Rwg4tVOIy6LFAoUHAzA74/ZuOxSlYx0YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fEfrr/GJ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fEfrr/GJ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so2028732f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 20 Jul 2025 07:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753023386; x=1753628186; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UuUWSppNYBkTWP+WVrf/p9iebsLL3gMHy2LG4YOpY8=;
        b=fEfrr/GJafcg7bAvRMPkkIRdyXL9r3Zy5RE59nMjCfOTT2vOkD7fYWKET2hSjAdznD
         BIlzOaj5/y01BykZEUOqDtMnTK/zqMX49JWqVxPCmJSoOKDsfmsg/Q6R4IloUH2HhcxC
         paDxqnBHZv8bx6+n3fPFBAc/RXiFkQiXJFaPAuAWq+50gsDxOnQbGWDQF4iQu0ZAhaRh
         F0KcmqUrOeaSH02gnSGkgMjpCEYtx6SbSB3HvpE+OkGbhGIr9W7mP4q/KxqKmuSMfoWk
         M3QfNTPtS8bIVROwLmWmKCTErkMZCYvPS4CS3m9OG7tEPNTJpncGVM0eI46xb0InwXOJ
         01Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753023386; x=1753628186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UuUWSppNYBkTWP+WVrf/p9iebsLL3gMHy2LG4YOpY8=;
        b=JWKcOu4tkK/w2m7zHzv5dH2rikuIDQWPiwynDjee4dJiTeucp/ghCVZg8130BCTRc3
         NRPNEun7BnpO4s61b5RLeysk8QYPm3rlKm0ZHfYbkys+ieprh/RMX0VbSo9z2jP3TVuV
         aj09kgx6mcYFYFmBsxXDN+yaNdtGsx3WzJ3WpHduMrjzcTW74VTKXuQIM0PR8Zwp2mPd
         ZpER1IGYVFRAzjoCRnfCETQ5+2o+gKhG2Df5vkmWwN6Rd/tcvuVDFH2Z1/7KPIEuN3wP
         puO6siyNUiE8NhNdma1jJ4W0OwYnQn6mEaI1nd0vX7/fKTv+EcsIRd7tipGwog1SWYq3
         uq5A==
X-Forwarded-Encrypted: i=1; AJvYcCW5otMtAjAMxYmBNXgUUf95F5t4rt0IpDmAYsOfWw4zJXqMqD79TstSyro3LfCN5h0G5weRFA77LoFoLLA6@lists.linux.dev
X-Gm-Message-State: AOJu0YyvZ+sMACvUlbfvhHwvlbhd9MCB5FbrVgL9S9I/Uw5mPVGVgz7s
	MOpgUaaYDfF9r4uuZ41Qz5uGF+RjIe6gk4Vo18lSKJYGbiIJsC5U5OJD
X-Gm-Gg: ASbGncsgrLLGZPXHHQKkZY9oCw55WBoPBBEKcqwHlK75+cvw7IHNEHESg0875ahcODp
	8ABmOw81+SmFK7EiuisBjP1kYkKRHj+cUuzVYW/eaLNrmA+VjNSUE9dOoGQE/ymFZHWMvQfDVas
	+WK58XLXVfbs5quG1n8uj0S+YN+CVU9iSfkVuiNl9RbulbKrIy3eItBs0+9sxJTAMscvgxHX+Yu
	zKmFPz/RgZdM82bJm5i0PIphqAwVTQ696+PrT0mwrnHWt7y+IO7NkABwc0lukmb7v5YUhISwbqp
	8m4ysg48lkNStXyriCZRxIGb+Z+gPb/tI4y6+cZJqXFfXtZcLKIGIKtvamGez6ynD6lUGMu/WrU
	ba8NjS7NzDCAo0JW2GAqQ
X-Google-Smtp-Source: AGHT+IGE8UZYIluepOPcaCVn+QDPY+5P4p6qhA3641C/Up7FV2fSyN9SdRezUhNWMpmxeFVg1XfNEw==
X-Received: by 2002:a05:6000:2312:b0:3b4:65d4:8e27 with SMTP id ffacd0b85a97d-3b61b217fcbmr7775079f8f.29.1753023386218;
        Sun, 20 Jul 2025 07:56:26 -0700 (PDT)
Received: from zephyr ([77.237.185.246])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b61ca4c754sm7770550f8f.59.2025.07.20.07.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 07:56:25 -0700 (PDT)
From: Ali Nasrolahi <a.nasrolahi01@gmail.com>
X-Google-Original-From: Ali Nasrolahi <A.Nasrolahi01@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Ali Nasrolahi <A.Nasrolahi01@gmail.com>
Subject: [PATCH v2 2/3] staging: rtl8723bs: fix comment formatting in basic_types.h
Date: Sun, 20 Jul 2025 18:25:23 +0330
Message-ID: <20250720145524.9733-3-A.Nasrolahi01@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250720145524.9733-1-A.Nasrolahi01@gmail.com>
References: <20250720145524.9733-1-A.Nasrolahi01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix coding style issues reported by checkpatch.pl:
- Adjusted block comment trailing markers
- Unified comment spacing and indentation
- Removed redundant semicolon from macro definition

Signed-off-by: Ali Nasrolahi <A.Nasrolahi01@gmail.com>
---
 drivers/staging/rtl8723bs/include/basic_types.h | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/basic_types.h b/drivers/staging/rtl8723bs/include/basic_types.h
index 57bb717327c..640db1e79e7 100644
--- a/drivers/staging/rtl8723bs/include/basic_types.h
+++ b/drivers/staging/rtl8723bs/include/basic_types.h
@@ -26,7 +26,7 @@
  *	1. Read/write packet content.
  *	2. Before write integer to IO.
  *	3. After read integer from IO.
-*/
+ */
 
 /*  */
 /*  Byte Swapping routine. */
@@ -94,7 +94,7 @@
 #define BIT_OFFSET_LEN_MASK_8(__bitoffset, __bitlen) \
 	(BIT_LEN_MASK_8(__bitlen) << (__bitoffset))
 
-/*Description:
+/* Description:
  * Return 4-byte value in host byte ordering from
  * 4-byte pointer in little-endian system.
  */
@@ -105,11 +105,10 @@
 #define LE_P1BYTE_TO_HOST_1BYTE(__pstart) \
 	(EF1BYTE(*((u8 *)(__pstart))))
 
-/*  */
-/* 	Description: */
-/* 		Translate subfield (continuous bits in little-endian) of 4-byte value in litten byte to */
-/* 		4-byte value in host byte ordering. */
-/*  */
+/* Description:
+ *	Translate subfield (continuous bits in little-endian) of 4-byte value in litten byte to
+ *	4-byte value in host byte ordering.
+ */
 #define LE_BITS_TO_4BYTE(__pstart, __bitoffset, __bitlen) \
 	(\
 		(LE_P4BYTE_TO_HOST_4BYTE(__pstart) >> (__bitoffset))  & \
@@ -163,7 +162,7 @@
 		(					\
 		LE_BITS_CLEARED_TO_2BYTE(__pstart, __bitoffset, __bitlen) | \
 		((((u16)__val) & BIT_LEN_MASK_16(__bitlen)) << (__bitoffset)) \
-		);
+		)
 
 #define SET_BITS_TO_LE_1BYTE(__pstart, __bitoffset, __bitlen, __val) \
 		*((u8 *)(__pstart)) = EF1BYTE			\
-- 
2.50.1


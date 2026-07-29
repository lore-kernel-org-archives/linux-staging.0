Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D915E3438BB
	for <linux-staging@lists.linux.dev>; Wed, 29 Jul 2026 17:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785346053; cv=none; b=mh6Psh3yEVWBT/ThwtaE1+IMlMtZIzB0s2fpd+t1C4Ht7+Xw4s1he7TLBxRxck9psv0opgSxDkTdhpRum1sC2DAa65e/FCv16VsuGqXa0hZK3Ar9nR09KrSQz+oF5gMyXWfUr+SRvjvbt0Yh/PLHeBmBhD7dUlE49DWVquRn0js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785346053; c=relaxed/simple;
	bh=IlR5SUN+TeNsR1gXMs3dh9kTQqnLR07f654TTJeT4Ak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cJ3rAtUYKCz+sXnXCsbxsXu0YfhA6vcpj09a8ZSd+uqus0SQAVw7Pc1/BEVBttXaWCEx1aN6xAAMk/KQmjEBRe/zgX0bQYd54lobLzFh0btTjhbUH1cvf18iHaQVXgP+l3+jSz0uelKZeGTYi024DVacbh453mBrRar4T1Z02Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B2ibM+yZ; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B2ibM+yZ"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cbb973e6749so1428258a12.1
        for <linux-staging@lists.linux.dev>; Wed, 29 Jul 2026 10:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785346050; x=1785950850; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P9wYjqLneOT9CcsqzWwUiSax4MjBMx5743Gw9YabJy4=;
        b=B2ibM+yZyJw9ra4Rh2eDzxz91PsYJlSv/I++9jsxa/6c9DBEInbP9KdrUZiWRHQol9
         EQ5TjKT9JTMbhc3mDKJh0ft5AtoIRFf1frhxlRxrMSAHfdM2esUXAnyijt1+KmXQUfeK
         R8sTPCqSgFf52YABtODgA8KX/ixkB6K0V0V4udayvSLCUc+l9+K3gUB4JkYEh3vxmDxV
         HS6+4oymQU9Hsmd9YsUqppcB8Iee3f/GNyrwy+Pm1qc+xeuOfE0EN84a1u0qtwAbySFE
         fElVbwvAIfzoS+gG1rmc5JAcMXnqMeRAcMdaUyM8HF5HJORSf9Jm+wp6t7wo2RpDmxAz
         HN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785346050; x=1785950850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P9wYjqLneOT9CcsqzWwUiSax4MjBMx5743Gw9YabJy4=;
        b=ORG0rWwC5Sk5+s/XhS//tr9GmyuvubHOFZ8qAShF4fOYMWyX3Ke34G+nphw/3MC5WW
         wL5H2a5QIjq/WEluP0jglsKG6UkEwrdeqkUwz/z9bV459L+GTbP2orG3XbYHSkrPqqTK
         c5UALEk6SuyRDiATAiSYe3niTnUSw/F3SXfoyUuadFsTL4A0tArrGAIS+JFBZMh8xzX2
         iTOJNDKKNzH3c7P8Nr1+52bAtxK0CzTmq53rYo5pN7itZseVsgxm2b4I0yacxkJJ4iSz
         354UD3BJOx5O56jyUgae5ryqs/tphDTxYQK2nj+REkxa3/Q/euI1G98urZH66NjUcJkI
         8d2g==
X-Gm-Message-State: AOJu0Yy2QU7JFeWwETqY2I7m4QOMD6hpg+/RLFMAZ1wIglCu7I/kko+u
	LKB2aKpEnKNI0r0y8xcASPvoiREiMCHPc2utEHii5cX4NKXt891wuZYi
X-Gm-Gg: AR+sD11G8h05xIQ//U+9Oe7uuebYp/YvFV7/cqG3Y0uvLvXTY8ZRPn0fJGbfuKe0zdf
	G6sp9ENAxZ0CF4JqOLB/0/YrWsJx/ifYgaRlYdBG/3Ay+97a8q9LUJNNoTx+38dM65Bynz7IomQ
	+Hp952pJwaHTnnOaGVXD74mdXPGWvvzDyA3HUXTADr39AlQgvzQYOw506+aFxMwZx7jN4RmH25J
	sWM2jbIrvu9+1x9fmKTS2gZ4WAz5+dgB8OFgUvrD49v3haA0/l24yT0RP/mMegjks433UM6ue0f
	61UUnM2x8e4oe8Ku2pr38KrjkuMiATchZjuVFb64ihl48tZvPk5+7u+e+GFYQa+M3TOyXNi6T5N
	mp/ylFjsUGKZR+yZP1hVaXickI3CwLG+9O1i12UnF+2Af6PCpsDax8qtyKu0OBjenw/dqs124zD
	32kZCzzJGgbeclJ0svZe5WMn227jlKzis6zntKEwINs1JY6EhhAg9YyvlFgCo=
X-Received: by 2002:a05:6a21:690:b0:3c4:46ca:3339 with SMTP id adf61e73a8af0-3c8ba5d8f94mr8880806637.39.1785346050043;
        Wed, 29 Jul 2026 10:27:30 -0700 (PDT)
Received: from PC.. ([103.172.209.59])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d480c5sm19527526eec.25.2026.07.29.10.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 10:27:29 -0700 (PDT)
From: Mohit Mishra <mishraloopmohit@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohit Mishra <mishraloopmohit@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix underflow logic in swing index calculations
Date: Wed, 29 Jul 2026 22:57:07 +0530
Message-ID: <20260729172707.13333-1-mishraloopmohit@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In ODM_TxPwrTrackSetPwr_8723B(), the baseband swing index variables
Final_OFDM_Swing_Index and Final_CCK_Swing_Index are declared as u8.
However, their calculation adds Absolute_OFDMSwingIdx, which is a signed
8-bit integer (s8) and can be negative:

    Final_OFDM_Swing_Index = pDM_Odm->DefaultOfdmIndex +
                             pDM_Odm->Absolute_OFDMSwingIdx[RFPath];

If the resulting sum is negative, it underflows under u8 rules (e.g. -5
becomes 251). This causes the lower-limit checks (e.g. <= 0) to fail,
and in MIX_MODE causes the logic to execute the "BBSwing higher than limit"
branch instead of capping to 0.

Additionally, in BBSWING mode, the check for CCK underflow mistakenly
examines the static struct member pDM_Odm->BbSwingIdxCck instead of the
newly calculated Final_CCK_Swing_Index:

    else if (pDM_Odm->BbSwingIdxCck <= 0)

Fix this by changing both swing index variable types to int to enable
signed math and correct branch selection (aligning with the TODO item to
convert remaining unusual variable types). Update the CCK check in
BBSWING mode to examine Final_CCK_Swing_Index.

Note: The fix is scoped to the calculation and branching logic. When
passed downstream to setIqkMatrix_8723B() and setCCKFilterCoefficient(),
the values are already clamped within [0, 42], fitting safely in u8.

Compile-tested only; no hardware available for testing.

Signed-off-by: Mohit Mishra <mishraloopmohit@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 6c5f56d5a1f4..4e89847700f3 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -160,8 +160,8 @@ void ODM_TxPwrTrackSetPwr_8723B(
 	u8 PwrTrackingLimit_OFDM = 34; /* 0dB */
 	u8 PwrTrackingLimit_CCK = 28; /* 2dB */
 	u8 TxRate = 0xFF;
-	u8 Final_OFDM_Swing_Index = 0;
-	u8 Final_CCK_Swing_Index = 0;
+	int Final_OFDM_Swing_Index = 0;
+	int Final_CCK_Swing_Index = 0;
 
 	{
 		u16 rate = *(pDM_Odm->pForcedDataRate);
@@ -217,7 +217,7 @@ void ODM_TxPwrTrackSetPwr_8723B(
 
 		if (Final_CCK_Swing_Index >= CCK_TABLE_SIZE)
 			Final_CCK_Swing_Index = CCK_TABLE_SIZE-1;
-		else if (pDM_Odm->BbSwingIdxCck <= 0)
+		else if (Final_CCK_Swing_Index <= 0)
 			Final_CCK_Swing_Index = 0;
 
 		setIqkMatrix_8723B(pDM_Odm, Final_OFDM_Swing_Index, RFPath,
-- 
2.43.0


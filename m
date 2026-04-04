Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85716349B1F
	for <linux-staging@lists.linux.dev>; Sat,  4 Apr 2026 23:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775343797; cv=none; b=HzIn1cSv47W2iPORmmZaxMNQjaqZIItX9/aCRY33JGQ2w0eDAarBi0Sm7epmnwKPiKOuv+M1f3MHhu/XmipWBtpwxLApfr0V1KszKaF5VaHU/5IH0F2DWb7WjVmrnFDJF6VXrWnbdD5Ntk5ooUL1/4S1Tz4SgGLVitvvTRaUkKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775343797; c=relaxed/simple;
	bh=HL1mwJBzaIwo1zGTYraOLa0fIAhVfWpdcbVPs6RmyZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ItVRQFagDvYy0hRmDhTLYYQetJgMhEI1QWRJKg7I7cc4TiwqJKZ9/+XL0nAVdXzcxw6fzyaZm3zklMj1LVzSvAMIPmAcU/Nli1U0rveULEzijuIlK1ECzCcABPq+YMnwIRPsapPPqUnadPbDLQTRDBrP1WLcXLWhIfbMNpjOwGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yiwe3q+h; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yiwe3q+h"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56a857578a8so1070993e0c.3
        for <linux-staging@lists.linux.dev>; Sat, 04 Apr 2026 16:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775343795; x=1775948595; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VT54FeMbxqX21ddtIQHdTpaD4nSQybFIj5pVbkZZyL0=;
        b=Yiwe3q+hYBF7tkhOgyHFOioiRgmtQ36B3x0W007+FHEgXLDWCzuDgHVnAzvKjvp4zn
         0JbxmC1NEynJ6h1JpkqOphz0lST2D93AKLJKfpJ7U++FpjRiE+X9d7J9u1jeI9a2ragL
         iKuk3FFtalPX+lmuIPLGeQ4k3Z/WHpyt8XyMFB8EsSQMR/oi9OdXR3PANiGi6kxcSEot
         1duNoez5dSSjEphBuBqLO05QpLOMxPs0EUau/5k/FIeii1Jv6YChw2hO2MF7vWPejqyZ
         WgsYOnMcU/iwkcj78nkCiHr1TT2OdPdQ/UXdcCoO5pDWcyxhwROZoUlc0y31sh/dg2H5
         RYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775343795; x=1775948595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VT54FeMbxqX21ddtIQHdTpaD4nSQybFIj5pVbkZZyL0=;
        b=lQhtaywaVNdY+B9hf1s0bsEWBwY9xxWWJbbpOi5cQEYIlfB0lBrHAjMruTVbWXC4ab
         Q9eRL9BEjZ9iPFA31Y791DaAtViUwpk0HC4y2j7oTRtEepy9/VAKiIBdCHP3i7roRddl
         E2NFrPTp7MmND3pff7hn49285qrj7u7Lsi4bmT1cn1kG0N/7f498VOyjX2MJtmPPejZR
         xH6Nw1DHS72zXJ0Qdf3sPTVE2XRx8C8tfs+sbub0L1czewCfHNoFmG96RXkdIlcXZwii
         5JVE28DrPeHamm12DY0njOe5dfmZgSj69RhPe7xex3fWMNASdWTZLyCqWpj/8pjbWUu9
         fjfQ==
X-Gm-Message-State: AOJu0YxU2Hq8IW/0tGEpM+D0mvtpaHh3LhdMNWyp8g2V23IRZreOW2Gc
	UQlmSIO+Ku1eshmHMWDFBmXoNPUOiXlGmWr3liDBICr64+dnewjXA65O
X-Gm-Gg: AeBDietL7tg0Z40CHjREMIsNAFNdh4JEw7C9Kphuryr34xleIHqNJKA/DBMeklLL4Rv
	0JntptZgWcl882VMt2hYAzOJOu+vd9gxQabJjsnpP0u4E6ppszsMgemDGmhS0HENxqThn+31Z2O
	14/PifVP46BL/enFVtA4lFLPJW4br/bDJup73ybv8HIsNGiC56L9eIKh5ELBJQ+f8erpjHRH/sb
	zLnANuD35GJ0+HmJIIsGD/ZT9GNO4ug2NqD8N50aa1AcizxO9dh1aTmeyRpwPwnuwnkbU9Toi3Z
	5pKSSAVIDTcv0c41TGEAK55M6toFMNIkLMA4nop4UPGQNQZAmz+yU4DqLlae+JDmSLms1/e+1OX
	CmJLkSczrSE2K6pdtQ/pF79TqYTPI2zUV6iugvKwSt19bBabAsXcZ56+wFyw+V+eLUKkbExHkNF
	dVPlOO9SagULMbRqX9bc3Nzrs0LJjxj75t92l9aYGt
X-Received: by 2002:a05:6122:e1b2:b0:56c:ce0b:fecd with SMTP id 71dfb90a1353d-56dab9d6df7mr2638405e0c.12.1775343795382;
        Sat, 04 Apr 2026 16:03:15 -0700 (PDT)
Received: from localhost.localdomain ([102.244.98.15])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9ba80290sm11317699e0c.3.2026.04.04.16.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 16:03:14 -0700 (PDT)
From: Delene Tchio Romuald <delenetchior1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Delene Tchio Romuald <delenetchior1@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: fix negative length in WEP decryption
Date: Sun,  5 Apr 2026 00:02:48 +0100
Message-ID: <20260404230248.62203-1-delenetchior1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In rtw_wep_decrypt(), length is declared as signed int and computed as:

  length = len - hdrlen - iv_len;

If the received frame is shorter than the combined header and IV
lengths, length becomes negative. It is then passed to arc4_crypt()
which takes a u32 parameter, causing the negative value to be
implicitly cast to a very large unsigned value (e.g., -8 becomes
4294967288). This results in a massive out-of-bounds read and write
on the heap via arc4_crypt(), and a similar overflow at the
subsequent crc32_le() call using length - 4.

Add a minimum frame length check before the subtraction to ensure
length is always positive.

Cc: stable@vger.kernel.org
Signed-off-by: Delene Tchio Romuald <delenetchior1@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index b489babe7..807f4f3c7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -113,6 +113,12 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
 		memcpy(&wepkey[0], iv, 3);
 		/* memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0], keylength); */
 		memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[keyindex].skey[0], keylength);
+
+		/* Ensure the frame is long enough for WEP decryption */
+		if (((union recv_frame *)precvframe)->u.hdr.len <=
+		    prxattrib->hdrlen + prxattrib->iv_len)
+			return;
+
 		length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
 
 		payload = pframe + prxattrib->iv_len + prxattrib->hdrlen;
-- 
2.43.0


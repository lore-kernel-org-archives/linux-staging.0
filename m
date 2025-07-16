Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7FF3C33
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 11:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752665897; cv=none; b=TYpkUyQhLY7YIT1nO+IRTEQw+qzj4Sh7N/z++jqq9TX9aEvkcZgk/aepI/s1+nI6K/AJJnx2Q7o9gyxhd3XVevb2YjnascxYwOK/Jf/jrgVBz3LRwOWAu3Jy6NmhbXpoZZ6hQdemj4fNs0VFG4AS4hXPZ3brkaZYUDZSW1N0WPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752665897; c=relaxed/simple;
	bh=7Bwh8TXaHQmS6kki2ivqStLUhw/pXHIKB0oEtsdp+7I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e9MN8/+yzsJ9HOLXDQbFvIrfwgq2Wel0bsgXvkXTn4uq9G20+ujY3NYLkgomwjyeQiHWHZGY9UMshN1FyrbjTZh2so+eStIfwrv7i5U05L79yXqO8NS7upNEUUSKOrPEJM5AR2f3c6ZdhcvQOw9ROVdxJyjVVAtRbEwrq/zCC5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICnGNsyA; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICnGNsyA"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2efbbf5a754so3868799fac.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 04:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752665896; x=1753270696; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S6b4xWA9byt/FotlxTc8skr24rplEGpzh9N97EcCRrw=;
        b=ICnGNsyADxI2hJMeIttSFo5lJHQGUlCklfbEIC8Hzab7+YjFiO6UAdrUebGRI5842c
         l9hMDQei03BwOKIGaxwNCm9cYLuaKbQaq9IhVR5gU7o4MVJVeFLPCX6ymcngOq5ewHWv
         JVeoPK6k61jbOpjdMON0Y2cYzrPRJKqllXX7602VDZtQDjXwobbQy9ZK6dNypdRn2AWg
         Psd9lbU2M/SGlyqH7bGTm+WRbjqcR+pfE/AObi80E/iwu52Txk+9q2dklicAc0EiZJW0
         ElMAsPKOlF7FBVdbR+Wjyyh9JzoTK28MNcXgAZtdllEzWoD+r4/6IP392mkbi6QjwEZ+
         mn0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752665896; x=1753270696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S6b4xWA9byt/FotlxTc8skr24rplEGpzh9N97EcCRrw=;
        b=n93581XDL2Y8+r/eVkzwjazqp79fpLJ5zT0Xa57P/oX+uKd+G4l0qeqnXNDtVYw2v6
         Em4MPwkHtizAdjq0GTONKLoPuulmTKx2ug9nlPDBITpYjSaGdSSBwWbN8GkrdRSe78we
         itWxgQ3zAyVPb+WXZnA9NT/TwIQpR2R8hiyoNWywiKnSoVAHczU+FgZGrvyzKCnzzLnv
         ljabbIYuksT0HyuaZ7ObZW58HU2ZqzX4HuOR86ReL+kAkXWlS/QFirOASp59zAm1fX2A
         992aLMETqMPjuZTe1xqv2wQhhbgsJx57w4jPCTWMiSzAw6paSLBU0jmWzMEMbkXJWzM8
         gWRA==
X-Forwarded-Encrypted: i=1; AJvYcCUQgu4wMfU3LrpG7lWxtd2/CjKIZ526tGtLKtU8GvOPfrhL3GwOROhMGPqFMHu9DnTS4+wVGSZSrrhDI0sx@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6xoj2M9IffDSx07eqgTHxB4YSmlkHWFuYHBlokExhAvjBWiBt
	TrQL//FxboT9pD2ADbwLoKFiWiY+RrT6qx6s1VpX3nnqqbn54Lh2tu6r9IQcZUg6
X-Gm-Gg: ASbGncuAyY/4JQHw/x6R2D7k3SZLO/xQx7A2PGg0sz24dsOMbrM7TThWEQaW2TmSXZX
	4CCAjN2ck5qVFUAnWqG8Q7/lH0ma4CBLQB49ZmFpOQkQPxN9hl6B1hG3NQHrByGGkSFeZLD6VYX
	3YNG9id4+QGa7aDPQdqMfYDGY9HJ/Qb1L6g/v5lIGZbMiPxlbwjQetxVlPyNVWeqmFacEtkyIQ3
	SNcBufIOfnuwjpi38bBKITTIL1Ae8EwVKPC7Z2aFT5XZWM73N1e9vVYUwH/ztIw+jd45n3AL+sv
	J1Fr7DLMtdOYAK8Ih2mQa07S0fDb8hsX2GiL+Tx5IlXdYkkfg15VdjaJJKXfMtBqlL80ej3nmT8
	BWnsNDJmu9aCE3k36avRZKZlrvcEt2nyrMtscdI+FmwVoA5gdieO1
X-Google-Smtp-Source: AGHT+IHvXSSMySiUN5pzq/8QSRR4aSLSUrUgITBVkD5GwxBeAJU8Hu+SPS8IU40oTeoP9bdXxOnkgg==
X-Received: by 2002:a05:6871:780f:b0:2ff:8956:fd45 with SMTP id 586e51a60fabf-2ffb1eafe32mr1691067fac.0.1752665895589;
        Wed, 16 Jul 2025 04:38:15 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff1127dd10sm3353730fac.19.2025.07.16.04.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 04:38:15 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: Ignacio Pena <ignacio.pena87@gmail.com>
Subject: [PATCH 4/4] staging: rtl8723bs: fix tab spacing in rtl8723b_cmd
Date: Wed, 16 Jul 2025 07:38:08 -0400
Message-Id: <20250716113808.73115-4-ignacio.pena87@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250716113808.73115-1-ignacio.pena87@gmail.com>
References: <20250716113808.73115-1-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ignacio Pena <ignacio.pena87@gmail.com>

Fix checkpatch warning about space before tab in commented code.

Signed-off-by: Ignacio Pena <ignacio.pena87@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 789abc123..012def345 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -77,7 +77,7 @@ s32 FillH2CCmd8723B(struct adapter *padapter, u8 ElementID, u32 CmdLen, u8 *pCmd
 		else {
 			memcpy((u8 *)(&h2c_cmd)+1, pCmdBuffer, 3);
 			memcpy((u8 *)(&h2c_cmd_ex), pCmdBuffer+3, CmdLen-3);
-/* 			*(u8 *)(&h2c_cmd) |= BIT(7); */
+/*			*(u8 *)(&h2c_cmd) |= BIT(7); */
 		}
 
 		*(u8 *)(&h2c_cmd) |= ElementID;
-- 
2.39.5

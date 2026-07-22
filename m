Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0286D3B1EFC
	for <linux-staging@lists.linux.dev>; Wed, 22 Jul 2026 21:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784757231; cv=none; b=kOOYJDa+OmcEvg0OAsYef5IWCjhkB3NabClbNKB0Zo/gt+xo3RvQ6jhURwLCsw+tXJ55IxZskMrb9KwtW163UiH5bZlpm/78d7xphr2PKP1efrRRE59qTKmk7jLtikscX9m+eJzdMfzCmHk/sXHJKvH/Tnzg5DBITq/GXTizIo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784757231; c=relaxed/simple;
	bh=kLsG8Cc7w4TGXx74DPmbKrg2eZnjyru909UpW2oVPFs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q1bSsL01ZJ9AKhEFQPDy/dJNRzrS1QGmLesAWCubXPWpL3qs+ljYjDAipWsPkiscK8Y6bx9lViNyBu2eQTBocI+LKt8GUOlRXJxikMiDQt+fgqxVtVTJfrGLKSPLCv/LV4Q0i6294xTZ5lAiVbwaCvg2xn2BLWTZ62zVVvU9ohU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RH2F/VLT; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RH2F/VLT"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c15e592da74so1365566b.1
        for <linux-staging@lists.linux.dev>; Wed, 22 Jul 2026 14:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784757226; x=1785362026; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tVpjycweQEWnbKCET1u1aFSthym50+THgVbqZ1JnaPk=;
        b=RH2F/VLTYMzVxfY/d4pLd2dG/YtiAshV636U+vpdlvSI+/IHhQ4RRVDDZgVPV/VkJJ
         /fG/WJVjIK/Mbu85JQBw9BIuuVAqzLuV778zVDqS4pkrjA29sba7jprGBM+q/Y62mwZE
         S0aDt2xTEWG90EnoG2DUvLX2C8kf+qas4o4zlhHCIe5j/kQXDKdRwZ/AReQzxL5QjMx0
         iRMV2aWzTrPfXN+c8jIhqU0gy0kpI48l4GvAtJeNDqQa2ccby1+GmbD6CEhrAoF+X+RW
         V6vnnnOnTglbqBuHod0zEXZrlXLMc4g09c4D7pLU7OKeopqiVmuUher5ixIYJI7+ziQp
         OTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784757226; x=1785362026;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tVpjycweQEWnbKCET1u1aFSthym50+THgVbqZ1JnaPk=;
        b=XXETj9VQs3ZbdoTXrPgJigVXMMtO3nN+nvgYeLBT37xFbHvc6cyamVlOkks2yGZG/I
         C090luupJhBbYgHCas92MDbO3iEjx8vbngI3w5vSf7QWfP/cC6osrHHMlIER8CRTAeM4
         tY+Ue0nM7j9WLoi8JReJYtOPF4ef8sTSr3yD8uf7uUy83ATFdOolzgnWQIfATpDMmBXT
         5WQvTpq/VLfai9roQW/6cDsEKWh/qMQEzol8+8ayh4Q5PLmOuEUqdW7aAYRDe2JyhGbn
         lCwRxSRFiZ5YEqa1z/NXbeDkoOgXh1ostNWP67zu+vDXmrt24M7kQptmGjSU35D/Hn1c
         VFuA==
X-Forwarded-Encrypted: i=1; AHgh+RoeDZMmkTRXiFHYq43W7NnvRsbcFfGEs96jerUdSVepXzWIiae3dWLlkM9vFrNfqw0BA57M9DlN8wxXASm1@lists.linux.dev
X-Gm-Message-State: AOJu0YweIETTSpqM6o6lbvXyFSpN1IAoBZkfcVSAxWzH2mRe7HoiJJ7m
	FysJvnWxlcBbT29MkmclB0Wa5A50oIE8FhaZfuHZbXkbzQtg4J3wS0s3
X-Gm-Gg: AR+sD10jFe8gaJjRyF6LmMZmafpJJt8OaLY7lsDpMDI0E5J3wEmrXeCAdcrutY5u9ur
	q896HXBPAgA7mEOZERo5cbYYGO6rRqxrwBzTevOa79REgsa3WtvkHK3gpb+ZBqmdHjhymZNjwhs
	srFkOkXeBOG8scdccYHaaPu5kXtOdBCw9+Cih45ztknHVDYm7mKg0otDKYcXmOhiaNtnjTIcBvt
	voGBYLcGcA29MdAygjd+AEu71ak/Sbaco4d4rQSs6/05dfa/tVyHFD6lna5D93eHXf7Z0gN1A3o
	PZHaBCtdKXU89AgtbIu3iW2J+vHaEdrO7GQLo9skERphp//AF7go0Zev99vBUkMXp4QROaLqqxO
	fdtzeJKyb/aat3dWv1CzeMqxBOh1Xq7MrC88RfMuYS1i+GlkyX2ERkkD7FeQ1baLGAdOeGP14IB
	dUKA71/m9DGNw9Y+ghd5XlG+7ivaRO7O7DWWpQFQ24bT2N6Sq0E6U72kjW0/E3KJhT
X-Received: by 2002:a17:907:e1ca:20b0:c16:14d1:b529 with SMTP id a640c23a62f3a-c1c5092f0d2mr16761066b.18.1784757226140;
        Wed, 22 Jul 2026 14:53:46 -0700 (PDT)
Received: from DESKTOP-LO2SIVE.localdomain (83.4.116.191.ipv4.supernova.orange.pl. [83.4.116.191])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32c90b4dsm151764366b.35.2026.07.22.14.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 14:53:45 -0700 (PDT)
From: =?UTF-8?q?Patryk=20Gawro=C5=84ski?= <gawronski1.6@gmail.com>
To: gregkh@linuxfoundation.org
Cc: =?UTF-8?q?Patryk=20Gawro=C5=84ski?= <gawronski1.6@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Lin YuChen <starpt.official@gmail.com>,
	Maksym Pikhotskyi <mpikhotskyi@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	Sameeksha Sankpal <sameekshasankpal@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: Replace custom RotR1 macro with ror16
Date: Wed, 22 Jul 2026 23:53:25 +0200
Message-ID: <20260722215327.62791-1-gawronski1.6@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The custom RotR1 macro reuses its argument, which throws a checkpatch
warning and can lead to unexpected side-effects if called with an
expression that has side-effects.

Remove the custom macro and replace its usages with the standard
kernel ror16() function from <linux/bitops.h> to clean up the code.

Signed-off-by: Patryk Gawroński <gawronski1.6@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 29e2a5a771dd..2217cffac5f2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -6,6 +6,7 @@
  ******************************************************************************/
 #include <linux/crc32.h>
 #include <linux/unaligned.h>
+#include <linux/bitops.h>
 #include <drv_types.h>
 #include <crypto/aes.h>
 #include <crypto/utils.h>
@@ -225,7 +226,6 @@ void rtw_seccalctkipmic(u8 *key, u8 *header, u8 *data, u32 data_len, u8 *mic_cod
 }
 
 /* macros for extraction/creation of unsigned char/unsigned short values  */
-#define RotR1(v16)   ((((v16) >> 1) & 0x7FFF) ^ (((v16) & 1) << 15))
 #define   Lo8(v16)   ((u8)((v16)       & 0x00FF))
 #define   Hi8(v16)   ((u8)(((v16) >> 8) & 0x00FF))
 #define  Lo16(v32)   ((u16)((v32)       & 0xFFFF))
@@ -392,12 +392,12 @@ static void phase2(u8 *rc4key, const u8 *tk, const u16 *p1k, u16 iv16)
 	PPK[5] +=    _S_(PPK[4] ^ TK16(5));   /* Total # S-box lookups == 6  */
 
 	/* Final sweep: bijective, "linear". Rotates kill LSB correlations   */
-	PPK[0] +=  RotR1(PPK[5] ^ TK16(6));
-	PPK[1] +=  RotR1(PPK[0] ^ TK16(7));   /* Use all of TK[] in Phase2   */
-	PPK[2] +=  RotR1(PPK[1]);
-	PPK[3] +=  RotR1(PPK[2]);
-	PPK[4] +=  RotR1(PPK[3]);
-	PPK[5] +=  RotR1(PPK[4]);
+	PPK[0] +=  ror16(PPK[5] ^ TK16(6), 1);
+	PPK[1] +=  ror16(PPK[0] ^ TK16(7), 1);   /* Use all of TK[] in Phase2   */
+	PPK[2] +=  ror16(PPK[1], 1);
+	PPK[3] +=  ror16(PPK[2], 1);
+	PPK[4] +=  ror16(PPK[3], 1);
+	PPK[5] +=  ror16(PPK[4], 1);
 	/* Note: At this point, for a given key TK[0..15], the 96-bit output */
 	/*       value PPK[0..5] is guaranteed to be unique, as a function   */
 	/*       of the 96-bit "input" value   {TA, IV32, IV16}. That is, P1K  */
-- 
2.55.0


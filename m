Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9767080D
	for <linux-staging@lists.linux.dev>; Mon,  6 Oct 2025 12:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759753534; cv=none; b=eOw39kRNURuzHVIAlXPNHol1rFCaKXYCyqFxG3XOpw0LRSS8Jyh/SJQKJ4ol/KBzSlz69N8ORp3LOE2+VSRLlvEX6VBSuxO6q4vJY2JzOdtgnYpZk47ApnXppEKxKmBa9Qy1U8te2T0zmD6lBPNFCrwgYBvRHuyMl2GNp5Q+cos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759753534; c=relaxed/simple;
	bh=kGnUJMNjHO71kFp4EtWKGHp2JB8jldGLhc9l8su+EgI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y/ad9aK4zeO5vMvYlMvlz9+WcVRpvdh+txoB0ftnhO0z55W6w2GWoxQ5v9TXWQUEVlVckgcrGm/GkVtzXAMzFGUnMShoD5PaBzeyHI8oN/lRBrVhDtSzE+SCJHltyr6H9yz36lkHoLbBLHZTtd2xw3lLzZ/mrPYtMvZj7KUkuL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RpDERf1e; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RpDERf1e"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-27eec33b737so65494535ad.1
        for <linux-staging@lists.linux.dev>; Mon, 06 Oct 2025 05:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759753532; x=1760358332; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g1VoA28QAB1LaO/0AKqL4O/Y2EiakdoSDbts9AjpHeQ=;
        b=RpDERf1eAy6jtI+ZYn1GnoBu9XDpx8UoexSrC1DV9qmKbioHcSXlW78Nz958O8LHdd
         8sIxi9MIC1RfWXxSkw+PqPCEl4ZziY57dPANFE0Tfm2+O+SnTdl5js20SIR5GMgIl9l6
         i1Lo1NoG81micm3q+SRHXM+QGDhmm0M6rN6o2WbR9x4p3g256tkjyQsLGXilwMoufRC3
         epwZ6Qo1RmG5+uOj502cmxE90/h/RNt/JY82sDvN8m9VY9exLMvJoDJxyXWZnZm7FbXR
         qJfrJkKv71Mqrp3E4YzCUOOvfzQz+I05UOYEotcK1lRDZbscaCuRAxWADZZlN+P/lchu
         Birg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759753532; x=1760358332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1VoA28QAB1LaO/0AKqL4O/Y2EiakdoSDbts9AjpHeQ=;
        b=f/EmewehjwVcM/uEBzqvd8uBJ2oqfP4eFLakz3MlcEAnf1lTuzio9dqSIqSyo0GqEV
         KW5fDRJlPKQzokV0le7VsInfJ7THMXMXJUJ52YKRhJuD3fNiZ35yKXPxIuL3afY/Y8rV
         gZ/sUzUw9CzXItoYZavakAJ+pT2J6tZgkKurJf3wD/WN1Wor8eZhcdC91kpywdgu6/F0
         bRp8YVcVtvaRYoRvG0O66ce1I1DFfz92G8vSyUDqgBoah6teRUkE+VrNxMAM5fanKpys
         EAulgVKrbjPe9upDCnbXH0EyhfhHkpS9T9vLFql6eSXMNCjc6AuZeRDDrIjf+jiBClqP
         FiEg==
X-Forwarded-Encrypted: i=1; AJvYcCWMLxh8U9NpZ56oIQVroRQKt0CiY6d2Kaw7moKkzyEpDtCQ2JhbvC6oACJ1fko9BHi51DWx1TrT8S9ltall@lists.linux.dev
X-Gm-Message-State: AOJu0Yxlu0EKuSwLRfqi8iZUar5VuMs4464m/y5bTODhmkbWUzweRnwA
	lhk2fNZ4/mGLHoi7kcCX+24UY1yZ9EKyhiA/pyhtdkgN61s+iQbcZ4QE
X-Gm-Gg: ASbGncudQ+i+wedOgT2gvhAdSnbgEBU325tBEFA5Roq8xREuaspdbc08uLhU1L5c0Ox
	KT6ZwEt0PWOqPk11TwNtaIr1tOCAS5942pzIHYBzjlfIPxUiKtzt36nnGBp13hz3/MiAa8vmowU
	HQiQ0lYV3W1qGopDAtgXt1xXeb4ZeCpWrGeymlW78pZihwq/ejZahnOzGz6HTw5w8a77xCuIXlA
	GAStj22u4ER0gPwP6O0kJSoz+QcgdPXetCBcV9X/tkh6PG3Gwt4df9Wz4Q8GXfjgAIMEJidFX1q
	dhfyc8726HozxACQbd/jQeL0fhwnOcoMDw2pY7zwCCmO+WsZAi/aSpq0UW6HUkeJrgtZ2jpY0Wh
	H0dVazpfYNFR2TDKnzDq7lvYMv/RtIWL7rs/zgOukU/WouiBa9Fz+lQFI1cDFeXvohjPTFw==
X-Google-Smtp-Source: AGHT+IE2fxagLBcV89KYI+/k7E4e/L0HbfHVoGRjzzCu/Trvn+QFvvsXy3CuD2dSestm6zz0PIeoAQ==
X-Received: by 2002:a17:903:1b03:b0:269:d978:7ec0 with SMTP id d9443c01a7336-28e9a62ffb0mr162012545ad.28.1759753532584;
        Mon, 06 Oct 2025 05:25:32 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:fa6f:67e6:9404:f1b2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d1c5csm131201565ad.101.2025.10.06.05.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 05:25:32 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: Remove unsupported PALTFORM_OS_WINCE ifdef
Date: Mon,  6 Oct 2025 09:23:19 -0300
Message-ID: <20251006122524.9442-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Despite the typo at PALTFORM_OS_WINCE, its a reference to OS Win CE,
which definitely is not applicable here, so clean it up any mention to it.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_mlme.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 4c15d0194d4f..2a128568c6df 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -18,11 +18,7 @@
 
 #define		SCANNING_TIMEOUT	8000
 
-#ifdef PALTFORM_OS_WINCE
-#define	SCANQUEUE_LIFETIME 12000000 /*  unit:us */
-#else
 #define	SCANQUEUE_LIFETIME 20000 /*  20sec, unit:msec */
-#endif
 
 #define WIFI_NULL_STATE		0x00000000
 #define WIFI_ASOC_STATE		0x00000001		/*  Under Linked state... */
-- 
2.48.1


Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFD1265630
	for <linux-staging@lists.linux.dev>; Sun, 24 Aug 2025 09:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756029522; cv=none; b=bOzKNYiPGP0lkb/GpFnSmSkxcdcu8RBITb1yrOgKaX8A5zlfWffWUnD2GOhPG/ZATt67B5uclFCP9oTrReacLPxk1vla/oBHUwKuG/bO7jXFtS5M6MTv6u4S7ie7L4HOCmfVyo2GeIM7GYObAroxLLYXLVbNBg8aSzZe+kfKnPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756029522; c=relaxed/simple;
	bh=CXpEwzcOgts0UYKdQU3OZhreVhHUKwGYoANggirmlPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jh3vkRsM92xS8pt6Hu5faLIDceGKgMp7jdDXZKAJ2VqpVjdXRfVLghEhi0WgEZTve7WNszFYvTWRbzT603nKyeqHEVbh/n2dj+wNIoGDlse0ipB+F0wqRxOnFnzuzWpnEtKsDppo32T4319fUGvJ+WpuZp++DXfknWJtnA2BCHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qcd6ZjHd; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qcd6ZjHd"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb7af30a5so590227666b.3
        for <linux-staging@lists.linux.dev>; Sun, 24 Aug 2025 02:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756029519; x=1756634319; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CB3jyeOTf+YX3hjwKO9p+5RPKcTVpxOior2qXXRyptY=;
        b=Qcd6ZjHdOHy4b8q7djKHamzrarJPXx7L4LvblUBJ+6K7INcJYweMuWIYOewOd9dp9u
         FF24MjcLa7jGd4LLbywJPPL382rvNqoz5WMdC57QGqNh8G6mva3mhTp+lHXsiVws9Ej0
         Y+jmjeIRhYZmNwLRVBFpTgR1oxFHRIf74ppy+esMeK42CULdg6J1DlFkqI1OVyciBwgu
         Prwq2yt148ReZ9ceQU55rlbdWwIbMIukfZ3Tb901Vqr/eRVgQxGeuAIndaMUB/rTlps/
         8qUC8/vE1uovh8UP70AP6HK89Zmg6mQJhZAEVP3xVrHCEfvtjn9iaWxsNkeO9X0scyju
         QmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756029519; x=1756634319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CB3jyeOTf+YX3hjwKO9p+5RPKcTVpxOior2qXXRyptY=;
        b=jFV9mNihCvGS1tXElobuN1r1sV7AzmTqXjRP0eiHe+QQXXOqdPlWknqxcGjgpMzp5g
         OHO+nRmLuKe36fGhGTiogiS2s1lDZWsH0AC4rr3w1zCz+El+UKWTmKjYZXVvPuXUdej2
         86D+hI4wZjNSKmPs5E5BXvlhxa6fhc8/kwmnQUVXFjZCWT3gmjwS6BHkuQ4VRpCrJfr+
         dgZHc1jkyPT+pC8zAehYHWc76pmkgqahokK2K346vmUHVVg4tYsAlB1rMxVuhV5g/XvZ
         BLLVlfM63R7TWP65lkXu/LC38ucP2udLoXOcONmcT3mAOZUITp44pUIh4j61iL+JMLid
         xifQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0FhAa4aNZBHEfw/aRX6WsVnumSO1k0r8kIODXNHGVtBrYh7KWc/r4dhNq0ivkArHFcX/Ds7sgUPKqp7Oz@lists.linux.dev
X-Gm-Message-State: AOJu0YxTzUSTqsCfdmm9Y47MAChfiDg3JGelzDNZLxTM9BkyzBL3fZR1
	t0m+hljBRjmescltCyAddIpTIYB9LqZuH41fhICiie+2aRM8Tajx5jMC
X-Gm-Gg: ASbGnctBReIwbwE32ZTKHeBW3qj/yipwiuXiRkeDvNKMLWNbctdSEsm2BarOZWj68yf
	JAVfoy5us78YdTXXrL2vQkN2zrp/nJjK5qSzMt8YSxZxBl4HqtXySgH6UkqGU5p4yCPHdK9RKNZ
	vYnVttgo47YZiUiBTz6MS0Plf2ZyAcGcPNpogywYnA8lSHHfxdE0Q81dI9wIkEU1s4cscWzrwZW
	WLM5Jqx4UijPhB122NGDZKEHwFFDslHjps0V5kYrdRRAupOEshxg1yVHA7MyJoL5dz+l+4VXrVF
	S5t5ND/ds9akIPGB6Cbh5ThWn4ca6e/CK4A3sw6glrOHB3BokmVJCY+HUqP8B159/ZyAB5qb/Zs
	QZ1CAhEZBfZ3DPy9y25/RrgamgQ==
X-Google-Smtp-Source: AGHT+IGQeXBOoeK68ALXLYtOAYAecYc2sLvZHTeB0Ue7szRlW3hJU4FCo/iL21WNNcmTopTbWW8RtA==
X-Received: by 2002:a17:906:6a1f:b0:ae6:f087:953 with SMTP id a640c23a62f3a-afe28f8581cmr819070766b.12.1756029518977;
        Sun, 24 Aug 2025 02:58:38 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe79fba62dsm41314766b.100.2025.08.24.02.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 02:58:38 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/4] staging: rtl8723bs: remove REG_EFUSE_ACCESS_8723 and EFUSE_ACCESS_ON_8723
Date: Sun, 24 Aug 2025 11:58:29 +0200
Message-ID: <20250824095830.79233-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250824095830.79233-1-straube.linux@gmail.com>
References: <20250824095830.79233-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macros REG_EFUSE_ACCESS_8723 and EFUSE_ACCESS_ON_8723 are redundant,
both are already defined in header files without the _8723 suffix. Remove
them and use the marcos from the header files.

rtl8723b_hal.h:138:
 #define EFUSE_ACCESS_ON  0x69 /* For RTL8723 only. */

hal_com_reg.h:35:
 #define REG_EFUSE_ACCESS 0x00CF /*  Efuse access protection for RTL8723 */

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 36680ecb5897..45cd2291f83d 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -568,13 +568,6 @@ void Hal_GetEfuseDefinition(
 	}
 }
 
-/*  */
-/* 	The following is for compile ok */
-/* 	That should be merged with the original in the future */
-/*  */
-#define EFUSE_ACCESS_ON_8723			0x69	/*  For RTL8723 only. */
-#define REG_EFUSE_ACCESS_8723			0x00CF	/*  Efuse access protection for RTL8723 */
-
 void Hal_EfusePowerSwitch(
 	struct adapter *padapter, u8 PwrState
 )
@@ -609,7 +602,7 @@ void Hal_EfusePowerSwitch(
 			} while (1);
 		}
 
-		rtw_write8(padapter, REG_EFUSE_ACCESS_8723, EFUSE_ACCESS_ON_8723);
+		rtw_write8(padapter, REG_EFUSE_ACCESS, EFUSE_ACCESS_ON);
 
 		/*  Reset: 0x0000h[28], default valid */
 		tmpV16 =  rtw_read16(padapter, REG_SYS_FUNC_EN);
-- 
2.51.0


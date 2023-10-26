Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88335F9C7
	for <linux-staging@lists.linux.dev>; Thu, 26 Oct 2023 05:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B06W0p7Y"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9bf60bba6f8so14845766b.0
        for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 22:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698299016; x=1698903816; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vZtVCTK7d+6aSVA0zIPbMt/ewE8ripYxAkjP40CJ1l0=;
        b=B06W0p7Yq6HyVleIXoOeB+Rj0X5RNbTR4apRL9DoV4fNU7SjxXQgzcXmxN+UY7G8vw
         czjXwpRbeK4akFez8KgqnaGy+QeabvcNVfyDvpad+khIA+kec1z+hJXiwyPb4r1t5DmZ
         4pJSW9htxgVAKgS+18q4/vvbaD3Yyxmn9662aw+Zq4IdSaLCIFQNcOmL3T0mSN+hYG52
         Y0hSV8mNkCtCEI16R8o+qp3VbJa+o6fL0QqCjYyO6nlzaF0GSo8Z5YVCrE9IicZLRiVr
         kBI4uhVNAiDBEeeZngP1zSzWTTjH8XPF0EvgtYMsT3zeRzqNgXE07zH4oQp19jE8suPw
         +GzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698299016; x=1698903816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZtVCTK7d+6aSVA0zIPbMt/ewE8ripYxAkjP40CJ1l0=;
        b=mSHNW53MLFLkdF8vCNnM4atdTCTgEz4WTf0lYpkXHl5iBbMhyctuW0DRtcKoQ04lZr
         Qv1F0rCCUxtwi+I+lxcxK7AROL31kb6hKG+yeaLlCzz3ZdQaMWKVoPjuTqQUa/veggCX
         JgXqk0iXsvf2qYB26SKgtoo9BLyBuoUrP28+u6sXgh3h61k2a9Q2xYo8a+ItPetQ08Np
         Y2DvzS0uY0+P9fnDPJu6JVajqtf3uBTnD3Y2y4GQoT06U5ik4lk5Z/iNGK6TCJykXVDk
         z7D0k6RT3O2WNNmU6c+zT/M3zNpzPwBYOz+7RZAHj3XK403+g1YJucNjO6cC7HQ127lO
         uqDw==
X-Gm-Message-State: AOJu0Yw83vci3qe/8bIbjdBCmg6o8HQBI8zm/j2dfscazgh53viflacI
	xlX69kF9xJs80lnivhlYV7k=
X-Google-Smtp-Source: AGHT+IEuJRMJgaGaNRyyTxMHSBFN4+cCZOwoVzmjfcPTxqkb3D7NfOhx2aZT0HmZgAsO0Zlo0u0DIA==
X-Received: by 2002:a17:906:cb:b0:9b2:bf2d:6b66 with SMTP id 11-20020a17090600cb00b009b2bf2d6b66mr11779782eji.7.1698299015576;
        Wed, 25 Oct 2023 22:43:35 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id gx13-20020a1709068a4d00b009ae6a6451fdsm10964024ejc.35.2023.10.25.22.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 22:43:34 -0700 (PDT)
Date: Thu, 26 Oct 2023 07:43:33 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 01/10] staging: rtl8192e: Remove HTIOTActIsDisableMCS14()
Message-ID: <7ff3c7f8daf9bccb004129fdc1128ca0b0cb4e70.1698295861.git.philipp.g.hortmann@gmail.com>
References: <cover.1698295861.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1698295861.git.philipp.g.hortmann@gmail.com>

Remove HTIOTActIsDisableMCS14() as it always returns zero which leads to
one evaluation that is always false. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 00b21542ddc3..18659408bb69 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -207,11 +207,6 @@ static void HTIOTPeerDetermine(struct rtllib_device *ieee)
 	netdev_dbg(ieee->dev, "IOTPEER: %x\n", ht_info->IOTPeer);
 }
 
-static u8 HTIOTActIsDisableMCS14(struct rtllib_device *ieee, u8 *PeerMacAddr)
-{
-	return 0;
-}
-
 static bool HTIOTActIsDisableMCS15(struct rtllib_device *ieee)
 {
 	return false;
@@ -696,10 +691,6 @@ void HTResetSelfAndSavePeerSetting(struct rtllib_device *ieee,
 		HTIOTPeerDetermine(ieee);
 
 		ht_info->iot_action = 0;
-		bIOTAction = HTIOTActIsDisableMCS14(ieee, pNetwork->bssid);
-		if (bIOTAction)
-			ht_info->iot_action |= HT_IOT_ACT_DISABLE_MCS14;
-
 		bIOTAction = HTIOTActIsDisableMCS15(ieee);
 		if (bIOTAction)
 			ht_info->iot_action |= HT_IOT_ACT_DISABLE_MCS15;
-- 
2.42.0


Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439D62C88
	for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 10:29:28 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id v127so11401813wme.5
        for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 03:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nn3dK2lrRQWHJZn3a/UoWw56mtNL1un49nU+kc/wZlU=;
        b=FEVDJs4CiTjfOWO2zw+hb4HZe1BoSZMbOtDHhvB+t00ayEN2CM/JPLjTz2Fu77/tRD
         n+6Py7CMp6DOKXNJhy1c98JzzLAoFFwsEhenuz3sfILpU2biF5rcgVlOsYPgGeIB3CA6
         hD8atrOzkFfgnRsU4hcRufW5KtEiD8k59T4wMcDJkeopwjc4LYYHw7aCX6Vdi8CFeXxj
         MlVEWrcXrEMm/Ry0ggEPQth5iKPQkdphHssRLh8+FOLDAJXPkQnuhqkPfQZ/coaTQF6a
         bAqIwInBsvCbU/vTYyGLoyuBAKWaVbW6xJGMr7L7tLusDtXLgEzYhVeK0brwDuUsl2X6
         WW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nn3dK2lrRQWHJZn3a/UoWw56mtNL1un49nU+kc/wZlU=;
        b=1WneW+b/nmEM489dowiUoQTadoAmfyfbtcBWmf2Rq4d2FcHuptmmkhDtFj0Aexlk+g
         FGSp1nKBqvuCMLMKPQEMX690bYNkQNRrOblJlsNDmDy3pU0bT28cmGLPOlWUiyQvL+mm
         8Llrzb7B3uEj+ARodRNdEtmV0XADBRZtOdBVafOJTJ98AVIiLKBM6+w4MaXxlmogfCzU
         qFGX20n4aU1epi1AlsoXD/sc9NEvfD7bo3yFRd3Iwnoae1DnWjJsT3WSE8DN+dSUSMbT
         +l3FF4tbWvancZPt9UxrQ09pnwPBsoz5gAa7exWmF8Yf+np42XLNPAvc8SG3iMmwmyrU
         fDFw==
X-Gm-Message-State: AOAM530QzH95ZodrdMWZ4hdrQIWTth9ZnNqwuqtNU0ws/rpRHxCPTPK2
	TpjxMbn4pt5JBtzdayDS3/Gh0Hnlu7Q=
X-Google-Smtp-Source: ABdhPJxy40EYyWJEHtikPbxU46Fp5uZaiaanKm3oLwJstJ0t5M9gwy8tVKX5hu8LU9m2rCpPmrvJzQ==
X-Received: by 2002:a1c:c908:: with SMTP id f8mr5078203wmb.142.1634639366322;
        Tue, 19 Oct 2021 03:29:26 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id i8sm11365026wrv.47.2021.10.19.03.29.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Oct 2021 03:29:19 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name
Subject: [PATCH 1/2] staging: mt7621-dts: change palmbus address to lower case
Date: Tue, 19 Oct 2021 12:29:14 +0200
Message-Id: <20211019102915.15409-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hexadecimal addresses in device tree must be defined using lower case.
Change missing one in 'gbpc1.dts' file.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-dts/gbpc1.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/mt7621-dts/gbpc1.dts b/drivers/staging/mt7621-dts/gbpc1.dts
index b65d71686814..36e1e507f241 100644
--- a/drivers/staging/mt7621-dts/gbpc1.dts
+++ b/drivers/staging/mt7621-dts/gbpc1.dts
@@ -18,7 +18,7 @@ chosen {
 		bootargs = "console=ttyS0,57600";
 	};
 
-	palmbus: palmbus@1E000000 {
+	palmbus: palmbus@1e000000 {
 		i2c@900 {
 			status = "okay";
 		};
-- 
2.33.0


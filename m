Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03D7259E
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 14:09:58 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id p19so4605395wmq.1
        for <linux-staging@lists.linux.dev>; Sun, 04 Apr 2021 07:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LOA+21vzY0bmS8hxfo90qK5+QTR3YadbSYJH3ev5WXU=;
        b=geC43GSlEmn6/QX/7D+HM7Tvjkv6H2cFHdox4734ap2n7xErKGv4pFaVcQoHjO3wJl
         SL4wWGr4UIecOB9G3HTI7ew6o1iQTozU32ts+qNl2/wc9EpxtkCqBiaafhmLcYkGq2wO
         pOHhwl075Gk53XEhUp853lwKlWoKsyYEniPuFahMMVjdlErQaQuEjKebvS9UF7MvFepN
         /Mx4VW8e9ibNYbeBN9FHCDEYq/jMdnDSVm88pZyHftGOw0f4XqQLWoixQU1OKU+XWLAq
         +I3zECsWjJ82FpNHu8svVw+uw4jQRSOk9yXZg6ACGO67QexbokGb3JVMMH6vWAVoQj2R
         z6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LOA+21vzY0bmS8hxfo90qK5+QTR3YadbSYJH3ev5WXU=;
        b=Zcm3bsmH5G/De6PiUw1IngpMCrp04L8UJ05+30JRrix98B8tSayaT31UgOAgpM0Ig2
         LM/slKoB1utGRaR8DPNvpEDVrI26FNNLvGtnXoz0nrvNz10w5JIuwCjo2OBMe5E7s5sH
         MwTHc4mP35NV9ztl+RO+Gz2tGtLVvmUKNoIK/ZRxoq/CNlJA8S3b810PqILcOrc0n/Nq
         ihzshxz33V8TIM0gEBROA4/FXVe1GTCHv7f7DgkjMsW1u+Ak1J0+37L9zRQ9O3py7NxY
         eH+BZjQph9d5sl/NYeHjfQZkFjhQfkcGC5AMk5J8tw5YBAnau441rXIjpEI9B4CaSFZj
         wt1g==
X-Gm-Message-State: AOAM531M64oW6qCxPaLU0OEyLNGygAghm/YzstxP3Uj0BWyRA6OE0QOQ
	2sdom1L9GfZs+L2Z0hxatZE=
X-Google-Smtp-Source: ABdhPJwRYryuSqTyUfUjwJBz/cfsMNsZvB0tCW+s0hPhlDJAHqveBrRVuxhWui4FNbPXGIYJp87oLw==
X-Received: by 2002:a1c:28a:: with SMTP id 132mr21936001wmc.2.1617545397329;
        Sun, 04 Apr 2021 07:09:57 -0700 (PDT)
Received: from agape ([5.171.81.112])
        by smtp.gmail.com with ESMTPSA id o2sm19546681wmc.23.2021.04.04.07.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 07:09:57 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v4 04/30] staging: rtl8723bs: fix line exceed warning in core/rtw_security.c
Date: Sun,  4 Apr 2021 16:09:20 +0200
Message-Id: <862862a3e309209e2508de0c9a1b5a02ce1312b2.1617545239.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617545239.git.fabioaiuto83@gmail.com>
References: <cover.1617545239.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the following post-commit hook checkpatch issue:

WARNING: line length of 149 exceeds 100 columns
61: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:729:
+			if (crc[3] != payload[length-1] ||
	crc[2] != payload[length-2] || crc[1] != payload[length-3] ||
	crc[0] != payload[length-4])

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 689419a76d94..663a8ea199ee 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -726,7 +726,8 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 
 			*((u32 *)crc) = le32_to_cpu(getcrc32(payload, length-4));
 
-			if (crc[3] != payload[length-1] || crc[2] != payload[length-2] || crc[1] != payload[length-3] || crc[0] != payload[length-4])
+			if (crc[3] != payload[length-1] || crc[2] != payload[length-2] ||
+			    crc[1] != payload[length-3] || crc[0] != payload[length-4])
 				res = _FAIL;
 		} else {
 			res = _FAIL;
-- 
2.20.1


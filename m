Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A3BA52
	for <linux-staging@lists.linux.dev>; Sun, 12 Jun 2022 08:12:59 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id y19so5637924ejq.6
        for <linux-staging@lists.linux.dev>; Sun, 12 Jun 2022 01:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XUhoNTZNrsEIdOu15ISZAAXLEM8PaGxpo0lgCC9aE40=;
        b=DhlnZCj0oLT946aOSSCceCxFOezw9yscz0NjCzFT1taPIc0mrGbd+wiV+N7A7BRSt/
         M3rWZu/VeugJuf4AcdN68G4dKeit9O0aqJtfFC6xEC4NIR1VDEc2529rw8bvdQ6x7rzX
         r981SNcoGB1LIczlwR//joaQkMK+d8Xr9yJlw5Y40FlcjJywj1iVeSpFEnbemFkAhX01
         lBD7YdpOcnjbUMa06hz3jYhyxeTrfVhNGupTRMYfoAiDYC4xUsiinZVZwHHV6gL81/vP
         fFVzMyoyYbMqz/miVEyn+wmCqzCrtHDTeU5B8apgChszkX9z7FeHxMVhIjaQBD+AZuKY
         xLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XUhoNTZNrsEIdOu15ISZAAXLEM8PaGxpo0lgCC9aE40=;
        b=eySUfGVYZZDu+qQT0N7RnzhAx9roIaF9ZG4Nb42QQc899yMetVten5zNEfwzFSj0dP
         WnpyydQofE+iTdDKHHExzoGp1qOdnyIJb6CDZaBM++jEysZUoVZqoPeRFLNnesBQBBgp
         38BSXW7n6Nr+im2ohzVb/+kTRDrQNMMhA6Y8tHUwHMe6wY4T/hOYX++Yc+Z5fQ0zUlb1
         +9uuXEA6C419sopWv/i3tEjNS9qd5xIVTrRvt5jdEiXHBGVphq0xGytxbAoQ/V87vgkG
         uJP778eEirzlx1yifdKld/RIKN+W/nXAoX4oQuOt0kvFKhWSLdbjxX5+xnSC9xt8FDnL
         NF1A==
X-Gm-Message-State: AOAM530sNbpPabpBLm1DI/h03AMLfl4YLLiZbbSHJR0h1AhaCfxjhRkf
	Jt5tdfl14aztvUw2Lj7tESU=
X-Google-Smtp-Source: ABdhPJzvOmY7jP6600tRAUbA7A8owBl/VhRYX17MzGBERdvYcaVG8ZbPlUi0jAFQXEbcjXih+YXaRA==
X-Received: by 2002:a17:906:6c82:b0:709:f868:97f6 with SMTP id s2-20020a1709066c8200b00709f86897f6mr49484659ejr.555.1655021577739;
        Sun, 12 Jun 2022 01:12:57 -0700 (PDT)
Received: from nam-dell.fritz.box ([2a02:8109:afbf:ed88:bcf1:6e8b:57bb:87f1])
        by smtp.gmail.com with ESMTPSA id o18-20020a17090608d200b006ff802baf5dsm2130637eje.54.2022.06.12.01.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 01:12:57 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	namcaov@gmail.com,
	phil@philpotter.co.uk
Subject: [PATCH v2 2/2] staging: r8188eu: remove unused macros
Date: Sun, 12 Jun 2022 10:11:44 +0200
Message-Id: <ea62e595714a7cc24204643b90045d0c088aea8c.1655019752.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655019752.git.namcaov@gmail.com>
References: <cover.1655019752.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro LE_BITS_TO_1BYTE and related macros are not used anywhere.
Remove them.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/r8188eu/include/basic_types.h | 31 -------------------
 1 file changed, 31 deletions(-)

diff --git a/drivers/staging/r8188eu/include/basic_types.h b/drivers/staging/r8188eu/include/basic_types.h
index cfd15ac1d9c0..0b71e2c6e41a 100644
--- a/drivers/staging/r8188eu/include/basic_types.h
+++ b/drivers/staging/r8188eu/include/basic_types.h
@@ -13,37 +13,6 @@ typedef void (*proc_t)(void *);
 /*  TODO: Macros Below are Sync from SD7-Driver. It is necessary
  * to check correctness */
 
-/*
- *	Call endian free function when
- *		1. Read/write packet content.
- *		2. Before write integer to IO.
- *		3. After read integer from IO.
-*/
-
-/* Convert little data endian to host ordering */
-#define EF1BYTE(_val)		\
-	((u8)(_val))
-
-/* Create a bit mask  */
-#define BIT_LEN_MASK_8(__bitlen) \
-	(0xFF >> (8 - (__bitlen)))
-
-/*Description:
- * Return 4-byte value in host byte ordering from
- * 4-byte pointer in little-endian system.
- */
-#define LE_P1BYTE_TO_HOST_1BYTE(__pstart) \
-	(EF1BYTE(*((u8 *)(__pstart))))
-
-/*Description:
-Translate subfield (continuous bits in little-endian) of 4-byte
-value to host byte ordering.*/
-#define LE_BITS_TO_1BYTE(__pstart, __bitoffset, __bitlen) \
-	( \
-		(LE_P1BYTE_TO_HOST_1BYTE(__pstart) >> (__bitoffset)) & \
-		BIT_LEN_MASK_8(__bitlen) \
-	)
-
 #define	N_BYTE_ALIGMENT(__value, __aligment) ((__aligment == 1) ? \
 	(__value) : (((__value + __aligment - 1) / __aligment) * __aligment))
 
-- 
2.25.1


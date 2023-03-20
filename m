Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323F61846;
	Mon, 20 Mar 2023 10:33:41 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id x3so44644244edb.10;
        Mon, 20 Mar 2023 03:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679308419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tOFujwsyOGt9GhsEE3aCRDS72GxoqdMqe3lDud64Beo=;
        b=Gk7ccBxsShpdxS6FXvhbKAh73kN/5Tc3xOjfDW5oi3gXvHmQbSDk7n6W4LOZKHjIIs
         RBdruB+/XXmxL8QGWThTnPXoNWleXrgIvmXcuRoukPz6GjhBsaxME9Nsbhv0yGbW+J1W
         VR9gIPbUUkwxgL1plZivKsEsrseNozuKDgKbkeOQPAFrXl2YwIP+7MMtOYWdBrqBVt00
         rjxUuiQYbl5kIvBBIThkPi34XQ6D6jbTkUMgTtf4oQWNEpbnFGhtDGW87bLPgN4ADUM6
         HhRCAAoOEHHvlkntmLLIm6nYyac9KQV+EOSxcu0EhkCsGiMzUpwGvdAi83I3o02pe8pD
         LB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679308419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tOFujwsyOGt9GhsEE3aCRDS72GxoqdMqe3lDud64Beo=;
        b=ifooLds3vjX8pRhmoGbwpXDZUQFA7MPtqxGSqEj0JWCy7PuBuqfwJzfs+3XACMUtP0
         SFmHDcqpYcH6kCOON2iQScOmv3UAK7UvOKmpSOLj4O2qfBo81/l570HfGwjImo95NlWx
         Olpf+04N0jhzJsTDql15a7W3W8/sAIig5/Oz2huiRNDe9sRfP/xbhqbrN4TRJEbdOU6p
         KRTdA/r6vDxsBTVCwV+p0YyxWE+RVgryuWKOIkUcF7OKKTLSzikvfS2cRHTa7y4t92EF
         4BJAwKF42wZvJiHdm2dTfLYU1UA1Z/HAYggdzCbvTqbRB4BSeRx3lK/MGTxWA65/Jaks
         3LwQ==
X-Gm-Message-State: AO0yUKXwUlzaVQVTBfKWMj3ntoRe+vnYt5ruwSLgtltRm+D/z3WuuapB
	J+9oJoXO8dwPWs9ZaD8UM0E=
X-Google-Smtp-Source: AK7set9nSQeA7JRgDmJtrT7oBHU1y5S0GSXNbV7CoIzE5A2XY8Zuhoz7zDNsfREy+xLY504f2j3XbA==
X-Received: by 2002:a05:6402:110c:b0:500:4062:99f7 with SMTP id u12-20020a056402110c00b00500406299f7mr11263028edv.32.1679308419433;
        Mon, 20 Mar 2023 03:33:39 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id x92-20020a50bae5000000b004fa19f5ba99sm4687710ede.79.2023.03.20.03.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 03:33:39 -0700 (PDT)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: gregkh@linuxfoundation.org
Cc: outreachy@lists.linux.dev,
	parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	drv@mailo.com,
	dave@stgolabs.net,
	yang.lee@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	eng.mennamahmoud.mm@gmail.com,
	Julia Lawall <julia.lawall@inria.fr>
Subject: [PATCH] staging: most:  use inline functions for iface_to_hdm
Date: Mon, 20 Mar 2023 12:33:35 +0200
Message-Id: <20230320103335.6479-1-eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert `iface_to_hdm` macro into a static inline function.
it is not great to have macro that use `container_of` macro,
because from looking at the definition one cannot tell
what type it applies to.

One can get the same benefit from an efficiency point of view
by making an inline function.

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
---
 drivers/staging/most/dim2/dim2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index b8bd01ca1f11..21d1c9f24c3d 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -108,7 +108,10 @@ struct dim2_platform_data {
 	u8 fcnt;
 };
 
-#define iface_to_hdm(iface) container_of(iface, struct dim2_hdm, most_iface)
+static inline struct dim2_hdm *iface_to_hdm(struct most_interface *iface)
+{
+	return container_of(iface, struct dim2_hdm, most_iface);
+}
 
 /* Macro to identify a network status message */
 #define PACKET_IS_NET_INFO(p)  \
-- 
2.34.1


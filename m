Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861C37481;
	Mon, 20 Mar 2023 20:52:21 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id eh3so51918005edb.11;
        Mon, 20 Mar 2023 13:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679345539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nMkyKaBF1NH7XDsykqLPFfK55LraDVcpYKZcvVEU3WY=;
        b=lOJjKk9zO+FkAD8VnA6Zeq9pRfXsjdkf3kmK68gBqFYSC6fOqduGaFUVSLTXCxxtaE
         sPv2hutFQz6SkUUTM4zvF21hL0XlKpA//LHJV+aGlY9kylMmMrBxoFop6Kz3IAU3V2pT
         XEeHLbIP2l9YyZeFCi7DeBJVzJwsnBS2JixfRp8eYPJSfsWkL4QSqfo06ol5uYNz1hTa
         WVhAzI8/p5CNt/MaW8lro6sqIUaZeweNiKiRHC3enudKBULvDRnMZRJDU+taOrBvRcJk
         JbIB+PMwMH5MLpc2GWqLW5L4baJA7aReNXX/CeGFGTzhsfcVacnw7V0w6Uhloj9WvlQ1
         gG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679345539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMkyKaBF1NH7XDsykqLPFfK55LraDVcpYKZcvVEU3WY=;
        b=n4PJ6RmKIWZXhHJ+YM0UULxxatyCN0yColeFhPIEJFvtoh8MWZbij4B6ZX+7IjW8dR
         3InW4xxYsNmmHj/YNXAZ/G0vy2BjK4z7Osigh6jZ84T7Fpjp8OVKiYOSWu2q0oA9Pxza
         LtqLTuydtSU1FpY6GObDxFycuyZ7jZxkGJvaAiXr5KQz6btMRx+ia1T8vrIGxAndOR2H
         XF66qWyjDya0oGQIgcK77zHLWWz51dSY6/R1VcOBi9RcywHSa8SsXHfsKqhJZ3KAZJEW
         2FsoWAKnDKWxtEFJOZUlnBm3w6yMaot+l7gtaIlPWKes0uj+M/pQkxW3EIm1XuVF3ZxB
         ATig==
X-Gm-Message-State: AO0yUKX3fzxBRu/nVkqrpu3VcpS2QfLJUouu4eIOYeavegP/Q0mI0hUO
	BcOMI6XXET0Z7kBtdR0d62c=
X-Google-Smtp-Source: AK7set9G2kN3KW3MddP41mpzya4DIMERV5fuWbVb3zzbOemTkFnyi/mm+7sdjvjl3EL4n5W4ikHN1A==
X-Received: by 2002:a17:906:7e14:b0:928:c92e:d112 with SMTP id e20-20020a1709067e1400b00928c92ed112mr385173ejr.50.1679345539624;
        Mon, 20 Mar 2023 13:52:19 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id g7-20020a1709061c8700b0091f5e98abd5sm4881925ejh.133.2023.03.20.13.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 13:52:19 -0700 (PDT)
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
Subject: [PATCH v2] staging: most: use inline functions for iface_to_hdm
Date: Mon, 20 Mar 2023 22:52:07 +0200
Message-Id: <20230320205207.20062-1-eng.mennamahmoud.mm@gmail.com>
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
change in v2:
	edit subject line.
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


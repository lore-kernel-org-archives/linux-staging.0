Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4636B1846;
	Mon, 20 Mar 2023 10:34:04 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id r11so44711839edd.5;
        Mon, 20 Mar 2023 03:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679308442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jyXaHvh3PY8IHwl5GxLGbu71tlZc+pch1b8iVrCo6DE=;
        b=Jwy+0qPwMydtrSsA7hiXPSIDqNMOpvtGOOAhgqiSO9moHO6Q4QiCGhpMhaC/9Y5Kk3
         KQYALgaF5uky7GpG5hCJwlrJ9TRX+hJsTbkl+vOuDmguRD/HrjjT5fI1yMRcfclWfMkt
         ZNLlgVfWvZO/zDb3NUWLSHZ0a91vvdvhhGsm0QQYdEWiTuehI5jRqepQb7guqwi+29RI
         LHW9jdCeQpvvaFZnu3zhGPG/fs4Bw3Ag3wxkRvD9c0+pCx5TMdkM/YYNkn1o1iTf2BGk
         uOMohOBXd9qC3kHT7CY8lR0rErVqsG82eBYEU0dVRzK59FsZo2MJMkx1ZKKXTF2JW0VJ
         KtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679308442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jyXaHvh3PY8IHwl5GxLGbu71tlZc+pch1b8iVrCo6DE=;
        b=XNjr3jPwAlHH0/uej9/e4hk3M+wqLKmLkguaToGWRCd1C7MW9YODbpUfBoaohcQIHn
         9IVz2zICBK3KbDBihUMPYtqkr/hbzkYzqLxWR4R4qjqC8l5dxiwEsDfnlfJ8lg50Zznx
         u/YDVx+iamlwzA1EtQXDGlIpjFq0rn8CSzU//nd5OFfRcAREFWz1PtUt4XRSJkorD0uo
         EVbn22k1mSNGji4mPRyqtp3iy1FBTbGn1I6SDouHnmNJUTnLH7C/UX1EHnKVd97vk6Bu
         o+1m1KoJP+4fROIi1Dzmcly6JTQnYP9g0T/7M8KMwkHnBzt66midYFb0b66JpRQsv/UQ
         nEmQ==
X-Gm-Message-State: AO0yUKW2CaoAYkNa8l/IvHMeLc4bWw64hBx2J7y1dFrQR9pLlZ6hL3MU
	VuzRo9S/hBTCpywZtH87uvg=
X-Google-Smtp-Source: AK7set8VMIexuzwTt80bCQk0xyZfFdxp5dI3+Y+2HxYnpIV3weV+kd53E+ilO7xsF5pYTfGV/pcoiA==
X-Received: by 2002:a17:906:a415:b0:932:e6d5:bd7c with SMTP id l21-20020a170906a41500b00932e6d5bd7cmr8915480ejz.20.1679308442507;
        Mon, 20 Mar 2023 03:34:02 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id v14-20020a1709063bce00b0093344ef3764sm2340213ejf.57.2023.03.20.03.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 03:34:02 -0700 (PDT)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: gregkh@linuxfoundation.org
Cc: outreachy@lists.linux.dev,
	parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	u.kleine-koenig@pengutronix.de,
	peda@axentia.se,
	srinivas.pandruvada@linux.intel.com,
	sebastian.reichel@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	eng.mennamahmoud.mm@gmail.com,
	Julia Lawall <julia.lawall@inria.fr>
Subject: [PATCH] staging: most: use inline functions for to_hdm
Date: Mon, 20 Mar 2023 12:33:56 +0200
Message-Id: <20230320103356.6498-1-eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert `to_hdm` macro into a static inline function.
it is not great to have macro that use `container_of` macro,
because from looking at the definition one cannot tell
what type it applies to.

One can get the same benefit from an efficiency point of view
by making an inline function.

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
---
 drivers/staging/most/i2c/i2c.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/most/i2c/i2c.c b/drivers/staging/most/i2c/i2c.c
index df53a4c4f850..4e85e681922f 100644
--- a/drivers/staging/most/i2c/i2c.c
+++ b/drivers/staging/most/i2c/i2c.c
@@ -44,7 +44,10 @@ struct hdm_i2c {
 	char name[64];
 };
 
-#define to_hdm(iface) container_of(iface, struct hdm_i2c, most_iface)
+static inline struct hdm_i2c *to_hdm(struct most_interface *iface)
+{
+	return container_of(iface, struct hdm_i2c, most_iface);
+}
 
 static irqreturn_t most_irq_handler(int, void *);
 static void pending_rx_work(struct work_struct *);
-- 
2.34.1


Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD66A1846;
	Mon, 20 Mar 2023 10:34:47 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id h8so44694444ede.8;
        Mon, 20 Mar 2023 03:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679308486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v0YON+Je37l5rNH4i+NhItyHzULx6NYE6uyGW+1TbDg=;
        b=qdGK3JLlynirCfpYsq2enpE1iu8iadQJO5cUlAxFy+JMKgkRgYTZLFG+u5KD546xQc
         T0XYJAFAd8hrmEKvI4todGkTV1qbnBGsSJ0Ur06KT9ta8qfSWenHR/6kM70bRYTEFBfN
         67uwHteZDRU6Apd6DSu3ABxOOi3i1eUn36ncxuRNa7jH+vmAlGishyu6fFSvK9KL2wL4
         u0zl15/MiZY01ESdPQOUogHJ3dsP9ychc+bgweae3v+LmVy+0uGZJ1qs624koV5bHXRs
         72SM5pVaBLekPuXrEm6x/ygEyzRBOen56LhCivprZ4bB1GYUqlbA2oNnweyC2GpbDs2N
         A7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679308486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v0YON+Je37l5rNH4i+NhItyHzULx6NYE6uyGW+1TbDg=;
        b=HKswca0PCsJvv4ngAOtCsoqS2xmI25kN5+70jm8p1qJrpqHEzZAhrj0ZqqxZHKfSTM
         aakraj21lTzAADmYAz7FIpYu+8vRkJyfCToJtNKSuEs8c5OQJnmS+f/d+voOEovdAZtm
         K4qVSim0pWh+oI4ExxWw9/xAy6B1LyDj6YE9QO071lGgWs+wNWdt2x6uwgZEi/S2RKQU
         vlPegfEVt3InWYlWTnB/VqEVG5lCt1/zluXQ7ZcMsAQX7n1KGS6fZg4trDZEDiGNhigK
         7stPy3g3oLxdgu0y7WUPeHrcgOLw0GiTgikPa3C5/PAPxuNggJmdfyVdMQL+dMQR32hs
         Fxog==
X-Gm-Message-State: AO0yUKV4X6viIR1mj0Z8stFXiWjQa6EdcquTNHZUARo2/lZHbdgq3FHc
	jn5xeMS7JcB9HrrwU5BvYk0=
X-Google-Smtp-Source: AK7set/yDflInru6nyu/C75gNAtSOaLhUN4WZSH7nppGQk6eU80Mrd5X0iVQ5sAQkHhWV9oUMAITYQ==
X-Received: by 2002:a17:906:40d1:b0:932:748a:f0ea with SMTP id a17-20020a17090640d100b00932748af0eamr8458784ejk.63.1679308486325;
        Mon, 20 Mar 2023 03:34:46 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id q18-20020a170906b29200b008c607dd7cefsm4235244ejz.79.2023.03.20.03.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 03:34:46 -0700 (PDT)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: gregkh@linuxfoundation.org
Cc: outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	eng.mennamahmoud.mm@gmail.com,
	Julia Lawall <julia.lawall@inria.fr>
Subject: [PATCH] staging: rtl8723bs: use inline functions for dev_to_sdio_func
Date: Mon, 20 Mar 2023 12:34:41 +0200
Message-Id: <20230320103441.6537-1-eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert `dev_to_sdio_func` macro into a static inline function.
it is not great to have macro that use `container_of` macro,
because from looking at the definition one cannot tell
what type it applies to.

One can get the same benefit from an efficiency point of view
by making an inline function.

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 490431484524..7ee821dbbae0 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -10,7 +10,10 @@
 #include <linux/jiffies.h>
 
 #ifndef dev_to_sdio_func
-#define dev_to_sdio_func(d)     container_of(d, struct sdio_func, dev)
+static inline struct sdio_func *dev_to_sdio_func(struct device *d)
+{
+	return container_of(d, struct sdio_func, dev);
+}
 #endif
 
 static const struct sdio_device_id sdio_ids[] = {
-- 
2.34.1


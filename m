Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76863224;
	Sat, 18 Mar 2023 17:52:58 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id c18so8412997ple.11;
        Sat, 18 Mar 2023 10:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679161978;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5I26wPYmJo/oU92vbPVh5xMmJlwNRBuQUe5Qw0zvmBk=;
        b=jSG57T5YZEWuLlDcSl/mqLJXWjPe/Rzdw5X+opAZMRPBpD68dP9BjfPNd1ezQNrcd0
         nRRBUMFk7/4jIADtIgkVRsPJoTqEwEMzF2Jv7t6AmzsNiCozY91V2Fr4j+UFK6HCseAA
         dcqFPxOUwM3foq3dsHdeTzDCBZLTt7f7Md+B9yXpqY6VdYikgkzwk1ATq81k+fWMuphA
         lb+hPfakXqHLnMw1C7jsl/BIP6jjezlzuTK2AWKtckqvfi4m8x1JGpKed7t17a1TFuN5
         ZImcKv0m+a6hF0FdLNBp2mBenBLhfgYeP5iQ9xas/apsW8fw7d0U/NvtOky7nQ2S7DJw
         U7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679161978;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5I26wPYmJo/oU92vbPVh5xMmJlwNRBuQUe5Qw0zvmBk=;
        b=RQI6n6QSOmfXYbuweFrvnnM75pVGG2oOvcnL3iN6AZvhn9kUnDajH2IUUv4JFNYSAZ
         OhINalE7XaVjFtOp4kNiZTma0rgHkeXddJso0Kl5toEi9YAdnHxRz6zOyGgSffRISRGI
         rXNJ9fGS/pE87GDPavzS+KT8GVmHDjSMwCwg2eQDSTHakurgbNx0qsn5BfRTVxApGYWI
         QwMChJLjmNhyvGgsYIMEC2dH8i3qiUYAeQxHLiKIZ4cYZfULsyCvDE3XgXNLthYxknq6
         /eQALunbMNKmi/mqs7YCX1mQ15RIh4vDy4WjKWkZn4A50KTQIMwcsUxfxF1fVl/Yosvx
         opCQ==
X-Gm-Message-State: AO0yUKUTaoybKae9t7MYazC4Qk+FBVRc7I8wuvaUuAIE5l/aieEk88Wv
	hxYnWnKQxccl3UqNOszps9M=
X-Google-Smtp-Source: AK7set8jdYiLH1aQ2/GgeOAEtwd9CA0dkiVwaqW09Fb0RZwzNwSJWmFzwcPydo0UOuzKQ1WzAQQ/XA==
X-Received: by 2002:a05:6a20:394e:b0:cb:9fcc:3f37 with SMTP id r14-20020a056a20394e00b000cb9fcc3f37mr15180975pzg.35.1679161978050;
        Sat, 18 Mar 2023 10:52:58 -0700 (PDT)
Received: from sumitra.com ([117.199.163.158])
        by smtp.gmail.com with ESMTPSA id x13-20020a62fb0d000000b0061a6f4c1b2bsm3608549pfm.171.2023.03.18.10.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 10:52:57 -0700 (PDT)
Date: Sat, 18 Mar 2023 10:52:50 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH v2] Staging: nvec: Convert to_nvec_led from a macro to an
 inline function
Message-ID: <20230318175250.GA49618@sumitra.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Convert to_nvec_led from a macro to a static inline function, to make the
relevant types apparent in the definition and to benefit from the type
checking performed by the compiler at call sites.

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---

v2: Change patch subject and description, noted by 
Julia Lawall <julia.lawall@inria.fr> 

 drivers/staging/nvec/nvec_paz00.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec_paz00.c b/drivers/staging/nvec/nvec_paz00.c
index 8b4da95081c8..9573ba762cdd 100644
--- a/drivers/staging/nvec/nvec_paz00.c
+++ b/drivers/staging/nvec/nvec_paz00.c
@@ -14,8 +14,10 @@
 #include <linux/platform_device.h>
 #include "nvec.h"
 
-#define to_nvec_led(led_cdev) \
-	container_of(led_cdev, struct nvec_led, cdev)
+static inline struct nvec_led *to_nvec_led(struct led_classdev *led_cdev)
+{
+	return container_of(led_cdev, struct nvec_led, cdev);
+}
 
 #define NVEC_LED_REQ {'\x0d', '\x10', '\x45', '\x10', '\x00'}
 
-- 
2.25.1


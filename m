Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5282F59;
	Sat, 18 Mar 2023 17:05:24 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id e15-20020a17090ac20f00b0023d1b009f52so12272090pjt.2;
        Sat, 18 Mar 2023 10:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679159123;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3lXTbycD+XrCLh65SDWOsxvJ1+CH6vIOW10lZRN8hiM=;
        b=FRQRAU7F1/1xGyZKIXn+/p/yr8Sl23ZrOjhxYxDTff89ZCX20RDutiCszWs+05eYQs
         Kcchz453BMgIvx+lGWQILEb1G4W4TciaJo5mG8ezfQhD4jJ0tG1Itx+yLPcqd4xj9w31
         OpI3Gmj+/v+AkhQWIaMuJwzHHiAA+Pimz5lDwxy4+oECbbtfK3qD5WgDgHBjOfrxohx3
         EN4eb4Y/JXBZ71M84v2bspnqL7qHYoULmkphcT1eOE0jEEacys4TqIxM8rGvhOUtuo2c
         Oi6wY3+Z/0rBiWmuVhmuf2DrVIWsRmwkcHHiQaqLg6Q6NN/TwYXpbkKmF5Dz6g13Ien1
         UWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679159123;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3lXTbycD+XrCLh65SDWOsxvJ1+CH6vIOW10lZRN8hiM=;
        b=Tku6ubxTgnMSmm4vb7AArTU2HGsuHn+zO9VH9JNdP9u3HYLY/lmRw6JraaNKVvcPKV
         uRFZcQKWdfJdOvqB7rboW4bQj+l9CFyaatOTFP3W8MHwnUIVHiXD9RVR/9MEdsBLsOQ7
         rrNBxPHjoxhatqCAsvkVrTIb4CN/em2sBSo193f1Zni5aYBPFRLIyt4aRRENCg5jGa0D
         O5dAeBBc9q/AlK4QIqXLk0R+FP36wrTFtnFeaZUywZaCp0Kt3YEZz61Y6e9KtoHUnQFB
         qia/wctq3sXQBvLusiGzBzS0FAddQaIRWa5lwnsfuTnloFnJp5wcZWLli705vDTqyaL5
         VcMQ==
X-Gm-Message-State: AO0yUKWCi6SUIwCBI5Le6mnbtBzU39/aWBFufyb5d2gC7u3suRAa86RN
	NRWPHUENqkj3mjEQBHNpJlQ=
X-Google-Smtp-Source: AK7set8U9cqHg+DEljwmJJP5GukTuUthxlsefZ9jdWXup8pbOO9wcJkbJKqc0mDXRLnptz1urd3lUw==
X-Received: by 2002:a05:6a20:a884:b0:d6:9674:4433 with SMTP id ca4-20020a056a20a88400b000d696744433mr10643972pzb.10.1679159123528;
        Sat, 18 Mar 2023 10:05:23 -0700 (PDT)
Received: from sumitra.com ([117.199.163.158])
        by smtp.gmail.com with ESMTPSA id m26-20020aa78a1a000000b005a8a5be96b2sm41454pfa.104.2023.03.18.10.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 10:05:22 -0700 (PDT)
Date: Sat, 18 Mar 2023 10:05:14 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH] Staging: nvec: Change container_of macro to an inline
 function.
Message-ID: <20230318170514.GA49181@sumitra.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The macro has the drawback that one cannot determine
what type it applies to by looking at the definition.
Hence this macro definition is not type-safe.

The inline function gives the same benefits as the
macro and only accepts the specific type of arguments.
Use static because the definition only requires it to be
visible in the current file.

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---
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


Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB257C;
	Wed, 22 Mar 2023 05:40:57 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id x37so9913561pga.1;
        Tue, 21 Mar 2023 22:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679463657;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IbpEc0TShRb+rRNJad+coLk/gTeDzfl9QacMb8n5DBg=;
        b=Bq4urczeX72wjoD4FS2uQMeJuTD3w253bS8qWgHfD+D+14e94gfR8Hr2Tzg6eg9Mw3
         lhFWt/LSdZS+xQdNIPuqcaLdZeQZKPyIrEEoi285Mr4tHsjxxbPotYx1sI3aevj2RWp2
         XopushWam3vNZ3VINzeWPNm8Vl5ZRaFSQiR/sUlrzUEUptZ+RQ/t7bzSGCgMw3NmXMA5
         fCHo7YlryhO6N2wZlXFekuRtU4aug5bFuM4crzVNOap08XjYuzZ2UvUeKpIcCxEwS+Tm
         9eFpErG1sYlPN91JaZI7N2907Bzf5p5YvlY90TxQJUrtOC9R3t9YQH2PcadT1HVB+dMH
         7/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679463657;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IbpEc0TShRb+rRNJad+coLk/gTeDzfl9QacMb8n5DBg=;
        b=SM3aOrFW3rgRQ4HPk4jbZhtgOYY0yGNodyVy7Z7VlDdTuJ7NI7HWuLHb4GQ8A5+Nqp
         Tw4iewNuHbQEZ3sG+vf3s8680LktaKGwm1PYSCrN4Dq08T04/B2ZlXknC3sGvuW95gK8
         EQvN2yZ4lqfKEEEWNNFdgVLt5oDADLdMs5a5WMQSN0zjk5OM6LbwGMwyLC8I+xDrMbHj
         6apRDZpFSSY00jiTI7t5QOXdcle4PU9zRzkqw6UOdG/rJtvAVz5HKYYpjj/5+37ZlA+U
         Rk0EsXVyrPgoPW01Lq1SsCeRLfLT1Ja9tbAK9HypLh8H183ZAmEmDdu8otKye3BTkPH/
         oPTg==
X-Gm-Message-State: AO0yUKVqWjJ8xprHbtN0PZWrSY2lrBO562IR0yYr8mtay5ev5ZUEJLwf
	TVZPbkk4pQxS5m45/Si/9k8=
X-Google-Smtp-Source: AK7set+NN53I6/4s45Kw4p+wbRQgS4uqcbyQ9nRR0hb5eWiEBtElyHIO/HgFB+LK8Hac9T4fmnjgpw==
X-Received: by 2002:a62:5255:0:b0:625:e728:4c5f with SMTP id g82-20020a625255000000b00625e7284c5fmr2018209pfb.22.1679463656765;
        Tue, 21 Mar 2023 22:40:56 -0700 (PDT)
Received: from sumitra.com ([117.245.171.219])
        by smtp.gmail.com with ESMTPSA id t10-20020a63f34a000000b0050f6530959bsm5905616pgj.64.2023.03.21.22.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 22:40:56 -0700 (PDT)
Date: Tue, 21 Mar 2023 22:40:51 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH v4] Staging: nvec: Remove macro definition to_nvec_led
Message-ID: <20230322054051.GA150453@sumitra.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove definition 'to_nvec_led' because it is only used once.
Rewrite the code directly in the calling function
'nvec_led_brightness_set'.

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---

v2: Change patch subject and description, noted by
Julia Lawall <julia.lawall@inria.fr>

v3: Remove macro definition 'to_nvec_led'
    Change subject and description,
    noted by Greg Kroah-Hartman <gregkh@linuxfoundation.org>


 drivers/staging/nvec/nvec_paz00.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/nvec/nvec_paz00.c b/drivers/staging/nvec/nvec_paz00.c
index 8b4da95081c8..55d59840fca4 100644
--- a/drivers/staging/nvec/nvec_paz00.c
+++ b/drivers/staging/nvec/nvec_paz00.c
@@ -14,9 +14,6 @@
 #include <linux/platform_device.h>
 #include "nvec.h"
 
-#define to_nvec_led(led_cdev) \
-	container_of(led_cdev, struct nvec_led, cdev)
-
 #define NVEC_LED_REQ {'\x0d', '\x10', '\x45', '\x10', '\x00'}
 
 #define NVEC_LED_MAX 8
@@ -29,7 +26,7 @@ struct nvec_led {
 static void nvec_led_brightness_set(struct led_classdev *led_cdev,
 				    enum led_brightness value)
 {
-	struct nvec_led *led = to_nvec_led(led_cdev);
+	struct nvec_led *led = container_of(led_cdev, struct nvec_led, cdev);
 	unsigned char buf[] = NVEC_LED_REQ;
 
 	buf[4] = value;
-- 
2.25.1


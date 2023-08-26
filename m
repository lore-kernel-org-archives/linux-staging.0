Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6376E190
	for <linux-staging@lists.linux.dev>; Sat, 26 Aug 2023 00:16:16 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4108974d60aso7251361cf.1
        for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 17:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693008975; x=1693613775;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D1cp+fyJaYel+OZ1knmXDOhGjnOwMl8kMcdgE1kpwYU=;
        b=bxbFe17VGOtxx88d/sgNi+lmDP6GYR59gRG3WovOBZieZXD+mhYvrCjCAFzY6l2eiJ
         ZoLRhxNqcmwR9IlIaS/ipjOq/5IWMCPol8QDyTSdVfqBrlPivA3PO/2LRYZG0AzWUoTP
         SnoOtk24k13WC2wkVhdFmW7kob+3Oa4CvfJpOWBRNYT+I+NzX3qX9v6m1hcOwvaO9tHW
         3xSdIHZsFwk8rrFgz8buaFdLwFfkI6r9YUhQdvFUKn/bK2/gcokrnyhXBszBmhroUacy
         jHLQ+dRE0Dwgoo9ehZFMOGTrCf7I41QB9bErtYEO20ZX7nId7mltxyM5kutWC1to1np2
         uIZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693008975; x=1693613775;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D1cp+fyJaYel+OZ1knmXDOhGjnOwMl8kMcdgE1kpwYU=;
        b=ibX4E6Os89OFkXdqD4JtaV5YlgfV+3OXBGFGiOuc+RZikF75g3X7DSbCTsLP8c8Qzb
         TWAmtNl0u3qdDGO70PN4sMyBwLeLZpyvWFYnQMFNRg7Pd4wyOd18clRKDinE6IaBwpN6
         7UXdx8SDgBSEYozVLJk7TiGU9xr/lB3WALIugtfutDSllESYp5RrEwJqSGczX+BFlWEO
         hNGep0w6Mc9D4ErF8/22Gzl7wIazkgHgSMqGeKjWtgthim2fu8PS6F6xdYICDFdN96Kx
         ZrhMvVOts7DiDCvjDP3FNY9jmsWS0cvewRnMgl2qqc0X0QrKg8HxaNq0tBFsHJbG6iDV
         5mqQ==
X-Gm-Message-State: AOJu0YxXeqHYaMc1kT0mHO3Mfc/NdUl0mf9hG4DJB1hhMVVjIyK8vGQe
	nqW9aruIkHiOPEf602Avfmg=
X-Google-Smtp-Source: AGHT+IGkT3JItBrPkBVmxUeW2f3DhVFy3RaN/KbkqNrcL7IWQ0QovlmKr/qYpxK06mSvbxA/P6Staw==
X-Received: by 2002:a05:622a:1048:b0:40d:78af:cf7b with SMTP id f8-20020a05622a104800b0040d78afcf7bmr25566413qte.22.1693008975075;
        Fri, 25 Aug 2023 17:16:15 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:82ea:8c7c:b784:3f92:988a])
        by smtp.gmail.com with ESMTPSA id dq7-20020a05622a520700b004120ae42859sm815831qtb.90.2023.08.25.17.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 17:16:14 -0700 (PDT)
Date: Fri, 25 Aug 2023 21:16:10 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH] staging: vme_user: fix check lines not ending with '(' in
 vme_fake.c
Message-ID: <ZOlESk0dI80Lsu1X@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed all CHECK: Lines should not end with a '('
as reported by checkpatch to adhere to the Linux kernel
coding-style guidelines.

Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
---
 drivers/staging/vme_user/vme_fake.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index a88d2c8a785b..dbaf050f88e5 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -403,8 +403,7 @@ static void fake_lm_check(struct fake_driver *bridge, unsigned long long addr,
 				if (((lm_base + (8 * i)) <= addr) &&
 				    ((lm_base + (8 * i) + 8) > addr)) {
 					if (bridge->lm_callback[i])
-						bridge->lm_callback[i](
-							bridge->lm_data[i]);
+						bridge->lm_callback[i](bridge->lm_data[i]);
 				}
 			}
 		}
-- 
2.41.0


Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4893C05
	for <linux-staging@lists.linux.dev>; Tue, 28 Jun 2022 15:24:53 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id t17-20020a1c7711000000b003a0434b0af7so5272673wmi.0
        for <linux-staging@lists.linux.dev>; Tue, 28 Jun 2022 08:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WcFMAgdziIll53iZkb94h130Il19T6Y6bJm+DbymwFQ=;
        b=JWdJ7nbLyzMBpijhEbXM7MypI0Qlwif+4xUbm0g9g+V/YVYSQIr0HmZpbz0eQcrndB
         mI2sAXvt/7l4TRY8ta671E+/2mL5XMGpL6BwPmet6b5Fb9JOZp+b9w3Bu++slccELRS2
         IcwWVvLlGH7Z/03Hip3s7OmCQialQeepCw7V5W4Uz3c48QUEV7hNO0vyVJP9dZTzfUT2
         zxzWbVANWZSglzHw9Yj8nBHWbXeK7A0AVb3PEgGMABpE85vPtf+LW7Z3/PeBDuMMzN71
         sl+tyLIpNadpjeyYTWTAefP80ypI+HVbHB8PuuMg0MxCz4ee9TaTAUaHHuT/2SIXuMnW
         D4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WcFMAgdziIll53iZkb94h130Il19T6Y6bJm+DbymwFQ=;
        b=T+7WyNykVSy0pfdvhOyVh5Piluw87yp9WvlaMvDAlGgaBWQJLC9tLPVGVjPF5d1K+b
         422mLEb8r7MUFiqYQ6mzwUm+LRKuBVWpIHBIWANqE5KMlzCAuJR7Yja3T7cLzA+YKKrM
         P7zrTZgdRby2n+eFb9dCLqZoOk5DB8/l4offfMirCta7nCGOWl4KRCZcfALHV2zoGIO5
         DFIjnArXeVRU7bQq7gNIDpMbImcRMBMqDFomcffHsm+XpVBSioVDg1G/zxHGhksNHBkW
         Wf+sMZIHAdpm2xdvq5Jahn86M+3zJl+0s7U2JAva8OGTj0BsC1CWERtxJh0XpfYN+Bn+
         PY2g==
X-Gm-Message-State: AJIora/wA89afc5jiO1xMbtHMmva/m2UJ4PYLbtdPvxbtx+2naBpBiWL
	toTloSJTMon3gwW51gWaGlQ=
X-Google-Smtp-Source: AGRyM1s/PznpZYnHETKAA6z+rPhfFUEY5Vbrhkca4T46fq9s4fRBlaZnd3AovhnmDAp0qaQq/vgLbQ==
X-Received: by 2002:a1c:ac83:0:b0:39c:87fc:5797 with SMTP id v125-20020a1cac83000000b0039c87fc5797mr162568wme.13.1656429892193;
        Tue, 28 Jun 2022 08:24:52 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id 3-20020a05600c230300b003973c54bd69sm21564221wmo.1.2022.06.28.08.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 08:24:51 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: clean up for-loop, remove redundant assignment to variable i
Date: Tue, 28 Jun 2022 16:24:51 +0100
Message-Id: <20220628152451.184416-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a for-loop that initializes variable i but does not use it; the
assignment is redundant and can be removed. The proceeding assignment to
pointer fw can also be moved into the for-loop to clean up the code.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 1d605e533e29..576dffa9d2cb 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -3510,8 +3510,7 @@ create_host_acc_pipeline(struct ia_css_pipe *pipe)
 	if (pipe->config.acc_extension)
 		pipe->pipeline.pipe_qos_config = 0;
 
-	fw = pipe->vf_stage;
-	for (i = 0; fw; fw = fw->next) {
+	for (fw = pipe->vf_stage; fw; fw = fw->next) {
 		err = sh_css_pipeline_add_acc_stage(&pipe->pipeline, fw);
 		if (err)
 			goto ERR;
-- 
2.35.3


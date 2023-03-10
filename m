Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EB2882C;
	Fri, 10 Mar 2023 15:51:37 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id bx12so5452751wrb.11;
        Fri, 10 Mar 2023 07:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678463495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7rAHD7fKN+d5LXJmYh701SPQypdto2hSUjcoVGtRUMU=;
        b=cYjWkG0i0JfbUWP2Y+8Ik/AMlSn1huUyNXYTvDdE6RHDKFhVt2nokYIRF0DWg4dLF/
         9R0+rGx7j0+MavmlFqN6xyYU+e+9B+KBLBQefEMLgrpo393qK+XoMmBhipvHVfaXaR9G
         u6VmWiqKMHxd67/ALrTg3GwhF8m8BI1hEU11L7YDtWCO2c+TQECZrH6TPg5FG7Mue8Yl
         bg4cpxSAbUnTkRMYHZtPwoGfQeOgKsFx2YArU8B1yW4VHbuafP6jUc2qZH4+SCIO5deR
         hcwtgHYNCKewkThTCjYS88drnP/JOSrqX+/AKm5ML6Z6aiyGT6RdO8oxgkzefYE2179v
         m5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678463495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7rAHD7fKN+d5LXJmYh701SPQypdto2hSUjcoVGtRUMU=;
        b=o9AWi/HywiAXrnraeQYBC3UqTIor0di1QCkNBtrBd/oR4RTzHW/zPuHOFl0pp0Qa9l
         dA1XTT58iOcNbOEWOH52UOqsFp49p6jmEEQk0HfSMM1nUj2Kc4hLzcNEeHgLnJ6yU0d0
         idOGsD7/EArgNHg2pQnmWpyqCvOEDRa0GvbxhOMzvs9dJ2CKgOgLVedH79UWPyaTNOla
         rjt6KkxDDu1HLkrF7XLNlemPceTN8roLfjSdlpiFLV8ttarN6gs/jIISNl5ZcY+Zb0e1
         uG7aJS6hj31ukdoIAeqGnTXgc8bk2rDmnzJesbMFmnuer7wtwtpsNA8exTxZ9m/4LJy0
         +sAA==
X-Gm-Message-State: AO0yUKVstWxjV6WGNuciCfP9kcjd/CQk7nbB1iSbJl4fwCSB/icGu6O9
	emQ6VsimC2Mv3oUpAH1ZKuXIj5PpupO3N1Zj
X-Google-Smtp-Source: AK7set+d7Q+0h2RUYMfZYXj6ucr0U0beV4MqE4yhacgerLbbG6Q064+eN+N6+rJ+eBQA10OxLrmbjA==
X-Received: by 2002:adf:cc8f:0:b0:2c9:23c4:8f93 with SMTP id p15-20020adfcc8f000000b002c923c48f93mr16353992wrj.57.1678463495023;
        Fri, 10 Mar 2023 07:51:35 -0800 (PST)
Received: from alaa-emad.. ([41.42.191.171])
        by smtp.gmail.com with ESMTPSA id t8-20020a05600001c800b002c7e1a39adcsm140139wrx.23.2023.03.10.07.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 07:51:34 -0800 (PST)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: outreachy@lists.linux.dev
Cc: vireshk@kernel.org,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	eng.mennamahmoud.mm@gmail.com
Subject: [PATCH 1/2] staging: greybus: Fix Alignment with parenthesis
Date: Fri, 10 Mar 2023 17:51:24 +0200
Message-Id: <b6521b9a75a4088d621246b436c7ec5d35365690.1678462486.git.eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix " CHECK: Alignment should match open parenthesis "
Reported by checkpath

Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
---
 drivers/staging/greybus/fw-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/fw-core.c
index 57bebf24636b..f562cb12d5ad 100644
--- a/drivers/staging/greybus/fw-core.c
+++ b/drivers/staging/greybus/fw-core.c
@@ -89,7 +89,7 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			}
 
 			connection = gb_connection_create(bundle, cport_id,
-						gb_fw_mgmt_request_handler);
+							  gb_fw_mgmt_request_handler);
 			if (IS_ERR(connection)) {
 				ret = PTR_ERR(connection);
 				dev_err(&bundle->dev,
-- 
2.34.1


Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C6570
	for <linux-staging@lists.linux.dev>; Sun, 23 May 2021 17:27:16 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id gb17so20028498ejc.8
        for <linux-staging@lists.linux.dev>; Sun, 23 May 2021 10:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2Ikx3Ey9eOOYgtxMhcsC4m4OpTqa4FgIx6H9D0TqkdY=;
        b=AEoDORobWuTNWflTFSIYDu2EfSJB0iclnL5RlmGaMrRD2WqJFzP7yByNk1sCZgHunM
         c4oohLU9mXf365+baLadGsme7aO0M5REZeSB3yFCQqs19aohcPNknNxfF/JhjtcTmVMw
         QVi8EG8GpI9eNdTv+poloyQuZU2QqsdbPgKh0Mcms+0kfeLtHKuzdhb1tENAsugvp5SN
         OWAjhhcCdAc/IqCZ6otK/OZpoQxq78gFpqliFQptmtLZAtayYnXYtNopwQn1aeNJwPIv
         KMZohZd2rCA8l5N88Im3zlAuQiX2VyIvmZThDmKRzJ2utt8RKPirpkp1hDM/+U7E3SNY
         ze4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2Ikx3Ey9eOOYgtxMhcsC4m4OpTqa4FgIx6H9D0TqkdY=;
        b=IB/IM5MngrNs9g2QzG1mD/aZ2d1h0g4UzC4+11+9ZVH62tS2fVDB+28ukU2gH26R9y
         YwOyvU7dc815D/OWYelLTqpbrRBarMPX7J3r3BMfK9LqbfiyX6qL+jwQj83fNgcLqI3t
         tg6HGqFQ1HTOFjKTPbsK8IzjiOhTnvc6UaoV9tznN/SOwIZhQhKOhvjpC46m9M04yXZw
         tjGFhuwSx5Bd6lT19spAhZtXDgPV1WwErIWlysxnvsOkfEjhZkq6oEAH4RTo7vIbB5hm
         qsXG1M7Tc5LN1RBNmtbdfBmG3IYAqtdLwo3CG790h/TsgCjGkYq6Td5SxlL7MUC8CPo4
         5FLA==
X-Gm-Message-State: AOAM530+0/nlSj26ZbwSg7ToccEOvRt9vXQXMik7WmT1lLFFqQGuHPcK
	gwcEMNOIawR4NhV4mzg3ido=
X-Google-Smtp-Source: ABdhPJyru8rs7+K4wve5Rz1o0cgb6xcJdRhpMnKGHlQegwjz+Pqd8ruOrMFZnZlSAlb10Fk2ZzgP0w==
X-Received: by 2002:a17:907:1b02:: with SMTP id mp2mr19053359ejc.196.1621790834735;
        Sun, 23 May 2021 10:27:14 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id q18sm7904186edd.3.2021.05.23.10.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 10:27:14 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: hikey9xx: Remove defined but unused macros
Date: Sun, 23 May 2021 19:27:09 +0200
Message-Id: <20210523172709.19181-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed defined but unused macros. Issue detected by GCC running with
-Wunused-macro warning option set.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/hikey9xx/hisi-spmi-controller.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/hikey9xx/hisi-spmi-controller.c b/drivers/staging/hikey9xx/hisi-spmi-controller.c
index 0d42bc65f39b..b64594e2a84b 100644
--- a/drivers/staging/hikey9xx/hisi-spmi-controller.c
+++ b/drivers/staging/hikey9xx/hisi-spmi-controller.c
@@ -21,16 +21,10 @@
 #define SPMI_APB_SPMI_CMD_BASE_ADDR			0x0100
 
 #define SPMI_APB_SPMI_WDATA0_BASE_ADDR			0x0104
-#define SPMI_APB_SPMI_WDATA1_BASE_ADDR			0x0108
-#define SPMI_APB_SPMI_WDATA2_BASE_ADDR			0x010c
-#define SPMI_APB_SPMI_WDATA3_BASE_ADDR			0x0110
 
 #define SPMI_APB_SPMI_STATUS_BASE_ADDR			0x0200
 
 #define SPMI_APB_SPMI_RDATA0_BASE_ADDR			0x0204
-#define SPMI_APB_SPMI_RDATA1_BASE_ADDR			0x0208
-#define SPMI_APB_SPMI_RDATA2_BASE_ADDR			0x020c
-#define SPMI_APB_SPMI_RDATA3_BASE_ADDR			0x0210
 
 #define SPMI_PER_DATAREG_BYTE				4
 /*
@@ -64,9 +58,6 @@ enum spmi_controller_cmd_op_code {
 #define SPMI_APB_TRANS_DONE			BIT(0)
 #define SPMI_APB_TRANS_FAIL			BIT(2)
 
-/* Command register fields */
-#define SPMI_CONTROLLER_CMD_MAX_BYTE_COUNT	16
-
 /* Maximum number of support PMIC peripherals */
 #define SPMI_CONTROLLER_TIMEOUT_US		1000
 #define SPMI_CONTROLLER_MAX_TRANS_BYTES		16
-- 
2.31.1


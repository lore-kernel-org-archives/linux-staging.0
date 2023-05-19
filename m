Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1927C395
	for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 03:14:30 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-64d293746e0so1098161b3a.2
        for <linux-staging@lists.linux.dev>; Thu, 18 May 2023 20:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684466069; x=1687058069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QgmUah9AmRN5xRowBiuNUq3Kw2yWXbCwwhfNF2+jE1U=;
        b=Uwnr/Cd4Xvb2Ky63sfePVNXU3kFgFG1/wrNqSEuO/4iWg7ZA6IBMa8efZLMRKXpfnH
         +bkG97pqyNUzJovNIWftt/hlmbV1oBDjOgPjc80b0TnFZHNJIuwWTlxdPrrIigJedcZQ
         nMKm3o/3PiWxySCiYxGH7/84cSRRoj70tE7oj8oSnsys6NcygPvstldAocSESH6ecXv0
         IgVgrdfWhHFq1rudPP3RcL5dbZqpCNWH4f5Hs1g/1Pwoju78KxEBW7yBv8sEAXqQHj1i
         1pdLao/l9QmHcqBCEFPcN3MBpt5n+molgfsSOrorMCAIcixI5wWGXdFFC9tdtXC8HHpS
         YnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684466069; x=1687058069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QgmUah9AmRN5xRowBiuNUq3Kw2yWXbCwwhfNF2+jE1U=;
        b=bBoC/Pj2YOeOCPJT0BWGhSMCgpt9r1ah1EhPZJZz4xbE6ux5+rnnLhVDms19Iq16bq
         YLvZ0sX6snx2sxIukCRXQewRxrKOUXioKwtMhnYFYxqg48SYD3akL9pRUGHtQyi4k8Ke
         bNsvIp/dMHL+c/wdiqget2loCLASQ3zgcAPY1ljgJZwU2VdzM2dW6gggT7KpHO+STxNv
         Z6sEPITboDtZ3FVp9npZoItQAARjIFwmxWZXGDRMXw1B78pEosIV1I1TKsVVmqwJHJz4
         kpE12vWGIgOpyMJl3Y5UAI2Lse7DEheHMHbWCIqV7yQF4WgOd0GfMBfgveB6ixutWN0P
         vtMg==
X-Gm-Message-State: AC+VfDySUgGYYx69wgePoj6vLpYU+W7Dt18X9RFH6iPJkRW6euXM8p8J
	uk6f/FjOj0FLNBXMJ3mld3E=
X-Google-Smtp-Source: ACHHUZ51LC78lb0BD6ilJInnWpzFy9kta4eIggJFnJtfgjbEAsfH0v7xKRdsV2kRwBv+CeixkyKiTw==
X-Received: by 2002:a05:6a00:1389:b0:623:8592:75c4 with SMTP id t9-20020a056a00138900b00623859275c4mr1543002pfg.29.1684466069333;
        Thu, 18 May 2023 20:14:29 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:682f:3808:8f78:7441:2406:8b26])
        by smtp.gmail.com with ESMTPSA id c8-20020a655a88000000b0051b4a163ccdsm1760024pgt.11.2023.05.18.20.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 20:14:28 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Deepanshu Kartikey <kartikey406@gmail.com>
Subject: [PATCH] Staging: rts5208: rtsx: fixed unbalanced braces around else statement
Date: Fri, 19 May 2023 08:42:03 +0530
Message-Id: <20230519031204.20058-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed unbalanced braces around else statement

Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/staging/rts5208/rtsx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rts5208/rtsx.c b/drivers/staging/rts5208/rtsx.c
index 2284a96abcff..47dacef0aaf8 100644
--- a/drivers/staging/rts5208/rtsx.c
+++ b/drivers/staging/rts5208/rtsx.c
@@ -399,10 +399,8 @@ static int rtsx_control_thread(void *__dev)
 				chip->srb->device->id,
 				(u8)chip->srb->device->lun);
 			chip->srb->result = DID_BAD_TARGET << 16;
-		}
-
-		/* we've got a command, let's do it! */
-		else {
+		} else {
+			/* we've got a command, let's do it! */
 			scsi_show_command(chip);
 			rtsx_invoke_transport(chip->srb, chip);
 		}
-- 
2.25.1


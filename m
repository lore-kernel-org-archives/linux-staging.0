Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B416E7480;
	Wed,  1 Nov 2023 15:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l8E/6pkr"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-98377c5d53eso1030249466b.0;
        Wed, 01 Nov 2023 08:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698852266; x=1699457066; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MR56JFaTSz3HojkL2pFJM5gDNujw4Oiu7ruy5pujofg=;
        b=l8E/6pkrMit845S3Qj2HeZaWbFOyuX5lFiAlTdXqSHak6qAUXNOTQuoRvIAKbxizNE
         AJQTunT23ETGdRRKhMgAl1ncuj5l0cuOUzQ6609cxCxGuPg8wjOrCqRIvD8TUIg+47Pf
         /+wqoSmRmVF2kJc0mp3hNGMXlmUJnTrDZbV3R7VU6TudXHRr27A/e7QM0UP9sWn2uLFU
         LeFHC4XOUNIhLk9V/dijw+3gjodXVgGQS7z6uspP5WkygvpI6qGt6R8RL59Fo4wHqxEA
         zrAwjnBmdRVgP95O1PtDKAoagmJCqHVlUCvKQTB2p7dA1H0Hl8BgXJi0iJy3bhEXXqr1
         Hw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698852266; x=1699457066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MR56JFaTSz3HojkL2pFJM5gDNujw4Oiu7ruy5pujofg=;
        b=LGSKBi4s69GY+dlcQ3HJODuda3P5w0QQoyTz8q1ZD9TpVIoAEB+D7dMHJUntsrxWtb
         WH/cAk7856kuxH4XOe9moCHVI9yYb7BTtNLT/wawdv2SMT5XnCZuzdZBTD2iwxb4NKbD
         J6lFUbrIxG1BKuX9rjMdTh9Yuq7cFutCvR+62tonwR9Bqw4UGFHwlJpbRzwi5244gGCv
         aRTttnGx0bjQRb0p0bSnDDXG0PpdRPC9ZkHjiJny7bgq4d4vmpP+vqRaCpkfZuP7dMPP
         Mj7llLRWWhGbSvBGqDbI5/HlYpeuJr2dUinfK8urqq3lsQMDUYGIwHnafqsr2PiVH8Jp
         5JZA==
X-Gm-Message-State: AOJu0YwLDlOOYMI4cbvhqMMnngVuiMR5Q8ubEu+rtMVkguGMbYyHEjyJ
	q3z36w2E9OUoYcnSk5LUGw==
X-Google-Smtp-Source: AGHT+IG06McQz3xQ9bs3PqKtzLwtYLm29nY/TyIOplo37JTu3OFaOpw5cUcGk9s6YXB+xPAlRY6zUQ==
X-Received: by 2002:a17:906:4fc8:b0:9a6:4f54:1da6 with SMTP id i8-20020a1709064fc800b009a64f541da6mr2108484ejw.57.1698852265584;
        Wed, 01 Nov 2023 08:24:25 -0700 (PDT)
Received: from localhost.localdomain ([105.163.156.68])
        by smtp.gmail.com with ESMTPSA id lu13-20020a170906facd00b009ad8796a6aesm50855ejb.56.2023.11.01.08.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 08:24:25 -0700 (PDT)
From: Dorcas AnonoLitunya <anonolitunya@gmail.com>
To: gregkh@linuxfoundation.org
Cc: anonolitunya@gmail.com,
	outreachy@lists.linux.dev,
	julia.lawall@inria.fr,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: sm750fb: Remove unused return value in display_control_adjust_sm750le()
Date: Wed,  1 Nov 2023 18:21:34 +0300
Message-ID: <20231101152137.10664-2-anonolitunya@gmail.com>
X-Mailer: git-send-email 2.42.0.345.gaab89be2eb
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modifies the return type of display_control_adjust_sm750le()
to void from unsigned long as the return value is being ignored in
all subsequent function calls.

This improves code readability and maintainability.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Dorcas AnonoLitunya <anonolitunya@gmail.com>
---

Changes in v3:
- Rebase patch to apply against latest branch

 drivers/staging/sm750fb/ddk750_mode.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
index e1f20379431c..4278f9a826ab 100644
--- a/drivers/staging/sm750fb/ddk750_mode.c
+++ b/drivers/staging/sm750fb/ddk750_mode.c
@@ -13,7 +13,7 @@
  * HW only supports 7 predefined pixel clocks, and clock select is
  * in bit 29:27 of Display Control register.
  */
-static unsigned long
+static void
 display_control_adjust_sm750le(struct mode_parameter *mode_param,
 			       unsigned long disp_control)
 {
@@ -70,8 +70,6 @@ display_control_adjust_sm750le(struct mode_parameter *mode_param,
 	disp_control |= DISPLAY_CTRL_CLOCK_PHASE;
 
 	poke32(CRT_DISPLAY_CTRL, disp_control);
-
-	return disp_control;
 }
 
 /* only timing related registers will be  programed */
-- 
2.42.0.345.gaab89be2eb


Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DF9111A5;
	Wed, 18 Oct 2023 08:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N12M9Uoj"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-53d8320f0easo11068608a12.3;
        Wed, 18 Oct 2023 01:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697616092; x=1698220892; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=30ULjp8VAyqZgr5itRchTkBiQGYWmRnWFZPnaPGlIfI=;
        b=N12M9UojByMsdyrc1ta1I7TXovUPO5GwQopz7cyuNYqvwzwqO66BAzW38ty/NQEnOs
         E92rpL4QZGSDOFN5jCBwuK8XLO4vUC9jHjGXBMGlltQCq5ZsDnpeJ3Og8PW0FxecdVI6
         juFjjbT8mDgjqbH6oEZwg0UAsnH/V1SqzKGDL+HpM9+zYOszPvBcJbs7eltCydgEHJ3Z
         3f/MDIjVxiYldF6JQlu8wtmoj7YTTuyCIm0DBWLnYmq4I8bdoIfWULokbsMU33DHhvo3
         XoETf/bS3LtdYDL618LGrla+U7eulp+REy4uRi3+FPBtoGcyASSHWwYwMZ6j7BGBm84S
         uO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697616092; x=1698220892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30ULjp8VAyqZgr5itRchTkBiQGYWmRnWFZPnaPGlIfI=;
        b=lnwFTcwUrXFWaDhrMYrpNTKUtUXglKagqXjTVs5Fqqjcf7DU/bErg+aFVWJX1JKHt6
         foqrFzA8v8ZGUikBdf5jtXSqkXvLL5xmfQoC/WlZd48+NsneR2618DY/40oXzXJHxzON
         tOMiMVHie+z6LEptDjNpb/A0ZLDzYldD29LidtGFS1xHVM8sje/IbDWafo8GzexzWeoA
         9+PEUYcl/EvKXZWckvUyDx3KLNd6QIllLVePNU1g8ZucIT/vW+xt+A0MKo+//IzPaCtc
         R3PYHcIRcjvlEV5Qt4xEM156DBAGuJ5vmWg/Y77fgzWihva9CK5VK6puzHrKxy4kF6Nk
         OKSQ==
X-Gm-Message-State: AOJu0YzjDqzIC4Rg8ksZHE7uRutomGt7YFERZTfysKHVMDX3wfOmGBdq
	BWPGK0ARzL958mr3gcHrPA==
X-Google-Smtp-Source: AGHT+IFO5HbNWvKe8y47ftHvUNTxHsza97HzHWo6CRd4IG8Kf9Ur5Z8NsFE0wLzrGk2H35KGEIhKqw==
X-Received: by 2002:a05:6402:50d1:b0:525:6e47:10f6 with SMTP id h17-20020a05640250d100b005256e4710f6mr3714476edb.22.1697616091949;
        Wed, 18 Oct 2023 01:01:31 -0700 (PDT)
Received: from dorcaslitunya-virtual-machine.localdomain ([105.163.0.227])
        by smtp.gmail.com with ESMTPSA id z96-20020a509e69000000b0053b67aba57bsm2428560ede.17.2023.10.18.01.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 01:01:31 -0700 (PDT)
From: Dorcas AnonoLitunya <anonolitunya@gmail.com>
To: 
Cc: anonolitunya@gmail.com,
	outreachy@lists.linux.dev,
	julia.lawall@inria.fr,
	dan.carpenter@linaro.org,
	andi.shyti@linux.intel.com,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Staging: sm750fb: Rename display_control_adjust_sm750LE
Date: Wed, 18 Oct 2023 11:00:50 +0300
Message-ID: <20231018080103.25555-1-anonolitunya@gmail.com>
X-Mailer: git-send-email 2.42.0.345.gaab89be2eb
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function display_control_adjust_sm750LE to
display_control_adjust_sm750le. This further enforces snakecase naming
convention for consistent naming style throughout entire file.

This change was suggested by Andy <andi.shyti@linux.intel.com>

Signed-off-by: Dorcas AnonoLitunya <anonolitunya@gmail.com>
---
 drivers/staging/sm750fb/ddk750_mode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
index f3f354831617..bcdd291d25c9 100644
--- a/drivers/staging/sm750fb/ddk750_mode.c
+++ b/drivers/staging/sm750fb/ddk750_mode.c
@@ -14,7 +14,7 @@
  * in bit 29:27 of Display Control register.
  */
 static unsigned long
-display_control_adjust_SM750LE(struct mode_parameter *mode_param,
+display_control_adjust_sm750le(struct mode_parameter *mode_param,
 			       unsigned long disp_control)
 {
 	unsigned long x, y;
@@ -125,7 +125,7 @@ static int program_mode_registers(struct mode_parameter *mode_param,
 			tmp |= DISPLAY_CTRL_HSYNC_PHASE;
 
 		if (sm750_get_chip_type() == SM750LE) {
-			display_control_adjust_SM750LE(mode_param, tmp);
+			display_control_adjust_sm750le(mode_param, tmp);
 		} else {
 			reg = peek32(CRT_DISPLAY_CTRL) &
 				~(DISPLAY_CTRL_VSYNC_PHASE |
-- 
2.42.0.345.gaab89be2eb


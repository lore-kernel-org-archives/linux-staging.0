Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644B2F9CD;
	Sun, 15 Oct 2023 20:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZA6KzyzE"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9ae2cc4d17eso622202066b.1;
        Sun, 15 Oct 2023 13:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697400927; x=1698005727; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOqkDNi2G1klSItw+VfFUFmDBPvfXQMPHAdmvnTWKuY=;
        b=ZA6KzyzEfecaYlNuoiN9djSWvG59QcaQbkzI3BJGffEcCFx0bvj7h4GzllROBGKYFs
         2Gq2X8y2PXwcjhWYLoX/8z2ubvFdEyqY3paaxfIYUUs3Cy8Q+lfn4Iob4FowiT8lDCHv
         FSessiK9t5c99lL9u8+GyVcOaS+XMAvBIkp4/rTNyb2EKlmL4JOWaiPG+Hy31eusm4XL
         3kIT7VFbr1lxNTZg9BGBe824/qEeyKgNZgoD28rvVQxXs75JYQcadHJ1S0yzazOMW2z/
         2iE8ZyOeMtfzdJKp0WVv4Pme3ywgpr++XI1olirJ1N8XUZ1NDoPhPQX4wlC70LN/HKLg
         mzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697400927; x=1698005727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KOqkDNi2G1klSItw+VfFUFmDBPvfXQMPHAdmvnTWKuY=;
        b=u9rP4HEZLI6xTl+qRqKdxSRyQfgC2GSl7FER0HFixmm1IUdphWfSoCY6qweWD+b7XC
         Ms7rUt+E7X0GHbQSVs8J1ijT7Ko0FZxJRfDQoxtTJUkKfmevn+t/Dki2Vo+UE+17wTDb
         Q/n+kwGNXeqi0C/71g+NmZm4J34lD49xPfS5CY3PKaMA9+e/eOfrZC1rQmBOPSBjlKrw
         oUiojx2sJ7j4r+dGQlIa0DyelVAKM7YjCYebZ3gIYCey/GroAJ7l7V5XB62hEL6hC+7J
         FB73kl97l46ChQVpJ6ZmHLDTbmbnzrXr8/vm5rhC9DiAuwXx+gFDpRWEqJr5IAkQqFpg
         gR/w==
X-Gm-Message-State: AOJu0YyZvpoJkFTGq4QdOIqQpqZ2NZyh8YFzlu39tm+w3E9OXZQDjwqE
	On4lwudpCKMhflaONIUC7w==
X-Google-Smtp-Source: AGHT+IGmDRzZZ15imc7zYxdckrpC7tosOr9IS4ylHP2yT0JnqKftSePWFbjYO1E8NFxywr2czVZL4A==
X-Received: by 2002:a17:907:7ea4:b0:9be:6395:6b12 with SMTP id qb36-20020a1709077ea400b009be63956b12mr5248720ejc.27.1697400926427;
        Sun, 15 Oct 2023 13:15:26 -0700 (PDT)
Received: from dorcaslitunya-virtual-machine.localdomain ([105.163.157.6])
        by smtp.gmail.com with ESMTPSA id m10-20020a170906234a00b009ae587ce133sm2721766eja.188.2023.10.15.13.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 13:15:26 -0700 (PDT)
From: Dorcas AnonoLitunya <anonolitunya@gmail.com>
To: 
Cc: anonolitunya@gmail.com,
	outreachy@lists.linux.dev,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] Staging: sm750fb: Rename programModeRegisters
Date: Sun, 15 Oct 2023 23:12:37 +0300
Message-ID: <1f4999e1523371bfb7dadde8eea7073ef3a04c75.1697400022.git.anonolitunya@gmail.com>
X-Mailer: git-send-email 2.42.0.345.gaab89be2eb
In-Reply-To: <cover.1697400022.git.anonolitunya@gmail.com>
References: <cover.1697400022.git.anonolitunya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function programModeRegisters to program_mode_registers. This
follows snakecase naming convention and ensures consistent naming style
throughout the file.Issue by checkpatch.

Mutes the following checkpatch error:
CHECK: Avoid CamelCase: <programModeRegisters>

Signed-off-by: Dorcas AnonoLitunya <anonolitunya@gmail.com>
---
 drivers/staging/sm750fb/ddk750_mode.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
index fc3db09de9ae..e901855fa9b6 100644
--- a/drivers/staging/sm750fb/ddk750_mode.c
+++ b/drivers/staging/sm750fb/ddk750_mode.c
@@ -75,8 +75,8 @@ display_control_adjust_SM750LE(struct mode_parameter *mode_param,
 }
 
 /* only timing related registers will be  programed */
-static int programModeRegisters(struct mode_parameter *mode_param,
-				struct pll_value *pll)
+static int program_mode_registers(struct mode_parameter *mode_param,
+				  struct pll_value *pll)
 {
 	int ret = 0;
 	int cnt = 0;
@@ -220,6 +220,6 @@ int ddk750_setModeTiming(struct mode_parameter *parm, enum clock_type clock)
 		outb_p(0x88, 0x3d4);
 		outb_p(0x06, 0x3d5);
 	}
-	programModeRegisters(parm, &pll);
+	program_mode_registers(parm, &pll);
 	return 0;
 }
-- 
2.42.0.345.gaab89be2eb


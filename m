Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD6F182A7;
	Thu, 19 Oct 2023 10:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aFaVciZM"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4083ac51d8aso15158055e9.2;
        Thu, 19 Oct 2023 03:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697710517; x=1698315317; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cbB8KyCX5JCSADfj+9upLa+4bu4hru1gFdwgH5SKUA=;
        b=aFaVciZMeU1DQWJGnoDJZ7wVf63KSb8lEBqQ4S/6D6mfWHcYpNWqX0OrDa8ujubdoZ
         Jfbr/GiguwWDshdk+9zJ9+p3Ljh9n05hsjV0gKo8WRFQVsTntiEcZdV/EsAGmBj1aQ55
         LkZ9OSxgwM3OwTJK6bWPjz8JyeGMxlZpu+KhjFMUU583HcQA0bkB2BUCoPE2Xt/gYVvh
         TlmsA+T7fQtItHGTwRPkozaBzPUZPJjtdXNq/7But9zHydWtgducjXKhe4vCXhitDH7G
         +KHaFxZabFex7b5UWhJEZvb+GTMaBR1VxriI41yn7v0t8rO+ByB8vYoRsrN7vI+0gB1N
         uhRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697710517; x=1698315317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8cbB8KyCX5JCSADfj+9upLa+4bu4hru1gFdwgH5SKUA=;
        b=izd8vWVywkD1KKWHu8iwYI5rjj7NASoKiOLOCGvH5p+8y6QMoVy0PgSB6fZmksiEkF
         baYP1l5bMU/gNa2tMgywatg9Y2MTQV6mcEF89Lq6rzyexHARH5VY0Vqf094lSp9gCcaE
         SsFCms7572+e5TYWhm0hlWQah1qYoNE/0gTPcNK4Dc7TgbXF8YeUQ0EYdgiQmXEQwx+T
         v4c3xlcIuL/xIMB+hUoX4lvsLM+hJC4Hkr/nM8T/dg1YIy7WPiNeWQALobVGqzFCp8QP
         WNARAZFZf9/FBEkAlavHxLsesLW/9U9aNFdBtvElM4YHKzkzB9849ldUz7V+UW21Z75s
         JCew==
X-Gm-Message-State: AOJu0YxVkx3M9bAXSozT7QtWuv/T6NFpxHyRKh4YNduX96BHrmhPgmbj
	DXnoYorZfdeXrLORUhSB3w==
X-Google-Smtp-Source: AGHT+IGiDMFrmb9+RwMtP6BpxH9s/4iB8rEAMTIZXjwiWmRveGAphvfriwoq9wK4V9AK4OIZ4FiN7g==
X-Received: by 2002:a05:600c:4a14:b0:406:4573:81d2 with SMTP id c20-20020a05600c4a1400b00406457381d2mr1364687wmp.39.1697710517493;
        Thu, 19 Oct 2023 03:15:17 -0700 (PDT)
Received: from dorcaslitunya-virtual-machine.localdomain ([105.163.1.8])
        by smtp.gmail.com with ESMTPSA id l32-20020a05600c1d2000b00402f713c56esm4109300wms.2.2023.10.19.03.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 03:15:17 -0700 (PDT)
From: Dorcas AnonoLitunya <anonolitunya@gmail.com>
To: 
Cc: anonolitunya@gmail.com,
	outreachy@lists.linux.dev,
	julia.lawall@inria.fr,
	dan.carpenter@linaro.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] staging: sm750fb: Remove unused return variable in program_mode_registers()
Date: Thu, 19 Oct 2023 13:13:37 +0300
Message-ID: <20231019101348.22076-3-anonolitunya@gmail.com>
X-Mailer: git-send-email 2.42.0.345.gaab89be2eb
In-Reply-To: <20231019101348.22076-1-anonolitunya@gmail.com>
References: <20231019101348.22076-1-anonolitunya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drops variable ret as it is unused in the code. This therefore modifies
the return type of program_mode_registers() to void from int since the
return value is being ignored in all function calls. This improves code
readability and maintainability.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Dorcas AnonoLitunya <anonolitunya@gmail.com>
---
Changes in v2:
- Drop variable 'ret' entirely as it is unused.
Suggested-by: Julia Lawall <julia.lawall@inria.fr>, Greg Kroah-Hartman
<gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>

 drivers/staging/sm750fb/ddk750_mode.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
index 83ace6cc9583..4278f9a826ab 100644
--- a/drivers/staging/sm750fb/ddk750_mode.c
+++ b/drivers/staging/sm750fb/ddk750_mode.c
@@ -73,10 +73,9 @@ display_control_adjust_sm750le(struct mode_parameter *mode_param,
 }
 
 /* only timing related registers will be  programed */
-static int program_mode_registers(struct mode_parameter *mode_param,
-				  struct pll_value *pll)
+static void program_mode_registers(struct mode_parameter *mode_param,
+				   struct pll_value *pll)
 {
-	int ret = 0;
 	int cnt = 0;
 	unsigned int tmp, reg;
 
@@ -199,10 +198,7 @@ static int program_mode_registers(struct mode_parameter *mode_param,
 				break;
 			poke32(PANEL_DISPLAY_CTRL, tmp | reg);
 		}
-	} else {
-		ret = -1;
 	}
-	return ret;
 }
 
 int ddk750_set_mode_timing(struct mode_parameter *parm, enum clock_type clock)
-- 
2.42.0.345.gaab89be2eb


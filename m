Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E316A1642B;
	Wed, 18 Oct 2023 09:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLLLhHy5"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-507c50b7c36so1432692e87.3;
        Wed, 18 Oct 2023 02:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697620147; x=1698224947; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cpBTf7lcPPrlh5uO65BHtYFE8Nvp9es/xrzqlK/axIY=;
        b=XLLLhHy5HiJxUJQcmjUAMfyCEjzR1WTdcX6SRM98ptxfoI7mHymtQL5pMoVld17a7I
         VVvmO9lcHy2Gt2oqyj2+6HfdvEPmtWnfa/tSPYvzOQ3N9gv4LX+0oSMQQv2Kns5BFLoQ
         9+8brABK/7MZ/eT+ftQR1bxbHhTcZRJeOguBB8UOjXGnBxkPmUAZZ2wyg0STiN527PKE
         L6schvf+hkFadLWlyd/6GhFMy4qMoTZayRXCuJBpOG6jtfMBWkeOjq+2IsTefW2ImN9K
         sP3usYrW7Tl1b4bVTDjjV+DaoOjUdQHuM5jioK07cYIelufA+pL3CzqpJM0zoQlYXb4M
         hbzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697620147; x=1698224947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cpBTf7lcPPrlh5uO65BHtYFE8Nvp9es/xrzqlK/axIY=;
        b=pOGEQ3Vvq4oMF+B69zWjF0E05YIjNzoRit5dMZ3EZpgS9AMEKABCdGDEqZQtmnCvHp
         JjedmzZALbjV2LWsbo2U7UM60BsZ9B+6fjKa3CTTkZWMWNW6fViLidHZO96HsTl9SOUw
         3WooAQVFrkjOqEuJSB5qRmODjxNw9r4J/SHgMkUEwIZLSWs0TR9Oc5q802Q4xFjNv9xQ
         Gro6BX9oUKK0quRTlqSq8W9hg+d3A7O4sKFhPjlGifEhmjF6jXPfTPxdldpkmH+Nxz4X
         +JjvAU9CYYHfqBI8VUBrHl0HiikirhSJw64DGH9C7I1udaUWIKOY98GRfQBiAkvFJlao
         xHDQ==
X-Gm-Message-State: AOJu0YyOlg/ISxNGys9oYmGMN+l/sU1/vdam/ZaCik+FnF5vD5/PgZTS
	qS2dNShrL+RcGllS8Kn2Hg==
X-Google-Smtp-Source: AGHT+IHexUEVIYWZg4NVhT/6ayuobviO0J5bcJdeY/hfx49NbfI55SMtkLr/hRDsat5UuOjQuWlF5w==
X-Received: by 2002:ac2:5939:0:b0:500:9dd4:2969 with SMTP id v25-20020ac25939000000b005009dd42969mr3415814lfi.59.1697620146853;
        Wed, 18 Oct 2023 02:09:06 -0700 (PDT)
Received: from dorcaslitunya-virtual-machine.localdomain ([105.163.0.227])
        by smtp.gmail.com with ESMTPSA id l16-20020a7bc450000000b003fee6e170f9sm1107397wmi.45.2023.10.18.02.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 02:09:06 -0700 (PDT)
From: Dorcas AnonoLitunya <anonolitunya@gmail.com>
To: 
Cc: anonolitunya@gmail.com,
	outreachy@lists.linux.dev,
	julia.lawall@inria.fr,
	dan.carpenter@linaro.org,
	andi.shyti@linux.intel.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] staging: sm750fb: Remove unused return value in program_mode_registers()
Date: Wed, 18 Oct 2023 12:07:38 +0300
Message-ID: <492e63bbc58147fb534930ef9e1fb5d844ae8769.1697619623.git.anonolitunya@gmail.com>
X-Mailer: git-send-email 2.42.0.345.gaab89be2eb
In-Reply-To: <cover.1697619623.git.anonolitunya@gmail.com>
References: <cover.1697619623.git.anonolitunya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modifies the return type of program_mode_registers()
to void from int as the return value is being ignored in
all subsequent function calls.

This improves code readability and maintainability.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Dorcas AnonoLitunya <anonolitunya@gmail.com>
---
 drivers/staging/sm750fb/ddk750_mode.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
index 83ace6cc9583..e15039238232 100644
--- a/drivers/staging/sm750fb/ddk750_mode.c
+++ b/drivers/staging/sm750fb/ddk750_mode.c
@@ -73,8 +73,8 @@ display_control_adjust_sm750le(struct mode_parameter *mode_param,
 }
 
 /* only timing related registers will be  programed */
-static int program_mode_registers(struct mode_parameter *mode_param,
-				  struct pll_value *pll)
+static void program_mode_registers(struct mode_parameter *mode_param,
+				   struct pll_value *pll)
 {
 	int ret = 0;
 	int cnt = 0;
@@ -202,7 +202,6 @@ static int program_mode_registers(struct mode_parameter *mode_param,
 	} else {
 		ret = -1;
 	}
-	return ret;
 }
 
 int ddk750_set_mode_timing(struct mode_parameter *parm, enum clock_type clock)
-- 
2.42.0.345.gaab89be2eb


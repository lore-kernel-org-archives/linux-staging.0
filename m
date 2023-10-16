Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B487634CE3;
	Mon, 16 Oct 2023 20:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+93UFSn"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-9a6190af24aso819919266b.0;
        Mon, 16 Oct 2023 13:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697487379; x=1698092179; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mog/BonNox2pvkdSIDtH1hNgJSkOylthKpgqbZnc1SM=;
        b=d+93UFSnOjuagX21pJKsjqabobf8znNu+dm15WZnUf9AHxMTkGh+08Wgcs1kX/C/XK
         RnXOGNG30KLIBDPvRzWZzUreYVBQDx9NGavTVQV6JzEAqZtvvpoAuriHJxn/+nTOK9w5
         pgTT7mjLt5qQ2Ll482PajmDV7UxEBxtIV9gC9qAs/fljF/a3uDbq3lPaOC4L0bPxjYqd
         uEGXmLWy76GFLlr7QjtGX6uqNaeA5FWyMX1gRn+Qiqs11w9iK6Ctk82E/Eo/YThyV0ML
         int1ZzyHhUPs7l4xmE6Ic3AQegwBGSoTdtzFka/hSDEQTTcfDt7GJLg6bXJ22cglOvj3
         9Z3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697487379; x=1698092179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mog/BonNox2pvkdSIDtH1hNgJSkOylthKpgqbZnc1SM=;
        b=oKt/C0mF0XRek3RbOQA4dtpvUlGuNcB17Way4wdKeaFaQseIxqCx5nuVjNCIlrB8pX
         O88XAls6Sye0nX6gyw2AW0zu+o/3AUmmF4QfDT66gLPuiyanJB5STJpOckFti7B0oYr+
         G7G02y/YxItXeESi2PbFW8mbk9d0kqjCPQzCXHy7IdrYkaX1VLwaqUhXSND9EQZ64HiA
         gR9t9951Au4Zi8Z9i7FvJbYusDt7h6+ykfb0pxDLMijrjb61IjH4FC0MsGCt/9LfruNV
         n/Jt3WY19TOkRGCspuFSrT/gQF1rMwsuBHFJqShNsi73c3lBgmNtgJ3c7CRlJsQM46CV
         WmLg==
X-Gm-Message-State: AOJu0Yzm9hoVOlcEUud1wEdPLPeMUQ1JGoh/yCyN4rhPHps1r/Y6vAHf
	HyPcDAj/w9e5ViYdFO7ctA==
X-Google-Smtp-Source: AGHT+IGfqRKbTT1hBq+q2DfgykI2vT3cOjnlG6SZIJyHPXxi80bQhTSGcqlLMKAzWcEyjpWTAaLTzA==
X-Received: by 2002:a17:907:a09:b0:994:555a:e49f with SMTP id bb9-20020a1709070a0900b00994555ae49fmr81690ejc.31.1697487378908;
        Mon, 16 Oct 2023 13:16:18 -0700 (PDT)
Received: from dorcaslitunya-virtual-machine.localdomain ([105.163.1.143])
        by smtp.gmail.com with ESMTPSA id u26-20020a17090657da00b009b97521b58bsm4606055ejr.39.2023.10.16.13.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 13:16:18 -0700 (PDT)
From: Dorcas AnonoLitunya <anonolitunya@gmail.com>
To: 
Cc: anonolitunya@gmail.com,
	outreachy@lists.linux.dev,
	julia.lawall@inria.fr,
	dan.carpenter@linaro.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] Staging: sm750fb: Rename programModeRegisters
Date: Mon, 16 Oct 2023 23:14:11 +0300
Message-ID: <20231016201434.7880-5-anonolitunya@gmail.com>
X-Mailer: git-send-email 2.42.0.345.gaab89be2eb
In-Reply-To: <20231016201434.7880-1-anonolitunya@gmail.com>
References: <20231016201434.7880-1-anonolitunya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function programModeRegisters to program_mode_registers. This
follows snakecase naming convention and ensures a consistent naming style
throughout the file. Issue found by checkpatch.

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


Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6002F9CD;
	Sun, 15 Oct 2023 20:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J5MLnnyJ"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9b2f73e3af3so579152466b.3;
        Sun, 15 Oct 2023 13:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697400832; x=1698005632; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DT1W8gUSuxT3Wwy3qW2e2tPQ4NkLWmb+aTGBrsPTZaY=;
        b=J5MLnnyJVhHtvW5408vHWsQSDkFrXSQZOQEMgx8ok6maRJaJ9HqsidE7Yn6zoDCysm
         uJdl4On7ovTqONV8ZVEfr/iP1ELhzxVUlmEm7tWyDbZGTkxLk7SENbQqinjFgowUipEA
         8tvZzYJonhKW8qTSWGW2uHkGiXtWFfv9kyjjaI5l7XmdZPj7QqYAlwddFV4HpinWtbB+
         9IM7821OFjhG6uxOqIp5t+9TsSMdMu8ZBpuvTeBVMwd/+BnMor3tLxBL7elaxdKSRsob
         K+jQzv18e6ZCp82ipDTpR9C1hpT38q/lf5MS8fDS6jQ9wkQsTQak/VDnlVYTIt9vtomI
         SnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697400832; x=1698005632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DT1W8gUSuxT3Wwy3qW2e2tPQ4NkLWmb+aTGBrsPTZaY=;
        b=o2FLsezFKJFHwDNDIQLQA0axDM2dOj31zr8fiwcQCfw7cRlHR2Zr9znqQWT0ImTHPG
         uCdu1DUeRct5D3zBZnS306jltN//JBKYfvqDO6IiRdXvfEcRm7Zcendjcoc0p5tKarCa
         jC1CcCV2XHVJrotiVpqkzOTpfG+d2XcbzVGd7jo7ZB6hTRnKP7f6K38ezurHCVikpt+y
         WLusufx3g1VU26gY6a0B1qhwQaZv1nyxkPOLMudhE33X95ZZ9vtQrbTKq7l0AAM0GUEv
         tnEvVu+CfmS41Y/aoJPS8xl0naNsITypccboxS9CbUvYn1dc2kIY9S/uoepPPzfBH+7o
         w6IQ==
X-Gm-Message-State: AOJu0YzwsijGGuNXmvWRANq1pVaPC95RSJ3dw8snQmhJt5iUWpt0eFQO
	Xmde0a0dHcMIExsGeFOnFw==
X-Google-Smtp-Source: AGHT+IEXViXuLbUs9s+KmzkE5bixqlOmue7yjzSoBKZULy7e0QSO4Sw9iKCVoEKX9cfxdOgfcgIHTQ==
X-Received: by 2002:a17:907:a0d:b0:9c0:99c4:79e8 with SMTP id bb13-20020a1709070a0d00b009c099c479e8mr1751940ejc.6.1697400831619;
        Sun, 15 Oct 2023 13:13:51 -0700 (PDT)
Received: from dorcaslitunya-virtual-machine.localdomain ([105.163.157.6])
        by smtp.gmail.com with ESMTPSA id m10-20020a170906234a00b009ae587ce133sm2721766eja.188.2023.10.15.13.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 13:13:50 -0700 (PDT)
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
Subject: [PATCH 0/5] staging: sm750fb: Renaming camelcase to snakecase
Date: Sun, 15 Oct 2023 23:12:33 +0300
Message-ID: <cover.1697400022.git.anonolitunya@gmail.com>
X-Mailer: git-send-email 2.42.0.345.gaab89be2eb
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renames various function names and variable names that were previously
in camelcase to snakecase to ensure consistent naming styles.This issues
were highlighted by checkpatch.

Dorcas AnonoLitunya (5):
  Staging: sm750fb: Rename displayControlAdjust_SM750E
  Staging: sm750fb: Rename pModeParam
  Staging: sm750fb: Rename displayControl
  Staging: sm750fb: Rename programModeRegisters
  Staging: sm750fb: Rename ddk750_setModeTiming

 drivers/staging/sm750fb/ddk750_mode.c | 90 +++++++++++++--------------
 drivers/staging/sm750fb/ddk750_mode.h |  2 +-
 drivers/staging/sm750fb/sm750_hw.c    |  2 +-
 3 files changed, 47 insertions(+), 47 deletions(-)

-- 
2.42.0.345.gaab89be2eb


Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC175258CEC
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151843; cv=none; b=R7qIuB4yIfOZXhHbBhKxYc3rkE2U4m8w947zTRF9XIIor1BSmEGuGETd71k1lblHjGveRmWbJA55VHTARFETuNLMbnMFKuQ8tDSwQFuJJXlTFLwp38G+kDV9/AIH/vCLBxlEFFFZZej8le2rr1CnLg8PX/SGD5396+dG8A263dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151843; c=relaxed/simple;
	bh=Wdr5k+Zv79hAW36cz3jZ7Cu4GyzR4W+0t8T3mR5lLAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HBRh6njVXNRYKmra2J20/+Q0VVaEJHdpLoZRUBLFUu/j1gInBbv354GBgdeUVHrpxZXLLTqETxuK933jmQKwodMS+Q897d75FsW/neQeeEoSiRp16QmnXUUuTq9dJilFRKirVzy2zUvJ7SWYl8Y4jv7Yys5MfVGr5LoDddUvvOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=Qj8P84eI; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="Qj8P84eI"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-736a72220edso6222212b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151841; x=1744756641; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6i6f/xDaRTJj1UsiXR+TSptxMr+Xb9FeptF6tQymOsg=;
        b=Qj8P84eIYUfvbDsP3/5WOjmzR8pwp/iYA3otpeVsYsdHdYFEhGIcuQwzg9rHCDcR2Z
         kgelnAGVMUE+nirNcm1/2dQn0uKbUUimfO3+Gfh7PXAk8kUS/JfT0g+DUi1qDhjyGTh8
         LjUerATm97WgJY2OGo850pcKx+GqE5CBb5wonXjfUHuE/yUtf0PGyBCOrh1UjB0oySqj
         HtnD/pPXoViqsx+D3exyK43YxtWF0zpo0VwHtiRdMFB5QE/eWeSY7jDo8wAzzf3DDjE5
         mTxTqxb2IRK1HlC26ru4mVVKzLJLOvYR1gDlClpUqwOEWSXXpY0Y8CRVari7VQwWOwUE
         rplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151841; x=1744756641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6i6f/xDaRTJj1UsiXR+TSptxMr+Xb9FeptF6tQymOsg=;
        b=bWbiqLDPBtYg0CClGQ85ncw/DbX5645lQeuAlZnSRmswgmDOYx6PE30ldQxv+FQd+q
         i1qlhDM5wwT5w6uHzK1FuQK7q2H0+R92R4WnUxY5D28woUMj5NjkEUZe8I3D+QFgWD/W
         ED4wbp8uhiiNfv7vdtIzDYIXL1NvW2xbC7CX9LdP7Make4im+s3oGjNABJn801X+SoWC
         UwKb6sn8sKj+bIoldBxLfE2r49E1mcv7dSdeFujf1Vc/Sq4U/1PeTBVm0Onizf+KFfkD
         ss+nAVm6YYMLJbun1RMbW9qWq/9kK3m8dnC+VGGbmmIP001dt9m/F0JrcQfjszdegb/H
         1sSA==
X-Forwarded-Encrypted: i=1; AJvYcCXpHK9Vj8Qq065q32LfHf5VgthY5vvTHjmxYwF0ZX40R5VlRzxgXdSrJjtEoTqxwA9Ab2j0F8X6m07PChXD@lists.linux.dev
X-Gm-Message-State: AOJu0YygUyQedmMbuc6qcUbWV9/g9OZMhH/6tESR0wKkoqcov77UeSLN
	6ZhyYv9ImT1t4YHnWoWpKdps8wIwYMTNfSpmXy2ytoK2ubQBsgsq8KpZyHmMyA==
X-Gm-Gg: ASbGncti0xjA6vnHHJ3hII3xGLJmxRhxwChyn9NBLhw1QcnKH8muFlIco/7Avp02Xsd
	Sjc3z56l5edzmOM8wtlp+wyOcvcsV4owPUTlYyNsTkZOQ+hxV6itHcVizGD4fCKCjL2pQ04i1W6
	s91clomrSmyxjFxYPf6NIxAFMv+4o2Mdxx377RDxtagBvkGOPRxoNRcjvcaNHIQajlYhkLnY4+a
	c0EMxwr05d20vE5m8QiYbpoIOIfJ0kz2cliN6zT4a60cCLBL25/dFtaUdLb2rVrIl8ylxAVMQ7T
	UiMsqcfRNYKsnzNgSjkG2bwRS3Blh9gHTGlKPPeTtI8y4f6LaeG4rmp/3DsIOOBwflInZS8zIeu
	7fFWJbxJsRJcTY6CtUirM
X-Google-Smtp-Source: AGHT+IFoBZxGkWgw7INqwMHfuyYPpHaT2GDl7uvAaPAvZ6mUMh+2oVqoE62mf4cAVTQRTXJT9OpxiA==
X-Received: by 2002:a05:6a21:478a:b0:1f5:a98d:3d8a with SMTP id adf61e73a8af0-201592d96ddmr970106637.40.1744151841276;
        Tue, 08 Apr 2025 15:37:21 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc41af71sm7939369a12.75.2025.04.08.15.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:21 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 16/18] staging: gpib: pc2: struct gpib_board_config
Date: Tue,  8 Apr 2025 22:36:56 +0000
Message-ID: <20250408223659.187109-17-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408223659.187109-1-matchstick@neverthere.org>
References: <20250408223659.187109-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_board_config

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/pc2/pc2_gpib.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/gpib/pc2/pc2_gpib.c b/drivers/staging/gpib/pc2/pc2_gpib.c
index b0b19e2d4782..a33ebd951e79 100644
--- a/drivers/staging/gpib/pc2/pc2_gpib.c
+++ b/drivers/staging/gpib/pc2/pc2_gpib.c
@@ -252,7 +252,7 @@ static void free_private(struct gpib_board *board)
 	board->private_data = NULL;
 }
 
-static int pc2_generic_attach(struct gpib_board *board, const gpib_board_config_t *config,
+static int pc2_generic_attach(struct gpib_board *board, const struct gpib_board_config *config,
 			      enum nec7210_chipset chipset)
 {
 	struct pc2_priv *pc2_priv;
@@ -295,7 +295,7 @@ static int pc2_generic_attach(struct gpib_board *board, const gpib_board_config_
 	return 0;
 }
 
-static int pc2_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int pc2_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	int isr_flags = 0;
 	struct pc2_priv *pc2_priv;
@@ -366,7 +366,7 @@ static void pc2_detach(struct gpib_board *board)
 	free_private(board);
 }
 
-static int pc2a_common_attach(struct gpib_board *board, const gpib_board_config_t *config,
+static int pc2a_common_attach(struct gpib_board *board, const struct gpib_board_config *config,
 			      unsigned int num_registers, enum nec7210_chipset chipset)
 {
 	unsigned int i, j;
@@ -460,17 +460,17 @@ static int pc2a_common_attach(struct gpib_board *board, const gpib_board_config_
 	return 0;
 }
 
-static int pc2a_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int pc2a_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	return pc2a_common_attach(board, config, pc2a_iosize, NEC7210);
 }
 
-static int pc2a_cb7210_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int pc2a_cb7210_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	return pc2a_common_attach(board, config, pc2a_iosize, CB7210);
 }
 
-static int pc2_2a_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int pc2_2a_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	return pc2a_common_attach(board, config, pc2_2a_iosize, NAT4882);
 }
-- 
2.43.0


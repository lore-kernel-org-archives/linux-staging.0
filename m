Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B9F2561D6
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151829; cv=none; b=dCplo9aADBqfcVX9dvZCKJX3ak818/KvrEacoalPwf1OyocvNt+7U08u55rb3yYigc9HTl7WLj002Cj0EyOc/NPkqS/Ijv0iWzq1CTH4R+6LrnxTaAqufN/Tc176KFJs/dtH7MummhP1IW4uiZykmn+DRZOutUj/Q9P15ywtJ/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151829; c=relaxed/simple;
	bh=mUmAeGXRbQ7VAok4KoJS5eLp8Gt4hMGUusX407z9K20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bU1CWs1hsiH73VsibHWoM8bJwe+7vF1mUyLVS0XYUOn3BnGVDL3BdDaRHMNaFTqFIrIOtcrf6FJfeqWTR24/Ae0OsF2P71zakAh3/O9dw2xH7w4+7icOBxEi6gGLWX8NoR3rpOIaWDkTMCJ71FAGet68QUER4YsVvZtWgU4nHxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=F16KWgDm; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="F16KWgDm"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-736c3e7b390so5788854b3a.2
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151828; x=1744756628; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBJz86+Ff7rBhAwfla9Zgu4g4QbDvxGnEKapVf5XDjc=;
        b=F16KWgDmkpGPmlk2C25S9ZaxrUklb//wiZQInWaV2nnGQfNfOo5EVbpU+lfXP+K5u8
         JgelwpFSJxicNuR5vCCI0zmf6x7NN//FWLuOPS0t7hEjAGftI2faqqWOjrMBlr56+0h4
         dWKqedyyAdhZQqGVSCENOlX3xBrwwcRgl+SIgDtEJa+P4XKFaTWsHv/3adQFEs+q20Aj
         mLEnuP6bLxU5wP8i+oRKXSUAK8M/JKQ/4YP3RXoYJOrtRXAPv80ee9rDNJfaqkgMpIkc
         0Xf9JkKJc46x6QcUsyI4DcpPdoosXSWiXLK3KWytI3iMPF6IB+T3B2ucl+/eXmr2Pmov
         r0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151828; x=1744756628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eBJz86+Ff7rBhAwfla9Zgu4g4QbDvxGnEKapVf5XDjc=;
        b=BlMAlwu9AFUBAR/UAJdzez0UjJTNg+V9XE/ntg3B+qNitZXK+5eTkTC4ODwLMgoUao
         LgABJS4aNQAb+Txu5kq0rnxFUdbdYfO6z5gfjJMVmwxA4VTpSePbJQqHiSoluyGvI9e7
         GHm1yw2qFK7Gj/riiDY+WHHBjiortbFWet7ziZ0oOLbov7HreB7dxiJ6JD++J69Msbrm
         ajyXFa8FA3g5j8dYsXpRhkrLb4LG6S/jAaC/TCcZ4UDlrWM+RNupqJtGj43GFnNBaniW
         ULsY6gg4TJetfTFxs1RazsWv108ZiOG46Qga3OLfuhmOcakABhvfZSeSXxn7LKOAZn93
         e3qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWftnro4xRKK5FqER38L2eyec+twgb5vFtxls39IwYViyDi7svh3+Tu8qiBcp0t5Y8+AzjAktQ8nhKjZ3o0@lists.linux.dev
X-Gm-Message-State: AOJu0Yyt/k1SEYjdMcypZWFE5lt250eWqzz3Dc+OoHHVWTv02S7cN0N2
	Onysu1oI3NOmC0McEm61ZZADvpHfiSa9SRkBrppizkcgjM521irgPGWxHBIzeg==
X-Gm-Gg: ASbGnctWqnu+GeJ4Gv/poTWBaj1ZJE18G88faoY1uMNkW25cxffu7E5jjqLOPWokvXU
	SRE6rO49j0qIpDSdmijyjsXgSfUOFZZFre7GCL1KGxSPPqUAI9qyxwcBBEDk/8fragOC0wIInV9
	WnoybWtFrrqBgFt9376lj7BcdgOVaW8t9i1Hg5fdWJa8bHJimXSl23/IaqVjokmXhV6VFsRjLvF
	ACnpx1MSUIgCqs37NuuAGyVzod/bF0TBUOLHw964PIQq5Mxz/1Sp5Bidq5uaTrCc3BcmosxFT7L
	xRxI2Oj6+blGjIKspR/kRSBjhkIURiCPqc7DGQpBJ/tBrx4D1a2AjuVjMBxt0nKZPWYUVeoqIXU
	/fIJpPQch+Q==
X-Google-Smtp-Source: AGHT+IEjSpIyp7em7ovcxLcNfFL+AzYoBn298I5r8R5h68flLK0yC72ZCxAQfyO2IyGuzaaEdjbSCA==
X-Received: by 2002:a05:6a00:194a:b0:736:6279:ca25 with SMTP id d2e1a72fcca58-73bae5528b7mr942741b3a.24.1744151827617;
        Tue, 08 Apr 2025 15:37:07 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b4317sm11499762b3a.148.2025.04.08.15.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:07 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 04/18] staging: gpib: cb7210: struct gpib_board_config
Date: Tue,  8 Apr 2025 22:36:44 +0000
Message-ID: <20250408223659.187109-5-matchstick@neverthere.org>
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
 drivers/staging/gpib/cb7210/cb7210.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index 20cea66d6557..a8549718b425 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -533,8 +533,8 @@ static irqreturn_t cb7210_interrupt(int irq, void *arg)
 	return cb7210_internal_interrupt(arg);
 }
 
-static int cb_pci_attach(struct gpib_board *board, const gpib_board_config_t *config);
-static int cb_isa_attach(struct gpib_board *board, const gpib_board_config_t *config);
+static int cb_pci_attach(struct gpib_board *board, const struct gpib_board_config *config);
+static int cb_isa_attach(struct gpib_board *board, const struct gpib_board_config *config);
 
 static void cb_pci_detach(struct gpib_board *board);
 static void cb_isa_detach(struct gpib_board *board);
@@ -926,7 +926,7 @@ static int cb7210_init(struct cb7210_priv *cb_priv, struct gpib_board *board)
 	return 0;
 }
 
-static int cb_pci_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int cb_pci_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct cb7210_priv *cb_priv;
 	struct nec7210_priv *nec_priv;
@@ -1031,7 +1031,7 @@ static void cb_pci_detach(struct gpib_board *board)
 	cb7210_generic_detach(board);
 }
 
-static int cb_isa_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int cb_isa_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	int isr_flags = 0;
 	struct cb7210_priv *cb_priv;
@@ -1133,7 +1133,7 @@ static struct pci_driver cb7210_pci_driver = {
 
 static int cb_gpib_config(struct pcmcia_device	*link);
 static void cb_gpib_release(struct pcmcia_device  *link);
-static int cb_pcmcia_attach(struct gpib_board *board, const gpib_board_config_t *config);
+static int cb_pcmcia_attach(struct gpib_board *board, const struct gpib_board_config *config);
 static void cb_pcmcia_detach(struct gpib_board *board);
 
 /*
@@ -1417,7 +1417,7 @@ static struct gpib_interface cb_pcmcia_accel_interface = {
 	.return_to_local = cb7210_return_to_local,
 };
 
-static int cb_pcmcia_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int cb_pcmcia_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct cb7210_priv *cb_priv;
 	struct nec7210_priv *nec_priv;
-- 
2.43.0


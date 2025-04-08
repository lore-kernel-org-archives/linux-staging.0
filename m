Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CAE255E26
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151840; cv=none; b=LQpQ2qth4tjWz8L3Pv7gvg/EGNbleQN9BbIk7Xl8RwI7zpSFb9MQHUC/1FcOSdbFEQjK8Zl1/HMi3tpOTpJm/bTfk5ZtgDw1H/9MhNvT3QQcF3mXatrfEY4M/fQT4W4fnUp9fOYdUpIvqMQK6uL8fRkRjF2maK1ujM+pifzpP34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151840; c=relaxed/simple;
	bh=RW9AE3t0A0nclxnXdLPGn5ZCeaheNjUQ/Msgs2FG9JA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rSwVKhAGhD5p952MowzuPY6zq4SB/LaOp53Atv6vQ1cukThRhqcm3agsEs0gPbJpdt7fttZC4bGjgzRskcGFKa/+4YMJB9sM6R6LMtZ9/xlZcvHzX1JaVdZfMpGNG7/pVdbIDJ5dcobF5aw1NGHHPOdHSwXuHxsaXpW7gBS4yHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=jdJmc47h; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="jdJmc47h"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-736c062b1f5so5167299b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151838; x=1744756638; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stUd2WZ8fQWzt1BDAw39EfCCVY0bEu1A4avlNZzjbAc=;
        b=jdJmc47h03tQRMvRtwO5YXQVh7HMTV2Vx/m0V8/pYONWBCGt3L2Fl22cXSNmDvHQ6k
         euMc1anHdns92Pdzx/5c0R6FdZuOS2cu6H/+Y1cmTzqImf/WYz6I1BEWvIyOYpyF7Xqh
         BcpXKALQFVZv34L3+A5FDVdI4Kg3MA3/+RwKifONEIChV1BNoXApsq0uJve3965A2zgW
         0lUCk5YKXm4X6G8nhISQPlhUorleM5UJ2ULWkQJSH3MRW41j52EKshkJkNrk41PtIetv
         40cGa9alWOUC6noNRQG+2UirhQTyhPK8/47O0DZ7m9gIHrHnGwke+si1Fmdjz6a1REBL
         DNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151838; x=1744756638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=stUd2WZ8fQWzt1BDAw39EfCCVY0bEu1A4avlNZzjbAc=;
        b=kagVFd+gBILfa0LPaNnciMzjZ0dsxQJJK8JBqhI7LaWPTiMztAjiHS7TLSK6Kc35TH
         P9P2E/cFnSy70cpHXhKKgdRrOUOplHvk91qDKeR0GSmJlDxcm+FM9a3jgnukK8Uf+zuW
         n1U3Ae5hRNSmY78+w9TjwUUmz5c7YcgixVHPA35TedB4t/ndASozdFtask3LrdzYzwCE
         fVbOk9Q77vT74Jx/uiVE2Pg5q3RduVofr1qpOCSMP6zeiB8u6UkAOxq1avqmfzZFYPC3
         W/N6m9asiVbLW1C9FWQejIpcBGuO9nd3LJXAGgw/ld+es4kY/csa9mc8s6R65b/KGy5n
         mzFA==
X-Forwarded-Encrypted: i=1; AJvYcCUCk5My8sgAQgAqlF1fuKHUNhCoNxDZbgL51GpxlXKiXPQnspDfn/+NNygnFJ+RYi7IIgrgD2WxhCulEds/@lists.linux.dev
X-Gm-Message-State: AOJu0YyyES2PG8WyDgWQvhYosMrwI+M7RMC0apNbOTWTw+J9ekId8vwg
	jvItQeHam6ujPjTJNO6afOkO8hRr8JSUepFFGB4ELrNbLt8T13oKHC2sswTqPCd4oIWVhZt8w6k
	=
X-Gm-Gg: ASbGnctQpXaNrxxgDIQByUqIbWFozZXLCHAhkkQT64/Wq3RR2Lq0DC7Y50PifEF2Y+V
	9XYkjPYrdqaoMVfbaU95Whh1fw5rWk6bU0M/F+WvRL2K3iJvwGi4+0uivIIGAVIBtN+R27DyIt0
	yQeoCRTD8+9/XsDZd/IxD7xGP/YY2KQCanhAlZaQ29yoQnjI98THi0j8LaWjA950cYXsuAZrC3X
	Du9H/KpFqgbTvD0RFfIreMy8EI2LF/XI8wy7eFGZBqkXQ/SCqjBGF8Eba1fAcpnPCzAGczv6PaI
	uxEnj3Ifo/Bzx/9z0dor7TkhRREx7nhW0a++t5BG435ZmSzOGxNGCssJRrzq0coODoNv0MDNsnX
	iNzFRU+I3ddDVEWAI4wZT
X-Google-Smtp-Source: AGHT+IEIYVhP2MSndFPC+gXp2gzhNla26uI6gXcVMRyQXuC0vBzRQHC29Z3GNUYLJzjclt3EoRCFjw==
X-Received: by 2002:a05:6a21:78e:b0:1f5:8f65:a6e4 with SMTP id adf61e73a8af0-2015914ca0bmr1080103637.7.1744151837884;
        Tue, 08 Apr 2025 15:37:17 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ee7a0sm11100513b3a.41.2025.04.08.15.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:17 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 13/18] staging: gpib: ines: struct gpib_board_config
Date: Tue,  8 Apr 2025 22:36:53 +0000
Message-ID: <20250408223659.187109-14-matchstick@neverthere.org>
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
 drivers/staging/gpib/ines/ines_gpib.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 7d53f6592845..3b7c8fc0f2e8 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -313,9 +313,9 @@ irqreturn_t ines_interrupt(struct gpib_board *board)
 	return IRQ_HANDLED;
 }
 
-static int ines_pci_attach(struct gpib_board *board, const gpib_board_config_t *config);
-static int ines_pci_accel_attach(struct gpib_board *board, const gpib_board_config_t *config);
-static int ines_isa_attach(struct gpib_board *board, const gpib_board_config_t *config);
+static int ines_pci_attach(struct gpib_board *board, const struct gpib_board_config *config);
+static int ines_pci_accel_attach(struct gpib_board *board, const struct gpib_board_config *config);
+static int ines_isa_attach(struct gpib_board *board, const struct gpib_board_config *config);
 
 static void ines_pci_detach(struct gpib_board *board);
 static void ines_isa_detach(struct gpib_board *board);
@@ -724,7 +724,7 @@ void ines_online(struct ines_priv *ines_priv, const struct gpib_board *board, in
 		nec7210_set_reg_bits(nec_priv, IMR1, HR_DOIE | HR_DIIE, 0);
 }
 
-static int ines_common_pci_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int ines_common_pci_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct ines_priv *ines_priv;
 	struct nec7210_priv *nec_priv;
@@ -852,7 +852,7 @@ static int ines_common_pci_attach(struct gpib_board *board, const gpib_board_con
 	return 0;
 }
 
-int ines_pci_attach(struct gpib_board *board, const gpib_board_config_t *config)
+int ines_pci_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct ines_priv *ines_priv;
 	int retval;
@@ -867,7 +867,7 @@ int ines_pci_attach(struct gpib_board *board, const gpib_board_config_t *config)
 	return 0;
 }
 
-int ines_pci_accel_attach(struct gpib_board *board, const gpib_board_config_t *config)
+int ines_pci_accel_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct ines_priv *ines_priv;
 	int retval;
@@ -884,7 +884,7 @@ int ines_pci_accel_attach(struct gpib_board *board, const gpib_board_config_t *c
 
 static const int ines_isa_iosize = 0x20;
 
-int ines_isa_attach(struct gpib_board *board, const gpib_board_config_t *config)
+int ines_isa_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct ines_priv *ines_priv;
 	struct nec7210_priv *nec_priv;
@@ -1000,8 +1000,9 @@ static const int ines_pcmcia_iosize = 0x20;
 
 static int ines_gpib_config(struct pcmcia_device  *link);
 static void ines_gpib_release(struct pcmcia_device  *link);
-static int ines_pcmcia_attach(struct gpib_board *board, const gpib_board_config_t *config);
-static int ines_pcmcia_accel_attach(struct gpib_board *board, const gpib_board_config_t *config);
+static int ines_pcmcia_attach(struct gpib_board *board, const struct gpib_board_config *config);
+static int ines_pcmcia_accel_attach(struct gpib_board *board,
+				    const struct gpib_board_config *config);
 static void ines_pcmcia_detach(struct gpib_board *board);
 static irqreturn_t ines_pcmcia_interrupt(int irq, void *arg);
 static int ines_common_pcmcia_attach(struct gpib_board *board);
@@ -1345,7 +1346,7 @@ int ines_common_pcmcia_attach(struct gpib_board *board)
 	return 0;
 }
 
-int ines_pcmcia_attach(struct gpib_board *board, const gpib_board_config_t *config)
+int ines_pcmcia_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct ines_priv *ines_priv;
 	int retval;
@@ -1360,7 +1361,7 @@ int ines_pcmcia_attach(struct gpib_board *board, const gpib_board_config_t *conf
 	return 0;
 }
 
-int ines_pcmcia_accel_attach(struct gpib_board *board, const gpib_board_config_t *config)
+int ines_pcmcia_accel_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct ines_priv *ines_priv;
 	int retval;
-- 
2.43.0


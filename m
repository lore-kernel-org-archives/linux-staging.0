Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF49259498
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151844; cv=none; b=kFQTO8J8bj0/QSeU2m50AHfdlzWUaqMRBV5qGueldAUZyAl+SoisPm1BtYJCLDElPXSI+rdmmuARkV+Ze2JNVfbDD/VC240IJE8591bTTmIIki1f+8YYheY3wki4fjz8JyyOAqLjcioItqpBDW/O2aFzlLNfgTSJTbgIFKIX6R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151844; c=relaxed/simple;
	bh=WNuWDTs6pDN1wV8Z6wrXTCiZTEWWOXryJgb1fzU3VnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GLC2jbuPLYnzcJZBcVCmQ2aH62v6B8biqDfmY/V4FMn3vhOZEFuKKNHj2LaFwz8o1eF5zxqH0UyhP3YZJEDrhcz+FHgZvWOtujTJiiHkIIzOd6u6dIYcfFS6Xxk1bVnTX29Q/oZVEwPN9g0Pne3AIe2sHR4jEB3iNB3G95glIQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=bKIp7OsK; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="bKIp7OsK"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22438c356c8so59510905ad.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151842; x=1744756642; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXhVa1CITV/B2cRl+KjgT7xJ1CjyHiHMABslu29MRHk=;
        b=bKIp7OsKCqHna4OLLaqEor4D3IQVUsNkhi4IAXxD+5BNsR4rzTA405DAEXbODZSMb9
         zDjboIFFaNo9U14GhonPuZ8PxLfNhTo+wDgnjEkGhhrX9An1Zk3muuBBsqNRfTxZABXx
         83PbivQT760rtASonorHzeojM9r/kaBEzvm6jdjWaoiCDhIrtS3ukCK3prxskzbMzNsZ
         xpO1REPzzF74GRsCsuDSs5XJjOvVi4AGumGFZmvFFR1bzTlQxsS8Qj0/kZGx7lzO5zZ+
         DOmF7tVSrRwJMO1lS3h+u5Shb+XhQR8eFiw9hDEsGD2pYg5FVI2uHZZ0EaXnml8wqRTh
         oAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151842; x=1744756642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eXhVa1CITV/B2cRl+KjgT7xJ1CjyHiHMABslu29MRHk=;
        b=iPAwR3oO+svqeGPGF64Gx5wmwj6zD805xoiCAUaxQZgUnkI/iOpyDdYMvtCwS8tndP
         da+ZlMFaTsY7QfNUG5eVzcmEHw8OQJr4JTyD0m/aOegJVMuzakmazfqWZfKFl4DsLqP1
         JW68GNP9c9fw8LA+t8AbzMNilU4pcoHOONsQUMr/gaDLR1Mno6rMLoxzexFdMJEiyLD2
         usw2PmjZtlFiHk3zA+5vZH1ZaMWoJN181BWLSr6XB6EZ3ClsmyQ5VJHK6tYDYLDVXUzQ
         +vQbVAvLoGuxjB2QTnlgtCFvLazMP+UTiJDsPpZb/h9HFn38Bjwe8vipi3dOBCXv7swm
         I/6g==
X-Forwarded-Encrypted: i=1; AJvYcCUZDRR1cNSLzb7cFF9XOcxExIaT4dh6NvjMFypxju8dZNEbZw4m3yJiaxXraOQfWHkpi5jv9ag9IjeaLUYE@lists.linux.dev
X-Gm-Message-State: AOJu0YziNT70zwWOQ5Y154QTU699piAoG5vx1B2etHmWwGtksK5Rzi3L
	nw7p+JvV2OKpDCtEiV8JioPqI5nqQwxNRhIJ+XDAJTf18eKFFQEIbG08B0fZpg==
X-Gm-Gg: ASbGncsvZuaNn/4/FF3rrC82Cdagr5HfMimxBwIe2801Y0RCa8n69CGW3GFWqmlNFZd
	J5UixQtLdIoGlyfXZa6dBaIpLqu9DwcaaGkUFsiM/TD92nWfrBO2LHgUFqyjgngXCr4C4dvbPnf
	Kf3xqJ1OjJN8iTBBwnzX02qRsXWguEXmG+qGGU7G3xFMQ6/oHmfyP6CDGCmAA5MTaIcZ+nTjwWI
	EZ0c4f1ZEJqQJDatL17YswBh+dTheSXubZ99Y4jSA/AVFpPvubp5VojCH2C9rKs5npsSvi48sMW
	8KRMLbjN6AtfAghSsIgSoOLecfmSo8BbwQ0Gx6mxTJr/Y0DzDDHRHA0HV/CyyzvaGxwZeZrJE9u
	LBJt4PCWjng==
X-Google-Smtp-Source: AGHT+IF87QspVFPBUI3zb4uLBU7ReB8xysVdKaGFAEW7LgmIq8HFVxrT5mQ3f2ij8cR94DO4zpRATw==
X-Received: by 2002:a17:902:d4c8:b0:215:b75f:a1cb with SMTP id d9443c01a7336-22ac298fabbmr9724015ad.9.1744151842428;
        Tue, 08 Apr 2025 15:37:22 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229787764e9sm106480495ad.243.2025.04.08.15.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:22 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 17/18] staging: gpib: tnt4882: struct gpib_board_config
Date: Tue,  8 Apr 2025 22:36:57 +0000
Message-ID: <20250408223659.187109-18-matchstick@neverthere.org>
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
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index 596e2fa40dcd..f123d427f835 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -898,7 +898,7 @@ static void tnt4882_init(struct tnt4882_priv *tnt_priv, const struct gpib_board
 	tnt_writeb(tnt_priv, tnt_priv->imr0_bits, IMR0);
 }
 
-static int ni_pci_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int ni_pci_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct tnt4882_priv *tnt_priv;
 	struct nec7210_priv *nec_priv;
@@ -1019,7 +1019,7 @@ static int ni_isapnp_find(struct pnp_dev **dev)
 	return 0;
 }
 
-static int ni_isa_attach_common(struct gpib_board *board, const gpib_board_config_t *config,
+static int ni_isa_attach_common(struct gpib_board *board, const struct gpib_board_config *config,
 				enum nec7210_chipset chipset)
 {
 	struct tnt4882_priv *tnt_priv;
@@ -1075,17 +1075,17 @@ static int ni_isa_attach_common(struct gpib_board *board, const gpib_board_confi
 	return 0;
 }
 
-static int ni_tnt_isa_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int ni_tnt_isa_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	return ni_isa_attach_common(board, config, TNT4882);
 }
 
-static int ni_nat4882_isa_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int ni_nat4882_isa_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	return ni_isa_attach_common(board, config, NAT4882);
 }
 
-static int ni_nec_isa_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int ni_nec_isa_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	return ni_isa_attach_common(board, config, NEC7210);
 }
@@ -1702,7 +1702,7 @@ static void __exit exit_ni_gpib_cs(void)
 
 static const int pcmcia_gpib_iosize = 32;
 
-static int ni_pcmcia_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int ni_pcmcia_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct local_info_t *info;
 	struct tnt4882_priv *tnt_priv;
-- 
2.43.0


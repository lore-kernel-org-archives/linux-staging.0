Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDB01B043C
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849976; cv=none; b=QFmBYo/QqVn8SHAcGTyEr7mspFkP0+QBWIyasU/invQi5yITxh8o3OXSScEakjo1fH/4ihwj47l1HXzQotntp7YRgQyLar4cZYKLfpq8nbpUW/1c14JH9z8tkweWpAG5yqL/Kl8hTGMSArk1izbdz4pgHY6vif3t//eFnMi1Z60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849976; c=relaxed/simple;
	bh=QaMlya95zkc4MjQsjQDNT36UA9lQmCeo4nFFSkNr0Jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gggBpvTxxEM5U1ORWBwvVuRqXplCbrUpdOxrj+TsMSsaynppsvnEAQDOr3R7iCxCOEtCHwE00VB3yztWu2wqtIhYgiwCSFbN0OC6IQzo/VP0YHAulhFMvpWFOzKoY4FwwRa4/DVlkAzR9ov5dCXGnXs3ysDc9IHEakE5nIeMd0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=X6jxjaUs; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="X6jxjaUs"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-226185948ffso2597845ad.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849974; x=1745454774; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAwcN61khauGEX7eRicTPKijk8SHQIgYsxBV6pw5EIA=;
        b=X6jxjaUseqA3mlfcyGWOTgPXo0hx5dtUuZoztsg+stkS4T9sKZ8+qRoSSBoSA2TfX0
         FMEheFb4P4gS6qianxV3BjciXNSHeKhvUHiJjFmaPjhUCaDaufZazEzRGA7endpPku++
         3VYqHuqWjDhIMOiMbOOGz17pnbarUQbS4SROR93qbc0c7WUVeVVnWP4AGDdlDiWSCS9M
         e+Pn3FspaHmgZEAsnTR5lc7c4Y7L/J4CUA6YlcHxIubXk0utPWPDqo9wDOmxnUBts27s
         RIaj8QKNbjgJ1WH3+NqR/XmAtsCnJQwJ5Va4rK91qJqHLmXLplwS4Vg+U75ITTN3v/9Q
         hsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849974; x=1745454774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GAwcN61khauGEX7eRicTPKijk8SHQIgYsxBV6pw5EIA=;
        b=vAZ2FuX+S9W2HUbNLB7cpwOTYjWBP8gvutq+RC4LjYz9Q3S7XOTeEJ5MuvpBbxJy2x
         uClAccOMrhiJ7au6H4fAKlRMUbex8xC13YttiZDeHPFC6GGQQa1TGj0NR/J6w06BOyRH
         jU+7isbhS4gh2vmcIgtyMRd2fDmFuBNfs/L775QnqkIvjCEDGt94klC4Bu8/rOZJWHUo
         UQ/oy4pSu7h4sodeV/ar7SQU7OqtB6v887WCdlGRWi9qa3lgah8PIHI4GiM5FxnVkMdD
         ECy7Xp/omU5R12a+0q9Oeb8NMuuB7Uj0hHRG+uFYDnZeCIxLDqVC6obh7oCBdi+GM/ZD
         abxw==
X-Gm-Message-State: AOJu0Yz/6BdWHInAxUFe+j9aZysTxWlhCQrUKlG/tmjiukdXitukXIuJ
	jgSHceZ3VOJiSsEiC1gl3GRulyrXPaiCB11qePvDRwPQ952cafqXT/AHBCsvYw==
X-Gm-Gg: ASbGncvhBDAHkRnKRzr8jmv2u2kLxyjZE8b5/julnjgVR9i0KIY+UZ5rGGV8updFo98
	y3KnmzHM+/34GAES8NKUct2AmWwHKWjoPHCPn7rK5gYx+0Fa8KfHnmTl/diwb3rUcb6r68Qk7Dg
	wpuRRA9evPLmKO1rJc3kv3VHGJQslnXPF2F0aIRLywAL6ASk9riuj3tP9N5tHh6tvowWRBz9qYd
	5lgLF9ExYJukOBpPh3s2x5VwN8GkpbpTBU3235GZ03O82Xn90S0rqeY9Lmr8ri+W7n2z+RPWmeB
	X3yczFIXLin/BcLC/K21X3f8hELi+4wRGpmGSWiEbmomSPvXwX+2B9v4G7mHTImBKTf2EGflJit
	Os/cKwQ==
X-Google-Smtp-Source: AGHT+IEvcFXIV6AshDKyBigtNhPkXzrIDw6+YPe/hpr+Z76eAm80FDheS6S3vY4+u1qqd/DLPTNabA==
X-Received: by 2002:a17:902:f684:b0:224:1220:7f40 with SMTP id d9443c01a7336-22c358c2996mr47815755ad.3.1744849974515;
        Wed, 16 Apr 2025 17:32:54 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230e310sm11414103b3a.149.2025.04.16.17.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:32:54 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 05/18] staging: gpib: cec: struct gpib_interface
Date: Thu, 17 Apr 2025 00:32:33 +0000
Message-ID: <20250417003246.84445-6-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417003246.84445-1-matchstick@neverthere.org>
References: <20250417003246.84445-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/cec/cec_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/cec/cec_gpib.c b/drivers/staging/gpib/cec/cec_gpib.c
index 03d5b6c4fd8c..1b02222881b9 100644
--- a/drivers/staging/gpib/cec/cec_gpib.c
+++ b/drivers/staging/gpib/cec/cec_gpib.c
@@ -188,7 +188,7 @@ static void cec_return_to_local(struct gpib_board *board)
 	nec7210_return_to_local(board, &priv->nec7210_priv);
 }
 
-static gpib_interface_t cec_pci_interface = {
+static struct gpib_interface cec_pci_interface = {
 	.name = "cec_pci",
 	.attach = cec_pci_attach,
 	.detach = cec_pci_detach,
-- 
2.43.0


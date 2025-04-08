Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F26A2566F4
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151830; cv=none; b=s5yjYc2W3gc/aoxxeAAZpQ2zuZugoMPBKbhrrTWjAM6mnnAk6WAgrWEdy1/0L/IYrNKFYcjz0XF3EBw0VoMNsnoGTlEnfn+2RZhaKWbgxU9C4/5R2IyMdFLl5S+NJB+J2pHxtt5yNLz/pbdgIsSkhsjVEQtoHahIUZPZjaVMvf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151830; c=relaxed/simple;
	bh=uO0WEOl3NJdo8eeK/l2yzXWRkzHpMAOj27lRaFN0xC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eInzu3tWnKgx7o0UiXzknaUp6grU6bI7osBnmCFXqgoGExQikZlh2XiTHqojxgA7Mk4geu2KNSfBdPYCH9rNAfst/Utl5ff6eWHlkYkh4HHYSm3TFvzmSR4TOYTCNCDFM8das8V679pXovBV6sVIqdDeBPfX3FBBaBrv4euDwRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=LBcHj2uF; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="LBcHj2uF"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso6564990b3a.2
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151829; x=1744756629; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMoJ0GicUz0RLtgfdlS2esbiLZrZHMdlYnOr8+kJvrw=;
        b=LBcHj2uFpw9vjK2PKfsyyIXvJ73eYdYrK5mvCQqD9CuWShotuK29zX4NRgaQE9ixQ7
         6ItFdUT3Bvqt+EoS+c2zoKS1bCvt2wct3FGh2+esxVkxtTa/nAtgx0Arg47MRtfgIKIQ
         MzJOOkezo+2+cqlUapE0xfXDNaO1XpZ3XXe1IpsvuxrrW5jR29u/FH3Z2N7ppmajy+qb
         k918Quxr+nVb0z13tkQT/A56olsfbWt2OT9zW6uRZZejkp+AdDBK0SJFaWCrcug14CUX
         3gWKRVl92NyDphpFwsmBDY9B4VyMXoXVH9lZvZygy+WsH17TOg3QpBvi3U2bUb0JoFEP
         DUbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151829; x=1744756629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TMoJ0GicUz0RLtgfdlS2esbiLZrZHMdlYnOr8+kJvrw=;
        b=kjtTOBRgAUC3FMMzhXN7b4CTCExYn2cWvvEwPeqG7DD1m1IznX3Kj7ypjxMOTBTwQY
         zg2c44jvGadcMt2J166ZYvl+CS1z5oaneC6iuI9JVrmSpnJtKVw/IrPQMwBuf2KffTMl
         sXnpEArDbex5sg3uO37WD0N5/FKs1bAlRBxxFsO9gk8/VERLszbIm1KJz92KGHjZ3HM3
         xKfj05CuTsHusLdcYPZEarX2tLVnUQEy6ayDz4QXm6rpdXjFAPtZoVxccr02H4vPWi+a
         QMcvOHPRmRFwTCB7Jxk1478Y8zV1eCw3fsBq33/FyztAzCMlH7uBmEvkwrF1ngyjtVDf
         +HFA==
X-Forwarded-Encrypted: i=1; AJvYcCXHZe0zF048CvW7VJjeVH5fSC56Z6qit+zreES731AGvcyn8FRD4COhSt2+wcejHctU/0PzYobYeUsaqll4@lists.linux.dev
X-Gm-Message-State: AOJu0YxGSHHsBfnnnT0wbC2MtB13RK6wr/f4cSSmAnaziBLRHutbktuQ
	5qZZR+/79kah2CMT3H97azT6cWrV7AzWTKGB0+nXlawaDJsqNI8C3jN0sMzD88iTRliYgqgs52I
	=
X-Gm-Gg: ASbGncsq8V+QEVlXc2bBlYa7PWKbvsN+RZEJR4Uvf/ZfqLoSmiJ+h7B+3NwcvXwev0/
	RVSohrNc+O1rM8cDDLSkEq0Up7xu36G6SEaAfSt7nnrtdcyAo62uL4+tSjBuWFc+9SZPSD+Jb5X
	XQDNGmbva+qouAeu5zXdfJXuSifSinUOKtUaaM4E6OyxaslshDyIdqT/qoQY8UjOVfp8YyYZjCM
	e/JPjDVA8Nw2bEx3IG7t23bHeR8V08zaLNJKW/707Zt362hAo3rtMr9rx8SwKX3oN/LG3PMtpBX
	axxpltIPrNRANgA8l9KskC2ghTRx4I4T5GO2WbCJkXUjlVFn9nexiu2bFtdrSJukMcvPJ9w3CRk
	ZMfiBJySHEA==
X-Google-Smtp-Source: AGHT+IEcFqKl2v/rldxmVTFJB42fvEpdpDtJ/GW+jfXpR2xPqh4+7znLLqZf0ROtRe4CiK2GHp+/Xw==
X-Received: by 2002:a05:6a00:4606:b0:736:9fa2:bcbb with SMTP id d2e1a72fcca58-73bafd708c5mr276174b3a.24.1744151828779;
        Tue, 08 Apr 2025 15:37:08 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9e9dcc6sm11505636b3a.99.2025.04.08.15.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:08 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 05/18] staging: gpib: cec: struct gpib_board_config
Date: Tue,  8 Apr 2025 22:36:45 +0000
Message-ID: <20250408223659.187109-6-matchstick@neverthere.org>
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
 drivers/staging/gpib/cec/cec_gpib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/cec/cec_gpib.c b/drivers/staging/gpib/cec/cec_gpib.c
index dfc718de1532..1b02222881b9 100644
--- a/drivers/staging/gpib/cec/cec_gpib.c
+++ b/drivers/staging/gpib/cec/cec_gpib.c
@@ -40,7 +40,7 @@ static irqreturn_t cec_interrupt(int irq, void *arg)
 #define CEC_DEV_ID    0x5cec
 #define CEC_SUBID 0x9050
 
-static int cec_pci_attach(struct gpib_board *board, const gpib_board_config_t *config);
+static int cec_pci_attach(struct gpib_board *board, const struct gpib_board_config *config);
 
 static void cec_pci_detach(struct gpib_board *board);
 
@@ -265,7 +265,7 @@ static void cec_init(struct cec_priv *cec_priv, const struct gpib_board *board)
 	nec7210_board_online(nec_priv, board);
 }
 
-static int cec_pci_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int cec_pci_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct cec_priv *cec_priv;
 	struct nec7210_priv *nec_priv;
-- 
2.43.0


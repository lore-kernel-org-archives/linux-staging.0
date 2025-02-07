Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8994A13D244
	for <linux-staging@lists.linux.dev>; Fri,  7 Feb 2025 15:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738940789; cv=none; b=pegyWs+Phm/07PCdh9XdZVSG0tc+BQ3Kd9Ukorbu82l0v6qN0Ma93/ciMC0rt6NPTOfzTuU4tprvbFwW9tngeYFXWC4X2XqifUnpNuna9QXU6PYQGnuGHmJO6rQYAEmrWz3zeFFPGzZabfCQkCb2MkxWSmHx+TmIk1VhGhuSUCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738940789; c=relaxed/simple;
	bh=XIKFweN/ns236gfX53f8NOSSTvLU+IWqbzdLwbrFbtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XkbMgEsD/wYPe/oAZAhVogfRX2r5gGLFevjhNPsMAOtNdeORPpVjDZ7qwk6vAaXNV4b/9Q/w1lZ6cfMbG98/n0QpjFdA928kF5E9rycIRyiK8szJPn850c0sX3lJfueF0iXRk+CfLAATXB0/F781yI1AZYa16wxWuaT+wBrK2BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TplXOUal; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TplXOUal"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21a0374a1fcso5405865ad.2
        for <linux-staging@lists.linux.dev>; Fri, 07 Feb 2025 07:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738940787; x=1739545587; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGUerVEaP/r2Ie4H65h0uviVJMnH7XTNKQyzuEKRMpk=;
        b=TplXOUalH8L2+iTlBA6A2WRpumD+JBeBDuvmVY59cNuMgZRzDzzkwvv4uPoju8R0GX
         W07FIcen8Krohp3pjdjoy6Fem3/J7r0F0xPsGpT/UuaI/rgBgQjnEayoh0BgXvd4vgaB
         Gy0Kn3+sb0O6ZcAf4VfPigZqcbdQgeGq6KBn7TAd0uisAM//ou7caFvK6DDr6h2lOY9r
         gjmJsPdvopSNsEZjpiGEPNSoeszuEfxMefyqB2c91qcDsf6HG4hewRLzCbGpKs9qBnUl
         xIRH93LJHMlwyAnrNtrvIT+aie9UQKF+3PSIBS/1jMvRD04wkE9AeG4w8di2I4KXN+mH
         kIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738940787; x=1739545587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lGUerVEaP/r2Ie4H65h0uviVJMnH7XTNKQyzuEKRMpk=;
        b=PbDzUouFQZEnvV0tytNusQxkfzPNtNgtTb7FrQR1BxvK0W4SaEswKlYpdAsFqvHeGw
         1JuKMnHCxxzy1MbmdLdtbIUi9ccLLwnc4VEwgr5OKIY0uLbh3ew9nonGUYi2Uo5sJXLK
         3rcjCWoVslwk2jL61pZV+tD8UGxWG4RyIQUfbtieA3rl/Z0YstQ9BXu8nCnhdUx36G9J
         AyL6BVEcQSTqv7h+vsWePLIqPHn6ttoNVV94ciD+cxWaqsA+pFxuqbe9fpFYMm1+cWIq
         mTc9PCaE5feyoDYwGpPtV5FA6Bg5VLNM8NiEuiok+O8yazycErtI+5MLu+qz0EYROOD9
         1iJg==
X-Gm-Message-State: AOJu0YyW+J9CArEXZgOBF1GlWfCgRqVruMp5FutPLR39y2T5a2AQGdYd
	1qVVdu+uHgFShR5H0KWVfsL22cfbYABuB6XSFslJHbUa+wRsCv/TYGMftEyt
X-Gm-Gg: ASbGncss4re98nYmPuisOIYlYnvwKKoozWwbG7qZgFGEJDyCPiOzreqav/8fpZQSfUJ
	QOeIKe1cDl7NTpkG+OyRJvDOhRhPThkjEpZBxI0q43r/H+vADtft+cjaf8da0VQorjodZ0gGOBZ
	pcLGbST3leKLs58Px2UYz0zu5DH/1Q8T502Ph8uTrG0N+qwBcOX0yk1FqNjdDVqS8KYffpdsBuF
	T1GiK6Knm5HFOCyT5ok5yzfxMW4/hTfegWjhokfmbpunXVsXnj/6zsnr98VK0q35DoBZi7ZZkd/
	8lpvXhW9hC60KZB/OpWq+K91PSVZ
X-Google-Smtp-Source: AGHT+IHbNSBKv+mLmDyiUW4lTeqU7DilrX86GKMa83qWVrkrrBALGDq4fEdt4ayb2TD1dnayi5lyug==
X-Received: by 2002:a17:903:40d0:b0:215:b18d:ec with SMTP id d9443c01a7336-21f4e776697mr20473805ad.13.1738940787425;
        Fri, 07 Feb 2025 07:06:27 -0800 (PST)
Received: from localhost.localdomain ([2802:8012:30:9200:a83e:911f:eb3e:1cb7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653b143sm31855815ad.54.2025.02.07.07.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:06:26 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	dan.carpenter@oracle.com,
	ajithpv.linux@gmail.com,
	roheetchavan@gmail.com,
	niharchaithanya@gmail.com,
	eleanor15x@gmail.com,
	everestkc@everestkc.com.np,
	kees@ijzerbout.nl,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH 4/5] staging: gpib: tnt4882: remove unused variable
Date: Fri,  7 Feb 2025 12:04:11 -0300
Message-ID: <20250207150427.153982-9-gascoar@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207150427.153982-1-gascoar@gmail.com>
References: <20250207150427.153982-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove unused variable 'retval' in function 'tnt4882_update_status'

This change removes the following warning:

warning: variable ‘retval’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index 2e1c3cbebaca..a681bf559b46 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -704,12 +704,10 @@ static unsigned int tnt4882_update_status(gpib_board_t *board, unsigned int clea
 {
 	unsigned long flags;
 	u8 line_status;
-	unsigned int retval;
 	struct tnt4882_priv *priv = board->private_data;
 
 	spin_lock_irqsave(&board->spinlock, flags);
 	board->status &= ~clear_mask;
-	retval = nec7210_update_status_nolock(board, &priv->nec7210_priv);
 	/* set / clear SRQ state since it is not cleared by interrupt */
 	line_status = tnt_readb(priv, BSR);
 	if (line_status & BCSR_SRQ_BIT)
-- 
2.47.2


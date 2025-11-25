Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC7532252D
	for <linux-staging@lists.linux.dev>; Tue, 25 Nov 2025 14:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764079480; cv=none; b=gW3nWlb9TuJTMaciTdQUte5xAITC94PIbXMiCkPg5bxD0K7Q9640O0dt/KIDZQ8Bahy5g1WwjRKBPIs40vVO9qaLwR5Jqm7qJCZPG+yESTbHZLP7a2Uky9P1jqEuU/5EbIvGTCsrXYInIlWB3Xbcfy6FbMkofpmp9etkp3QRtLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764079480; c=relaxed/simple;
	bh=diYeXzzaGTFWF3KiucDcqBi2mEoV7gJw0KATaTi+p+E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cnw/s1P9bZ5rEExcUCQx38EoIvWNOfmyca2FLnmRNWY/05GMn5PQgZUVYB344XXpCeKro7loFVjMfObVnrfOhhrWCbexOLLhQGKxNH/2kQ6FPqvO68sv66TpxR6tl+m2MYZY2bfdSRPXg3t5F7qq9K65FiOmZTA8pLlQis6epcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aBHi52So; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBHi52So"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-640a0812658so8945690a12.0
        for <linux-staging@lists.linux.dev>; Tue, 25 Nov 2025 06:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764079477; x=1764684277; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eQ/hdFUolvQ/l8iXHdMWqie1eUkQ0dlmlxxYDVfHqKE=;
        b=aBHi52SooszXHPgChireLL5Ud5o1sYg4HdhuMaH52J839EFNKOOU1ybFwR9Fr05Uvh
         o5kuXzMWSruzGprlm6AA7lnz7ot7sffjmmApx/pTSg3yKso0vLtIYbptNze+GbTAUDb5
         N5LG/jXK9ZWCXek/wf5wAicmii4xJz3jDpJlLP8NtUdy2krcSpAhKh4NM5ztU5dE5sFX
         b54B/QFiBnNs4MTmWlCfDmWg+aNZPq70ymibhciEznhUph0vG66gFZzgcJcjRZo4apFz
         WtyUYMIW5clWCEFpX7TM6JVS8nAyOVeQHitKEvZjM+rpVL+OO7rqISLYwlkcz5G0h31d
         P/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764079477; x=1764684277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQ/hdFUolvQ/l8iXHdMWqie1eUkQ0dlmlxxYDVfHqKE=;
        b=TrDv526x8tJ5N47O8ndMSbFy88TOagMR1MMcIdNBhr6FN3fUwoBQ6TF28LkRMhascC
         NDwSWh16LQmC67a9TeW/78lKxnw0p91D1rpRFNvWDeSAI1U7epMTebgv5i0FjlfrZxE6
         HaEEGnNB2vq3YPcQqcCb7+FslR1aeUf2+rEYg7VEWpUoM7W/Tge/b3rzHVixwbZHE+kr
         HtD/41fjRqPGEHIxOuQFdaFNOiREEHgSsxFn1sV6EnjE3g7nJ7vbEVJ9cS548l4HY7Zm
         fqokH5ZYfaalMbDk7uABlsx0N/J/fUM67p0AEYuy2RauWb+3haUBH7MXkbuovGWDV70E
         rtcg==
X-Forwarded-Encrypted: i=1; AJvYcCXfU6Eo7G/uQSQldVngyhvZa69y3p/PXk0yNdCMCl68Xd1zYnsCWQ9lIw9wSVodmWYwTHIqlOKSJtXgQ/j/@lists.linux.dev
X-Gm-Message-State: AOJu0YxEX0nm22LgwdggkHQZEglS4LKD1Gs/ubZJaRmnIVorvsP0mil4
	yASj41PARRPSxwiHMVxHyll8nHEk5ipfC37K/uDUp2zDO4mgfqnz8+6j
X-Gm-Gg: ASbGnctVOYM4258S2xiif1byv6XHVJVh8KKFuul8qJjNtOCDgeRLLzRQeZTxurTotJ8
	vBOr2d6HY7+tSNY7LawAv6OsvmXqScDKo1YAVQXu7oWBNmsOJFNEW808sjljEAVe251Qs1Z2JKT
	mAJOal8nqreEyPodWLmAQnebpzSXwrV41HwiwJfa73WkdzAQ+l6ddA1oisxV/k7F8U0H2fjoiBO
	3jtzXQ5CCUJH/Nf8qpN4T7ETKhm8R47NgtWKpANtKPdVtt9bJwpRdoXPrW/YvBKJVNpW7BgRGjf
	k2LT6Lx7VtFo7u5dNEwLUbZtGlGKesO8n7j8G1etn3GwwJPdyAf2WYLLt4nW7CXZvD3GXxVk9HX
	EQzJsD1ixMLTylbaQo9t2hME/ifopVyNEN2957VAEfI8uejLphk4yu4wrAaaRjsl0GOsqsWZxoY
	J4mh9RAiOqMznnu56VAQbjYLnyn87mkZQvs+/j8A==
X-Google-Smtp-Source: AGHT+IGwNU2hpYKPMSACEsdv5UDBH8TTnLBuFr5TTblvZRcoD5o/4yEyr3HbvFoIvhlZVXVFrcpwrQ==
X-Received: by 2002:a17:907:7e92:b0:b73:988c:6 with SMTP id a640c23a62f3a-b76c56309abmr283830566b.40.1764079477449;
        Tue, 25 Nov 2025 06:04:37 -0800 (PST)
Received: from arch-linux (178.42.50.207.ipv4.supernova.orange.pl. [178.42.50.207])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654d80665sm1564430666b.31.2025.11.25.06.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 06:04:35 -0800 (PST)
From: Tomasz Sadowski <tsdwski@gmail.com>
To: Dave Penkler <dpenkler@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tomasz Sadowski <tsdwski@gmail.com>
Subject: [PATCH] staging: fluke_gpib: use kzalloc instead of kmalloc + memset
Date: Tue, 25 Nov 2025 15:03:35 +0100
Message-ID: <20251125140357.87880-1-tsdwski@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Tomasz Sadowski <tsdwski@gmail.com>
---
 drivers/staging/gpib/eastwood/fluke_gpib.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index 3ae848e3f738..2b6ba7882dba 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -853,11 +853,10 @@ static int fluke_allocate_private(struct gpib_board *board)
 {
 	struct fluke_priv *priv;
 
-	board->private_data = kmalloc(sizeof(struct fluke_priv), GFP_KERNEL);
+	board->private_data = kzalloc(sizeof(*board->private_data), GFP_KERNEL);
 	if (!board->private_data)
 		return -ENOMEM;
 	priv = board->private_data;
-	memset(priv, 0, sizeof(struct fluke_priv));
 	init_nec7210_private(&priv->nec7210_priv);
 	priv->dma_buffer_size = 0x7ff;
 	priv->dma_buffer = kmalloc(priv->dma_buffer_size, GFP_KERNEL);
-- 
2.52.0


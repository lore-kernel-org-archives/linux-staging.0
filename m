Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D957921ABB8
	for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 17:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744997701; cv=none; b=nszHFAAm8ynxmvov1NdiWZm3SohGy6lbf8ujcsEBR9Qdu7d/tQajYZQQ/mrlC5LvM8D/roV1bR4ZppJFRGBeLkO405lgLQ9hDGtyKPKRMoFNkGzlAKv0xaosR3scsNuUKyGo6NWLLVTJWljuAFBX2Yu6b5JIUpMgeNbIKk1IN4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744997701; c=relaxed/simple;
	bh=Y6+jh/N20q5vgDZ+rUTiFEYPLOfUfkLSliU92OGQsrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GjAVKPYnyFOlVtxnPzdqDVhFiJAjkAgN2F5PE1MFdeG1piunxMn7BFp/yh52nTSkbA8+eNT8hpCmG7BnTV3Tb36HJgFzRpTW9MITuuzhGFdAEAu/cCObyFSdbA5/wYPMb/L4KFYfA4ULQRr/vGh4OJXSDVC25jhKxQiTxuH2Otk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CxgpHUzD; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CxgpHUzD"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3995ff6b066so1156782f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 10:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744997698; x=1745602498; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IzATcEFy4yD0nb8pE+dCXra4c1CFrIcpPdFq8ieoLC4=;
        b=CxgpHUzDthdIZSbY1QlyzdkRMA7E5e9qFTT3NlajOhj3Dsow36I4bh9Slg22Vftxa6
         +jl8H3cXSQuJeIRmimdfe3iXMKxNw1t1wh+VnYwSCVQtrRaJMCZTE6o+p5hWsqAMrmW1
         kvo3hxXSmZqcNls+/wxD7qQGC7u2hh2I/yIvaeZPQ2Qm5jhs+Z9qMju24O9av2dQb9Dg
         /g88Rk6f4J5gUEqGqqdfa/MA9dNkfahfcURFVBHgV+Q/ooMphMTLKCzofPK5I/n2v3Is
         GvoPV0aFds19l1wIzvNLdw7Wb1nlXDrLvoC6uGVVsl1UN/4sqYXrb5ouCH6ZETB6B1IT
         ptmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744997698; x=1745602498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IzATcEFy4yD0nb8pE+dCXra4c1CFrIcpPdFq8ieoLC4=;
        b=B3BjLMdJD5KH6uXMhtFijcHIFhHizbfDEqdOlnjoy+G+8WDJsLao5c7mkwtz9C3NpT
         ZeE+R9iUC7ynurleftI57S1FbYROOIZm9sD9z6pbZCf6KAxe6LTJmKyLtCkrss9TgnwA
         drAjsUq6cZjyL8G0OvxhyM0/8kLIqsmOr7ymckHTjq5Q8o1FYhcnCZzXXF4t9W8TAnM4
         PlfpHuarrti7kKtY6J4+KzXADSbQmhf8Z+290K33Eqrwh2zNgrPTKwinvt+8KTwWmMeq
         O8PwUU3y8/Gvdwzve5HuQ+NE0xaWjcOqKSuJ8w5T3J6DzyWE4HVzNCl8oSIoAGSIE9nF
         lMXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRyjSRir15HZtFe41oOEAAq1qLujmtNrbC9Ux6RD47zcm2Ww/X27XmXBkDYSMq+EPEn/mU+DYMUiCM+y2f@lists.linux.dev
X-Gm-Message-State: AOJu0Yz71wQL/dMiXWt2WtCoZgeXixyY149Uxvk9G9/O17x4ePQLXn8X
	CS5Jnmjp8+5XpEXr655j0Cw+UmOS6alGmNxi7bG950MMdOK/ix3u
X-Gm-Gg: ASbGnct/bqN2xUFlPAoc02KecO3Kud/iH9Cql4NVwC+aBkbLlVpRBydghonKZgSRvdk
	rVyBs2flwdiZ1381tP0HUnEdrTgytnojfLTjFaD839Bk2SdZxjYboUY6aR4w+UYD73fRUYUTyg/
	nzWGTP8+jqGShzvRxRQl+icHQIzfYyMD9iplEZADotXhzjy2nrz5wE9iQKiXyBnn/fDVuDfzT04
	+fBkUVAenrFYTe4g7kImFdOf/A2d3A+PgC2c9gmDzzx8BAuMOGKbv9QvAuWvH8Nc7aY5rtq1YT1
	IHd+FArTdaK6iJwL5EHLU2PSUQtfzsMjA6FiSzg3h4df1q+ZxdC16WZNRla+c4TvNYpJfyVm1DS
	X
X-Google-Smtp-Source: AGHT+IEZf1ha1txArdhgWM8acBtGgyt+WHvJBGwchmFEH5kJ9VtYLcai8G/K+Zp0NjdzZjrfpODs4g==
X-Received: by 2002:a5d:6d87:0:b0:390:fb37:1ca with SMTP id ffacd0b85a97d-39efbb095eamr3057655f8f.53.1744997697904;
        Fri, 18 Apr 2025 10:34:57 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4332f8sm3287320f8f.40.2025.04.18.10.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:34:57 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: marcello.carla@gmx.com,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 3/8] staging: gpib: Enable SRQ irq on request_system_control
Date: Fri, 18 Apr 2025 19:34:29 +0200
Message-ID: <20250418173434.2892-4-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418173434.2892-1-dpenkler@gmail.com>
References: <20250418173434.2892-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SRQ irq was being enabled on attach but the board is not
set up to handle it until it becomes system controller.

Move the enabling of the SRQ irq to bb_request_system_control.

Fixes: 4cd654f84769 ("staging: gpib: Add gpio bitbang GPIB driver")
Tested-by: Dave Penkler <dpenkler@gmail.com>
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index a92c4eda99a0..ac9ecb6e0aad 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -884,6 +884,8 @@ static int bb_go_to_standby(struct gpib_board *board)
 
 static int bb_request_system_control(struct gpib_board *board, int request_control)
 {
+	struct bb_priv *priv = board->private_data;
+
 	dbg_printk(2, "%d\n", request_control);
 	if (!request_control)
 		return -EINVAL;
@@ -895,6 +897,8 @@ static int bb_request_system_control(struct gpib_board *board, int request_contr
 
 	gpiod_direction_input(SRQ);
 
+	ENABLE_IRQ(priv->irq_SRQ, IRQ_TYPE_EDGE_FALLING);
+
 	return 0;
 }
 
@@ -1299,8 +1303,6 @@ static int bb_attach(struct gpib_board *board, const struct gpib_board_config *c
 		       IRQF_TRIGGER_NONE))
 		goto bb_attach_fail_r;
 
-	ENABLE_IRQ(priv->irq_SRQ, IRQ_TYPE_EDGE_FALLING);
-
 	dbg_printk(0, "attached board %d\n", board->minor);
 	goto bb_attach_out;
 
-- 
2.49.0


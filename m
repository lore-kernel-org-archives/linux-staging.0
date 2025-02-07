Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C1ECA6B
	for <linux-staging@lists.linux.dev>; Fri,  7 Feb 2025 15:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738940743; cv=none; b=tZY9UizSldFEHdgvhiMmOR2+U2UAuFCMW6dulWC2fam64GmA73ajKVZnnUGjfIw2IutFcQzo6JKwdty4jXwwEV+r1N4sC1XDg72y0TEfEiSM4WajFRVkz7KkaIwq3Kbaps98hnxP0jontjwqb0jO6VztpVvePjcu9Z8IR3dVj8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738940743; c=relaxed/simple;
	bh=tpnl5paSFKhhqeqQuFY14M6+2w0Ab9dzNNVQZJyqExg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fnHVukbbA5xbB85nuNnhfo1ZWLFUps5WEG/Yk5eWoT/Y36iXATkMEJBTZiGqM5ur2z/1A107N/wKZypHF/oLbJQ6brp4wia7maptOgVSvFmEu7+GiDjxVoFUa5rbuSijKkRQMTooKvhpo5xWwMj9IY4UDOJuqSNLY6JuTDuVHto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHL2c3y8; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHL2c3y8"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f9b8ef4261so495861a91.1
        for <linux-staging@lists.linux.dev>; Fri, 07 Feb 2025 07:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738940741; x=1739545541; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSw42FRgNCjxmewimBSBZv8A2FxIaDRWKJvRBMe4boo=;
        b=LHL2c3y8ZGr16PMK9O5gQnsplR7/deS10KCla9vZTI8bu8nJXXf9ibSFtw7Ya4m283
         mOgOK/UtAWXMWcRl8pCHNYe6s5zUZx9866kF0iLQg+Q/r6qEtToPVr1xJ09z9Xni7nPt
         Xe/V2AYPrw9oYgWnmG2D9pUT8NRbkw8uh6MZi5NJ1XslqvqRQ7AIetnbfTefwvdENC+C
         0v45GF+Ev3ud0NhrSKpFdF2rk1wPuWYv+EY4xoLT4pC5VgR0lau0LiwITUQtOo/dYi5J
         2lBgguuE/I9Zhi5Low+1i9C+Iti46kszXoB2GfbE7b07bQRQp5vatTm94uZGcMgjGXiA
         sIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738940741; x=1739545541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gSw42FRgNCjxmewimBSBZv8A2FxIaDRWKJvRBMe4boo=;
        b=XnMaOW7p43ztshh9fudxAvHaE4n4/vOgb+/XIuag6i1mZWiVTCgVa2lIdme+IiQ2hZ
         uzYW6Y3u66b6n6I8JvJd4IfDFHfEBONBLPGib+YUAf2OtucH7Oghx1xU6HAW/A54oubk
         +7HgaoAZcMPfwcCdrXMXr1VtoeaDPV4+Gz5qHmtgv2Vp4S3XE12Ti4JPAIl3xGYwDphX
         96ToHpbvsRTeeBr1Ma1TQqGYBUg3k8ekAeZ476s6hHNyINiQVUAZP3e15Oeb9WfavJrh
         Urcn6/LUfaq0JfLj++gPefih+gYwS+DAPqvXjlQTG45jy7SfhovR+/HPABHAkMbhlSIv
         7c9w==
X-Gm-Message-State: AOJu0YytTfiSORz3Cq1aj8xrtrZ7/LLwUaQuquM+bpmBnrDMGcajkH+5
	gqTxTjiKSI3tNKT8K+9BB/58iOYCuN7U+x5SXEwjZrq67DjntHXL+orXKbpt
X-Gm-Gg: ASbGnctWiVN+Xc+EWPRZuJARZ86lRXPB/CBn/CxyJ4M71QQ2KQK7T1kO7bBtLYUKxCp
	KtnHCiGmv7vx6iF8tJEKPJ/xcrtOn80LnrDsNRtI+BMr2Mjb+3V1UNNNl1cqNQ9Za/3zoJATk9+
	6tylRN7MtcpTmjR2DJ1ko5/Mao1G8KvXcGEiPWp4qB1iU3M3v1npa2pzPXSRFeOqnq+3ERpRtPN
	G3jDdBlXLZJsogsU/yngFUlLrSelPH1d+9izn1iZG/l6viXHDmpsvI+VvWdYVHI7QWdFlgA7vVR
	e3YGZic53DWot9gSCmRLKwJDcOin
X-Google-Smtp-Source: AGHT+IGNlS0T/GdMUhhWevTypVg2UM3SagditpbSAkAM1Hr29uViTN4tQepsg9ZLAW/QQ9Svc99U2A==
X-Received: by 2002:a17:90b:4f90:b0:2ea:c2d3:a079 with SMTP id 98e67ed59e1d1-2fa2452c66fmr2112982a91.3.1738940741221;
        Fri, 07 Feb 2025 07:05:41 -0800 (PST)
Received: from localhost.localdomain ([2802:8012:30:9200:a83e:911f:eb3e:1cb7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653b143sm31855815ad.54.2025.02.07.07.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:05:40 -0800 (PST)
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
Subject: [PATCH 2/5] staging: gpib: eastwood: remove unused variable
Date: Fri,  7 Feb 2025 12:04:07 -0300
Message-ID: <20250207150427.153982-5-gascoar@gmail.com>
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

Remove unused variable 'nec_priv' in function 'fluke_line_status'.

This change removes the following warning found compiling with W=1:

warning: variable ‘nec_priv’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/gpib/eastwood/fluke_gpib.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index d5b1a03abf11..65bb79a8fd3c 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -194,10 +194,8 @@ static int fluke_line_status(const gpib_board_t *board)
 	int status = ValidALL;
 	int bsr_bits;
 	struct fluke_priv *e_priv;
-	struct nec7210_priv *nec_priv;
 
 	e_priv = board->private_data;
-	nec_priv = &e_priv->nec7210_priv;
 
 	bsr_bits = fluke_paged_read_byte(e_priv, BUS_STATUS, BUS_STATUS_PAGE);
 
-- 
2.47.2


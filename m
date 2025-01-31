Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA218156F4A
	for <linux-staging@lists.linux.dev>; Fri, 31 Jan 2025 08:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738311759; cv=none; b=r6LZxKDQTO4zLi53gD1PWKgB1KfqRqCAlKVNzFBrhj27E1JVBqg3i/ZlaN0a43TdNgwA8f1cGCcIdTAPAPRT/AW0FycwDz7Y96KCdHKLVjjSjuW3mYltwfbBGbwpjDEZwWqR5dH73MnwF6EsREQwMO5H2IZ3NWR0wKfJLJXkOmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738311759; c=relaxed/simple;
	bh=PaQ368fVPMewttIZp9E7uzLfeYFRCOr3sNNw4fdTGx8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bkxe+ku6BwZq98QOPWzvSv7COM0XwK2D4fmhb4EtB5v303MlGpxIy7mhLKJcLRiOEVQ8FG49w8AHNY/FXdvS1t7Nb8kccLNcJ2vpj+51IhXFhhYBTgKYHeHqylZhmyI4R35vCf99B4smnOSLt5LN3Z8qDr1x9mrJf5PIt1jmTZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DANh/agD; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DANh/agD"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ee397a82f6so2937322a91.2
        for <linux-staging@lists.linux.dev>; Fri, 31 Jan 2025 00:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738311757; x=1738916557; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PVysL2IB+DfURM1n+fDW+H+cpBepoWOEUh2zNKxVGc0=;
        b=DANh/agDOEiB4OMOasfED2aSvGD7HZf0OfvDELWtR4s0Ve4pNM/v/WcuhStuxc1xG/
         +d3jy/5CRMTkoYBP8dFg4glpXGmN7ztclWsd5C9CA/oxpuOuww1ETwXnebzf5m2wP+Ej
         TQy8Ndv/wfo5Q28x114Zq59LQ7gCPx1da5jI6BA4vPF40nUJpSHl/T2Im4r0XUjItKcx
         m9QhcO7dJ9eWP5OMChP3P+x0OwASorv5aR7Bb0l6ibzg6L5TZx7DL/iPRJ5wgCdsFPLt
         FWGYxFlbrNpxFzuHOKouUVakNp9S8HaVUOFOG006AL5qFNec5lphD3QHHbIexsEm9R15
         0qrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738311757; x=1738916557;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PVysL2IB+DfURM1n+fDW+H+cpBepoWOEUh2zNKxVGc0=;
        b=wkcE3yq5hBYPtUMRjyN5mbRVOv45qU328GVvG3AuBWyTxQM4ERMPtkrJwGxdo3jNrA
         to78nUb7f3wIXlBoN/KSmTApPfLtTXNQZzliCea2YfBQDPrWoTdWgwYqFm1nr9nONNXi
         iiLkvBCQUh5iGJ0Cv5gJ7GrspPahj5FBqpcTVaLqD24QLIN2U7B09Qllc5nOn9AAgz0w
         OG6O4/6+tGT6I4GvHGUa9yD56E7EP/9mf3Mi+r6TuWJB/mewZ2Npltj+JVQ4R8FB7+mG
         9aanelWtPemXixapwWrqjonC66eN9OyMg4333JjPreFUD+U2q/RFQIEcgcDvnbMbHCRw
         XHyg==
X-Gm-Message-State: AOJu0YxKpqnP2YORqy7RWDMZapg6utA6PWqGgyFEk1rQQQdasCWPAgJm
	ist1sBlTzK4Wl77xK7LFb5rMalH0OpxYLP/o/NRDKO8w4FFdX6+c
X-Gm-Gg: ASbGncvkaqu8FODXkjO0G7afQBIlZHXzCmicSTf3mPinmmEBmEDg/BfZmBTJfGqrD1R
	nmq3dqaz8H+lZR0+6igKk4X+HiYE3gM7rdx9pqc1boA4nXrS+ymQtgq7qvuCwE9QowNWD0QN0be
	xR6EduGmXbaJtywF+XRR/Hylw3mps0U+HxPjXmsT4imurMQNwPB/ptyi4YZP0p8HGek/XcxWu5b
	TdMUP2ug06ejQ3nNt20hHVz80dh3ecxve8x4K+1ehsdEH+rmMVTcrzHY8xmVrYKgBqIKlub3USD
	kxVWXAuqfa7D1A6dan/Kf17bn5ph8nqJvpcMFY2KTdy4c5sgSFdkvDf5+6XpkUKIdI1lc6H5wDi
	o
X-Google-Smtp-Source: AGHT+IEf7md+H3SDDXI6rOSxfpejiJtQiNvxIjKyKYLNej1x2IF2EuQw7wriDNAtxkoE6uCd4ll+/w==
X-Received: by 2002:a17:90b:1f8c:b0:2ee:9d49:3ae6 with SMTP id 98e67ed59e1d1-2f83abd7da8mr15929464a91.10.1738311755097;
        Fri, 31 Jan 2025 00:22:35 -0800 (PST)
Received: from DESKTOP-GL3U3CJ (162-207-94-177.lightspeed.irvnca.sbcglobal.net. [162.207.94.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3302a45sm25026465ad.177.2025.01.31.00.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 00:22:34 -0800 (PST)
Date: Fri, 31 Jan 2025 00:22:33 -0800
From: Ian To <onlyian4981@gmail.com>
To: dpenkler@gmail.com, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: gpib: format no multiple blank lines
Message-ID: <Z5yISXwXoyl59XWo@DESKTOP-GL3U3CJ>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Avoid adding multiple blank lines. Reported by checkpatch.

Signed-off-by: Ian To <onlyian4981@gmail.com>
---
 drivers/staging/gpib/hp_82341/hp_82341.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/gpib/hp_82341/hp_82341.h b/drivers/staging/gpib/hp_82341/hp_82341.h
index 0065ebd9747c..d3cf1f43a1ef 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.h
+++ b/drivers/staging/gpib/hp_82341/hp_82341.h
@@ -26,7 +26,6 @@ struct hp_82341_priv {
 	enum hp_82341_hardware_version hw_version;
 };
 
-
 // interface functions
 int hp_82341_accel_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end,
 			size_t *bytes_read);
-- 
2.45.3


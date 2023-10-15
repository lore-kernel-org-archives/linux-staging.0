Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759BB63AC;
	Sun, 15 Oct 2023 11:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JgbsL9A1"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5a7db1f864bso41882447b3.3;
        Sun, 15 Oct 2023 04:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697368377; x=1697973177; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v7ir7MAeCxuydH35Tr35csIS6YonhaPinnnXnjQUiNE=;
        b=JgbsL9A1txwKwT4020nYOVD7iUdunwWRnrtxYS54CZ1mTmhRT9bLtQtKjKzmpcyt7N
         HT8dmvYtCwYQ12LYxgC6fEquShD3I9DcXY7KYR5Zx1t/TuVbkM2Q2LOALpK/d1FoZc9r
         PZmF/j0vv6puyZoodLPF5S030KttoQPRu/hBDLkD36/3Ul1wtsbUiMbNozsnm9+pkqA4
         +0ql0Box8voQtgqBn4C57xiWG5G5y3QK7js9bVH8P3XDZHARSQgJgcOjDWAFirJ3YUe8
         H1t1MkEcrY3EKhCpQxTpOKSJgth2GoLBpsZJFtECPHZcBs/sAucmVvgMSk50+xOwNeym
         h/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697368377; x=1697973177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7ir7MAeCxuydH35Tr35csIS6YonhaPinnnXnjQUiNE=;
        b=h14D/maz8YyrLWbF9ycCZc7FP2wCBTvi4ujynCNJu2Qd1uIdf2gF2ZZxfrwPZt1fJd
         9uHTLD4Yc1LbKkTQGPH2aRrvAHJbkcQF0jlfWKmufFDY+YBaBqXINVgBDbZl33/Gn+5Z
         4pfaaBd9RG4ML5Irfy2R4eDIbvz41uqTyARCZs35zCIig4Qt5qXnyucPhIkqzFSFlRti
         HDXTEJeBmlFzbKPA5Lo/upEvLRQ6EQbTVVI2++75nWCdSHkqCJtItyuCjUbXxwmVnokf
         0HnUnov4zLo10TxryHvnRcqywTd2tC/YNlNaBUHQ0qGHLXpkmkn7CfPwLg+uqWNOwEpI
         kj8Q==
X-Gm-Message-State: AOJu0YxMJY7XeiulKr8giwunP5bAnNqh6Ye1rkZioY5e2rL6T4pzvgcA
	3lYhQEjo9IjKsPYKTuE94BgLpqDuDHyi3BW1
X-Google-Smtp-Source: AGHT+IGPd1SufP0ah5tP0oxTseMq4tDZvddQSm/jkyrrprmM9EFrcudWI45v1KLqyHVRiI6LARKzig==
X-Received: by 2002:a81:d24f:0:b0:5a1:d398:2e with SMTP id m15-20020a81d24f000000b005a1d398002emr37982331ywl.37.1697368377331;
        Sun, 15 Oct 2023 04:12:57 -0700 (PDT)
Received: from gilbert-PC ([105.112.18.68])
        by smtp.gmail.com with ESMTPSA id m132-20020a0dca8a000000b0059bd8447721sm1306262ywd.21.2023.10.15.04.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 04:12:55 -0700 (PDT)
Date: Sun, 15 Oct 2023 12:12:44 +0100
From: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
To: gregkh@linuxfoundation.org, outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] staging: rtl8192u: Align descendant arguments
Message-ID: <76218d7a14d7f70c4a1b2f1140a69ac7364f1aef.1697367161.git.gilbertadikankwu@gmail.com>
References: <cover.1697367161.git.gilbertadikankwu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1697367161.git.gilbertadikankwu@gmail.com>

Align descendant arguments to the open parenthesis as per the "Linux
Kernel coding style" in Documentation/process/coding-style.rst

Mute the following checkpatch error:

CHECK: Alignment should match open parenthesis

Signed-off-by: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
---
 drivers/staging/rtl8192u/r8180_93cx6.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192u/r8180_93cx6.c b/drivers/staging/rtl8192u/r8180_93cx6.c
index 2527cea60e3e..1453a0307eb4 100644
--- a/drivers/staging/rtl8192u/r8180_93cx6.c
+++ b/drivers/staging/rtl8192u/r8180_93cx6.c
@@ -114,7 +114,7 @@ int eprom_read(struct net_device *dev, u32 addr)
 	ret = 0;
 	/* enable EPROM programming */
 	write_nic_byte_E(dev, EPROM_CMD,
-		       (EPROM_CMD_PROGRAM << EPROM_CMD_OPERATING_MODE_SHIFT));
+			 (EPROM_CMD_PROGRAM << EPROM_CMD_OPERATING_MODE_SHIFT));
 	force_pci_posting(dev);
 	udelay(EPROM_DELAY);
 
@@ -165,6 +165,6 @@ int eprom_read(struct net_device *dev, u32 addr)
 
 	/* disable EPROM programming */
 	write_nic_byte_E(dev, EPROM_CMD,
-		       (EPROM_CMD_NORMAL << EPROM_CMD_OPERATING_MODE_SHIFT));
+			 (EPROM_CMD_NORMAL << EPROM_CMD_OPERATING_MODE_SHIFT));
 	return ret;
 }
-- 
2.34.1


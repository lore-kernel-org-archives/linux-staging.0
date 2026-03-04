Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5B8386C1A
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 08:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772613982; cv=none; b=fHGLGOksDVhA6MaHSOdpTOP5n3gx37ShZKQRAv1LshUgY+EV+3c6y3RiMAAnXnL5L2pOHvUYZJWGU1tS8IFrwJTpPg5UpRReUX+G/Dy9hsjSQPbXut1eiuxHotMsuoVWv603Sf/+rB7lJC0cU2mGSAuuhCFFAixSHLwltE6m5vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772613982; c=relaxed/simple;
	bh=NjIHanfcZCN7Q8bPlLToej7iNBvOlqyNwUhyWxKm2yQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FVNfoMLuNbrSf1oS7/WjzyPRkKczgWycKRHPsIrJ8K3tp42G73urM9MvHjonhLX+aZmdnn06zkRkpeBYBdMq+XFZGuZTaMZNawR0G+KEf8z5u6WYKn8JtgQUpLy3PXQd2ON5cLlzN0hBtcN24/h3C4RBaz45RVPEamtjAkEy4uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jOzardWW; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jOzardWW"
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-c7382963b67so25688a12.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 00:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772613981; x=1773218781; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4Tsr0TiaAL9EgCXS3kDx+w3w2NKKVy8Enr91haZmsQ=;
        b=jOzardWWLyGaS1sp5BGVxxu8yUSr0e76R561dZ7VdgQfYiYN53JP34mTar7Lom5PSL
         Mw2qqvQ83g31wCv/sDJ/vFLTcrCSQAzo5o0ZtBSXg2ySdS6EWAeQq+uH/U4Y4+em1jtS
         BcClkG/zQ1exTpJSaEnQWLwaIon7aDZPOH6Pd8/SUDEM2PtwxCJNsbMGYHeaANQfX7HX
         2TUpStguR2aMEGgXx6LpAYhy0pLb2hpRbrxJ083yd6Qp9ncqtwWCFCqGZHMhokJeHT9C
         oU79Tw8SznOKC7hXJIRIQ2D2QyMmHu0V7enE1XefQ4TFKG4s4PLi8FAJAqqhyKBmqiX1
         pfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772613981; x=1773218781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q4Tsr0TiaAL9EgCXS3kDx+w3w2NKKVy8Enr91haZmsQ=;
        b=JQILdke7zabs/5UTQStuoP0aBRBw+WzOx8kEc2yF7G/Nzco0CA0F+8+5gYwYNPEzK0
         kKwENolLTA8MgrLoK3SU37pVLgKoBdNu+34OrweiYOsHTY9qdEmLh/B/Ph1lEqyTd2Ro
         uNTNnzGB2rvOPxMLiOPIAJlPeqQhcsZ+vnWZEhXfsYpr9t82aQmgdFOXTGA8E3oER3kz
         VlbCVUUMPJPzgRJTipjb2+Z9upZrfTyeqVcy3NTyG9BTLtUdpC+WmMVLf3HfnEvSJtOc
         anaVLQVPRBFVUMbDC4NJ3rPaO82y3h1g72g459GkZ89OY0zn7wf0ULxIp+u+yZjp80y5
         djHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXa/TtTV+ojI3hh1DUvq5zJf7X6AVuNqEEvH1sYKOw4pXsSZLL2J2+yBwqvPRMLniQl/es6nuJQJmwCnbr7@lists.linux.dev
X-Gm-Message-State: AOJu0YwndQ8tDZ8gRNHJdrdV2FWtHeTq8kIUCqa2vwYfkDBTZqk7goBP
	giUsuJNHu+0hxnpzQ5pCmFRFueq6UkEqKtf8Ofq8lH/DzOrbbo9eH4TE
X-Gm-Gg: ATEYQzw4YmU6AI6rLZzMb1tWtIeCfwO7ZPVq/kE900F72cpTcwJXZ2Gt5/vkn3TxUsu
	uWcBcPXKvq+Dtg4boezFlr8N7B2Da1WKaNDEGAVcgKYWnz+CMFtord25M0P/BRyRk3dokwMdprg
	fq+cmVJyfLJPWJcDnf0rHXba80R8z4ymg0WqzS9jj1xD0exPhVVjDWONbgzA7UrZC0LsMJHQtiU
	DlxsJkZmjk8TTRSW26xHWJSS4gWJ8TcPABSx429EuRmedBX8+xdJHwx4O3kzaH1EsheSo0/ntrb
	HLb+VsaJmoLMa4FklmS3bbIDPCKyCW4H4XJ6t/I03yI6JjmtE/M8fV4GAebnH6a3KwsQnv03d+f
	hbgYre9EQhNQQwFxX4Tq62pi5VNQMZ2dWGsZp5tWV5dxf7bQbEjRQ+N6OnWeSYEw5Q20B+xrdHX
	XeFi8r5W9Ogt+Mgqc3Mz/9FLzHAfU2NXnpu0X4qxdZW9B1HYPE13o+FREWyg33ElMJmDA2iypqw
	I9m+N0U7FT4+tI=
X-Received: by 2002:a17:903:2c50:b0:2a9:5b48:2b1f with SMTP id d9443c01a7336-2ae6a89797fmr10736535ad.0.1772613981282;
        Wed, 04 Mar 2026 00:46:21 -0800 (PST)
Received: from cute.. ([2405:201:31:d01f:950d:ab7d:5e5c:5244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3d1b2c5esm122010285ad.6.2026.03.04.00.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:46:21 -0800 (PST)
From: Soham Kute <officialsohamkute@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Soham Kute <officialsohamkute@gmail.com>
Subject: [PATCH 6/6] staging: sm750fb: sm750_sw_i2c_init: return -EINVAL for invalid GPIO
Date: Wed,  4 Mar 2026 14:15:45 +0530
Message-Id: <20260304084545.156170-7-officialsohamkute@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304084545.156170-1-officialsohamkute@gmail.com>
References: <aaVT1mSeKrSSlrha@stanley.mountain>
 <20260304084545.156170-1-officialsohamkute@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Return -EINVAL instead of -1 when the GPIO pin number is out of
range. The caller checks for non-zero return value as failure.

Signed-off-by: Soham Kute <officialsohamkute@gmail.com>
---
 drivers/staging/sm750fb/ddk750_swi2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
index a17f758dda6c..d90a93ab8fdc 100644
--- a/drivers/staging/sm750fb/ddk750_swi2c.c
+++ b/drivers/staging/sm750fb/ddk750_swi2c.c
@@ -394,7 +394,7 @@ long sm750_sw_i2c_init(unsigned char clk_gpio, unsigned char data_gpio)
 	 * range is only from [0..63]
 	 */
 	if ((clk_gpio > 31) || (data_gpio > 31))
-		return -1;
+		return -EINVAL;
 
 	if (sm750_get_chip_type() == SM750LE)
 		return sm750le_i2c_init(clk_gpio, data_gpio);
-- 
2.34.1


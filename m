Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EDC2EC541
	for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 18:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763403635; cv=none; b=JFfuz+coKn9NjMY//OiJDfqL6kaqeXb3VyG27O6uVSCj18577GLo7x/PXN3mm8CG4MZsBt3P3a4Y1szJmL0tDHKFqdS0D6hcYsnGErXtugTbbb08z/RnCGO0cTUcZvAjDCpgNpi8yqT2JLZfI0trfJ1pueTPZbEBqJvH+Sx5E2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763403635; c=relaxed/simple;
	bh=hL76vXYpQxKNP0SlxinB9oukjdcEksXfF2e3a5aBK9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EWz6biUTYuudqPPn6a9RAC8WApPWHleeCDGQFJTOs47qRHhK8a42BgKFvWvvX8XINIAnNRz1qhcc39NIscpY3mVB7l/DgQVgEbixeJwBYDAvR9D3hW8NS70t7fppfUa9feBCwdSvDIdpCcM10i0JKwlx/27DOdfTr0yaPROvM+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fEeCtI/j; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fEeCtI/j"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-297e239baecso51161555ad.1
        for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 10:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403634; x=1764008434; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JP2wrZeI6D9TXpbQnvPHW7fbQMn9CB3PYna6fF90LSo=;
        b=fEeCtI/jQq3HeZHaVJ3D3rQBmYEhEEomKX6PrwXwki8D23rU2nZp0kKG7WCMCQ02QP
         +IVfuEQj78dK4Raw+Df4bhFMjd4m50+ZKFrJL61hy5zyR7BHdM+ce6tlwbcrX9Q5Xjvb
         hXO+2jNuEK56Ubnj8G/7cdL2Ux6AKAHYAthWh+4afd7y/uPWu4x2zpWhcxp/uEzLm25c
         mFqC6n8ep4EkRbWvQ7dR4fC2dlIzxDsvuObasAZu8IYPQr/Pyucm8FI/aEkOlIqnyS4p
         oNFKeoZhjx1LZOI2L4GG/EKjsx5zaDB/IaogVwCJxQ/Fny8wJqlvNB0szbSa4lZSzdRq
         lvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403634; x=1764008434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JP2wrZeI6D9TXpbQnvPHW7fbQMn9CB3PYna6fF90LSo=;
        b=UqnpxqQn/AKn/qRaE939lBSKINh+4s+OtuNnfXkznccv7lN8e0Oc8Amxp/y8vgJ48C
         u6omGXI9hXC4DTh5jHjqm9tDfW6zWIujdY5GykjXWMzHXn3RcRZhdLi7Tx03eWEdbsa0
         LBuudCqu4xlzRMk4exoGAbUMnvB+BU8y5laR7ZgnydgjKw5RYMBcB8NPD48dypFJdpGo
         DTuqMYXCpH2U2lXwWR1+ZYk07QxT61c1FbPS+IjkaJ6vjt2+wU+KzS7s1Ic4smnDmXwo
         Jehize6aK3kWIJkBjG6YDgyJY8nO96cbA5QoUF8OAbuhoE46Sdu7iPbYV7MbjehhTXY+
         M4Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWn8oLVTL2lTCYCxaB4Ux+CmohWjG/oTOnoqEx7oRQOG3gPUjOmI8RRX/iXSWaxRSj3nSOa8QhaKvFwjpTt@lists.linux.dev
X-Gm-Message-State: AOJu0YzeY8yCi1CRNqC7S9fQxBrglDtpbV5f9lIDMn417NZiBFYyTgvh
	QQRp3+5yFl1aBPl97TwM0mkxyEzbm7QfvcDjvVZnJlnwbBxVzNvQwdSb
X-Gm-Gg: ASbGncsRnKagrepJhkM3BN3KFN8zx0uMkDINUGQGKi1k1aXeXgIDc47qQJxfYMkJvtp
	tdaDWrAa84DAz4p58d/YGkeQhNe2cGIDN4UHTRfEn+LK0oKXb/PsvTHFGjLwtCN+k5TLKQI7rAN
	eTHdDiFzSqcGoI17TxC+DjiaPNLSSCp3uxB4H0a/5lHWJUV0TBqaijQuYCmSXIlseR7JEuKZkGB
	pyD0a3HIqYpq8/N9QxXWpULCzVLMl0N2yRs4uEfkXqaDqo6tum0Mq7ccbAR4/COENbapikATM7D
	wlqy/62W6wgt/0EwsSSCfgqQJZgOxCjIujv8P2iMjfUytlXFs/1USKY6mPc21JhT3F+C9rzUwF7
	UxpWR16/9GM/uEptShQSGQfmHTMgX6qlc42c27r+OaKDeplY3jpo0OgLl7jv3tksOCLh9F4aHtl
	BGAvjjMyk1ya1PG03AErdhfjLrPGZlsxi+QoR57umSbPGe3d4=
X-Google-Smtp-Source: AGHT+IGhTPF1sTHa6cqCXg3SnMdIuxMoLuexsuKyRYKG+8XU0Zaj4kyV9wlnF7kX64s4nA48+hQdHw==
X-Received: by 2002:a17:903:1a28:b0:297:e1f5:190b with SMTP id d9443c01a7336-299f55a1accmr2855585ad.22.1763403633764;
        Mon, 17 Nov 2025 10:20:33 -0800 (PST)
Received: from ideapad.tail50fddd.ts.net ([139.5.199.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm148446705ad.36.2025.11.17.10.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:20:33 -0800 (PST)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: gregkh@linuxfoundation.org
Cc: johan@kernel.org,
	elder@kernel.org,
	linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org,
	Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Subject: [PATCH 13/13] staging: greybus: usb: remove obsolete FIXME about bridged-PHY support
Date: Mon, 17 Nov 2025 23:48:18 +0530
Message-ID: <20251117181818.118139-14-ayaanmirzabaig85@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB bridged-PHY protocol has never been supported by the upstream
USB core and cannot function. Remove the obsolete FIXME and 
keep the protocol disabled with a straightforward explanatory comment.

Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
---
 drivers/staging/greybus/usb.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/staging/greybus/usb.c b/drivers/staging/greybus/usb.c
index 1502641f5dbb..e1c9966ab678 100644
--- a/drivers/staging/greybus/usb.c
+++ b/drivers/staging/greybus/usb.c
@@ -194,23 +194,10 @@ static int gb_usb_probe(struct gbphy_device *gbphy_dev,
 	if (retval)
 		goto exit_connection_destroy;
 
-	/*
-	 * FIXME: The USB bridged-PHY protocol driver depends on changes to
-	 *        USB core which are not yet upstream.
-	 *
-	 *        Disable for now.
-	 */
-	if (1) {
+	/* The USB bridged-PHY protocol is not supported by upstream USB core */
 		dev_warn(dev, "USB protocol disabled\n");
 		retval = -EPROTONOSUPPORT;
 		goto exit_connection_disable;
-	}
-
-	retval = usb_add_hcd(hcd, 0, 0);
-	if (retval)
-		goto exit_connection_disable;
-
-	return 0;
 
 exit_connection_disable:
 	gb_connection_disable(connection);
-- 
2.51.0


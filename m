Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D843BBF0
	for <linux-staging@lists.linux.dev>; Sun, 10 Mar 2024 23:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710114960; cv=none; b=LE1/HXcxC32hBRFTrjtm45TYXUEY06RC3MLir1gTejJPrTqgtC6d9jV1xZDdpav4qJwu2k4xuDv8j2xPPttJKPgYXl7zI90eMcHXcTjNFhcMj6g7K5BCIaOiRJNZTc8Z1t3URPGfFvurqFTtILIHd7fWEboKJmRlx/shCCq5lr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710114960; c=relaxed/simple;
	bh=n7KXQpozyW+nnrXGfVAreK2+9LiwspOCcLcvVc6HNXI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cirRYKvNp2sJ366k+HFhvp5QRAsBjVE5sjfDZWpVg5KZK9B+gTpukeWDpBomfMqu/zOXHAjndQJQivEsiz0XHLp2+UceDAY2YiyGAhrUQiswa+mt9xGk72FLloVahNHCksjR09uHH7aat0TW384Vt13bBuvlWjkxbniXwtgmEAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=gZybhtqE; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="gZybhtqE"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-29996cc6382so2678785a91.3
        for <linux-staging@lists.linux.dev>; Sun, 10 Mar 2024 16:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1710114958; x=1710719758; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FL8d9MTcpYN8bDTWPCmzHn5aeTaz5Kj78gvK+tvBcF8=;
        b=gZybhtqEbC/uNbWixQEA9K/J2ns14j6LKOmJrxo5CU8UlmQwFAAeNGGfsDfkuJGMhg
         7wzqpq0UbUHtYpi7Nsj/AgtzqjXlaPSB6aXqWQovFheKZWcDlf7mFOSk5ZuQikMKtAuS
         2P4y8i0RXoYTUjp6J9ccMy9/8li0cyoQd+g9wmrp57dSZu8REHZdWtgHXmNJK+QbeCWX
         SrBYOtsYFgDHrNcxZK5CO1/XIOwxDJ8PfYrcULcK+Se9b+5FuCKr7AeO3bNCg8WBiBUt
         NIL1eoOgW5skjOsG/YflmdaVbH+oVYs1CHQIQDxRjoLxutfRaF/Ketn85p6iDICTcbPf
         Qxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710114958; x=1710719758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FL8d9MTcpYN8bDTWPCmzHn5aeTaz5Kj78gvK+tvBcF8=;
        b=SwzAhc8ZznbUC19U+uHUv0o9wcsPUMjG3DgnkL+ygAcX59OJz8I1VmOSzJQprQGiFV
         QWFt6gpfpN7tOpPwEEEDn3sc9k5Xhl5NOzSsYkxHPDOcF+TukipYuMNa6PKHMg0Kvb3b
         OlmN/hNtS1NOvdCLOBn3ab7gKZKDbdDWvkaXMlujQ8TQJo7bUPqdAVC2OYTFHJ7yWgui
         7TKO8fJNIifKQ8rU2DCoH7uUxZqXMuhp30rXDCQqei2mAFcIP9/SN2pk2Ut4BDZUdqn0
         Gu7wURpz8jZQp45xkE2SYGiHGsNqrg/85fLTdRV70AzEzapHm3bLiYkLl01KnqVvIci4
         wO7A==
X-Gm-Message-State: AOJu0YzrodNisAXCfvKEZ1wpIjeZx8R6Yg8frywVxSPuztPKdm7vDZW3
	2Yv6ozSTGa1u9DM8Ur4q/74u/XZ5IcOFuGLxQMYZMhA/cFoaHB1+fP2R1swXOqM=
X-Google-Smtp-Source: AGHT+IFDJkt+sGBsjG7YpqYO6xmDXouhYwlWkHzbp38WU4LKg4lxD5K1SNC3CWszOYhKTjfwWFIgeg==
X-Received: by 2002:a17:90a:9f8d:b0:29a:6b1d:4d32 with SMTP id o13-20020a17090a9f8d00b0029a6b1d4d32mr3951003pjp.38.1710114958723;
        Sun, 10 Mar 2024 16:55:58 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id o7-20020a17090ac08700b0029bb29ef41bsm2903439pjs.50.2024.03.10.16.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 16:55:58 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 03/11] Staging: rtl8192e: Rename variable TimeStampHigh
Date: Sun, 10 Mar 2024 16:55:44 -0700
Message-Id: <20240310235552.4217-4-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240310235552.4217-1-tdavies@darkphysics.net>
References: <20240310235552.4217-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable TimeStampHigh to time_stamp_high to fix
checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 480315404969..15b0ac6e6eef 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1660,7 +1660,7 @@ bool rtl92e_get_rx_stats(struct net_device *dev, struct rtllib_rx_stats *stats,
 			    (pDrvInfo->FirstAGGR == 1);
 
 	stats->time_stamp_low = pDrvInfo->TSFL;
-	stats->TimeStampHigh = rtl92e_readl(dev, TSFR + 4);
+	stats->time_stamp_high = rtl92e_readl(dev, TSFR + 4);
 
 	_rtl92e_translate_rx_signal_stats(dev, skb, stats, pdesc, pDrvInfo);
 	skb_trim(skb, skb->len - S_CRC_LEN);
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 72264e1ef877..e165f1e32e7f 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -483,7 +483,7 @@ struct rtllib_rx_stats {
 	u16 bICV:1;
 	u16 Decrypted:1;
 	u32 time_stamp_low;
-	u32 TimeStampHigh;
+	u32 time_stamp_high;
 
 	u8    RxDrvInfoSize;
 	u8    RxBufShift;
-- 
2.30.2


Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFB4EEB3
	for <linux-staging@lists.linux.dev>; Wed, 21 Feb 2024 21:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708551954; cv=none; b=FWkJp2paYZ+9MWdvypi0DxyZqZ09X5e+cX78CyVWCwqy+Uepru1VlP90Lp19Wd7z2uY/KNJ2upebp3Qe3iTYoARHpSYk72iSVGymgq28l4xFfEBa1RVOUoBjk2I3pKxQ2hfT/QfMSKSpvDuLOpd4x0DX1YoJx+/qsuLegp5aOro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708551954; c=relaxed/simple;
	bh=0TEGUrGFTs2ldCRsHu5kOVXh9bFjQpTrcnlYib8ZxMU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mv/uP5eOtxWRJwJab7YFwPNQm3jrZEMyFScpqtnxR83G8qMTWMb/5z12/p4PqJg9QeXh9BC6d2Jbot8w2Rs7JupUJpv9gdxbHYykCAFqnJM6Nhwg2kJAxOym9tjk4tgDzuyTbYxKSMwNMjtLs8HhZTIzUqi23g+vUFcj0QSK9VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ljy8z0H1; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ljy8z0H1"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33d1f3144c4so771841f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 21 Feb 2024 13:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708551951; x=1709156751; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C9zX6fLjarN6HKERIvwo4xgsOTH/c9yGUzwQg+/o3tg=;
        b=Ljy8z0H1c7s4h/sXYoX4DTk84B4ooQFdqLspSmGm/KwPk8Fi35t+LRb1DfN9i4nFYu
         +9GBaBqCf3vKmWNpOUN5smuWVmXXCIOyrzMxPJVI4ePP4aRiC10zffsEFzSBkpG3uU1+
         I8L35lFKVMLw+wRpYobjgEAmCHktegXd9BoTwxlnf73tVdF3mginGvraFzjYjlmaloXJ
         wCaO8XJJA6q01HtoX5GBhRAb3d3PMVtyQWnJGMB0FmwGscvhYTKfhLZKfitMZ29iC7Ya
         ybVNOFxnWvr6S8yPiJqeNaU4wDa5czTAEq2kOy/lAcH9DO18HjsZJ8StqkKTFOFjMGXr
         0OtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708551951; x=1709156751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9zX6fLjarN6HKERIvwo4xgsOTH/c9yGUzwQg+/o3tg=;
        b=LxLv1Vw+RBFGboolLUGn8rwxRWZe7HloqmNi+MnsSRlFbaMWFz3Sosn5ATZVRWxG+m
         y2+avsgJXB4Kj03XDvVlqPtoWFNnVs5RuSokstkZBUm0P3f2pattyypC+BxuI1GeLO76
         7fMiYMTPrRDp/MYp+sQxZ5vRVJBtwawHthUiFLzHI106kEqE+q74KBMZc/Zcdj0Isdoi
         SPdfMcTVQXsNi6Lwpcn5L/z2MSh7V+8xUW3gGW5ED9U8M6dBQx8S7IVstSP5f0Cu5ufi
         iKuy1N14qy1LsdIwlCnCsq7h36A5iDVsIx3dtLsYoqaBxhpx6Gb+Bi4g5HYenkWwOVEk
         Xl0A==
X-Forwarded-Encrypted: i=1; AJvYcCXFvUcruR5MTRld+Zvt94xaVNX622iQOch/8x2R6E+5mSJYSv3/tTogz7UvEIknF3fawNhF7s/OZ4KXIk0dBRcEdWnXRSPyUIJVnzBEaA==
X-Gm-Message-State: AOJu0Yw6ztsgeQBodhiI7Uri5HlRPsDQ1EKTZ9btV+x1k7Xtsim8sN5L
	1XtjHYPijnP5HuRqsPnQ/N3n6oL6eHfyDPWxBNUqt4W6GXAusi+0Ol7twYRHizc=
X-Google-Smtp-Source: AGHT+IH31F0v55Y4EPuICDjMdGycQ2S4Qd7FNnJLkku6Ql8lul7R9KJwofjM2pflPONoK4wZuhWfDw==
X-Received: by 2002:a05:600c:1c24:b0:412:5670:ef62 with SMTP id j36-20020a05600c1c2400b004125670ef62mr417558wms.1.1708551951491;
        Wed, 21 Feb 2024 13:45:51 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id b7-20020adfe647000000b0033b406bc689sm18270325wrn.75.2024.02.21.13.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 13:45:51 -0800 (PST)
Date: Wed, 21 Feb 2024 22:45:49 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] staging: rtl8192e: Remove unused variables
 bShortPreamble and fragoffset
Message-ID: <17c516c195acc458366ab182e0fd1200b7e2b1da.1708461563.git.philipp.g.hortmann@gmail.com>
References: <cover.1708461563.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1708461563.git.philipp.g.hortmann@gmail.com>

Remove unused variables bShortPreamble and fragoffset as they are set and
never evaluated.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 --
 drivers/staging/rtl8192e/rtllib.h              | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index e7494b548749..f1e97da8f077 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1659,7 +1659,6 @@ bool rtl92e_get_rx_stats(struct net_device *dev, struct rtllib_rx_stats *stats,
 
 	stats->rate = _rtl92e_rate_hw_to_mgn((bool)pDrvInfo->RxHT,
 					     pDrvInfo->RxRate);
-	stats->bShortPreamble = pDrvInfo->SPLCP;
 
 	_rtl92e_update_received_rate_histogram_stats(dev, stats);
 
@@ -1673,7 +1672,6 @@ bool rtl92e_get_rx_stats(struct net_device *dev, struct rtllib_rx_stats *stats,
 	_rtl92e_translate_rx_signal_stats(dev, skb, stats, pdesc, pDrvInfo);
 	skb_trim(skb, skb->len - S_CRC_LEN);
 
-	stats->fragoffset = 0;
 	stats->ntotalfrag = 1;
 	return true;
 }
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index d238fce712a4..6b33643ddae0 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -481,7 +481,6 @@ struct rtllib_rx_stats {
 	u16 bHwError:1;
 	u16 bCRC:1;
 	u16 bICV:1;
-	u16 bShortPreamble:1;
 	u16 Decrypted:1;
 	u32 TimeStampLow;
 	u32 TimeStampHigh;
@@ -497,7 +496,6 @@ struct rtllib_rx_stats {
 	bool  bPacketMatchBSSID;
 	bool  bIsCCK;
 	bool  bPacketToSelf;
-	u16    fragoffset;
 	u16    ntotalfrag;
 	bool   bPacketBeacon;
 	bool   bToSelfBA;
-- 
2.43.2


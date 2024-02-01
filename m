Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AF81586D3
	for <linux-staging@lists.linux.dev>; Thu,  1 Feb 2024 08:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706775526; cv=none; b=X4Q5uxzPbMj24HVsipzneLEFNTqGhgkTpSRcelqg3kcPRaOOTgluFwV8LwAVOTolNNRhXV0Sa4LM30qfbIKysFskTeQ1rGZDyoOA3glnSCR75Mb0zVSmAm6GqIrIAS8wKMSQsZIP2x+Dak93qS3KLhttAi2HDeV4iLSLMFiuc5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706775526; c=relaxed/simple;
	bh=POYD2X8Sn0xdUyEMVmcSASb32r6ux72G3OFg1ARJVgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BY1M50Pxn4I+s8SweSvri6WAMK1VPKQRtmK/tcchVN701vAeqLDwLdn8t7Hpu+hHkeOiD2G/ny5YQarUVlsxk/+sSELYao76Al5zRe7aXzMDjvEfM+Aw77pUOdMV7NKmEk8dn30xujKtM1fc9y8QJ0eJjlmwzWrIhRBICuxeJIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FsYSw/Dh; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FsYSw/Dh"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a26f73732c5so81074266b.3
        for <linux-staging@lists.linux.dev>; Thu, 01 Feb 2024 00:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706775523; x=1707380323; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pyVY24lOJtDz67jI+ohD8RRv2jZxEpdf9sHHgY5otn8=;
        b=FsYSw/DhMT9FOfwCOXxPp1OquRzQadp5qovIOGkMgRzZC/dnNhbOap7BR8dHB19SW+
         iOB4yyJDVXIqPkbdl93cs3LxbuOforyTrFq5xPKvZjDjq2VaSSoZBjrryFeLkn3ILxA5
         dd/XuTSfsSWz2z3o91eqHEGOWj8MMAgNQycBQnOV+UrAZ4X8mlr1u78cM52lvfaxR2gv
         1o/ti2iWWGThkKY8Qg0BcdQa2sz2RbP7rpibaMWbeNomdK3j5/vO8XvcpLqzSHMd4uHW
         JyVpSDpfnZv0WHay+mUJTwJmgDG+Uqw+8+VJcUV2QErldvmNUh360lQg72SVdoQXu08m
         +eCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706775523; x=1707380323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pyVY24lOJtDz67jI+ohD8RRv2jZxEpdf9sHHgY5otn8=;
        b=c9WSMR+rbFebRYXs/3ySEbmvyFGYlwXmzxJEzL7nwfyrtwgNEqj8ibO89Op3meBrO8
         oKSvglXbuYVfDbHmUsdjtj2xIMBXVXwJyjcJ3O8roOdXN8Xrq6ioe4+O0AOL7Xs6bkoG
         QRwCW+U2/if2IkssX9OYYCmG4C0ZizsgvqXGUbW0OSukeQqETptmZMA3eCp0blSzRrfc
         RASyDN/rEvGAqf8zKLb5ILPDdJ82jVseRCilDCzXaJYEZ93tGT3TAPDqYbMZ45rsingH
         jTqyIQrNzqGAIzpO979aWl4ldgVl+A3ZglnP3aHPPXOMaXnUu929M1UQwoaS4ZebazO3
         GNNQ==
X-Gm-Message-State: AOJu0YxqraP1dAIf2rmsfAzq7NS7OYLm/kl7yrZYnZJMXrlyTMrI7bju
	E0jV/Gm/POL4E9SiLnUMf/Qd7izpfKxg63FbDyXEiJJXfqVsPteMXp/w/Xq+
X-Google-Smtp-Source: AGHT+IFjEI+XBZGPNAoXAhBdc3TiBeW/ocx6zElDWvgleHMQYVsAFzjEsbyjPiB+tdHX+hTBv4Bppw==
X-Received: by 2002:a17:906:1397:b0:a36:9041:cdc4 with SMTP id f23-20020a170906139700b00a369041cdc4mr1137713ejc.53.1706775522949;
        Thu, 01 Feb 2024 00:18:42 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWM4VA2pCElicVrJtpPs1pnoNTgPQ4E9PPC66Ds1TCXsuMzFnfBW7I5W/VfrnKCr/fFzjGXz+XEG9MqPuZZSL1mC1C8rFgPqcYNqA5aW7pxP9MFnesiFRfG4qoM0pJ9ht3roxZbM29i4vUkR2B6acUHqapBt3S+zkqtWAzCoOJ5y8gGt1I=
Received: from localhost.localdomain (ip-77-25-34-59.web.vodafone.de. [77.25.34.59])
        by smtp.gmail.com with ESMTPSA id p7-20020a170906784700b00a310f2b4b91sm6954069ejm.48.2024.02.01.00.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 00:18:42 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/3] staging: rtl8192e: initialize variables at declaration
Date: Thu,  1 Feb 2024 09:18:24 +0100
Message-ID: <20240201081824.6998-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201081824.6998-1-straube.linux@gmail.com>
References: <20240201081824.6998-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initialize two variables at declaration instead of first declare
and then initialize them. This saves a line of code and clears a
checkpatch warning.

WARNING: Missing a blank line after declarations

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index f777febcfe3b..f94fdf27214c 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -943,10 +943,9 @@ static void rtllib_rx_extract_addr(struct rtllib_device *ieee,
 static int rtllib_rx_data_filter(struct rtllib_device *ieee, struct ieee80211_hdr *hdr,
 				 u8 *dst, u8 *src, u8 *bssid, u8 *addr2)
 {
-	u8 type, stype;
 	u16 fc = le16_to_cpu(hdr->frame_control);
-	type = WLAN_FC_GET_TYPE(fc);
-	stype = WLAN_FC_GET_STYPE(fc);
+	u8 type = WLAN_FC_GET_TYPE(fc);
+	u8 stype = WLAN_FC_GET_STYPE(fc);
 
 	/* Filter frames from different BSS */
 	if (ieee80211_has_a4(hdr->frame_control) &&
-- 
2.43.0


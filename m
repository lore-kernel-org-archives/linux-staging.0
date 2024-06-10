Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5E258AD0
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 05:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717998551; cv=none; b=hOAr4nM+sORHQXv2l+twO1SPOJy0RfMEOLQU6Daha2P/57sut0/Ca1iy3BtAp4kpnXeOrMVj3A2oxpT7q3tpLsG5AmSiPF2uhtqKpYcD2vpB3P7ER9ma1YgWr6T0jYKYbpEo3IWWEQmmWLRWsm8jNPYwCGgflo/v6W08RPWcRmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717998551; c=relaxed/simple;
	bh=TWH+OTBjvp8ox1Frtu2Beh1ekTMCDrvI93IkEmBGW5A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IZhw421fpJ9TiIK+dGdy3s52T2HhW3a1InjbzG9Hx77hQ3WjGI+WfGSknrfwEjC6NsY8ClQc6mCJyj2hxTJ4yfvTTIMg1qXbVpVCMnjPT2CHK6uKTygKMzxEx6zjLvMsN4FWQnVkB9UKOxEne52liO72yGCOLdSDp/3ScSKdDtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=lSwqaVQb; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="lSwqaVQb"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-6c702226b0aso3679797a12.1
        for <linux-staging@lists.linux.dev>; Sun, 09 Jun 2024 22:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1717998549; x=1718603349; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/YOJlJQUY9anIeQSMAFNoVm85A4u3h8rUzTpCA0Cf0=;
        b=lSwqaVQbVNJws9Zqgz6YMrInBqVQZY5H8p/fCVsBmlYjAYUmW+XcRAHmjiwJb3AWEu
         XUB7htJ5k0XuLUjXl/WfSy7zqPMjfwVNE4uWROWhMwEL3FxIytKtxPLeiw6Hs3bchx87
         ILb51oHrbOM27yz36SPTqk7oWc7y4dSAz9kOIaPiEh89l6kfUwzwUv217MzJkjLG99f/
         KdVd6iWvLmL1mCqMr1BwaW3IUfbpapjjKfVTzDYgR+u4p3k7AgFRei4E57bv086k4iMB
         TJxet9iFgXCnY37iKCdcfgfVlh/ycF5AGrgCxgab6r3Ifziad3IHsT2PZMruAA34HlIE
         TB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717998549; x=1718603349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/YOJlJQUY9anIeQSMAFNoVm85A4u3h8rUzTpCA0Cf0=;
        b=cmBk2kkJ6iHXUb22BIxQ9lC84n5aMrIb1RlVsMn/OGAC+ZzihDEZwLdZqsF5iswlxY
         J5p7/ZgwXmgGjB24Ez5VazM+jSFn93gulWuY5YhUPa+le+e8ymgT+Ja1oALuh1x80ukY
         vqG45GMvUUJ2Flkmnc+0yYyxG6AmEkmpcKGBqKhWn4UfE46KjX3j37trEZPHlMMYVgVN
         jCJHXzEl5Q0nCHr1TzuEzA31XA1L8QV4lkfx55xYHwK/6yhpb9K7UQWNWOWPyIxztfMe
         XumXOXhUVrF7YqUnLoq+ZqKJrp3+1In3LN2cGaMGmqd21+7TgxVUnv4yKldxbeDD6zOw
         930A==
X-Gm-Message-State: AOJu0YwdebAontz4F7s1rhyXmJJgJLCLrvZvWReA5cSiaBvU6pPZaubk
	VaO+5rM3W3UeCrokgDhO9SrCPOvFTGxkK1wKxR5+8Y6I+0fsh01CtGfza225rgg=
X-Google-Smtp-Source: AGHT+IFtlGa3tzComzUCzAZSCPh1jOm5lOc2IYxvNh7EeBtaAD53tt47COzAUy0ko//NywxBoMHbdQ==
X-Received: by 2002:a17:903:2286:b0:1f6:a572:86ab with SMTP id d9443c01a7336-1f6d0151b7amr136874035ad.15.1717998549111;
        Sun, 09 Jun 2024 22:49:09 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6f1aced64sm35653725ad.9.2024.06.09.22.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 22:49:08 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 16/24] Staging: rtl8192e: Rename function rtllib_query_BandwidthMode
Date: Sun,  9 Jun 2024 22:44:41 -0700
Message-Id: <20240610054449.71316-17-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240610054449.71316-1-tdavies@darkphysics.net>
References: <20240610054449.71316-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function rtllib_query_BandwidthMode to
rtllib_query_bandwidth_mode to fix checkpatch warning Avoid
CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_tx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index c46bd0ea061e..4ac8140d7e68 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -346,7 +346,7 @@ static void rtllib_query_HTCapShortGI(struct rtllib_device *ieee,
 		tcb_desc->use_short_gi = true;
 }
 
-static void rtllib_query_BandwidthMode(struct rtllib_device *ieee,
+static void rtllib_query_bandwidth_mode(struct rtllib_device *ieee,
 				       struct cb_desc *tcb_desc)
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
@@ -872,7 +872,7 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 			rtllib_tx_query_agg_cap(ieee, txb->fragments[0],
 						tcb_desc);
 			rtllib_query_HTCapShortGI(ieee, tcb_desc);
-			rtllib_query_BandwidthMode(ieee, tcb_desc);
+			rtllib_query_bandwidth_mode(ieee, tcb_desc);
 			rtllib_query_protectionmode(ieee, tcb_desc,
 						    txb->fragments[0]);
 		}
-- 
2.30.2


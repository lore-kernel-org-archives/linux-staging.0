Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB33455795
	for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 22:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706308308; cv=none; b=qd4CBrrstAboSWinWIaYPgzs93x/DmxwDbZK51eQSgxc9mb7m0xmIwfYZxNV/xFjnKr1lG39GAimYdJRJAWbyoVIZaae1D/NiBcCr5TF8sUiRzG7sQruNsvCc7Tuz8yeF6K/5afU3ImpQi8thJUfh/nXrILGE8ZV91tt0N2XX3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706308308; c=relaxed/simple;
	bh=uGu0MY687mPL6FpCpdkunrktIKNKvA2DEumpUUqsAt4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NWSfbOx5bh8998IE26Se4REI6w9M6rvpLT0f75FWLf0B+7CTH77lRmYj8sOtnsdC2UIsCib6KEQq5nA1o2/R58OoME/SzGchdA/MJO+A4Wh1PjF9iVWt2+vYG2f0u0gxve8+7IZsuZCdxcvNDyd3dO3qHKHrxut9bbITvfbfYk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=U9G6bLKh; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="U9G6bLKh"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d746856d85so7438875ad.0
        for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 14:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706308306; x=1706913106; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5fiiHp/wjzY731Er1W9bbmepeXORaTQMQZdYafThTAc=;
        b=U9G6bLKhME8wHk4QQW+tXPtyPBKFJQWAu34Vv4tD/wzDEx8Fb34hVMb9eKUcWFwrnf
         pxtLT01DilA/yawVxOKEf2Gz6TYb3XWm/Mqnz9dtcCKBb0+oVTXqKSLTwruv23cOnbnq
         032sBbFlvodPzpEMtWINRmUunrPlPe7CZbJ15yfsG5IpbctrPlsnU4UHZqQkltX9jARR
         1yxu0KmQmrHjmQcxQEQ5uFe5y8FJ7ry/WXciQoqOHNUjt4935fJqZqQoJklgqitnVKHn
         sKbZgmpe2oaB+uitDtaSIgtaCdzlAuIxxuy3R7i+PbHAo55Ipina4AgobdjrCESGPwnY
         d5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706308306; x=1706913106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5fiiHp/wjzY731Er1W9bbmepeXORaTQMQZdYafThTAc=;
        b=WbQSEqythz1wimakTXmSrFPhS9SWdKepR6oqilR1Iq8Vn7peo4tTdbjJ6IKv8m5p4n
         DJAeRovKjusSdQEJnGOgifteOa2g+bMSADykMxrzDyOiUmPz5yVq2+d6gfHXgbhRZxmN
         7kV5oN1Lz+FZ/atLx/mDRAjUgdIDJStO4CX+ZCteGC4Cpb6dpkqrqJpnCxCVn78yWerH
         Fv6Lhf6iJIIbG13gHCp/vskCgkfBxbk0/9p22GLZXPcOpqnZvEAv6sMaNiIX4tdCCI05
         38hRXChhLBZYcn5INTSs1m4cqYUP69TOjnRSlZ9+Yloc8alzCPIYUJW9gYPBbwvBWHkJ
         1zZg==
X-Gm-Message-State: AOJu0YzEphYJd62e06jAXQAVRBc9cFIxJP9jyJ75uFXiLB5ty7mf1c07
	1O1osApr348cXDSUdJKPQfRF7lqRLzoYNG4bU5EGAevq6YcyAbbGW5DQ1LKeObs=
X-Google-Smtp-Source: AGHT+IFUjv/9MEDcJiw11ddzJUuUL5TjW+5fivqENBdwZhc682giM6qE5BG+rfA7CYmJvpE9n37vLg==
X-Received: by 2002:a17:902:d4cb:b0:1d7:6f5b:e674 with SMTP id o11-20020a170902d4cb00b001d76f5be674mr654018plg.23.1706308306358;
        Fri, 26 Jan 2024 14:31:46 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902d0c100b001d8a8f431b7sm737909pln.300.2024.01.26.14.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 14:31:46 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 11/18] Staging: rtl8192e: Fix paren alignment for rtllib_disable_net_monitor_mode()
Date: Fri, 26 Jan 2024 14:30:59 -0800
Message-Id: <20240126223106.986093-12-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126223106.986093-1-tdavies@darkphysics.net>
References: <20240126223106.986093-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Join 2 lines to fix Warning: Alignment should match open parenthesis

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No Changes.
 drivers/staging/rtl8192e/rtllib_softmac.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 60598b41fb9f..538689fb5580 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -361,8 +361,7 @@ void rtllib_enable_net_monitor_mode(struct net_device *dev,
 /* Disables network monitor mode. Only packets destinated to
  * us will be received.
  */
-void rtllib_disable_net_monitor_mode(struct net_device *dev,
-		bool init_state)
+void rtllib_disable_net_monitor_mode(struct net_device *dev, bool init_state)
 {
 	struct rtllib_device *ieee = netdev_priv_rsl(dev);
 
-- 
2.39.2


Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D831271449
	for <linux-staging@lists.linux.dev>; Mon, 18 Aug 2025 15:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755531637; cv=none; b=F7OD2gljhsg7LwDBpQGJ8lzuTtywvpFXx9nLx3suKAczX1kpIYfzpxoJ8wg9lJMa4yFR1EcPGEGn2HYH8cilKkAkCU/OSvzWuX3ejEOjY0JQYNI1Bl9CLG33mXV6YspDy4P8w3+T0+JOFko6sjvo7tU8+th09L6ERjtHO2QdCz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755531637; c=relaxed/simple;
	bh=I1peXe3qUgkdzuAIkR3hXhA4fkcFMtLuLZeroJqdEKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Je//bsmY3RLCbUP98yAvossVHoVU0BeYQgWLifyD/Azx2ToB3EYpF4YO3srAKtYbqHXoeMeN7S6h1+booSwlFDBuTAve0aAJ9qu/32LMJ0wFPbaEZCk/O9Yo5Cg3cIfK3UVHXLmInonouMzkA45gY9yndFiQf4e81GTsFWcg5zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2445824dc27so38683055ad.3
        for <linux-staging@lists.linux.dev>; Mon, 18 Aug 2025 08:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755531635; x=1756136435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NChDRszGwZKbjvVPRDVNu5XZAg/1N+wVz9IydPSYRlA=;
        b=JnawDg0c8/qwXx65kcjluncHLU2YZXRCY2vp8Mp8DbBbYHvm5MXUQ0wRGGlQ64kuOP
         KGz44uzzTscOM4BqkOSDl3ePUGMJA/vbRAGVlUjFr9qu1JLeYsrh9wFVWa8QYM3KvB++
         WkcEwDWHT5dpvvKVDfgoZ92hqi6ufYxcUoJr97pnP6ORUmgOrsMC6++qdwtZ2a/Peube
         ZtP60JihgAcZFWikFSpUYaJy5GdcZR5WDT9njGwu1aGhyUq6+WU5FQCJ2c+crzpuPuuI
         c8VRV8ETERF7Z7jfoads0SHax4vvczQGClhNyQLtNkhzJrczWBZgTEqZ0n+NDRepZfc9
         eCcg==
X-Forwarded-Encrypted: i=1; AJvYcCVr0r5/XOYK1IqWsJNcIMmc+kGI3VVjfZLw+yEGh3Xbriyr9VuX+qx084KTZ2CieAqqgIvj4Y2wSIEUD+yd@lists.linux.dev
X-Gm-Message-State: AOJu0YwYfZhhbvmRN3/dRHLDarx+k2X+SSx7pjbe8ntCQgjmV6QHuwz2
	c9SpoGxsR01n5GVEjrDYEyT7DJxJd0snsnqSS5eZadvneFKU4FCgukM=
X-Gm-Gg: ASbGnctGSCm/aGaiEAS7DOIoNiY9UyEBGBW4yBtzo8aGr13hEXUuVKs9AT21TJ9YwEN
	Mw5pAFLCuxONJkv5oJ9XKlUxc8ieQDN+c9KvtZ4/HjyXjI0mPQVPCPmN42G91cQcKrnlRwnKAQz
	xG3zaagAwnvOf/7gZyPtRLQP09k4D7St0WqyvHuvsn77m65i7RpSM89Len9/2owlq8pe7Zh8pzL
	Rp59TepRgIhs/GOAJ4jyXcntom3MGsJm14fZMVmnHlkCxs7IpT4JRyItvrvNkwIDSPz2bC/yRHf
	qaCuDRdAFQOBSGiP+dBO9hkJ551t/2ZdordiNgsDFM8oVhTLUgPpeMa6GTd84ZWXhl2ACLQ9OF5
	maUTK4dYPYDo1VOtolmIKfOKjSRuQ+P6avNktyvrf8i1p3gjfk9Wx+mbUD87autZAMUz4Dw==
X-Google-Smtp-Source: AGHT+IEESYdvHRoTRRGZrgyh2K1XOh5rovsTZVhdWVRfTeUiYce7Ghr02VcC+TxaQGwyNNdk27cEjw==
X-Received: by 2002:a17:902:e848:b0:240:86b2:aecf with SMTP id d9443c01a7336-24478e11024mr143045015ad.12.1755531635368;
        Mon, 18 Aug 2025 08:40:35 -0700 (PDT)
Received: from localhost (c-73-158-218-242.hsd1.ca.comcast.net. [73.158.218.242])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2446caa3e5bsm84101975ad.33.2025.08.18.08.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 08:40:35 -0700 (PDT)
From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	ayush.sawal@chelsio.com,
	andrew+netdev@lunn.ch,
	gregkh@linuxfoundation.org,
	horms@kernel.org,
	dsahern@kernel.org,
	pablo@netfilter.org,
	kadlec@netfilter.org,
	fw@strlen.de,
	steffen.klassert@secunet.com,
	sdf@fomichev.me,
	mhal@rbox.co,
	abhishektamboli9@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	herbert@gondor.apana.org.au
Subject: [PATCH net-next v2 2/7] xfrm: Switch to skb_dstref_steal to clear dst_entry
Date: Mon, 18 Aug 2025 08:40:27 -0700
Message-ID: <20250818154032.3173645-3-sdf@fomichev.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250818154032.3173645-1-sdf@fomichev.me>
References: <20250818154032.3173645-1-sdf@fomichev.me>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Going forward skb_dst_set will assert that skb dst_entry
is empty during skb_dst_set. skb_dstref_steal is added to reset
existing entry without doing refcnt. Switch to skb_dstref_steal
in __xfrm_route_forward and add a comment on why it's safe
to skip skb_dstref_restore.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 net/xfrm/xfrm_policy.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/net/xfrm/xfrm_policy.c b/net/xfrm/xfrm_policy.c
index c5035a9bc3bb..7111184eef59 100644
--- a/net/xfrm/xfrm_policy.c
+++ b/net/xfrm/xfrm_policy.c
@@ -3881,12 +3881,18 @@ int __xfrm_route_forward(struct sk_buff *skb, unsigned short family)
 	}
 
 	skb_dst_force(skb);
-	if (!skb_dst(skb)) {
+	dst = skb_dst(skb);
+	if (!dst) {
 		XFRM_INC_STATS(net, LINUX_MIB_XFRMFWDHDRERROR);
 		return 0;
 	}
 
-	dst = xfrm_lookup(net, skb_dst(skb), &fl, NULL, XFRM_LOOKUP_QUEUE);
+	/* ignore return value from skb_dstref_steal, xfrm_lookup takes
+	 * care of dropping the refcnt if needed.
+	 */
+	skb_dstref_steal(skb);
+
+	dst = xfrm_lookup(net, dst, &fl, NULL, XFRM_LOOKUP_QUEUE);
 	if (IS_ERR(dst)) {
 		res = 0;
 		dst = NULL;
-- 
2.50.1


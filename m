Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794CF30E82A
	for <linux-staging@lists.linux.dev>; Tue, 12 Aug 2025 15:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755013976; cv=none; b=gJ24fwWf+1T4y5/ejEgBwS3Yxp6aGwzcvFWnfN0XrpHI3qIbVSka/bv8kJB4P071VvQrz2flqo86oJqRlSNj0HCjwdNgTurKvwkAJcmma9LZrHaa7o7JA6WN4zEzD+gOtuvZ0cRJwm6FNsg0V+u/jkhKuoFzlgnD1u+SKPs5N5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755013976; c=relaxed/simple;
	bh=jmLedCN4R2YU+yGCxHz2Yf4utVRQz3r3OsmD+iWWE6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mDZ56vJFp32x6GREUUSxBj1STS34esan2eZKbrGsJ0WQUQMhOSpE9ZTh8eKeaVU2nUZNwq1EDWb8BKiD+U+6Hr+FQmFF9ExOvojKSiba9zlHMQ9pZOmsYlJ3Tr3yX+SNAMMJLv4hAhzIx51eJB2t7ODjwmuH1bdXzDCWr+9SEVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-76be8e4b59aso4855079b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 12 Aug 2025 08:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755013974; x=1755618774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K1U24j3avMI496lsvK/FFAte0M6oHVilfdD7GVgxXmw=;
        b=i+ErIe5i5ZoZLwBOI41TLJsWzixMBQdqkG1W/zirRNpCzZsHP535y6H/s1ev1pyb+L
         hPOaeXWilx61etY8/U3JrRnuJRodys5gn9/YL8XzXNZwYo2DO49JOT8sLJ39c3yb87D9
         HESUo55fXQA7xkkYMajMhJ68qCVUE1B+/2POtOOnPwwUGuniJ86++zXJXb6KihnS0Add
         58jTSDN+BWJvXYvZuPQcLm6SKhiSf81P2Vcx9U84I2Iy14R78DM/Zf7NXja1TBKlw0uc
         GFWxN5Q8viVpIwAuzo0wnPbDkpfn9KNgeNx9AkuilJaUc9cA2C2c2CPdQiWR9eDj5WcK
         mKCA==
X-Forwarded-Encrypted: i=1; AJvYcCW4+1nPrSuCH4A/mrsU/YCZb1hGXfTskfiOx4mXjNmdoBoKGZF79RISm/rx2OGtgbEY4P19FAENRypqZZoh@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3dZ3Lzbd3QrOP/+zqfqD6c7Neq6v0/ZGtBMP7Xp26R5zhbX6s
	zMHrKcPkNdBltl2fKzgVRGRzDEJbPKVP9sXhdBnxAsPQPJTUA/yTwwg=
X-Gm-Gg: ASbGncvKxGL3HA0ikyP4AejEYx2awxEO6oSu2oGQYlyzLpnFh7loiTl5GgkroEA3L/w
	G3L7Yi5rxbRMmvPUFZrY1B8tSqtqlmg1BQs+xckujRQe9N/MN9Mmr6hNZStwUVfKsRJ72UbimBB
	cD+AoJPp1wdTW5DKrU00J6g+kb6GifAvfonxO99iM962jIGmUYkU+2yjHOEM0yx5IWu4quTEDp6
	45HXJ3KgUFYuih7uTa4uoBgf3ZA/JFOsoG6/D/5tJiOFrccPMyyH/Cykf9eiCQT4H/etmnzSZof
	pJ19bk0zoa3LXD+fpxAMj4NuIT2yZKc15MIotJ/H59p+T7KTt2GSuNQwh5AMmWv6r6aMZN3Zats
	srcgw8t6tMDAzI5ZL3OT9ywMGNoCmKSMo7l7nd6Tsair5ILB7P+VTB2J7jHc=
X-Google-Smtp-Source: AGHT+IFUKvjZ3Rba9MvqVnh8vH8eFopfwTUPgEOJxRTkNbViqfPFICyo8rbbnicPKgPRyQnCxRtE3g==
X-Received: by 2002:aa7:88c8:0:b0:748:e1e4:71de with SMTP id d2e1a72fcca58-76e1fdb0881mr36267b3a.14.1755013973774;
        Tue, 12 Aug 2025 08:52:53 -0700 (PDT)
Received: from localhost (c-73-158-218-242.hsd1.ca.comcast.net. [73.158.218.242])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-76bccfbd98csm29585074b3a.67.2025.08.12.08.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 08:52:53 -0700 (PDT)
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
	steffen.klassert@secunet.com,
	sdf@fomichev.me,
	mhal@rbox.co,
	abhishektamboli9@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	herbert@gondor.apana.org.au
Subject: [PATCH net-next 7/7] net: Add skb_dst_check_unset
Date: Tue, 12 Aug 2025 08:52:45 -0700
Message-ID: <20250812155245.507012-8-sdf@fomichev.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812155245.507012-1-sdf@fomichev.me>
References: <20250812155245.507012-1-sdf@fomichev.me>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To prevent dst_entry leaks, add warning when the non-NULL dst_entry
is rewritten.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 include/linux/skbuff.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 8240e0826204..2f9dac54d627 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -1159,6 +1159,12 @@ static inline struct dst_entry *skb_dst(const struct sk_buff *skb)
 	return (struct dst_entry *)(skb->_skb_refdst & SKB_DST_PTRMASK);
 }
 
+static inline void skb_dst_check_unset(struct sk_buff *skb)
+{
+	DEBUG_NET_WARN_ON_ONCE((skb->_skb_refdst & SKB_DST_PTRMASK) &&
+			       !(skb->_skb_refdst & SKB_DST_NOREF));
+}
+
 /**
  * skb_dst_reset() - return current dst_entry value and clear it
  * @skb: buffer
@@ -1187,6 +1193,7 @@ static inline unsigned long skb_dst_reset(struct sk_buff *skb)
  */
 static inline void skb_dst_restore(struct sk_buff *skb, unsigned long refdst)
 {
+	skb_dst_check_unset(skb);
 	skb->_skb_refdst = refdst;
 }
 
@@ -1200,6 +1207,7 @@ static inline void skb_dst_restore(struct sk_buff *skb, unsigned long refdst)
  */
 static inline void skb_dst_set(struct sk_buff *skb, struct dst_entry *dst)
 {
+	skb_dst_check_unset(skb);
 	skb->slow_gro |= !!dst;
 	skb->_skb_refdst = (unsigned long)dst;
 }
@@ -1216,6 +1224,7 @@ static inline void skb_dst_set(struct sk_buff *skb, struct dst_entry *dst)
  */
 static inline void skb_dst_set_noref(struct sk_buff *skb, struct dst_entry *dst)
 {
+	skb_dst_check_unset(skb);
 	WARN_ON(!rcu_read_lock_held() && !rcu_read_lock_bh_held());
 	skb->slow_gro |= !!dst;
 	skb->_skb_refdst = (unsigned long)dst | SKB_DST_NOREF;
-- 
2.50.1


Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7152F8BF6
	for <linux-staging@lists.linux.dev>; Tue, 12 Aug 2025 15:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755013971; cv=none; b=nVct1a1lQhLmyG57SgSIk6zsIrwUZEg3nJRX+RtvwpMT7a6obtxKxrImCl0Kl8rNCWZwyQ5Hb9NGD1CdpgG+4VMWJBuMzoIbWwwxrIxhAh4Xb29RRUPVvwblNTc0sDCaClXIyh6eSE1s2QSmw86oRgrSUtUPCGqvsmnmz5XoSLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755013971; c=relaxed/simple;
	bh=fXCtUvE3yZ8Ta3ENIVmkZfYuYynYoj4o1BaMKekS+tQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NYALQnBd8+jD6/tAiyE85K2F73DymtDSrwjvTaLG+STYDlLL2BGDBEzf8jKdRPxeB7We1WVf0KsJvQzwI+rw07fWHpvsQQCh5bvu828hLhriuABIb5O64i2dQuS9i2savbWeNXS2ZqjR3XawyObOHfrVjcdY12TM82aDvPb0qes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-321c4bc62b3so612949a91.1
        for <linux-staging@lists.linux.dev>; Tue, 12 Aug 2025 08:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755013969; x=1755618769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZ2PNbTnzBBRXiHAIHDOCvJVs332KZDFwAXo2dsewkU=;
        b=WFuFhRzUYFcT65vbknGr7CvpvUH27Dv8FAqQXzN9dA6vCpXEfg/uv3kFLkXSgPvYT9
         l8/CY/IzXYbFsQ3LfCHgs0An6WPiL8IXdBtX8dlgHsocthPStBBQzAqm0aZqf6U7PBFW
         1k/EGE8s8K7B5OlXVUBvu9BUQJaKfgx+FBWTHBUWkQ1cG6hB7OzYdyEZ4RbjmCnBHKo8
         hQNhj2wI+gGBTTcAf2ZI0NA+c3h42S54FOUzatVUUvFtfkM9yW3APdqIBUMNHA7V2Fec
         RrbcDvLmA2uYLFU6Tg0E87JTk7qgNroFBJrRie6wxfSEdI7W17b7TruKftAahADW3omm
         bFXA==
X-Forwarded-Encrypted: i=1; AJvYcCUVvcQZQ90AWcMTj3v89XZ5rbUiBkMfrq0/qM5cd6gmH4gCfzkqhFFWqW9sNHB1ZaISuXaYTh7jUPiglMfT@lists.linux.dev
X-Gm-Message-State: AOJu0YzVM2M0Ja0l+i5sGYzQrRLSAXEGx7es2gDHuwN3Nim/Vt9t62rs
	L2nNmfgRdCwg/Uk3kk8WlH4y/izsMKuwwiRI8fssSf1dy+rctzCM+/Y=
X-Gm-Gg: ASbGncvSA4rsRIRyaApXJ+FDJWgmVFtcwemZvnLwr8chGZS/p2pzdoQqfORv4NPhqrG
	o04U2ncZNfk+0TAQ66ByTk6uqnkSAyVh77VZD9BmwcPYcEMhZ2guYsYMGzCEF7eDhjYESv2qhrL
	d0s7hTIJqBpljFBhy5mvRt5RSzZNa5Js3U3L8NZUfzZYXxfpynye25KkcZKUm7A/lvNov4ZmkwB
	2HkR4+AjPiV7f9fPGruzOzccYqsmASZiWzeBXDabenLY0TUIyRAUM1mvbyUvY5AgrnIoun5BDfR
	oL6jZrvudWfyyJLpKlhf7OP4msUcPMjcrP7qLeeRaR6R6y6SyR4U0oIKsCvg+9EVozbYDwnPGyi
	Xk0PwlVIvBkxdwCyPbvDJ/wcEz9RNrfOMDlyszxWW1OQDSG8reO9XvS+mdCU=
X-Google-Smtp-Source: AGHT+IG5NYGRXdG18GJL96gJWerOeV9DFgASgRy1fmywR5uXPOGO/k6Sov9SDfx/URQS3SioUvKMIg==
X-Received: by 2002:a17:90b:48:b0:312:26d9:d5b2 with SMTP id 98e67ed59e1d1-321cf614e8amr157587a91.0.1755013969520;
        Tue, 12 Aug 2025 08:52:49 -0700 (PDT)
Received: from localhost (c-73-158-218-242.hsd1.ca.comcast.net. [73.158.218.242])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-321c2be2c2csm2278407a91.12.2025.08.12.08.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 08:52:49 -0700 (PDT)
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
Subject: [PATCH net-next 3/7] netfilter: Switch to skb_dst_reset to clear dst_entry
Date: Tue, 12 Aug 2025 08:52:41 -0700
Message-ID: <20250812155245.507012-4-sdf@fomichev.me>
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

Going forward skb_dst_set will assert that skb dst_entry
is empty during skb_dst_set. skb_dst_reset is added to reset
existing entry without doing refcnt. Switch to skb_dst_reset
in ip[6]_route_me_harder and add a comment on why it's safe
to skip skb_dst_restore.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 net/ipv4/netfilter.c | 5 ++++-
 net/ipv6/netfilter.c | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/netfilter.c b/net/ipv4/netfilter.c
index 0565f001120d..bda67bb0e63b 100644
--- a/net/ipv4/netfilter.c
+++ b/net/ipv4/netfilter.c
@@ -65,7 +65,10 @@ int ip_route_me_harder(struct net *net, struct sock *sk, struct sk_buff *skb, un
 	if (!(IPCB(skb)->flags & IPSKB_XFRM_TRANSFORMED) &&
 	    xfrm_decode_session(net, skb, flowi4_to_flowi(&fl4), AF_INET) == 0) {
 		struct dst_entry *dst = skb_dst(skb);
-		skb_dst_set(skb, NULL);
+		/* ignore return value from skb_dst_reset, xfrm_lookup takes
+		 * care of dropping the refcnt if needed.
+		 */
+		skb_dst_reset(skb);
 		dst = xfrm_lookup(net, dst, flowi4_to_flowi(&fl4), sk, 0);
 		if (IS_ERR(dst))
 			return PTR_ERR(dst);
diff --git a/net/ipv6/netfilter.c b/net/ipv6/netfilter.c
index 45f9105f9ac1..6743c075133d 100644
--- a/net/ipv6/netfilter.c
+++ b/net/ipv6/netfilter.c
@@ -63,7 +63,10 @@ int ip6_route_me_harder(struct net *net, struct sock *sk_partial, struct sk_buff
 #ifdef CONFIG_XFRM
 	if (!(IP6CB(skb)->flags & IP6SKB_XFRM_TRANSFORMED) &&
 	    xfrm_decode_session(net, skb, flowi6_to_flowi(&fl6), AF_INET6) == 0) {
-		skb_dst_set(skb, NULL);
+		/* ignore return value from skb_dst_reset, xfrm_lookup takes
+		 * care of dropping the refcnt if needed.
+		 */
+		skb_dst_reset(skb);
 		dst = xfrm_lookup(net, dst, flowi6_to_flowi(&fl6), sk, 0);
 		if (IS_ERR(dst))
 			return PTR_ERR(dst);
-- 
2.50.1


Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C71F30E821
	for <linux-staging@lists.linux.dev>; Tue, 12 Aug 2025 15:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755013976; cv=none; b=M7BuV1365oENSnsZ1s1HbMwLGx4utNvaZ1ut4JbULRy1D1Qawa1Dg0KIORqtYLs05k469FLLjHL5p+nWDFZ71RjhlLdGoA6zBCBm17FUS098EqgARSzB29aSX3xRGzycf6P2yEenWHYg0Jblx4bn1gURmXGxlxXN0w607u8ScsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755013976; c=relaxed/simple;
	bh=n0sQUuKqf3jLXpNCjqUW24KyPE8yGVDwJlEFI3R/YWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZYS9zofjRWxaSbEhF+ImEvNW5KI3nu+Vt9OurCR2RPtHfC76Jy5TkMK2MUBVNxMTahBGuqh7OWSugAL58YnX32OYHRzTyZUcmX0idhApH+N2BwLhG7RITnW0IbyZ4/sj+yagQ6sEKOy9L4oRxn092qU2DecmBZ79QD+gW4GIOrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-76b77a97a04so5182889b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 12 Aug 2025 08:52:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755013973; x=1755618773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZz85zxG1Fdx2Dk3+7K6+fby+2lWmdMlXym1/uID5+g=;
        b=F5+w/T09dFQmwFvMADGXztWbtnF2yFWkkdP5MKwdcoN+h/eYmZFOsRSURZ2rf1OGoG
         IiOw6s6FgxMWlJEnIetew/rhRoYEbn7ntKahRNCjodo0xBV5OLXGLhGAKlrSKZwrUpLl
         TPfuY/gj11VWQ6E65JXmrpCO3gUHPjjawSsOGHrYqd0jElGpeZcugY4thWpZjs+LbPkL
         WkRVsDRRBQ+00Zm9tiN2vgnXutNoz80Mp9fzFS/gdRxEeob1zL+FdEDKyHEmYcksv3TO
         HM6K1f8UhX+R4wD17Ut4YyNtFhSSOS1BWGzgep7mc1yVxoVfffaQ6NPy85qKiyG7f76H
         omjw==
X-Forwarded-Encrypted: i=1; AJvYcCV6PdqNqi7Mi6oyDzgKvPvA/K6BmIXSdSHQude+2EAbLLIbfrfoMRRaYRsNFkywLV6wZy1vMGzkGhTy1iFR@lists.linux.dev
X-Gm-Message-State: AOJu0YwB3BCXK5CBtgU//MB+jPjdj88evu8EaKEtwgNRbLqYd2r0TkaA
	AO9B4C61Nt4uUpfC/n57oVEeRu1CtboA2mjHS+8cnPDq6ZAkqx+/+jw=
X-Gm-Gg: ASbGncsqUxPGN1z3VsyqmwIs34dHAUDjrvKz5zI0/+ziNHCz06bar3sH8lboetKB/fV
	E5/lvFzFjW9Sy8DKnm8NmZeaOS5ejIjqCI00k1KNNm0csdG7ApSpJ5CICRs3WJMItOD6cPKV8Gc
	pI6toseGxIPfuaOSr3sZAaL81zYbSb+gqKijB14FewyiCDKytrG1umLoPTOsW57Ti5OPu58xJFx
	SqCmf3+iiZSStNEe7rmHtzUc8YyEQYtCtRZE/iORTXCjtXZsJdAeNw0AbXV2VmM6xoRZ4wrEPrh
	xbcvyAAnTglKKVJ0twH31dKoqdpHFbb4h/5BBYItHA7T7voMQuC/lqm7D9MMz4i2OUv+0en2fXm
	7ZQtBuYfdcCHIncPDFXqroJVOGjfUmdvv2TU4mt9oVJnqo1KGRnVcSp3QRZM=
X-Google-Smtp-Source: AGHT+IEO5Z5M/KtjpW0VLb1+nruS8V4gTPoqbW8FOI4fKlCjaJC6j7Dcr7qiVY+6B9jvyJru9WYgYw==
X-Received: by 2002:a17:902:da8c:b0:242:a3fa:edb4 with SMTP id d9443c01a7336-2430c133180mr2455155ad.44.1755013972729;
        Tue, 12 Aug 2025 08:52:52 -0700 (PDT)
Received: from localhost (c-73-158-218-242.hsd1.ca.comcast.net. [73.158.218.242])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-241e899a81fsm302235345ad.120.2025.08.12.08.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 08:52:52 -0700 (PDT)
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
Subject: [PATCH net-next 6/7] chtls: Convert to skb_dst_reset
Date: Tue, 12 Aug 2025 08:52:44 -0700
Message-ID: <20250812155245.507012-7-sdf@fomichev.me>
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
existing entry without doing refcnt. Chelsio driver is
doing extra dst management via skb_dst_set(NULL). Replace
these calls with skb_dst_reset.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 .../ethernet/chelsio/inline_crypto/chtls/chtls_cm.c    | 10 +++++-----
 .../ethernet/chelsio/inline_crypto/chtls/chtls_cm.h    |  4 ++--
 .../ethernet/chelsio/inline_crypto/chtls/chtls_io.c    |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_cm.c b/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_cm.c
index 6f6525983130..b333da3b21bf 100644
--- a/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_cm.c
+++ b/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_cm.c
@@ -171,7 +171,7 @@ static void chtls_purge_receive_queue(struct sock *sk)
 	struct sk_buff *skb;
 
 	while ((skb = __skb_dequeue(&sk->sk_receive_queue)) != NULL) {
-		skb_dst_set(skb, (void *)NULL);
+		skb_dst_reset(skb);
 		kfree_skb(skb);
 	}
 }
@@ -194,7 +194,7 @@ static void chtls_purge_recv_queue(struct sock *sk)
 	struct sk_buff *skb;
 
 	while ((skb = __skb_dequeue(&tlsk->sk_recv_queue)) != NULL) {
-		skb_dst_set(skb, NULL);
+		skb_dst_reset(skb);
 		kfree_skb(skb);
 	}
 }
@@ -1734,7 +1734,7 @@ static int chtls_rx_data(struct chtls_dev *cdev, struct sk_buff *skb)
 		pr_err("can't find conn. for hwtid %u.\n", hwtid);
 		return -EINVAL;
 	}
-	skb_dst_set(skb, NULL);
+	skb_dst_reset(skb);
 	process_cpl_msg(chtls_recv_data, sk, skb);
 	return 0;
 }
@@ -1786,7 +1786,7 @@ static int chtls_rx_pdu(struct chtls_dev *cdev, struct sk_buff *skb)
 		pr_err("can't find conn. for hwtid %u.\n", hwtid);
 		return -EINVAL;
 	}
-	skb_dst_set(skb, NULL);
+	skb_dst_reset(skb);
 	process_cpl_msg(chtls_recv_pdu, sk, skb);
 	return 0;
 }
@@ -1855,7 +1855,7 @@ static int chtls_rx_cmp(struct chtls_dev *cdev, struct sk_buff *skb)
 		pr_err("can't find conn. for hwtid %u.\n", hwtid);
 		return -EINVAL;
 	}
-	skb_dst_set(skb, NULL);
+	skb_dst_reset(skb);
 	process_cpl_msg(chtls_rx_hdr, sk, skb);
 
 	return 0;
diff --git a/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_cm.h b/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_cm.h
index f61ca657601c..4ca919925455 100644
--- a/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_cm.h
+++ b/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_cm.h
@@ -171,14 +171,14 @@ static inline void chtls_set_req_addr(struct request_sock *oreq,
 
 static inline void chtls_free_skb(struct sock *sk, struct sk_buff *skb)
 {
-	skb_dst_set(skb, NULL);
+	skb_dst_reset(skb);
 	__skb_unlink(skb, &sk->sk_receive_queue);
 	__kfree_skb(skb);
 }
 
 static inline void chtls_kfree_skb(struct sock *sk, struct sk_buff *skb)
 {
-	skb_dst_set(skb, NULL);
+	skb_dst_reset(skb);
 	__skb_unlink(skb, &sk->sk_receive_queue);
 	kfree_skb(skb);
 }
diff --git a/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_io.c b/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_io.c
index 465fa8077964..85e4d90efd5b 100644
--- a/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_io.c
+++ b/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_io.c
@@ -1434,7 +1434,7 @@ static int chtls_pt_recvmsg(struct sock *sk, struct msghdr *msg, size_t len,
 		continue;
 found_ok_skb:
 		if (!skb->len) {
-			skb_dst_set(skb, NULL);
+			skb_dst_reset(skb);
 			__skb_unlink(skb, &sk->sk_receive_queue);
 			kfree_skb(skb);
 
-- 
2.50.1


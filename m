Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B1625B311
	for <linux-staging@lists.linux.dev>; Mon, 18 Aug 2025 15:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755531636; cv=none; b=Wh1SoEMXEM6GnV7jia6h4g+Sg/MooEXagJoR0Sj0FzJ/r8BR/ki2Vb6nBhBPMNzZ92IgQU5yWeHSDW9slnvkBhR+91PKpjNYfE3KMQ09PzAy9QR8/DgKCQ9iAKN6jMDITtnrsPkKZHB+zVAKyj+SCuTCuTAyadGhki1CpzBxgKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755531636; c=relaxed/simple;
	bh=ZxyGscOHeqQ4OoQLuMcftJmNOcrzdMA3DnVbJ/3/Ji4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qjjwx3F+Mi/S2R14PXG/M4YG49FfLBij9u0Om97Mtul/pBHBTkI+XbaPSp3UahwLEjP6ncl1zPW4ctYoF7RFMFe9LqaC2d4KfaX1PzFMObG8XGvt2A6mkl3WCHWu2lA93nrDP7wBven+z49bbrnrDMNkQcnthQ4prVevsJk6h68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-76e2eb09041so3548560b3a.3
        for <linux-staging@lists.linux.dev>; Mon, 18 Aug 2025 08:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755531634; x=1756136434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4jXoBQiGcML+O5CHFOk8NakzzuxAVed76FZQO5V7Zuo=;
        b=A72b4Pc/nmJZFNeyu+ghLXi1ogDz0dVBb+fSQFQoLacKKq74OJ19AfVPTw37M5eIVP
         j2xXgd7jw+08MyuWgFSJ7nJT6/VK3F1nXuajtPWgSBTERd+TjwC3WjpO26wHnYBys+MP
         Ysj/2Q4dloS6e/FLWEWmjQdjPEMQrVqv0IHCSe3Y1qjZkeFFlyhFZy5Iku9nSpU1G7EH
         ZfYNZXrZH/DHe7F7/hjVBrxId5AQ4FtGP/wpOJkrfMA0rcvR1r9ZJyg1hqkdRLz8Z+BM
         6iAfVimMlROXSuUctc8ai0jQLi0MUeWRtlZEAYrLv8l0jvOprXgz2w49knYYw7txRZIt
         BQIw==
X-Forwarded-Encrypted: i=1; AJvYcCWQB+Mibhm3aSoUV2Ayt2udlmXsRBom/gWmuClMJGIfO1JqV4B1Wm95nJzgEzHPexmKDUb53kexpEuBE0ht@lists.linux.dev
X-Gm-Message-State: AOJu0YygWxOC1F5LTWVskl9YERCBWKdI10ERwmwinaLTMWnR5GOK2lcH
	nUTRTehwzcQNYo1f8EwfeMFRkTX1MJIiXz7PsM0UTvXPf/VEDvB1EP0=
X-Gm-Gg: ASbGnctAY3dcXcz1v6dJz3euKIRWVbiqWbcUXe/+WQqdo8uAzZ2pC3ZJmFT6t/37ZKs
	vu6psraclo0oqwsNzO9SHIiZgc4WfEwbcViIlQqLVVXxjEnHJJfLDnwcioPTAflO6Z+57wU8sDE
	1Eb9LCPUFvKZoXzhAWnmuqNXCKPm2h7BfytbHKiz6QpFxUJL6JM6UHPfvj3B8f+6oZD6KgT9xgM
	lz/xdZBqWQS6a55Nr+kkXASZl1rGCddzx9tmR3W/Zb1Y4VyIEgVrC3ntSlpKyfPNbSKCUD760KH
	LBNAQUYihd8ENtBBcTgXkr0wLVT0aYwtnKbOcKbvKJFBy2DeeDf4bC7BdeJxwmDQLNhFiupjwLW
	bt4YNms4sRXfMqkZYQr/YSGOhZ5+J9nFdhMqFDuq1a6ePk6TZ5Oe7wBvl8UIK5IArVhBDGg==
X-Google-Smtp-Source: AGHT+IF/N1PLy55109GC/Y7zY4a/TPzsoK+ogpED49iOqmUzUNQ5ofGeFk3sGZ2eemY8kdMbbgxW8A==
X-Received: by 2002:a05:6a00:17aa:b0:76b:e16f:ca91 with SMTP id d2e1a72fcca58-76e446adf03mr14527105b3a.1.1755531634478;
        Mon, 18 Aug 2025 08:40:34 -0700 (PDT)
Received: from localhost (c-73-158-218-242.hsd1.ca.comcast.net. [73.158.218.242])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-76e455ba020sm7502378b3a.109.2025.08.18.08.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 08:40:34 -0700 (PDT)
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
Subject: [PATCH net-next v2 1/7] net: Add skb_dstref_steal and skb_dstref_restore
Date: Mon, 18 Aug 2025 08:40:26 -0700
Message-ID: <20250818154032.3173645-2-sdf@fomichev.me>
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
is empty during skb_dst_set to prevent potential leaks. There
are few places that still manually manage dst_entry not using
the helpers. Convert them to the following new helpers:
- skb_dstref_steal that resets dst_entry and returns previous dst_entry
  value
- skb_dstref_restore that restores dst_entry previously reset via
  skb_dstref_steal

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 include/linux/skbuff.h | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 14b923ddb6df..7538ca507ee9 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -1159,6 +1159,38 @@ static inline struct dst_entry *skb_dst(const struct sk_buff *skb)
 	return (struct dst_entry *)(skb->_skb_refdst & SKB_DST_PTRMASK);
 }
 
+/**
+ * skb_dstref_steal() - return current dst_entry value and clear it
+ * @skb: buffer
+ *
+ * Resets skb dst_entry without adjusting its reference count. Useful in
+ * cases where dst_entry needs to be temporarily reset and restored.
+ * Note that the returned value cannot be used directly because it
+ * might contain SKB_DST_NOREF bit.
+ *
+ * When in doubt, prefer skb_dst_drop() over skb_dstref_steal() to correctly
+ * handle dst_entry reference counting.
+ *
+ * Returns: original skb dst_entry.
+ */
+static inline unsigned long skb_dstref_steal(struct sk_buff *skb)
+{
+	unsigned long refdst = skb->_skb_refdst;
+
+	skb->_skb_refdst = 0;
+	return refdst;
+}
+
+/**
+ * skb_dstref_restore() - restore skb dst_entry removed via skb_dstref_steal()
+ * @skb: buffer
+ * @refdst: dst entry from a call to skb_dstref_steal()
+ */
+static inline void skb_dstref_restore(struct sk_buff *skb, unsigned long refdst)
+{
+	skb->_skb_refdst = refdst;
+}
+
 /**
  * skb_dst_set - sets skb dst
  * @skb: buffer
-- 
2.50.1


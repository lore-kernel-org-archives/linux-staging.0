Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1007B3090C5
	for <linux-staging@lists.linux.dev>; Mon, 18 Aug 2025 15:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755531640; cv=none; b=jE9XkLk6uU9KiqO+SvAgYa6bTKAdxZ8pkO/Xcvh2mT+tl6zezybUlZaX+gfG5OwXMtt/f1LHB8PbHQsWBIs6QNxUg1ME3qx4U0WBK3UpRDDtKMCbALfMEvr6eU8Yo7ZycEWtL3sTQr/lCjUd/xykkD9Ly2PZmlxXUGQcEqmnKz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755531640; c=relaxed/simple;
	bh=sAFz2z1/ZRQC2qROcdiohLJaaH2BTTS3LygeiT3tr9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DzANe/x0k9tJsz8LZ472dZuU1CWmDLH4z8FDnhpIE+rDyHxuD364jsvdQddVdwgR2H+74GDsdnCF60kVTigT3puElW87BJ/bBctSKqhwc7hL1KHU13ceQBCnmblD4g7DIFf1VzYV9TOXyJSyswWvBgsgv044g6pZjJoSvoNdn+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-76e2e8aff06so3383365b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 18 Aug 2025 08:40:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755531638; x=1756136438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=400SjVSUfc5lqYKS9qNytHX8Gj0bax7ac3ijCvpYgEA=;
        b=t2O8OlAK0nWXfFm/oB+xnEJHpIayMAm5H8zMjRWW/VYnH3DErNrR5TP1vnKVFnhpzi
         A245elAbdD+nBuZrWQXXJCs2u8dOECkJiM45mFybQRnK7ZpxU6AXc9uWvTrOb2mfA1Ff
         7pAesSATTHvc9ZujbTPr48yD15lSZm/7VZwHOh/uVH8srrfute9bkGmC7An6vVbMgZLs
         9tmAEWS+OM6AKu8u1TbbxJ6rX7fRGu5M9IAqG+nlDoGTefzMRV1torx1loXyUQEp/gXk
         z/NhnJCWwhJbaFAz7SGj3rLQx6gvN/2zp4fNfqbWj+qohHCQmT0VrrgYE6oBHbvpZ6dB
         YrTw==
X-Forwarded-Encrypted: i=1; AJvYcCUfD9RhhGeOK5jFnWWoJlBp7Zj+ZZE8DKaVBMlsQy8CWi4yTLlnOqC8tWadbqF+nmpoyIFtKRnJHlpPr0Gx@lists.linux.dev
X-Gm-Message-State: AOJu0YwUBA5SzwpsuDZW4cPTI9oBmoWmcIZwa+srcVCBfm0h4wvIuVzE
	Ptc1sFd0brodaz9CSw6GkleG9q+ckF6IYlpTAod2THQUmTGyRR/qMOI=
X-Gm-Gg: ASbGncvbVMSUk+4Ssmrnjg28Q5WaXJxpiUTK2p5Xq43mfY/g+UaABAzk/tPp4m8dSPd
	JCvLUykzY8A08OQuxewE4bTcmptU4KYXVLfIqJityhY04AhNq1MQPz5q7mdvVQghHaMCgGL43dm
	PF1Gfah2Rgj770/EFi4CVOnhrqTfEtJDfRTq3sxmgR2p1rNki0zsUSP6Q4e/AXKLRVx4fmBjkI2
	gvw0NYT7F3gpqjxPHw+MK5txJE+tl1ZAJ6pJdzOPJDQ/amJ4CibyVy+UmWJAyYn9hKqix3ASRAe
	F8vPi+qBQP6uEWb/pR3Rmen1HfT2B5AcjYzcxsFzjGPS3VkaoX45K8sz9orwp0P4xmvL/5hc/ST
	a7gmBzw3myytbKn0PWCxWQfkxuI89TWYebPj9m/pj0e+GEutcMIu8hlNRBaU=
X-Google-Smtp-Source: AGHT+IECWwhvmllltH2cL2i4wyPzxSnCX2N0lJL9cMNY5uoidiXvTkAY62nN1JppFj6A7yEoIZc6+g==
X-Received: by 2002:a05:6a00:1701:b0:76b:f01c:ff08 with SMTP id d2e1a72fcca58-76e446a7638mr15752658b3a.2.1755531638161;
        Mon, 18 Aug 2025 08:40:38 -0700 (PDT)
Received: from localhost (c-73-158-218-242.hsd1.ca.comcast.net. [73.158.218.242])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-76e7d10fdb1sm5731b3a.27.2025.08.18.08.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 08:40:37 -0700 (PDT)
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
Subject: [PATCH net-next v2 5/7] staging: octeon: Convert to skb_dst_drop
Date: Mon, 18 Aug 2025 08:40:30 -0700
Message-ID: <20250818154032.3173645-6-sdf@fomichev.me>
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

Instead of doing dst_release and skb_dst_set, do skb_dst_drop which
should do the right thing.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 drivers/staging/octeon/ethernet-tx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
index 261f8dbdc382..0ba240e634a1 100644
--- a/drivers/staging/octeon/ethernet-tx.c
+++ b/drivers/staging/octeon/ethernet-tx.c
@@ -346,8 +346,7 @@ netdev_tx_t cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
 	 * The skbuff will be reused without ever being freed. We must
 	 * cleanup a bunch of core things.
 	 */
-	dst_release(skb_dst(skb));
-	skb_dst_set(skb, NULL);
+	skb_dst_drop(skb);
 	skb_ext_reset(skb);
 	nf_reset_ct(skb);
 	skb_reset_redirect(skb);
-- 
2.50.1


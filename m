Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD6225B30E
	for <linux-staging@lists.linux.dev>; Mon, 18 Aug 2025 15:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755531636; cv=none; b=gtm9h75PZyj8T9l54YKD/sQn6iQjn4IdH1YGxKDPQmtNuKdA3KOjL53/NizTBRL3GDeGyrVeh3ASEKL3E8bAXsSUVk4nN5fwsI64mxMKfLj9UqUySZVS3jwgvKNqw9WyJlInamYUFVb49ordUBPsYGcYPcXPgVVM5ry16BHsCI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755531636; c=relaxed/simple;
	bh=WEv2PQfVPI+9ejQt1JOoeGYCKznQPO8LDnUgsOnT2GY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bm2aKQzBnZqm8bzMxcBSOOvl8ErRbYxZdrENuF7Zq6OyKWC7MwmKjREq/0UEa7MpiDLP7ZkZ7BslS6K3aYw5xpwMQf5OoGYgyGLURu8U8enT3S3yFvOQBo8TTxRjVyUAiwD60gFHUxHYkd1tezSWKLEeeCbcoGaDjAwxTo2Nl9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b4746fd4793so965285a12.1
        for <linux-staging@lists.linux.dev>; Mon, 18 Aug 2025 08:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755531633; x=1756136433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=05onlVW0XXyv0dQ8dN62N/saox8u4e4HZdWmUU3MZIw=;
        b=Yxp1dJnkO+vWaPOnAODpy6zBfPbl6RaZmxaXz8wOI0AtOTjEt47mt+EzeFcGo7PiK9
         r5H2xvAzmPbnVXTfn6MnfWjWxPPqYJWW0NXe8BVm89ly198WeGSzS3IpXqv6KbSNlcEp
         CSQL5l0Ttc2vynp65DFVN/j/AVhJNTF/SWkP5NaxqSrXqUXu0891XGWdRdkJzfJJDOnb
         AyuHLpAybZGufn47JysIR+HUs2uVHCpegjujYI06rMNTmF2COQ3AR3FmYg5Sm5M/rBN+
         /s/pudtz3ylgV4mgk+Gf91b3Kpnf2Q2eulw9oburJs0ppFmr+A0QCaZVHCbKOYvO+MOG
         SHjw==
X-Forwarded-Encrypted: i=1; AJvYcCU/HUX4yjKxLK3Mds9WCmFtDr9OHle2aIIoiad34XALoZFeq+7trNfuNe/fOAtpznh+bjdmQW1JwMi644E4@lists.linux.dev
X-Gm-Message-State: AOJu0YzFPF1s9UdrLTTFs3Sj8fGlRqpVIO4k/PEE9Fm9P13K+g9SsZQ3
	oPn9WNDGcVnGyuveslvbDu/mRQeSE70WOtf6HDKBlGzzuYPs8ZGvWKY=
X-Gm-Gg: ASbGncuB3kA+Qnf15Umfo4SzFKU4ZYv+W+gvrjWdVqt/CTZPP7n/EtCcvTSh0f7PVH0
	31A36hT3CmorzIkCx2t8NteOAU2X4jIIb2Miiqx6eX8qMBarQ91H/E75NC/Rn1+yMrGWvZr769z
	XY1OXy8QYRRoXAubgRgDKlUC54ZkYGVpktXMkIU8k+ZurRjy7AdIjzxlm4SGGhwW2NJ+DXQhSTn
	8KO4NQNdBwRjBamAYuKJLVOS9oZJ67I9fTkwwLqzqcfdjwu0+L/4O6d92fQgf3dpimquy/Y6xoj
	345sZFlsgNvNhImELALVV3KnjrllFf9fJ8Zmi/qZiOOuK7HjLURmcJwxXUUPhKMAbyFB4OnWFNn
	4nCNLDj19uSezBVuuGOjwyEx4iBXGyrLk8TO6THCn38e2WB+vxrIuzynHckw=
X-Google-Smtp-Source: AGHT+IE2Pj5Ew6lBgyqgzz48L0gmUrnTfjQU1Y3HzmaVdoKRrzgV7rZc5UlY0kXH/5xhGcGN5tjsIw==
X-Received: by 2002:a17:903:f85:b0:244:99b4:b38e with SMTP id d9443c01a7336-24499b4b460mr18629385ad.24.1755531633443;
        Mon, 18 Aug 2025 08:40:33 -0700 (PDT)
Received: from localhost (c-73-158-218-242.hsd1.ca.comcast.net. [73.158.218.242])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2446ca9e057sm84009905ad.3.2025.08.18.08.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 08:40:33 -0700 (PDT)
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
Subject: [PATCH net-next v2 0/7] net: Convert to skb_dstref_steal and skb_dstref_restore
Date: Mon, 18 Aug 2025 08:40:25 -0700
Message-ID: <20250818154032.3173645-1-sdf@fomichev.me>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To diagnose and prevent issues similar to [0], emit warning
(CONFIG_DEBUG_NET) from skb_dst_set and skb_dst_set_noref when
overwriting non-null reference-counted entry. Two new helpers
are added to handle special cases where the entry needs to be
reset and restored: skb_dstref_steal/skb_dstref_restore. The bulk of
the patches in the series converts manual _skb_refst manipulations
to these new helpers.

0: https://lore.kernel.org/netdev/20250723224625.1340224-1-sdf@fomichev.me/T/#u

v2:
- rename to skb_dstref_steal/skb_dstref_restore (Jakub)
- fix kdoc (Jakub)

Stanislav Fomichev (7):
  net: Add skb_dstref_steal and skb_dstref_restore
  xfrm: Switch to skb_dstref_steal to clear dst_entry
  netfilter: Switch to skb_dstref_steal to clear dst_entry
  net: Switch to skb_dstref_steal/skb_dstref_restore for ip_route_input
    callers
  staging: octeon: Convert to skb_dst_drop
  chtls: Convert to skb_dst_reset
  net: Add skb_dst_check_unset

 .../chelsio/inline_crypto/chtls/chtls_cm.c    | 10 ++---
 .../chelsio/inline_crypto/chtls/chtls_cm.h    |  4 +-
 .../chelsio/inline_crypto/chtls/chtls_io.c    |  2 +-
 drivers/staging/octeon/ethernet-tx.c          |  3 +-
 include/linux/skbuff.h                        | 41 +++++++++++++++++++
 net/ipv4/icmp.c                               |  7 ++--
 net/ipv4/ip_options.c                         |  5 +--
 net/ipv4/netfilter.c                          |  5 ++-
 net/ipv6/netfilter.c                          |  5 ++-
 net/xfrm/xfrm_policy.c                        | 10 ++++-
 10 files changed, 72 insertions(+), 20 deletions(-)

-- 
2.50.1


Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBBE2F8BC6
	for <linux-staging@lists.linux.dev>; Tue, 12 Aug 2025 15:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755013969; cv=none; b=p3rEOjSaDNqKCL3SEjAbwTj3ydiynYjwGsbEjc8vR21Z3+ZTlxy4WWY55tf8Rwa32EUnAGHQt2KdiYc8FLXMpBu4AEcD+Ujpzt4pq6osWql8k8MiP/WKZy5HEh6j5TMQpueHt6kKM786uAHUS/u4Gwb1Nww0yXrwKMExextLuq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755013969; c=relaxed/simple;
	bh=vr6rzmd2aRCICZEtZpVHst+woIY2PdLz8GDn9zbiJmk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IFXR5/leUGUaJPH+7MPBtQxNJX9qUz7ppDndkIpWxz7zYjETwVhfhfDs4pjr/V8847j1Qan2W3ba6KHI+yAbcPcE3yCWb+zhSfoHJmV5LSFXxuCreLzrpcPoujJEcvsYjmLVUJHQ4NTPFbrRRWKzQcZbAmBuVp9kOGNy8y1J4Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-24049d1643aso41819275ad.3
        for <linux-staging@lists.linux.dev>; Tue, 12 Aug 2025 08:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755013967; x=1755618767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UIYsgiGJtw7YJeoAHTICW+FIrcnnXVaB1cAoAuVZ/CM=;
        b=WB6A5fQwa6eWisrEoOVOT7rJUsyvN9UkpaQzB2j86fU5V4uFUMwkdG93JgxEBh6yMp
         CpyyK5iXtqTg7Bitl2vmz2maZ4QAURnikAXYGX2qx4aemTKj4GHFGwSDChjwFOZS/1mA
         bqG+xQvS57AnsKkWFqwKs06Xr8luzRpEkKJJG4bairp84ASq4p1NXI2qWtn+I9BUU/Qs
         uvHHxLsNC9p3SMdIE64IIAsawwXfcZhXhpdR1wPX8diUrQu/4jHKMVk8Bi+imoiE4ajR
         YeEc8qC8LHINfSWrl3dxVEANAjNlddolymLqAr4tFQAXpK4kOk/02GL4tfcQ7Rx6DbRZ
         kwRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwbIc4fJQCdVVetwcDETs8hwqDYw9ncyav+b28l6n9oxg5LenwfGoVW/Q1/h7Dmp2aEEAuE4Ru4r86UF7f@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2bdHcnQhZ+ipl3/AvS0q33mTtvW7ZOwqWw+YDtNFypE/2/Px7
	1dn7ew5zDA8MB6WhQwfAz/C7vy3h3q5JD7W+iWfYJ001CO2sX0vSsWE=
X-Gm-Gg: ASbGnctRY/jAyDgbWScTdGzYISAwZOtPyBm5+7G48/Q6nbcFtcF1nfSxANApFh2epHW
	x0D/FwhHV7XysviscRZvzMw1e/2gQzYq6Vs4aBviQeu4fPrG5wvKH5dAjmM2IhguJ+2U4lzA6oR
	uIvxDbsFg3r6+h7BGV3OXk/kazoivl9Qd70Uqki9MuSq6aKys9FA4hRaPuLopHCG5Xg/8aibyfZ
	Az6Hk5fB02kJRFCM4oAuX4kyssbR94OZMoJL+LDylOy7DVJl+jpBfyr7EW0FQx2yZA5Ozhbpptf
	OmzpltlD3XTtlhDubd992gvVbw9AgRO6kTwhvhiSYJqgMK+yIOwqkhKDBSjlOUDW4/YCdFFf/rd
	d7JUYNrGJAAZGPMgOaSYH2/K49tBRv8hllP0/wPEp9cNW7hl7gKbsjoObgMax74RpCSBIgw==
X-Google-Smtp-Source: AGHT+IGI1Feslups0/3dIst5xuXnrjwfAXnfJotUgLxW8sNuLdQxHyRUl2S+Gs8wn5Hrn4dfEJ/LMQ==
X-Received: by 2002:a17:902:e808:b0:23f:f6ca:6a3 with SMTP id d9443c01a7336-2430c10a418mr2367235ad.43.1755013966573;
        Tue, 12 Aug 2025 08:52:46 -0700 (PDT)
Received: from localhost (c-73-158-218-242.hsd1.ca.comcast.net. [73.158.218.242])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-241d1ef7562sm302042475ad.24.2025.08.12.08.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 08:52:46 -0700 (PDT)
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
Subject: [PATCH net-next 0/7] net: Convert to skb_dst_reset and skb_dst_restore
Date: Tue, 12 Aug 2025 08:52:38 -0700
Message-ID: <20250812155245.507012-1-sdf@fomichev.me>
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
reset and restored: skb_dst_reset/skb_dst_restore. The bulk of
the patches in the series converts manual _skb_refst manipulations
to these new helpers.

0: https://lore.kernel.org/netdev/20250723224625.1340224-1-sdf@fomichev.me/T/#u

Stanislav Fomichev (7):
  net: Add skb_dst_reset and skb_dst_restore
  xfrm: Switch to skb_dst_reset to clear dst_entry
  netfilter: Switch to skb_dst_reset to clear dst_entry
  net: Switch to skb_dst_reset/skb_dst_restore for ip_route_input
    callers
  staging: octeon: Convert to skb_dst_drop
  chtls: Convert to skb_dst_reset
  net: Add skb_dst_check_unset

 .../chelsio/inline_crypto/chtls/chtls_cm.c    | 10 ++---
 .../chelsio/inline_crypto/chtls/chtls_cm.h    |  4 +-
 .../chelsio/inline_crypto/chtls/chtls_io.c    |  2 +-
 drivers/staging/octeon/ethernet-tx.c          |  3 +-
 include/linux/skbuff.h                        | 40 +++++++++++++++++++
 net/ipv4/icmp.c                               |  7 ++--
 net/ipv4/ip_options.c                         |  5 +--
 net/ipv4/netfilter.c                          |  5 ++-
 net/ipv6/netfilter.c                          |  5 ++-
 net/xfrm/xfrm_policy.c                        | 10 ++++-
 10 files changed, 71 insertions(+), 20 deletions(-)

-- 
2.50.1


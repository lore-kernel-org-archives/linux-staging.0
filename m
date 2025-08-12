Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684E32F745D
	for <linux-staging@lists.linux.dev>; Tue, 12 Aug 2025 15:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755013974; cv=none; b=l+xftJehuYOoWnuNQOs0liPNekDzALl58ziLWD9ZcmUX7EgPT7TB2U2bRfXLdrF0OF77YvBx+Xukk8Ar65xFNJR0PqGT9MEKQS1ibkVfECvdWTTRj9plAVwPwisaKiS9WjvTVuFgQvU7AUNHwfZXCczcQIpmAdnIgy/c0CGJ/2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755013974; c=relaxed/simple;
	bh=H8Qm7sDR6sFfmMhYO70q6TApPQXnFgsGJ5LF44w2Ni0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HJGOeoARqSiHP8CxK00DHo+3ZUxvSiXQSFXExjWGHfn2bc3MPS1CvWPXrVojU0Q1c990bJ8gyBGaTVp9t+RoK+m7ff7ij7qNxQSt8yIG8eTXSRDSRNs8GPObMRXttnndt6zBwe2Kr+7047eqZocGIAvvuQC+aQz4aJTMuMnZKRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-76b8d289f73so5335545b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 12 Aug 2025 08:52:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755013972; x=1755618772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hw6APkuisRn1IO+Yq90b/XIN4JEuOM+T0XNRQV/DOFA=;
        b=uwoR5NFRkmMGMkU8Wns5zmyjEe/qIvK51frOjcd6NE2WXJRQ3md4zapQZ/CpUbP9pL
         VyWJVsEp8YeIde2OMOvjEWnD2pKuaW/hyrHtnjUkmy2sBjwXrbrc3R7nBsrDFdbfR9+l
         Nhmvwq2It6Osf79p0EPEwKihskvcpgmZgC1rdQGbwEud9BwtzeNY6PoWK0eJXo7IR3QN
         HQuAA/PgJJpyDzfwy1Q8veKleUHVZU8R2STR/OSXBEddv8M1O9no9cKyfW/DG0x65r4D
         SSS/nJF0oXNhnDFBmPoXGspkKEmHiMXxBTDLNanRlOwN1An3VtMakryCavoxDLwr0y4J
         +D+A==
X-Forwarded-Encrypted: i=1; AJvYcCWS45mLvOmhardHyeb3M+vlp4RYyyo/jh96TfYuNFT7woWsyKUfUHA+uQOdd8TK7IsmNhktCZY8r8j4J4JL@lists.linux.dev
X-Gm-Message-State: AOJu0YxrKeJd8yWm0Xqjj1EXJ7NbX8+f2OULUNvOFW770iWiBWmFEe3I
	ch50Bsa+6nENjq4DBCjigsKkF0geZAEazVICtOQ6c1kVFFX+y7aX52Y=
X-Gm-Gg: ASbGncudB0cyG/gthk6CGAs2h1W5R9Jw2wH5IPGj5zCqiXtUNYkRQYrBMr+A2UIrlpd
	PgZ9VO3IzKRr5XG4hP23e62QtbYpmqJ37QV1NMblY4H0NQcAg6puwru6jUT1kj7cgkqcRc1XXom
	QjOKLUbrpXFXGGyQl/6QZjlcYa2wGJQDZf/IREPcXEfw8GroiNxCSE+hWaSaaTWpEKkZ8eX/krE
	15uDV7Xa77L2s/8ijpcB8+cX3YgIKooZp9UYcaWPOABdhD+W/gJUBwbv7yWLEfvRLm6rqJJ336C
	NTSCo5aAO1aLQl/ArEgbBABQT72HPNsIA+M5vK/GamYx0Zww2vv6ZljVrDfadcv7CRdA6erxBVn
	AIA1zEQL0rLuSDh02p3eKwjCm4ld8dU1wJTp29d72NXLtAMTrAXrUiNu94YU=
X-Google-Smtp-Source: AGHT+IE9mqitrJgp0ti2dNmcFeTLvil3ZhGhwEi8BPipsrW15PJbfSzyXxpXrXvlwLEBV343ULlwnA==
X-Received: by 2002:a05:6a20:72a6:b0:240:1f14:f6a0 with SMTP id adf61e73a8af0-2409a97167cmr6622771637.25.1755013971622;
        Tue, 12 Aug 2025 08:52:51 -0700 (PDT)
Received: from localhost (c-73-158-218-242.hsd1.ca.comcast.net. [73.158.218.242])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b428ca11a67sm12235295a12.53.2025.08.12.08.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 08:52:51 -0700 (PDT)
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
Subject: [PATCH net-next 5/7] staging: octeon: Convert to skb_dst_drop
Date: Tue, 12 Aug 2025 08:52:43 -0700
Message-ID: <20250812155245.507012-6-sdf@fomichev.me>
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

Instead of doing dst_release and skb_dst_set, do skb_dst_drop which
should do the right thing.

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


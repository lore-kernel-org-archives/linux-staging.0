Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DED2F8BD3
	for <linux-staging@lists.linux.dev>; Tue, 12 Aug 2025 15:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755013972; cv=none; b=KB1028usynUU7iWpeHpem/dMYk4fN9ya6Zi9/6Yv0/KKNoGt25iC6ts9mGEreQZ76CbCBQpirKDxP3+liwDVo28IEdsK/FP7SlLjn5RZFtQhxofhDA3EAEXiWjPUSSpPbkphqJiC9B56fgpxZ3lkv6EyvYJhyWkW7z6qNGyrol8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755013972; c=relaxed/simple;
	bh=Y6yt61AOmS8VLZtjJ1BuuUWNqePIcTOn+4ook9c6mRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cAyliNzNfyuYnnl3EcD4XBsrgRBUw8B1IEHcLdBxrPXcXoYCsn94zevvFgQHRYtnXMxzTU15eFAwjTLuSGsjhS8Cpo0bYq4nBvoegxRT2SNAW9ErpxLky+QdP86Gs1tdXWMckTNebJN2syrkQ7iw2R6jmwMa6DYCf2v1zCDlJ/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-76bed310fa1so4853848b3a.2
        for <linux-staging@lists.linux.dev>; Tue, 12 Aug 2025 08:52:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755013969; x=1755618769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qmQTgKFXI0yRI1h+Wuwej2H5g2T+K6OFKy/n9+ooPsI=;
        b=Jwk1tCDOjCj8Qm8EqDgzWCyE5p4GfFh/wViwevRVCJwCtfA8zejJeuQQkYhm3UE/lf
         n/CsS5XfdkrbFJbTuGhUo4QThVfJ3dlvsx1Z1N26PoApW05KnKHltA6OAU/AhCfCK8Jt
         MG7SLHZtMB9jEFt/E/f8hyaK7xg5zgZtVkuyy7S+ivABN628oitKmpPwGdDI2utXjg66
         nEsn+zmnOV7MD1WDMhB3qlqtm90/bld7oLL0b2PQ9BArnrtbje2M+2G9eRAm/GxD24KT
         fLqX9ZsapFtfkCkJ3DJGcANOFX14uuo7VdQGJWwq8JgIZ/lBlXDURITSEpH/8yHq6nRR
         6t5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4OXPHvsIC7tTqvBLe7/kB2sbzeXMTXLDmt1vOH77kY1Pkg4FBE5/WplW5kLgjmbEfnBu5cAbKcLYWMaB8@lists.linux.dev
X-Gm-Message-State: AOJu0Yyf7gsRUpB0ou4LbAAe+pyjz37ObahCYrCv/ehCfUnzmra8/RKI
	TEBJECAqgEhSc0wg60x3vEDkQxXMCtYhUru7rVQ26E+n45fIC3FFGUk=
X-Gm-Gg: ASbGncsvELhL/NyH/KSY3RQWhEYYG6U11vRe8AxOA0O03ON03clkPnLDy24C3SDR6FL
	MvVJyUCuD0bgWZGj7Qw2BKgPnbjBbCL90wlEQ6HPoTmOsKWmcd60Zhdrx0jsjgJBXU194k2UqcE
	NzF40R/xT8HzQeKlbIFrPLNH/Hgk7wcJkibOICSv9A4Fiw8o6dsGkydYGt3pKBMLbnmaz4lIUS+
	/2DhaAI4uv0reZIGa+1QgiSIonecStBy/fgkHMgQin6NaMcdAX6cT+mv5LDPPIkXpuT0r1a60n8
	LnIQf4/oQ3pEzss6hQJi8+wliwPgxAjItIyiP9nEq9nHcO12dtCqdmfOGC7o+Iq9ooSrIoULX9t
	ZCganhuFw8IhYpZ3GdvFjjvIKsIohhFAAqxcsWkmoK5V6RaPuWttndD8iwC0=
X-Google-Smtp-Source: AGHT+IGJSjbc3JsMK2uU2uNHTgltCW9hcJeoyzvVY/wYRm8KIQ5ucZ82mLJT2TdzcjIEdgViuEX/LA==
X-Received: by 2002:a17:902:c94f:b0:23f:f983:5ca1 with SMTP id d9443c01a7336-2430c01c8f1mr2953545ad.12.1755013968571;
        Tue, 12 Aug 2025 08:52:48 -0700 (PDT)
Received: from localhost (c-73-158-218-242.hsd1.ca.comcast.net. [73.158.218.242])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-241e899d347sm300038675ad.140.2025.08.12.08.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 08:52:48 -0700 (PDT)
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
Subject: [PATCH net-next 2/7] xfrm: Switch to skb_dst_reset to clear dst_entry
Date: Tue, 12 Aug 2025 08:52:40 -0700
Message-ID: <20250812155245.507012-3-sdf@fomichev.me>
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
in __xfrm_route_forward and add a comment on why it's safe
to skip skb_dst_restore.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 net/xfrm/xfrm_policy.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/net/xfrm/xfrm_policy.c b/net/xfrm/xfrm_policy.c
index c5035a9bc3bb..a5ffe26b64d5 100644
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
+	/* ignore return value from skb_dst_reset, xfrm_lookup takes
+	 * care of dropping the refcnt if needed.
+	 */
+	skb_dst_reset(skb);
+
+	dst = xfrm_lookup(net, dst, &fl, NULL, XFRM_LOOKUP_QUEUE);
 	if (IS_ERR(dst)) {
 		res = 0;
 		dst = NULL;
-- 
2.50.1


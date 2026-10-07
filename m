Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5574048FF89
	for <linux-staging@lists.linux.dev>; Wed,  7 Oct 2026 11:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374083; cv=none; b=ISEsKZehih83ZzVuVcFs3smLE2rFnNrEmrLKmMgdufSpuDhfvIJKn7cCYrDFR51YOZGUktexPgn5qkBnBSWFA+ZXyhE+oiMJXmpp9SqUWVc4ngQCDoOb3l00oZIqvvFwRzii8qGwvKGr19D3zkYFGA1DGDVGcECwYfIXepzPDhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374083; c=relaxed/simple;
	bh=kN3NHn/uG4U+TVnyRB+ACHbxKrEpe/8rNj8DDubwavc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R7qoenH1iEt6tE9jbl5ufHqlYTwZVgKu7SSC9JGJ9RSZURH4By/njhf4U1cz6jv/k9JT/h84SGk9kruvkZYzCvJWTdLq6Ch5K/8N7M5+4GbfW0ZDP9z5zhnHGtcyM6a+/rLd0GFyf4NH8fBb6rAni6XvCpIIIQnHw5jXlUvgj+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/FxTuA0; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/FxTuA0"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so1635022a91.0
        for <linux-staging@lists.linux.dev>; Wed, 07 Oct 2026 04:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791374071; x=1791978871; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8f1OKiZ2zWxDVgeWHYI0w+iMSXqsMffFWKgPnrBiqBY=;
        b=k/FxTuA0HbC7Cd8p232FAiBp0xm0YAU+kzq/s1KN4ZEgQdipMIMUHHgMbK87vt2Zq3
         1XapNSCyVMBaU5bSJOgNdnSi3NxZrHbxTsp7knRSi5eGHnh2O1iV5uCwq13pCUcUJKpC
         hG/ErrCBfhLROu46CMFnxm0O2J8NoM2Y86hVmtQWklotD4VFumG7u3v6wZEIhmas5lQK
         vo/ruS/FcBO2KxxFEzOfuf357TVSgY2BFB2OxQVIj6KtoG/yb1icX047meoUNk9rCsh8
         13G2ib9ziCgDxd1TbjgvCgXbbgkNMB+TcImKCJzcavbHwyPVfiqNGAbnYMuZDJ2JdOq/
         5hZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791374071; x=1791978871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8f1OKiZ2zWxDVgeWHYI0w+iMSXqsMffFWKgPnrBiqBY=;
        b=QuZr5jn9j2W8yC3Kuvw6XwRxRR4DOLzfqabWm0BGKLFy1Afb4t74TAWRPMcPTKv7L7
         QvlbYWOw9Z8uI1tRunzSDhYkEXJX00FAI27Eyuz8vsTsnKz0/JB8pGFvi85IcZ0mFjbp
         0QqNd6u5DWPefW8sn0gAG9ykm8OMiY0SbAKIij6D7hKJh1MRtsmkU5lBawuc2L+y16c9
         CON+mgOYsn1G20yDGwXGUiuc4CZjokzgiKw7bhecENz0K73BwxUFKOjOMtw7LcQVbeWR
         zEo0zkhXxvGu4aUDHeG1HAu9bAkKXfwv44KlL8i02ORs9+ubfi/h2qAxsIWFF1aUxP9Y
         mJsA==
X-Gm-Message-State: AFq9FYJ8LytqGCGamlvCGStytKrVhQBmNUGgZzOfPakFLI92ksPSbAoD
	xcZ/hwcBHyqQkyPv7jQ+YnxFLXihJqjZF3vSEkpMbLAh5pbQ+a4yTP48LB4cRw==
X-Gm-Gg: AYBFou3mgRyAX5ikBrwmfHNmy/yIRE+J4TK/iLhraDCfAJVuWL9gIZen+3EcnOWjq6N
	3lpjVlAZzL1ajeTocc4+imNKpC8PN+dUHNqOJ1Mj4qxrqTtnzxvgvhEkn54OLx0crX/lOMpTpZO
	5rQOzOA5+hsZv/gCXyxKwFzb2lpTnggsz4M561i24vKFMR0M5U1EHv4NvLK8MHkws5LYdpefln/
	4FJQO/or2BYtierEHp/HMePZ284+yTHZUDaYaiahNAtPGgKV3Q0oCKHlyW+FcIUP8MIWWzlkdkB
	0OINc3ojUVMGW3KriiPmjru7JyRCAit4oGnvaxg0RZ/Tgv63Tf6aHInVQUR7jgE/yJdNfho5nW7
	2w0btWS2fxMouu2EC835OfBOGjCHvbqIN/6mk480L2gJTglBx7xZn5NjuxRIu0bc8BSlj1jAipW
	SUxabswhVRIMaurXj2o1hWMlC6ZZDURzmxetJRaZdsjK4LLOBHsr0DUp8dsmcyIOIDKUe4YGuKp
	g==
X-Received: by 2002:a17:90b:2245:b0:3a8:21eb:2e1a with SMTP id 98e67ed59e1d1-3a8a12be15dmr1284625a91.30.1791374071555;
        Wed, 07 Oct 2026 04:54:31 -0700 (PDT)
Received: from host ([103.103.208.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89b625d01sm4160128a91.14.2026.10.07.04.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:54:31 -0700 (PDT)
From: Pranav Desai <contact.pranavdesai@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pranav Desai <contact.pranavdesai@gmail.com>
Subject: [PATCH v3 6/6] staging: rtl8723bs: use u32 for length variables in rtw_BIP_verify()
Date: Wed,  7 Oct 2026 17:23:42 +0530
Message-ID: <20261007115342.1121742-7-contact.pranavdesai@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007115342.1121742-1-contact.pranavdesai@gmail.com>
References: <20261007115342.1121742-1-contact.pranavdesai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace 'uint' with 'u32' for the 'len' and 'ori_len' variables in
the rtw_BIP_verify() function.

These variables are calculated directly from 'pattrib->pkt_len',
which is defined as a u32 in struct pkt_attrib. Explicitly typing
them as u32 prevents potential bounds or overflow issues during
subsequent length calculations.

Signed-off-by: Pranav Desai <contact.pranavdesai@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 8b67985f6e06..679c957c9c63 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1272,7 +1272,7 @@ u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
 	u8 *pframe;
 	u8 *BIP_AAD, *p;
 	u32 res = _FAIL;
-	uint len, ori_len;
+	u32 len, ori_len;
 	struct ieee80211_hdr *pwlanhdr;
 	u8 mic[16];
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-- 
2.55.0


Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8263EF0D4
	for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 12:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774354733; cv=none; b=lsDUU3V2V57iamxR3X0r+JMgewtqXfETdXGMDFsH3rEqqrHYfIFhSN4F/W0iAE2MKjL1OQxfTAxbM4mQn9iLlgUDskh8b8kQ84qbx0DAkOQFbXsTP/hZZ2UM6MxLKLzy94Sfk7IkCYCIcNWLSoRg0neo+J0wXW8xpDegJem6+1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774354733; c=relaxed/simple;
	bh=fN08PYV9p+8K6beZYGN78fUNGE7ccNf08IzjNeTz9Zw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kl0N1+R8eIZAxVn94Wvs+Dl4Mw24UE95igtAenNNCTG2MDaHDu0rUMVNmnJbTu54gw/DEA31w9rAqe9mQzIo1+I6tct10u1gUZnwL9NSQiRrSpqlUrfcdHapiDAGip+fDs17yDgZ/aoZ17itWKGqjWudex5/ARCCK517yESJHpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s09TeezA; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s09TeezA"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b0586d5bb8so38056585ad.3
        for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 05:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774354732; x=1774959532; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M2AJi2+s8XLmMMdhzVHEpZ+yXvhnr+bzOUs74jM3/OM=;
        b=s09TeezA5Q5Jbnm2WwHuWQmdNTpTfj5kbM95sCRTv9lQujRF8CycJmSF4UHluogEBO
         /Cipm22hopxtczdqFsgpjPnVKZchLV+LdU4yYquyZW/KzbWlr92XBKkQ1qKCJkE29p6Z
         0A+s78bJmDD8JVP1QaSqEsyZGaA3HA6C/XzZB7qpw5We8IoH0YJvYbnp0IzoZG3ToQUR
         F6St102rsd0kwI+CTIwulqAJmUTJtJGkl66NaudrPywncv3QL+cGGJpTa+MlG1Guj8QI
         TsihPgDLzBGpYXOgCumCbtnQLIHsi1WQwc3Lv8bTbiqv05HCY8MVKD6j5+r66/MWqcGF
         HfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774354732; x=1774959532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2AJi2+s8XLmMMdhzVHEpZ+yXvhnr+bzOUs74jM3/OM=;
        b=VbNTRdM0DRh+1Fysdq/49dnvV6y9a5FNvyP3diCZdiADwqTTTlO8ltRpKL3WSLSCcH
         6aaXdm8gmp6aMqtDbJF5S8HJvZcvQ4L04q15cvvTnxM4OCWYlJxb/Jnp5q4XIM4OL4wO
         WnoCHwiSF5ZaH9LA3eGu5BNpAcUViHvoY8uDDjrfnA0rHgDoDXBaJQNJCaz4jv27x/jx
         cdtQ/uyqPWjcO1iH+Zhk2bzsME8CPxrlDST7Pjlxh/EoT2I1EMM1xXy5/Fq/Nfy0co86
         pMEgOqJ1CVFJ6DgeKBVV6Fa2tjTvQ3sVGIO4JBwK3SETHlLIz60hDGVAp9Cfl6mmYKSx
         hzFA==
X-Forwarded-Encrypted: i=1; AJvYcCUk1U1ubrunTE73fZXH+kRog+j6JK0vUSRr31x20mgF8Q6PFS5hODPHSADXkS8VybCG9gca0joZdhuz8UF0@lists.linux.dev
X-Gm-Message-State: AOJu0YwxMa2ZhbzuO0KSuyXXpc/blomOhfWhBfeVrlT2W6/Qx0Y3IB+e
	MEulLVkeYRQmuXINw7GF96QoNr4zdY/L2R9RyXE8G5C1r0YC58L/HvoD
X-Gm-Gg: ATEYQzwqNaYBYnrfHVVc+ECK0hCaMqT3xCu4DyXheTo2lGXnwEVHTMUFKs3hDdXdQn+
	PEv/CkM1EI0qPyI1qIgfVn2ESesKyVpojSJ7obnw0tENM71pRUqXMrrqBmjLLlEkVGHumDDn3ZR
	g7f5TreWpN8qhym9J36/yKRXnp3vRrUpcNHqH3XGjuK/6aOxH2KzPYrSF7A9cOs/F0NnJGsWy8v
	DpQlFAhM0MuorOeWCzV0aPJ5ap37w9WfVyuyo49rXurBBPpChATj3jHX1+OZ5nM8ppf4gZgOPYh
	+dZmT3JPXliPGIklwJ5R0uHSbv49u+gJNUmtSQlfqAqZW5Wo9gRs1pC6OgEjvZj+xkGqBGtWz/o
	WgYsSTcby7WS5gYHnB3uzrO1UNbhIBaQPDsqIW1VzOSP/wjcNB6WS1rPROvstgA7/aJjRJEzykO
	yxLNOItmaxkwwXMQy114HIVS8=
X-Received: by 2002:a17:902:d548:b0:2ae:3b9b:db34 with SMTP id d9443c01a7336-2b0827a4cfamr134359325ad.42.1774354731859;
        Tue, 24 Mar 2026 05:18:51 -0700 (PDT)
Received: from arch-btw ([106.0.57.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836556desm193138665ad.47.2026.03.24.05.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 05:18:51 -0700 (PDT)
From: Sajal Gupta <sajal2005gupta@gmail.com>
To: gregkh@linuxfoundation.org,
	s9430939@naver.com
Cc: andriy.shevchenko@intel.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sajal2005gupta@gmail.com
Subject: [PATCH v2] staging: rtl8723bs: fix logical continuations in xmit_linux.c
Date: Tue, 24 Mar 2026 17:47:47 +0530
Message-ID: <20260324121828.14675-1-sajal2005gupta@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify the conditional by removing redundant boolean
comparisons and fixing the continuation line indentation.

Signed-off-by: Sajal Gupta <sajal2005gupta@gmail.com>
---
Changes in v2:
- compact the condition
- drop == true and == 0 checks
- fix tab alignment

 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 0be3143fffe5..dc0b77f38b1a 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -193,12 +193,9 @@ void _rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)

 	rtw_check_xmit_resource(padapter, pkt);

-	if (!rtw_mc2u_disable
-		&& check_fwstate(pmlmepriv, WIFI_AP_STATE) == true
-		&& (IP_MCAST_MAC(pkt->data)
-			|| ICMPV6_MCAST_MAC(pkt->data)
-			)
-		&& padapter->registrypriv.wifi_spec == 0) {
+	if (!rtw_mc2u_disable && check_fwstate(pmlmepriv, WIFI_AP_STATE) &&
+	    (IP_MCAST_MAC(pkt->data) || ICMPV6_MCAST_MAC(pkt->data)) &&
+	    !padapter->registrypriv.wifi_spec) {
 		if (pxmitpriv->free_xmitframe_cnt > (NR_XMITFRAME / 4)) {
 			res = rtw_mlcst2unicst(padapter, pkt);
 			if (res)
--
2.53.0


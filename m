Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102642;
	b=PwpszZyK0r+o8IRaW7mrGCCa+AqoVaJtMtT1QHNYQWmEzr2bJ88150PRnz1lyCkK6glQ
	 3lmgPIjZ8/xEGKYD5q2NLRj0rrf+e+0T1PcnY2EN392mH5wFuKwFyWGMsbXxzPOriFh6g
	 igVdLOsGvaMy4cmkNnE6jXnRnq/nC/WnpAH/gDkH/bauSOK4Z7p45Fnphbk8EQc/G2M1H
	 KgSCLLCkIlD70/s8UnAZEF9nBKJQVx/MQ4r1lghNsgwctrA4XoFNv82gLezLDX58kfcAV
	 0JxkZgqQJGBV4oswcVobhvjEBzOyDgGU1ReWRq0/5CPQLfRxaUeRQ6pf47SFj18g+gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=KDHtD5ywbRxioPIq0YKT2Vds05KTerYZgbBjOpP/OdQ=;
	b=G+5DeYN5RES63bDM5lQvjq3KcYI9Azt1/WX1qtdnZ3JCt+VqYf5/aExsZA35gfZPd8sz
	 1auhe/07JdEtj2tCWcCZawuwMtE9EvcLdUNvYoPPQhu8WZECvGtcWcKEb8Tr2pkwiRFn0
	 LdLD1mPfm41zFhVLa3y8U3nYTTF+R7QsaNQMRMq/+X5eUHdV4ZXaR57A988S5BUzYQRQ+
	 Lh57ceSV66SjtVhpKhYiAurlVkWl2/mmLkTjipHdH3E4mTiqaBY53bEbajygLMfQu2ocR
	 1W4oT4E/xEPfZLd61p3Uw3AbwvHMn8xf+ujuN8DQlUDbRTKeZLDOBn7dIpVWMBwwGBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oamjXdKw;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD69606A324
	for <linux-staging@lists.linux.dev>; Tue, 27 Oct 2026 12:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBD69606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oamjXdKw
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e0d1da913so853758f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 27 Oct 2026 05:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102640; x=1793707440; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KDHtD5ywbRxioPIq0YKT2Vds05KTerYZgbBjOpP/OdQ=;
        b=oamjXdKw2DJ6w+VtzAKxa5MENhGC8O39My+fOpVCD8GDYPPMFcaMfqZpXW+f/67ORp
         HVmrNCgp6y5CEgbPw98BTfjwznu20Fb0pCuf3md5XbAxrp+FN8gjT8wRb2H9NlxOyhL+
         wSPvi2+yGpVF2rblpkcRtOeV50wJmPmPAyVQO8FR8wgdxkdCQqCf5IOy+Kn8Qw/LtwAH
         K6QkAgKkzwwFQ5mBjHSM+hd1A/Y5TGWp/sV7G1Aqsw5rHdYsXjLfIQjJqcXd/fiHkDTt
         1slvx52K2Aal8A2oiM7qbqqenbDzwjmKL9Y6qLB3d/5e0ATeFjmUQJ2A+p5G16FvBO+A
         QKdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102640; x=1793707440;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KDHtD5ywbRxioPIq0YKT2Vds05KTerYZgbBjOpP/OdQ=;
        b=ZzX4zwi3uwY1yCLF6XBbyDRP9+X/DG7MAF6HzJZkqFc3P3mVR8wp9DqlkQfBuCxcCq
         +WTTvLwURQjQjE1TibBLpVDWW5vOtJzrd7R/UCqNkFxdY3kFXg0+ZFzW8Wap4gOFKWte
         iwUeJwHiQeMhsApHacnVfB6efAj4XiHWK61Yh32qz6pXwdl1Qc+/5ukM2AxjepdFcHij
         fSFYnQFF7re5B1vAjk5uVWHWA3by3l2Dw84eNgWQUS4UXY7/IWpwIRMagR2BlGHjkWZx
         ghJ2mNq6jhBOEqEk0t1bmUMYFC3WP+QkpNbT9YVuhZVpo0q8gyyteVQV7lOqm8WqUP2D
         /POg==
X-Forwarded-Encrypted: i=1; AKwUvByv8hk1Mn6bksQN/7uy35KmBscYyZDO1kuCmKEaYIKpPOFZwbN/afgkADjb0xs0c4yFdGldHBbtstWkz/n2@lists.linux.dev
X-Gm-Message-State: AFq9FYIKQehO2+6AC3rfA0L+OVs66YNgs9x/Q1QD9Ni++pkiGTRSsgSL
	zGsIItHQObTu+wiT0wwGRcL+4f/r/EWXazAZtn3MvfmQ/UaCmhLcrPIA
X-Gm-Gg: AYBFou0XB1BaQihjkuOhvgxPjBRCCeBIyrYt3ea4evF376Oy/zTZ/MID0Q2AogFus0a
	Rv1u6bz4bl5LwZhqS/H/XLknuLDnh53GW0hOJPKHP29URyinCL2hbTJCt+GbDlCASK9vhWT280T
	nJTQyFdtfN8BARZHKorup00bTHXCXgsITtRU4IZHfJm94nE68l6AQYpoz5uENLam9x9gisuhRi3
	4vB+x7w7YGcCevYZvzru4vgU6qV8+zanho8yI4KAguRpcvscenjHQTdE5lQ1UkQ7B2ctvHswuFz
	CQoCZnYO8EdTc8lPpsyqAOulxMlF0iGkegzTuLVZmjs7yRkAgnHpeqDFvD3bA7lAQRgJje5u9sR
	qvE9AlwC8pxfcoZwn7G2TZzwVUNzupGon+FxdO6v/3Mv23dc7//cboCgBxA0lThcFUccbpfRzWv
	KwEnzQ6nb+3X2nSWB9hAP85rbvbL8j3arJohjxv8rHwTzlFr767Y23zzvyoleVSVhGYhmESwc0q
	HQ7xG2rMlqjXXyyezyJK2s2bu2Zrlhnlmab/I9efecdBasi5mBLTLvEpgvgR2PRoe8100OiGhCW
	jmlG
X-Received: by 2002:a5d:6d05:0:b0:48b:226:839 with SMTP id ffacd0b85a97d-48e55a150f9mr4623479f8f.14.1793102639863;
        Tue, 27 Oct 2026 05:03:59 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd39a9sm22977554f8f.46.2026.10.27.05.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:03:59 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v3 1/5] media: atomisp: sh_css_mipi: include assert_support.h directly
Date: Tue, 27 Oct 2026 12:03:36 +0000
Message-ID: <20261027120341.2305533-2-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027120341.2305533-1-vladurares@gmail.com>
References: <20261027120341.2305533-1-vladurares@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

sh_css_mipi.c uses assert() but only gets its definition indirectly
through the circbuf headers. Include assert_support.h directly so the
file does not depend on that include chain.

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/staging/media/atomisp/pci/sh_css_mipi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 971b685cdb58b..83424b6ce1713 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2015, Intel Corporation.
  */
 
+#include "assert_support.h"
 #include "ia_css_mipi.h"
 #include "sh_css_mipi.h"
 #include <type_support.h>
-- 
2.43.0


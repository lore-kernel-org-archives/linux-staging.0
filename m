Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4524A41B36A
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 15:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971197; cv=none; b=Gw1/n6/9yudyCzvut/MxlqfQezLVnNGoxRYx7ASmXjKrxhgCBnL6324UKuigIyakc57wZrqz3ivh5rDR68etPbRtBhtwf2LT6EKvlMaUm3vd6+Hw9Z66iFXGoOcpZ0N+GG7mpRBq9Mwc/USM4Z5BGSfUHTUtpX/khiAVe0dsrkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971197; c=relaxed/simple;
	bh=TaY4KsqEKN+6qCg8Q3Geai/1WvF/Kq27BGOuddmYgZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TP/dCSIAwEApvFAkJlNfQlnixMxrl6j0fiY5nDyLHjpEKJAgS0BDxenv0XriAUgxgMRjpv0NRGL5Ai6bK3duwzj5xFpDff5Z/c2jrpkuEbxyCBv11E5dVUbwJjNCqkRs9QjJ7B6X7K/uj3WMBt2EeKydDK2bUM4ioXDfCfVuyo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCNub5FZ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCNub5FZ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so45095065e9.0
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 08:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774971182; x=1775575982; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AP06W5/ElsEyUjx83M3Qd5ym+ElAkxCCMjWNN8O2Vvc=;
        b=fCNub5FZDjW8rR7itifMK+qaHlpoWuk8RkQYWwxTKRnSfVttATa477g/DectQqxYvH
         n1tMsdkKv0/tI6oR9ko2+40ZLFLXxlZYEsl8mKXGBoF2/vpH+OImSKSS2TzXzhUPABaA
         W3M4KjXuGMwSoeVrBNd5d9sV9v+vq3stZAJ0wJUWfAkaBf/1P88vwaaiKxQju+JXwEiA
         iX0M9yXgPaO076lhFwKvwoLMYs2ZesR+G2HgnmM4dp3Bop89jVa5sGoobGlUWG+WrHsb
         aEC1i5BBsVKfXaC75JUIenWceeA9oDR2hoDRQBY4+jEfIxtIzla46h5DP/aJ/49N+wHe
         v3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774971182; x=1775575982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AP06W5/ElsEyUjx83M3Qd5ym+ElAkxCCMjWNN8O2Vvc=;
        b=Y+K57zpAATvV9RtuAhP//x7xy/clfxE2kF75SmeisVZVV3B8kGdGYcpOXy4Xk+c6EC
         8Hg6OeIMZsBeap/wiZwvQhJ4/ETEQ6W9skM8ywsOJ/2wcGysJ1BQLyJXqko3w+u59HRy
         eUDor8NvnykjTFUUjyLEofZ2gn/eWwzYzzedZ7pIU4ZvtK+dmpxvR7rvQi4K8JYAmYUH
         YmV4yNEbVsrKFjqgvotKWAff0H1gtoJCtIQ41ZF9falEX0ok85cGFy+4IxO/dLM4V39v
         4I/3uO2F+AHlNe77xkoPWExQp5h9Y60eKkHx+YlIAldEV/PSe9705lrbkDqrcCL6r+GH
         LCeA==
X-Gm-Message-State: AOJu0YwLcM2zBvY0JcfcnCeI58+qeobrREuR2k+ef5NBI79hkeLlmIfh
	2ymiEHYaAdLYq3ttTYCeB2wBUMJdwuMdtXJIdcLYjvhMw/bcOC+E59B0
X-Gm-Gg: ATEYQzxfRbZDxfUDpc0IcW7OWgfTTJQC02+njTWHXuciSEKT91A5WpJNwQbu3qRdfzU
	b78WpRysuJquWcwoDx0ZflTMNS0bpAmbCSs/ZeKnYnEvbExnSEcyZGTT1LxuoQ6rN//tPtkvBkQ
	7b5H/KImEdnt/fH3WjOj7qZs1mFuNKxxW6El+ljH243sUiX6ptjLIS1tipvRQ3XhyG2anL3Ujb6
	rUcwADkZkNhfb8BvkYMcXP2oN/fFgCcW6cUBIYnFHpZFRJZQpc/7cWRWte9uVpiJcn/wvo+Di8r
	fzknWbsYp47VXi38IMwuTsg4gaUX5fDNVDgl8JPLmShDG8RveykQQT+WULcvR+4wtUyhWCRnOzy
	JGLoOKOAfL2rcXhcbLxmpUEm7dM5KeuEuQPwc8qpmfi82Xn7m/6SxPx1vxugzTXhhjFaXedT3Xo
	cHBx8YuG/M+0Fvl2pqwvq6XQ==
X-Received: by 2002:a05:600c:4994:b0:485:9a50:3369 with SMTP id 5b1f17b1804b1-4872cb2825amr155835535e9.29.1774971182214;
        Tue, 31 Mar 2026 08:33:02 -0700 (PDT)
Received: from potato ([31.176.162.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887aceb230sm21653485e9.4.2026.03.31.08.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:33:01 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH 0/5] rtw_sdio_if1_init cleanup and small logic tweak
Date: Tue, 31 Mar 2026 17:32:49 +0200
Message-ID: <20260331153255.22764-1-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series does some general cleanup for rtw_sdio_if1_init. Among
the changes are: using direct returns, removing the use of
vendor-defined macros, adding a separate label for freeing and
unregistering padapter->rtw_wdev.

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>

Omer El Idrissi (5):
  staging: rtl8723bs: use direct returns in rtw_sdio_if1_init
  staging: rtl8723bs: remove useless line in rtw_sdio_if1_init
  staging: rtl8723bs: remove use of vendor-defined status macros
  staging: rtl8723bs: replace function with error handling alternative
  staging: rtl8723bs: add separate label for freeing rtw_wdev

 drivers/staging/rtl8723bs/include/sdio_hal.h |  1 -
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 56 ++++++++------------
 2 files changed, 22 insertions(+), 35 deletions(-)

-- 
2.51.0


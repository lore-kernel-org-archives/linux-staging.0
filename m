Received: from mout-y-111.mailbox.org (mout-y-111.mailbox.org [91.198.250.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877A232ED54
	for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 14:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774708064; cv=none; b=rNSpV168+ZYj/dsIolE/BE2MckDEBI0AgWbxZKuO6d2kMQwQD7wH4v6gT7obUgc3zCHJhQBeBnin0B51xjb0XEEtMR69hd02LWWfi009WkaEggY62E35fvasI5rfUACCjhcp1K8C04kuD33LLWpAAf0+PLUfVf6ImtTfablGvMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774708064; c=relaxed/simple;
	bh=lo8+HUZWNLS56i/hXHb0ERb2zzhZQkByRJxW9GwKQYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UZpCvfcLvd6lD6c9KWQ6FeB5kLTyKpq9bo/04gPJqhb+mIglo3TF1rlDQzFDBGvjxGqdfAyIvnHiVjrrr3Z+A1zaKGWaAvuYYRrQvgbGm0t4fGS9TtHFRvK/Ka7Nvmu+as45Y2qhsZVvziR5WRXaAqMmykC6ZN5sk5hPgCiwNzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=bapVzY2y; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Gy8SOHS5; arc=none smtp.client-ip=91.198.250.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="bapVzY2y";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Gy8SOHS5"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-111.mailbox.org (Postfix) with ESMTPS id 4fjfx90VPbz9ygQ;
	Sat, 28 Mar 2026 15:27:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774708061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=755fBpc/jL0OUJbEjZo4XGEsiKzx/j/rY7YWih++N8o=;
	b=bapVzY2yBW9jLSrw45/tLdHL/Vni4Pul2XMLd2qPL6UWmKjvZcNwgpnYO3XgVVlG5Xknt6
	SSTXa2653VDKjfcWuvAlZL0GDamAoZEAI34WcDIF8bjFL33IvMhYIzZ/sYrWjrGOVmNZxa
	G14H8Rr4g+1jhTcZBwZHqMiqyhuwISQAEiaCToDlZz539xoCBefi9qK/qzadgvZwykRkCo
	XPt7KJQKwFKU59Ond/Y6xtx5lLJozDk/h+hn5jdNlGMwd3TJbTnuuYyFaHyslk4T2Jq4sJ
	MyHgAkPBIMqg2A66MTij8s7+soNNfZfsJOjAk5oDBXf9s/AWievbBZC0i3XWQA==
From: Mashiro Chen <mashiro.chen@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774708059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=755fBpc/jL0OUJbEjZo4XGEsiKzx/j/rY7YWih++N8o=;
	b=Gy8SOHS5zUC3BufhZIrO8O9YIkL+vM55jHkbMhg6igv7ZKvULypStako4KG2K1AHzAiZsg
	wVY3qL1tFji4a+qesdbJJlYvSaYl3knBWT1uGxn7a7HJc84HfCMuCj8fJYBco6jrfwtOHG
	KhyPu7l52ddrl7UhnBJP982VwEEgvc8ScWY9RhfSeK+rLequQefml5KjGfCmHnt9CTBHc1
	g1LENhoJ8oeoX1tk2LgsO210Bp4+BiEExkd+6CJNJSrSqffwSsj5tnNHPUOKuuB4J5t30N
	G1CQUMVccmUsqf+MEWhjje+OchmK4ncXeoedbZCq8udfdq01l9CMJE4lbw7H2A==
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mashiro Chen <mashiro.chen@mailbox.org>
Subject: [PATCH 3/4] staging: rtl8723bs: remove unnecessary do-while for macros
Date: Sat, 28 Mar 2026 22:27:08 +0800
Message-ID: <20260328142709.330401-4-mashiro.chen@mailbox.org>
In-Reply-To: <20260328142709.330401-1-mashiro.chen@mailbox.org>
References: <20260328142709.330401-1-mashiro.chen@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 956e1e266895a9d4bc4
X-MBO-RS-META: 4ze5t19m9smsyxeydetd57obnwru49zf

Remove unnecessary do-while loops and trailing semicolons
for single statement macros to comply with Linux kernel
coding style.

Signed-off-by: Mashiro Chen <mashiro.chen@mailbox.org>
---
 drivers/staging/rtl8723bs/include/basic_types.h | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/basic_types.h b/drivers/staging/rtl8723bs/include/basic_types.h
index edd64bcf2..02965403e 100644
--- a/drivers/staging/rtl8723bs/include/basic_types.h
+++ b/drivers/staging/rtl8723bs/include/basic_types.h
@@ -53,19 +53,14 @@
 
 /* Write data to memory */
 #define WRITEEF1BYTE(_ptr, _val)			\
-	do {						\
-		(*((u8 *)(_ptr))) = EF1BYTE(_val);	\
-	} while (0)
+	((*((u8 *)(_ptr))) = EF1BYTE(_val))
+
 /* Write le data to memory in host ordering */
 #define WRITEEF2BYTE(_ptr, _val)			\
-	do {						\
-		(*((u16 *)(_ptr))) = EF2BYTE(_val);	\
-	} while (0)
+	((*((u16 *)(_ptr))) = EF2BYTE(_val))
 
 #define WRITEEF4BYTE(_ptr, _val)			\
-	do {						\
-		(*((u32 *)(_ptr))) = EF4BYTE(_val);	\
-	} while (0)
+	((*((u32 *)(_ptr))) = EF4BYTE(_val))
 
 /*
  * Create a bit mask
-- 
2.53.0


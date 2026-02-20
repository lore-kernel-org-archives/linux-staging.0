Received: from mail.plaes.org (mail.plaes.org [188.166.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8CD34E769
	for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 16:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.166.43.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771604232; cv=none; b=APlJBGXRe/1FHjS0B0oNQDhZpjvXiJ9uoHy9ScZCPR5vWVEnqIGCmgJEsKr5uAOw7m0PUyfqSLYkgkMau0R2almVRWWt2RYZgKdlt5+q5KaUQ+YaFpWU9aN/yti+OblTqXH1gf7xnkDFGJfYcHNWsAgOsOMY1Q/qHObcS6xhJuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771604232; c=relaxed/simple;
	bh=Xp/QZRUy7tMXb9+OVi5plAsdhheuFJvOYfXzE8X3GM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jyvgqySVS2DY/zHt7Y86S1ES88GN9zf5IYgIgisQC4hpeGaz2hfgr4axOF8be1YETz31tRxhG1YaSVsIVRSemAcKFaCtHX8a4zbPS6tFpjs/xFpQxbJ8v9WoX3Usws9fo0wWTq8etSFkzE0BTjiSeu2/x71s0hismgK1OnzVDUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org; spf=pass smtp.mailfrom=plaes.org; dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b=T9mxsRhP; arc=none smtp.client-ip=188.166.43.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plaes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b="T9mxsRhP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=plaes.org; s=mail;
	t=1771604230; bh=Xp/QZRUy7tMXb9+OVi5plAsdhheuFJvOYfXzE8X3GM0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T9mxsRhPu04r/54jl45WJiDN8jDGJSJidx44E+bHhGKPmKiwGZjFw+wAippIh8vWb
	 20ZF+QLwU9LYirVnTeTBSJFx5MXGYjk++AghuhTu5V7SJzOkBFDTkKuysRlHmc006q
	 NERefNYzobnzaW8ImUsGm/0aZN0pM/0m0rJ3Zkb2RSW8Bp+9Or5FQ/dtfroVWdPrGr
	 FLxQK2kGoDcCt+ORQ95906Q2vhO6ZsRxKpUc44VPBqe9IToS6a4MusdzGykyugfXOS
	 /eC5h+u4SkHgIPQ7yNO6SU1JOvVMXsHEwX9nPOCr8su6P8/JAaP3KeFw2HaOrOB4U5
	 pCt3wOXasIsgw==
Received: from localhost (0b7f-0000-0000-0000-6400-8cb1-07d0-2001.dyn.estpak.ee [IPv6:2001:7d0:8cb1:6400::b7f])
	by mail.plaes.org (Postfix) with ESMTPSA id C93864068D;
	Fri, 20 Feb 2026 16:17:09 +0000 (UTC)
From: Priit Laes <plaes@plaes.org>
To: 
Cc: Priit Laes <plaes@plaes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/11] staging: rtl8723bs: Drop unused NDEV-related formatting macros
Date: Fri, 20 Feb 2026 18:15:18 +0200
Message-ID: <20260220161611.2398915-8-plaes@plaes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220161611.2398915-1-plaes@plaes.org>
References: <20260220161611.2398915-1-plaes@plaes.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Priit Laes <plaes@plaes.org>
---
 drivers/staging/rtl8723bs/include/osdep_service_linux.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service_linux.h b/drivers/staging/rtl8723bs/include/osdep_service_linux.h
index 2ec54f9e180c..c8274da940ff 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service_linux.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service_linux.h
@@ -98,10 +98,7 @@ static inline void rtw_netif_stop_queue(struct net_device *pnetdev)
 
 #define rtw_signal_process(pid, sig) kill_pid(find_vpid((pid)), (sig), 1)
 
-#define NDEV_ARG(ndev) ndev->name
 #define ADPT_ARG(adapter) adapter->pnetdev->name
-#define FUNC_NDEV_FMT "%s(%s)"
-#define FUNC_NDEV_ARG(ndev) __func__, ndev->name
 #define FUNC_ADPT_FMT "%s(%s)"
 #define FUNC_ADPT_ARG(adapter) __func__, adapter->pnetdev->name
 
-- 
2.53.0


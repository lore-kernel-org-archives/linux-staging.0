Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9464057880
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 04:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709008946; cv=none; b=DnZ8rmnEBVDf8Wc/FoxPHNmanBQF8Tc/w+mNCqlAU8is1jYc/hNsHC5vVLAgoceLI3uwZ4EbhsCyq8UoE5+NRVNDjIEhbPPEl2Egk2oWR6yohJ9Q1WSIicaFnYBE3IuqBRlsvHKb/yE5ZF6z9YoW+w0RjTC71HIBzVvm6dIgL/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709008946; c=relaxed/simple;
	bh=2x3h9Zz+k71/dtUWPgZcEE0hufSyTRHoquJITrslrK8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hnAFfuIzmPUiqGPllfnd9rAlVlDoNGbx43JYkhkQKY0YjDggrzpTxPAGRQ4neFsmphFqM3nNFiJnjheUNdDCl/0pJdidJuJiW1SHXZwpcW8vzjGpl6QPXzvDzWOLvn3vYdK63l6aiZbODqXXaNDa9Fzpyd5j7TiQuv+Qv+AgPFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=IOf9hjym; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="IOf9hjym"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6e445b4f80bso2173421a34.0
        for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 20:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1709008943; x=1709613743; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUsBKbDxqX+aAoY4bQ5ZPw9Nd6OhOWFvUHLj7z72e6s=;
        b=IOf9hjymi1JCwUe8m2f0TrymW9z5Sm4yug5plRIswEunL5qlBnskbw89pJVA1v8wJ3
         Bz2iMD2ZbqjOulQXCb0Z23b0519gtl5HN6aaVUkwn1kgMNppMaG9Kl60iemFth7Cs0CR
         ytIzSqD6NGRHYfjSKgZViRzJamy4IdQRwFh1s2YuLJgqnsC0fChaLAx6hKyDL8M7TaJH
         fHgzms7oom0++n8pzWIG/jnoDSpdYVX7Awh0vv0sws2k/lzycfllBuA9I7mYiNqmcAAQ
         tu7S9Ws6gb3y6bjuKJes9LexxZKLp0h/QUcdN/SaJc9QIlBMqWRQKR86YMLXMKQ4my9G
         X2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709008943; x=1709613743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUsBKbDxqX+aAoY4bQ5ZPw9Nd6OhOWFvUHLj7z72e6s=;
        b=wttDxauZzbEFS8AqVTBx4LwLI//Fh/jlyCv4QZY+U5+R0YTJhIAlYl3IKHp7nMH/XJ
         E/M9EelRyuCcAy075ig7G+dEA4zIFQOi8K3+dKLAxQo4Cgnll7nf2JcbvcTQ1l8E1L7w
         odTNk4Kpe3ES/GluuvFp8pO63m8thROyxSe7DRlVspv4u8H3z8kfm7L1yJDzvULaKz34
         UXMLzLeR9IA6qB8s4RuJ0nTgMnBo9HFiX9YXjF1smQxiiQ+hcnF93DJM43XgFqnOUduK
         mbvIAZY7cUxJ796KDafk/Pd1eweHHZlmcrXW8LkOWs70hxVxsi6NF+VVDViLn7xWaZAJ
         xSTw==
X-Gm-Message-State: AOJu0YxE+qT7yDmKLFnpCrHPpNsj0vyK6KJXGX17eGkFTUKQ9Lbc6fyn
	WKy0jour4GkRhR3HHxYeQMeqhrzCLoYlpPdEJl/6e+/ZKgO34oZucECFP9XGyLw=
X-Google-Smtp-Source: AGHT+IHa3byya7dIvQDMqOR4n54Cfq1D2QEr97DUOwPKNmDLsK6jgR2+BFqesK8mx+OEknImw3w/4Q==
X-Received: by 2002:a05:6870:e390:b0:21e:dd7a:2d3e with SMTP id x16-20020a056870e39000b0021edd7a2d3emr12450237oad.22.1709008943675;
        Mon, 26 Feb 2024 20:42:23 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id e30-20020aa798de000000b006e4ecc3e394sm4899782pfm.79.2024.02.26.20.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 20:42:22 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 20/20] Staging: rtl8192e: Rename function MgntQuery_MgntFrameTxRate
Date: Mon, 26 Feb 2024 20:41:57 -0800
Message-Id: <20240227044157.407379-21-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240227044157.407379-1-tdavies@darkphysics.net>
References: <20240227044157.407379-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function MgntQuery_MgntFrameTxRate to mgnt_query_mgnt_frame_tx_rate
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: no changes
 drivers/staging/rtl8192e/rtllib_softmac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index afa789fd1266..97fdca828da7 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -163,7 +163,7 @@ u8 mgnt_query_tx_rate_exclude_cck_rates(struct rtllib_device *ieee)
 	return query_rate;
 }
 
-static u8 MgntQuery_MgntFrameTxRate(struct rtllib_device *ieee)
+static u8 mgnt_query_mgnt_frame_tx_rate(struct rtllib_device *ieee)
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
 	u8 rate;
@@ -201,7 +201,7 @@ inline void softmac_mgmt_xmit(struct sk_buff *skb, struct rtllib_device *ieee)
 	if (ieee->disable_mgnt_queue)
 		tcb_desc->queue_index = HIGH_QUEUE;
 
-	tcb_desc->data_rate = MgntQuery_MgntFrameTxRate(ieee);
+	tcb_desc->data_rate = mgnt_query_mgnt_frame_tx_rate(ieee);
 	tcb_desc->ratr_index = 7;
 	tcb_desc->tx_dis_rate_fallback = 1;
 	tcb_desc->tx_use_drv_assinged_rate = 1;
@@ -277,7 +277,7 @@ softmac_ps_mgmt_xmit(struct sk_buff *skb,
 	if (ieee->disable_mgnt_queue)
 		tcb_desc->queue_index = HIGH_QUEUE;
 
-	tcb_desc->data_rate = MgntQuery_MgntFrameTxRate(ieee);
+	tcb_desc->data_rate = mgnt_query_mgnt_frame_tx_rate(ieee);
 	tcb_desc->ratr_index = 7;
 	tcb_desc->tx_dis_rate_fallback = 1;
 	tcb_desc->tx_use_drv_assinged_rate = 1;
-- 
2.39.2


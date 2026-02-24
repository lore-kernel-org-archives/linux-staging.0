Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7442936D501
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771926678; cv=none; b=Qsl+DpECGU41TuihbRHTu57FZhyFN+3zXbGSZ41jJX//+2yMvuRIVMHDcLrnv7BmYHM/FxmxgYu3/ec6Pt3Wmo4Lv2g+uP6vhJy6OLLEiILyVPMy2GDIlutPPiXtf0Rqmgo+3bOl/lenePOIBp9EYbAwDKEsaEaDiPCi2sscK9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771926678; c=relaxed/simple;
	bh=ByeylcUaSSlxUhKpsLda3TKwU+3+TOGJ/mbBKSIsUFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j45vwG7XmgbuAIPnmudnkHTyJ9nW7SKyOHENDr9qOpyqIDnDewRVeexPJAEx+cQckE8QJW5TeZdo8OTyNRhnYeHrh6bqMt4n1hpm2K9L1D6oLEuQ8C93+0m1LC47eYuXKy7DoiG9+WCdGukMzq21pthEbgoCe3e9JetDdm8Nres=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+ukKWs0; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+ukKWs0"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-483708b697cso6147385e9.3
        for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 01:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771926676; x=1772531476; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Mdyqx8V5hbMggUOOH981rcjbvtaSlpyyayudKe27uQ=;
        b=H+ukKWs0wlVjw5G/OESFPqHozL8xgzf8HJQwf1vjot1/K+19hbKuoX+FHawKZvNp/5
         bkE6CwqxRHbDkcWfHqUUBapSZkV882nl/Zsuu/s7csJiOmxq1l2KrX7mZRmLzvnhQsiL
         lUU0Jj2TgDfWpuycbbNVEMZXbEmsx/bxESwg7ls/nJNoHlCb4FzThiH5NZzf164jtbdJ
         NHzmdTwmz3we9LPNCCSr9jepNgiwwFW0XCyjBbSzSujzk3W4RXBmjRBZgZrshF5q4gBO
         jp0JRnGAik54hFAbcUiDgX6vT+cEBEw9Ljj2QUYFjXZaE1riy0YDEgzm5Rj03M6umO0a
         fySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771926676; x=1772531476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Mdyqx8V5hbMggUOOH981rcjbvtaSlpyyayudKe27uQ=;
        b=twvqP5ZvLVtrA32XTFu9+CqRBTvuoRx4nv2TOD1ENSMJNQzufcY3zmYy2vKWjht5xR
         H6VrEoS0qq9Iux9DYyfu/8QGn7M6zGqnWpYq3VliATcUnJ6ABXLp8dnM0XlQIkJCExAD
         My3oELdxYo+MK7XwWcHJRqxFmiuKYPaj6SHK1AdN2p8FUZNriiAT9AdzMWjVemZAc6IS
         OdFx55FlkPOLLguXPXFHK4UzmttC5lBfTy3YaE9c2CW8OpaTRYgYft/Y1EoywyECGfhb
         MCwLBDzcnoXJ/lv00RbQtAdUuLjyOZtbYmDsJE4I1iaM+rFT8JImEu2a4TmvwdoMOv5i
         7jiw==
X-Gm-Message-State: AOJu0YwipVABbMrf5lWyccPJt4wOpYTTRu/hasR4/XP0LWXQH8nzRiPk
	Xoq2cltgNuaJXQWNUgss49iCnwz5OJovLhnxDgH4y0CXq8l1Jgsu6Agi
X-Gm-Gg: AZuq6aKF/adBq7LGS0EIBNVgZRVu5pB2z76FhzvmbJV99sAGQ3EcO9M1yMNyJ+FvnE2
	R0G7/crg1/cqQb8GCBT7+0Jojw7JBvjFv0i9pA90CrHZKxFtu0NVhjkmwhid3emDiapAVBXBD5k
	UtMmZHaJSuSt7ZODgZC0gyh1yUM6E9805vkiYhSazlGEJKA1uko4M9d7m7p4QYoJ92D70fgjlhs
	rfH5dePtR4+O4LpaarkcxrHa2YGq8M2n4oRss9AYIqHVfAvrEMfLBStwwrBozVWOiiHx/OInzKB
	x3IbQ9SFnZfOM/X/K+TnjYQ3HVe74QSjxH/1SI4/TXmp2nPP1Qyh+yLYrmo9bkEMwUCT4xYjhm3
	nb2f1feQUX8oRTLNd3FP6lL4EjEv5lZarvDc1ZIMQgK7516ViU91t3gY0mlk9BcxcTGzWyCFmI0
	DDXOUIp4a1Qf5ztjLjZVE8NQGFtl+7tc0iZHp8RzcnjMsv9Y3doESURhjHQmCdHL6PntJTVDlkc
	/RSWdURc7VQa1FN3IDQTB+pK9t1Vuh8JlLDEfIM5SNrkq0DQ5T7qIen07A9UL0=
X-Received: by 2002:a05:600c:4f0c:b0:477:7b16:5f97 with SMTP id 5b1f17b1804b1-483a95573c7mr126477405e9.0.1771926675534;
        Tue, 24 Feb 2026 01:51:15 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b890bcccsm21648605e9.7.2026.02.24.01.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 01:51:14 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH v2] staging: sm750fb: Fix "programed" typo in ddk750_mode.c
Date: Tue, 24 Feb 2026 13:46:17 +0400
Message-ID: <20260224094616.42494-2-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260218085302.105282-2-giorgitchankvetadze1997@gmail.com>
References: <20260218085302.105282-2-giorgitchankvetadze1997@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling of "programed" to "programmed" and remove extra space.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
v2: fix double space, fix subject line spacing as suggested by Greg

 drivers/staging/sm750fb/ddk750_mode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
index 3b25892af713..7163232c0701 100644
--- a/drivers/staging/sm750fb/ddk750_mode.c
+++ b/drivers/staging/sm750fb/ddk750_mode.c
@@ -74,7 +74,7 @@ display_control_adjust_SM750LE(struct mode_parameter *mode_param,
 	return disp_control;
 }
 
-/* only timing related registers will be  programed */
+/* only timing related registers will be programmed */
 static void program_mode_registers(struct mode_parameter *mode_param,
 				   struct pll_value *pll)
 {
-- 
2.52.0


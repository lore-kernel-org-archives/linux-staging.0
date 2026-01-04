Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC689283159
	for <linux-staging@lists.linux.dev>; Sun,  4 Jan 2026 19:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767553561; cv=none; b=dF6jyKVnTKoeioqN0U/XQIgzExa8V/87AgmZQs1xHMMNrg0YCnko/QHSLoo2elmqN9gZ6MnJ1SXwonYLrC5xL2ot0xyNJeIh2gV7VP5j0h/E15uUFeeVio6Ic27oGWIeiYQXUO4u5fS1lLUolAXTJ0uI9ry+tR0mlF2F0PjTzC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767553561; c=relaxed/simple;
	bh=W6NyjsgqJpje0GxOZQmAwqJGhMN1MSoT9QtbYe3sD84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dt3ZmBlCW4xGinAbUbqhq/iw/HDIUvjsgDj4wYInWpY3l9oia+1K3UOyM1utjtMU9yZZGAUxi2IsThMKrSLUoo/DBtCvxa4ihrvTx5Dk5Ciq35cyGX0lRz3uSCMwtAq2SdBdeK6GdfQ9qCr90odAeUG4QXowJP5GhJcU+gLbKQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TM8JqAT/; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TM8JqAT/"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so5439089f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 04 Jan 2026 11:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767553558; x=1768158358; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPN4xTgI6JHPvReSWeqoK8IgjRhln3sF5NWInwVvHG8=;
        b=TM8JqAT/Io1zHmMcP0KmZJGbgPZ9Cy/lrlfTfTtLKrXfClIGEiFA1JU+XWwJ1z5kN0
         jw3bRBVRg6PMC3vb6hAMN/+SeTNDlf2JdRR4D20VqL6xJe8HUsfuRVwox4ARXkEZuTxV
         1jWpVqVEphjsOHUOLIRU8Z3pgpY8KMX8l2FdpbNqTEo6jOz81IkYgV9gMwk2wpMGYWbF
         tzi7R8QxVYOjK7YuN4eAMvX8C1CilzxYVGTNmB5noXrrqsvzqNtXx047KtugsXIjZsE/
         kGAhNSoX4nGxPa79aw1iBc+GD98dCHVfrvUz091bYgkpDG98B4DvSULtLR3G7V4tjFuM
         9jtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767553558; x=1768158358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mPN4xTgI6JHPvReSWeqoK8IgjRhln3sF5NWInwVvHG8=;
        b=GHWJnuCMPejncFaWhKXo0j5yXCbqj/HzZKSZXXAT5KzyvIxVKdELceAKVWS2oQWKNX
         /h1vWYtHyFx4X6GjFBJsquM5RqMfAuqp2wj16X9tHeejFMY2n94w5SlV0BEDv0JtPd5x
         3H28bELi1q1nCjuDYseX0oynfP4SQlHjP2+GdcIIlrvFQA6zgVeJOHJJBGicX82sclGU
         1QJzvTZswXLbqufe2nk6hWSjqItOeyUnS1DMqQQDz6MVMD4dCiIQeUJGWF6vzFgRiXRY
         h5p0nmfG+rdU6wsiqi46nZ0XsvBTrBu+Ed2r8Pzs57ZgTjzWyvmPi1ju5b/p/F2eX58R
         /x1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWjAVZPLjtwjbwpE3pEUO1hqNW6RV+j2C7eGySbWuOM87818ecAxPzfbU5ow3lD3ovMcA+T8sQLk1z82HRw@lists.linux.dev
X-Gm-Message-State: AOJu0YxK5PARz6KcE8SQGPo6MNpc/XNYUFmtY2P/n3utiJoI4O1kKbRu
	nO7Y1NeP9OQBRUYBeXQNJieD4yng9HZaM5jAqQo5su79VpN/yweO2RA2
X-Gm-Gg: AY/fxX6JZ2TKukMl/0s4dYt6Aww+dqV8L/rY0bsI3NQqo8ZUs12EJ8dS2w77cIdkalm
	g6nIkX4Q1648D+tvNeGycaKens+z1q7m5ec0fOr1eaQOEx6I4BIRmOQbbs8EaSMrOOMl9HAVM2T
	nHJ1EARUv6Mlj/iidtscIHXRn3moC7PplCMpDUOrkChJT3mXkZwHG5Tb6jtI93VCs+Ue/g3Myan
	N93moVPZTeJUcZeGLX5D/29dvzfu5AzwnE4xToDsPd8dQCGcP+oYDIm0i9NqLi1aqm50O64ZWlZ
	fDLWX+SXhVE7LYgEVlMr+HWeCLR0kFIIo0PLVCKLNRiDdBKL5LAg48Bc1YGb8oVpN8bTXnt7bZA
	mZ80LpP41CZy9zYjHWYbPYF+wAVVrUt0lKrCKRCr+R053zAmZb2s6l6GXqUpmTD22Hu3kX/IhvP
	jZAv7QTX0vpQNCy1X7520BAKfKq9HefSlZcwv0qUs=
X-Google-Smtp-Source: AGHT+IGG1wvzUbObPV/Nlzp0VzBlVYRvQA5fZ35AlHFfaESwLJK1dRu09w7xLw8bYO2P1pz4+O+HKw==
X-Received: by 2002:a05:6000:290b:b0:430:8583:d189 with SMTP id ffacd0b85a97d-4324e4fb659mr64947627f8f.39.1767553558167;
        Sun, 04 Jan 2026 11:05:58 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2c4fsm96505089f8f.42.2026.01.04.11.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 11:05:57 -0800 (PST)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/5] media: atomisp: Fix function signature alignment
Date: Mon,  5 Jan 2026 00:05:06 +0500
Message-ID: <20260104190509.19683-3-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260104190509.19683-1-mahad.ibrahim.dev@gmail.com>
References: <20260104190509.19683-1-mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warnings regarding lines ending with "(" and improper
spacing for indentation.

This change fixes the function signatures for both function prototypes
and static inline function definations in mmu_public.h.

The kernel coding style prefers arguments to start immediately after
the open parenthesis.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 .../hive_isp_css_include/host/mmu_public.h    | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
index 2fc137ef46da..90a2e4e8f510 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
@@ -18,9 +18,7 @@
 
  \return none, MMU[ID].page_table_base_index = base_index
  */
-void mmu_set_page_table_base_index(
-    const mmu_ID_t		ID,
-    const hrt_data		base_index);
+void mmu_set_page_table_base_index(const mmu_ID_t ID, const hrt_data base_index);
 
 /*! Get the page table base index of MMU[ID]
 
@@ -29,8 +27,7 @@ void mmu_set_page_table_base_index(
 
  \return MMU[ID].page_table_base_index
  */
-hrt_data mmu_get_page_table_base_index(
-    const mmu_ID_t		ID);
+hrt_data mmu_get_page_table_base_index(const mmu_ID_t ID);
 
 /*! Invalidate the page table cache of MMU[ID]
 
@@ -38,8 +35,7 @@ hrt_data mmu_get_page_table_base_index(
 
  \return none
  */
-void mmu_invalidate_cache(
-    const mmu_ID_t		ID);
+void mmu_invalidate_cache(const mmu_ID_t ID);
 
 /*! Invalidate the page table cache of all MMUs
 
@@ -55,10 +51,7 @@ void mmu_invalidate_cache_all(void);
 
  \return none, MMU[ID].ctrl[reg] = value
  */
-static inline void mmu_reg_store(
-    const mmu_ID_t		ID,
-    const unsigned int	reg,
-    const hrt_data		value)
+static inline void mmu_reg_store(const mmu_ID_t ID, const unsigned int reg, const hrt_data value)
 {
 	assert(ID < N_MMU_ID);
 	assert(MMU_BASE[ID] != (hrt_address) - 1);
@@ -73,9 +66,7 @@ static inline void mmu_reg_store(
 
  \return MMU[ID].ctrl[reg]
  */
-static inline hrt_data mmu_reg_load(
-    const mmu_ID_t		ID,
-    const unsigned int	reg)
+static inline hrt_data mmu_reg_load(const mmu_ID_t ID, const unsigned int reg)
 {
 	assert(ID < N_MMU_ID);
 	assert(MMU_BASE[ID] != (hrt_address) - 1);
-- 
2.47.3


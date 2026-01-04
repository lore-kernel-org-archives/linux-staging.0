Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76992315764
	for <linux-staging@lists.linux.dev>; Sun,  4 Jan 2026 19:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767553569; cv=none; b=Ob72C+eFIGXJg+q+lD1gp7zQqRLLQYZcRyx1KulIVM9/PKz1f6ocCglK9+T9vYNT7S/xjYSn0zJMtT9+YchWzf2l8UvOLRi95x0dxJjNtADiwIxBHwyb7dtWvdpWV3sPQn9NQI6LFgmIAFWTIzSs5SEfwbpR4nU0yLq507fNVg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767553569; c=relaxed/simple;
	bh=ZK5uX/GFgJyLUCjHyioeL6D474O5WD3tQ+XmE+pnOXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RkD7hmTykNbfUl/4sU31fciUbMVMU0dObxrjGhE9nR6lUowjhQKS454bkmDIBQwP95TzLwZkqxDp4r9VN5B4Hq2QKkHe8aY13JcFvL8R95I5b2Xv1gHzFzFi41ObOlUBDflbE0eMqY7VVOYlZHbyuJ+9K51FbS+y//W5swN3M4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TD+a2mbx; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TD+a2mbx"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-432755545fcso4113628f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 04 Jan 2026 11:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767553565; x=1768158365; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebOgnSrN48fxkQK6SNZdklEbQHgjDwwzirduEj6RKHM=;
        b=TD+a2mbxj+HAk3p+v+uwRAG4edVeW5HGwKd8knVlUzmhcegB0KxAEpG+ys8ODorh9j
         NpiE4fsaRU5da+Ir6u3zTOye0ZnF5L38f6SwcydIdzpu19zHoSK0hrCjj0dNcZLPtNW6
         rcLTIaXYDChrG5BzHCINk8eTbX1g3AnUtbJSI690H0TNetiITymc92hdLT1bij3eSoBp
         N7grgpeuNqnmu4UWK/l6FqaAzYp1PMbOZkeSFZVSgW15y/GQO5EjLE56a+1cmVJHdWgI
         bF4zSQ0q03/QGoxvY8vChbK7XZ5vOCSJIM4RLi1cm5hWlk1pf+bHaDzBcM1rShl73zSF
         UEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767553565; x=1768158365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ebOgnSrN48fxkQK6SNZdklEbQHgjDwwzirduEj6RKHM=;
        b=oLJtgEgPlgDJ80gB8wFOpRuy7mluO87/yx3G6PCA/RTAIw9lgBgJFBUKej4Axxs8dJ
         z/YaAtSmAmeHq4jgi8Ew44ce8bAZaa7aUUzQK4TPyISJvecPVjrJsKMAFORYxgw0zzat
         SAUEND5A2kPVWBRZqKajT7GrGSu/XRQme8sGlpetgHEJUqbWJOPTxOaokwClQno8E8XM
         DnM9smDDDIXknq+0ZoaObVOhNY45S1ohJ7Q+fhcLgdF5JsKqEy5IqXGc3rqU2MNXm2YY
         ijcH97w7UrxWCmr160FYjdoIgY3qRi+8n3BS0yOAFwViAkjOHGEUmXphZt6THRIGK/jg
         yEvw==
X-Forwarded-Encrypted: i=1; AJvYcCXufbOP2A/Xobtg48PEKBUNcXynqmSklvbDm1PiX/0UxRPB7Y/1UFqus0irQFHQKbSTM6UYyAHJLrZLJezN@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4Frs4h2YcXQi1lvsma5Mi/w1RTZ4BxBfluecWKDyUDEA1p6qn
	IPkHDE1s6t6ZR8cxgQnAvH/Pu2PoURjgL49g1QfeH05SMNyQnZi9qLlN
X-Gm-Gg: AY/fxX5uByVYSERx/FDIoa87KqsR4t6nNISt0ObQTAUFXGLlmQYY7Ghs8isgQ/vQWEZ
	LdjMn2icPcSNXOVreNUv55ZbRRxu9A4MQnz/TEhQx1SoZETfvRh4wS9zH8kmYxz7zs2govI+Zf9
	tmipRAJk6gYNIBbO9oh97ZFI46HOSabxdQtc0947vohIWKEfLvP05vXB+M71Pve1Rj9gWYXZ6/G
	JUMwA/PFTieaIa7dw5FHMrVrdsDfFEje5jCcV7wD6tW0jVzU0EGxgi9FM/OFQ7ISkT9U1EbVaK9
	mQzfXLyrfexCVNKS/yGy7flTOffoqo9M6nVGgFAZ2J6qgUjjJ6NbPE0ifAcyG3VIdn6OH1TlG3+
	vmLiJZnOYr6IrnXX7eEQOv+6PkYGyjd8GU3tYLju0o08PbcOF+VEvSyOZK6WpAVTyCLcMNb14WA
	UekMgIXXRHhEuWLHzTrQH5rGVLPNwwG1cZuWWpihY=
X-Google-Smtp-Source: AGHT+IHIP5Wv68Zp/SZhZsLMise/WRvMupz/fef9S9rk4hz4fUw3ic6mFpAGlWl+s7LC1UyZTgG9FQ==
X-Received: by 2002:a5d:584e:0:b0:430:f622:8cca with SMTP id ffacd0b85a97d-4324e511553mr63803347f8f.56.1767553564535;
        Sun, 04 Jan 2026 11:06:04 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2c4fsm96505089f8f.42.2026.01.04.11.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 11:06:04 -0800 (PST)
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
Subject: [PATCH v1 5/5] media: atomisp: Convert comments to kernel-doc
Date: Mon,  5 Jan 2026 00:05:09 +0500
Message-ID: <20260104190509.19683-6-mahad.ibrahim.dev@gmail.com>
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

Existing comments in mmu_public.h used Doxygen syntax and had
inconsistent formatting.

Convert the function documentation to the standard kernel-doc format to
adhere to the Linux kernel coding style.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 .../hive_isp_css_include/host/mmu_public.h    | 59 +++++++++----------
 1 file changed, 27 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
index 611755e88e9f..b321f4101193 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
@@ -11,49 +11,45 @@
 #include "device_access.h"
 #include "assert_support.h"
 
-/*
- *! Set the page table base index of MMU[ID]
- *
- *\param	ID[in]				MMU identifier
- *\param	base_index[in]		page table base index
+/**
+ * mmu_set_page_table_base_index() - Set the page table base index of MMU[ID]
+ * @ID:				MMU identifier
+ * @base_index:			page table base index
  *
- *\return none, MMU[ID].page_table_base_index = base_index
+ * Return: none, MMU[ID].page_table_base_index = base_index
  */
 void mmu_set_page_table_base_index(const mmu_ID_t ID, const hrt_data base_index);
 
-/*
- *! Get the page table base index of MMU[ID]
+/**
+ * mmu_get_page_table_base_index() - Get the page table base index of MMU[ID]
+ * @ID:				MMU identifier
  *
- *\param	ID[in]				MMU identifier
- *
- *\return MMU[ID].page_table_base_index
+ * Return: MMU[ID].page_table_base_index
  */
 hrt_data mmu_get_page_table_base_index(const mmu_ID_t ID);
 
-/*
- *! Invalidate the page table cache of MMU[ID]
- *
- *\param	ID[in]				MMU identifier
+/**
+ * mmu_invalidate_cache() - nvalidate the page table cache of MMU[ID]
+ * @ID:				MMU identifier
  *
- *\return none
+ * Return: none
  */
 void mmu_invalidate_cache(const mmu_ID_t ID);
 
-/*
- *! Invalidate the page table cache of all MMUs
+/**
+ * mmu_invalidate_cache_all() - Invalidate the page table cache of all MMUs
  *
- *\return none
+ * Return: none
  */
 void mmu_invalidate_cache_all(void);
 
-/*
- *! Write to a control register of MMU[ID]
- *
- *\param	ID[in]				MMU identifier
- *\param	reg[in]				register index
- *\param value[in]			The data to be written
+/**
+ * mmu_reg_store() - Write to a control register of MMU[ID]
+ * @ID:				MMU identifier
+ * @reg:			register index
+ * @value:			The data to be written
  *
- *\return none, MMU[ID].ctrl[reg] = value
+ * Return: none, MMU[ID].ctrl[reg] = value
  */
 static inline void mmu_reg_store(const mmu_ID_t ID, const unsigned int reg, const hrt_data value)
 {
@@ -62,13 +58,12 @@ static inline void mmu_reg_store(const mmu_ID_t ID, const unsigned int reg, cons
 	ia_css_device_store_uint32(MMU_BASE[ID] + reg * sizeof(hrt_data), value);
 }
 
-/*
- *! Read from a control register of MMU[ID]
- *
- *\param	ID[in]				MMU identifier
- *\param	reg[in]				register index
+/**
+ * mmu_reg_load() - Read from a control register of MMU[ID]
+ * @ID:				MMU identifier
+ * @reg:			register index
  *
- *\return MMU[ID].ctrl[reg]
+ * Return: MMU[ID].ctrl[reg]
  */
 static inline hrt_data mmu_reg_load(const mmu_ID_t ID, const unsigned int reg)
 {
-- 
2.47.3


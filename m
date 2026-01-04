Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD98283159
	for <linux-staging@lists.linux.dev>; Sun,  4 Jan 2026 19:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767553559; cv=none; b=c/L7hVXT/sIKmNi+lDQtj5QM50rhQj+vh7FvQUi9JpIK/a0AmzNR5l66an5nYjWIE7Kmi8WU8j40aHBDjtb8tatmeawgsVbWTTJbMa3inlrVScVWPWnEEh+BcPqWf63JpTfCsBmSQ+78ig3OSMl8vg7IjbaJLNXHq0maBvYyjN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767553559; c=relaxed/simple;
	bh=OyC+g03aFlX7lZSthSQHkxNGwEsoEs0Tb0cf0wHv4Gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A3lqTrqcMACICfF8yZdSS4bqmEksDuo28hPdPVS89EwRNBfJ2Opl1rhAOgkkltnAHlcMccQYooLFoKvkuPWZksoaBOgKh1om7tu9Y2SaTZW7R7QEvV7TUh0fSKwbizwxg7vgj0RVLZZdkhqjuTCWko7gOS6WcSDrHObY2DYh6s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DkYBgpB1; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DkYBgpB1"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42fb2314f52so7464733f8f.0
        for <linux-staging@lists.linux.dev>; Sun, 04 Jan 2026 11:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767553556; x=1768158356; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PWgc9+y+yljidHQMYhQLHs/5E2QnwKnp6O+oSXf5cSk=;
        b=DkYBgpB13ElC7AaExOoXZSpRwFtLxqt0KVLJB/lG2PAs2lTReXWO8Tauc+bOhZ7py1
         1v0+Za+CwvHyRaj4cmHz0gxXMIWE5tyF2gSgC0MRlupa+IR2/yVL40zyzhH3L9ofVmmx
         NRz+z61R5Gkl8Jkio0d+91BuWVHf3kidsloSFD2WKdHrD73po7FZpWD72jwoaINBaS0V
         fFhiUVrXu9qaDXTUxi5dL0Vw3V6ub6Wf3J160FwgucqgGrqHJ/wVdcavQ/9pfvtcht0o
         gk/iyaEzFYojKusWkoArrD4Zy+dSINfEnIs/gDwTt5WNJgY+lEb+y9l1mwChJLggBxpr
         KjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767553556; x=1768158356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PWgc9+y+yljidHQMYhQLHs/5E2QnwKnp6O+oSXf5cSk=;
        b=XFcRfdZHISkMtqlna+ZdgfJEfoUNwnQV4DgLuh10uE5tTVVJiSTVJyMsRcQFHjzLjV
         y+x83t6rV6xmfFwhhYI8gG1efrxqChwyjY/OWaKxtl9EcoOH9xvk55ELQ6qUud+pYldz
         Cjr7XExrGlqF5bgpn8E8tc1HJaovbMfIewCOv1qGCZ22oc+vu8hi8nJ+5vOkVCLXpSGj
         dkmmtxJ3CX1+Mm/OsCQy1Xx6SzzhNVbnIqmDJ7Yc1hMJfD2Wu5m+T6DIhCIzSZXHzton
         SJQojy3tyaMt6+ureKgclP4jNjHuNlCpRcGyEoZB4r+oO2NcCHijoJlb+CZsmMrTHPMk
         KQRg==
X-Forwarded-Encrypted: i=1; AJvYcCUwySFHRpyfWlQOrNBbA+RkI0712td4N/INjWPmNf+3+YsoUqqHg9jRfgxlVJFpfa4w6oL+ei/jkwiKPWKh@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3DsVIIAzY6e7P9ouDhm/sFQupyWBn9qd0kkYqjziKYdMwutN/
	4hOfneA+y20GlglE+AuvVcdO1yV1Zy9QiFx6odUf/vjQo2MXbWLXOkNrSN8gm7o4
X-Gm-Gg: AY/fxX71YZKkNkeI0o/iehAB/AAm07DAFjyU1m1dMnP6B7MhHJCn2uYUPgIb5aAGSiz
	D24Q7NV+SH2ivvvE1noboFY2oY6DvzRffeyW9GrSGnXW9W68g+lsA+XNXVRUUhFnqH12emXcCmp
	DmdCz5rNxTkh4OXuIb5iNfEwcCLWTJhthBhghcx9EAlAtDdn7y0/6oVUBlkDHJN0M36/iczXPwK
	HQPeSNjLNoKjuo5LvHu9yKAT5/HQByI5HNSv7cH3PetJh0yobNWFwnAGi0r4voS6vt/4gwwDSqm
	+VdnSc+BFZ14D2k/1dfTAX0WhTVSpQM36xqeWRjh8Pzum9e+4jgvPDTAcQVbFFlFQ2j+kdgRbxd
	6earswoPyF3wivFWjRvhO6/cEmKcZSbiaJO9UwCPuQvDuuuAWRjQUkXQ4A6/j1ohIIN5LBt2GsV
	wHo2wNvTUKFnlB40LqqXCLy8WlG8/ihWj7xD6bzC+yu38GAjVM4g==
X-Google-Smtp-Source: AGHT+IE0wNk1jmGNWpzD9tmrWUTxX1bKR2z9THWxZWvHHtqvM339Z8w94MLeOag/HytCXIrXR+WPrA==
X-Received: by 2002:a05:6000:2203:b0:42f:b707:56e6 with SMTP id ffacd0b85a97d-4324e5035d1mr50944550f8f.34.1767553556057;
        Sun, 04 Jan 2026 11:05:56 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2c4fsm96505089f8f.42.2026.01.04.11.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 11:05:55 -0800 (PST)
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
Subject: [PATCH v1 1/5] media: atomisp: Remove redundant return statement
Date: Mon,  5 Jan 2026 00:05:05 +0500
Message-ID: <20260104190509.19683-2-mahad.ibrahim.dev@gmail.com>
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

The function mmu_reg_store() returns void. The final return
statement is redundant as it is followed by the closing brace.

Remove the redundant return statement to simplify code and adhere to
kernel coding style.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 .../media/atomisp/pci/hive_isp_css_include/host/mmu_public.h     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
index 1a435a348318..2fc137ef46da 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
@@ -63,7 +63,6 @@ static inline void mmu_reg_store(
 	assert(ID < N_MMU_ID);
 	assert(MMU_BASE[ID] != (hrt_address) - 1);
 	ia_css_device_store_uint32(MMU_BASE[ID] + reg * sizeof(hrt_data), value);
-	return;
 }
 
 /*! Read from a control register of MMU[ID]
-- 
2.47.3


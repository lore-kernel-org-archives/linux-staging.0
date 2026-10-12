Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B3F397B09
	for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 23:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791846558; cv=none; b=q1DNEhUQeavtC+EB5EuTlCJTeHvqPngu34vJAIxmZnmi92LWwMlW3+FyICc8nhapTSSLI2s0H52oK267psUvvg7y+3PRlmqpvmItYE3Vzm5d9xtGidImzoJASiDErNuvzw9btyDGRNsp8ohQr8xhCNYbo0RyJCOAH0wek3oZNY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791846558; c=relaxed/simple;
	bh=8UK9GqHDqDypVasEQe8OawvFsFRei6vvOg0OYcMF/J4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mNbpQTDRGdtA+csuE6CQagqFQYWjTwlY87CVNMgEM0+gvWq5SNOem47jkZnCw/MmPeOR41rKLG72/BWNqR2/fZicLl4QLE0ymwRolBolsZvFZafa98GJWIIHgcSL1RJROBaBsY+9HFqo10Wvx+D5bsv+44hzXvrWxy0rf7ibkIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A8bui7jF; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8bui7jF"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48af27fe287so2020963f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 16:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791846555; x=1792451355; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DgOVtzQ28pkuwhaN83pO7knMz5YeYec6Njm6mUZKc+A=;
        b=A8bui7jFGv4u4CTS7ulCLQzA898DBqVWypIvBI7znsYuC0mQCWE9th5xf5VioSX1jv
         99XVWyMq/ZiHp3odV026M/qR7APAD/6+4EHsdcglGO7G9QEZU2jrzKmrEFByyw4EXtj2
         tfAZKdTLWu14PJL5N9M5P3ljP7DeaDzrB/6XTDNZIQM41+lGPn9kr2SL4iy55uJzH5Fh
         drSgc9Wt9leDfEP8XmivVb3ppMbPA4xFJXTmAQ9Mq2yFcOYguwnBKuMY/BIUPBO2Iof7
         YAO1qpBuYgTgR+5ZX4/u3HPPBorA014wpmbGPoECystnsrBDDGWuqWLua1akXXVfvghZ
         2Xaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791846555; x=1792451355;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DgOVtzQ28pkuwhaN83pO7knMz5YeYec6Njm6mUZKc+A=;
        b=GUlzXRwapbcaGZAKTve+WhCifws7iV/n2IATZspUavBLq196TC8m0Ze2+BGmmBvebQ
         clvGNGjlMv2CGkZvt7s5pGy4sdorFbdSYEqEIKWc4nUrAjqk5+W97pVmDra7xwfjTW2P
         2hTp/Znwbrf53wbQJJJMy+be98/qjT57s+iTxlQOB1/plc5ESF5sf1oIFi0Qu9MZcZlM
         w7CbMA3yoEOU1HONgqAq05mmTyJGvM9pOyM0jgn9Z4oxPY8P1bOoBQvNtjxqWaRu0kh2
         P290AGR2pb70FtIP+M6yDhB8bYcVgo7UgNkGt/7WDHdM2hxFDlyoaVaG8SWmi7v8fPln
         SH3A==
X-Forwarded-Encrypted: i=1; AKwUvBydjG+wg1S+mRBbXfSX5OU8+V4hkmVfM1ZhfGrMUuULcw+5kgIW27H02A6GYx60yg3MuIh7WPudxSGkLDvZ@lists.linux.dev
X-Gm-Message-State: AFq9FYImjjYeLJvgmUAX4g4Gu0Fw8fCf/zdQs9HC9efuzCdDHNpbN3dN
	rID5Sdn1M2c3/0oSw7E3ySJr64gTHxKkn/LrbEQvbC8cb9lMkd0nmVrI
X-Gm-Gg: AYBFou1dS2OirXWdbouUUXTtTBeCC22lidGZTZ+sAXXKOEiT3N2/CN2Qt+GJswgh4xS
	AH16yA3grh+/9cx2Kw+gDSg+NLMrhaXunirswtejCpE+g9qgsktIE+QC3fvMSjzQerMdRcigm97
	1AY6xhQA/u1nsulYf/zHAFnpdCeq5EwOe+L53+LQlbrgCgKMRdD2Wex0l9fhhcZhK9wnZQwEIaH
	3JHMbKOf/03PYNv52NVeIPdV4SPivrvYfzJmnGUFqWWRk1edwdgBxsgAx2HxT25Vinwolpjkflb
	gC1iOGaxM4eo8Xi1q3ZvsCV1C6UXgtC4CtIE1AVWzxoUxwzV5lAoMauqHN/bGMhhu4c9n38v3iF
	GfzwYbiMNlOhHgo85l03UsidLCru+9QRlguyRT8/M/Ds/v2TwWBwu8V+2Ba7rnn2Kg//mJdGomN
	97NDXN+Rgy1csHae0gd3GDDxxopdodWasnkDtNONn3QQjJ4cF4a/XBT+e3Ore5K+2YHAJzzzL1N
	mDygzxcLZCmU8GpEDFN8w==
X-Received: by 2002:a05:6000:4917:b0:48c:7302:96ea with SMTP id ffacd0b85a97d-48dbace4edemr20633411f8f.51.1791846555281;
        Mon, 12 Oct 2026 16:09:15 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaa9f9sm1873928f8f.19.2026.10.12.16.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 16:09:14 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
Subject: [PATCH 1/4] media: atomisp: sh_css_mipi: include assert_support.h directly
Date: Mon, 12 Oct 2026 23:07:50 +0000
Message-ID: <20261012230754.1914517-2-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012230754.1914517-1-vladurares@gmail.com>
References: <20261012230754.1914517-1-vladurares@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

sh_css_mipi.c uses assert() but only gets its definition indirectly
through the circbuf headers. Include assert_support.h directly so the
file does not depend on that include chain.

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_mipi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 971b685cdb58b..d73edd2c7c5e4 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -20,6 +20,7 @@
 #include "sh_css_defs.h"
 #include "sh_css_sp.h" /* sh_css_update_host2sp_mipi_frame sh_css_update_host2sp_num_mipi_frames ... */
 #include "sw_event_global.h" /* IA_CSS_PSYS_SW_EVENT_MIPI_BUFFERS_READY */
+#include "assert_support.h"
 
 static u32
 ref_count_mipi_allocation[N_CSI_PORTS]; /* Initialized in mipi_init */
-- 
2.43.0


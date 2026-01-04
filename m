Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74302283159
	for <linux-staging@lists.linux.dev>; Sun,  4 Jan 2026 19:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767553567; cv=none; b=GtmGIjhtT0BtT/vgWQMGYikNWQZukY0UQct0ENaSw/nEU3gPGERuEwGk5tdmscWXJNCQYL4O+5N2mFQam34yAoJrXxlbv7kQ+97UHRDKNkpyhdXyuwAi7kOdzCZZngrCl+qrOYR1Fx2Fdi5l9/HdFFkbO4OUAlLAvwHXJdEiKVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767553567; c=relaxed/simple;
	bh=OeWqv3x4vXNpequnFxYPQjSTl4yPG1PFNq+yGKZsjK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FaypoXrpygia1gXaHchKqagYhz7r+hhLSGStxAPJjbzW9A9NuSYo2e4YlrVZ/rhZ8Ix8NXoP9A7ab4zVJqJ++OG+LpmzSkCN2br9/bjf1gj9Ui823F/U05svdRlQ2bnZ6bMmaZMHp69RrxK4FmP3o3t4YeUODYy1ip1ja03Sz8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YzudmRJu; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YzudmRJu"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42fbc305882so6341904f8f.0
        for <linux-staging@lists.linux.dev>; Sun, 04 Jan 2026 11:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767553562; x=1768158362; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZ3Vo4XDf8d33cecZM2n9uZLMWmVIB6ElfJWOAil5Sg=;
        b=YzudmRJulkGW8ajyFnToCYnZrHaMNfFOjpYYoOTzL80OTKx+V5Xi1KNNm+YXfCXZeI
         siNbVS4fogZQTcJcvwbGM3DbIAcm5bNyQ1edOjddBqgrq8lUh3X1shTuEbGaW3a9UKWC
         Il/iuNZdMvv5/NuWc0IV2G6kF5lU5aWUuQrB3IzUHMMiqIknoi1x3dlsc+UMr2eFoS/r
         1Nha/FokbweB6l/XZbDo+fBgQqH1uOLR8ZXA7EKXcgD3PbNhYUB8TjVJXFVcPBCZ3gWu
         jalxXM7788sZSUJro2+lQu/QwbE9hhyWGYKFbzSbZFyo8H7VR1XdYjizh582eqQGZYJv
         ypNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767553562; x=1768158362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lZ3Vo4XDf8d33cecZM2n9uZLMWmVIB6ElfJWOAil5Sg=;
        b=MNIl6xAQ3mSnKCve1phP8rDU+6jf0wqo8cgfmjS+nCFAxWEmpRwy7IHrDQ8gWXN7WV
         7q1eR6EAVJ5PH2dkgWXPbTQqK5Yu7wce34Exc2AKUvn3Fyb3F5FzD+6fa5BqPP23dbIF
         5/2aiAxlhVoT46Kyt3Cr9NYQceA/NCMfBfwh91O7SahGeZwWqBYUHiMz+Hd6uCc10w2i
         fRkLmwyJzK5hJaZINBHdHlbP2/tk1y4glXTkRXsSfjh3HgRMzEuIuHkpH9+eQYs1EgZP
         1glC5spI7UUUEGfrpnKPYL0yV6flPZgIXFuxaN7YkEfLav/tuEj1HAC0zs7Wo/7zCmrq
         hkZg==
X-Forwarded-Encrypted: i=1; AJvYcCX59MAtSDSdm+GiU1MDoYRer63PF8IddLJJkGDhShhoSc1m14MVDqVzTgklDL+pRal7xYiVeKInAgBynB9f@lists.linux.dev
X-Gm-Message-State: AOJu0YxEKtlp9rtGNE5q2uaKkFb4h1qxdnKBwJBhO+1fGPF0EUlHfZMy
	5Ex9dur6Mug7v7+302zfsUx4/jhq1EDsfgvpc/7a6tJE9NHki/0WvgAf
X-Gm-Gg: AY/fxX5yI1PTBp/37W2jwjhSpcvS83jqujR9nQJBlK6TWsB3Z5LemY6tcmtw1WJbcpK
	DYJvK72mxHRIUbh6w194fYuOF3NvaKo/y+efIec2eSupKXfG5/i71Gr++9cGVSvqrNDwyQ/X1Mf
	ehSgJDpMPwC71PSY35vVcxBBfPLCULcNhJcPF8rwRH1Br42dBgw7ES05i+vJk+Bg31O+0osde0D
	9sCDhy6F2SPKakEr2aDchWWBM8gmFewLCTQiY0CEC8fuAmfVV58D+JVI/ebxhq4htDwEEjlvmiI
	67IR5ehfd15cjQmSbM0Ps9H/fbJ7mexOi0F3absH7kQ35tAX1FVSLN0Vj1Gjrw0S1IU/FXow6w3
	pupvO0JgPA9td93H0bzgqh/K8qzyVEzOepklLT54GLwjPHhgMx2PeOS+gADfDTrmLZBbitVEVFF
	DfXBif4XnHBpK7rZttr3dxFXKDn3SHC/m8QlmBhsw=
X-Google-Smtp-Source: AGHT+IFMqb+P79D6s0rZ42eMiSzskYTFWAxJDYuPAZrqbcUt6nli/XEunoys89ausHc9hjH5F7sVwQ==
X-Received: by 2002:a5d:5f54:0:b0:431:907:f307 with SMTP id ffacd0b85a97d-4324e506ab1mr61282976f8f.48.1767553562427;
        Sun, 04 Jan 2026 11:06:02 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2c4fsm96505089f8f.42.2026.01.04.11.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 11:06:02 -0800 (PST)
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
Subject: [PATCH v1 4/5] media: atomisp: Fix erroneous parameter descriptions
Date: Mon,  5 Jan 2026 00:05:08 +0500
Message-ID: <20260104190509.19683-5-mahad.ibrahim.dev@gmail.com>
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

The function mmu_get_page_table_base_index() accepts only one argument
mmu_ID_t, the block comment for it shows an erroneous additional
argument base_index[in]. Similarly, mmu_reg_load() only accepts two
arguments, however the block comment explaining it shows an erroneous
argument 'value[in]'.

Remove incorrect documentation lines.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 .../media/atomisp/pci/hive_isp_css_include/host/mmu_public.h    | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
index c3495ec4835c..611755e88e9f 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
@@ -25,7 +25,6 @@ void mmu_set_page_table_base_index(const mmu_ID_t ID, const hrt_data base_index)
  *! Get the page table base index of MMU[ID]
  *
  *\param	ID[in]				MMU identifier
- *\param	base_index[in]		page table base index
  *
  *\return MMU[ID].page_table_base_index
  */
@@ -68,7 +67,6 @@ static inline void mmu_reg_store(const mmu_ID_t ID, const unsigned int reg, cons
  *
  *\param	ID[in]				MMU identifier
  *\param	reg[in]				register index
- *\param value[in]			The data to be written
  *
  *\return MMU[ID].ctrl[reg]
  */
-- 
2.47.3


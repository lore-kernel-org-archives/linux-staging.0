Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E6C80C0A
	for <linux-staging@lists.linux.dev>; Sun, 15 Sep 2024 06:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726382469; cv=none; b=r4AQJF57LendKP72aOOvFeYKEqSvN7OrZ0Zc8hSuOxZWHhGpuMNOHl3nocL3hiyPmwNqkEZU7FWedGLAFD5TOrwbkBWKE1fq1lqsfbizByiKhgCdw5lcYgB3j2ew7gyXHl24vAUZJm2/pXoc7DExvBwqKdV98S9FjpViVemlebI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726382469; c=relaxed/simple;
	bh=h9V7Ghl5P4/1F4b4WHbT0bOdMUDLi3kP3qcWsoffqKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZdKUDLMf6mMounFFGsfra63XXmLEmgIHz1i31xXUqPtc2kYssYmCi0a4beBCuJc1BfqsyOmGIlk/37VLbU+39k/C1UV/ZhlfJgBV/ZDeNEMgwIBIiZAVy0BFI8b4RaKem4wqYtAtiEg3X+3cnRju8SAk+9dkM6wTNtODyIgqqkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4QpHOdZ; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4QpHOdZ"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c3d20eed0bso3954390a12.0
        for <linux-staging@lists.linux.dev>; Sat, 14 Sep 2024 23:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726382465; x=1726987265; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trv9Z7LRh7POQ7levyTVtahqiIPQOrS27lYcldQAO3s=;
        b=A4QpHOdZ5bozf0m7kxUr5UKKZ/k50Uv8veHIeUt633GGlA+u8apuVOI6GtK6TEP9sJ
         p8PnQNtk01dHBL7CTVxakj5qt3lxrpTrn2XTgY4IPl1QzYLHhoYX2d5qRGZFhgWB0cJx
         Y3asmeefsa9pf5/V7NHa1QdUjrWkB2Q10ZqelSrD+HvA8NSvEU9KrkvETeOPbqJIl0Sf
         r+x4S5vJg8yWwxYumKxLF6nM6LrKTZ93nr62o+O6elrlVN0DUbB7OM37FwLL12FDV0jk
         4aY/86s33X00Dqw6VM0SEne8TPwsW1CYiRVJYFbtDW0Akkv/Vn6Iu+0GVf/PwxCNA8lx
         tjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726382465; x=1726987265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=trv9Z7LRh7POQ7levyTVtahqiIPQOrS27lYcldQAO3s=;
        b=gbUhZI4yrjwCPmzbwla0lkavhvGe5F6ZHu2bIVSmNFKH87KIEwj3YSpelgK9sNsBaG
         WUCGW9Q8CYEKgwcowtV16MaM8hvpgMUmTD7BpS/b3s2ydxLE1e3h/bjKqB7tm7/ZjanI
         Ep3dFdOUiTahJlm87mpSfxo5hxsMvgXtbPGErJlpTemYZ0whzDwRYQK+mboQqgvYWonu
         n57lTQBNqhYO5ukc3j0Gsgw8ae2E+N0m4SliqCniXmyGM0WMIlaR1uMMYp1xPeisGS6p
         Ynj4CUMWtsh8PFfJD3K2xNK4ArElpnPwIhvNOYQ4r2amdWIIfKC3jggzVuEOo7UL3PZN
         kArw==
X-Forwarded-Encrypted: i=1; AJvYcCXB7N76gLFr7kviIMXO0zd2TlYbf6TH0U2HH6VTw3h8c11+pq4mXJLZeJJpOT8us9TotXtCfZofxeAEV4mw@lists.linux.dev
X-Gm-Message-State: AOJu0YzK8RYsVT5nR5o+pgs5jFpY4fGbGOYRqdvGp753XUuOjG/SDjP7
	Hooxgvk414ILBt6DUpBb4dvYmSyH+kS7aLwvfWyuLo0qCIzsR9vq
X-Google-Smtp-Source: AGHT+IEF/Zm1DMZVZpX+ITdOiper6SsIl0DpHr22GnH7r6/Ax7JA/xHyyO/k5+GCFDEY9PsngeKE7Q==
X-Received: by 2002:a17:907:97ce:b0:a79:82c1:a5b2 with SMTP id a640c23a62f3a-a90293b1881mr1072358666b.9.1726382465378;
        Sat, 14 Sep 2024 23:41:05 -0700 (PDT)
Received: from kernel-710.speedport.ip (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610967bbsm160201066b.8.2024.09.14.23.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 23:41:05 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 13/17] staging: rtl8723bs: Remove unused function rtl8723bs_inirp_init
Date: Sun, 15 Sep 2024 08:38:27 +0200
Message-ID: <617f5fe59abf5f44c70566db60cc624e304c678f.1726339782.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1726339782.git.philipp.g.hortmann@gmail.com>
References: <cover.1726339782.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused function rtl8723bs_inirp_init and belonging unused
function pointer in struct hal_ops inirp_init.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 6 ------
 drivers/staging/rtl8723bs/include/hal_intf.h | 1 -
 2 files changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index d3aae413fc0f..93d455aabccf 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -937,11 +937,6 @@ static u32 rtl8723bs_hal_deinit(struct adapter *padapter)
 	return _SUCCESS;
 }
 
-static u32 rtl8723bs_inirp_init(struct adapter *padapter)
-{
-	return _SUCCESS;
-}
-
 static u32 rtl8723bs_inirp_deinit(struct adapter *padapter)
 {
 	return _SUCCESS;
@@ -1272,7 +1267,6 @@ void rtl8723bs_set_hal_ops(struct adapter *padapter)
 	pHalFunc->hal_init = &rtl8723bs_hal_init;
 	pHalFunc->hal_deinit = &rtl8723bs_hal_deinit;
 
-	pHalFunc->inirp_init = &rtl8723bs_inirp_init;
 	pHalFunc->inirp_deinit = &rtl8723bs_inirp_deinit;
 
 	pHalFunc->init_xmit_priv = &rtl8723bs_init_xmit_priv;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 73b6c4d199c3..0fc3622806a0 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -167,7 +167,6 @@ struct hal_ops {
 
 	void (*free_hal_data)(struct adapter *padapter);
 
-	u32 (*inirp_init)(struct adapter *padapter);
 	u32 (*inirp_deinit)(struct adapter *padapter);
 
 	s32	(*init_xmit_priv)(struct adapter *padapter);
-- 
2.43.0


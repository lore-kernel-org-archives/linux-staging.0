Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B2112C80F
	for <linux-staging@lists.linux.dev>; Sun, 15 Sep 2024 06:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726382469; cv=none; b=RCQhFzKpdtNktSnOtq6A1ijKeKkQcD6MwE+W5KBm+FMPmW3p0DF+RNkbnYsFiot3w5lw5q6UHC4wTK1+rx4iYgsMbgU0iYUkuqAadP2p4Biil7AYVet8WfL3Ni+JlBMji6pg5O9lR9BmybWZaGjfQ4s0j4cFBA2837XY/addZys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726382469; c=relaxed/simple;
	bh=Js4POPVp7tcPzGMNrSOimc33cvs8JgbNabVDIlLIGDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F5MhYC4dvao6JmDftiiSZdBAZ5UYvXyiNLxjkXxO5U7EQUJLIJZpzXm4mRan2BxUmkbFv7AdflATf4H1/PP6mt98EVFKC2KVqgBO9vznRVk7cu0dLc76lMiKTjixnHe46qiXL9TEykYwyxig2k4qa/GknZztw7AT7FDzMzJYlco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBT1m2E5; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBT1m2E5"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a8d3cde1103so464766866b.2
        for <linux-staging@lists.linux.dev>; Sat, 14 Sep 2024 23:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726382466; x=1726987266; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aghDyGl0md6PciwZ2vSqAUp9KqGz/7+l1dC8yB+1Yqw=;
        b=jBT1m2E57ymbKtHNaVEb/7Ud7Jn7n6nfIsxhuOySShxkO9jVsTWKCfYA7qSBTTKMS/
         8LMhJgDxhEZF16tWTyzyVUsszuqw8As55tjMhSoRFWCAUNqw1+AwfrfBZbM3Z3zhnI1v
         eYKWtWnl01zr5Rxc5pHMw8syKB1rnjLrGyfu6c6e5/SyrbbU+UT8k21F8CH/2Yedtinc
         UrhYRlS51CjUO4zzcVXldb14PAAqzPL4lA680X9EoKrYxyC0CymYGirKjfeIaeoEWH1z
         agOoXCS5u6gJA50YtzHAPDkymZyTadfAc9lvcg6LMaYbk5kQW2AHeDWqlZzHrlunEdP7
         Dv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726382466; x=1726987266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aghDyGl0md6PciwZ2vSqAUp9KqGz/7+l1dC8yB+1Yqw=;
        b=wqRyoXn1Qj/vREU6/8brmJU72m6IOA1RKGAKB+eG2wnBUMpi2XpECPIW7bORXSgP3f
         bNBSx0KhTpE022BeJeePOZAaqg96hzwHrmfVj6RHJ2gUV4fEJXBmzqGnHkoOjfAa+BSy
         WHovT9kuHWKH2NikDBVPDiO4fJX0rOFDBQACNcqp6EvYGJPlm4tVD//HKWrBguGwpIfN
         lQnasCoX6I2qMal+Tuh+h3A5oDA5Z/HGf/cALiTO2BXjSr+guZDu0dreJVY539KsOi0s
         iH7alAqlrqbyt/6SBr4Xaxq0Y9wIlr+NIQXTjDwEk8Wb2t6VQwXE3voIR52poFq1VeWS
         gmLA==
X-Forwarded-Encrypted: i=1; AJvYcCWpsN+PAjruZ/Kr3jtrO5yFaBgTGJyjAusGwSM75fRFCbl/ilXxCcrUzqv86k8yZ6MI5ZsWVBX2z6+wlDIz@lists.linux.dev
X-Gm-Message-State: AOJu0YxAGVjxvXzr62DnBJBQNzOlL+Tvhxg7OaTBmKoC11J3FkhhW0Pr
	HMEiqskMt2Hlgrh8Dw2PEUwNSzWUqqs83/h4mlQzCc1UFxc/U+ZH
X-Google-Smtp-Source: AGHT+IGUe6mOCXY/8tTVFtjgkN+PaIY7q6WDjNrztOo+eP2BuvEbj+IHGYSASnkGSSuGYMBK7sAl0w==
X-Received: by 2002:a17:907:7f92:b0:a8a:6e35:31ef with SMTP id a640c23a62f3a-a902961d872mr1323344866b.49.1726382466147;
        Sat, 14 Sep 2024 23:41:06 -0700 (PDT)
Received: from kernel-710.speedport.ip (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610967bbsm160201066b.8.2024.09.14.23.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 23:41:05 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 14/17] staging: rtl8723bs: Remove unused function rtl8723bs_inirp_deinit
Date: Sun, 15 Sep 2024 08:38:28 +0200
Message-ID: <dc6d35602d44cc676bebbd6d84733ea5420ac3f3.1726339782.git.philipp.g.hortmann@gmail.com>
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

Remove unused function rtl8723bs_inirp_deinit and belonging unused
function pointer in struct hal_ops inirp_deinit.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 7 -------
 drivers/staging/rtl8723bs/include/hal_intf.h | 2 --
 2 files changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 93d455aabccf..c54d6dc1a495 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -937,11 +937,6 @@ static u32 rtl8723bs_hal_deinit(struct adapter *padapter)
 	return _SUCCESS;
 }
 
-static u32 rtl8723bs_inirp_deinit(struct adapter *padapter)
-{
-	return _SUCCESS;
-}
-
 static void rtl8723bs_init_default_value(struct adapter *padapter)
 {
 	struct hal_com_data *pHalData;
@@ -1267,8 +1262,6 @@ void rtl8723bs_set_hal_ops(struct adapter *padapter)
 	pHalFunc->hal_init = &rtl8723bs_hal_init;
 	pHalFunc->hal_deinit = &rtl8723bs_hal_deinit;
 
-	pHalFunc->inirp_deinit = &rtl8723bs_inirp_deinit;
-
 	pHalFunc->init_xmit_priv = &rtl8723bs_init_xmit_priv;
 	pHalFunc->free_xmit_priv = &rtl8723bs_free_xmit_priv;
 
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 0fc3622806a0..d959be13fcf3 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -167,8 +167,6 @@ struct hal_ops {
 
 	void (*free_hal_data)(struct adapter *padapter);
 
-	u32 (*inirp_deinit)(struct adapter *padapter);
-
 	s32	(*init_xmit_priv)(struct adapter *padapter);
 	void (*free_xmit_priv)(struct adapter *padapter);
 
-- 
2.43.0


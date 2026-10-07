Received: from mail-wr2-f8.google.com (mail-wr2-f8.google.com [74.125.225.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053E0484896
	for <linux-staging@lists.linux.dev>; Wed,  7 Oct 2026 09:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364117; cv=none; b=N/9u77vYkjAaSvmXs9j/CcIVGkiSDz71mHa2+oQjHAZPhHe4vgJaGnC6A9GPYsKbCvkIPuAvNwqAZL9J1HalGtM60h9ZKRlO5RXzTouR29IIjTETyY7EDsqFhztMhFEpe9y+QTSMLGX/9SthnW2mAF84G5xp9ojPYDMzYv3nwc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364117; c=relaxed/simple;
	bh=Iml1QbnlqCsImldvUItgITZM4aMLyofyPCEAET/GTHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FOt9HqvYmd1sDQRzoUFhWNslbAvwIZf6HkiTzRsXCkKOdWRuXvuDuHcok7au1kagwdKDYK/bHRvElfjLu/1yNdsa5SE8xHrXFQsI/F+fkzs+UobCw5gjUPuMHCCqPbEZ7ncf1JMdVt66bk4HlTuEEi5QvCvDbxd3Ja4EBKKb958=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ewbfoHmA; arc=none smtp.client-ip=74.125.225.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ewbfoHmA"
Received: by mail-wr2-f8.google.com with SMTP id ffacd0b85a97d-48b007d7d2cso1245568f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 07 Oct 2026 02:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364082; x=1791968882; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=21GOvkqxxTWxzFp+iVaOLS/XH826C/MhWojUk88acI4=;
        b=ewbfoHmA/5IBfqetegV6nucw8h1xlOnDjei1hPaLmN0/HuGyyePIh7s2GedYUp1F4k
         0BX97PZcXybYFYbioe7pMvUFwTLYzxov176d4196VOamAPU6QviKxdS1Z2dZQwqsMgEv
         V5DHWcnFQ+jnyD4pjGhowQd+BWwr0PRKfO4qj3XQ2KivSo84W0Ltmhiug/QnGPzcwiZx
         y+2mMPK8WoN79LHeii35+GI/JQgm4b82JyqXnI6svs03JHF0rkVjQh4tXQeWa8QmS/F6
         tDu09nx+ELExzPeW0Oya373Q9MzODX3xQMM/6icNRXGqK6l4U2yAMQfWM+DTeaMK2FGC
         pQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364082; x=1791968882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=21GOvkqxxTWxzFp+iVaOLS/XH826C/MhWojUk88acI4=;
        b=SqutvVyekCiyoxG0/jN/IdA/lezMltIlQwwN5RYHcqm6DKtRXiwElMItUavYO6g5k7
         Caz/uCv6ioC0/nRzOb8zTIaK8lc5t5Q6RitG+Mo7wOILW5M18fv4fr44lLSvk6TAnuDD
         0VOeeRFDnTINm7cvChpWA+obL7MNo1g5g6kg297B3ZM3hqADMWvsx2+rBHCWU1K+h0nC
         BJPP+QPm1zplxA+Vj6HkItMZyKVbvjtHsix/XhPpD3pTKMb9HGZI1is/MMaE68y0bcwQ
         NCz6cG2qb03zelxYbhT+B/UylnJZCbicSRkSPcoW4YVhdMwG3G6HGtX9EcRlL5Znk2Ks
         xWsw==
X-Gm-Message-State: AFq9FYKgnBT6mPosj2+vhPP27HTL8XyksQBhVrp7/R8F2bAvF3Uu7MO0
	1Ro1c2TOsIpqFOTtbiNvmh8M7ESjJ3KEj9GSeCAY7Fn9+iFADcp9npG6
X-Gm-Gg: AYBFou0pC6aROidKkWLH+97kxc7mkHymHQOjl4mVIkL2/lPfdPFO/gHJNH+VOh+iftK
	TYT1zPb6ITuWwVlIxa/pLq3D4v1df/xa8oLAwn0Hh9KBA7+8p9c+7uGNh8sc+Y7M1iqyRzmL78z
	1bc9MVS5yAZeR3NafWWE7IH0VMx+BAtnRCVSQxFaVcWCTQxbTVN00rar30Q+vbycw1an5Rt1xWI
	ImUBHNnhRJzFl/UotWSEhhcnn0hF+dD+iEkzB/yan+1SHiqD0TC+zOEDikAeMt6AGIgS45R7b/x
	xMEy0yQaeaKOlN92bbacQAO1UaMpY4PktKjBxLghqc199lsWWGt8oDZ+zdOZ2d2KQzT/mNEJr85
	xl9kbVU8gHvPti0s7v7NcP6kxhEIhnBN+N+vqibM9DFb7KzXHxJjpPaV1qEl4ZCybsxhULeSFhi
	xvwCi9CFEs3DMi4PiT5PPDGLvcA5LNitPrwKGK8I6Tg4u1mPe90y8iO+lNB9Aob6uzSH8Tqs9T
X-Received: by 2002:adf:e19d:0:b0:48b:e50:715a with SMTP id ffacd0b85a97d-48c7277813fmr3024868f8f.34.1791364081889;
        Wed, 07 Oct 2026 02:08:01 -0700 (PDT)
Received: from fedora41 ([2a01:e0a:1058:7c30:e315:b955:cb8b:b86b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1f8fbsm3975319f8f.33.2026.10.07.02.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:08:01 -0700 (PDT)
From: Timo Joannin <timo.joannin@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	Jennifer Guo <guojy.bj@gmail.com>,
	Timo Joannin <timo.joannin@gmail.com>
Subject: [PATCH v4 1/2] staging: rtl8723bs: rename struct phy_status_rpt_8192cd_t to rtl8723bs_phy_status_rpt.
Date: Wed,  7 Oct 2026 11:07:35 +0200
Message-ID: <20261007090736.277636-2-timo.joannin@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007090736.277636-1-timo.joannin@gmail.com>
References: <20261007090736.277636-1-timo.joannin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct identifier references the 8192CD chip while being in a
rtl8723bs codebase. Additionally, the identifier uses the _t suffix,
while being generally reserved for typedef identifiers.

Rename the struct to rtl8723bs_phy_status_rpt
across the rtl8723bs codebase to accurately
reflect the driver and clean up the naming.

Signed-off-by: Timo Joannin <timo.joannin@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c | 3 ++-
 drivers/staging/rtl8723bs/hal/odm_HWConfig.h | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index 34b0369a7936..bf2479c01873 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -105,7 +105,8 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
 	bool is_cck_rate = false;
 	u8 rf_rx_num = 0;
 	u8 lna_idx, vga_idx;
-	struct phy_status_rpt_8192cd_t *phy_sta_rpt = (struct phy_status_rpt_8192cd_t *)phy_status;
+	struct rtl8723bs_phy_status_rpt *phy_sta_rpt =
+		(struct rtl8723bs_phy_status_rpt *)phy_status;
 
 	is_cck_rate = pkt_info->data_rate <= DESC_RATE11M;
 	phy_info->rx_mimo_signal_quality[RF_PATH_A] = -1;
diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.h b/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
index ca3380328a72..ae010cae9dd7 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
@@ -18,7 +18,7 @@ struct phy_rx_agc_info_t {
 	#endif
 };
 
-struct phy_status_rpt_8192cd_t {
+struct rtl8723bs_phy_status_rpt {
 	struct phy_rx_agc_info_t path_agc[2];
 	u8 ch_corr[2];
 	u8 cck_sig_qual_ofdm_pwdb_all;
-- 
2.55.0


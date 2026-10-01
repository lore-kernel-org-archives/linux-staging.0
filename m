Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FB5306744
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 12:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790857131; cv=none; b=GWT2nMLkuGqpKUK4vxnocH9pHCNwPVd741z1jYhu7GeuQvfyEqqmgZFq7lyeEXOiov7Z0BdfQAzS3P/Tlcuv4NHFFVPLYtucfnfbtXCUSjrdMZQ5bgXIf+lX4XSxL7Fdg/l6Epoz8ZNU+vSPhIKKL/8MKtvINjIWbUqPH5TrXBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790857131; c=relaxed/simple;
	bh=LTuUKUwyt+H3jOVW8uOyF0iXnofiu05F5aYxE4x56JY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RHGNjr14o/sIQaqnJx/rbkCpEz9Ur/IZ62QgF5TSslkz6t+V3QWSGLGPWOk6ke2Dk0fIk9bEXr83o8ZI+G00JO3F5VceDaOUcxACg2Z+jQAdPVSiaxqvJPT6Ytg6zyZTjizgZwoJXP4XrQFtoXxmtrj185chPMVswbGXEfUmnYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nM4g0XdI; arc=none smtp.client-ip=74.125.225.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nM4g0XdI"
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-49ff9833fedso9677425e9.0
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 05:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790857128; x=1791461928; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9lYiRSVWvklShJpagbSBUOBl9URBu27SZesu9eRVEis=;
        b=nM4g0XdIp+TS+WIJFoIht2uwv5Kw8MO8F7tHV6Cy6YNFQ4I1O4R9BNZhwjSN+wNmg9
         Vl8Y5fhc+umgNV2ow1YgERAnjRSaD+GoC0DO5rtBAuF0j9tBCpxRHRKTTK9mRMHbLfJ7
         r+gtsk/E4bHGRVcxZKB+den7d8bNDlQ3k1HxG2AU2wH9ewmMQa9uOBVQKKsNcYK2SJ6V
         jmuxbBxwN6OoRqGDARxpmOFqpHLptDKRgdKgmtDzcrijXU//9OIOIb15nUm11nGpMkJC
         692R6xiJutIPZ0U1oksfDepJTluU5/MnfJMqyqbr3KfPlI2fauyvR6a3iKIq8girVZMq
         Om2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790857128; x=1791461928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9lYiRSVWvklShJpagbSBUOBl9URBu27SZesu9eRVEis=;
        b=fx5ffSaelqjfwQgKpligO/dAUXZGz4FQQQbIQn7CJE5o4DzGwtShfkkF+kpDFIYPQm
         q2Ve8iYT1wL+yJqek8YoOH3dYhNACLVmr+NO1YeTnm0D3A0mzulXbKmfJp/ZhjkaMObW
         NKM6NWjmGSk+46VD4Jvjsmd4MlKXCQ5mlEBcB1YgPY+otFtmT7QT1WygzkOgi5xF8EFv
         rCvTCbYZHTQVLaUbl6ldbgplJXIRzPZgY1V1KqimTPLBpn5wwJKLp8Xowgd28AIY1ZPy
         xjfdKkR6p/lcQFyoNKNlqgafnfdu9H4Xouswjq99EjgdjtiFvuVm2/IdhGmAvY8AccJ9
         NYdw==
X-Forwarded-Encrypted: i=1; AKwUvBzSriJuPRvfXZfUN/zniKSxLdF8Btn3UQU4j1oCOPaz6z/LPQU5eFJUfO1mwQaDgaB8dJqWbP8A+vA7Xr/N@lists.linux.dev
X-Gm-Message-State: AFuF++m8O1w4VdPqD6IYPZHik2roLGFCm+7VHJqYF4Hh/Q/P0KUqnQS4
	frC1P4oPThhVzU9Ch7v74KpskDbYBoYw40NvQofPtNv2Ubty1LCNKLw8
X-Gm-Gg: AYBFou2b4KC/krRDNILshjc5Z5+yhZezmK6y9lvcNfCN1Dil/WBCKJ3wo6/Chi8E9Fk
	W0+yp9YvLqokPFIOGc5pPCzNovYrg/Eh1qLtL2u5Alo+BPHadE4QQQo01ESssdq08zsuMCMptzK
	LGsE11HC5y4verSLHKDENwTtI+PwcM559uuUDXwzO5W6uq7rq5pLTZYnR/RJCryyo7lRFQRNxB3
	1EFLG5IbIguIGkfgwTewDa2Pf0+PeAkJWYP6LsbE7oml7eanGYLLKCDZ/igA9QTseqPYl3B8S2n
	lqClMxW8SxO5VGvldTu7cj4MrH+SOvgc/h+wTEOOMj6N9cUnzIspaGWthYJfiKNnQaILKjf5epu
	CDnY0kl0g26cb71lMWK3zmeSEDc8a988GUvfL/J1CGUIGhpmiBq0pZpjCIyko/20rHs2izzoa9B
	nSiAynT0GLZvU3UoQnaloYQLPJ2xlz9jdgiK1YnAv013b3pnmR34jp8o7DzQ==
X-Received: by 2002:a05:600c:3486:b0:4a0:1723:2d8e with SMTP id 5b1f17b1804b1-4a01ad8daf1mr74719345e9.2.1790857128260;
        Thu, 01 Oct 2026 05:18:48 -0700 (PDT)
Received: from fedora41 ([2a01:e0a:1058:7c30:e315:b955:cb8b:b86b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f9634a9sm26772645e9.2.2026.10.01.05.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:18:47 -0700 (PDT)
From: Timo Joannin <timo.joannin@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jennifer Guo <guojy.bj@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	=?UTF-8?q?Michael=20Steinm=C3=B6tzger?= <m.steinmoetzger@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Atharv Margur <atharvmargur@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Timo Joannin <timo.joannin@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename phy_status_rpt_8192cd_t to rtl8723bs_phy_status_rpt.
Date: Thu,  1 Oct 2026 14:17:00 +0200
Message-ID: <20261001121700.143861-1-timo.joannin@gmail.com>
X-Mailer: git-send-email 2.55.0
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
across the rtl8723bs driver to accurately
reflect the codebase and clean up the naming.

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


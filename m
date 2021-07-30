Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283B170
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 09:24:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 38E5361008;
	Fri, 30 Jul 2021 09:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627637061;
	bh=77jKUheFdhc2Id3Q1Nk1ZnZGBKJC5c/XU+FUJFD9lDc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hq3E/Y1Z+1EIkbPT/lfjXYWYMbL1w7z6fATHTk2KfQZ9TCyLsfkjvAhTHeq5xQPE+
	 6Ttpt3+fGcLEBd1NmteodHLgfB+oUSpTxVcQ/em9PiVlNisYu3uOgBpvZJblWAZyPQ
	 o9Pu9axrHjLkXFhHd+/y2XtrLrxDPZztaK2PW1Hg=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-staging@lists.linux.dev
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 02/12] staging: r8188eu: move ODM_TARGET_CHNL_NUM_2G_5G
Date: Fri, 30 Jul 2021 11:24:07 +0200
Message-Id: <20210730092417.1014392-2-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210730092417.1014392-1-gregkh@linuxfoundation.org>
References: <20210730092417.1014392-1-gregkh@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1303; h=from:subject; bh=77jKUheFdhc2Id3Q1Nk1ZnZGBKJC5c/XU+FUJFD9lDc=; b=owGbwMvMwCRo6H6F97bub03G02pJDInMR+09/fcoas424c277vZ6fveHKB2hnJkS090uT116qLBb 4diyjlgWBkEmBlkxRZYv23iO7q84pOhlaHsaZg4rE8gQBi5OAZjIDjaG2WycO82ff8qr+pVgoylzvn S3dZj0fIZZTKbd0q7cLN0FeuzT//8x3xwQbDkXAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

The ODM_TARGET_CHNL_NUM_2G_5G define is only used in one place, so move
it to the .c file it is used in instead of being in a .h file.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/r8188eu/hal/HalPhyRf.c     | 2 ++
 drivers/staging/r8188eu/include/HalPhyRf.h | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/HalPhyRf.c b/drivers/staging/r8188eu/hal/HalPhyRf.c
index 1805fdfbad48..e5a58ee156b7 100644
--- a/drivers/staging/r8188eu/hal/HalPhyRf.c
+++ b/drivers/staging/r8188eu/hal/HalPhyRf.c
@@ -7,6 +7,8 @@
 /* 3 IQ Calibration */
 /* 3============================================================ */
 
+#define ODM_TARGET_CHNL_NUM_2G_5G	59
+
 u8 ODM_GetRightChnlPlaceforIQK(u8 chnl)
 {
 	u8	channel_all[ODM_TARGET_CHNL_NUM_2G_5G] = {
diff --git a/drivers/staging/r8188eu/include/HalPhyRf.h b/drivers/staging/r8188eu/include/HalPhyRf.h
index 54af312509a0..ba877eb7e801 100644
--- a/drivers/staging/r8188eu/include/HalPhyRf.h
+++ b/drivers/staging/r8188eu/include/HalPhyRf.h
@@ -4,8 +4,6 @@
 #ifndef __HAL_PHY_RF_H__
 #define __HAL_PHY_RF_H__
 
-#define ODM_TARGET_CHNL_NUM_2G_5G	59
-
 u8 ODM_GetRightChnlPlaceforIQK(u8 chnl);
 
 #endif	/*  #ifndef __HAL_PHY_RF_H__ */
-- 
2.32.0


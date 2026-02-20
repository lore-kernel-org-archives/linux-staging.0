Received: from mail.plaes.org (mail.plaes.org [188.166.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75842ECEA5
	for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 16:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.166.43.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771604663; cv=none; b=tluP/LmQcFetwMJusLFrldYqonSn7vl/Uyho2ozLAuW1CVFSma6FnIGKmdvkNuSjTWsJCbcJSYic1iuz6m7Vyk7QEybc/WT1L05lQHpPuYb3YVeb4XSY8GMlAXz6K9b4uDVF/yDM4oyY8zQ6fB4Z8JArpTtpHiQYdEDnLKOTZVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771604663; c=relaxed/simple;
	bh=0GmQG/QAyAotOhxi7KD0yK3QSunFpMDq9lrtEneRKy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zpps5jXm9RKTuoM/tseD4OH0NMop4txzOLdjCtuxXcbDNISjN+mjJPWIYaEy45anRaaHvgMJy2KFs7cvaNnrzXRDGh84ajfKkazSz+OlmYjSfeCqfnUODiK1ZfXZ5YDM12mL4TPFfLOHaUiipekC5zDbTxBTzdEf07g9sKr/7Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org; spf=pass smtp.mailfrom=plaes.org; dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b=Wr7DBEyk; arc=none smtp.client-ip=188.166.43.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plaes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b="Wr7DBEyk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=plaes.org; s=mail;
	t=1771604205; bh=0GmQG/QAyAotOhxi7KD0yK3QSunFpMDq9lrtEneRKy4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wr7DBEyk2b1D6KPgjMQgk6ldWxyBijUgv1tZQ5cv1LK59MTWLrzGvjcZVw32dO0//
	 z81IcQXA+56WTTUa12Kb8guHKjh8rwOgIrr3VSiLOFgjWayx81uOX8UXaqXL458Wdd
	 6ttP/4u3DLdzM+Ip32phFT+NrASHXJRjuR4PsSGHFvEMKtr0QAP/CljUSXBNXyl9du
	 TCAdnzfnEzHngWQlq2Jyn00Fx0rL3hZTzqhiMiFlvQBh0LEKEVE6gl5KlrXKWqq2/a
	 Q9tYC3U3aGJb/FItRxCULvDWpiC0GWn57Of0P+N6wZXd5fVACNx7OOPE3NgacBl5Tk
	 FpHoqlSMGUxDA==
Received: from localhost (0b7f-0000-0000-0000-6400-8cb1-07d0-2001.dyn.estpak.ee [IPv6:2001:7d0:8cb1:6400::b7f])
	by mail.plaes.org (Postfix) with ESMTPSA id CF95B401E3;
	Fri, 20 Feb 2026 16:16:44 +0000 (UTC)
From: Priit Laes <plaes@plaes.org>
To: 
Cc: Priit Laes <plaes@plaes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Minu Jin <s9430939@naver.com>,
	Erick Karanja <karanja99erick@gmail.com>,
	SeungJu Cheon <suunj1331@gmail.com>,
	Akiyoshi Kurita <weibu@redadmin.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Sun Jian <sun.jian.kdev@gmail.com>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] staging: stl8723bs: Use common round_up macro
Date: Fri, 20 Feb 2026 18:15:12 +0200
Message-ID: <20260220161611.2398915-2-plaes@plaes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220161611.2398915-1-plaes@plaes.org>
References: <20260220161611.2398915-1-plaes@plaes.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Priit Laes <plaes@plaes.org>
---
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 6 +++---
 drivers/staging/rtl8723bs/hal/sdio_ops.c          | 4 ++--
 drivers/staging/rtl8723bs/include/osdep_service.h | 2 --
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index a1f2cbf2cf55..c5b172c2f839 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -232,7 +232,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 				/*  check xmit_buf size enough or not */
 				txlen = txdesc_size + rtw_wlan_pkt_size(pxmitframe);
 				if (!pxmitbuf ||
-					((_RND(pxmitbuf->len, 8) + txlen) > max_xmit_len) ||
+					((round_up(pxmitbuf->len, 8) + txlen) > max_xmit_len) ||
 					(k >= (rtw_hal_sdio_max_txoqt_free_space(padapter) - 1))
 				) {
 					if (pxmitbuf) {
@@ -303,8 +303,8 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 					txlen = txdesc_size + pxmitframe->attrib.last_txcmdsz;
 					pxmitframe->pg_num = (txlen + 127) / 128;
 					pxmitbuf->pg_num += (txlen + 127) / 128;
-					pxmitbuf->ptail += _RND(txlen, 8); /*  round to 8 bytes alignment */
-					pxmitbuf->len = _RND(pxmitbuf->len, 8) + txlen;
+					pxmitbuf->ptail += round_up(txlen, 8);
+					pxmitbuf->len = round_up(pxmitbuf->len, 8) + txlen;
 				}
 
 				if (k != 1)
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index c9cb20c61a2b..6bfb8c0e519c 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -401,7 +401,7 @@ static u32 sdio_read_port(
 	hal_sdio_get_cmd_addr_8723b(adapter, addr, hal->SdioRxFIFOCnt++, &addr);
 
 	if (cnt > psdio->block_transfer_len)
-		cnt = _RND(cnt, psdio->block_transfer_len);
+		cnt = round_up(cnt, psdio->block_transfer_len);
 
 	err = _sd_read(intfhdl, addr, cnt, mem);
 
@@ -448,7 +448,7 @@ static u32 sdio_write_port(
 	hal_sdio_get_cmd_addr_8723b(adapter, addr, cnt >> 2, &addr);
 
 	if (cnt > psdio->block_transfer_len)
-		cnt = _RND(cnt, psdio->block_transfer_len);
+		cnt = round_up(cnt, psdio->block_transfer_len);
 
 	err = sd_write(intfhdl, addr, cnt, xmitbuf->pdata);
 
diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index 955e8678dc26..404f81756b27 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -78,8 +78,6 @@ static inline int rtw_bug_check(void *parg1, void *parg2, void *parg3, void *par
 
 }
 
-#define _RND(sz, r) ((((sz)+((r)-1))/(r))*(r))
-
 extern void rtw_free_netdev(struct net_device *netdev);
 
 /* Macros for handling unaligned memory accesses */
-- 
2.53.0


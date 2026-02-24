Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC71F3A0EAA
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 13:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771939706; cv=none; b=gPk/3jcDvpE9rwIGTZyrd/uZY8gWu6+atOr3YnwOliUuchJdNiXHChA/vqrJABh1abmEGiFCeroDEWdlzZfUTcFe8a7mrW00HTGZPbDfERwjeJFgr6Huc2AkLxoYJKzarxo1qHGtFmK+Kd4qC1y+UkeNEZVIOOHmmusq5/fr2GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771939706; c=relaxed/simple;
	bh=XK5nQdqlPNAFuMYLdcvNYmUlEpDJCoVy1mqJmD/9NZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ac/4FLb9GevnXoiY6UisFRsgcX5RXmvtFz2jKSzAWMIEYW6Am/j32ThPhQuavNerD9ULf4ndTRV3arqGbVXclLKe5J060x83WbSDjr4dqp+Dh9jSnnjcAkeXkF1irWAHhv1G9O9AWM+PKufWmOtihL3IkDqcsdsh9V29wHGm+Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=n8Ll2leF; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="n8Ll2leF"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771939701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dYHCUMdjbtmBbPxy9Xp4vMy+d/1ymWrdxLKSgo5weyc=;
	b=n8Ll2leFkLin5VzDPGFBhTIQ7cpol/ene7odteW7A6Wji6jXn4mc5g+TI8ZXD5TiSkNaRn
	NcDlTzOhh4snimI2U+GPXVZr5vcKVN3pX/uzy1o5pQGhSK35vUmRHbC1lBy/q6xnDPQysr
	A69xBgsMRfwlL6wSHZMAV/npCf00fuQ=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH 16/21] staging: rtl8723bs: os_dep: fix various line length overflows
Date: Tue, 24 Feb 2026 14:27:43 +0100
Message-ID: <20260224132748.12336-17-luka.gejak@linux.dev>
In-Reply-To: <20260224132748.12336-1-luka.gejak@linux.dev>
References: <20260224132748.12336-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Luka Gejak <luka.gejak@linux.dev>

Fix lines exceeding 100 characters in os_intfs.c, sdio_intf.c, and
xmit_linux.c to comply with kernel coding style.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 17 +++++++++++------
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  |  3 ++-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c |  8 ++++++--
 3 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 21a0c3cf4c31..89a8bfce9c08 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -71,9 +71,11 @@ int rtw_ht_enable = 1;
  * 0x01 means enable 2.4G 40MHz
  */
 static int rtw_bw_mode = 0x01;
-static int rtw_ampdu_enable = 1;/* for enable tx_ampdu ,0: disable, 0x1:enable (but wifi_spec should be 0), 0x2: force enable (don't care wifi_spec) */
+/* for enable tx_ampdu: 0=disable, 0x1=enable (wifi_spec=0), 0x2=force enable */
+static int rtw_ampdu_enable = 1;
 static int rtw_rx_stbc = 1;/*  0: disable, 1:enable 2.4g */
-static int rtw_ampdu_amsdu;/*  0: disabled, 1:enabled, 2:auto . There is an IOT issu with DLINK DIR-629 when the flag turn on */
+/* 0: disabled, 1:enabled, 2:auto. IOT issue with DLINK DIR-629 when on */
+static int rtw_ampdu_amsdu;
 /*  Short GI support Bit Map */
 /*  BIT0 - 20MHz, 0: non-support, 1: support */
 /*  BIT1 - 40MHz, 0: non-support, 1: support */
@@ -98,7 +100,8 @@ module_param(rtw_ant_num, int, 0644);
 MODULE_PARM_DESC(rtw_ant_num, "Antenna number setting");
 
 static int rtw_antdiv_cfg = 1; /*  0:OFF , 1:ON, 2:decide by Efuse config */
-static int rtw_antdiv_type; /* 0:decide by efuse  1: for 88EE, 1Tx and 1RxCG are diversity.(2 Ant with SPDT), 2:  for 88EE, 1Tx and 2Rx are diversity.(2 Ant, Tx and RxCG are both on aux port, RxCS is on main port), 3: for 88EE, 1Tx and 1RxCG are fixed.(1Ant, Tx and RxCG are both on aux port) */
+/* 0:efuse, 1:1Tx/1RxCG diversity(2Ant+SPDT), 2:1Tx/2Rx diversity, 3:fixed */
+static int rtw_antdiv_type;
 
 static int rtw_hw_wps_pbc;
 
@@ -1144,9 +1147,11 @@ static int rtw_resume_process_normal(struct adapter *padapter)
 	}
 	rtw_hal_disable_interrupt(padapter);
 	/* if (sdio_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS) */
-	if ((padapter->intf_alloc_irq) && (padapter->intf_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS)) {
-		ret = -1;
-		goto exit;
+	if (padapter->intf_alloc_irq) {
+		if (padapter->intf_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS) {
+			ret = -1;
+			goto exit;
+		}
 	}
 
 	rtw_reset_drv_sw(padapter);
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d664e254912c..627be22c6033 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -222,7 +222,8 @@ static void sd_intf_stop(struct adapter *padapter)
 }
 
 
-static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct sdio_device_id  *pdid)
+static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj,
+					 const struct sdio_device_id *pdid)
 {
 	int status = _FAIL;
 	struct net_device *pnetdev;
diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 0be3143fffe5..3944ac60d2ca 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -46,7 +46,9 @@ signed int rtw_endofpktfile(struct pkt_file *pfile)
 	return false;
 }
 
-int rtw_os_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf *pxmitbuf, u32 alloc_sz, u8 flag)
+int rtw_os_xmit_resource_alloc(struct adapter *padapter,
+			       struct xmit_buf *pxmitbuf,
+			       u32 alloc_sz, u8 flag)
 {
 	if (alloc_sz > 0) {
 		pxmitbuf->pallocated_buf = kzalloc(alloc_sz, GFP_KERNEL);
@@ -59,7 +61,9 @@ int rtw_os_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf *pxmitb
 	return _SUCCESS;
 }
 
-void rtw_os_xmit_resource_free(struct adapter *padapter, struct xmit_buf *pxmitbuf, u32 free_sz, u8 flag)
+void rtw_os_xmit_resource_free(struct adapter *padapter,
+			       struct xmit_buf *pxmitbuf,
+			       u32 free_sz, u8 flag)
 {
 	if (free_sz > 0)
 		kfree(pxmitbuf->pallocated_buf);
-- 
2.53.0


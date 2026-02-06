Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F8634A3AC
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 07:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770364528; cv=none; b=TdQ4sBu+wDkj8yNvTMmZnnp0oAGd0Zfoor4r1WHxn7gwoqc8PNylg32sbjpMv45QaO0V0derxSKH95QQj0N6v2mlJm/a+2Fc390cA2+5+VonjIgPzOQNhZ/BUafCDnH+esInpGLO/wWVifRMuwdmTAiqSYqkjejiiGSxNKU2ip4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770364528; c=relaxed/simple;
	bh=PPUCxe1XwtLvTin/TfPGeQSRVukS3ycDpGkaV3iZPNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kKRBC7rAmt5EUXvoxZFZcfxcqIpDOJ5Eu81wxNYqxJZ2lV4rWt7Kq5ybGQiz41vz6qfZ6Wdt1ALidSLOHrB6fy803EE3XrKPbBRKe71rj2XyD9UmzmtAneTR9fGlCD8cpXI32VKTBCMGYedlz7aAvJ45M8fv6cx9Xhr3U107iHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XL33cK93; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XL33cK93"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-432da746749so1156528f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 23:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770364526; x=1770969326; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PeYs5LKTBpw4rSzahLNViruDYbvC6GqI7bBYFm9eFhk=;
        b=XL33cK93b4lDYFrglTVI4IdXguEEeGgA5OD8ttPJz8otdBVUNJMdbw2S6k22epRyUO
         mTTEzHDOohdfZCD777neUn2VeGwrFM9E0wpItIGy2U26almaoRkCh4m777NgloBWKOFI
         Ms6dNhzdvb41eOwH4vTjQdAC+eRC4MVOxs3ZM+23kamUroqDEBNM2lC5K2Tft7DNyjNF
         v9jI6PmM183iHJXC5u/fZJgYZDWjxOCP+dhEN/12fgiSBs3hnLiZkvpG5MfxEiYN65NI
         ORpMdTc7LDIIa0rA+BpFYAB8GUFmtVd0pxOuve872O26WenJyEIPzq+E8m7qKgLjqpcg
         GYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770364526; x=1770969326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PeYs5LKTBpw4rSzahLNViruDYbvC6GqI7bBYFm9eFhk=;
        b=NLiJ6IRyk42E5FOxnvafwGrFS5s5kTbsVSFzCHReeRZao0bnajPqPkhkSeNbG4VIbF
         bw2u3iyes5qCdy5ebpXsrASmxL2+0hjqLspDq8ZPtJclibyETDkkk/iIDhfG+MuXcyU6
         sylPV4CuU98s7haZphi4w4mtetJhCCduSMUVOhoSH+QhCaKhUpKgkgGVa7GlWDMhRTHh
         bPHnxzs5BsRYscC6kOi6PtQnTRgBj26oPhFNGqNFZr+B9X9EVPXuSj4U352foKzPMutC
         Vxd0J6/Xc7zwANFIgFR75LPAUGWspxoiRAZ14Zv9KqJL00iwrI86tO78NCy6qN2032Gh
         qyFw==
X-Forwarded-Encrypted: i=1; AJvYcCVrJ8WQfzWW0xgSp11CQtPnqu6cPradbvVyrHsOP8sSorlwnOcQ2b2GfezCYSzlhJsGWulJv17bNVfTjMF1@lists.linux.dev
X-Gm-Message-State: AOJu0Yyf61xbpM5zp3VMZ+oOHc1D9RSkQSNZv27IB6RUf329OMa4OWr+
	afSdrPT1SWv4XxowbH2uqVK+D7TDGKf7XvW74+iI7EQ3YfWFNDJufxzOiNlpK0Y=
X-Gm-Gg: AZuq6aJa1CgC4Y1mb6cYbCzfUSWyoPTMl9Si4vsulFRux5UTjjkn5PS3ZYbQ4P9pYfl
	0z8UoEGJY1hZDYjjLYLbSCLqwMquixJjClDBUHua9pcTmnELeC9h6lNNs/nzvBHp3XGpvi8RS8X
	+hN3mFi+Jff+H3eDHJrUzo+PqFhG+M70n7A8iqjZDI3aHBjhgpCA9T1hty04EcE47LW2L7v5HEJ
	TXFaX7XiXxRACI1T9lJEj+Kl2WdW8S2QKCLz1ZUlQ6+fqWgmZMJUHW/nEaS9VO8Zrq0yRZqZJRW
	nqQpQ7onRu5MWImPiuGX628WAHfXk5f4HtC0CCnc6F0LnUPeqQYvceYz0yCkrfCOyZPaIuv/Jmc
	gNAGsk5XOqn1o14SH9g5rRnKi+EguG0SYakSc7VFhv2edSWRSq73GIFSmhGG9lzuyBDtaOIeZOy
	iS0gi6n8e2ijcupRkp41P3MqDGf76IhhlBFycnAAJa6aCca56fzjken/SDrQdTHLU=
X-Received: by 2002:a05:6000:1889:b0:430:f790:99d7 with SMTP id ffacd0b85a97d-4362965faffmr2825615f8f.27.1770364526351;
        Thu, 05 Feb 2026 23:55:26 -0800 (PST)
Received: from LGPC ([31.223.131.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd3b8sm3836039f8f.11.2026.02.05.23.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 23:55:25 -0800 (PST)
From: lukagejak5@gmail.com
X-Google-Original-From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v2 21/26] staging: rtl8723bs: os_dep: fix various line length overflows
Date: Fri,  6 Feb 2026 08:54:34 +0100
Message-ID: <20260206075439.103287-22-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206075439.103287-1-luka.gejak@linux.dev>
References: <20260206075439.103287-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
index f7f23d1b1709..0e94fe8d0346 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -70,9 +70,11 @@ int rtw_ht_enable = 1;
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
@@ -97,7 +99,8 @@ module_param(rtw_ant_num, int, 0644);
 MODULE_PARM_DESC(rtw_ant_num, "Antenna number setting");
 
 static int rtw_antdiv_cfg = 1; /*  0:OFF , 1:ON, 2:decide by Efuse config */
-static int rtw_antdiv_type; /* 0:decide by efuse  1: for 88EE, 1Tx and 1RxCG are diversity.(2 Ant with SPDT), 2:  for 88EE, 1Tx and 2Rx are diversity.(2 Ant, Tx and RxCG are both on aux port, RxCS is on main port), 3: for 88EE, 1Tx and 1RxCG are fixed.(1Ant, Tx and RxCG are both on aux port) */
+/* 0:efuse, 1:1Tx/1RxCG diversity(2Ant+SPDT), 2:1Tx/2Rx diversity, 3:fixed */
+static int rtw_antdiv_type;
 
 static int rtw_hw_wps_pbc;
 
@@ -1142,9 +1145,11 @@ static int rtw_resume_process_normal(struct adapter *padapter)
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
index dc787954126f..9dcd2379909a 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -237,7 +237,8 @@ static void sd_intf_stop(struct adapter *padapter)
 }
 
 
-static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct sdio_device_id  *pdid)
+static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj,
+					 const struct sdio_device_id *pdid)
 {
 	int status = _FAIL;
 	struct net_device *pnetdev;
diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 944b9c724b32..69e0407e780b 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -43,7 +43,9 @@ signed int rtw_endofpktfile(struct pkt_file *pfile)
 	return false;
 }
 
-int rtw_os_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf *pxmitbuf, u32 alloc_sz, u8 flag)
+int rtw_os_xmit_resource_alloc(struct adapter *padapter,
+			       struct xmit_buf *pxmitbuf,
+			       u32 alloc_sz, u8 flag)
 {
 	if (alloc_sz > 0) {
 		pxmitbuf->pallocated_buf = rtw_zmalloc(alloc_sz);
@@ -56,7 +58,9 @@ int rtw_os_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf *pxmitb
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
2.52.0


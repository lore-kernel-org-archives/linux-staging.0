Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116324C0415
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119880; cv=none; b=TPoRoB8jr0mPIjjRnyzrDVd9Vgcs8/QVPAJa2BEcHXc4Qz4PmZASmsNCR/Nf2x3dQdF+j+URo9fsoP+owmHVZ9eLACa3pQ6IzHB5i8RQM3gQWX9hJKZuUHzrzfQHsopMGiLcCNTK9t9aeTY2d8ZIvuMvgA4ohH0xj37MPryqu6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119880; c=relaxed/simple;
	bh=nzV9Ce+SC2Jvi0Vo/pIxDenZi8/RhTAMn2nRayZff1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SSWxoNMaQ/zRI0UCu3HUG+PkfwwjoD/bSyw6tnZ4I15bJ2qE4EDz6AkqqWuTUnDpnHr/esaf5IrQDy7dboJSBtrDDRe0EbCf0e5vvNEXzPSDf/d7haABtKdISFkWHmC9C70DKx5R7k+8Bv7EW4vmudmNwscIxbpWP4tG+tMuOZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWyBavG6; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWyBavG6"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aea0fff535so2260716e87.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119865; x=1784724665; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Y8Q8h6hkHXG1Mppemncd0CjDI9ldk0KPs75Hl1V2N4=;
        b=jWyBavG6xzHSf5etnVGmVfVvKSDkNV1M0fc43FC35q3Urhk+YxB0JJgbu+EfdlqMjN
         r2Q0JnkAuTc94qUA18Mqu0kNq4cvXgXTnJbkaeETzMDlgogV7nyoLURwAFCH+dUUFqmO
         nLSxvlTFYQiL8OMcowtBZiWTLBh9APV0J/4a6BawaUhqQXxIDDCOhKRIbfF1ppwQboZO
         421K0oTt/X69QJTWfnDo3M7uK1zTgARrJvl1YimCE9cLRYRWY1NaqNwdQ23AaOZt4cpc
         /kzZH22kf9lb9E5ynxjM7w/fx2n09+MadXqWSnnU8d/UPrX7uX3znHDZJpaPHgsuOQPN
         YzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119865; x=1784724665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Y8Q8h6hkHXG1Mppemncd0CjDI9ldk0KPs75Hl1V2N4=;
        b=cT4+RacWQikkERmvJVVWvWoTb3A5mU+yCjsqCo9Aebw91zH5j48t3F5Z1FHd/ufbhU
         kUBmZ1FVWIZu269Bd/GPkIDTB27JtqF2XYFzz3OI13OrMm0MWNpnMP2drxNL/7RBawNe
         Un+RY7QhvJgkb9uPD/ulEF1iuMW0JI9JqsArYN9kGjmS0RiNLAUDXEwZdT15M69epULC
         DnW+jEw9TupynQvpq1jaCRXFzo2fPo9BehWAxDpkvcmu90ECAlEF1MSaxZQAxM591G6E
         J0arU4l/7hv9XYD8i+MPOj0SdKPR8pHOLETPRbhoiwdttfQJFi7vE3HebT+TqblkuUpE
         FbYg==
X-Gm-Message-State: AOJu0YzDSciKzf7nrcVzm5Js4ylccnFPbrmMQPBdAgHEYrVthHS7j7QI
	Nu0P5uIbKRTrm2RpJiNylmIAKzbVda0m8SH9RvCH8hsqGdr3dh6DlJxe
X-Gm-Gg: AfdE7clXT6itdGICH4U43wdOfYIhOlDPH7+J9TfsMiJVpJMlA0wZFTSEnEEthbiTEJd
	PFJEogscza9RTcy4TsAArphQrhCX4HlIGtQvHKtsKJNRrBljCw1TVOqg9vcgxRVKmU3DhuqFTaq
	yNSOQL1oCyj7aOWtvukOpElegLQroMo21DWKZtj0wEE2XCAFjURLXxhQ694mxlHpSgmac2rmQzJ
	GLtcEyqQ9X/KkuYw6OWXmdgRAnsBAv8qbinxq/3qtcpNPGSdfe0pZGok9LX9foQKoOIXjebAW/0
	1mmjWJ5svMc1vRVMkCWBbsKY2hiDZNzOyKoa050bSBkofE6qZC8BjYocwXY14rRdxy7aXMGm/XZ
	6+Fg3E4Z0mnTVI6Oq2wRfpD/qPaKiD0zSqZ/egJZJSFcU8P3ma6Vp7JwYidcAa1x7C3DTWRDpjt
	xYCPwPdTuvxBqDhTnAdXEJPkZ0MIsDE4INdYdbumxwV6G44cyuK9m+bjhYyYjheeV7TzwzuqY4M
	YB1DKm+gFLROA==
X-Received: by 2002:a05:6512:2526:b0:5ae:b86b:71f0 with SMTP id 2adb3069b0e04-5b0236999c5mr4097798e87.37.1784119864525;
        Wed, 15 Jul 2026 05:51:04 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:51:04 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 58/61] staging: rtl8723bs: extend rtw_hal_mgnt_xmit functionality
Date: Wed, 15 Jul 2026 19:48:26 +0700
Message-ID: <20260715124829.90290-59-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend rtw_hal_mgnt_xmit to extract RA/TA MAC addresses from the
802.11 header before transmission.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 10 ----------
 drivers/staging/rtl8723bs/hal/hal_intf.c         | 11 ++++++-----
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h |  1 -
 drivers/staging/rtl8723bs/include/rtw_xmit.h     |  1 +
 4 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 1fab3e829..fcf33c956 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1916,16 +1916,6 @@ void update_mgntframe_attrib(struct adapter *padapter, struct pkt_attrib *pattri
 	pattrib->mbssid = 0;
 }
 
-void update_mgntframe_attrib_addr(struct adapter *padapter, struct xmit_frame *pmgntframe)
-{
-	u8 *pframe;
-	struct pkt_attrib	*pattrib = &pmgntframe->attrib;
-
-	pframe = (u8 *)(pmgntframe->buf_addr) + TXDESC_OFFSET;
-
-	memcpy(pattrib->ra, GetAddr1Ptr(pframe), ETH_ALEN);
-	memcpy(pattrib->ta, GetAddr2Ptr(pframe), ETH_ALEN);
-}
 
 void dump_mgntframe(struct adapter *padapter, struct xmit_frame *pmgntframe)
 {
diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 9bb1fba5c..7cf5128e7 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -256,15 +256,16 @@ s32	rtw_hal_xmit(struct adapter *padapter, struct xmit_frame *pxmitframe)
  */
 s32	rtw_hal_mgnt_xmit(struct adapter *padapter, struct xmit_frame *pmgntframe)
 {
-	update_mgntframe_attrib_addr(padapter, pmgntframe);
-	/* pframe = (u8 *)(pmgntframe->buf_addr) + TXDESC_OFFSET; */
-	/* pwlanhdr = (struct rtw_ieee80211_hdr *)pframe; */
-	/* memcpy(pmgntframe->attrib.ra, pwlanhdr->addr1, ETH_ALEN); */
+	struct pkt_attrib *pattrib = &pmgntframe->attrib;
+
+	u8 *pframe = (u8 *)(pmgntframe->buf_addr) + TXDESC_OFFSET;
+
+	memcpy(pattrib->ra, GetAddr1Ptr(pframe), ETH_ALEN);
+	memcpy(pattrib->ta, GetAddr2Ptr(pframe), ETH_ALEN);
 
 	if (padapter->securitypriv.binstallBIPkey) {
 		if (is_multicast_ether_addr(pmgntframe->attrib.ra)) {
 			pmgntframe->attrib.encrypt = _BIP_;
-			/* pmgntframe->attrib.bswenc = true; */
 		} else {
 			pmgntframe->attrib.encrypt = _AES_;
 			pmgntframe->attrib.bswenc = true;
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 3d1126740..7a1c90c71 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -524,7 +524,6 @@ extern u8 set_tx_beacon_cmd(struct adapter *padapter);
 unsigned int setup_beacon_frame(struct adapter *padapter, unsigned char *beacon_frame);
 void update_mgnt_tx_rate(struct adapter *padapter, u8 rate);
 void update_mgntframe_attrib(struct adapter *padapter, struct pkt_attrib *pattrib);
-void update_mgntframe_attrib_addr(struct adapter *padapter, struct xmit_frame *pmgntframe);
 void dump_mgntframe(struct adapter *padapter, struct xmit_frame *pmgntframe);
 s32 dump_mgntframe_and_wait(struct adapter *padapter, struct xmit_frame *pmgntframe, int timeout_ms);
 s32 dump_mgntframe_and_wait_ack(struct adapter *padapter, struct xmit_frame *pmgntframe);
diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index f85a03efe..41a04e3b0 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -213,6 +213,7 @@ void rtw_sctx_init(struct submit_ctx *sctx, int timeout_ms);
 int rtw_sctx_wait(struct submit_ctx *sctx);
 void rtw_sctx_done_err(struct submit_ctx **sctx, int status);
 
+
 struct xmit_buf {
 	struct list_head	list;
 
-- 
2.55.0


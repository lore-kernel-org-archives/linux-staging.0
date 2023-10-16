Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721DF23775;
	Mon, 16 Oct 2023 11:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qc8D2YG8"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-507a936f4a9so1460048e87.1;
        Mon, 16 Oct 2023 04:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697456133; x=1698060933; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lyKxdiQOm+Lo3Lu3u7Gs3LczlTMbQv2V0jRPZ5mmpFE=;
        b=Qc8D2YG8bb1pQbnRe7skctBzE/khhzAV2gLpkjFoLDO5L5hHL1fYSi6IaZEsVkHDwC
         pac6l9kFoiKGC//fxVsGfiN51k2mVMKM8eO6NH/g/msC75iaoQEVLP9MyF2ydOCky8J0
         gFon3s1sW676s9rWx+3lGc37q3BGBrNgqoHi2fmXKn02I6XzMBGQy70TAwwN664Vf+rH
         dFwfIG1ElGpAC3AS1sdOkgRK1C+O2SPW/9jLEaOmHWCbrWLLE/DGQfE4zGb8QzufB7ab
         fAyHdxy3SIAvWgwpEZZVcb3BLyjiKaOoq9xoqPBPgMjlKXoKXyXYBhpCTyAkbMXnlmhn
         Y+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697456133; x=1698060933;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lyKxdiQOm+Lo3Lu3u7Gs3LczlTMbQv2V0jRPZ5mmpFE=;
        b=ijUW0UfVA95qOba/mES37pN612t239fehh+3iYqD/Vhzx1YZ17/oLGJQKVqI/rvdYb
         2B3rDfjWpruzVYapkxiZ158QP2ycEjb0IOyjfowxsDjcVqxB/KlLgcF65CohzvGtloVV
         IztCEV1EFTUNAO4zhEf4I4CxEHx7bdrdY4b4ckzVs82WgAUGoJVsAc5tAkxsJd+sqG8b
         g2k9a9J8Nb9pgabc4t6qJUSPJYXyDrfrwis/ejR0mh9t7elGt5KWg7Mz8Muwnyv84g0h
         +vtiwmnnqhz9w5LXurxut80xNlYmP2R8QF9nq/v6gCQy4pe73fjh5PeZwbdB36w0K8y9
         560w==
X-Gm-Message-State: AOJu0Yx4UwEa9k+ZlSRLxv+vw72PSNnVMXjSXS/wBK43A3SmmvOj5Pta
	QokLbtA/clOKHiiAeTZ3trg7FCiz/LFHr92P
X-Google-Smtp-Source: AGHT+IHdjPYzzec8MZJc/6vlrrQFDHieTJMBAVwF6D9Iv2GbZTRlswDySA/B0DW4Q4MajnF/SOA5KQ==
X-Received: by 2002:a05:6512:3604:b0:503:9a4:26f7 with SMTP id f4-20020a056512360400b0050309a426f7mr24368265lfs.40.1697456132702;
        Mon, 16 Oct 2023 04:35:32 -0700 (PDT)
Received: from gilbert-PC ([105.112.31.148])
        by smtp.gmail.com with ESMTPSA id ay15-20020a05600c1e0f00b004063977eccesm6975714wmb.42.2023.10.16.04.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 04:35:30 -0700 (PDT)
Date: Mon, 16 Oct 2023 12:35:23 +0100
From: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
To: outreachy@lists.linux.dev, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: emxx_udc: Remove unnecessary parentheses around
 condition tests
Message-ID: <ZS0f+xaaLmLpKv2a@gilbert-PC>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix 47 warnings detected by checkpatch.pl about unnecessary parenthesis
around condition tests.

Signed-off-by: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
---
 drivers/staging/emxx_udc/emxx_udc.c | 72 ++++++++++++++---------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/drivers/staging/emxx_udc/emxx_udc.c b/drivers/staging/emxx_udc/emxx_udc.c
index eb63daaca702..e8ddd691b788 100644
--- a/drivers/staging/emxx_udc/emxx_udc.c
+++ b/drivers/staging/emxx_udc/emxx_udc.c
@@ -149,8 +149,8 @@ static void _nbu2ss_ep0_complete(struct usb_ep *_ep, struct usb_request *_req)
 			/* SET_FEATURE */
 			recipient = (u8)(p_ctrl->bRequestType & USB_RECIP_MASK);
 			selector  = le16_to_cpu(p_ctrl->wValue);
-			if ((recipient == USB_RECIP_DEVICE) &&
-			    (selector == USB_DEVICE_TEST_MODE)) {
+			if (recipient == USB_RECIP_DEVICE &&
+			    selector == USB_DEVICE_TEST_MODE) {
 				wIndex = le16_to_cpu(p_ctrl->wIndex);
 				test_mode = (u32)(wIndex >> 8);
 				_nbu2ss_set_test_mode(udc, test_mode);
@@ -287,7 +287,7 @@ static int _nbu2ss_epn_exit(struct nbu2ss_udc *udc, struct nbu2ss_ep *ep)
 	u32		num;
 	u32		data;
 
-	if ((ep->epnum == 0) || (udc->vbus_active == 0))
+	if (ep->epnum == 0 || udc->vbus_active == 0)
 		return	-EINVAL;
 
 	num = ep->epnum - 1;
@@ -336,7 +336,7 @@ static void _nbu2ss_ep_dma_init(struct nbu2ss_udc *udc, struct nbu2ss_ep *ep)
 	u32		data;
 
 	data = _nbu2ss_readl(&udc->p_regs->USBSSCONF);
-	if (((ep->epnum == 0) || (data & (1 << ep->epnum)) == 0))
+	if (ep->epnum == 0 || (data & (1 << ep->epnum)) == 0)
 		return;		/* Not Support DMA */
 
 	num = ep->epnum - 1;
@@ -380,7 +380,7 @@ static void _nbu2ss_ep_dma_exit(struct nbu2ss_udc *udc, struct nbu2ss_ep *ep)
 		return;		/* VBUS OFF */
 
 	data = _nbu2ss_readl(&preg->USBSSCONF);
-	if ((ep->epnum == 0) || ((data & (1 << ep->epnum)) == 0))
+	if (ep->epnum == 0 || (data & (1 << ep->epnum)) == 0)
 		return;		/* Not Support DMA */
 
 	num = ep->epnum - 1;
@@ -560,7 +560,7 @@ static int ep0_out_overbytes(struct nbu2ss_udc *udc, u8 *p_buf, u32 length)
 	union usb_reg_access  temp_32;
 	union usb_reg_access  *p_buf_32 = (union usb_reg_access *)p_buf;
 
-	if ((length > 0) && (length < sizeof(u32))) {
+	if (length > 0 && length < sizeof(u32)) {
 		temp_32.dw = _nbu2ss_readl(&udc->p_regs->EP0_READ);
 		for (i = 0 ; i < length ; i++)
 			p_buf_32->byte.DATA[i] = temp_32.byte.DATA[i];
@@ -608,7 +608,7 @@ static int ep0_in_overbytes(struct nbu2ss_udc *udc,
 	union usb_reg_access  temp_32;
 	union usb_reg_access  *p_buf_32 = (union usb_reg_access *)p_buf;
 
-	if ((i_remain_size > 0) && (i_remain_size < sizeof(u32))) {
+	if (i_remain_size > 0 && i_remain_size < sizeof(u32)) {
 		for (i = 0 ; i < i_remain_size ; i++)
 			temp_32.byte.DATA[i] = p_buf_32->byte.DATA[i];
 		_nbu2ss_ep_in_end(udc, 0, temp_32.dw, i_remain_size);
@@ -701,7 +701,7 @@ static int _nbu2ss_ep0_in_transfer(struct nbu2ss_udc *udc,
 		return result;
 	}
 
-	if ((i_remain_size < sizeof(u32)) && (result != EP0_PACKETSIZE)) {
+	if (i_remain_size < sizeof(u32) && result != EP0_PACKETSIZE) {
 		p_buffer += result;
 		result += ep0_in_overbytes(udc, p_buffer, i_remain_size);
 		req->div_len = result;
@@ -738,7 +738,7 @@ static int _nbu2ss_ep0_out_transfer(struct nbu2ss_udc *udc,
 		req->req.actual += result;
 		i_recv_length -= result;
 
-		if ((i_recv_length > 0) && (i_recv_length < sizeof(u32))) {
+		if (i_recv_length > 0 && i_recv_length < sizeof(u32)) {
 			p_buffer += result;
 			i_remain_size -= result;
 
@@ -891,8 +891,8 @@ static int _nbu2ss_epn_out_pio(struct nbu2ss_udc *udc, struct nbu2ss_ep *ep,
 
 	req->req.actual += result;
 
-	if ((req->req.actual == req->req.length) ||
-	    ((req->req.actual % ep->ep.maxpacket) != 0)) {
+	if (req->req.actual == req->req.length ||
+	    (req->req.actual % ep->ep.maxpacket) != 0) {
 		result = 0;
 	}
 
@@ -914,8 +914,8 @@ static int _nbu2ss_epn_out_data(struct nbu2ss_udc *udc, struct nbu2ss_ep *ep,
 
 	i_buf_size = min((req->req.length - req->req.actual), data_size);
 
-	if ((ep->ep_type != USB_ENDPOINT_XFER_INT) && (req->req.dma != 0) &&
-	    (i_buf_size  >= sizeof(u32))) {
+	if (ep->ep_type != USB_ENDPOINT_XFER_INT && req->req.dma != 0 &&
+	    i_buf_size  >= sizeof(u32)) {
 		nret = _nbu2ss_out_dma(udc, req, num, i_buf_size);
 	} else {
 		i_buf_size = min_t(u32, i_buf_size, ep->ep.maxpacket);
@@ -954,8 +954,8 @@ static int _nbu2ss_epn_out_transfer(struct nbu2ss_udc *udc,
 			}
 		}
 	} else {
-		if ((req->req.actual == req->req.length) ||
-		    ((req->req.actual % ep->ep.maxpacket) != 0)) {
+		if (req->req.actual == req->req.length ||
+		    (req->req.actual % ep->ep.maxpacket) != 0) {
 			result = 0;
 		}
 	}
@@ -1106,8 +1106,8 @@ static int _nbu2ss_epn_in_data(struct nbu2ss_udc *udc, struct nbu2ss_ep *ep,
 
 	num = ep->epnum - 1;
 
-	if ((ep->ep_type != USB_ENDPOINT_XFER_INT) && (req->req.dma != 0) &&
-	    (data_size >= sizeof(u32))) {
+	if (ep->ep_type != USB_ENDPOINT_XFER_INT && req->req.dma != 0 &&
+	    data_size >= sizeof(u32)) {
 		nret = _nbu2ss_in_dma(udc, ep, req, num, data_size);
 	} else {
 		data_size = min_t(u32, data_size, ep->ep.maxpacket);
@@ -1238,7 +1238,7 @@ static void _nbu2ss_endpoint_toggle_reset(struct nbu2ss_udc *udc, u8 ep_adrs)
 	u8		num;
 	u32		data;
 
-	if ((ep_adrs == 0) || (ep_adrs == 0x80))
+	if (ep_adrs == 0 || ep_adrs == 0x80)
 		return;
 
 	num = (ep_adrs & 0x7F) - 1;
@@ -1261,7 +1261,7 @@ static void _nbu2ss_set_endpoint_stall(struct nbu2ss_udc *udc,
 	struct nbu2ss_ep *ep;
 	struct fc_regs __iomem *preg = udc->p_regs;
 
-	if ((ep_adrs == 0) || (ep_adrs == 0x80)) {
+	if (ep_adrs == 0 || ep_adrs == 0x80) {
 		if (bstall) {
 			/* Set STALL */
 			_nbu2ss_bitset(&preg->EP0_CONTROL, EP0_STL);
@@ -1392,8 +1392,8 @@ static inline int _nbu2ss_req_feature(struct nbu2ss_udc *udc, bool bset)
 	u8	ep_adrs;
 	int	result = -EOPNOTSUPP;
 
-	if ((udc->ctrl.wLength != 0x0000) ||
-	    (direction != USB_DIR_OUT)) {
+	if (udc->ctrl.wLength != 0x0000 ||
+	    direction != USB_DIR_OUT) {
 		return -EINVAL;
 	}
 
@@ -1480,7 +1480,7 @@ static int std_req_get_status(struct nbu2ss_udc *udc)
 	u8	ep_adrs;
 	int	result = -EINVAL;
 
-	if ((udc->ctrl.wValue != 0x0000) || (direction != USB_DIR_IN))
+	if (udc->ctrl.wValue != 0x0000 || direction != USB_DIR_IN)
 		return result;
 
 	length =
@@ -1542,9 +1542,9 @@ static int std_req_set_address(struct nbu2ss_udc *udc)
 	int		result = 0;
 	u32		wValue = le16_to_cpu(udc->ctrl.wValue);
 
-	if ((udc->ctrl.bRequestType != 0x00)	||
-	    (udc->ctrl.wIndex != 0x0000)	||
-		(udc->ctrl.wLength != 0x0000)) {
+	if (udc->ctrl.bRequestType != 0x00	||
+	    udc->ctrl.wIndex != 0x0000		||
+		udc->ctrl.wLength != 0x0000) {
 		return -EINVAL;
 	}
 
@@ -1564,9 +1564,9 @@ static int std_req_set_configuration(struct nbu2ss_udc *udc)
 {
 	u32 config_value = (u32)(le16_to_cpu(udc->ctrl.wValue) & 0x00ff);
 
-	if ((udc->ctrl.wIndex != 0x0000)	||
-	    (udc->ctrl.wLength != 0x0000)	||
-		(udc->ctrl.bRequestType != 0x00)) {
+	if (udc->ctrl.wIndex != 0x0000	||
+	    udc->ctrl.wLength != 0x0000	||
+		udc->ctrl.bRequestType != 0x00) {
 		return -EINVAL;
 	}
 
@@ -1838,8 +1838,8 @@ static void _nbu2ss_ep_done(struct nbu2ss_ep *ep,
 	}
 
 #ifdef USE_DMA
-	if ((ep->direct == USB_DIR_OUT) && (ep->epnum > 0) &&
-	    (req->req.dma != 0))
+	if (ep->direct == USB_DIR_OUT && ep->epnum > 0 &&
+	    req->req.dma != 0)
 		_nbu2ss_dma_unmap_single(udc, ep, req, USB_DIR_OUT);
 #endif
 
@@ -1931,7 +1931,7 @@ static inline void _nbu2ss_epn_in_dma_int(struct nbu2ss_udc *udc,
 		mpkt = ep->ep.maxpacket;
 		size = preq->actual % mpkt;
 		if (size > 0) {
-			if (((preq->actual & 0x03) == 0) && (size < mpkt))
+			if ((preq->actual & 0x03) == 0 && size < mpkt)
 				_nbu2ss_ep_in_end(udc, ep->epnum, 0, 0);
 		} else {
 			_nbu2ss_epn_in_int(udc, ep, req);
@@ -2428,8 +2428,8 @@ static int nbu2ss_ep_enable(struct usb_ep *_ep,
 	}
 
 	ep_type = usb_endpoint_type(desc);
-	if ((ep_type == USB_ENDPOINT_XFER_CONTROL) ||
-	    (ep_type == USB_ENDPOINT_XFER_ISOC)) {
+	if (ep_type == USB_ENDPOINT_XFER_CONTROL ||
+	    ep_type == USB_ENDPOINT_XFER_ISOC) {
 		pr_err(" *** %s, bat bmAttributes\n", __func__);
 		return -EINVAL;
 	}
@@ -2438,7 +2438,7 @@ static int nbu2ss_ep_enable(struct usb_ep *_ep,
 	if (udc->vbus_active == 0)
 		return -ESHUTDOWN;
 
-	if ((!udc->driver) || (udc->gadget.speed == USB_SPEED_UNKNOWN)) {
+	if (!udc->driver || udc->gadget.speed == USB_SPEED_UNKNOWN) {
 		dev_err(ep->udc->dev, " *** %s, udc !!\n", __func__);
 		return -ESHUTDOWN;
 	}
@@ -2603,8 +2603,8 @@ static int nbu2ss_ep_queue(struct usb_ep *_ep,
 		}
 	}
 
-	if ((ep->epnum > 0) && (ep->direct == USB_DIR_OUT) &&
-	    (req->req.dma != 0))
+	if (ep->epnum > 0 && ep->direct == USB_DIR_OUT &&
+	    req->req.dma != 0)
 		_nbu2ss_dma_map_single(udc, ep, req, USB_DIR_OUT);
 #endif
 
-- 
2.34.1


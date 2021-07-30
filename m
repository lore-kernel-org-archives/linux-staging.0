Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F9F70
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 09:24:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D2B961059;
	Fri, 30 Jul 2021 09:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627637090;
	bh=I0FEIBk1cSLkiAG2F3mSEYQZhg2lc/pGXAE/vcLkfNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LdDi5gsPnF5R0KE72vvhm+Bb77uW+mGQ6d3oWWeEALcpyCPR0zWO/D4fu4T2PLhqn
	 Dl96ShL8yJkcjGC9hs2CMvZbLBxSeNLT/z9EoCgtQsFW3yr9M/BKJKXWQz+9TaOLRH
	 9zd4Q81EVdhC5SqFP21288m6xAYqB3zJhoogPCGs=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-staging@lists.linux.dev
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 12/12] staging: r8188eu: remove rtw_usb_control_msg() macro
Date: Fri, 30 Jul 2021 11:24:17 +0200
Message-Id: <20210730092417.1014392-12-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210730092417.1014392-1-gregkh@linuxfoundation.org>
References: <20210730092417.1014392-1-gregkh@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1868; h=from:subject; bh=I0FEIBk1cSLkiAG2F3mSEYQZhg2lc/pGXAE/vcLkfNw=; b=owGbwMvMwCRo6H6F97bub03G02pJDInMRx1brW99/Jx55O7rgLZkvbjMoE+Ka94KswXW6E/pXvJ+ 3WHFjlgWBkEmBlkxRZYv23iO7q84pOhlaHsaZg4rE8gQBi5OAZhI6FGGBafKLnS4rtQ+we35jmvxR3 8mp8hryxjmykTun3mD7yN/6fL074+uxAiq+GyQAgA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

It is a wrapper around usb_control_msg() that does nothing, so remove
the macro and just call the correct USB function instead in the one
place it is used.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 2 +-
 drivers/staging/r8188eu/include/usb_ops.h   | 4 ----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index dd6138dfebb6..3c6abedb313d 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -56,7 +56,7 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u8 request, u16 value, u
 			memcpy(pIo_buf, pdata, len);
 		}
 
-		status = rtw_usb_control_msg(udev, pipe, request, reqtype, value, index, pIo_buf, len, RTW_USB_CONTROL_MSG_TIMEOUT);
+		status = usb_control_msg(udev, pipe, request, reqtype, value, index, pIo_buf, len, RTW_USB_CONTROL_MSG_TIMEOUT);
 
 		if (status == len) {   /*  Success this control transfer. */
 			rtw_reset_continual_urb_error(dvobjpriv);
diff --git a/drivers/staging/r8188eu/include/usb_ops.h b/drivers/staging/r8188eu/include/usb_ops.h
index d5b31e31b62d..6267d0999400 100644
--- a/drivers/staging/r8188eu/include/usb_ops.h
+++ b/drivers/staging/r8188eu/include/usb_ops.h
@@ -21,10 +21,6 @@ enum {
 #define MAX_VENDOR_REQ_CMD_SIZE	254	/* 8188cu SIE Support */
 #define MAX_USB_IO_CTL_SIZE	(MAX_VENDOR_REQ_CMD_SIZE + ALIGNMENT_UNIT)
 
-#define rtw_usb_control_msg(dev, pipe, request, requesttype,		\
-			    value, index, data, size, timeout_ms)	\
-	usb_control_msg((dev), (pipe), (request), (requesttype), (value),\
-			(index), (data), (size), (timeout_ms))
 #include <usb_ops_linux.h>
 
 void rtl8188eu_set_hw_type(struct adapter *padapter);
-- 
2.32.0


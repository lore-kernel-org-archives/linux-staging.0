Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9206D2C98
	for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 12:09:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4161960EBD;
	Mon, 25 Oct 2021 12:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635163774;
	bh=oA1rXK3mOZ0tq5cb2BaPVapIai6qb8HrBsRqLCGUxlg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NBk+U5/SOIahD3GkaV0dISWBx/2Syk/e09s5gG3p1U9wH+3wW+LWgQVUx/tr4D6RH
	 GRVThmDYtQZVebfeG3ufFVRlTQLDfX5/239ztq8pq3rwZyzCEmJt9Joo1dWtHqqMGg
	 wwpADX7MXIWeMRWAa2BNzfTCw3xBd0tQ87brJxSgCcoTEHYB0lqzpk6mNVjT4nl5qU
	 FQR18xVBmDJEp/c2QFcDUcYPOJVBCyY0pusO5zlVEG12u6D81XgflesTRPr2I9kJLC
	 X1FhKyjHpYq2pc9U0DMvhwEO0tSRT6K4N3DyC9oRgiaMbK7q5HpUqbBeUY0fYi8ull
	 DH1PbqMHRNRCw==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1meymz-0001f9-5E; Mon, 25 Oct 2021 14:09:17 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] staging: r8712u: fix control-message timeout
Date: Mon, 25 Oct 2021 14:09:10 +0200
Message-Id: <20211025120910.6339-3-johan@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211025120910.6339-1-johan@kernel.org>
References: <20211025120910.6339-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

USB control-message timeouts are specified in milliseconds and should
specifically not vary with CONFIG_HZ.

Fixes: 2865d42c78a9 ("staging: r8712u: Add the new driver to the mainline kernel")
Cc: stable@vger.kernel.org      # 2.6.37
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/staging/rtl8712/usb_ops_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/usb_ops_linux.c b/drivers/staging/rtl8712/usb_ops_linux.c
index 655497cead12..f984a5ab2c6f 100644
--- a/drivers/staging/rtl8712/usb_ops_linux.c
+++ b/drivers/staging/rtl8712/usb_ops_linux.c
@@ -494,7 +494,7 @@ int r8712_usbctrl_vendorreq(struct intf_priv *pintfpriv, u8 request, u16 value,
 		memcpy(pIo_buf, pdata, len);
 	}
 	status = usb_control_msg(udev, pipe, request, reqtype, value, index,
-				 pIo_buf, len, HZ / 2);
+				 pIo_buf, len, 500);
 	if (status > 0) {  /* Success this control transfer. */
 		if (requesttype == 0x01) {
 			/* For Control read transfer, we have to copy the read
-- 
2.32.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39798371
	for <linux-staging@lists.linux.dev>; Mon, 25 Jul 2022 08:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E47C341C6;
	Mon, 25 Jul 2022 08:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658736001;
	bh=foX6nf1pYS8r8PQACJBat3Wk6rDL4/p2BD6eGaKMujI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LMP6cfhgD8NZdjE0/kEUhFFzKnxpxcp402c3tWetzjeP7OsuvvqjcpWe1ja5i4w6z
	 ELMl0ruvhApRJH5SZKayPsqoN+eC0Fkhx3d4DgaSjbcn02iuKFlPEcd5jIAeTWl39j
	 EUEUbze1SjaeBkO2kIcIbzBRAvLv5fngOs+SKjqVxeTd7Hu3ZLFlo2yboceFa8OxGN
	 zb3OZ25ESyEjSSmbbdtdOqVTtQEAx3Ed6/tNC8sN6x92KvV0dPwqO8FaOmdDP28UlM
	 zaH3mJku1p2zocQExzUYxVUJEaw5FaDtVC39eVkNYLo4TUvUVF2EFjpR9bPe7tUeEH
	 35J7fQUWZuFJg==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1oFt0d-0000K1-TY; Mon, 25 Jul 2022 10:00:11 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Oliver Neukum <oneukum@suse.com>,
	Felipe Balbi <balbi@kernel.org>
Cc: Yan Xinyu <sdlyyxy@bupt.edu.cn>,
	linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/7] USB: cdc: add control-signal defines
Date: Mon, 25 Jul 2022 09:58:35 +0200
Message-Id: <20220725075841.1187-2-johan@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220725075841.1187-1-johan@kernel.org>
References: <20220725075841.1187-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add defines for the Control Signal Bitmap Values from section 6.2.14
SetControlLineState of the CDC specification version 1.1.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 include/uapi/linux/usb/cdc.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/uapi/linux/usb/cdc.h b/include/uapi/linux/usb/cdc.h
index 6d61550959ef..372c81425cae 100644
--- a/include/uapi/linux/usb/cdc.h
+++ b/include/uapi/linux/usb/cdc.h
@@ -271,6 +271,10 @@ struct usb_cdc_line_coding {
 	__u8	bDataBits;
 } __attribute__ ((packed));
 
+/* Control Signal Bitmap Values from 6.2.14 SetControlLineState */
+#define USB_CDC_CTRL_DTR			(1 << 0)
+#define USB_CDC_CTRL_RTS			(1 << 1)
+
 /* table 62; bits in multicast filter */
 #define	USB_CDC_PACKET_TYPE_PROMISCUOUS		(1 << 0)
 #define	USB_CDC_PACKET_TYPE_ALL_MULTICAST	(1 << 1) /* no filter */
-- 
2.35.1


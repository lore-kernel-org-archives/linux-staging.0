Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0343FCC
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 12:27:34 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id y89so24665268ede.2
        for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 05:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hrq8qAkDRRaqGN1vEGaa6t8c3H8UpeRh5p4OUisxCY8=;
        b=EjtoV1/hpElVhAmNF/pdC7dpbgZ7IGRT/JT93CfUYO/PV6vklBLNhRXnJ7Br7xdTVC
         3sTZr2XfB/MyVhuK7R/Yf/k2x/jNyK0hmNcsNb78knE6E5/02jmpeJpmzmVjWBEz4tp2
         GOl05YELbPnVX6o/HunUJYs103hOC2XVe39GDewidrab4Kci5OgdDSU5X1Z4K2EuRKBc
         HvNqiYI8r+h8kWuSS39GGDucOV+Z5pBGhnOxrDdWojTUEsdsMeGGhveAfaG79bBWIAfH
         gObXTM1enNq+esRQiRZM/ahE64paDQeWphfLaOv3ZjGBl3ABE7jWol9ERLkw65Yp100+
         Ki0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hrq8qAkDRRaqGN1vEGaa6t8c3H8UpeRh5p4OUisxCY8=;
        b=enOJuTlMBwWRd5HzRgJX9RGE5DOa0ikEQEks3jtpjd1LYW5G0HsiFI1ah39lSQ0sBT
         2r6vfQt0pBGS7E6ysnIncwdNT/gEq0YCu994o29I4S++V/gI4d7EizgcW73WMU/YMjvH
         Gh4QsKJE2M6Y1V6RpHFOfwig76CDAevnLKoMgggqX1U49q+An2gfxbUb3NvsEWWMNTas
         5RUTZSsx75WU6wB/dTORkiPj2F1nZ5MM0jAGn2HqLoYQaU/9IxeEw5QyvcVQV1BU31EV
         Y7od2eOoD9Jp5snlfFlVJrQCNj+t5wRcVQqal+Ufh86QRNmxx+IURh5MQj7nK6gDHbeU
         qe4w==
X-Gm-Message-State: AOAM533t3LnkM+aa1A3kGDY2OvyprElQmkT0rz2Xrs4blvMj+C9my922
	ZUaOfev/SLihNmrUoydvZLg=
X-Google-Smtp-Source: ABdhPJzi41fORyuvY66vdQBPJrLz8f7CS0ogmMxHi0kPyJARRBbtPw35BMvaI6LTradfL4eCzXdeqA==
X-Received: by 2002:a50:be82:: with SMTP id b2mr4643142edk.56.1632486453027;
        Fri, 24 Sep 2021 05:27:33 -0700 (PDT)
Received: from localhost.localdomain.it (host-212-171-30-160.retail.telecomitalia.it. [212.171.30.160])
        by smtp.gmail.com with ESMTPSA id v13sm4882522ejh.62.2021.09.24.05.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 05:27:32 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Laight <david.Laight@aculab.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v10 05/16] staging: r8188eu: remove a comment from usbctrl_vendorreq()
Date: Fri, 24 Sep 2021 14:26:54 +0200
Message-Id: <20210924122705.3781-6-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210924122705.3781-1-fmdefrancesco@gmail.com>
References: <20210924122705.3781-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove an unnecessary comment from usbctrl_vendorreq().

Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 35d268c5cd7f..5c9613cc2415 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -70,10 +70,8 @@ static int usbctrl_vendorreq(struct intf_hdl *intf, u16 value, void *data, u16 l
 			} else {
 				/* status != len && status >= 0 */
 				if (status > 0) {
-					if (requesttype == REALTEK_USB_VENQT_READ) {
-						/*  For Control read transfer, we have to copy the read data from io_buf to data. */
+					if (requesttype == REALTEK_USB_VENQT_READ)
 						memcpy(data, io_buf,  len);
-					}
 				}
 			}
 
-- 
2.33.0


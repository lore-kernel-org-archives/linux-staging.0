Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725B12FB6
	for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 23:54:06 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id j13so53995048edv.13
        for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 16:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0Tc3T6heCxZqW05/CSeGigfVkKIeuPYK64e+EOdX8yk=;
        b=qeZwCS8QzFM7A5lvYq8vRYbQWYJsFcUJyUNqC4e80miNyI6xOwa7ysrocZSPnZED1M
         bzl4XmbvD57QvzLY44CZwU7toh6Z0zl/2bQxtHnhVS9uk67vOvYlynYZdemccs3dBzSB
         ChlgqyKACBivLYAFxY0F7kwRP6tA9nAzO2lgzjJTIb3Rn/cQVYtXZe0W8SjJu9l7W9uz
         u6+pcppoMSgOLI88nfckM75W99upUOyxCDd95usPEwPnOL02htEWp/Hwd25hU2hqu1by
         9dmMUQn6xvJnHx5DI75ETXDnBIgE8KJ5XMHB7bTuCvfDNvkGT1Iut9iSmDBZDHPZtkVT
         JxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0Tc3T6heCxZqW05/CSeGigfVkKIeuPYK64e+EOdX8yk=;
        b=HfNEzIw409S4GvJP9OQ67743KwjCpPnnoqC7NRaa0iclBNTromBk6iRs582OyIzf9b
         DQmLJ6H0eIfa26yyUutwM3sWRT6F3Py7PQSTiAPLRY9lcfMem/J6VglW0q81TjsEoN10
         mmHZXb7qZY9/zCqQZnLAs+XzgGLCxLUgsUr27zqT+o5i0xunddDwiOTgCuP5XKaFKBgM
         KTovS3PN2FOetxlWc5fQwPAjA8F0WLgmTD01wHpJ/8jHv4iwBOI6492aZGqsmMWzbkP8
         /MuIwUVG8obvPm2BvFrbifSepN3l2DajHHoOc4Kupo/f+N6dsM4NM2YvPLP4CgH6A1ch
         /PGA==
X-Gm-Message-State: AOAM53394e34WCgvs7fDK1Gm0TJO7OTQRob4/ybZv4hbKOm8pZSYNWUX
	zYz8btbqqpqK5DhQzCcOSLU=
X-Google-Smtp-Source: ABdhPJzIeF3/pu1mKfDIHTgr9G+Taq5GmXMSHgAN74dQpeYYQ5M9jmfBIrtpYJ0GXTioKBPQ52qq+g==
X-Received: by 2002:a05:6402:847:: with SMTP id b7mr26458200edz.242.1632095644822;
        Sun, 19 Sep 2021 16:54:04 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-104.retail.telecomitalia.it. [79.47.104.104])
        by smtp.gmail.com with ESMTPSA id e11sm5353636ejm.41.2021.09.19.16.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 16:54:04 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Laight <david.Laight@aculab.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v8 02/19] staging: r8188eu: reorder declarations in usbctrl_vendorreq()
Date: Mon, 20 Sep 2021 01:53:39 +0200
Message-Id: <20210919235356.4151-3-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210919235356.4151-1-fmdefrancesco@gmail.com>
References: <20210919235356.4151-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorder variables declarations according to the "Reverse Xmas Tree"
style.

Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 3bfae4bd4a1e..e06aea92c8d2 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -13,10 +13,10 @@ static int usbctrl_vendorreq(struct intf_hdl *intfhdl, u16 value, void *data, u1
 	struct adapter *adapt = intfhdl->padapter;
 	struct dvobj_priv *dvobjpriv = adapter_to_dvobj(adapt);
 	struct usb_device *udev = dvobjpriv->pusbdev;
+	int vendorreq_times = 0;
 	unsigned int pipe;
 	int status = 0;
 	u8 *io_buf;
-	int vendorreq_times = 0;
 
 	if ((adapt->bSurpriseRemoved) || (adapt->pwrctrlpriv.pnp_bstop_trx)) {
 		status = -EPERM;
-- 
2.33.0


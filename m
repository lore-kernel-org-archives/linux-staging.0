Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A9F3FC6
	for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 23:54:19 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id v22so49631450edd.11
        for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 16:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9iEcs50Nb+e28VH/GVFj+34tTNYlwqWufQuNdGxljS4=;
        b=M6Y7be1MXVcUUSoNuT646ZKS9+KaEP5EcEu5L/ruHAHiQN0rbfzUI5hWQEEAkgbDhR
         5gLmsS1502E8AGWxfcQ1wfap6FGQfnMF7TjIO8PXMY7NEK8Xu7f3mvQoAmQlgWu0mSWl
         ZWmO7Qbvd93E5eMaWjktG92LWaMqTXCF1CMWqksia3YoHquwBZ8zTH7efrMRmW247Miw
         b9c8coo/g3ZUUUhM5DPZbVTB+FopJa5gdENXAQZ+hTg64aFXvuToUuAURoZfUGLXA55j
         /r1L+cP3rvPti7Va/5L/DSqdR9nJZoZ0YYzX1HH3uINGD3XqDT1Eqww+dm38xLnXknbr
         ws9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9iEcs50Nb+e28VH/GVFj+34tTNYlwqWufQuNdGxljS4=;
        b=hYK/mtqT01qjYY+WQlLAm6s7Iub00dDA9EWj725oJsALbXWSjV+bNaY4dzcvhmotMT
         +GHZ/FHGUtJ/Z52KJwpZum+44IYPVFsXHCMcWqHbTmcKdgv6/Xu1/yguZJCO45V4A5Ht
         P7RX5pQ8F0ADuXqCF+jgRF8kGAAgtzb4xbmCqnF8lWbhVq1x0Ru0ozQgI9HYW20a6JUD
         h2oW8rYulUJ03SENYSUBNvj4Bimf+omScVEQ6lux8/dFx+5TRY5XrOvYVPhE/Ta4lhe6
         H2n+VYUSd+jYe0IHFsUqrYEDAS3Hlfk6itxsxidRIJI0vfvjB1TlJQticj/eH8yys2sI
         D9Yg==
X-Gm-Message-State: AOAM530iThZ4VjABWAeEEtUkIikrcZ9bQ/djfBUyMec+Sp/mlAC/TkOC
	FWdNPAG54bTJSwqH0m8f6vI=
X-Google-Smtp-Source: ABdhPJwnG3bh0CKlNCZDJo5K6+ggTQz/ubE7A6wb2xPExFdARnRK4xXNd5po06QhBlK8L5ciSNlUxQ==
X-Received: by 2002:a50:cf08:: with SMTP id c8mr2784866edk.86.1632095657927;
        Sun, 19 Sep 2021 16:54:17 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-104.retail.telecomitalia.it. [79.47.104.104])
        by smtp.gmail.com with ESMTPSA id e11sm5353636ejm.41.2021.09.19.16.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 16:54:17 -0700 (PDT)
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
Subject: [PATCH v8 12/19] staging: r8188eu: change the type of a variable in rtw_write16()
Date: Mon, 20 Sep 2021 01:53:49 +0200
Message-Id: <20210919235356.4151-13-fmdefrancesco@gmail.com>
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

Change the type of "data" from __le32 to __le16.

Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index ba654db869f7..b2a5b6ffbb46 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -147,7 +147,7 @@ int rtw_write16(struct adapter *adapter, u32 addr, u16 val)
 	struct io_priv *io_priv = &adapter->iopriv;
 	struct intf_hdl *intfhdl = &io_priv->intf;
 	u16 value = addr & 0xffff;
-	__le32 data = cpu_to_le32(val & 0x0000ffff);
+	__le16 data = cpu_to_le16(val);
 	int ret;
 
 	ret = usbctrl_vendorreq(intfhdl, value, &data, 2, REALTEK_USB_VENQT_WRITE);
-- 
2.33.0


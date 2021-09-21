Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636F43FCD
	for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 18:18:59 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id v24so77731281eda.3
        for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 11:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2NFdRrR4y988/qJTdBg9DXHSyMtgA8l3RX+tVJ10Rt8=;
        b=Tlr+smt3loiY+77C5LwxIwTFle38gMIDXzxzT773/FF6bSvf7uZtsRYf/yRVkDIx2G
         eOpMpzA7KWB59XKHgVOrHfPAiiYl+rGI0+8YKCkZY536PxNEwj+ufANIbYKsKSmFFOwM
         GQcpmhkyDLhsYFiQxWlJf3Ucr1SZ9eo3U6GwsgnyXU1hL9MqyNi0HsO9EfotC3nez0Zs
         EdhSKRwTedgrhhbLLW3Uc594N9qcA8W+EraDqv3PGEf6x7l2XN/Mf5haxx8TWWFmLqXW
         JN4iDJUVsbBHMgPEVEiNJgRU6Zxd0GFJur5EkSxhc5a5aW34Q+3IB+xyTzOWsseLHfXj
         ZRiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2NFdRrR4y988/qJTdBg9DXHSyMtgA8l3RX+tVJ10Rt8=;
        b=St8IODI1bYuGnir3OJivG0bhQMHkTZ58BabjbyGxbTOhBOkot983lZkTgm0zQK46Za
         HD/N5gSIOQTnBAGBe4RQgKKvLEbQHyzM+y5Pxa2zgjdFRDOTFYYG3iuYQS5TYjh/VbEB
         Iyy01kJFBYgbvpTLnZIubyMKdiHOm8ETBYri9qe89jXfB7+KJaZiUelz4gTUHBKeAGqz
         w+1roH9eKwQjPcntXTWpxwg0rXRuDb2ZYA1bH9hyHxwOLpQM3/EEi/xGTvP46VFHkqUR
         bJVSTLgN2gMNeVyiWx+6TjK1o7xKK1SWo896UljXS69NIuZjJV4x/wvX5vt4drhV9ky7
         hG0w==
X-Gm-Message-State: AOAM5311TSbrBpZVSAH5rq/MHiQ4pXpayq1dctnxobmmfvWpANOuLDFf
	RofZTW1ITudGiuIrmz2Y14jbFuXOkdk=
X-Google-Smtp-Source: ABdhPJwvE1mJDNFx5pz5SPq9aIVWFYbmpGueIbzFS015G92bcqJisNwY67Tjgr0EBvUZLLnnPrhXTQ==
X-Received: by 2002:a17:906:6c94:: with SMTP id s20mr37523899ejr.152.1632248337807;
        Tue, 21 Sep 2021 11:18:57 -0700 (PDT)
Received: from localhost.localdomain.it (host-212-171-30-160.retail.telecomitalia.it. [212.171.30.160])
        by smtp.gmail.com with ESMTPSA id cn8sm1833162edb.77.2021.09.21.11.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 11:18:57 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Laight <david.Laight@aculab.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v9 03/16] staging: r8188eu: remove unnecessary test in usbctrl_vendorreq()
Date: Tue, 21 Sep 2021 20:18:21 +0200
Message-Id: <20210921181834.29677-4-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921181834.29677-1-fmdefrancesco@gmail.com>
References: <20210921181834.29677-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary test for "!io_buf" in usbctrl_vendorreq(). This test
is not necessary because io_buf has been assigned with the address of
a region of dinamically allocated memory (dvobj->usb_alloc_vendor_req_buf)
by rtw_init_intf_priv() in os_dep/usb_intf.c.

Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 84ec7c1346b1..61a016e3608f 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -34,12 +34,6 @@ static int usbctrl_vendorreq(struct intf_hdl *intf, u16 value, void *data, u16 l
 	/*  Acquire IO memory for vendorreq */
 	io_buf = dvobjpriv->usb_vendor_req_buf;
 
-	if (!io_buf) {
-		DBG_88E("[%s] io_buf == NULL\n", __func__);
-		status = -ENOMEM;
-		goto release_mutex;
-	}
-
 	if (requesttype == REALTEK_USB_VENQT_READ)
 		pipe = usb_rcvctrlpipe(udev, 0);/* read_in */
 	else
@@ -91,7 +85,7 @@ static int usbctrl_vendorreq(struct intf_hdl *intf, u16 value, void *data, u16 l
 		if ((value >= FW_8188E_START_ADDRESS && value <= FW_8188E_END_ADDRESS) || status == len)
 			break;
 	}
-release_mutex:
+
 	mutex_unlock(&dvobjpriv->usb_vendor_req_mutex);
 exit:
 	return status;
-- 
2.33.0


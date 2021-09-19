Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84AA72
	for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 23:54:07 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id g8so54009778edt.7
        for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 16:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0HeSFyYPFTepArePe3je7Z+vfgzfAoaNBDxBw/Ndyzs=;
        b=FL9TVx4cqktQFF+xa3di7lqsy5dVVXHw/Kog4h1EQm2EqmrGp1zXeNll9dontHbvSu
         SwTNRj2JHifdj5bzNRBQLIVVsQhETtvu0YnWzAFP7Ii4Hcf5L9Xp1VBmpJwUrhazGIBG
         OgkIHsSsD4U1EW9F//NOlyVGIHUAHUYGyCcyrBX4HFtjmOemH98VbSSJyGV314YD3WAB
         wSADurfBX88YufcT2Si4WIOgMhQ/FQ5jBKrDOTamH8Lv98+PT97Ko8J51fu8LLP/ppQd
         eOVPuKyKjXcBqWktQjhXr+a1XEvp7SVxZbPNmOjuty4GWtC8tSZ5s/zFU+9u+f+4Ui5/
         GR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0HeSFyYPFTepArePe3je7Z+vfgzfAoaNBDxBw/Ndyzs=;
        b=afJhR4mVgmho18nnqkRLdFUt9ussXuEnRqjEfZlw0a/VFf39+iRLKEK3DgwtnNGW9u
         ueiSH42ZDkfbHAlu0kGFJrx8Eq/yaq6npUfLQTBXSydXr7i3/9dMDWdYP4koralhNEPG
         GFusMe79XohtkcPKHOhlwRNWGSTjN3amSbxmTZrVy03s6UHYgQzdCrF3jthPtdSifxhx
         WCPSUm6AcoXu/PuJOPpvYQL482XZTvsinMSqJ+rrtqXHZEqyAF2TXr/KCgPFzWMaJEPR
         DgFMzWRY6M3IC8oA1cksmUIxs+436URie8zFGWh33hCqTJCWTVW/1pnmE2b+K8TS0Qmc
         0iuw==
X-Gm-Message-State: AOAM53218dz5Bkh2ffu8T83zMBUgVQJYlI3kiXfmbYwVRVG7VYCtZK4g
	GOiIZLx1OVcOAyyRr3s1TA4=
X-Google-Smtp-Source: ABdhPJwHWKpa6ltK4B+EVKBKZcKE4DeUQfRnvHj6oqj+NN6G6CnReWt8hVRRMvCJE8lqmW2PtwAdSw==
X-Received: by 2002:a17:906:e094:: with SMTP id gh20mr26538221ejb.252.1632095646108;
        Sun, 19 Sep 2021 16:54:06 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-104.retail.telecomitalia.it. [79.47.104.104])
        by smtp.gmail.com with ESMTPSA id e11sm5353636ejm.41.2021.09.19.16.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 16:54:05 -0700 (PDT)
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
Subject: [PATCH v8 03/19] staging: r8188eu: remove unnecessary test in usbctrl_vendorreq()
Date: Mon, 20 Sep 2021 01:53:40 +0200
Message-Id: <20210919235356.4151-4-fmdefrancesco@gmail.com>
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

Remove unnecessary test for "!io_buf" in usbctrl_vendorreq(). Remove the
no more used "release_mutex:" label.

Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index e06aea92c8d2..d92bdcc3716d 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -34,12 +34,6 @@ static int usbctrl_vendorreq(struct intf_hdl *intfhdl, u16 value, void *data, u1
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
@@ -91,7 +85,7 @@ static int usbctrl_vendorreq(struct intf_hdl *intfhdl, u16 value, void *data, u1
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


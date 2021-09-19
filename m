Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9523FC6
	for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 23:54:11 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id co2so7408854edb.8
        for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 16:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=21ydcmCULDJZ9KsJaKGPSEG3gMiHBQKuZVCcI+HwaMU=;
        b=hoL31oLtdN6s2Si/mg+Y1r2D/+m+OfGeT+XQCremOXX5D14Ld5H3Q81xTBMdEuoMso
         2bdr59Zpq9c3Yk2pzY42Vn/FSJFfCYPuK5AW7UcP6dXD3Zt0HRkjCJiz1EwXg1wQPOeP
         UeLWT/UiHyrsrpcIp5cCEwRWuQf3VKtjT8j190D9I9DM9bfrEKNz77j0O1M9cYG7GeRD
         ALsxvB/tNcHRDgh+zq5FeEEdz8Z2iIt0n8NReEHRlTaHihDGQtOMxpYMCXkGKFJCUr9s
         nZ/kZbVJ3OGqOIVwEQm6+8vWget9eeNJ5KIWl0MnMmpNMwqWJYZevhpbwGAFtUSs0QrT
         +R2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=21ydcmCULDJZ9KsJaKGPSEG3gMiHBQKuZVCcI+HwaMU=;
        b=qYVNxmv2FnbdrvLxqogNaYvC9szEKJH4/e2RVSgxk4ai/o2qn+WxVv1usv5W4vHpDg
         WtYRbViDAWcgk5ToldvngrUVFnaqJ6vnPApxrIJBNujR0jzXthE3gXXB7aAsWckKNezd
         ynBh1j17NgzOqarYtCypjKXv7vZHcBbvaPhRrWkaO0YhQOU0SB7fiCi0J/XvxrE6k3rs
         AgTkf9iq7mXCT+kCLEagJybXyUPvY5DoezpDrRRS/Zk9ch2hv6z7ZMQTNu2DOxwiybdn
         MgDI1h6N0xEcf6u2rAdvKzkqV6v28VTEcipQc7vNINnDM0tMloOIk4PZWsk0JAECUeom
         9jQw==
X-Gm-Message-State: AOAM531SVoqAp7wTJFE5NBeD2P4nTrGGHB1kd30tqbcyuzvY6yoJ03mY
	sX4Pj7UiHiS49MigwhAgC5U=
X-Google-Smtp-Source: ABdhPJynBWILs0+ud+J45unKXSwkgsGZVLUhOxuRLdAPOYIVmmRd2GR9EN317bnPMbZi7t8PU8gKnA==
X-Received: by 2002:a50:fb06:: with SMTP id d6mr25628885edq.31.1632095650261;
        Sun, 19 Sep 2021 16:54:10 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-104.retail.telecomitalia.it. [79.47.104.104])
        by smtp.gmail.com with ESMTPSA id e11sm5353636ejm.41.2021.09.19.16.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 16:54:09 -0700 (PDT)
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
Subject: [PATCH v8 06/19] staging: r8188eu: remove unnecessary space in usbctrl_vendorreq()
Date: Mon, 20 Sep 2021 01:53:43 +0200
Message-Id: <20210919235356.4151-7-fmdefrancesco@gmail.com>
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

Remove unnecessary extra space in usbctrl_vendorreq().

Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 0b48dde5657f..a52aeb2558ad 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -66,7 +66,7 @@ static int usbctrl_vendorreq(struct intf_hdl *intfhdl, u16 value, void *data, u1
 				if (status == -ESHUTDOWN || status == -ENODEV) {
 					adapt->bSurpriseRemoved = true;
 				} else {
-					struct hal_data_8188e	*haldata = GET_HAL_DATA(adapt);
+					struct hal_data_8188e *haldata = GET_HAL_DATA(adapt);
 					haldata->srestpriv.wifi_error_status = USB_VEN_REQ_CMD_FAIL;
 				}
 			} else {
-- 
2.33.0


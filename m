Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCD33FCE
	for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 18:19:01 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id ee50so4146398edb.13
        for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 11:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hrq8qAkDRRaqGN1vEGaa6t8c3H8UpeRh5p4OUisxCY8=;
        b=Sdv30BP0QgE4G0Kji2WXc9RbLjy9ydpag7Cwqn80j6yeYjjjybP53OQgBlGAxyv1vh
         sstf7ZFdcJxdl+Knfb+8mj0epcDMmnCGWNfmYSYPolZemz1bBw3VYi7LGOXgdXW+8Pxv
         qh30iGXnxGuJFYMvXBZ2D64ptCConCGpov3gZUxLVIVnoRg40u/8AoFawi0KO9viwC81
         G8gZbwV//sGBZ/0QWf6L84JUU37EHZ0t2tOc5eXlMoqq2C24eX8oLDdNvCYXTPcPy0UE
         +3Nkaz0Il+UHGQwS+Dako0nZUGy7EysocnhnJNI8xLiTo3UP5UM/RMc4cJWfgm6qI5hJ
         8bXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hrq8qAkDRRaqGN1vEGaa6t8c3H8UpeRh5p4OUisxCY8=;
        b=wcm8JTtDELGFpCceosH9+SETkwL+CPeDxAxPhdAgiBDmaNHA6wyglWrncD1WtgEDL2
         4NKtP8u7CFmFwIcUUnZBZD7H+compl5TxcYsDV8tjhpz09hR9FLgfAEFH1VT8KkG2yRr
         1OKRXP5k0P5H8DTgghZe3x4RoOJaa6L704WuGnyAGEgXapDbABjjqEYicTZ/hvPJv9VG
         bC6pk/TozC6yg02Xu0mGq5c8nP/+n0USEDbYUaEa6XP//OnWhiTnWimMvvnkreqGjdYp
         Qu3Ytnls/0R10OuPsmJ/2VjiYfFd5wt75mdN7wTi/vqqgjF7g0X94HAUiNXH0xJVoGB4
         diVw==
X-Gm-Message-State: AOAM532EB201T0SMn0KwSP2oM6vDWwSPvspTdKHsaCHkiLTWDlmVM80L
	esxG4cegILvp6TNc+uFdLwUn5TJh8lo=
X-Google-Smtp-Source: ABdhPJyyciAd7OydeMZbVKQzqFfb4zV/NkMhmGxmhtLd92b7g+rJv2OtEqjCqKgHpZvDpLc7aKehDA==
X-Received: by 2002:a17:906:228d:: with SMTP id p13mr15430512eja.526.1632248340230;
        Tue, 21 Sep 2021 11:19:00 -0700 (PDT)
Received: from localhost.localdomain.it (host-212-171-30-160.retail.telecomitalia.it. [212.171.30.160])
        by smtp.gmail.com with ESMTPSA id cn8sm1833162edb.77.2021.09.21.11.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 11:18:59 -0700 (PDT)
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
Subject: [PATCH v9 05/16] staging: r8188eu: remove a comment from usbctrl_vendorreq()
Date: Tue, 21 Sep 2021 20:18:23 +0200
Message-Id: <20210921181834.29677-6-fmdefrancesco@gmail.com>
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


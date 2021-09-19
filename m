Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219E13FC6
	for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 23:54:13 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id v22so49630758edd.11
        for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 16:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wRB+dn+G7DU/01+RXlsX/eYdlXKVOcULOeR8KEA1XlQ=;
        b=VXdST4ScdMYP96cMxnuLmsszEFhSFjXxAwlokUVFqXxXt8nekjcDl21jB4kuwkhWVp
         4hpzWnvgEE4vLkNpGfms+XN35g63zDLxmcRYMpYYkKoKvNNT393h7f2tAgoxDdwTOC0O
         wDg/dakIikWYYZ86A1Mc5tj+XA/zG+a4f4/TVZ/hwtNjXcBoYS92SCxiH9x8XLffFXHW
         zr6UCG3JZYLKMOm62B6uwKQxg1wbEFQiyUJGLId6vMnelbld9wYLuH/T/AAYPEHRpoQG
         koOpH5I883aq5Hlg6r9weWLcylBfaIa9fA27icpTOGvPXQCsTJE6afv7jgKmGWaSQYCY
         iHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wRB+dn+G7DU/01+RXlsX/eYdlXKVOcULOeR8KEA1XlQ=;
        b=CjJDc8Jlvp6HDQMLKWDv4DuaFgKDqtuquvNhPHkY/Ue3JnJ4H4WkGDQWobMvSDZj6P
         MjCW/QsKqKsoXrE6Cza742f85SwoajBiDMRh+Wbk5Iv3jUasGaEbRYc91DcU93lpcmsd
         OqK5M6U7eIszz3NZXUGXMLgfuavnRroHHbDSbFmw4Rku8payG59v4GADaq5V+PqkzxKG
         ADKUoMqhzB4uB+y8YvN2fVSyS2jszvoJ2cKQlm58GHzd8HWMMdUPCPPfJniCduQBhd7r
         snG7p0S/fvglbTr4L3MYQp6JcLXvfdCLGgMZHnrvkmTbOfRcN+Mzxke4bJxqPZho8uTM
         asvw==
X-Gm-Message-State: AOAM533asMQ/Utx70FdqSwPWsMsjem6h8dd9aCwForz9VwB31YKW2i3R
	Oalf4oBNlsBVhUcLpKQm76o=
X-Google-Smtp-Source: ABdhPJzqOh4qKksuTrwmwrqW9Vx/IX3pJWgtLq6ZCCNr1ccrSzA7NfPG1T0Ja/lqCyfMuDfNieajrw==
X-Received: by 2002:a17:906:2cd6:: with SMTP id r22mr24871505ejr.398.1632095651555;
        Sun, 19 Sep 2021 16:54:11 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-104.retail.telecomitalia.it. [79.47.104.104])
        by smtp.gmail.com with ESMTPSA id e11sm5353636ejm.41.2021.09.19.16.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 16:54:11 -0700 (PDT)
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
Subject: [PATCH v8 07/19] staging: r8188eu: remove unnecessary comment in usbctrl_vendorreq()
Date: Mon, 20 Sep 2021 01:53:44 +0200
Message-Id: <20210919235356.4151-8-fmdefrancesco@gmail.com>
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

Remove an unnecessary comment in usbctrl_vendorreq().

Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index a52aeb2558ad..fc3da0fbf474 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -73,7 +73,6 @@ static int usbctrl_vendorreq(struct intf_hdl *intfhdl, u16 value, void *data, u1
 				/* status != len && status >= 0 */
 				if (status > 0) {
 					if (requesttype == REALTEK_USB_VENQT_READ) {
-						/*  For Control read transfer, we have to copy the read data from io_buf to data. */
 						memcpy(data, io_buf,  len);
 					}
 				}
-- 
2.33.0


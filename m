Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A213FC6
	for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 23:54:23 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id q3so54041943edt.5
        for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 16:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=erW3613vb3h40I0FgUxVUMwFB8GH00L3QkH0tCAOwl0=;
        b=pyTlF0pfhV3XopquFDBbCbBQSSCeykoAW4AhpebLHotQbXOKBf+EzRaZgGJNFEZuoS
         nMm4IfGY60yzwHVM4ENx813GwG8Ln9ZpDWc9Wkp+BrR172g5XXBFb/zdONRY25thy3qe
         B3w94bSkoXydJLSLGDcn8So5rLLqJJrG4RhGRbpA4QGDyNN8WfDmaSIvkPHZ+vZ+54Sd
         dvQEvVLfgfS5RlmMJP6YflHKwFQB2skKovZhz4VIgbReYbK6ZKkdX2Fuob1cjlkAnq7q
         r3sobxtywJhd9ZHd5R2yoWq0acz5aUz7QoBoGL5r5dPPj50234MIBJd7SAOVJQImtl3Z
         ZRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=erW3613vb3h40I0FgUxVUMwFB8GH00L3QkH0tCAOwl0=;
        b=c7AWTS3GGsuLkXvIP23vRo8qwmF390icwvAzGALBkYsHFvEsmYfhcsK2l10vFTBP3W
         e/4oeyrA5B1MLadubNrq6w7TUDhonCD4XzJ2A56oZBjaVY4Fui8Yi91EBgU31s9vlZWK
         vNPizudcbszU9vHtlrLh7KwvGSxNj5qmteO/yLzzXHOCp2CH/i4UJ7ABcUBxOqEZNTqO
         QN+U9/1w2OwIrzmth4+0n6jTw/5ceaHi5HsR+pLRLCDIwWIFxfaA8MgYJ/j89mMUamwj
         SzJXtG+OQq2vwn/vomTF3yMK8Lmfi6Wsd52jA/1BgzlqgDMH4qhipiZxfhk8QFep8l4t
         TF+Q==
X-Gm-Message-State: AOAM531MzVlvAi3I13FdQdJsXXphAjDO6y1qMpgqUQGyCoL7AJmRPNDR
	aW9dkcYWOcfkr9k6b2gmW3g=
X-Google-Smtp-Source: ABdhPJxAP1kk6D7elhi7ouTfo7mvJpY1+/LxsYmU6si6EFCVhNRTjkZhSTe5gfIQsc2jYK+5wPW8dw==
X-Received: by 2002:a50:ff0a:: with SMTP id a10mr26411862edu.273.1632095661721;
        Sun, 19 Sep 2021 16:54:21 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-104.retail.telecomitalia.it. [79.47.104.104])
        by smtp.gmail.com with ESMTPSA id e11sm5353636ejm.41.2021.09.19.16.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 16:54:21 -0700 (PDT)
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
Subject: [PATCH v8 15/19] staging: r8188eu: change the type of a variable in rtw_read16()
Date: Mon, 20 Sep 2021 01:53:52 +0200
Message-Id: <20210919235356.4151-16-fmdefrancesco@gmail.com>
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
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 625b29af9410..c378b5740353 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -111,11 +111,11 @@ u16 rtw_read16(struct adapter *adapter, u32 addr)
 	struct io_priv *io_priv = &adapter->iopriv;
 	struct intf_hdl *intfhdl = &io_priv->intf;
 	u16 value = addr & 0xffff;
-	__le32 data;
+	__le16 data;
 
 	usbctrl_vendorreq(intfhdl, value, &data, 2, REALTEK_USB_VENQT_READ);
 
-	return (u16)(le32_to_cpu(data) & 0xffff);
+	return le16_to_cpu(data);
 }
 
 u32 rtw_read32(struct adapter *adapter, u32 addr)
-- 
2.33.0


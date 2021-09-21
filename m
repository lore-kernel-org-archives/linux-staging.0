Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625853FCE
	for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 18:19:10 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id r5so7748084edi.10
        for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 11:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C2tlqcJMcGsGx5TiqtBgZeF8XSKZxGfxWP/NlXeWrtk=;
        b=chgjDIOUssRK4i1AXk3hM3NLHNC5IuRFx5H6cib2lOn+FPoqdEYaYs7fEt/8TzNMn1
         yY/nIBvQz/7giqwZRxcVknI7VfjsvSk8uPdSCOP5p+sagDtmtLtCNfpN+QD9B5aDo/K8
         0FiBsIxj/91w9lNaKM9STPcBj+ScYbpwV8Vs799vchVRf5H4ExFpgHsJclewG402cogd
         yoS2GlEI4feB2zmty1sfEbMrffwPiZlSPIIVXVM6hB7oxVRU0BMDm3LW2CmLayxtgRYs
         Nutrr8UBm5wckdBdVppi+O6r1SxIBev81AX4o4efc5MPvluHYCICyR3fI5nVEPkLJHTV
         /aLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C2tlqcJMcGsGx5TiqtBgZeF8XSKZxGfxWP/NlXeWrtk=;
        b=vh37zDOJ/FmUmWWTbgPTZt7Tsp0U8XOdeHNrlSBcCo0QRb0UTYrWlutqjoJeJRzKDw
         McHJPUD4A+GQYF6jdVXeo9+dp0iSnJuICbZztOk7YNHPz7OHlHeJvwjiJ0JFZWJ8VKpr
         yHAgxYLqBe+dc+jV65W1r/xAA6CrpahZa1a8frfN3CFiMVtJn7NQxloElaKA1w9mB7PO
         h+JqCQU5Z0+XG+oPPfRMLiVnBAQEYxRL8Ol17s3ptFSznwQyw/v3a5bRlymi2YVTO6kF
         29BVEUHU45QQzgJ9X70JC8iIbHdamhWeItsPcJKk6IoscsMYIyosGL3QbFHyl7mwzbr0
         IkIA==
X-Gm-Message-State: AOAM531IDU6zQ9in5hXTJkIz7Big6QzkfEgEatEU19+G32elKtiq1Vfi
	YJhMULPUIbnzzg3+UNBtI5QzrN/R6sI=
X-Google-Smtp-Source: ABdhPJyNQe5Czw66XgXZzjody/XbkoOrMMSkFESkbliRDYsfGeYaAX8e6Dvq9Es3oo3G2kgO/IWN9Q==
X-Received: by 2002:a50:d0d1:: with SMTP id g17mr37784124edf.96.1632248347522;
        Tue, 21 Sep 2021 11:19:07 -0700 (PDT)
Received: from localhost.localdomain.it (host-212-171-30-160.retail.telecomitalia.it. [212.171.30.160])
        by smtp.gmail.com with ESMTPSA id cn8sm1833162edb.77.2021.09.21.11.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 11:19:07 -0700 (PDT)
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
Subject: [PATCH v9 11/16] staging: r8188eu: change the type of a variable in rtw_read16()
Date: Tue, 21 Sep 2021 20:18:29 +0200
Message-Id: <20210921181834.29677-12-fmdefrancesco@gmail.com>
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

Change the type of "data" from __le32 to __le16. The size of the data
that usbctrl_vendorreq() will read is two bytes in little endian order,
so the most suitable type is __le16.

With the old code, since the two most significant bytes of data are not
initialized, KMSan can likely detect the reading of uninitialized data,
so this change can prevent the checker from complaining.

Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 3b50d2b5c0e3..04a878c1a87d 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -109,11 +109,11 @@ u16 rtw_read16(struct adapter *adapter, u32 addr)
 	struct io_priv *io_priv = &adapter->iopriv;
 	struct intf_hdl *intf = &io_priv->intf;
 	u16 value = addr & 0xffff;
-	__le32 data;
+	__le16 data;
 
 	usbctrl_vendorreq(intf, value, &data, 2, REALTEK_USB_VENQT_READ);
 
-	return (u16)(le32_to_cpu(data) & 0xffff);
+	return le16_to_cpu(data);
 }
 
 u32 rtw_read32(struct adapter *adapter, u32 addr)
-- 
2.33.0


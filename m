Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76053FCC
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 12:27:38 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id u27so34853403edi.9
        for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 05:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XcIedgRKd4A/e9/Vk0iYyZm/XbgKRfJOO6XAQxSeG7Y=;
        b=YuZvnUUSmVCb3vxkpGs6qUEG9jhB3yRhpRsoB3F+EKLGJDD+rQoqlEa0Zt6p+7tNZT
         JxziWlPx2D5CuPy/4S9zcXxaYK0KP6ncnPX04B154l/2uQ6seiF8qHkESdtKD8KSeNP7
         Xxnfu8XK2i6nixRt3Jt5/rvHbgayQBO47bHElcju9ttnzn7Jvihv5CCjy/HtCY90pUgg
         tcrrLvF97OCZu3824HRZYeGsRGAevQJw23a+yRw53JnAq8jvukFy7eN3mRUTZrdskPDW
         iVKc6tOK/39qkujf2DDy5r/rvSpMuRetphZSno33pU8dGpTXEBC8R9z5NsAtoy4FRTX9
         vbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XcIedgRKd4A/e9/Vk0iYyZm/XbgKRfJOO6XAQxSeG7Y=;
        b=NVZBKctNJfcKcx/NyycqveOApX9UHtieaW6HazwxvHk3lDZd6Lmfnx146ZK6KNGU5a
         4z7Cv0S+fJ4N2ckc4+4le7rlzmCRGkYHlE1+bUwiEzTCD9OXzN7pXhT2FjX00olkuzfU
         9ouRHtsiP4Atu5DM/mWZjLQitMJreRnmbvAl2E9b7q6VLsivz7niOwnPGVrj+RVHWkx9
         YZCl28f5cYJocsMb61w36kdNzn4HSN8nbnvTAAiABzg1+NVwPZII3LpYRvfLjeWgL1Dq
         nDScHD7HMWeilmPxnHP8ZIY9z0xZ83J+bcGMxhyhZb18O/nKlG04zmKlLNI83nJLIs/P
         6AWQ==
X-Gm-Message-State: AOAM530mXPHPug5zLH4DVoL8NlycA0XXqb2BbfQvLfKkCmE0E4rguaXc
	3hus85uYrkJMRJhoqu7mPR8=
X-Google-Smtp-Source: ABdhPJxuO9TM+vll1WneXs8MBnfPZ4DyGqCotBs43lRFt5JYEPZuQlVi5kx6gwbfNgLDCcySz5hRBQ==
X-Received: by 2002:a17:906:fc0b:: with SMTP id ov11mr10878057ejb.22.1632486457160;
        Fri, 24 Sep 2021 05:27:37 -0700 (PDT)
Received: from localhost.localdomain.it (host-212-171-30-160.retail.telecomitalia.it. [212.171.30.160])
        by smtp.gmail.com with ESMTPSA id v13sm4882522ejh.62.2021.09.24.05.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 05:27:36 -0700 (PDT)
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
Subject: [PATCH v10 08/16] staging: r8188eu: change the type of a variable in rtw_write16()
Date: Fri, 24 Sep 2021 14:26:57 +0200
Message-Id: <20210924122705.3781-9-fmdefrancesco@gmail.com>
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

Change the type of "data" from __le32 to __le16 in rtw_write16(). The
argument "val", which is u16, after being conditionally swapped to little
endian, is assigned to "data"; therefore, __le16 is the most suitable type
for "data". Remove the bitwise AND of "val" with 0xffff because it is
redundant. Use cpu_to_le16() because "data" is __le16.

Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 95cd7a6bc28b..5dcab1ee4be0 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -145,7 +145,7 @@ int rtw_write16(struct adapter *adapter, u32 addr, u16 val)
 	struct io_priv *io_priv = &adapter->iopriv;
 	struct intf_hdl *intf = &io_priv->intf;
 	u16 value = addr & 0xffff;
-	__le32 data = cpu_to_le32(val & 0x0000ffff);
+	__le16 data = cpu_to_le16(val);
 	int ret;
 
 	ret = usbctrl_vendorreq(intf, value, &data, 2, REALTEK_USB_VENQT_WRITE);
-- 
2.33.0


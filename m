Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733DA3FCC
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 12:27:41 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id bx4so35537511edb.4
        for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 05:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xdFvvX5/HN7bvh9JTzeUFUGFd/lBuWQSjRE1lGqFFEU=;
        b=OgjdsnN4Ua1jK98rr1+qMkd+SRLUo9q7yLsln2Ibrtz+is/8y7YM7nsKVhY5xfnycH
         ldgA+bQZNJN9lQiwfDakdcigpKQ9m4VjmZygB89utZ9x+KcUOf253MXg50+fUj1L4Spx
         fdoh44TdzsrF4hzuQ/9WV1E7gkc6Obcttn0bNsd6ylB+RPcd8F8FIVbvl+qFjZh+johX
         oM7MQxaHNnGJTlzZXuLu+4kBIgZ9vTbb+zCF8GXpGRSzacr5jP/uZrrB1wAOWVpiVccL
         C04b+Sk/lWg7EIVUvjJlQpGm1D4EH1DaY4gHxbslpVZJBmklwR0NikO7M/a1NSmRZYFo
         gJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xdFvvX5/HN7bvh9JTzeUFUGFd/lBuWQSjRE1lGqFFEU=;
        b=F42MimAkwh4UbuNut7MxBfqf9Qc39LDbdccTymIJ5zlQFFlVpMCnpSkNwNBF2sk3bq
         Z2z/N1KbmeJg5KAbhwDqlPN8yaQN32wqz4LrZ3TvV10hYNMwFtynvj4P7msVu2A4TvoQ
         fDcn3+jpzGttz/uNMn3Fhsh17vZ9aIZ4pdjSaAXsxpp86F5buBlAZAzzwRx8eSzx+IMC
         VfBK/LsTehSYHT3moFoHmJyqPNy4MJFigPPTaUFNvfz75Q0j6s7zAw8MOMVxjl0O+I5I
         wTfmgepq9fjMQRm+a/nI+UeH4/qGCEFXoKHy3oqRmMtZ9ODO3fhL7ej0rtEZ8D6ez6zT
         IjOA==
X-Gm-Message-State: AOAM531B1CiOK590iwqMCcGWZnC5FIblTRGRr1X/IUXsuvDsWZhPnsjN
	Y2CKegGq1i5za/QJo2VT0UM=
X-Google-Smtp-Source: ABdhPJxOlRd6a5Cf6Z3o7CvUwTXlsBH9q3aOm9xHyuPWjQ349ZTj+Mcs1IY0UoLFxqbJhjId3406AQ==
X-Received: by 2002:a17:906:828c:: with SMTP id h12mr1614500ejx.414.1632486459878;
        Fri, 24 Sep 2021 05:27:39 -0700 (PDT)
Received: from localhost.localdomain.it (host-212-171-30-160.retail.telecomitalia.it. [212.171.30.160])
        by smtp.gmail.com with ESMTPSA id v13sm4882522ejh.62.2021.09.24.05.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 05:27:39 -0700 (PDT)
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
Subject: [PATCH v10 10/16] staging: r8188eu: remove a bitwise AND from rtw_writeN()
Date: Fri, 24 Sep 2021 14:26:59 +0200
Message-Id: <20210924122705.3781-11-fmdefrancesco@gmail.com>
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

Remove an unnecessary bitwise AND because "length" can never be greater
than 0xffff since VENDOR_CMD_MAX_DATA_LEN is defined as '254'.

Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 8e4e578ed60b..3b50d2b5c0e3 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -176,7 +176,7 @@ int rtw_writeN(struct adapter *adapter, u32 addr, u32 length, u8 *data)
 	if (length > VENDOR_CMD_MAX_DATA_LEN)
 		return _FAIL;
 
-	ret = usbctrl_vendorreq(intf, value, data, (length & 0xffff), REALTEK_USB_VENQT_WRITE);
+	ret = usbctrl_vendorreq(intf, value, data, length, REALTEK_USB_VENQT_WRITE);
 
 	return RTW_STATUS_CODE(ret);
 }
-- 
2.33.0


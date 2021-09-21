Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE2D3FCE
	for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 18:19:06 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id ee50so4147282edb.13
        for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 11:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jb29YhUiEo2/Z5mRHGHyQpktxwm+oorBHIgt3QfLXoY=;
        b=URMx2XgebU4GsiHTakJKa2hvAQhCAn6jYgNz9/6olzBhuDaQLGwFBjjCWlt6XXn/YS
         1QLVlZhCS4eG2+PHnGugfkexR2d25zEc6UJaS7f47lqaRSu+qVWy7/kfR9k4EN/pLg7O
         lb6Q1AXboqqRQJ/MNND77yuRVN4MxQ7lLCnTMYtOkvshA82nkOPSe5gNW6hO7bfj15Ig
         lmgeISiNVhQ0jFTNc+cxGaSuWCTuZXX0DlaB0Cp+nVKIuUMN+970t2QPwNSWTkLFwlWf
         8P+CpUEEUTRTZlt8g5BlpiIOtbavd2Ea0lcRo1ZTGKDASITPeLadMglQniTXImg5UmPk
         c9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jb29YhUiEo2/Z5mRHGHyQpktxwm+oorBHIgt3QfLXoY=;
        b=wOL3l5fFVIHlUwIS8K+qsPXTjXiV4N/mrlGDGynEctN+D1KNqrjj9REcggMaeHCetb
         fKy7WQt+hz1YJI551KOZUwgARTuFViAoRZEX4xb9/EOhfqKhQNTQ1s4vHfwuReqGRuvX
         blLTbG3OsAqlcAqYmeSFGPkIH0prYO1nNX+jb5AZksxZ9Yl0G1gYDxF3E4F73vty2q2V
         ud1xxIYVvHF/3CjDk0iAM1Q5Wd/nfWf4mThL57sOeP+LinXsUserKjrTtiQCH8+yF0Lj
         A5s6PakK8nFNX8OFLocRzxyg1xOo3SrQ/hwRFMVkFDWHgKjR9yoi7BVHb9qJJt4wPwyz
         8ZeA==
X-Gm-Message-State: AOAM530WhWcYeONbxYGiWf6WUslvaVtTje68gkYksy39SylGZDQM65gl
	WcW7AhQNn4EL1ZyC8jit6cc=
X-Google-Smtp-Source: ABdhPJwxRy4gRY8l3UrJlgkg2ECP8TQHVjOSB4CYxmcGL4Qzss4ALQTke0trmReRZStF8qjWQlrS/A==
X-Received: by 2002:a50:e085:: with SMTP id f5mr22210630edl.9.1632248345094;
        Tue, 21 Sep 2021 11:19:05 -0700 (PDT)
Received: from localhost.localdomain.it (host-212-171-30-160.retail.telecomitalia.it. [212.171.30.160])
        by smtp.gmail.com with ESMTPSA id cn8sm1833162edb.77.2021.09.21.11.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 11:19:04 -0700 (PDT)
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
Subject: [PATCH v9 09/16] staging: r8188eu: remove an buffer from rtw_writeN()
Date: Tue, 21 Sep 2021 20:18:27 +0200
Message-Id: <20210921181834.29677-10-fmdefrancesco@gmail.com>
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

Remove the unnecessary buffer "u8 buf[VENDOR_CMD_MAX_DATA_LEN]" and
pass "data" directly to usbctrl_vendorreq().

Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 5dcab1ee4be0..8e4e578ed60b 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -171,14 +171,12 @@ int rtw_writeN(struct adapter *adapter, u32 addr, u32 length, u8 *data)
 	struct io_priv *io_priv = &adapter->iopriv;
 	struct intf_hdl *intf = &io_priv->intf;
 	u16 value = addr & 0xffff;
-	u8 buf[VENDOR_CMD_MAX_DATA_LEN] = {0};
 	int ret;
 
 	if (length > VENDOR_CMD_MAX_DATA_LEN)
 		return _FAIL;
 
-	memcpy(buf, data, length);
-	ret = usbctrl_vendorreq(intf, value, buf, (length & 0xffff), REALTEK_USB_VENQT_WRITE);
+	ret = usbctrl_vendorreq(intf, value, data, (length & 0xffff), REALTEK_USB_VENQT_WRITE);
 
 	return RTW_STATUS_CODE(ret);
 }
-- 
2.33.0


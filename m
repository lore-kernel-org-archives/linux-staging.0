Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B972BEA9
	for <linux-staging@lists.linux.dev>; Mon, 16 May 2022 09:23:09 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id t11-20020a17090a6a0b00b001df6f318a8bso684190pjj.4
        for <linux-staging@lists.linux.dev>; Mon, 16 May 2022 02:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i9PJvhEX8P9EwLto+E+6JAbwn0v8MnYujSttxKDDDe0=;
        b=gyHPkeZ1dgLRtMeRxdorI5w1fdjB4J3YmtzSTmkYFa8IUSpX0xpHYUz6U+4twmmwTl
         oDF+u4ROFIAMLF6MCty0pjThUiK0gdwlkvt9L5SPTiudgVu2t/wlq0yMl13jv1blq2q6
         oOe+INfi9zlAWSr541+QEzyXk65XY5HikjzRrzPZIWu+QPlPxHIdQPAkWuKMACxu4NZY
         GKHqQyzG9iUvZM2Mor6GFnuymkeDbA/4SWZicX8d21pEIEP/2Zi0IaWQd0F2H59XSl/F
         OSQwkKKFUA2S3Vs7p2xfbEAw/PjGzSA4GCif8M8MVTJLhEriGYPEAqcEoRVyTdOrJPzD
         6p9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i9PJvhEX8P9EwLto+E+6JAbwn0v8MnYujSttxKDDDe0=;
        b=n+hrJWZb29619ZweZX0Rs4QADx/ECoyfxZamaSJzAe/WSeET0K7dGbCimnPnIx3Vk6
         a0s7GdGMq0uNGHDEm2r+bCU0o46XUm0t8bGAsPPG+18z01E82rBphZnVq9xFAuAhLJ44
         vptGnUvoX+cOvh4Ikw2tnlCw6YZLGWJE5HvPbZLIuK/6yQvyufyy7AMAtzU2BCkKzX6w
         cUGB9XN9cgbPXSAeRIFFFdXUaoYSfxt4WK5t666R8FYKv7QdRTSJf2cbG82rC4XvG3WN
         bd5YVXnm7A6oQKuNj8hkXUVGdV4K3I547YGntkjMpjvlSZuV/FsMEnvRvCE4BLkD+H40
         1A5A==
X-Gm-Message-State: AOAM533XYqI2saFe0SKIaz65K3+6GU+gLticAhF5oUcek3VruV1UA5Ea
	CHeb24GzQoQlYgg6lgwJ5Fg=
X-Google-Smtp-Source: ABdhPJwGl7YWcZ8SLmVPhPAWKxynE2PYUESObWv54VNyNT8be9AbTaEW+7OfwtSzHcoQFRJOp91jxQ==
X-Received: by 2002:a17:902:f60e:b0:158:5c4d:d9b0 with SMTP id n14-20020a170902f60e00b001585c4dd9b0mr16947949plg.63.1652692989318;
        Mon, 16 May 2022 02:23:09 -0700 (PDT)
Received: from localhost ([152.70.90.187])
        by smtp.gmail.com with ESMTPSA id l9-20020a17090aaa8900b001dd11e4b927sm8008101pjq.39.2022.05.16.02.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 02:23:09 -0700 (PDT)
Date: Mon, 16 May 2022 17:23:05 +0800
From: Wang Cheng <wanngchenng@gmail.com>
To: dan.carpenter@oracle.com, paskripkin@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] staging: rtl8712: add error handler in
 r8712_usbctrl_vendorreq()
Message-ID: <e33ea53d36c422fbe7eabec5bd9eecb0ebce1bc5.1652618244.git.wanngchenng@gmail.com>
References: <cover.1652618244.git.wanngchenng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1652618244.git.wanngchenng@gmail.com>

When 'status' returned from usb_control_msg() is not equal to 'len',
that usb_control_msg() is on partial failure, r8712_usbctrl_vendorreq()
will treat partial reads as success.

Signed-off-by: Wang Cheng <wanngchenng@gmail.com>
---
 drivers/staging/rtl8712/usb_ops_linux.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8712/usb_ops_linux.c b/drivers/staging/rtl8712/usb_ops_linux.c
index f984a5ab2c6f..b2181e1e2d38 100644
--- a/drivers/staging/rtl8712/usb_ops_linux.c
+++ b/drivers/staging/rtl8712/usb_ops_linux.c
@@ -495,14 +495,21 @@ int r8712_usbctrl_vendorreq(struct intf_priv *pintfpriv, u8 request, u16 value,
 	}
 	status = usb_control_msg(udev, pipe, request, reqtype, value, index,
 				 pIo_buf, len, 500);
-	if (status > 0) {  /* Success this control transfer. */
-		if (requesttype == 0x01) {
-			/* For Control read transfer, we have to copy the read
-			 * data from pIo_buf to pdata.
-			 */
-			memcpy(pdata, pIo_buf,  status);
-		}
+	if (status < 0)
+		goto free;
+	if (status != len) {
+		status = -EREMOTEIO;
+		goto free;
+	}
+	/* Success this control transfer. */
+	if (requesttype == 0x01) {
+		/* For Control read transfer, we have to copy the read
+		 * data from pIo_buf to pdata.
+		 */
+		memcpy(pdata, pIo_buf, status);
 	}
+
+free:
 	kfree(palloc_buf);
 	return status;
 }
-- 
2.33.1


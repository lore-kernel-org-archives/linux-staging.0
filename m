Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A622B2118
	for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 10:38:08 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id j15so34161045eje.9
        for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 03:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2kRd1utQ0XFLJLhNu07hetcx0o+NgkTYajwaCfJlOY4=;
        b=WHElOZQLfB6m1vby6aSvUz16LlOEJkDm8RPH65tmFunekK7r4qddOcpBI7251A4EEk
         Enhr1RCbTJy77Mji41VhJmafNeJAPuTkEhBxeumFwq1UC3i1I7moEXRHEHbUoPqwEq1J
         PIkY0kwoO4/+o4yAn91gT9yLhi2MKM/Cu6miHD+v6vlyELY6pLA9204KpiCW550+2dxU
         tcntQhCNaVvGfBnNZinmbNKch6fc6c7nlxEldX6fUZYcBxzoQoXADfAX41nKInlfVPif
         5KalSEaWMnBFe41yDlubpuKEkIA/lnTFNAJrudwEb9T4zw9vyZu7uoTz7XuGQJ1MsWQc
         Hvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2kRd1utQ0XFLJLhNu07hetcx0o+NgkTYajwaCfJlOY4=;
        b=F33Eqk+zEG+9ZHGMrZgL0/dtbyKAh2Tiy1GdGwuZvgqfqgQNjCLoT8u6VpiyZfyVUh
         15JbO0JdpoGl1FeTyOcmGHSoDSFA6XirrXjUwn6Ayp6S2at55ChorsL4UY93ZoTfb0Pk
         ZF/wWb5U5KdCaT5HVW8HvZgbzf0W7NXNFF6xH/S4qMt7o+L+pJAMoXEzStbTHcbDfUZD
         g/IRJK/V40Q3X8wyP4pvgFW7RO7fMcLQOE0tcVuaGrWirwCIK1iNg9CbhIafytsc1CUU
         nSh8Gp0v1neMsaoG9DCb+QUu7XnP3SHDFsgHxFHmrXoJngXOz9qJTvW3evWMzReXxy1T
         K+bA==
X-Gm-Message-State: AOAM530+tGP6jwijP5E40q8fO54QcN/67lTioBo/RxkK8RS5+FCdVKQF
	9f3uYoCzVKLfvH2gDE2B54w=
X-Google-Smtp-Source: ABdhPJwU2bo+W22b/KjKue5Z6njLOH+Ry09AX9c9Z8ISBv/rBusj2oMODp3UlkouaJTZ3cdYfpelTQ==
X-Received: by 2002:a17:907:6e04:b0:6e0:736b:d786 with SMTP id sd4-20020a1709076e0400b006e0736bd786mr33015803ejc.667.1648550286892;
        Tue, 29 Mar 2022 03:38:06 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id qw39-20020a1709066a2700b006e03017d60csm7058151ejc.54.2022.03.29.03.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 03:38:06 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/4] staging: r8188eu: refactor rtw_usb_bulk_size_boundary()
Date: Tue, 29 Mar 2022 12:37:53 +0200
Message-Id: <20220329103756.6740-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329103756.6740-1-straube.linux@gmail.com>
References: <20220329103756.6740-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using ternary operator to set a variable to true or false is not
needed. Convert two such uses of ternary operator in
rtw_usb_bulk_size_boundary() to just use the condition and return the
value directly instead of using a return variable. This shortens the
code and improves readability. While at it, remove an unneeded line
break from the function head.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/usb_ops.h | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/include/usb_ops.h b/drivers/staging/r8188eu/include/usb_ops.h
index 14526fcff4ae..3416c8baceb6 100644
--- a/drivers/staging/r8188eu/include/usb_ops.h
+++ b/drivers/staging/r8188eu/include/usb_ops.h
@@ -47,19 +47,14 @@ static inline void rtw_reset_continual_urb_error(struct dvobj_priv *dvobj)
 #define USB_HIGH_SPEED_BULK_SIZE	512
 #define USB_FULL_SPEED_BULK_SIZE	64
 
-static inline u8 rtw_usb_bulk_size_boundary(struct adapter *padapter,
-					    int buf_len)
+static inline u8 rtw_usb_bulk_size_boundary(struct adapter *padapter, int buf_len)
 {
-	u8 rst = true;
 	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(padapter);
 
 	if (pdvobjpriv->pusbdev->speed == USB_SPEED_HIGH)
-		rst = (0 == (buf_len) % USB_HIGH_SPEED_BULK_SIZE) ?
-		      true : false;
+		return buf_len % USB_HIGH_SPEED_BULK_SIZE == 0;
 	else
-		rst = (0 == (buf_len) % USB_FULL_SPEED_BULK_SIZE) ?
-		      true : false;
-	return rst;
+		return buf_len % USB_FULL_SPEED_BULK_SIZE == 0;
 }
 
 #endif /* __USB_OPS_H_ */
-- 
2.35.1


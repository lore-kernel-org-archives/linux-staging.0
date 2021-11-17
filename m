Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551F92C83
	for <linux-staging@lists.linux.dev>; Wed, 17 Nov 2021 07:20:30 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 77-20020a1c0450000000b0033123de3425so3981798wme.0
        for <linux-staging@lists.linux.dev>; Tue, 16 Nov 2021 23:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TgMULFmcc96fBRsKNWsxFC73m46YoZVeygK+f1wHseo=;
        b=pSEg0Mh9p5hEEt8mN9ZxtILWfLdO4LFVVmT/eM8NW7kqw5qS3D2JPZ7Z8v7Ic7hwZV
         Zs+43w18b9E3921OdQ1NpQSaW+M1ZmG9H7CgsYno7WxFyJTF/mYRcIPuttFWHLsO2rQu
         jyrdcR51wiD68/Cm5ARAuYkBHT75ro6RH8cNRA7LwLP9Lk8X/cV+tDIIFLZ7zrpvzLvH
         2xXKuO+b/Q1oRgEzEdn4XgZmdMzaK8iMkxuix/JTfRBGCab6cyUlVRkFwElr5PhTzDEa
         gcNHUnWkQMbC2JIihMYXRKpwTbMdLtSWu2NOJSrBbR7+KM5Ty0GyjJXrf4lCtGLSw7oE
         0ptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TgMULFmcc96fBRsKNWsxFC73m46YoZVeygK+f1wHseo=;
        b=kGeXgogBbTRC8IUqdCdOq7fQuLIZogQSbqMsJQWWdDKYrRQoNRr93Lfpo161RfiA6M
         5v/7T8uD6/Nds1CcPrcBRfib/Akcz4F/njDs77Qe22MC8ZmI9CvEAHxQ6DKirCMCJ0CR
         WB6/Y4C1wT9EBdBtB4/c140ll5eoL9jcXlyXQHVkb9r64zS+p9l+vzMNsukWeL7R2jhE
         6fTJaa5NrOgYocOiPd/hppF35C2/WTiwElwVoEpI1EcJKJl1ury2zB4ZRsJc7Q/52YXK
         KcPBW6raTFYBLq5l5btlcdBxnTmHqXkRrXM/GZq4vHqefgFDqY6QCWiwo6MiD6klB0jB
         zbPw==
X-Gm-Message-State: AOAM532CaYlkxHKvkxobytijL2RO+XEUJKm/DUVS9jiSSA32AbNfjwh5
	jutR4E+Hj2IURNwlfQaxEHg=
X-Google-Smtp-Source: ABdhPJzbG3x0zTbiQ9wOKrQi3EDrjDOSzdij/LYzGu6uDxp5Z11TIWuQbgshUm4W1rF65fd/16Ph8Q==
X-Received: by 2002:a05:600c:3553:: with SMTP id i19mr75820715wmq.97.1637133628699;
        Tue, 16 Nov 2021 23:20:28 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::79b5])
        by smtp.gmail.com with ESMTPSA id l2sm5248353wmq.42.2021.11.16.23.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 23:20:28 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: code indent should use tabs
Date: Wed, 17 Nov 2021 08:20:07 +0100
Message-Id: <20211117072007.19924-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace spaces with tab to clear the following checkpatch issues.

usb_intf.c:38: ERROR: code indent should use tabs where possible
usb_intf.c:38: WARNING: please, no spaces at the start of a line

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/os_dep/usb_intf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index 5a35d9fe3fc9..eca1036a721f 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -35,7 +35,7 @@ static struct usb_device_id rtw_usb_id_tbl[] = {
 	{USB_DEVICE(0x07B8, 0x8179)}, /* Abocom - Abocom */
 	{USB_DEVICE(0x0DF6, 0x0076)}, /* Sitecom N150 v2 */
 	{USB_DEVICE(0x2001, 0x330F)}, /* DLink DWA-125 REV D1 */
-        {USB_DEVICE(0x2001, 0x3310)}, /* Dlink DWA-123 REV D1 */
+	{USB_DEVICE(0x2001, 0x3310)}, /* Dlink DWA-123 REV D1 */
 	{USB_DEVICE(0x2001, 0x3311)}, /* DLink GO-USB-N150 REV B1 */
 	{USB_DEVICE(0x2001, 0x331B)}, /* D-Link DWA-121 rev B1 */
 	{USB_DEVICE(0x056E, 0x4008)}, /* Elecom WDC-150SU2M */
-- 
2.33.1


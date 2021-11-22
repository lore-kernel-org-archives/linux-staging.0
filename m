Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4457A2C81
	for <linux-staging@lists.linux.dev>; Mon, 22 Nov 2021 19:53:55 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id q17so15014432plr.11
        for <linux-staging@lists.linux.dev>; Mon, 22 Nov 2021 11:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=AMkuTcoJTkYSjfeIFypgDSDy28ltI3FST8ly2AlCH+k=;
        b=fUgUK1UtUnhY2xM13JM5thRmVs8VPz82G/yccZNMuKOYiJRMP4SNjGMHXaA06rySdQ
         1XE5W55+qoFXLPQv8MCyyx/CV/G0fkezN+k8QphQDwYSQLXRjoLuYtwcZxENdCKw+KKb
         lngRxJBTZ4ZSye0oek5DWObaYQCvqmWwqDEQel+PnKQVciZ1By15Tshry791B3+1tVVx
         Uy6Wdz1wD+wlG1HLQ1bbdV+XTXRPtf+PV8Sdu8vpQVhQDt0UNWTsZtLZ/WSyasetyQWb
         XXGfqRmY0aEiRUw0coFJHhJlKkf8JNlnMmKOwO3eCE5mZyY/kDoaFoTJh5k6dyhEYwTR
         10bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=AMkuTcoJTkYSjfeIFypgDSDy28ltI3FST8ly2AlCH+k=;
        b=d6poZW1JLAEP0DFGS9ecXhXwjddZlgL7dwQRLfL8X9aac/7oD7wZRjfq3YuBJB5GE8
         XQGuVq6aAceDDolSmvgmQ2xKZm+qyUqcNF9wRC2/O9FGNB8Jm8FctoxWFunFqp5L71Q+
         qEnwasxn6yluvKGLvP8yim84IAXIdg6oe7a4KLR20v38GbZOZx3mAUkMmZw60UwSy0Ou
         AoTc2crlMxiOhkkHJYYIg6cbi1k2ecjFCZWunmYFeGdL5WgKkqfPFC0ZGOUbTFtZkt/7
         AvcvUrZU71S6xAeUNCJksKvIfw01/W/xL9T5GyJKlhkH9K1ljVwSK8Wt0ohA6PMNEWyv
         Xlxw==
X-Gm-Message-State: AOAM530epVTGzG3zNISnBz1UfWnBsx5smUIup5k2ocSRNXJfxNQw1uGe
	ywjhWG4umNhtGNhmbptVWqM=
X-Google-Smtp-Source: ABdhPJwM+lCFwmfFMiO8v1VS33gT8JDPpKnUGfSaEXnhaPSeFMpbxHLkG1vZKsQbuPwYXsOsGpkSxA==
X-Received: by 2002:a17:903:22c4:b0:141:deda:a744 with SMTP id y4-20020a17090322c400b00141dedaa744mr112777598plg.25.1637610834850;
        Mon, 22 Nov 2021 11:53:54 -0800 (PST)
Received: from makvihas ([103.238.104.128])
        by smtp.gmail.com with ESMTPSA id t4sm10322369pfq.163.2021.11.22.11.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 11:53:54 -0800 (PST)
Date: Tue, 23 Nov 2021 01:23:50 +0530
From: Vihas Mak <makvihas@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com, martin@kaiser.cx,
	paskripkin@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: r8188eu: remove unnecessary NULL check
Message-ID: <20211122195350.GA166134@makvihas>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

remove unnecessary NULL check surrounding rtw_free_netdev(), as the check
is already performed inside rtw_free_netdev() in
drivers/staging/r8188eu/os_dep/osdep_service.c.

Signed-off-by: Vihas Mak <makvihas@gmail.com>
---
 drivers/staging/r8188eu/os_dep/usb_intf.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index 5a35d9fe3fc9..392bd7868519 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -466,8 +466,7 @@ static void rtw_usb_if1_deinit(struct adapter *if1)
 		if1->hw_init_completed);
 	rtw_handle_dualmac(if1, 0);
 	rtw_free_drv_sw(if1);
-	if (pnetdev)
-		rtw_free_netdev(pnetdev);
+	rtw_free_netdev(pnetdev);
 }
 
 static int rtw_drv_init(struct usb_interface *pusb_intf, const struct usb_device_id *pdid)
-- 
2.25.1


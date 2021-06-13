Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F156D0D
	for <linux-staging@lists.linux.dev>; Sun, 13 Jun 2021 22:00:23 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id l4so4878959ljg.0
        for <linux-staging@lists.linux.dev>; Sun, 13 Jun 2021 15:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a8IxlEz8UeTgLFpNy/eVZ6B8zP8vaSJFbv8R3k+S30I=;
        b=XAHYDOlHieLxkHx8JsBFYlfHNldNu78W6W4X9gVvvXUGSaT6Z5VDHyEeFb0lWaofG2
         9k0QK/Xz8TGjlFzkxJJd3gnZb+DjGN0n4uxj9yCRdKiwL6yzQkFANLYh72swUMQnDpbR
         UX8nUpxCp0TFQCLWIPbE4oTXz3g9DF/Lt8zKhmzfs2Uk3lR3BHqYGlThW+S0xNOcc0bt
         qxjFC7LICHsOOnKshBM5v2nEgJZB/0OzwMCZacHhZd1JSrQK7hZVRGIg3uwNZtnO8csB
         hDijMZyJCaRahiyELnjAVffFwfQMouYd/9SDjOQbk62FJ6832StWY3dqTdeaVZcFmtxq
         X0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a8IxlEz8UeTgLFpNy/eVZ6B8zP8vaSJFbv8R3k+S30I=;
        b=Wq1y+e8biDqM6iAfKNwosGkz2euJBA3ieD9eknPN9pv7AsEM5BKQo17p+Y3ZdAiMD+
         htC++SCKvcLlCAYUsF6mYpWh2WtKAjXnv1figCX7RQECmz9HtjH2VRj7DkXcCK22Y81k
         sZKN8S96wCUEpiYHBbeVTvk9bVJOQ6jgFArQ94+ecR4FI4TjkAHdyZbkJ34bRBaoDmCh
         6L/YK43WorMLUiif7MGrE0A0u3bry5qaWMCN+UMkZkmueMljEGZ2cQLZXkRDU9FZQTDf
         o5wFZeZAaRAbh2fzQxuNZrWaiob33hXuygkzage32pz+yBA0MeWmWY53HGPN2osarAxV
         Z8Bw==
X-Gm-Message-State: AOAM533b5n8cYmSoI/734qEFjrAQJ258XMrNS0w1OXMrjLlpHH2SAgaJ
	bpeEF3ydxggVJlOg+3Jcidg=
X-Google-Smtp-Source: ABdhPJxdgf41BUap//pV72ZYfdDkUJGx1BSn76T+9UpNdwIW7NKSjTrKIj+rK4ui9a7vzEUJDCJWoA==
X-Received: by 2002:a2e:b528:: with SMTP id z8mr11162776ljm.350.1623621621739;
        Sun, 13 Jun 2021 15:00:21 -0700 (PDT)
Received: from localhost.localdomain ([94.103.229.24])
        by smtp.gmail.com with ESMTPSA id q19sm862668lfu.307.2021.06.13.15.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 15:00:21 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH 3/3] staging: rtl8712: fix memory leak in rtl871x_load_fw_cb
Date: Mon, 14 Jun 2021 01:00:19 +0300
Message-Id: <81e68fe0194499cc2e7692d35bc4dcf167827d8f.1623620630.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1623620630.git.paskripkin@gmail.com>
References: <cover.1623620630.git.paskripkin@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a leak in rtl8712 driver.
The problem was in non-freed adapter data if
firmware load failed.

This leak can be reproduced with this code:
https://syzkaller.appspot.com/text?tag=ReproC&x=16612f02d00000,
Autoload must fail (to not hit memory leak reported by syzkaller)

There are 2 possible ways how rtl871x_load_fw_cb() and
r871xu_dev_remove() can be called (in case of fw load error).

1st case:
	r871xu_dev_remove() then rtl871x_load_fw_cb()

	In this case r871xu_dev_remove() will wait for
	completion and then will jump to the end, because
	rtl871x_load_fw_cb() set intfdata to NULL:

	if (pnetdev) {
		struct _adapter *padapter = netdev_priv(pnetdev);

		/* never exit with a firmware callback pending */
		wait_for_completion(&padapter->rtl8712_fw_ready);
		pnetdev = usb_get_intfdata(pusb_intf);
		usb_set_intfdata(pusb_intf, NULL);
		if (!pnetdev)
			goto firmware_load_fail;

		... clean up code here ...
	}

2nd case:
	rtl871x_load_fw_cb() then r871xu_dev_remove()

	In this case pnetdev (from code snippet above) will
	be zero (because rtl871x_load_fw_cb() set it to NULL)
	And clean up code won't be executed again.

So, in all cases we need to free adapted data in rtl871x_load_fw_cb(),
because disconnect function cannot take care of it. And there won't be
any race conditions, because complete() call happens after setting
intfdata to NULL.

In previous patch I moved out free_netdev() from r8712_free_drv_sw()
and that's why now it's possible to free adapter data and then call
complete.

Fixes: 8c213fa59199 ("staging: r8712u: Use asynchronous firmware loading")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/staging/rtl8712/hal_init.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/rtl8712/hal_init.c b/drivers/staging/rtl8712/hal_init.c
index 715f1fe8b472..22974277afa0 100644
--- a/drivers/staging/rtl8712/hal_init.c
+++ b/drivers/staging/rtl8712/hal_init.c
@@ -40,7 +40,10 @@ static void rtl871x_load_fw_cb(const struct firmware *firmware, void *context)
 		dev_err(&udev->dev, "r8712u: Firmware request failed\n");
 		usb_put_dev(udev);
 		usb_set_intfdata(usb_intf, NULL);
+		r8712_free_drv_sw(adapter);
+		adapter->dvobj_deinit(adapter);
 		complete(&adapter->rtl8712_fw_ready);
+		free_netdev(adapter->pnetdev);
 		return;
 	}
 	adapter->fw = firmware;
-- 
2.32.0


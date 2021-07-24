Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086B8173
	for <linux-staging@lists.linux.dev>; Sat, 24 Jul 2021 20:55:47 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id e19so9091020ejs.9
        for <linux-staging@lists.linux.dev>; Sat, 24 Jul 2021 13:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=6uCQCRQPCT19AFCHKSbasFjoqzaU46ALDrk/HwseUHg=;
        b=d6yJVNEypat1rndFBJKM+v3nmwf5LgBiY9J9EAAmJmBw8dCk87cUQ6CDMpwu6E1MEk
         byFxlzKDGImIzhWoOkjmih/B9MzEa1fy9cIq/NzoDk4apMOKzn8tKQ6SAi68Zcy99GYg
         CnmhgIealop1K18b7c0bnN8xUCt04pB66ldwZ1AtjaHo1esCpvaH4kcaxKTB2DJB2ID5
         c0ln3RY/M41H67hbMm+OEQ2PsQabujMK4bMYJH3fuF0+8lJkfKjq3QYjzE0WAkecOFUr
         tHZH5lN3/mFmHYcyPdm7G3Qd4/0U1ZZdHoqqdHxYGN9PB+F0L3KSZgHHOM+z2u+QrWh7
         heBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=6uCQCRQPCT19AFCHKSbasFjoqzaU46ALDrk/HwseUHg=;
        b=dqPdMI9Q3wl02M5VrJ7/pi10GEUM/521fPT/UdRynqKkbzMKCrKGPrKEjLnSAQYHVI
         hczPapv0zkWQPzy4MksPg98OZRL7nDueMtdYG9XxtMYzs3cuWiTzuLpo/rLBJqiXR/WJ
         WMwrL3B1iDsrBsV/rSLAOgMYfuwy+9CPiHyMztdN4ol3BIaL1ZSmmyBV0f3jk3Qizk9E
         LCK0f+nCf6EpDmibnRMx64Jj+hUG63ZzSpA1vlVAOuOA09vMNIKFtgwdnS0A+3wwk9tL
         nl3UMUS7ds2nqca+/QiZVy4tOViICMHWRDWsowfqgON2Y2vUfqPIUUGd9dAvjfJ7cJRQ
         zgHA==
X-Gm-Message-State: AOAM530OVMa6Xjiy2m9zkdZYrgxuedgjXFRyeFmpoOgqhA9ewNIshdH4
	KLmpkiCn9AB8KEXDc/BR4o0=
X-Google-Smtp-Source: ABdhPJxc89QyHL4WWFW8E1PJmzYDAd71rLOlZ4bVOYb6DwnUrgGzA1xEho8+HXz3ikCwMxxGSz/gOQ==
X-Received: by 2002:a17:906:cb8b:: with SMTP id mf11mr10382461ejb.297.1627160146271;
        Sat, 24 Jul 2021 13:55:46 -0700 (PDT)
Received: from pc ([196.235.233.206])
        by smtp.gmail.com with ESMTPSA id x13sm14569817edv.40.2021.07.24.13.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 13:55:45 -0700 (PDT)
Date: Sat, 24 Jul 2021 21:55:42 +0100
From: Salah Triki <salah.triki@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	Ross Schmidt <ross.schm.dev@gmail.com>,
	Marco Cesati <marcocesati@gmail.com>,
	Brother Matthew De Angelis <matthew.v.deangelis@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Ivan Safonov <insafonov@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] tablet: acecad: update the reference count of the usb
 interface structure
Message-ID: <20210724205542.GA549014@pc>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use usb_get_intf() and usb_put_intf() in order to update the reference
count of the usb interface structure.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/input/tablet/acecad.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/input/tablet/acecad.c b/drivers/input/tablet/acecad.c
index a38d1fe97334..85fe134a30ee 100644
--- a/drivers/input/tablet/acecad.c
+++ b/drivers/input/tablet/acecad.c
@@ -151,7 +151,7 @@ static int usb_acecad_probe(struct usb_interface *intf, const struct usb_device_
 		goto fail2;
 	}
 
-	acecad->intf = intf;
+	acecad->intf = usb_get_intf(intf);
 	acecad->input = input_dev;
 
 	if (dev->manufacturer)
@@ -236,6 +236,9 @@ static void usb_acecad_disconnect(struct usb_interface *intf)
 	input_unregister_device(acecad->input);
 	usb_free_urb(acecad->irq);
 	usb_free_coherent(udev, 8, acecad->data, acecad->data_dma);
+
+	usb_put_intf(acecad->intf);
+
 	kfree(acecad);
 }
 
-- 
2.25.1


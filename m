Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBC23FC6
	for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 23:54:22 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id j13so53996619edv.13
        for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 16:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yoxfg1/FcSiARfNU+jPYNat+4eHygLLGuEwb7dEESSg=;
        b=i5bSKv7QdeEfoSfHm5QJHBy9FUVjhgX6jbNm0mQWjvrAVmvKjVI+K7xHf9m4CZzFOQ
         tmcdhY49jNIznZHcR3T5B4l9MChXLtoNOsbv5wqU3AGP9sH7VTkfVr9i77gP9JN4BDYX
         Bpcwb8kRawBPcRLTvbYX1MuotSmNTYVbmeOuNU/AXnugZJywNFT2CvzdG+S87KUwopSX
         co/YDXyRaw7p3kHi+Uz0SsortvCnT6TeN8E1aLnlzcCW16hplsyBdX8btgxMPEui2JYC
         XRZwTJ0yFGbw0VVmn0zTnzUhhuxhQ3p5jIEM46h42a8DkpStmuOZ8vEFYtj3mhl1OZdw
         RSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yoxfg1/FcSiARfNU+jPYNat+4eHygLLGuEwb7dEESSg=;
        b=A2pVc5XV0vZoGgHSs/hmA1S1nHFNKluEIdiWp2D26orbdMsV2w5vvam8fibnDrIcP6
         HXvM+1zcm8LW//PjRAEhIOQF5yEcCrOSrZDgfX5kn1Ac97Ex1rnXyLa3JLVCH/lDZz41
         82kLxGfEaYEY/JI/V0KJCTG/sHNF+04AKzFrHeGkEuaNDT2GqpSH2n+Bj8iq5hhGuAgC
         FRaOmfjBBJ3em0qcfaqCjU6IDhu9EfK+H4mZeR43LsdEj2nRZvWAQ5oSv8Bm2y7zGNsw
         XMiRCOMHzM7scwpjUn3fpmWCYhQVo2xgXQ+Zn2+4YWDTY5GMJZQ7ADAZUi7unKErfPRG
         UDrg==
X-Gm-Message-State: AOAM532Z0lIFWgui0eZmKcuYtFT6KkOBz7hqgyk7DYQAHtVDjnaFDaT0
	K7gDwKyW43jEgtvT+20JzVw=
X-Google-Smtp-Source: ABdhPJz2KvPUTI4l+SPpmeBJzGBgDaiLSaw9Anf1fKPoFPupXUg4sZ3V5tR2GTcPOn6qWnXhrmBuMg==
X-Received: by 2002:a05:6402:21c3:: with SMTP id bi3mr351829edb.79.1632095660433;
        Sun, 19 Sep 2021 16:54:20 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-104.retail.telecomitalia.it. [79.47.104.104])
        by smtp.gmail.com with ESMTPSA id e11sm5353636ejm.41.2021.09.19.16.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 16:54:20 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Laight <david.Laight@aculab.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v8 14/19] staging: r8188eu: remove an unnecessary bit AND from rtw_writeN()
Date: Mon, 20 Sep 2021 01:53:51 +0200
Message-Id: <20210919235356.4151-15-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210919235356.4151-1-fmdefrancesco@gmail.com>
References: <20210919235356.4151-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove an unnecessary bitwise AND because "length" can never be greater
than 0xffff since VENDOR_CMD_MAX_DATA_LEN is defined as (a weird) '254'.

Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index aa57bd7b8f10..625b29af9410 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -178,7 +178,7 @@ int rtw_writeN(struct adapter *adapter, u32 addr, u32 length, u8 *data)
 	if (length > VENDOR_CMD_MAX_DATA_LEN)
 		return _FAIL;
 
-	ret = usbctrl_vendorreq(intfhdl, value, data, (length & 0xffff), REALTEK_USB_VENQT_WRITE);
+	ret = usbctrl_vendorreq(intfhdl, value, data, length, REALTEK_USB_VENQT_WRITE);
 
 	return RTW_STATUS_CODE(ret);
 }
-- 
2.33.0


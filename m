Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1C715AA
	for <linux-staging@lists.linux.dev>; Fri, 20 May 2022 03:57:59 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id n6so3914856wms.0
        for <linux-staging@lists.linux.dev>; Thu, 19 May 2022 20:57:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pNHvSj7Qlaisn5x9H/7CDWdcNlvF8ouTuEdsvQFM/ZA=;
        b=h3F2+uWK8RlATEwlXI4LaaC1ktdwLjv2yaTkHZgMSlaK/SxBaey8q5x6sP4BTAXmX3
         r3kei3jpBsAb/Dxjz8xWGD2aBBCgkCXzod7UssjG4yQZDQcEB6+nV/8mGasH7V0gOxEo
         U90bWQtxocEOI14v75v7sGtoq7PU9+erwwFRJi6wKuIIzKJDPz5w//5kNjreYMOxURiS
         0SfG8kzt6TbpN/TDd3W6pFYLhI1+76gg/jhPLBTs9qDOaT9Wp1v7qHimJpPQ3zlRs1I0
         Z+gQRGtvl+ZBw8tLV4SbywZ+Uxkv/GMAoe32JA6f5B8k4e1J4CAYdqcnZ/YFY/h9NNV2
         C+qw==
X-Gm-Message-State: AOAM530+A+HvRw1PNWGX53dB7VlJEU7JJ9T3gJFKpJL9FgwlRr2nsj6S
	0aDGc5qfO1+/qOmV85C53NA=
X-Google-Smtp-Source: ABdhPJwEnqc3qcnxLHbZP1A2PzFVsK+V1WqW5Vkp1tqMoVO29pwCKaxpouzu2iQPE6xw046SLF/fTw==
X-Received: by 2002:a05:600c:3b0a:b0:394:6373:6c45 with SMTP id m10-20020a05600c3b0a00b0039463736c45mr6731690wms.69.1653019078230;
        Thu, 19 May 2022 20:57:58 -0700 (PDT)
Received: from localhost.localdomain ([94.205.35.240])
        by smtp.googlemail.com with ESMTPSA id z17-20020a05600c03d100b0039732f1b4a3sm1146878wmd.14.2022.05.19.20.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 20:57:57 -0700 (PDT)
From: "Denis Efremov (Oracle)" <efremov@linux.com>
To: gregkh@linuxfoundation.org
Cc: "Denis Efremov (Oracle)" <efremov@linux.com>,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	dan.carpenter@oracle.com,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	stable <stable@vger.kernel.org>
Subject: [PATCH v5.10] staging: rtl8723bs: prevent ->Ssid overflow in rtw_wx_set_scan()
Date: Fri, 20 May 2022 07:57:30 +0400
Message-Id: <20220520035730.5533-1-efremov@linux.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <YoZk3YLEDYKGG5xe@kroah.com>
References: <YoZk3YLEDYKGG5xe@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This code has a check to prevent read overflow but it needs another
check to prevent writing beyond the end of the ->Ssid[] array.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable <stable@vger.kernel.org>
Signed-off-by: Denis Efremov (Oracle) <efremov@linux.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index 902ac8169948..083ff72976cf 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -1351,9 +1351,11 @@ static int rtw_wx_set_scan(struct net_device *dev, struct iw_request_info *a,
 
 					sec_len = *(pos++); len -= 1;
 
-					if (sec_len > 0 && sec_len <= len) {
+					if (sec_len > 0 &&
+					    sec_len <= len &&
+					    sec_len <= 32) {
 						ssid[ssid_index].SsidLength = sec_len;
-						memcpy(ssid[ssid_index].Ssid, pos, ssid[ssid_index].SsidLength);
+						memcpy(ssid[ssid_index].Ssid, pos, sec_len);
 						/* DBG_871X("%s COMBO_SCAN with specific ssid:%s, %d\n", __func__ */
 						/* 	, ssid[ssid_index].Ssid, ssid[ssid_index].SsidLength); */
 						ssid_index++;
-- 
2.35.3


Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED642F27
	for <linux-staging@lists.linux.dev>; Mon, 23 May 2022 17:40:13 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id s28so22275082wrb.7
        for <linux-staging@lists.linux.dev>; Mon, 23 May 2022 10:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ua1KG5+18UaDCNZFTJYl8j8EfhH8Jue+YMkQxpze3FM=;
        b=GIKOCJ3MH8q5L0IzYsmyQJjttc4wJ/ntW7UaGyCh7sAzbQ0UFQUdN88uYSwuJ6DLuQ
         q31JNBEJwhMnU7/eMx6S/2muPOuETe0ir05jSqyaXWsYUsfDX0W/td1pKurW97VibA1O
         mkU+x9z63o/+S7q+JhlMzcNzGc74qnyJatlu4WrXYPFZ66ibrWaGDBXPNXPbASbw0W3M
         4GYbv/iGnU1AACzHmlZqqcSngl62Gqt0Ez5cR5gq0EU2/iDkiyN6GK4n0GKjcrZCRcyo
         14T2YkqLQJysIKYmb6eXX8oGhFNS462Bgv7ReG752lFz5dXGswlsqYUJLa6vszKuBowq
         RQEg==
X-Gm-Message-State: AOAM532IlRJFcpzXofjSFyvUayHUUPqsLry4ZCzPALkQuVnyp7onl+1U
	jytk+Xgf+bJ2SWKjG1Gu3CM=
X-Google-Smtp-Source: ABdhPJxCnDyHcwKiqN87su/K7JV25u7QznK3u4WJ7C556Si7ECVW2PYU+dvPeWktzLbqMV+ExD3CUg==
X-Received: by 2002:a05:6000:18ab:b0:20c:8d82:52c3 with SMTP id b11-20020a05600018ab00b0020c8d8252c3mr19720747wri.701.1653327611353;
        Mon, 23 May 2022 10:40:11 -0700 (PDT)
Received: from localhost.localdomain ([94.205.35.240])
        by smtp.googlemail.com with ESMTPSA id o8-20020a1c7508000000b003942a244f2fsm9444242wmc.8.2022.05.23.10.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 10:40:10 -0700 (PDT)
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
Subject: [PATCH v5.4-v4.14] staging: rtl8723bs: prevent ->Ssid overflow in rtw_wx_set_scan()
Date: Mon, 23 May 2022 21:39:43 +0400
Message-Id: <20220523173943.12486-1-efremov@linux.com>
X-Mailer: git-send-email 2.36.1
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
index d8d44fd9a92f..ea2fd3a73c3a 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -1351,9 +1351,11 @@ static int rtw_wx_set_scan(struct net_device *dev, struct iw_request_info *a,
 
 					sec_len = *(pos++); len-= 1;
 
-					if (sec_len>0 && sec_len<=len) {
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
2.36.1


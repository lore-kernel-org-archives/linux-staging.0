Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644DE2FB0
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 13:37:47 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id x17so2399245edd.12
        for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 06:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fRJ7RvMKEMa0fIfZ1uQiITrFu/nbTu47gWA816rN7L4=;
        b=Re0xaXWymNrPYzyIEkg758nyjfjcOzurX09W25Tu+ziXm1ofnaFQ7NhHAXAUHpgxP7
         1fAonAD3W357XsWPXtZDj7GmzYvzmYZrGxjXxKMzzzNb2ueoUh0B9Jm3KkcT9EuSwxxw
         WAhbi0Y7vhRT5wbr0oS+/ei9OKkVqacuDbFKe98zRj2ICl1PYkFTlMy48D35Mqb9thNX
         DjEKQEE+Jlru7mIhzshK58ZS2QmA8cdzRJOF8ewirmowaduKQY1qISz2XTk1xmFH7WTT
         cqFimjo+qppaoyCCYHX196N6IotBpAeV3emg4jLUdCw2fB+CvbDTZRLSI9KTgX8xCSSr
         xbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fRJ7RvMKEMa0fIfZ1uQiITrFu/nbTu47gWA816rN7L4=;
        b=pr09VWLQ96Vg3DXPywMO4wz7tgGmjlWDNeMLF7etsgcIfBmcq4T5FV3J0UGPGZKp6o
         ruo7DcSFwyqZmvCr0VIiIjQf8dxZGRxR0GCBr1/plYUX/5mMVeI+eXtzOihdPa78lOTK
         3UNu20jK8Ju9xDnKsy6Ku6SH3I/k+YIQXU8Lufy2/h3ve0ORy+smbCWr9bzAWIEWYSxv
         6V09SHFIJ5N3rrCEKZ1dLWem1Qu1AInQMBpRf4MXrv5+VKodXx4eQ6Odp4kbz8W+gV78
         2HiIW312WDQOVrDJt3rFyhZ/w+Um+24QxwBNmt+t/VMVS9c77NNJZklp+GUvC3HodU+q
         eH8w==
X-Gm-Message-State: AOAM531yKePQ7TEzx904xCtwzZKtOeoIEIOPWlOoEmMlBYUmQZufXTbb
	268/LdcB5lkfzc6OfP8d8DY=
X-Google-Smtp-Source: ABdhPJzNa964HjWEwqhSVeRv2wFeAhWdwIa6wFmV28/brjyNp1Ati3AN9UVdyHIaE2IH/Xbaqj10Ng==
X-Received: by 2002:a50:d642:: with SMTP id c2mr47495898edj.22.1626874665832;
        Wed, 21 Jul 2021 06:37:45 -0700 (PDT)
Received: from agape ([5.171.73.45])
        by smtp.gmail.com with ESMTPSA id hd30sm8300162ejc.29.2021.07.21.06.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 06:37:45 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/16] staging: rtl8723bs: remove unused struct ndis_802_11_ai_reqfi
Date: Wed, 21 Jul 2021 15:37:21 +0200
Message-Id: <00ed84b66a0a325cb1a09ad6e2d2c0fa19686a88.1626874164.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1626874164.git.fabioaiuto83@gmail.com>
References: <cover.1626874164.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused struct ndis_802_11_ai_reqfi.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/wlan_bssdef.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index 1915b524fd2d..f0977b15c81e 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -107,12 +107,6 @@ enum {
 #define NDIS_802_11_AI_RESFI_STATUSCODE        2
 #define NDIS_802_11_AI_RESFI_ASSOCIATIONID     4
 
-struct ndis_802_11_ai_reqfi {
-	u16 Capabilities;
-	u16 ListenInterval;
-	NDIS_802_11_MAC_ADDRESS  CurrentAPAddress;
-};
-
 struct ndis_801_11_ai_resfi {
 	u16 Capabilities;
 	u16 StatusCode;
-- 
2.20.1


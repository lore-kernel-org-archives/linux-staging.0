Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577357E;
	Thu, 20 Oct 2022 02:14:44 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id h185so17927217pgc.10;
        Wed, 19 Oct 2022 19:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cxlbEVDeF4plEeh62JkmWpXJNLBpkyMDDpLc8c5MkU=;
        b=i/ZHwd6vtO8tnDAAAmZSyChgftK9wsSwRMKMhPJZoaiURvJ8gEdumCl6AOR1lR5ZKf
         KiSg3hanIqMlz291v/w0umgZzgIlR2uzUcVqDvwEixzgGYYzFsSMdrIaIuQlV6Rw6F53
         xPstk3O+7bTDGXwmtBKvBDzmThnbs3TbXKwf927+rJ53uQ2sN/9sRQUSqFF2vlWe+TW0
         IDpScgosPWp7njzSoz9BBlkhTkXfAIyb7j0ZGWvQir9/DCt8HA9tw0YwQ958YU3pyPk+
         x00xiEredWYJvKcyy8BxPhMoxSrwqcywKSGxXYxgemgV3tJp8+lcglLt5p1gphgCPvMM
         Rldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5cxlbEVDeF4plEeh62JkmWpXJNLBpkyMDDpLc8c5MkU=;
        b=P6rJeyU6yTW1ihnq/LZf2ZHwUwtdBXLWlCs7AnjbZAHrQrRviARybrfkaj4mxwszC/
         nPin7AKnV079ZQjp6UaTX4cPonXqvg2TuVax5C1kUueH4H5xk0aNbmsJ1t2Ed1rOfceb
         RhYql4HyQD256QXG1hl3ubXBbDVxyzYWg0whG+RbYHkvN9OFX7lb216PYMwmyhrjkYej
         y/74P+WdJXdMn8qVxF8WT3un8oi9eKZlEG7XunIeT3bdRiDg1vk1ZIBVunxK7kUM9CBy
         0Xj7IrQnzStilzEL7p/AVVdM3ORH1HJ46bYsHf62XI06ynDiR9axL6u9KZObKDLyNn/C
         G4QQ==
X-Gm-Message-State: ACrzQf2BzsZjPDMn3oZ7aD7ZLfnntY2OCAZWrPOCprkrUkgGhXep6fQM
	+DF0wFtbs3Lpn35SeG1Isws=
X-Google-Smtp-Source: AMsMyM6w3Kn9m+GCRlAqC2fbXBLFG9tRtOfO2XMsER+YC571XMz1GzczedPWGtvXX0+kFvqmMtE5Qw==
X-Received: by 2002:a63:2c8:0:b0:46e:9da9:8083 with SMTP id 191-20020a6302c8000000b0046e9da98083mr456343pgc.186.1666232083946;
        Wed, 19 Oct 2022 19:14:43 -0700 (PDT)
Received: from localhost.localdomain (192-184-163-51.fiber.dynamic.sonic.net. [192.184.163.51])
        by smtp.gmail.com with ESMTPSA id n18-20020aa79852000000b005631af4ece2sm11942936pfq.182.2022.10.19.19.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 19:14:43 -0700 (PDT)
From: Emily Peri <eperi1024@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Emily Peri <eperi1024@gmail.com>
Subject: [PATCH 3/3] staging: rtl8723bs: remove unnecessary parenthesis
Date: Wed, 19 Oct 2022 19:10:53 -0700
Message-Id: <a08a440eabddd8e78d045ca9898a415d81f6f6d7.1666230736.git.eperi1024@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666230736.git.eperi1024@gmail.com>
References: <cover.1666230736.git.eperi1024@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove extra parenthesis in conditional statement in rtw_ioctl_set.
Issue found by checkpatch.

Signed-off-by: Emily Peri <eperi1024@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index ac957035bf1a..32194dabd587 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -160,7 +160,7 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
 	if (check_fwstate(pmlmepriv, _FW_LINKED|WIFI_ADHOC_MASTER_STATE) == true) {
 		if ((pmlmepriv->assoc_ssid.ssid_length == ssid->ssid_length) &&
 		    (!memcmp(&pmlmepriv->assoc_ssid.ssid, ssid->ssid, ssid->ssid_length))) {
-			if ((check_fwstate(pmlmepriv, WIFI_STATION_STATE) == false)) {
+			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == false) {
 				if (rtw_is_same_ibss(padapter, pnetwork) == false) {
 					/* if in WIFI_ADHOC_MASTER_STATE | WIFI_ADHOC_STATE, create bss or rejoin again */
 					rtw_disassoc_cmd(padapter, 0, true);
-- 
2.34.1


Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614513FC0
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 03:51:50 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id e16so10994186pfc.6
        for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 20:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P9EaOddgjGHWKa1hfy/bkvRGYT7C3PEOQViDOoYT8Mc=;
        b=WRP9CwMAqKWVwnyMxlEBZg6B9BocZAL8gFO58Bji7zGiYyS45bHkR/0Jwh2B6nlQPx
         qv7xftR5w9idarl83neWX7So0X1lGJzjquyHP56g6kg2oEWBIoRyzMI9+glbQuug+BQ5
         1hEEw1HTiQ8O7tEF1HvwNW980/2aY7VTTnl2+/Du0hzkKzLXMgKw4G0qmqi9vlkUn92q
         PzeU+N5x4yRgepapFVw4wlUpyqaKa5+odpubiqLQ2RMDyWwIUEphqoEP1p9UVPRHIa4E
         Si6mzCU0O4YKGaq7mITkRm1/rMevHsaqTtJR2tLNqIaWZO458ntWC4yzU6Ur0ZcE81By
         x6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P9EaOddgjGHWKa1hfy/bkvRGYT7C3PEOQViDOoYT8Mc=;
        b=kRa1Pdoa2wMvvVcQpssEWhfc548O2VwtmLX0Gc12G1n4KFGl1IDgU7RzPyQIpBDRMX
         Ce5qSy4CPLQBqEdFlsj4w4N1HXgk2GqOqduuBtNlVZ0y0+/HgBuaQqYLYRx+uVwXFikP
         EJsFC47AbWbT1xBK/vEghIAzyfRoufvnRxNAWbG3QdUCjYJS7F7jwQ/1SLWw+X72NSv8
         W6rBnc8D7T0ZKp0vrkFYLnk7dRcGkR8JYamCh0CG+hnwMDjWjwVwAFVrGwGHt0IE0HBQ
         wdmhcag7WIBqu2B08cUdM53AOi8BA0RwAbTkFVfMlN9O9mKR5Okzmi3AvHB51I5tum46
         /hsw==
X-Gm-Message-State: AOAM530A/sdudSxLmeNOcrRlDp2Y643rjcVClQJ9/+e6h3e8jgRx3NlH
	zTYm3Ghc9uy1WhJk7+4VC4M=
X-Google-Smtp-Source: ABdhPJzksjkryhcdqSYY7Jupc9C/7lmAs2BQHpRzN2LxwD/D8rbN0uPbwd8ZQNtCknjRsoXTjiuNPA==
X-Received: by 2002:a05:6a00:1481:b0:43d:275b:7ba4 with SMTP id v1-20020a056a00148100b0043d275b7ba4mr14016465pfu.63.1631937109964;
        Fri, 17 Sep 2021 20:51:49 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id v14sm7362008pfi.111.2021.09.17.20.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 20:51:49 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	fmdefrancesco@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Changcheng Deng <deng.changcheng@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH V2] staging: r8188eu: Use kzalloc() instead of kmalloc()+memset()
Date: Sat, 18 Sep 2021 03:51:41 +0000
Message-Id: <20210918035141.237455-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Changcheng Deng <deng.changcheng@zte.com.cn>

This place can use kzalloc() directly instead of calling kmalloc() then
memset(). Replace them.
At the same time,error code that is "ret = -ENOMEM;" should be added
here.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index ac218da94ce5..2fb34964f8c8 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -463,11 +463,12 @@ static int wpa_set_encryption(struct net_device *dev, struct ieee_param *param,
 		if (wep_key_len > 0) {
 			wep_key_len = wep_key_len <= 5 ? 5 : 13;
 			wep_total_len = wep_key_len + FIELD_OFFSET(struct ndis_802_11_wep, KeyMaterial);
-			pwep = kmalloc(wep_total_len, GFP_KERNEL);
-			if (!pwep)
+			pwep = kzalloc(wep_total_len, GFP_KERNEL);
+			if (!pwep) {
+				ret = -ENOMEM;
 				goto exit;
+			}
 
-			memset(pwep, 0, wep_total_len);
 			pwep->KeyLength = wep_key_len;
 			pwep->Length = wep_total_len;
 			if (wep_key_len == 13) {
-- 
2.25.1


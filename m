Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9532C83
	for <linux-staging@lists.linux.dev>; Thu, 28 Oct 2021 04:31:44 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id v1-20020a17090a088100b001a21156830bso6972666pjc.1
        for <linux-staging@lists.linux.dev>; Wed, 27 Oct 2021 21:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=YLVqItwDwS1zsr5x88IEWScrP6oWEhxTvH4fkBYiiHo=;
        b=qayOMmtY7e47aAYzDpc+3eSrBmTdoNa3sH4+nrM9F8Rd+AznQQ0/Mmeaunt4vENZcb
         Fz2dm268n2HEhB2AraFIfUlyUGmkD6SfgLx0T+MOUJSlzbcosbYRaQnDxWIDzvn64ZsE
         u7CuipJmi3R8V2AQYw3EA76Kn3+QHqfUE2C17084d+UzWtBFtqhpWHwgMChvQDhFR1n3
         Aa5ZkIkZhVAU6M/I6J0csg49avs8RspP3Yq42H3m3gHKrRS8rkNAHv+2PE10ab+AVYYw
         hvH3Rt0gQzjxKALFyuJV5hnWlT4B0MlCsyq9SRjSSMBuq9ON1hP6wUmCD48YyLeFK5hu
         D6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=YLVqItwDwS1zsr5x88IEWScrP6oWEhxTvH4fkBYiiHo=;
        b=LgHKwFrwcHTkpFSgbBfPUutPeaA2SFkYrh09vKkgUQI7u7UkQ7ZJH6kY5iqsdMqLEF
         D+1AFEx3B3sDigCFhLWtyPD9svz+xHhAlZB9ym8rQKiOUwO8uToRWqos4JcHyX/K7+D2
         CsdgMNvWAfZRvy8rHbYKaKh2yMVs7EmBZ7sOxh0jtF78YYsRHJW7PvD7jus8xcSchY+y
         WBmDIdo7WrQQWOn7mfutUDlBSckkHFvoDAGe29X9Lhg5ihoglMJKnVW4SZW1RtLpZWS+
         Nsm90OI/2Xr7Uj94EUyQnto2083K+kGQBzGc2SKv4MEsWCmmWCTwE2bqIUHBt/xh8k+p
         YR5Q==
X-Gm-Message-State: AOAM533hVOC7XG6yxN6+4nLLwHPY9440O9eNRbCJ4erTRyF3ZPITfHZg
	YIb6T7/hGG108roKlcsFceE=
X-Google-Smtp-Source: ABdhPJwrLY6F+T2x04+PqtbhhJ6qMJh+dPS9vxQjLiFJJ4TJDWgbfkHqpCZNTUVjLkYU2x80mx7QQw==
X-Received: by 2002:a17:902:7781:b0:13d:c9fe:6184 with SMTP id o1-20020a170902778100b0013dc9fe6184mr1591119pll.25.1635395504000;
        Wed, 27 Oct 2021 21:31:44 -0700 (PDT)
Received: from Sauravs-MacBook-Air.local ([59.95.83.133])
        by smtp.gmail.com with ESMTPSA id d11sm1551128pfv.185.2021.10.27.21.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 21:31:43 -0700 (PDT)
Date: Thu, 28 Oct 2021 10:01:33 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, alec@vc-celle.de,
	saurav.girepunje@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: rtl8712: remove the condition with no effect
Message-ID: <YXonpdnCatbuOo8H@Sauravs-MacBook-Air.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove the if condition check and else code section in
query_rx_phy_status(). As variable cck_highpwr is assign a value of '0'
after this assignment, if condition check !cck_highpwr is always
going to be true. So remove the if condition check as well as else
section which will be never true.

After removing the if condition there is no use of local variable
cck_highpwr. Remove the local variable cck_highpwr.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/rtl8712/rtl8712_recv.c | 75 +++++++++-----------------
 1 file changed, 26 insertions(+), 49 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl8712_recv.c b/drivers/staging/rtl8712/rtl8712_recv.c
index 0ffb30f1af7e..f04c454e16a6 100644
--- a/drivers/staging/rtl8712/rtl8712_recv.c
+++ b/drivers/staging/rtl8712/rtl8712_recv.c
@@ -708,7 +708,7 @@ static void query_rx_phy_status(struct _adapter *padapter,
 	s8 rx_pwr[4], rx_pwr_all;
 	u8 pwdb_all;
 	u32 rssi, total_rssi = 0;
-	u8 bcck_rate = 0, rf_rx_num = 0, cck_highpwr = 0;
+	u8 bcck_rate = 0, rf_rx_num = 0;
 	struct phy_cck_rx_status *pcck_buf;
 	u8 sq;

@@ -723,55 +723,32 @@ static void query_rx_phy_status(struct _adapter *padapter,
 		 * (2)PWDB, Average PWDB calculated by hardware
 		 * (for rate adaptive)
 		 */
-		if (!cck_highpwr) {
-			report = pcck_buf->cck_agc_rpt & 0xc0;
-			report >>= 6;
-			switch (report) {
-			/* Modify the RF RNA gain value to -40, -20,
-			 * -2, 14 by Jenyu's suggestion
-			 * Note: different RF with the different
-			 * RNA gain.
-			 */
-			case 0x3:
-				rx_pwr_all = -40 - (pcck_buf->cck_agc_rpt &
-					     0x3e);
-				break;
-			case 0x2:
-				rx_pwr_all = -20 - (pcck_buf->cck_agc_rpt &
-					     0x3e);
-				break;
-			case 0x1:
-				rx_pwr_all = -2 - (pcck_buf->cck_agc_rpt &
-					     0x3e);
-				break;
-			case 0x0:
-				rx_pwr_all = 14 - (pcck_buf->cck_agc_rpt &
-					     0x3e);
-				break;
-			}
-		} else {
-			report = ((u8)(le32_to_cpu(pphy_stat->phydw1) >> 8)) &
-				 0x60;
-			report >>= 5;
-			switch (report) {
-			case 0x3:
-				rx_pwr_all = -40 - ((pcck_buf->cck_agc_rpt &
-					     0x1f) << 1);
-				break;
-			case 0x2:
-				rx_pwr_all = -20 - ((pcck_buf->cck_agc_rpt &
-					     0x1f) << 1);
-				break;
-			case 0x1:
-				rx_pwr_all = -2 - ((pcck_buf->cck_agc_rpt &
-					     0x1f) << 1);
-				break;
-			case 0x0:
-				rx_pwr_all = 14 - ((pcck_buf->cck_agc_rpt &
-					     0x1f) << 1);
-				break;
-			}
+		report = pcck_buf->cck_agc_rpt & 0xc0;
+		report >>= 6;
+		switch (report) {
+		/* Modify the RF RNA gain value to -40, -20,
+		 * -2, 14 by Jenyu's suggestion
+		 * Note: different RF with the different
+		 * RNA gain.
+		 */
+		case 0x3:
+			rx_pwr_all = -40 - (pcck_buf->cck_agc_rpt &
+				     0x3e);
+			break;
+		case 0x2:
+			rx_pwr_all = -20 - (pcck_buf->cck_agc_rpt &
+				     0x3e);
+			break;
+		case 0x1:
+			rx_pwr_all = -2 - (pcck_buf->cck_agc_rpt &
+				     0x3e);
+			break;
+		case 0x0:
+			rx_pwr_all = 14 - (pcck_buf->cck_agc_rpt &
+				     0x3e);
+			break;
 		}
+
 		pwdb_all = query_rx_pwr_percentage(rx_pwr_all);
 		/* CCK gain is smaller than OFDM/MCS gain,*/
 		/* so we add gain diff by experiences, the val is 6 */
--
2.33.0


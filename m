Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EA470
	for <linux-staging@lists.linux.dev>; Tue,  8 Jun 2021 23:56:15 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id a11so21493111wrt.13
        for <linux-staging@lists.linux.dev>; Tue, 08 Jun 2021 16:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TrK/aPrNzIFJiEaYMtY8iTDy66rvrONlTw4MuPTSoTA=;
        b=esjQjQ76R9dklmDiKkWkttOIpiS6EJVNa/jHJDbss1qkPfuiYZ0qEw4bjsTCiE7h3B
         UTHoUw6m01JrzmvlV3V1jUzQFjC/Eqtom/dAqAV9O26BfPA9IiAKM9it31MxxdI/WOiv
         GQyzlxyHp28QcCfEVMb969nvRqDb7GS93fvXp/YDrNDtXh9o5Za6LHJy3ACplWF7dBIJ
         SnZoTkFaTOEORDqvwd0pjoswQA1uPYipCoRgjzOA7MT+d7teyWQqc71vcCpsNLf962m4
         +FTW4tUZWjnXwHkIThuS0YmSErcl7E5Uzus4n0bc412OXmR26koTAt0FHHsHGnjWBDnY
         thYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TrK/aPrNzIFJiEaYMtY8iTDy66rvrONlTw4MuPTSoTA=;
        b=BHdygRihgq37JBlWSRbUa3vBW0gRK/RJ1uVJw6dqxGGy7X7js0zrQNuEozmfyS51sK
         8yK/B5klw5qTt+NswC9KWFED/T8X8a7f5EjI7Z1Eq/hUP5lYg+tRSMxB6O/BH8UVuIGC
         9Xbwh+7oLE+qLeUUTqnU6Y5wvKUJHJ+vg4nw8cV1OqP/d3Q0h4wpX7kQL22Tq8EB01Wt
         iUwH7h7qlO9ND85CpvXiYMXhvZ6N/mTW1B4AYDA7GDFuB+LEdIo+Z5NTqxmVP9jFrgQu
         nVQ/jpvuYd+152JVWmXBVM/DJf//QJJYTtcPGm4cOLdRnBdwgyrJeqg4Yn2E3TSFCit4
         JFww==
X-Gm-Message-State: AOAM5325f6m/LvhxoGpIy/48k7PFKtvtR3p2SxiYsvt/uxT0AMh89min
	Lrr4O16dhgCUzkg1PI457uVeng==
X-Google-Smtp-Source: ABdhPJy1zD6K/6MbeOOBR6pqA31/kEQRBXrBFHBNVRnV+5WMfN4OU7j5brEPpNfyXp/dxq7VAeRVfw==
X-Received: by 2002:a5d:5988:: with SMTP id n8mr11679736wri.261.1623196573624;
        Tue, 08 Jun 2021 16:56:13 -0700 (PDT)
Received: from localhost.localdomain (82-132-233-125.dab.02.net. [82.132.233.125])
        by smtp.gmail.com with ESMTPSA id d3sm20702254wrs.41.2021.06.08.16.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 16:56:13 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	kaixuxia@tencent.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8188eu: replace two ODM_RT_TRACE calls in hal/phy.c
Date: Wed,  9 Jun 2021 00:56:09 +0100
Message-Id: <20210608235609.6726-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Within rtl88eu_dm_txpower_track_adjust function, retrieve the struct
net_device pointer, and replace both calls to the ODM_RT_TRACE macro
with equivalent netdev_dbg calls, as well as modifying layout, wording
and spacing slightly. The purpose of this, and patches like it, is to
eventually remove the need for include/odm_debug.h, which is an overly
complex way of printing debug/tracing information about the driver.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/hal/phy.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/phy.c b/drivers/staging/rtl8188eu/hal/phy.c
index a664bff370bb..a8caf618f588 100644
--- a/drivers/staging/rtl8188eu/hal/phy.c
+++ b/drivers/staging/rtl8188eu/hal/phy.c
@@ -301,11 +301,12 @@ void rtl88eu_dm_txpower_track_adjust(struct odm_dm_struct *dm_odm, u8 type,
 				     u8 *direction, u32 *out_write_val)
 {
 	u8 pwr_value = 0;
+	struct net_device *pnetdev = dm_odm->Adapter->pnetdev;
+
 	/*  Tx power tracking BB swing table. */
 	if (type == 0) { /* For OFDM adjust */
-		ODM_RT_TRACE(dm_odm, ODM_COMP_TX_PWR_TRACK, ODM_DBG_LOUD,
-			     ("BbSwingIdxOfdm = %d BbSwingFlagOfdm=%d\n",
-			     dm_odm->BbSwingIdxOfdm, dm_odm->BbSwingFlagOfdm));
+		netdev_dbg(pnetdev, "%s(): BbSwingIdxOfdm = %d BbSwingFlagOfdm = %d\n",
+			   __func__, dm_odm->BbSwingIdxOfdm, dm_odm->BbSwingFlagOfdm);
 
 		if (dm_odm->BbSwingIdxOfdm <= dm_odm->BbSwingIdxOfdmBase) {
 			*direction = 1;
@@ -318,9 +319,8 @@ void rtl88eu_dm_txpower_track_adjust(struct odm_dm_struct *dm_odm, u8 type,
 		}
 
 	} else if (type == 1) { /* For CCK adjust. */
-		ODM_RT_TRACE(dm_odm, ODM_COMP_TX_PWR_TRACK, ODM_DBG_LOUD,
-			     ("dm_odm->BbSwingIdxCck = %d dm_odm->BbSwingIdxCckBase = %d\n",
-			     dm_odm->BbSwingIdxCck, dm_odm->BbSwingIdxCckBase));
+		netdev_dbg(pnetdev, "%s(): BbSwingIdxCck = %d BbSwingIdxCckBase = %d\n",
+			   __func__, dm_odm->BbSwingIdxCck, dm_odm->BbSwingIdxCckBase);
 
 		if (dm_odm->BbSwingIdxCck <= dm_odm->BbSwingIdxCckBase) {
 			*direction = 1;
-- 
2.30.2


Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13144218B4
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 15:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971199; cv=none; b=j2h0DYEdpVzf0IDCbVumLS3VcFdlROR2GA42If8CYU6kL0lWdTvji6Fnlb8mDFcDTy7yne3nnNsfZENU4VPsCd2xuxHChACEAf6zE85BT1MFPQ9TpA/w5ZdFNsJUAI+BTHojfF4Ck0Gdyx3eHCGooYzWIBWyCaF0/Drp1ffOBsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971199; c=relaxed/simple;
	bh=+QLp+W+N/h7ONWCYZjLE/LwSDtdFmevLfErmTRH22Rc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LxeNY66Stx32605YJR03bk7rWlC3pRmrTA5/qx0OF0NobDuQ7KPfWdtkJPNS9oZGaJog0pFnlZaY8jQKOHj7ey7raDMqau1Mh4DgCDNmaCRUPRnH/aR8ANjFo6vO5KLaVvTfR4Cp0nPYLk9c0jQXz0ZDCVmaQg049/MKcsNcwmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WJYVu6bP; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WJYVu6bP"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso53855905e9.1
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 08:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774971189; x=1775575989; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJutMm6/Y5MNx7yEDzl3x8JS0IdVhmYLXjsl5fR/2SQ=;
        b=WJYVu6bP1gehwf8x7GYWx1aiIOBnx1rc1uc4VPZwkN0OFNT/1DCJJXbp7OnGXQ8ysJ
         6WQdp2U3YtWHI58k4KX+c3q+lM4KukPmWSmwClb2IM9sSs4Py2Srd2xt0W4CH18SdDsT
         tnPzjoB+W1vRgJ4pMi5RDTp8Akx3b88Rwit//NG+i+KKG1BDUze7tumbpJSeqZXgXEh9
         zvt4Un5ZhMcJD9dR8oXPv9/qB9Nhj3H9Jmcc2wvY0PcPBWGmfriqZn/dprE2haLSsFDm
         1ByGIIbxxfXLS1T7S4IYP+PD0xixt7Bd/6M7DZjXdvfn/ekXGKoU6xv5w8CRzqFbLTdc
         mA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774971189; x=1775575989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZJutMm6/Y5MNx7yEDzl3x8JS0IdVhmYLXjsl5fR/2SQ=;
        b=dpGmtV9TVKttJQfOB/1J4ACW1y6ivQIuC9wwOBSmMmijXmxpRs75SdwIOw/VNQ9/nd
         dfEvZxkVxFnZh61Y4YxdT1becds0O0GF25MqlVLwG9QqEfEvMtLU8l8VVdVdDg3g+TfB
         m8wxh0gxQF8yhbVAV5opwZeJIgMt+BNXeno86gLi+ZczZED50Ieac837WB0UR4XnkrJE
         9yjpSS2HD2s767pR4zB+tUJ1NrV3EwMSnuWUKt8k1lOtfzuMSoHZbqNd2HokDab8FLUx
         CO7vJKQAqAMopLvqEJL+qGV7iIvJy08ffQwIVG4Hry2DBVS2lEMHDEHHK5eIs5ZmS2Nq
         LWgg==
X-Gm-Message-State: AOJu0YyV661VmB3PUnGKKSXM4H+/LXYAvrU3x9VOSfgy3GlmVH2iXBTk
	7Zii0ZdoMjnPE7jQIuBUnBnPGRKfVo3a4pXrfCE/rX7Z6O3MSG+bFO4N
X-Gm-Gg: ATEYQzyZctirZEoZuAA3OTRmUGYdXjG9TJYHRlkDQPNEeEnm5ZqwQRTrjS/m7BCqXiE
	QzCRijy9Xlhz5mUu9znDnnTAHUMvkMHagdZfNSfZ8tCgJKSHkgyoXwtQO047uzhvnlG1ETcxLCY
	ETHxPfXLBlid+adrPII52uBuLWX2OyaMBZ4WuuST41VC++Lw/PSLgbyFZTeOj4CqyVNcDx++eUf
	pFMKLq/MDN6Vonmbn2kUDenPxzPJlz7HNQ2Z5Q2EXddRN7wXbcYHOtZaraEwa+83yGgT3x5SYfo
	sVWU8Bzs32TxKxJNGph8VY1z/fS/Y0uMPi+1mMALE+D5XFKMXcszVX6lPaewOFFre+49JuenLum
	PeZEn2huWa1Y3CiBWAlQsTwdRlPc8kM9xc+t6Myi0ZAIA6v2FLSDiSD4K1UjmR8ELFytLhye6/A
	ltUUHhMw8Dx/R8O6cPCKWQxw==
X-Received: by 2002:a05:600c:4f91:b0:486:fb69:4960 with SMTP id 5b1f17b1804b1-48727edde49mr272182805e9.19.1774971188933;
        Tue, 31 Mar 2026 08:33:08 -0700 (PDT)
Received: from potato ([31.176.162.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887aceb230sm21653485e9.4.2026.03.31.08.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:33:08 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH 5/5] staging: rtl8723bs: add separate label for freeing rtw_wdev
Date: Tue, 31 Mar 2026 17:32:54 +0200
Message-ID: <20260331153255.22764-6-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260331153255.22764-1-omer.e.idrissi@gmail.com>
References: <20260331153255.22764-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original function would "unregister" and "free" padapter->rtw_wdev
IF it ran into issues after "hardware operation functions" were set.
The problem is that rtw_wdev isn't even allocated at that point.
So separate the rtw_wdev_unregister and rtw_wdev_free code into it's own
label, add error check to rtw_wdev_alloc and move it up a bit.
When rtw_init_drv_sw fails goto free_wdev instead of free_hal_data.

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index aea9b4e19874..a088dae40a19 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -268,12 +268,13 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
 
 	/* 3 6. read efuse/eeprom data */
 	rtw_hal_read_chip_info(padapter);
+	
+	if (rtw_wdev_alloc(padapter, dvobj_to_dev(dvobj))) 
+		goto free_hal_data;
 
 	/* 3 7. init driver common data */
 	if (rtw_init_drv_sw(padapter))
-		goto free_hal_data;
-
-	rtw_wdev_alloc(padapter, dvobj_to_dev(dvobj));
+		goto free_wdev;
 
 	/* 3 8. get WLan MAC address */
 	/*  set mac addr */
@@ -283,12 +284,13 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
 
 	return padapter;
 
-free_hal_data:
-	kfree(padapter->HalData);
-
+free_wdev:
 	rtw_wdev_unregister(padapter->rtw_wdev);
 	rtw_wdev_free(padapter->rtw_wdev);
 
+free_hal_data:
+	kfree(padapter->HalData);
+
 free_adapter:
 	if (pnetdev)
 		rtw_free_netdev(pnetdev);
-- 
2.51.0


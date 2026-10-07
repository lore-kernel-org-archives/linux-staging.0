Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E6C4C6512
	for <linux-staging@lists.linux.dev>; Wed,  7 Oct 2026 16:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791390093; cv=none; b=YxWKc7VDVVDQoFI0KxpsPSvHJ5AK6vITq4Z0KMwfjMCeN/N4/bnBSWvp8SvbfXeWRyzMhM8+SneBZSX7Fa0lr1eV3w30Ue/bCTOPrAy5pnPSeBKcASLUFfHx1m/lUvmSoj+OxT3traPwrqcjj9JiXtolvxqoJqW+xJOdD77PBlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791390093; c=relaxed/simple;
	bh=7mBQ+M21pg/s7FUBUJABkwqMBXpUBGxS76YpBsfUmTI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ip45RcNHb+UYOmuOKRfyFwQIrhZLhnVHV4r94KwNmOgB6L879ihIMRC0ToGbBn4vepoAvmjJNIAH2Jo8m09bQdnNwOm/RCfiLOYobU8W93iSHPxq7pfkn26j0GDXCFITE0PbyDptULbwJeEckxz3Ly/LGtStdGYdyCHaqOwtEeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=alRxWA8p; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="alRxWA8p"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-890d52c7c7bso1662166b3a.2
        for <linux-staging@lists.linux.dev>; Wed, 07 Oct 2026 09:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791390088; x=1791994888; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MhTcO+HadmDwh+8PVqnj5w9psrS4b4QuUSACQe5q+Y4=;
        b=alRxWA8pwH5VeL4ae3fC5kLqAeBZzU3K7gvXEI0yzPamvUEzAWAeaWyMR9/jM5gdBK
         a9igmhR9cvc5nJOvn3BuEGXQ+1+09jOg7DkdMR8XPF0Rq4O+dAePbZv6z5kFLzo8wnda
         dfUtKh+zhCx4POZKWxSs1VlbgNtwnMwh4dO/dl5EffClQZP1sLp4hri7L7ow7jSX1eD2
         UEIoAKv5Xn/zBWe2mMWFlmEoKY+wRLrDbOvaVis01fv54FgiqYS9PbIyUXPQylXLqJ6d
         +3/PcFbIVV844JTgyv9YTsBKSCRyYObz51LHzUS4CezJ7KjL/e6PMHLb0PmacTRKBdbv
         rYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791390088; x=1791994888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MhTcO+HadmDwh+8PVqnj5w9psrS4b4QuUSACQe5q+Y4=;
        b=VnVeQB2DPSzNHqjOPgjeoNmTMOv3FgEaN2P+JDVi1S3ebkmrP2zxQSGexqlxbdU0GL
         8bYwLh+5og3tmoIY0REe+tE+TpyD59eQq/iU1hqDIlRGHKPPkVs8flpH6aJV67ioKRI5
         ao31rIedZyg6UIBQoLV5IbxapzRhDf+tLeSKfanUp8LXda6bM1uZYjXQBJ5JstzcZ9SG
         qKLTqzl5NN3FuVOXNKIXvv2pXeNoTKLG4g5nmXf+v6X54kL/En8fKBOdDOsBYrcTgZY8
         rxnwgmI6gAJ9oqhXvzh15KL5HENqr/rzv9PYItG2FZiv0eBLESm4hgCuK7uW/yBbZy3u
         uqBg==
X-Gm-Message-State: AFuF++kllHMw0akD4H7L90JhHfMLIjwhizWBH3jLOm4lGLSr4obJGQfM
	LVzhPJz8eI/PX5iEd/mA225TlDDU5/usoI+y4GfMbVtcH2qy3iHsKKFC
X-Gm-Gg: AYBFou0cNuCF4uylr7/7HISjnTBwdUX8cfL11XqZkPi8XpjlDf/NEanpo+xDcwPjvP6
	WFtFs2H6VCYdu5FNBTXf8MguTkGsLdVVHSmLArUG9SQThhDPsJ3n3L7f8ktzbDwTHisPcVyU9zn
	o7gFMSBp+xBAA+LxeVsBT0jfR9oKrN+gU7UMAS5+Cb8hNjW9bqmVtS92SFHaBS3eC+XRtv1Pr0z
	EVCnLeIQyncpk1o+UKsDI320vAvdtsYC/p9J7yT7INF+KkIh4sVcl8SXW+zzFxM7ZXCXDw+DnmK
	TjJqg7baCzwQ0qpNnbY65b2jJate22LrFXfY1BnhNJC2fqqr4Ix+sove/1U9ZzFXHkOl/1RVA23
	EF6k0o0vGztY+RgXUcNuOkQQ9Tv1VhK/ftuZrJxTx/nYNhUJDMUXl2tCIopOFUMDA08Kp1hsY+s
	cayM32iBd3G5blbGEVn/Jba/tIV4dXHsPralKf7AcTVGbCGTSbE7pMDpv9CKrX0vnRGTY7d8Sup
	A39i+W7ljEaKzYyU+IAdaWWD5jmlBTYo4FuarIaJKtvucMf+ySRixS+3pc=
X-Received: by 2002:a05:6a00:3305:b0:880:78ca:8400 with SMTP id d2e1a72fcca58-891b422319emr2578114b3a.12.1791390088090;
        Wed, 07 Oct 2026 09:21:28 -0700 (PDT)
Received: from sohail.tailed9083.ts.net ([2401:4900:88f5:ab57:554a:e32:de11:5b00])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-892bba97a22sm592690b3a.49.2026.10.07.09.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 09:21:27 -0700 (PDT)
From: Mohammed Sohail <mohd.sohail.biz@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohammed Sohail <mohd.sohail.biz@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove comparisons to true/false in rtw_mlme_ext.c
Date: Wed,  7 Oct 2026 21:51:14 +0530
Message-ID: <20261007162114.138541-1-mohd.sohail.biz@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Checkpatch reports "Using comparison to true/false is error prone"
in rtw_mlme_ext.c. Replace "x == true" with "x" and "x == false"
with "!x".

bwmode_updated and bxmitok are u8, but they are only ever assigned
true or false, so this does not change behavior.

Signed-off-by: Mohammed Sohail <mohd.sohail.biz@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 80194796a9f7..511eccf5b5a3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -3457,7 +3457,7 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 	if ((pmlmepriv->num_FortyMHzIntolerant == 0) || (pmlmepriv->num_sta_no_ht == 0))
 		return;
 
-	if (true == pmlmeinfo->bwmode_updated)
+	if (pmlmeinfo->bwmode_updated)
 		return;
 
 	category = RTW_WLAN_CATEGORY_PUBLIC;
@@ -3625,7 +3625,7 @@ unsigned int send_beacon(struct adapter *padapter)
 			 !padapter->bSurpriseRemoved &&
 			 !padapter->driver_stopped);
 
-	} while (false == bxmitok && issue < 100 && !padapter->bSurpriseRemoved &&
+	} while (!bxmitok && issue < 100 && !padapter->bSurpriseRemoved &&
 		 !padapter->driver_stopped);
 
 	if (padapter->bSurpriseRemoved || padapter->driver_stopped)
@@ -3868,7 +3868,7 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 	bssid->configuration.atim_window = 0;
 
 	/* 20/40 BSS Coexistence check */
-	if ((pregistrypriv->wifi_spec == 1) && (false == pmlmeinfo->bwmode_updated)) {
+	if ((pregistrypriv->wifi_spec == 1) && (!pmlmeinfo->bwmode_updated)) {
 		struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 		p = rtw_get_ie(bssid->ies + ie_offset, WLAN_EID_HT_CAPABILITY, &len, bssid->ie_length - ie_offset);
-- 
2.55.0


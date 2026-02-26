Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C302927B35F
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 10:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772101892; cv=none; b=NB0eF57iw9Ij9bjhof6wKtjC5y3aow5VpBOjoVv5CWOBj7ddzeep3Fx2JNgtgpSo6FWPGMA7HoLauR7PzfX0u8AI6MKS9WFEoLF0EM8Nv865MDj2N/hevfrbDo1lDOYD9wh2i5bXlDfWx5onvL8FuZrEq+KKFF5LvdxVT+KTxq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772101892; c=relaxed/simple;
	bh=Ouv0qbUWKRpIeIo4vPzAPI8Xwve2M5+s8HBo22KBPEA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u6e+C4pcrrawfY5qX7KPxKrOqYFbPaqiE55qoYgCnROz+nMsFd+u38YbzZphOYTZ+Z7OAmD6XTpQlf48ZY3PW9QoLlx/rIUj+M6U6ABp3IeHAMXyV+J+iJS0Y7Y9Lo9OQW6h80TiYSO62StK+y9bTZ3DioL+3HlSAMmY6X6DkpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JmlAOnQS; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JmlAOnQS"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4398d9a12c6so512885f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 02:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772101888; x=1772706688; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5tHy5lt9HakWE2IUEzcKzNKuL9zF9kr27xQO1c25L7M=;
        b=JmlAOnQS3YI2dPPC3X5v0gjwmS47aaNpkGVZPnz4u5/BenKp9pja06dYICAITLb99m
         h8i+lPQ3n29hMsIibmEOI7nbbl8yUHeyUohL1F1ykA6MpA1sF4WPODst1Y0E76LX4jO/
         cOQC2spKOHbSyzjspmd3oNZjnbEEppaklUgk+JbBrgoBC/kJ9pFjR5myfR7ks2G7vvhC
         nIzhaqpctDL6OVjGxe2pc6SoqZ5llESM+2YeaSyStzIn2SAhp/kPTNjRMWJcTNUpA5Su
         oojxU3FMdICzJD+mUtkisoahBv3ZH0hQtYNMeHZtD09ImaBwQ1f8ExApDkIkDZ7wvL94
         OjDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772101888; x=1772706688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5tHy5lt9HakWE2IUEzcKzNKuL9zF9kr27xQO1c25L7M=;
        b=nHX2w6unHjwDtLBaqAeLDgoixGLDoHCp90FTFd//cuvokxgAmUCK5b3JhMKAcAp/H+
         DrWLcyWfnaHKZ5x3hAOZi42e8UaG0IKj6iy8st1xRQotTEqxI74SiYbyOLfvdwvuXDFV
         R3KZ7CV5Eq1tgiPHINrJiJcuc5c73i5fwAelps/DfCTY3KPHVW+35u184fKYyOSlbRw1
         xdo49g77obgNNTdONPfjrd8xz7IMveplzHot12Bdo3omUyuflc7J9gmidTqC7Zpmnd3G
         IMurB5+Jv6gHREzg73DhFZA5IT2Lk/1kX2SgLsgyvq3VyeDAx6f/4Stoc9X6je7PoQHA
         tRXA==
X-Forwarded-Encrypted: i=1; AJvYcCViBUVstjWTFreFOqlfBf99Ca+TiulpYfn480BxXjVZwKhE3ifit+tktTyLtkr5CMTIW7uwhEwNWyi+TcdH@lists.linux.dev
X-Gm-Message-State: AOJu0YwBkhgBBNPZTow8NONtObxMHF+ariaYVwkREYdcz6s+jZE5WUh9
	CJPO6fP1EsghGafEum17AEHqPH079HHJYnmoIrJBZ6UuajvuGDNOJpB+
X-Gm-Gg: ATEYQzxIoKOBlE1u89OEtBAim1+KJXI1w38s+GSPpk8Eyds7AisQ3FkEOHZ1MPDCkOz
	3W2SGiMdARYKtGPWkbbkQ3JODaZpQDTIU0t970GOJD1u/nBr+fohBq3/y4ZsoNGnPVTR2U+xIk3
	MJpnZih6URJfUhE6iDMhFOGdTHseM0HeXU85swTJ+g29YooCdx/59mZpyF2HFE1WI+8Ky8NZKDn
	+To7HnLB+VqR0Ze7yJ1GCGELlkIkV0y+i1H8cdu4uRKVRZz+LENHKpNRhDjh3CNvv+80JJ7QzCL
	wFNILgJVx8D6tRjDzTa6P+JwOtnVgLGogevwRX2ACwRHsPT4Klrs4Obg7i5tvcLbXJmhI/URcBg
	6f6D2QiScmSe/BUOrigx/9ONSC4CKR/pLbhnIUwY/Sbw6AkPUUwyX9S3WTRMnGWHgoI+anSp9uT
	Pmw6TbJ2Pbhccmy9BmFdTuk8MGg/s1aYYmXF9hMyOMm6J3AoUHX+nrmbvNmtcrEsk=
X-Received: by 2002:a5d:5d81:0:b0:436:3707:2bf3 with SMTP id ffacd0b85a97d-4396f16e44emr33622154f8f.24.1772101888006;
        Thu, 26 Feb 2026 02:31:28 -0800 (PST)
Received: from mariyam-Latitude-5310.. ([39.37.133.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4cc81sm39843762f8f.26.2026.02.26.02.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 02:31:27 -0800 (PST)
From: Mariyam Shahid <mariyam.shahid135@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mariyam Shahid <mariyam.shahid135@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Wrap long comments to fit line length
Date: Thu, 26 Feb 2026 15:31:20 +0500
Message-ID: <20260226103120.32230-1-mariyam.shahid135@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wrap comments exceeding 100 columns across multiple lines
to fix checkpatch warnings.

Signed-off-by: Mariyam Shahid <mariyam.shahid135@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index b090d162b37f..4dfa98239f9d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1022,7 +1022,7 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 		}
 
 		/* for A-MPDU Rx reordering buffer control for bmc_sta & sta_info */
-		/* if A-MPDU Rx is enabled, resetting rx_ordering_ctrl wstart_b(indicate_seq) 
+		/* if A-MPDU Rx is enabled, resetting rx_ordering_ctrl wstart_b(indicate_seq)
 		 * to default value = 0xffff
 		 */
 		/* todo: check if AP can send A-MPDU packets */
@@ -1041,7 +1041,7 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 				preorder_ctrl->enable = false;
 				preorder_ctrl->indicate_seq = 0xffff;
 				preorder_ctrl->wend_b = 0xffff;
-				/* max_ampdu_sz;ex. 32(kbytes) -> wsize_b =32 */				
+				/* max_ampdu_sz;ex. 32(kbytes) -> wsize_b =32 */
 				preorder_ctrl->wsize_b = 64;
 			}
 		}
@@ -1070,7 +1070,8 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 	padapter->recvpriv.signal_strength = ptarget_wlan->network.phy_info.signal_strength;
 	padapter->recvpriv.signal_qual = ptarget_wlan->network.phy_info.signal_quality;
 	/* the ptarget_wlan->network.rssi is raw data,
-	 * we use ptarget_wlan->network.phy_info.signal_strength instead (has scaled) */
+	 * we use ptarget_wlan->network.phy_info.signal_strength instead (has scaled)
+	 */
 	padapter->recvpriv.rssi = translate_percentage_to_dbm(ptarget_wlan->network.phy_info.signal_strength);
 
 	rtw_set_signal_stat_timer(&padapter->recvpriv);
@@ -1243,7 +1244,7 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 
 			/* s3. find ptarget_sta & update ptarget_sta after update cur_network
 			 * only for station mode
-			 * */
+			 */
 			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
 				ptarget_sta = rtw_joinbss_update_stainfo(adapter, pnetwork);
 				if (!ptarget_sta) {
@@ -1375,7 +1376,7 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 	if (psta) {
 		/* the sta have been in sta_info_queue => do nothing */
 
-		/* between drv has received this event before and 
+		/* between drv has received this event before and
 		 * fw have not yet to set key to CAM_ENTRY)
 		 */
 		return;
@@ -2182,7 +2183,7 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 	struct wlan_bssid_ex    *pdev_network = &pregistrypriv->dev_network;
 	struct	security_priv *psecuritypriv = &adapter->securitypriv;
 	struct	wlan_network	*cur_network = &adapter->mlmepriv.cur_network;
-	
+
 	/* adhoc no 802.1x  */
 	pdev_network->privacy = (psecuritypriv->dot11PrivacyAlgrthm > 0 ? 1 : 0);
 
-- 
2.43.0


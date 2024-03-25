Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8490D1C06;
	Mon, 25 Mar 2024 17:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711389273; cv=none; b=CAN7oPsiqtpPaCvVqzrUMQkajbr6xX20DwcRsVocHbmVdT4LaXtpdrE1bU6rHPL7EnQKqDAJ+ImexU7sKS+iSb3G5X5bEqnrMTq07A0KsUNh5rT8yEAWZXoIx3T52Czqmu3l54XdKGzTl8EpuA1Kr7PlAHqOgY/MPJ/hnKQ8Sx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711389273; c=relaxed/simple;
	bh=phl1On+LvXNW/Nrgaz1L3HLhaynxmPpRJ+BBZHYNgxg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RwU5dvd74v0RaOwlQfFb1A6DhL3+KFsqa+Fq9CstNWoqpjKmjmYIYOrxrf18IQ5ou9vjiZEXk2ceqcju2omFbz86q3i8YYLQBzSFrEUQkZcAdRssGwNrECOVcO1N7gbzlBBGUfpHt/pVJ300zM0EOx5/hN1+0CpgPiWN4GM0zOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDFtSolP; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDFtSolP"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6e6bee809b8so3978609b3a.1;
        Mon, 25 Mar 2024 10:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389270; x=1711994070; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9TkK+lBWZC2qMtGl3T55LQPQa+j5LeFf4SEKJP2BMMU=;
        b=ZDFtSolPsZtl/liYMMUhQB4Jn6gBoRe9/NAeEW2AyBLWXxC+G8+a+oJ6OoyCIjfHEE
         g/jcAZ3FsE31HoFrr2VzD3uqmVhVXBleMBA1LgeymbtqC/Y8lyYDmj1FJ8vkNp4typ5Q
         2w5R1bxvsVoKFhCPvIaKAgDCx2HqD9GHVvZksIB5R3JtCUqpL0y/WE0MwXr4WPdacjg+
         E7g/jVKSTPhl2U01/kOUFAOONKyN8kLbo7n+UbYPVzOWGGlv6B5Yhhfg8O1ZtLGysJpY
         DgUZAUDKX+Ne0Ul6NA49/vt32H6wQJaLQVA3jTYvWKDlpX8vf+z8+9c98dHR65sS5ASR
         UMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389270; x=1711994070;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9TkK+lBWZC2qMtGl3T55LQPQa+j5LeFf4SEKJP2BMMU=;
        b=Xfrp8tkIXwK2Ijo1g5hcXV0NiddAfIesf4yKZH/r97bh4ftSODM3YUDFXVSjEwVqQJ
         7NlyyzXiE28V6O8+6RnwiIZtz3DADujFDrQJCkUs6WZtqPzMaaB+KTne+r/XZYrhls6H
         Jxatd+x8DqpmPtNKfsx3CWmrEPN4yauLFykpjisgVTfz+59MfzU7ZEhmfHxsO7dHN6D+
         IbPIRFqgZ9nSYD2N4IfFnGEfrBPin5dUFrlrDoro102O2+I1yr4CI2XU9BXEU2cNooP9
         kmKP6b29BydoItPVfLSE6haP1m8qFbH7pF0KV5/kzuT+pWK+wcc1P1aOkxRwg8NXr2WA
         zQEg==
X-Forwarded-Encrypted: i=1; AJvYcCVpAU1V5+f0ugvHZiA26RjSaKFycNPAhF8+vEP72Fp+y82QiL/ldIHkJoqO668J8Sw3yJfNeVAEdEebOMmVNdqYwimN5vsDTAuodWjVHQ==
X-Gm-Message-State: AOJu0Yzr0Mu8BmYkSeMu6Bq7fTl6vNxmWV/i2CiwvOac3aq/eguw3pYg
	vYwMYHhYgWa/r9IH52giE+k8ceHLBSnXN7GV3yEexUELOU3DX46v
X-Google-Smtp-Source: AGHT+IFOYQ46Q+aH3AoS2orxN+nBAUNQs114gA8KXkmqBBX74wgY9DnhTi54l10sDWWUqFval1fAYg==
X-Received: by 2002:a05:6a20:f20:b0:1a3:4c97:23a2 with SMTP id fl32-20020a056a200f2000b001a34c9723a2mr7261292pzb.20.1711389269778;
        Mon, 25 Mar 2024 10:54:29 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.65])
        by smtp.gmail.com with ESMTPSA id k20-20020a63f014000000b005d8b89bbf20sm5983671pgh.63.2024.03.25.10.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:54:29 -0700 (PDT)
Date: Mon, 25 Mar 2024 23:24:24 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH] staging: rtl8712: Fix instances of lines ending with '('
Message-ID: <ZgG6UC1Fiac7pDfa@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix instances of lines ending with '(' to address checkpatch warning
"lines should not add with a '(' " and conform to common kernel coding
style.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
---
 drivers/staging/rtl8712/rtl871x_ioctl_rtl.h | 123 +++++++-------------
 1 file changed, 41 insertions(+), 82 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_ioctl_rtl.h b/drivers/staging/rtl8712/rtl871x_ioctl_rtl.h
index 7c0b880ac686..70d48e6b4112 100644
--- a/drivers/staging/rtl8712/rtl871x_ioctl_rtl.h
+++ b/drivers/staging/rtl8712/rtl871x_ioctl_rtl.h
@@ -18,92 +18,51 @@
 #include "drv_types.h"
 
 /*************** oid_rtl_seg_01_01 **************/
-uint oid_rt_get_signal_quality_hdl(
-			struct oid_par_priv *poid_par_priv);/*84*/
-uint oid_rt_get_small_packet_crc_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_get_middle_packet_crc_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_get_large_packet_crc_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_get_tx_retry_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_get_rx_retry_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_get_rx_total_packet_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_get_tx_beacon_ok_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_get_tx_beacon_err_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_get_rx_icv_err_hdl(
-			struct oid_par_priv *poid_par_priv);/*93*/
-uint oid_rt_set_encryption_algorithm_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_get_preamble_mode_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_get_ap_ip_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_get_channelplan_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_set_channelplan_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_set_preamble_mode_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_set_bcn_intvl_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_dedicate_probe_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_get_total_tx_bytes_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_get_total_rx_bytes_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_current_tx_power_level_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_get_enc_key_mismatch_count_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_get_enc_key_match_count_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_get_channel_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_get_hardware_radio_off_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_get_key_mismatch_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_supported_wireless_mode_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_get_channel_list_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_get_scan_in_progress_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_forced_data_rate_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_wireless_mode_for_scan_list_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_get_bss_wireless_mode_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_scan_with_magic_packet_hdl(
-			struct oid_par_priv *poid_par_priv);
+uint oid_rt_get_signal_quality_hdl(struct oid_par_priv *poid_par_priv); /*84*/
+uint oid_rt_get_small_packet_crc_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_get_middle_packet_crc_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_get_large_packet_crc_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_get_tx_retry_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_get_rx_retry_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_get_rx_total_packet_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_get_tx_beacon_ok_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_get_tx_beacon_err_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_get_rx_icv_err_hdl(struct oid_par_priv *poid_par_priv); /*93*/
+uint oid_rt_set_encryption_algorithm_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_get_preamble_mode_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_get_ap_ip_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_get_channelplan_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_set_channelplan_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_set_preamble_mode_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_set_bcn_intvl_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_dedicate_probe_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_get_total_tx_bytes_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_get_total_rx_bytes_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_current_tx_power_level_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_get_enc_key_mismatch_count_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_get_enc_key_match_count_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_get_channel_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_get_hardware_radio_off_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_get_key_mismatch_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_supported_wireless_mode_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_get_channel_list_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_get_scan_in_progress_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_forced_data_rate_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_wireless_mode_for_scan_list_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_get_bss_wireless_mode_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_scan_with_magic_packet_hdl(struct oid_par_priv *poid_par_priv);
 
 /**************  oid_rtl_seg_01_03 section start **************/
-uint oid_rt_ap_get_associated_station_list_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_ap_switch_into_ap_mode_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_ap_supported_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_ap_set_passphrase_hdl(
-			struct oid_par_priv *poid_par_priv);
+uint oid_rt_ap_get_associated_station_list_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_ap_switch_into_ap_mode_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_ap_supported_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_ap_set_passphrase_hdl(struct oid_par_priv *poid_par_priv);
 /* oid_rtl_seg_01_11 */
-uint oid_rt_pro_rf_write_registry_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_pro_rf_read_registry_hdl(
-			struct oid_par_priv *poid_par_priv);
+uint oid_rt_pro_rf_write_registry_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_pro_rf_read_registry_hdl(struct oid_par_priv *poid_par_priv);
 /***************  oid_rtl_seg_03_00 section start **************/
-uint oid_rt_get_connect_state_hdl(
-			struct oid_par_priv *poid_par_priv);
-uint oid_rt_set_default_key_id_hdl(
-			struct oid_par_priv *poid_par_priv);
+uint oid_rt_get_connect_state_hdl(struct oid_par_priv *poid_par_priv);
+uint oid_rt_set_default_key_id_hdl(struct oid_par_priv *poid_par_priv);
 
 #endif
 
-- 
2.40.1


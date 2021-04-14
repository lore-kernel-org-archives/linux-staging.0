Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AF76D37
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:11:48 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id bx20so23680315edb.12
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bQHzzx8yYPUQd6rWxpWZ1zAPirw9Gp259XiEDDJA0qQ=;
        b=Dnsk7T0FUpFdlrKZv37Bbl9cZ1QVOh5CG3rnIcAY8ZKyntW3lz9sFks/46m3NqTHsM
         yguclLxcwgGMGMFtHlwYRVKwKCAvlnOeAMg0YrDs0t5NQyquG/sN+g9xAgFOhLzH/Olt
         KfnJPxfKtz9FBIUYxUq3NRmr2cdLCvUpKT+1FmT5VItg5eVUsvVqiSqnfXqA0R+gnhkj
         AP1HvvDNfjD+3gRjhveYgqoZTHv0wLwAEmHrFOjgZjPQ8hZOXZFviQyReQoB/Um5jEdT
         JBU04fUYmxdnI9jWC2wL582eWFat0N09jfKYAU2Au9Ew+mAqOMAi3eW3gnVfFZeFZhpF
         YNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bQHzzx8yYPUQd6rWxpWZ1zAPirw9Gp259XiEDDJA0qQ=;
        b=Ni/yyJLFGR8pBr81zUNkoq/Ep4D+tr7QLnYa9Ko6gKexVgCoxFY0nxv70Y7cecOr03
         qbN1Kyoz3uLi1sFzp/XqvIYsuP7+UsD+HsgvsrhJte1sJ+1D1xk+x8r+JGNA/Jmm2z/+
         2mjKB7mwZWQa5FFXFkxdpBSlitYFXvDN2cmUXH+RXmsAvdaL8bLB1OU2GEIlYBU5FLfn
         Iuf17ZRiA7QUyd2Zmxzo1dVOFp3mvepSSaOWwbrKojjRUjBeMYnpLlENxwyBwg1H4fMq
         TAgr9EIGWMAKC9CajCpvuxAduB5v5nrTurWanWljIX8kIHzBrJ8uwR33NP2zWJ+rlOiB
         9oFw==
X-Gm-Message-State: AOAM532lCUoyuqgZTcZPrBtWiCzasbJ/45+0EWHClK1jHxRMWYxhEONa
	TEO34ybBDtVQYwcj8WvuTRO6Dg==
X-Google-Smtp-Source: ABdhPJw9+hjzgVpOeIJrUuWM0+uQHzOvQy4Azl5MxgGUgnxcXBQ5ccrqcnTzg7z805XGtQtJeMzaxA==
X-Received: by 2002:a05:6402:ca6:: with SMTP id cn6mr160524edb.169.1618423907146;
        Wed, 14 Apr 2021 11:11:47 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:11:46 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	WLAN FAE <wlanfae@realtek.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH 12/57] staging: rtl8712: rtl871x_mp_ioctl: Remove a bunch of unused tables
Date: Wed, 14 Apr 2021 19:10:44 +0100
Message-Id: <20210414181129.1628598-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/staging/rtl8712/rtl871x_mp_ioctl.h:256:34: warning: ‘oid_rtl_seg_81_85’ defined but not used [-Wunused-const-variable=]
 drivers/staging/rtl8712/rtl871x_mp_ioctl.h:249:34: warning: ‘oid_rtl_seg_81_80_80’ defined but not used [-Wunused-const-variable=]
 drivers/staging/rtl8712/rtl871x_mp_ioctl.h:240:34: warning: ‘oid_rtl_seg_81_80_40’ defined but not used [-Wunused-const-variable=]
 drivers/staging/rtl8712/rtl871x_mp_ioctl.h:205:34: warning: ‘oid_rtl_seg_81_80_20’ defined but not used [-Wunused-const-variable=]
 drivers/staging/rtl8712/rtl871x_mp_ioctl.h:138:34: warning: ‘oid_rtl_seg_81_80_00’ defined but not used [-Wunused-const-variable=]

Cc: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Florian Schilhabel <florian.c.schilhabel@googlemail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: WLAN FAE <wlanfae@realtek.com>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8712/rtl871x_mp_ioctl.h | 127 ---------------------
 1 file changed, 127 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_mp_ioctl.h b/drivers/staging/rtl8712/rtl871x_mp_ioctl.h
index 59fa6664d868d..98204493a04c7 100644
--- a/drivers/staging/rtl8712/rtl871x_mp_ioctl.h
+++ b/drivers/staging/rtl8712/rtl871x_mp_ioctl.h
@@ -135,135 +135,8 @@ uint oid_rt_get_power_mode_hdl(
 				struct oid_par_priv *poid_par_priv);
 #ifdef _RTL871X_MP_IOCTL_C_ /* CAUTION!!! */
 /* This ifdef _MUST_ be left in!! */
-static const struct oid_obj_priv oid_rtl_seg_81_80_00[] = {
-	/* 0x00	OID_RT_PRO_RESET_DUT */
-	{1, oid_null_function},
-	/* 0x01 */
-	{1, oid_rt_pro_set_data_rate_hdl},
-	/* 0x02 */
-	{1, oid_rt_pro_start_test_hdl},
-	/* 0x03 */
-	{1, oid_rt_pro_stop_test_hdl},
-	/* 0x04	OID_RT_PRO_SET_PREAMBLE */
-	{1, oid_null_function},
-	/* 0x05	OID_RT_PRO_SET_SCRAMBLER */
-	{1, oid_null_function},
-	/* 0x06	OID_RT_PRO_SET_FILTER_BB */
-	{1, oid_null_function},
-	/* 0x07  OID_RT_PRO_SET_MANUAL_DIVERS_BB */
-	{1, oid_null_function},
-	/* 0x08 */
-	{1, oid_rt_pro_set_channel_direct_call_hdl},
-	/* 0x09  OID_RT_PRO_SET_SLEEP_MODE_DIRECT_CALL */
-	{1, oid_null_function},
-	/* 0x0A  OID_RT_PRO_SET_WAKE_MODE_DIRECT_CALL */
-	{1, oid_null_function},
-	/* 0x0B OID_RT_PRO_SET_TX_CONTINUOUS_DIRECT_CALL */
-	{1, oid_rt_pro_set_continuous_tx_hdl},
-	/* 0x0C OID_RT_PRO_SET_SINGLE_CARRIER_TX_CONTINUOUS */
-	{1, oid_rt_pro_set_single_carrier_tx_hdl},
-	/* 0x0D OID_RT_PRO_SET_TX_ANTENNA_BB */
-	{1, oid_null_function},
-	/* 0x0E */
-	{1, oid_rt_pro_set_antenna_bb_hdl},
-	/* 0x0F	OID_RT_PRO_SET_CR_SCRAMBLER */
-	{1, oid_null_function},
-	/* 0x10	OID_RT_PRO_SET_CR_NEW_FILTER */
-	{1, oid_null_function},
-	/* 0x11 OID_RT_PRO_SET_TX_POWER_CONTROL */
-	{1, oid_rt_pro_set_tx_power_control_hdl},
-	/* 0x12	OID_RT_PRO_SET_CR_TX_CONFIG */
-	{1, oid_null_function},
-	/* 0x13  OID_RT_PRO_GET_TX_POWER_CONTROL */
-	{1, oid_null_function},
-	/* 0x14  OID_RT_PRO_GET_CR_SIGNAL_QUALITY */
-	{1, oid_null_function},
-	/* 0x15	OID_RT_PRO_SET_CR_SETPOINT */
-	{1, oid_null_function},
-	/* 0x16	OID_RT_PRO_SET_INTEGRATOR */
-	{1, oid_null_function},
-	/* 0x17	OID_RT_PRO_SET_SIGNAL_QUALITY */
-	{1, oid_null_function},
-	/* 0x18	OID_RT_PRO_GET_INTEGRATOR */
-	{1, oid_null_function},
-	/* 0x19	OID_RT_PRO_GET_SIGNAL_QUALITY */
-	{1, oid_null_function},
-	/* 0x1A	OID_RT_PRO_QUERY_EEPROM_TYPE */
-	{1, oid_null_function},
-	/* 0x1B	OID_RT_PRO_WRITE_MAC_ADDRESS */
-	{1, oid_null_function},
-	/* 0x1C	OID_RT_PRO_READ_MAC_ADDRESS */
-	{1, oid_null_function},
-	/* 0x1D	OID_RT_PRO_WRITE_CIS_DATA */
-	{1, oid_null_function},
-	/* 0x1E	OID_RT_PRO_READ_CIS_DATA */
-	{1, oid_null_function},
-	/* 0x1F	OID_RT_PRO_WRITE_POWER_CONTROL */
-	{1, oid_null_function}
-};
-
-static const struct oid_obj_priv oid_rtl_seg_81_80_20[] = {
-	/* 0x20	OID_RT_PRO_READ_POWER_CONTROL */
-	{1, oid_null_function},
-	/* 0x21	OID_RT_PRO_WRITE_EEPROM */
-	{1, oid_null_function},
-	/* 0x22	OID_RT_PRO_READ_EEPROM */
-	{1, oid_null_function},
-	/* 0x23 */
-	{1, oid_rt_pro_reset_tx_packet_sent_hdl},
-	/* 0x24 */
-	{1, oid_rt_pro_query_tx_packet_sent_hdl},
-	/* 0x25 */
-	{1, oid_rt_pro_reset_rx_packet_received_hdl},
-	/* 0x26 */
-	{1, oid_rt_pro_query_rx_packet_received_hdl},
-	/* 0x27 */
-	{1, oid_rt_pro_query_rx_packet_crc32_error_hdl},
-	/* 0x28 OID_RT_PRO_QUERY_CURRENT_ADDRESS */
-	{1, oid_null_function},
-	/* 0x29 OID_RT_PRO_QUERY_PERMANENT_ADDRESS */
-	{1, oid_null_function},
-	/* 0x2A OID_RT_PRO_SET_PHILIPS_RF_PARAMETERS */
-	{1, oid_null_function},
-	/* 0x2B OID_RT_PRO_SET_CARRIER_SUPPRESSION_TX */
-	{1, oid_rt_pro_set_carrier_suppression_tx_hdl},
-	/* 0x2C	OID_RT_PRO_RECEIVE_PACKET */
-	{1, oid_null_function},
-	/* 0x2D	OID_RT_PRO_WRITE_EEPROM_BYTE */
-	{1, oid_null_function},
-	/* 0x2E	OID_RT_PRO_READ_EEPROM_BYTE */
-	{1, oid_null_function},
-	/* 0x2F */
-	{1, oid_rt_pro_set_modulation_hdl}
-};
-
-static const struct oid_obj_priv oid_rtl_seg_81_80_40[] = {
-	{1, oid_null_function},				/* 0x40 */
-	{1, oid_null_function},				/* 0x41 */
-	{1, oid_null_function},				/* 0x42 */
-	{1, oid_rt_pro_set_single_tone_tx_hdl},		/* 0x43 */
-	{1, oid_null_function},				/* 0x44 */
-	{1, oid_null_function}				/* 0x45 */
-};
-
-static const struct oid_obj_priv oid_rtl_seg_81_80_80[] = {
-	{1, oid_null_function},		/* 0x80	OID_RT_DRIVER_OPTION */
-	{1, oid_null_function},		/* 0x81	OID_RT_RF_OFF */
-	{1, oid_null_function}		/* 0x82	OID_RT_AUTH_STATUS */
-
-};
-
-static const struct oid_obj_priv oid_rtl_seg_81_85[] = {
-	/* 0x00	OID_RT_WIRELESS_MODE */
-	{1, oid_rt_wireless_mode_hdl}
-};
 
 #else /* _RTL871X_MP_IOCTL_C_ */
-extern struct oid_obj_priv oid_rtl_seg_81_80_00[32];
-extern struct oid_obj_priv oid_rtl_seg_81_80_20[16];
-extern struct oid_obj_priv oid_rtl_seg_81_80_40[6];
-extern struct oid_obj_priv oid_rtl_seg_81_80_80[3];
-extern struct oid_obj_priv oid_rtl_seg_81_85[1];
 extern struct oid_obj_priv oid_rtl_seg_81_87[5];
 extern struct oid_obj_priv oid_rtl_seg_87_11_00[32];
 extern struct oid_obj_priv oid_rtl_seg_87_11_20[5];
-- 
2.27.0


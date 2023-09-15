Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD59211C9A
	for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 16:07:40 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4047ef37f55so1659855e9.1
        for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 09:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694794059; x=1695398859; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z8+9VTkbBAtEYZ5WKhgH4h5UYlHRNkMT6NJfQFUOH+k=;
        b=BkhctFzpFqa5Mm8VOgTQ52C2P9ZmyqvtIFfapzrL9efEm2nwbVXEeFXMtn7236H1+9
         ptMDQzHkYzdhOsymYxRG5DdBvRhh/N0tKUHQ5gGLSXrzJB64TZTNj3sJGhKtap5wQWub
         +sgfS11nQZ4LRJGstCFsCkHkiZ+HOqX3bQIBR1+7XZIAgY4PKrKnZ6gKSA2XWR/66uwf
         7C56VrGKF5WLW1S0LF386I2mz6R5Rl8kF+x4+h+YYmLAiulElpS7omGPZ/pWE5yiItTF
         ohKu+vb5rNueznBKIr5q+1RGXytASFxoExcHgeykvgWURG2wRvPf6e09Hnw4VXAH54fT
         UO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694794059; x=1695398859;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8+9VTkbBAtEYZ5WKhgH4h5UYlHRNkMT6NJfQFUOH+k=;
        b=M/ciGR64tE4AmCff0ovCagVm3XqXYCcL2lJcy+RGl2gJjrCIHY5Tj+kHrzYio/qCwK
         u0GrV/+/VXWDVNrK4cYFT/spZMzskcJ+FYD8k4eJo5S0XYLm6Cczq8VIwGVV/VK7sBxc
         xSsZJrtpEQW1tecywwsS8eQL4rn9OR+4yajKsxMB/7dqXn/VEwb5YRNsZiYiUBY7UBdo
         eg8sARlrkxjYzP8jvHSt9QkqjqgT1bdO/p4rvi8B7zc58G1xruNb0o69kIdhJIsRuECO
         whqrJ4vKL5tpyoN1Fgxdndt22kfN8Etg8I4PY53qRbnEIk2KTGrjCf5yAFB9ztpk3JnQ
         VOAQ==
X-Gm-Message-State: AOJu0YxD9o/gO8NAeGAFUqraIVa1YbCnTMy1C3+WLgP/UapCDvEOmMQv
	eeW7V9oljeB3jiTzR9Hwa1c=
X-Google-Smtp-Source: AGHT+IEMz0Cuk/KznlLMCr55N+i+cr7n6FnthXKQ62l7UkydGt9f+g5SOG+eXXcHV0qRuXdChPvEkg==
X-Received: by 2002:a7b:cd91:0:b0:3fe:d46a:ef4b with SMTP id y17-20020a7bcd91000000b003fed46aef4bmr1918796wmj.1.1694794058704;
        Fri, 15 Sep 2023 09:07:38 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id k8-20020a5d4288000000b00317a29af4b2sm4761826wrq.68.2023.09.15.09.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 09:07:38 -0700 (PDT)
Date: Fri, 15 Sep 2023 18:07:36 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 07/16] staging: rtl8192e: Remove unused struct rtllib_hdr and
 two enums
Message-ID: <4bdb5e4d604eb3bd46c7853ad6d9a60f6208dd4a.1694792595.git.philipp.g.hortmann@gmail.com>
References: <cover.1694792595.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1694792595.git.philipp.g.hortmann@gmail.com>

Remove struct rtllib_hdr, enum rt_ps_mode and enum fw_cmd_io_type as those
are not used.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h | 40 -------------------------------
 1 file changed, 40 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 55f96f446f9e..717b74dc005d 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -679,12 +679,6 @@ struct rtllib_pspoll_hdr {
 	u8 ta[ETH_ALEN];
 } __packed;
 
-struct rtllib_hdr {
-	__le16 frame_ctl;
-	__le16 duration_id;
-	u8 payload[];
-} __packed;
-
 struct rtllib_hdr_4addr {
 	__le16 frame_ctl;
 	__le16 duration_id;
@@ -1157,13 +1151,6 @@ enum fsync_state {
 	SW_Fsync
 };
 
-enum rt_ps_mode {
-	eActive,
-	eMaxPs,
-	eFastPs,
-	eAutoPs,
-};
-
 enum ips_callback_function {
 	IPS_CALLBACK_NONE = 0,
 	IPS_CALLBACK_MGNT_LINK_REQUEST = 1,
@@ -1220,33 +1207,6 @@ enum scan_op_backup_opt {
 	SCAN_OPT_MAX
 };
 
-enum fw_cmd_io_type {
-	FW_CMD_DIG_ENABLE = 0,
-	FW_CMD_DIG_DISABLE = 1,
-	FW_CMD_DIG_HALT = 2,
-	FW_CMD_DIG_RESUME = 3,
-	FW_CMD_HIGH_PWR_ENABLE = 4,
-	FW_CMD_HIGH_PWR_DISABLE = 5,
-	FW_CMD_RA_RESET = 6,
-	FW_CMD_RA_ACTIVE = 7,
-	FW_CMD_RA_REFRESH_N = 8,
-	FW_CMD_RA_REFRESH_BG = 9,
-	FW_CMD_RA_INIT = 10,
-	FW_CMD_IQK_ENABLE = 11,
-	FW_CMD_TXPWR_TRACK_ENABLE = 12,
-	FW_CMD_TXPWR_TRACK_DISABLE = 13,
-	FW_CMD_TXPWR_TRACK_THERMAL = 14,
-	FW_CMD_PAUSE_DM_BY_SCAN = 15,
-	FW_CMD_RESUME_DM_BY_SCAN = 16,
-	FW_CMD_RA_REFRESH_N_COMB = 17,
-	FW_CMD_RA_REFRESH_BG_COMB = 18,
-	FW_CMD_ANTENNA_SW_ENABLE = 19,
-	FW_CMD_ANTENNA_SW_DISABLE = 20,
-	FW_CMD_TX_FEEDBACK_CCX_ENABLE = 21,
-	FW_CMD_LPS_ENTER = 22,
-	FW_CMD_LPS_LEAVE = 23,
-};
-
 #define RT_MAX_LD_SLOT_NUM	10
 struct rt_link_detect {
 	u32				NumRecvBcnInPeriod;
-- 
2.42.0


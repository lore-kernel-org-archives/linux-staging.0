Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22126F
	for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 13:37:27 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id z2so16834973wrl.5
        for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 06:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3mtd7HuVefSvznfbNmvagX0gr2E/rop+KmBUE+4UPCM=;
        b=Nli+sHC6IctOMBuBsYQgLSfBP0eWlktmttcR8lKui31kA9/AeEybvBFhpEyG6GdvJ0
         zMC85xSFBkia2r/0D2Olwk+18lGI2TpvHDLydh5z6jniLf1fbe0oP1HyLgKcgUFdb0Ue
         6sYYtj7QKITcfKgpH7PhGmKOA+q7Jp1x8N2m7FMMGJi2wiJL8gh0zPQf5zSUEk8xY7Fh
         wwHTfmhMpEG5sMaIgB4E6j2gtl43ICSXf/Gw0lNJbwPXBymoeOHTb2HJ+90KXQ1hpHVf
         L3r5pyPv6uN6rmZg6v9/JrzfB+WimGdd5E9bcln+pANZR4CU6JJBxQS1H4aPPDUIAG8e
         GGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3mtd7HuVefSvznfbNmvagX0gr2E/rop+KmBUE+4UPCM=;
        b=n91NP3lTchj+eVsn4ZAVBWIl5qn3gt4fAf/f25ZKDJJMKSfwtr+W5iOmY8T+pWWmpw
         TXeOrxlRfZKJIo0ZcGCwHaftoxkWXkoSKG8I2KP7hYDchWC68Ep2g1BWz1aquzxDF3u9
         cKX/L5n255G0U5hucq8yRIJTftqpmHvB4MjJvCt9gvBTH0AF686RZDTjjN1rQqA5Puym
         Y8V2XS+TBgNbF0oQVCQXj7+CiR3+D26rKOa0VzSuLMUuHTvpUkFcWkqDh05xR4HnhC2e
         xAiZxeQ6n00GYB5zmSVjfyQOZr2YgcpoyKhMAMuxg0sPfk5QPjJaI35TSTAUSxykCx/d
         a2Og==
X-Gm-Message-State: AOAM5301w3pOgQX0ogwCtn5yVxRK2M02T4QSohhAZHavEBZLOe7vY02B
	dAKEbw12BctYzDgw0UBfXkLxiJKpZtw=
X-Google-Smtp-Source: ABdhPJws04+zIpGengRxcJWWDMeVg1Fc/EkCcfJm/JqxUDc5C0fHkDGc9WWLhSS57tFryJrWU+lTqg==
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr18496998wrd.104.1616420246318;
        Mon, 22 Mar 2021 06:37:26 -0700 (PDT)
Received: from gimli.cesven (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id d204sm17091770wmc.17.2021.03.22.06.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 06:37:26 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 18/19] Staging: rtl8723bs: remove useless structs in odm_HWConfig.h
Date: Mon, 22 Mar 2021 14:37:16 +0100
Message-Id: <20210322133717.17797-19-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322133717.17797-1-marcocesati@gmail.com>
References: <20210322133717.17797-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unreferenced struct in hal/odm_HWConfig.h:

	struct phy_status_rpt_8812_t

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_HWConfig.h | 45 --------------------
 1 file changed, 45 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.h b/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
index eda35d2e7d29..574f9cfe8190 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
@@ -76,51 +76,6 @@ struct phy_status_rpt_8192cd_t {
 #endif
 };
 
-
-struct phy_status_rpt_8812_t {
-	/* 2012.05.24 LukeLee: This structure should take big/little endian in consideration later..... */
-
-	/* DWORD 0 */
-	u8 gain_trsw[2];
-#if (ODM_ENDIAN_TYPE == ODM_ENDIAN_LITTLE)
-	u16 chl_num:10;
-	u16 sub_chnl:4;
-	u16 r_RFMOD:2;
-#else	/*  _BIG_ENDIAN_ */
-	u16 r_RFMOD:2;
-	u16 sub_chnl:4;
-	u16 chl_num:10;
-#endif
-
-	/* DWORD 1 */
-	u8 pwdb_all;
-	u8 cfosho[4];	/*  DW 1 byte 1 DW 2 byte 0 */
-
-	/* DWORD 2 */
-	s8 cfotail[4]; /*  DW 2 byte 1 DW 3 byte 0 */
-
-	/* DWORD 3 */
-	s8 rxevm[2]; /*  DW 3 byte 1 DW 3 byte 2 */
-	s8 rxsnr[2]; /*  DW 3 byte 3 DW 4 byte 0 */
-
-	/* DWORD 4 */
-	u8 PCTS_MSK_RPT[2];
-	u8 pdsnr[2]; /*  DW 4 byte 3 DW 5 Byte 0 */
-
-	/* DWORD 5 */
-	u8 csi_current[2];
-	u8 rx_gain_c;
-
-	/* DWORD 6 */
-	u8 rx_gain_d;
-	s8 sigevm;
-	u8 resvd_0;
-	u8 antidx_anta:3;
-	u8 antidx_antb:3;
-	u8 resvd_1:2;
-};
-
-
 void ODM_PhyStatusQuery(
 	struct dm_odm_t *pDM_Odm,
 	struct odm_phy_info *pPhyInfo,
-- 
2.30.2


Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166D42F80
	for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 11:05:39 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id d6so2033410wrc.11
        for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 04:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SeV4zNvKTd6nUws9w3oBb06OOOjjB2OF7049v6R82t0=;
        b=TyZieUKQWi3kJogRNtFjq6Kq/h/u2vC/aSU7SsKOdroUESN49pFFQLnr/erBOljPkU
         VHHuHslmekWXidPVxczqgRkXuHxVNmXsixhdTVVz0UnH+Kyk+eL/IpwqFCXkQbjAPIK/
         52NzKV52qKb4/d48C3m5czQoH80ghb2wmNCpP7n1l3KY402XWHOFe7nK928H7FwTY3n0
         9sKn+YeY+PfLp3DzBAgmcurjC5B+4SMwKTckKBrdK2vF5gGZfXfrmI8ql0g6UlRRrwG5
         HiGP9a/uCJvYVCrmeiT2AZzEkJ4Xh5Kx+rDYVmmr2frrQrLjq3kRcbRo7f965xQBa2vy
         tNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SeV4zNvKTd6nUws9w3oBb06OOOjjB2OF7049v6R82t0=;
        b=nwJIipp8kQfaBJyN9jXOkxX/fCeZIMvlXpLU32VKgOUJYM4ycSFkXe3K6zNvC8oM3v
         3W6IuM0X8VhLYOVONg6+kHxeozg4rjk9jSABHfz6ua3Cjg2PW0OWZ3ayn4NZbW/sSNHU
         b8MeaZ55besAwxdPGqB2FHG+xAWNY5P859Al0z/S1Y4BeSkAPrOYWplAljTLo0Nc5BRS
         Or1/pO/zwUpAL5eyT2qKSyULWoG/+YTDU5jgI+rlkW0OX3nzRvEMZcXYhOsRwitiuXAK
         hkCV6Zt1902r5jZ6X/kXIUBOapQjEmPBCqJIoiJWLjSEAHYTP3cyosKZju5rahSBk9YK
         6tcA==
X-Gm-Message-State: AOAM531Qa7MOIP47P+87WBes9stxxNHafaNEr8TLPEpDhGjcnFYWrO9Q
	EODsZgyspnLEe6ZvaApHYR0=
X-Google-Smtp-Source: ABdhPJyJCQv8bvnejR9MjzuzJg8kxPZxu/XjQrN5B9cplx7ffUDnn8XkDMKzbx9VAhoj3Oi4E/HFtA==
X-Received: by 2002:a5d:424c:: with SMTP id s12mr9241861wrr.268.1631271937436;
        Fri, 10 Sep 2021 04:05:37 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id h8sm3920783wmb.35.2021.09.10.04.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 04:05:37 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/3] staging: remove wrapper rtw_IOL_exec_cmds_sync()
Date: Fri, 10 Sep 2021 13:05:25 +0200
Message-Id: <20210910110526.4093-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210910110526.4093-1-straube.linux@gmail.com>
References: <20210910110526.4093-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_IOL_exec_cmds_sync() is just a wrapper around
rtl8188e_IOL_exec_cmds_sync(). Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_iol.c          |  5 -----
 drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c  |  4 ++--
 drivers/staging/r8188eu/hal/HalHWImg8188E_MAC.c |  2 +-
 drivers/staging/r8188eu/hal/HalHWImg8188E_RF.c  |  2 +-
 drivers/staging/r8188eu/include/rtw_iol.h       |  3 ---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c    | 10 +++++-----
 6 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_iol.c b/drivers/staging/r8188eu/core/rtw_iol.c
index 9c85e590fc9d..08677552e5d6 100644
--- a/drivers/staging/r8188eu/core/rtw_iol.c
+++ b/drivers/staging/r8188eu/core/rtw_iol.c
@@ -72,11 +72,6 @@ bool rtw_IOL_applied(struct adapter  *adapter)
 	return false;
 }
 
-int rtw_IOL_exec_cmds_sync(struct adapter  *adapter, struct xmit_frame *xmit_frame, u32 max_wating_ms, u32 bndy_cnt)
-{
-	return rtl8188e_IOL_exec_cmds_sync(adapter, xmit_frame, max_wating_ms, bndy_cnt);
-}
-
 int rtw_IOL_append_LLT_cmd(struct xmit_frame *xmit_frame, u8 page_boundary)
 {
 	return _SUCCESS;
diff --git a/drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c b/drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c
index 55aa20a30342..86e92552dfb0 100644
--- a/drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c
+++ b/drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c
@@ -246,7 +246,7 @@ enum HAL_STATUS ODM_ReadAndConfig_AGC_TAB_1T_8188E(struct odm_dm_struct *dm_odm)
 		}
 	}
 	if (biol) {
-		if (!rtw_IOL_exec_cmds_sync(dm_odm->Adapter, pxmit_frame, 1000, bndy_cnt)) {
+		if (!rtl8188e_IOL_exec_cmds_sync(dm_odm->Adapter, pxmit_frame, 1000, bndy_cnt)) {
 			printk("~~~ %s IOL_exec_cmds Failed !!!\n", __func__);
 			rst = HAL_STATUS_FAILURE;
 		}
@@ -557,7 +557,7 @@ enum HAL_STATUS ODM_ReadAndConfig_PHY_REG_1T_8188E(struct odm_dm_struct *dm_odm)
 		}
 	}
 	if (biol) {
-		if (!rtw_IOL_exec_cmds_sync(dm_odm->Adapter, pxmit_frame, 1000, bndy_cnt)) {
+		if (!rtl8188e_IOL_exec_cmds_sync(dm_odm->Adapter, pxmit_frame, 1000, bndy_cnt)) {
 			rst = HAL_STATUS_FAILURE;
 			pr_info("~~~ IOL Config %s Failed !!!\n", __func__);
 		}
diff --git a/drivers/staging/r8188eu/hal/HalHWImg8188E_MAC.c b/drivers/staging/r8188eu/hal/HalHWImg8188E_MAC.c
index 0ff2609c26bb..0aab0eb87682 100644
--- a/drivers/staging/r8188eu/hal/HalHWImg8188E_MAC.c
+++ b/drivers/staging/r8188eu/hal/HalHWImg8188E_MAC.c
@@ -204,7 +204,7 @@ enum HAL_STATUS ODM_ReadAndConfig_MAC_REG_8188E(struct odm_dm_struct *dm_odm)
 		}
 	}
 	if (biol) {
-		if (!rtw_IOL_exec_cmds_sync(dm_odm->Adapter, pxmit_frame, 1000, bndy_cnt)) {
+		if (!rtl8188e_IOL_exec_cmds_sync(dm_odm->Adapter, pxmit_frame, 1000, bndy_cnt)) {
 			pr_info("~~~ MAC IOL_exec_cmds Failed !!!\n");
 			rst = HAL_STATUS_FAILURE;
 		}
diff --git a/drivers/staging/r8188eu/hal/HalHWImg8188E_RF.c b/drivers/staging/r8188eu/hal/HalHWImg8188E_RF.c
index 55e4b4a877a4..b4269ad56ede 100644
--- a/drivers/staging/r8188eu/hal/HalHWImg8188E_RF.c
+++ b/drivers/staging/r8188eu/hal/HalHWImg8188E_RF.c
@@ -241,7 +241,7 @@ enum HAL_STATUS ODM_ReadAndConfig_RadioA_1T_8188E(struct odm_dm_struct *pDM_Odm)
 		}
 	}
 	if (biol) {
-		if (!rtw_IOL_exec_cmds_sync(pDM_Odm->Adapter, pxmit_frame, 1000, bndy_cnt)) {
+		if (!rtl8188e_IOL_exec_cmds_sync(pDM_Odm->Adapter, pxmit_frame, 1000, bndy_cnt)) {
 			rst = HAL_STATUS_FAILURE;
 			pr_info("~~~ IOL Config %s Failed !!!\n", __func__);
 		}
diff --git a/drivers/staging/r8188eu/include/rtw_iol.h b/drivers/staging/r8188eu/include/rtw_iol.h
index 471f9ca092a8..a07c3ae0bed7 100644
--- a/drivers/staging/r8188eu/include/rtw_iol.h
+++ b/drivers/staging/r8188eu/include/rtw_iol.h
@@ -34,9 +34,6 @@ struct xmit_frame *rtw_IOL_accquire_xmit_frame(struct adapter *adapter);
 int rtw_IOL_append_cmds(struct xmit_frame *xmit_frame, u8 *IOL_cmds,
 			u32 cmd_len);
 int rtw_IOL_append_LLT_cmd(struct xmit_frame *xmit_frame, u8 page_boundary);
-int rtw_IOL_exec_cmds_sync(struct adapter  *adapter,
-			   struct xmit_frame *xmit_frame, u32 max_wating_ms,
-			   u32 bndy_cnt);
 bool rtw_IOL_applied(struct adapter  *adapter);
 int rtw_IOL_append_DELAY_US_cmd(struct xmit_frame *xmit_frame, u16 us);
 int rtw_IOL_append_DELAY_MS_cmd(struct xmit_frame *xmit_frame, u16 ms);
diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 08b891b9c708..b428d0b36171 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -4032,7 +4032,7 @@ static int rtw_dbg_port(struct net_device *dev,
 
 			rtw_IOL_append_LLT_cmd(xmit_frame, page_boundary);
 
-			if (_SUCCESS != rtw_IOL_exec_cmds_sync(padapter, xmit_frame, 500, 0))
+			if (rtl8188e_IOL_exec_cmds_sync(padapter, xmit_frame, 500, 0) != _SUCCESS)
 				ret = -EPERM;
 		}
 			break;
@@ -4056,7 +4056,7 @@ static int rtw_dbg_port(struct net_device *dev,
 				rtw_IOL_append_WB_cmd(xmit_frame, reg, 0x08, 0xff);
 				rtw_IOL_append_DELAY_MS_cmd(xmit_frame, blink_delay_ms);
 			}
-			if (_SUCCESS != rtw_IOL_exec_cmds_sync(padapter, xmit_frame, (blink_delay_ms * blink_num * 2) + 200, 0))
+			if (rtl8188e_IOL_exec_cmds_sync(padapter, xmit_frame, (blink_delay_ms * blink_num * 2) + 200, 0) != _SUCCESS)
 				ret = -EPERM;
 		}
 			break;
@@ -4078,7 +4078,7 @@ static int rtw_dbg_port(struct net_device *dev,
 
 			for (i = 0; i < write_num; i++)
 				rtw_IOL_append_WB_cmd(xmit_frame, reg, i + start_value, 0xFF);
-			if (_SUCCESS != rtw_IOL_exec_cmds_sync(padapter, xmit_frame, 5000, 0))
+			if (rtl8188e_IOL_exec_cmds_sync(padapter, xmit_frame, 5000, 0) != _SUCCESS)
 				ret = -EPERM;
 
 			final = rtw_read8(padapter, reg);
@@ -4107,7 +4107,7 @@ static int rtw_dbg_port(struct net_device *dev,
 
 			for (i = 0; i < write_num; i++)
 				rtw_IOL_append_WW_cmd(xmit_frame, reg, i + start_value, 0xFFFF);
-			if (_SUCCESS != rtw_IOL_exec_cmds_sync(padapter, xmit_frame, 5000, 0))
+			if (rtl8188e_IOL_exec_cmds_sync(padapter, xmit_frame, 5000, 0) != _SUCCESS)
 				ret = -EPERM;
 
 			final = rtw_read16(padapter, reg);
@@ -4135,7 +4135,7 @@ static int rtw_dbg_port(struct net_device *dev,
 
 			for (i = 0; i < write_num; i++)
 				rtw_IOL_append_WD_cmd(xmit_frame, reg, i + start_value, 0xFFFFFFFF);
-			if (_SUCCESS != rtw_IOL_exec_cmds_sync(padapter, xmit_frame, 5000, 0))
+			if (rtl8188e_IOL_exec_cmds_sync(padapter, xmit_frame, 5000, 0) != _SUCCESS)
 				ret = -EPERM;
 
 			final = rtw_read32(padapter, reg);
-- 
2.33.0


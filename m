Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363DF71
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:02:50 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id r7so38681032wrm.1
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1geH8MaSIgPsbNMxb2TdqgxuHhF/mDAA2khFi82Rz4g=;
        b=X0M7hUHsT8s32KzF8D5jLFxJI1uKbHZYMK4VTzfb3GyVgrpy3kcKohg0XBvPvVw0eZ
         KNdDe0B2r/yyRZjCwewLT+A49RiLOXK94ERjjD/xpLd8T9ukNac6RfBFSj0Q+3R9EeIl
         2QqbcFekegl7Yh5DOxqeBhZSaqlcTVxh4Dppmjwosf7OFVIpM28T45HX6dttSJUplT//
         CgF8SHCex/dHIHMgTwoXrdKFsMv9JM9pEW7Bg1oCEdY8IplQHMXrm9soigpvx5hG7X+/
         Jy5vxdSt7yIgipC53RA4ZZqxn+dvlQQ63ZO+ZaoALUWNLePBHZkZpX76uHhw/ppcTqGM
         ckWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1geH8MaSIgPsbNMxb2TdqgxuHhF/mDAA2khFi82Rz4g=;
        b=Ba812kQGdDAZ+SMarFDT4ST7lJvAYhMgXARN7wLKfysFYA88BZBI1ZfzAalw+gND53
         DglAPKYJjXqfyGOtDqhcUnskxQ3oH/1ArWx/K4x/rRz5nJ8ZRZoYm2RTLeD04XyovG8y
         hypGmGDasCADoPAEvduE9Lh18ZckJ52Ksuxp291sFGDffM39SL5XLGvxAo3F1hLAAwT2
         opW+vH8PqMG6+A75TCmYiv9muNU2d2L3FBroSPCo2MP92SbbmUCDJyTfC0+8qBQNBCk0
         TQZb9b5V+TdntOIZ68U4LzCtnkQHzbnQVgtEx6fmL4tCEL5aise7twtyaeAOR+k09MZm
         pgvg==
X-Gm-Message-State: AOAM532rm3gTMPHMJah3o4cPXI2gEsljjv5XEgB5/txe49/XspbLto5p
	XuaiNFvapRjoUhDC61IQsWw=
X-Google-Smtp-Source: ABdhPJx/B/wLoWNdmcJXM/Z0KGhsKXFxqObAux7bt0ANQojCJiWhFrWPpY8hwg30h7SjDw+hMV4Lyg==
X-Received: by 2002:adf:c541:: with SMTP id s1mr9760171wrf.370.1619254968873;
        Sat, 24 Apr 2021 02:02:48 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id y19sm12962286wmj.28.2021.04.24.02.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:02:48 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/50] staging: rtl8723bs: remove unused rf_reg_dump() function argument
Date: Sat, 24 Apr 2021 11:01:51 +0200
Message-Id: <32d99e0a094cc59a35788c468dd3e20b486c9e20.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused function argument void *sel from rf_reg_dump.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_debug.c     | 2 +-
 drivers/staging/rtl8723bs/include/rtw_debug.h  | 2 +-
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_debug.c b/drivers/staging/rtl8723bs/core/rtw_debug.c
index 9dfa71580b2e..642aa556c462 100644
--- a/drivers/staging/rtl8723bs/core/rtw_debug.c
+++ b/drivers/staging/rtl8723bs/core/rtw_debug.c
@@ -59,7 +59,7 @@ static void dump_4_rf_regs(struct adapter *adapter, int path, int offset)
 		   i, reg[0], reg[1], reg[2], reg[3]);
 }
 
-void rf_reg_dump(void *sel, struct adapter *adapter)
+void rf_reg_dump(struct adapter *adapter)
 {
 	int i, path;
 	u8 rf_type = 0;
diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 6064de93c24c..fc187a4ed2c3 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -150,6 +150,6 @@
 
 void mac_reg_dump(struct adapter *adapter);
 void bb_reg_dump(struct adapter *adapter);
-void rf_reg_dump(void *sel, struct adapter *adapter);
+void rf_reg_dump(struct adapter *adapter);
 
 #endif	/* __RTW_DEBUG_H__ */
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index fa260714b588..5912915a7870 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -2738,7 +2738,7 @@ static int rtw_dbg_port(struct net_device *dev,
 						else if (extra_arg == 1)
 							bb_reg_dump(padapter);
 						else if (extra_arg == 2)
-							rf_reg_dump(RTW_DBGDUMP, padapter);
+							rf_reg_dump(padapter);
 					}
 					break;
 
-- 
2.20.1


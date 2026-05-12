Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E12026F46F
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 10:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778582777; cv=none; b=gAhEJr7sbqBxOvznLoL3xhA0qSEA+CLwjTo7FWULPBezmitbHrQpJBgEzGixNVujvQDG7XMwBXhpH4x47DaPNLCrNUxJtqd/5t7/P+r46P0Hri3B3alr0jzjyc7FsYCWvJlk0QdyOZMNXMDjLMqeS9Yvc3ShbzdSYqSXp9Od3i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778582777; c=relaxed/simple;
	bh=wOtsid2cUg2EVxRaTz8NHiq6PheKKCzEcGzh7pVPZJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QfIReQh4enOxm5mg3zD/9rHaZQu2Wy3ZPJKTaoq8T3MyN7oCvUlOci8tm0h+Z6FCIMY5USSS3dNLHZHaEXDMQ/I+nemNTIzVkwd/7poTFY2Zo9D69zfg8xkY19XmCicSuQVZVQSHDLfz2VyrU5+UyfynhYt6bSXMK5T9x+S6KTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDE8Rpu3; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDE8Rpu3"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2b9ec9443c2so33825915ad.1
        for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 03:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778582776; x=1779187576; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WJ/WCKT66Ns5XkPseXRzaBnBs4PK/XwpCXzZJVvd2Q8=;
        b=BDE8Rpu3OlnPcnuPjXoAUzsE32fqKjcq1nyvr8D1JnQZd4Al1MPDh5qN3XeiEjQ+TP
         oIdE9yhZadkJJueM7YIOhKGvGmMyJULfW8Dk7/TEX5eSBYMkD2TZ8S58otfk9hqu5gIg
         eu8AigNj0TUPEsjhdDkP3BmIgAHNtGRITqanDPUHC98Nb6SADCKQ06JfWUIamGUYalSa
         fb0WO8r0Le9uKwAZAkdb5a209cMVLV7i0BYwVCuYtwn7oF+Pc4KLA2S7uRo1uoy5Zdw9
         mKZyryQdCDa0WizqlMxxxw0FyPAA8M0OlhI6N8kE+sCDCT6oKYek4sN6ksjGB46CfrhN
         /s8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778582776; x=1779187576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJ/WCKT66Ns5XkPseXRzaBnBs4PK/XwpCXzZJVvd2Q8=;
        b=tUceHSCEB20+FWW1ga/be8LrgrU/WBK1guu25xNozITH5UzZU79qFMZ8RQtLvRPT87
         KzWH/BslSZjV+AJMAJgdsDtWoAVrdYaZshZywk3SWeO4sZz5aSQcDXsUxnxc0oiYxxBI
         ATiLAHS5+eFEmhhzHtgwbcNf9or1bLSwBaN7aQXCNpK+CMpo1y+EfSI8EYSuap5eUTD6
         2UfPfIW1cACt/dbxgTOGZAwF6qiADOWIgs+4WJcqeydAWr1CGouPX4L8QkQeSPd37qzE
         2DymsrWSU0FNxm4vJ18vKbScFSn5fsnueaqDlYdBDBiALzOQ9ZquKsXAkEsnHapYiG0c
         zptA==
X-Gm-Message-State: AOJu0Yw8xWoeeUKvFm5sEH+eL9e85LFrit3vhNHqYHDzAM2U364OSMzb
	Xjkhwch4xVCuNCJyx90Hgl6XXX8a2sACYDhxP8rwGSjN/cbg51clH2vL5SHmxirH
X-Gm-Gg: Acq92OGc9Bah00dbRWHpsMjSeIXJckvA5aqJhcK5s3S47eFDB6kcCw2CK3ER32iYUCU
	fsFID34dJNyPkRrtK2E/T47ei2s7wlNTbXKyvFo7H5uEFy0MOMmUrukYM8wM81fp08LesJRQ9NZ
	hlnrLxU61+DDyLexnQ8U4oJe3xaX6BcQjDXvUoTaW+rYtgj6+9JuCm8a5upEJ08lOfhh9YJSess
	ED8EOwxLrdOjcQ3qDP1D4bIurO3BucESPmSR0pwS6I/upyfV9ckKZ62pTwsR3vRwMG80Pux1Hvw
	HSJGPN2epLe64o/s+ze0FCAJ5N1HeOxfKFHjfOiYE6MIsqgQ423HI4n7irfxVjxgpvj6XukuHM3
	fhQojxfeZ1T2oNh+n9eBOg6pWot3UFFoq+pTmuD+nqaDbO/GfBFLd8LuOuhXY3MvwKe5rOrKM8X
	gGLd2+SXMU2HhsbYZXNlLgpgwffSfSIn6bG+3ojzoYqVi/qs4msXLej1sLn0ruBGmCrSTa5d9SR
	hXbi7kOa1R28VmXY4SQ+JVe90ogNVgoysqXYGoxvlq2
X-Received: by 2002:a17:902:d651:b0:2bc:b834:6ec7 with SMTP id d9443c01a7336-2bcfcc22e69mr21947075ad.2.1778582775943;
        Tue, 12 May 2026 03:46:15 -0700 (PDT)
Received: from nixos ([2405:201:c40d:9039:37b1:eaf5:1d3e:993e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ecc4bbsm127773325ad.84.2026.05.12.03.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 03:46:15 -0700 (PDT)
From: Ayushman Rout <ayushmanrout27@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ayushman Rout <ayushmanrout27@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix CamelCase of DelayLPSLastTimeStamp
Date: Tue, 12 May 2026 16:15:39 +0530
Message-ID: <20260512104539.18629-1-ayushmanrout27@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename CamelCase variable DelayLPSLastTimeStamp to
delay_lps_last_time_stamp across rtw_cmd.c, rtw_pwrctrl.c
and rtw_pwrctrl.h.

Signed-off-by: Ayushman Rout <ayushmanrout27@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c        | 2 +-
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c    | 2 +-
 drivers/staging/rtl8723bs/include/rtw_pwrctrl.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index ef15b513d363..9d7b94c75537 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1308,7 +1308,7 @@ void lps_ctrl_wk_hdl(struct adapter *padapter, u8 lps_ctrl_type)
 		rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_JOINBSSRPT, (u8 *)(&mstatus));
 		break;
 	case LPS_CTRL_SPECIAL_PACKET:
-		pwrpriv->DelayLPSLastTimeStamp = jiffies;
+		pwrpriv->delay_lps_last_time_stamp = jiffies;
 		hal_btcoex_SpecialPacketNotify(padapter, PACKET_DHCP);
 		LPS_Leave(padapter, "LPS_CTRL_SPECIAL_PACKET");
 		break;
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index f074ea6e0f38..bcbe78d93270 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -302,7 +302,7 @@ static u8 PS_RDY_CHECK(struct adapter *padapter)
 
 	curr_time = jiffies;
 
-	delta_time = curr_time - pwrpriv->DelayLPSLastTimeStamp;
+	delta_time = curr_time - pwrpriv->delay_lps_last_time_stamp;
 
 	if (delta_time < LPS_DELAY_TIME)
 		return false;
diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index c27d07861b8c..7b210cc3b2d3 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -169,7 +169,7 @@ struct pwrctrl_priv {
 	u8 power_mgnt;
 	u8 org_power_mgnt;
 	bool fw_current_in_ps_mode;
-	unsigned long	DelayLPSLastTimeStamp;
+	unsigned long	delay_lps_last_time_stamp;
 	s32		pnp_current_pwr_state;
 	u8 pnp_bstop_trx;
 
-- 
2.51.2


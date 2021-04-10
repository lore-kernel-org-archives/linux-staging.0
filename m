Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279D86D00
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 14:21:21 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id e14so13014144ejz.11
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 07:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sXbSlvie1MvfgOkP1AW3USt/q0/wLLk8BtI55t52f4g=;
        b=lFn8+kNftQ3UlKaoR50PF+v+EmY6zuhi90mKZnwAJPlgUu1bmC5wA1SrYgltETR74k
         GYpk6Fk14aCZ5hiYeTXPdSX36s0v4g2B6jca+PBG240MNlKxGfwIBJPQ0JJSitfxYV6N
         AL+kDzznoPXdDUgplwX33WkeIxTe4FVqEW66quO1DK7RS9OWJT3F67PAe3YvvJxinJDB
         DuJHfxkRNrphkUV0mZoNrrlhmupXtLZOILsW5Exws9ks3/jgXyw8U9C1c7yIAL+221BV
         aAY5dS6xd6kLRecsUVLRise05+m5E1QQ4hhf4WwxXggFU0fo1amsChUgBjIQaRYj0TXY
         Q23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sXbSlvie1MvfgOkP1AW3USt/q0/wLLk8BtI55t52f4g=;
        b=Jz4qMUVipNWmm48OtbjbsZrZpn1ecE9vd4s2OpJJcjx4OkepOmrgz4Ep044zphTdPu
         Yo1ZXnJsnv9WvxWvR4a5AyVFIG5WFwb1vXCAx62Q68U0XogOm4MzykFfZ3HpcMpwihNt
         QE4akGfECkz9W0ksjag2YqWlcKPxgLNb+5/kiKoHKoVk4OPSVGuwVy2ASFps6r90bpkw
         GQ+hi3v3Di585Wm3EFffeszDT8DhQ8zxKIV/Qb581TVyI2XKYs3zxhJxk7vCXRguVSF1
         bngqORym/epXJDHdywcjmwBZQICoE1pKPGT73ocoIvhcXR9V8e2HUwwM2YgUWMI+2HyC
         g9DQ==
X-Gm-Message-State: AOAM533T59DYcTbd3PcSPc+8FO1yxeqoS5fS5JGS3mU/ybj3S1JuJAMU
	3u3ULWmhGPXw8Vfd4+hGGX8=
X-Google-Smtp-Source: ABdhPJz6WxUQDtmCTs3zDrUsGLWLIxtiatlj6B3m7Ap9aBqZftCOSmL4l5mVj+aYuKHy3ikM9s7d8w==
X-Received: by 2002:a17:906:8392:: with SMTP id p18mr17025811ejx.132.1618064479796;
        Sat, 10 Apr 2021 07:21:19 -0700 (PDT)
Received: from agape ([5.171.81.28])
        by smtp.gmail.com with ESMTPSA id p7sm2056848eja.103.2021.04.10.07.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 07:21:19 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 25/25] staging: rtl8723bs: remove more empty if blocks after DBG_8192C deletion
Date: Sat, 10 Apr 2021 16:20:38 +0200
Message-Id: <99b111d2bac822b9dc7ff6e1cfd3d3efc62ef836.1618064275.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618064274.git.fabioaiuto83@gmail.com>
References: <cover.1618064274.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove more empty if-blocks after DBG_8192C deletion.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 049112a08776..2098384efe92 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -882,8 +882,6 @@ static void CardDisableRTL8723BSdio(struct adapter *padapter)
 
 	/*  Run LPS WL RFOFF flow */
 	ret = HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_enter_lps_flow);
-	if (ret == _FAIL) {
-	}
 
 	/* 	==== Reset digital sequence   ====== */
 
@@ -914,8 +912,6 @@ static void CardDisableRTL8723BSdio(struct adapter *padapter)
 	ret = false;
 	rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
 	ret = HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_card_disable_flow);
-	if (!ret) {
-	}
 }
 
 static u32 rtl8723bs_hal_deinit(struct adapter *padapter)
-- 
2.20.1


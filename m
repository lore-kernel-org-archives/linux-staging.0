Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56E93FCE
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 21:24:58 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id g18so8668602wrc.11
        for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 14:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q1h4DF8vwdgzDXv0WetE7P68kDtfdB8RpBQW3/t1r50=;
        b=f22pL4vTEsQRaJBRfxGB+OThWRmIS5S88NRYIbsIjOS2srvrc7wT3AhfanOIcxXmiM
         ZC+MTM5vR8PdHHPrLBNG3UIIahHBeqORSq9jACTsNSGbggbfnSP0vhDSY0Jk5FHeNs92
         1IPjDOyRdX1r8LhfncOPJbr9n2RpFLtCRJQisF53Cgv4mX2yPwMkY5rIM9pt5Q3uqa6c
         2OQ2EDyojO2JfrP+/dI0r8WZZElKRPciYK6SNQJJ62YQXGebH7lkKLIq6p1RYey+OnIb
         +Kq7/Q1p4WlGSivar32Hf8cuLUnWHScag5O0xfcrzCt+tBO4VmeLLFTps1xRKDpf/YHW
         rs1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q1h4DF8vwdgzDXv0WetE7P68kDtfdB8RpBQW3/t1r50=;
        b=Bi18bQOlGYYZr3H/Komy6JKQsoCXeZ7oy0ILxvI3MlHS0uHvJo39VIp1vH/ropqV6z
         NXjgru4oRYCYUtXASjEhQBV52OSgzDJlVUF+W8oxdscAmhJtLABhoYP7tUyjM3BJwMA9
         yurD03/jPFUcdW8ZwnBXASO/CJzew6AWdj8w4EGTjtz7v6H/5FWgRRnouRCu1NWM4gPf
         EBbkVfPlggdL6w0G5OAVD5tOK8fkgkk7v7nGDHJ6Yza1oA/t4to7yFhcuDi58N+WrcRM
         ztRrt4I507KxpMtXhNPTWwHx4xJhF7yP5Xgh3q3F60dv4cI9/YjRh+QWYW5/Bx3wxG+7
         BnsQ==
X-Gm-Message-State: AOAM530onwI7fpH6NzvTatrsNBk5aILaoU/rHDWBgE/WFv9UH0ct/BTO
	BTlFjRd7bZBzggP2QlGEulnXeg==
X-Google-Smtp-Source: ABdhPJw6iV3AMIFjF3F2nlzYwQSNyaVDYOFJAMCCpzN0XOEtnC8nZPHPTMPEXPHFQV+jgNSJFWKGJw==
X-Received: by 2002:a5d:4647:: with SMTP id j7mr17894768wrs.149.1630185897349;
        Sat, 28 Aug 2021 14:24:57 -0700 (PDT)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id u26sm8645847wrd.32.2021.08.28.14.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 14:24:57 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	fmdefrancesco@gmail.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] staging: r8188eu: remove rtw_hal_c2h_handler function
Date: Sat, 28 Aug 2021 22:24:53 +0100
Message-Id: <20210828212453.898-4-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210828212453.898-1-phil@philpotter.co.uk>
References: <20210828212453.898-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove rtw_hal_c2h_handler function from hal/hal_intf.c, as well as its
declaration in include/hal_intf.h, and remove its one remaining caller
within core/rtw_cmd.c.

This function was a wrapper function, then simplified to always return
_FAIL. Since it has no further use, remove it, as part of ongoing
efforts to simplify and remove the HAL layer of the driver.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_cmd.c     | 2 --
 drivers/staging/r8188eu/hal/hal_intf.c     | 5 -----
 drivers/staging/r8188eu/include/hal_intf.h | 2 --
 3 files changed, 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index b520c6b43c03..5222863f8d66 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -1898,8 +1898,6 @@ static void c2h_wk_callback(struct work_struct *work)
 		}
 
 		if (ccx_id_filter(c2h_evt->id)) {
-			/* Handle CCX report here */
-			rtw_hal_c2h_handler(adapter, c2h_evt);
 			kfree(c2h_evt);
 		} else {
 #ifdef CONFIG_88EU_P2P
diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index 0c835f9cd181..bcc77da06c08 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -426,11 +426,6 @@ void rtw_hal_reset_security_engine(struct adapter *adapter)
 		adapter->HalFunc.hal_reset_security_engine(adapter);
 }
 
-s32 rtw_hal_c2h_handler(struct adapter *adapter, struct c2h_evt_hdr *c2h_evt)
-{
-	return _FAIL;
-}
-
 c2h_id_filter rtw_hal_c2h_id_filter_ccx(struct adapter *adapter)
 {
 	return adapter->HalFunc.c2h_id_filter_ccx;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 4603f9212030..954de3ab2613 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -400,8 +400,6 @@ int rtw_hal_iol_cmd(struct adapter  *adapter, struct xmit_frame *xmit_frame,
 void rtw_hal_notch_filter(struct adapter *adapter, bool enable);
 void rtw_hal_reset_security_engine(struct adapter *adapter);
 
-s32 rtw_hal_c2h_handler(struct adapter *adapter,
-			struct c2h_evt_hdr *c2h_evt);
 c2h_id_filter rtw_hal_c2h_id_filter_ccx(struct adapter *adapter);
 void indicate_wx_scan_complete_event(struct adapter *padapter);
 u8 rtw_do_join(struct adapter *padapter);
-- 
2.31.1


Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD62771
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 09:53:27 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id i3so56213462edt.1
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 02:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MW4Zu+04I2pf8trbMMxIEZXFmmjHoSTSqQhr0jRymOE=;
        b=Jg+KSRSQPQQcV3bK/ichZmxSYH9xuDnVibtg+xnvKg4exE8C7ddnz172N5eHn3PwJD
         QYGP0E9+OBRF7a22SoawsnEME34Qq2rlXeopqi36sIwqmciTNDp85DbDagJA9asWXJYS
         agBSphrNL6SkQGBstFeUk05XFY6ZeT0j6OzSNq0Qa7FuXvApcPETkkyx0/VTmtj3hP0f
         824rsvyvPH0B/Kox5QvozpSa80Fi4TF0mxgVkZiXWojNQ5zRr8smzm7hGtoaeYj9QbmR
         uHrGLCSF9gi+9EvHNQbstPmzT/DrBGAK1cg13G0wMwb/i4NivmfdtwFXgfcoxVUQkHig
         gVew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MW4Zu+04I2pf8trbMMxIEZXFmmjHoSTSqQhr0jRymOE=;
        b=i85sGXtKwNJxUttyB6joWYIIzN/j83Q/C3AW0Mb5hLHmxI3mnYKGQYJ6vj9R+GYTW8
         vhIqyfPNSlUe2cdOnw4+N55x2y3Qh6JDls5ucyD6H38NpZF/yJbkbQdxDDeRTZluzOyd
         MEqt2iVaWX01+Xb9Ww/Ua9nPbkjwdroqL1cJuV4LrhD24iXMsP9vHDzndDYjdmy3wdFa
         ca2u6kegIc3XkUrCbbaFsDznUiQfbaXBSsDFeP5lIXp2wWesYXWyiiioNilaQ32ICjhb
         a2EB3o+pqFyEMr5HZpGPm+E2BsZ2oMcbvoCyp2qPBz0mVNmYTsGFtKjJ+t3bgkH6XOQl
         zf/A==
X-Gm-Message-State: AOAM533ZeEMMYadLhmxzVCKQ2jXYV3c2fWB0+67+XDMrTEkkzCU1XJrV
	5rP7DGZJbeHYb5a85msNe0yAeSt+rrby0bfv
X-Google-Smtp-Source: ABdhPJwSee4pg1QdgjgfGyVgwI4EPInNJPIifgJj/OePWYQkjF1jH3Jw31miPbwh2NBk0PanPgNwdg==
X-Received: by 2002:aa7:c412:: with SMTP id j18mr4820800edq.163.1619776406529;
        Fri, 30 Apr 2021 02:53:26 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id f30sm1626861ejl.62.2021.04.30.02.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 02:53:26 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH v2 1/2] staging: rtl8723bs: hal: Remove set but unused variables
Date: Fri, 30 Apr 2021 11:53:18 +0200
Message-Id: <20210430095319.23226-2-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210430095319.23226-1-fmdefrancesco@gmail.com>
References: <20210430095319.23226-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed four set but unused variables. Issue detected by gcc.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

Changes from v1: No changes.

 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 082448557b53..96cb4426a0f4 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -3900,14 +3900,11 @@ u8 GetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, v
 			u32 cmd;
 			u32 ra_info1, ra_info2;
 			u32 rate_mask1, rate_mask2;
-			u8 curr_tx_rate, curr_tx_sgi, hight_rate, lowest_rate;
 
 			cmd = 0x40000100 | mac_id;
 			rtw_write32(padapter, REG_HMEBOX_DBG_2_8723B, cmd);
 			msleep(10);
 			ra_info1 = rtw_read32(padapter, 0x2F0);
-			curr_tx_rate = ra_info1&0x7F;
-			curr_tx_sgi = (ra_info1>>7)&0x01;
 
 			cmd = 0x40000400 | mac_id;
 			rtw_write32(padapter, REG_HMEBOX_DBG_2_8723B, cmd);
@@ -3916,8 +3913,6 @@ u8 GetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, v
 			ra_info2 = rtw_read32(padapter, 0x2F4);
 			rate_mask1 = rtw_read32(padapter, 0x2F8);
 			rate_mask2 = rtw_read32(padapter, 0x2FC);
-			hight_rate = ra_info2&0xFF;
-			lowest_rate = (ra_info2>>8)  & 0xFF;
 
 		}
 		break;
-- 
2.31.1


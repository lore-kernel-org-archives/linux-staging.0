Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B345B2C9D
	for <linux-staging@lists.linux.dev>; Sun, 30 Jan 2022 19:03:39 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id r10so22694847edt.1
        for <linux-staging@lists.linux.dev>; Sun, 30 Jan 2022 11:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eWKC8EYtadWC+XGVduMfPXQkoMLfg/diQ6x5K2CsNlg=;
        b=g4pdwXr4gipw3Aw0TAzR5Ia26hePTyoFqBjjR5A+tyMOS1fUXpP36QgLhK9nugIb9/
         KspkISq4y202PbWPtFHWiSydoNlTGdQpkRY1n2XbXRg1ma066UfI2+Wo+LBDYfiMbiA4
         IE/V95hqiTrjMKMNYmx0pYeNNcitq6pGe0sPwUKmAYyPvXMLtKxMyKBSlgdhzi9MuFHi
         DQzYOoNiTVEAA1eoUbaHdLZQEpd34zdm2JEhLTCyAdldkc6rKs8KAuz0RO4GEh2aU5jN
         g1t8rLGr1XxnUOnDloi8/IFJvyuk1WMnehZCoNEUuVYoww9IV443Hk4cdeOPWQoCbzyP
         1RCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eWKC8EYtadWC+XGVduMfPXQkoMLfg/diQ6x5K2CsNlg=;
        b=jSeUAxgwWnsDWXMHLQIfUQvG7hB7N4MlFnTwYNKym00boe1d1lrCJScijvSFsZbmr8
         4uBBMP5fqyiBrfoDE1XiJKbo4KuWkomz/43GhA8XM1ajY8TJhUkcQorjUdb2U96JkRfL
         U+jw780hUlxsKhi3T4Y06zNywPKTbtO+VyuxOXcotdJLHtAHaWu7zHpQmQlY9Y7+UTBB
         dUgfKJixSIuVA4So48IXMSYugqmHWkcLpNhPHtlosj75dkHhMrKg2eh5ZAOpGETj28RO
         77OehJ1ooxqQcK28uEvAvUODdxAA4qUCBAZuiHT7Nx8mX5neX/rhYvmSlf0kke/gBAVG
         jWGQ==
X-Gm-Message-State: AOAM532ODeYQTrObCFkj9tR69c66w1d538aWVlHrlP9bAar3ddF+8fKb
	XMvRXWkLBrxkMLskC3eLNbA=
X-Google-Smtp-Source: ABdhPJxjqA9ClXlm0KoCtzlrvLlHrIyubx4WMVqLWfmViGIyO0vpqBgpOGAWcwFeEe9jLEl3SKTbmA==
X-Received: by 2002:a05:6402:190f:: with SMTP id e15mr17384039edz.195.1643569418088;
        Sun, 30 Jan 2022 11:03:38 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb5a.dynamic.kabel-deutschland.de. [95.90.187.90])
        by smtp.gmail.com with ESMTPSA id n3sm921124ejr.6.2022.01.30.11.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 11:03:37 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 05/12] staging: r8188eu: remove HW_VAR_AC_PARAM_VI
Date: Sun, 30 Jan 2022 20:03:14 +0100
Message-Id: <20220130190321.7172-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130190321.7172-1-straube.linux@gmail.com>
References: <20220130190321.7172-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove HW_VAR_AC_PARAM_VI from SetHwReg8188EU() and call
rtw_write32() directly.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_wlan_util.c | 2 +-
 drivers/staging/r8188eu/hal/usb_halinit.c    | 3 ---
 drivers/staging/r8188eu/include/hal_intf.h   | 1 -
 3 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index a09a4a5d7dc7..ac1ab5c6b169 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -562,7 +562,7 @@ void WMMOnAssocRsp(struct adapter *padapter)
 			edca[XMIT_BK_QUEUE] = acParm;
 			break;
 		case 0x2:
-			SetHwReg8188EU(padapter, HW_VAR_AC_PARAM_VI, (u8 *)(&acParm));
+			rtw_write32(padapter, REG_EDCA_VI_PARAM, acParm);
 			acm_mask |= (ACM ? BIT(2) : 0);
 			edca[XMIT_VI_QUEUE] = acParm;
 			break;
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 4af44f0d10c0..82dc0324fbab 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1342,9 +1342,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 			rtw_write32(Adapter, RWCAM, cmd);
 		}
 		break;
-	case HW_VAR_AC_PARAM_VI:
-		rtw_write32(Adapter, REG_EDCA_VI_PARAM, ((u32 *)(val))[0]);
-		break;
 	case HW_VAR_AC_PARAM_BE:
 		haldata->AcParam_BE = ((u32 *)(val))[0];
 		rtw_write32(Adapter, REG_EDCA_BE_PARAM, ((u32 *)(val))[0]);
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index c2df72e91701..03566f317513 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -31,7 +31,6 @@ enum hw_variables {
 	HW_VAR_CAM_EMPTY_ENTRY,
 	HW_VAR_CAM_WRITE,
 	HW_VAR_CAM_READ,
-	HW_VAR_AC_PARAM_VI,
 	HW_VAR_AC_PARAM_BE,
 	HW_VAR_AC_PARAM_BK,
 	HW_VAR_ACM_CTRL,
-- 
2.34.1


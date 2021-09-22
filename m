Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EF73FC9
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:05:46 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id d21so10283136wra.12
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zh1EhUp+ycwtcdOHHKSBFQNu3WOK1cxrbNQKyf+vALE=;
        b=buyLhCHcC5TiizRXCFyi8m4UgO8p5y/cWv3Ej7Kfsg0te5iEMVh8U5MtFyF+xKmKaF
         YCD9o6tNdpEJIPUUyFPjpaSpz957me08apgEJhTXi89Id9a420xeQ+5uscJO78dUk/PR
         hOef2ZM/ryQoof3LBf8E43Nze4JQclN0x0DyX3hwAp3FGRZp9NIFVmD0cQ0k9Ji/lxRJ
         HgCN2aXSHkV23/KKRqQw2yYoT98897lLPl7ONHFlODdvgb46OhrDx+zia7U1lZMqWed+
         ChHPqk5AejgibBhSNbga62Kyr/yQkHbpOpiIgQuVSXSLQpBl1ty7un+3JMJepZQO2Xt/
         lQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zh1EhUp+ycwtcdOHHKSBFQNu3WOK1cxrbNQKyf+vALE=;
        b=ckvJTuNwS8VYfxpz+6/LPhC6gozT+HuB63g6ytN0VVXNkUc006A9ea2KWlUGbRXLNg
         2g80QU9kt9M40vmTYJmuSSs6wpM+QFRxzXByKS+1FoYgir19ygmvfKK/ackQuD8Zm4G/
         frTns813wRnKbu2TG64WqsN8/amnEQOL2u4k/w+I4aqEt1VZ1pUtkWEQzr1wI9YynFLO
         w0vSETROoxRZ0qFvzHbKZrnSeXcOBPEwjHRuiX+G8YFSUFsb9VnYexMogr4ibcdGwHXZ
         hT9HVDjW0orFPmbiDt4dPVXUNpOFaA29AQx8ITIdU9w/PZQ79JXoubo+f1K+aE7kXxRu
         lrtg==
X-Gm-Message-State: AOAM532+PAmKNrJpU0qjgf07QI5VRHA5HkNGIUVP/k6G/ZtButqB9r4F
	p/XafHkefvNLLj2BAE3aXe8=
X-Google-Smtp-Source: ABdhPJy1/ABTBMiMCcSz98DxMbx61Ero9ZfOVemg6521R4LaOCkgqkRjtuxNB/Q2bhufqEQETA8oCA==
X-Received: by 2002:a7b:ce16:: with SMTP id m22mr874456wmc.172.1632341144831;
        Wed, 22 Sep 2021 13:05:44 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:05:44 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 20/47] staging: r8188eu: remove rtw_set_802_11_remove_wep()
Date: Wed, 22 Sep 2021 22:03:53 +0200
Message-Id: <20210922200420.9693-21-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922200420.9693-1-straube.linux@gmail.com>
References: <20210922200420.9693-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_set_802_11_remove_wep() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ioctl_set.c  | 25 -------------------
 .../staging/r8188eu/include/rtw_ioctl_set.h   |  1 -
 2 files changed, 26 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ioctl_set.c b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
index 219d579a853f..9b083829fffa 100644
--- a/drivers/staging/r8188eu/core/rtw_ioctl_set.c
+++ b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
@@ -467,31 +467,6 @@ u8 rtw_set_802_11_add_wep(struct adapter *padapter, struct ndis_802_11_wep *wep)
 	return ret;
 }
 
-u8 rtw_set_802_11_remove_wep(struct adapter *padapter, u32 keyindex)
-{
-	u8 ret = _SUCCESS;
-
-	if (keyindex >= 0x80000000 || !padapter) {
-		ret = false;
-		goto exit;
-	} else {
-		int res;
-		struct security_priv *psecuritypriv = &padapter->securitypriv;
-		if (keyindex < 4) {
-			memset(&psecuritypriv->dot11DefKey[keyindex], 0, 16);
-			res = rtw_set_key(padapter, psecuritypriv, keyindex, 0);
-			psecuritypriv->dot11DefKeylen[keyindex] = 0;
-			if (res == _FAIL)
-				ret = _FAIL;
-		} else {
-			ret = _FAIL;
-		}
-	}
-exit:
-
-	return ret;
-}
-
 /*
 * rtw_get_cur_max_rate -
 * @adapter: pointer to struct adapter structure
diff --git a/drivers/staging/r8188eu/include/rtw_ioctl_set.h b/drivers/staging/r8188eu/include/rtw_ioctl_set.h
index 6203f49f8bf7..5114d217a3d9 100644
--- a/drivers/staging/r8188eu/include/rtw_ioctl_set.h
+++ b/drivers/staging/r8188eu/include/rtw_ioctl_set.h
@@ -18,7 +18,6 @@ u8 rtw_set_802_11_bssid_list_scan(struct adapter*adapter,
 				  int ssid_max_num);
 u8 rtw_set_802_11_infrastructure_mode(struct adapter *adapter,
 				      enum ndis_802_11_network_infra type);
-u8 rtw_set_802_11_remove_wep(struct adapter *adapter, u32 keyindex);
 u8 rtw_set_802_11_ssid(struct adapter *adapt, struct ndis_802_11_ssid *ssid);
 u8 rtw_validate_ssid(struct ndis_802_11_ssid *ssid);
 u16 rtw_get_cur_max_rate(struct adapter *adapter);
-- 
2.33.0


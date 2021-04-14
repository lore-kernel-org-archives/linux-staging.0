Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3936D32
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:11:44 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id u17so32838352ejk.2
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QMJML+82xR+GJjag/s3bkG8ynndxU0FxEKtd3aOCd3E=;
        b=lSsY4A2MH4pdoclSpVKQ/156/UAqetGRQPFcErQvViKegAm4VdoYEo9blYFb9G/ikx
         6sem5KOcOQZnGp1Fw0PgyykozRrOyHmdewmNtmpsX+qKN6Fe/LPl9Kd5j7vynLSq+16X
         8in1H7lsrU2u9xWTpw2VLH3ZGya7N4Pj8zKqblLSAQtMxDsd59PIXbtGHSLkSDVywJgC
         h+bmwE9gGPXMefsokerloL3fAas5KOPwA2+fmHhsSnyZ+eVVrDeRkUX268AQH5ArAgos
         xG02fuOMiKGL+/67w+XSumdbNzBONEBVP+m5EvWrUaGIv8ybTJz4Ov5ue81GD6FbXO6Z
         R5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QMJML+82xR+GJjag/s3bkG8ynndxU0FxEKtd3aOCd3E=;
        b=KDxEr/DXc9puYYaX0DHbAgiEioXrhZx3gUXVg+to/KoImrNi6HQTY9GbPaTbx5RwmG
         8PSBWqgxC+n/aJ8J1xz6CrHs1eoiAdvfJOLIBR6tmwHD2TJkgPIChd9aWILocIcxPqbq
         BWwXjGVbUNk0arAqDHSt7Qy8/PBAyFiv6+oeCuux+GvuB7+pVtJ3oj1+zaxhjY8rCbE2
         CoLWHxCbu5nQgklnhe8v6g6H+8MY6A3LWmYYiSj+nVfxHKna8RXaT+V5eEv0pGBlBER+
         7+uqNzq9DmMrv5bVbRlAA1cbrLrwZJ5odAdTCT/rlYzBm7R+pxCjx0fAlmlC4JzIAgFJ
         DNvw==
X-Gm-Message-State: AOAM532dpL/ZqqcCwUrDcb+o4V3y2g/v5LZflaYpbDTTus+d/7nl5dt2
	CEw64A2KcGV2yo12RsEcLsQVCw==
X-Google-Smtp-Source: ABdhPJxQmvqiTvSCiERWkFe+9qBQ7DhMjV1gxqEeVN8RVWaxj6blE0Nw11hSz3z3hThqq85LxoEmsQ==
X-Received: by 2002:a17:906:86cd:: with SMTP id j13mr119879ejy.423.1618423903070;
        Wed, 14 Apr 2021 11:11:43 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:11:42 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH 08/57] staging: rtw_ioctl_set: Move 'channel_table' to the only place it's used
Date: Wed, 14 Apr 2021 19:10:40 +0100
Message-Id: <20210414181129.1628598-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 In file included from drivers/staging/rtl8188eu/include/drv_types.h:41,
 from drivers/staging/rtl8188eu/core/rtw_ap.c:12:
 drivers/staging/rtl8188eu/include/rtw_mlme_ext.h:177:3: warning: ‘channel_table’ defined but not used [-Wunused-const-variable=]
 In file included from drivers/staging/rtl8188eu/include/drv_types.h:41,
 from drivers/staging/rtl8188eu/core/rtw_cmd.c:10:
 drivers/staging/rtl8188eu/include/rtw_mlme_ext.h:177:3: warning: ‘channel_table’ defined but not used [-Wunused-const-variable=]
 In file included from drivers/staging/rtl8188eu/include/drv_types.h:41,
 from drivers/staging/rtl8188eu/include/rtw_debug.h:11,
 from drivers/staging/rtl8188eu/core/rtw_debug.c:9:
 drivers/staging/rtl8188eu/include/rtw_mlme_ext.h:177:3: warning: ‘channel_table’ defined but not used [-Wunused-const-variable=]
 In file included from drivers/staging/rtl8188eu/include/drv_types.h:41,
 from drivers/staging/rtl8188eu/core/rtw_efuse.c:10:
 drivers/staging/rtl8188eu/include/rtw_mlme_ext.h:177:3: warning: ‘channel_table’ defined but not used [-Wunused-const-variable=]
 In file included from drivers/staging/rtl8188eu/include/drv_types.h:41,

Cc: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8188eu/core/rtw_ioctl_set.c   | 8 ++++++++
 drivers/staging/rtl8188eu/include/rtw_mlme_ext.h | 8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c b/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c
index 1ef32ff900a98..c569001f6b839 100644
--- a/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c
@@ -13,6 +13,14 @@
 
 extern void indicate_wx_scan_complete_event(struct adapter *padapter);
 
+static const struct {
+	int channel_plan;
+	char *name;
+} channel_table[] = { { RT_CHANNEL_DOMAIN_FCC, "US" },
+	{ RT_CHANNEL_DOMAIN_ETSI, "EU" },
+	{ RT_CHANNEL_DOMAIN_MKK, "JP" },
+	{ RT_CHANNEL_DOMAIN_CHINA, "CN"} };
+
 u8 rtw_do_join(struct adapter *padapter)
 {
 	struct list_head *plist, *phead;
diff --git a/drivers/staging/rtl8188eu/include/rtw_mlme_ext.h b/drivers/staging/rtl8188eu/include/rtw_mlme_ext.h
index 77eb5e3ef172b..03d55eb7dc16b 100644
--- a/drivers/staging/rtl8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8188eu/include/rtw_mlme_ext.h
@@ -171,14 +171,6 @@ struct rt_channel_plan_map {
 	unsigned char	Index2G;
 };
 
-static const struct {
-	int channel_plan;
-	char *name;
-} channel_table[] = { { RT_CHANNEL_DOMAIN_FCC, "US" },
-	{ RT_CHANNEL_DOMAIN_ETSI, "EU" },
-	{ RT_CHANNEL_DOMAIN_MKK, "JP" },
-	{ RT_CHANNEL_DOMAIN_CHINA, "CN"} };
-
 enum Associated_AP {
 	atherosAP	= 0,
 	broadcomAP	= 1,
-- 
2.27.0


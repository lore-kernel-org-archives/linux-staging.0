Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900436D32
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:12:14 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id f8so24820370edd.11
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iNak7t2/n+TkEA5ScWfi9u14bmgi0YzUvL4SB6ShOqk=;
        b=JUEf2JXZhXFWK1RXS/hCZrNNUccxxZ//fO44dbDJFVxY9o0ErZX7Uo7LY8OHXSdklv
         iecZ+9D2JYe1T+n/QDw0kdiZh21+yKFmI8n7LXzwfyZnNOkHJGWVYFJJoKjrKNDwNX+Q
         yXRx/EkCqOGnXGB9CRGjJv5tIu8H0knQTCtHuRjFvtzf8xZZSOkFyH9YU7AswlP0mPWb
         ZSvxJGF7WDRPlkoNe2TaMut4hvyj53wPVLitT6mHcT5pTY8/CAGwqRJrG4lgphZ2awO0
         p/gHMPwsBSKiU2NCG1IbcsKe/WOAYd5QZ+3ud/R29N9ReisAr/90fTzZDuPwXKnQwnpN
         cwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iNak7t2/n+TkEA5ScWfi9u14bmgi0YzUvL4SB6ShOqk=;
        b=YwDJeAww3vWC5a/+13B84YzPkjFsA1bhjVb6qJoUGYAOKwpjxG0mowiFNIKTyuazYO
         QR8kb0sjNnDgOKqG5aa//okXDzXuMT7VSvYCBqOEv9mXsuQLANkkrpA2svzixpjKS7jD
         5zCEqoxSzX3T9G7zjJeLXeuZcCjXWejuniVo21Zy0qSrxzCIhUzmp40HZDsu9VK6Bv9m
         OZH4M2fmC+oPeKGnKY1wIrmPyGbQNz35wjgnnY6QUPUSDk/teh6v5Yfijxfr1WGaUQnd
         3TS1iC4Gc0bUgd58KrNtIJYfNNqx9MjrMFdXtNd7UC7eUjYzMToOTmXE48blpLU1/xwZ
         ufiQ==
X-Gm-Message-State: AOAM533qkrf6cHc4ILeYQTTaZMOOVfPmXaP1j5dWaxZv4h8HiE+ZDB73
	9CnaX7c5Tzg30bENsbnzWyOYXg==
X-Google-Smtp-Source: ABdhPJwE6JC+3zsVayk+aJpMjJ+Xs7MV0cgpI7XuQithc6M4jw3zMkHsBuGwunnYXL4WqJq3IdlrjA==
X-Received: by 2002:a05:6402:350f:: with SMTP id b15mr221007edd.6.1618423933136;
        Wed, 14 Apr 2021 11:12:13 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:12:12 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH 37/57] staging: rtl8188eu: os_dep: ioctl_linux: Move 2 large data buffers into the heap
Date: Wed, 14 Apr 2021 19:11:09 +0100
Message-Id: <20210414181129.1628598-38-lee.jones@linaro.org>
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

 drivers/staging/rtl8188eu/os_dep/ioctl_linux.c: In function ‘translate_scan’:
 drivers/staging/rtl8188eu/os_dep/ioctl_linux.c:310:1: warning: the frame size of 1064 bytes is larger than 1024 bytes [-Wframe-larger-than=]
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c: In function ‘rtw_wx_set_mlme’:
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:1128:6: warning: variable ‘reason’ set but not used [-Wunused-but-set-variable]
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c: In function ‘rtw_dbg_port’:
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:2548:33: warning: variable ‘preorder_ctrl’ set but not used [-Wunused-but-set-variable]
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:2573:33: warning: variable ‘preorder_ctrl’ set but not used [-Wunused-but-set-variable]
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:36:27: warning: ‘iw_operation_mode’ defined but not used [-Wunused-const-variable=]

Cc: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8188eu/os_dep/ioctl_linux.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c b/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
index c95ae4d6a3b6b..cc14f00947781 100644
--- a/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
@@ -224,7 +224,7 @@ static char *translate_scan(struct adapter *padapter,
 	/* parsing WPA/WPA2 IE */
 	{
 		u8 *buf;
-		u8 wpa_ie[255], rsn_ie[255];
+		u8 *wpa_ie, *rsn_ie;
 		u16 wpa_len = 0, rsn_len = 0;
 		u8 *p;
 
@@ -232,6 +232,14 @@ static char *translate_scan(struct adapter *padapter,
 		if (!buf)
 			return start;
 
+		wpa_ie = kzalloc(255, GFP_ATOMIC);
+		if (!wpa_ie)
+			return start;
+
+		rsn_ie = kzalloc(255, GFP_ATOMIC);
+		if (!rsn_ie)
+			return start;
+
 		rtw_get_sec_ie(pnetwork->network.ies, pnetwork->network.ie_length, rsn_ie, &rsn_len, wpa_ie, &wpa_len);
 		RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("rtw_wx_get_scan: ssid =%s\n", pnetwork->network.ssid.ssid));
 		RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("rtw_wx_get_scan: wpa_len =%d rsn_len =%d\n", wpa_len, rsn_len));
@@ -268,6 +276,8 @@ static char *translate_scan(struct adapter *padapter,
 			start = iwe_stream_add_point(info, start, stop, &iwe, rsn_ie);
 		}
 		kfree(buf);
+		kfree(wpa_ie);
+		kfree(rsn_ie);
 	}
 
 	{/* parsing WPS IE */
-- 
2.27.0


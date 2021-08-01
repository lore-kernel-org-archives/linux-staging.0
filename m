Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFE23489
	for <linux-staging@lists.linux.dev>; Sun,  1 Aug 2021 19:04:48 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id k4so7972497wrc.0
        for <linux-staging@lists.linux.dev>; Sun, 01 Aug 2021 12:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uyvuVBVuXkJQQgpwzFWDdtDXAB5I90GortRYzoxqYpk=;
        b=U+OulQ3miDkLlo5Oc4L4J3afXW1pkimUIL54IUOnL/WQ15mWq11UENprTR4FPTQ7La
         IiALDWANOxBv0/9t/aVM+Uw8YaykGMVNHNi0f8NoNrKXu57psWEHwp7xh0fYEzAGJ8Cp
         LNpzify46qrOJrG75YiR+tWXrj/xB6ccKYqCO50RhdQGftTVGcX77qls3NuAsxqHLtk0
         rx0TBBpfv+h8Y7+g7u/ZQa9PnutR+97ZhdWr85OXskbxjVeVbkyXCk1vE4SueLizMxMa
         P98pX71CRtpDaXE26Qvn9edqQbOFtfwldfFxrd23qpqXCg3nePoaU6Xohx533/0Z7ve3
         4hwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uyvuVBVuXkJQQgpwzFWDdtDXAB5I90GortRYzoxqYpk=;
        b=TVrR7OdKOGa2keYTjiEl5MTTrM46cyPtEDV410m7irlEuomIZljiowQsdEN1FDO+Ak
         H+3h5sz1xoiRj4l9i5nkGEtgf3TLnPgadfy+fLo60TcCSArOQER+SdeR9XeqnHCXjIYC
         r9ew+sz71iUEiTa4kiVEvLqxxed3ec44BHzbktJXPFQBcVOe2HRAcEV6xj0Rh9LyXYT0
         2TfscmpeQcl5qdm3oKPZogPMT0EB5p44F4T9oef7hGFam2YeKK5wBiVie5zvEktIFp7M
         TEshX1J4FsnLsOJ8o8gcZhK94VXR5hZBxEtsUuOBWvGNxSTsqEaKJORh/nc76IsLuC6s
         /mig==
X-Gm-Message-State: AOAM5318w2m5zaEM/M7k5ahUOHXf1znfKvyD7P+IcNZ4cKgeBVpuKIAD
	ORM2kfUCjhflqAj7Ae8PK/AZxA==
X-Google-Smtp-Source: ABdhPJzrVnaRlLRfvI0XmD3YddJ1Bw1c3MEoPtpbeUi10bgNHZZzKmYER6Eo0Bb42H2+BBqnTFO05w==
X-Received: by 2002:a5d:64c2:: with SMTP id f2mr5028211wri.128.1627844686730;
        Sun, 01 Aug 2021 12:04:46 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id c10sm8196026wmb.40.2021.08.01.12.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 12:04:46 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	martin@kaiser.cx
Subject: [PATCH 09/15] staging: r8188eu: remove RT_TRACE calls from core/rtw_mp.c
Date: Sun,  1 Aug 2021 20:04:31 +0100
Message-Id: <20210801190437.82017-10-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210801190437.82017-1-phil@philpotter.co.uk>
References: <20210801190437.82017-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove RT_TRACE macro calls from core/rtw_mp.c, so that ultimately the
macro definition itself can eventually be removed.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_mp.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mp.c b/drivers/staging/r8188eu/core/rtw_mp.c
index 1b4e9bbc394b..a2d08c724a07 100644
--- a/drivers/staging/r8188eu/core/rtw_mp.c
+++ b/drivers/staging/r8188eu/core/rtw_mp.c
@@ -383,7 +383,6 @@ s32 mp_start_test(struct adapter *padapter)
 
 	psta = rtw_alloc_stainfo(&padapter->stapriv, bssid.MacAddress);
 	if (psta == NULL) {
-		RT_TRACE(_module_mp_, _drv_err_, ("mp_start_test: Can't alloc sta_info!\n"));
 		pmlmepriv->fw_state = pmppriv->prev_fw_state;
 		res = _FAIL;
 		goto end_of_mp_start_test;
@@ -864,15 +863,11 @@ u32 mp_query_psd(struct adapter *pAdapter, u8 *data)
 	u32 i, psd_pts = 0, psd_start = 0, psd_stop = 0;
 	u32 psd_data = 0;
 
-	if (!netif_running(pAdapter->pnetdev)) {
-		RT_TRACE(_module_mp_, _drv_warning_, ("mp_query_psd: Fail! interface not opened!\n"));
+	if (!netif_running(pAdapter->pnetdev))
 		return 0;
-	}
 
-	if (check_fwstate(&pAdapter->mlmepriv, WIFI_MP_STATE) == false) {
-		RT_TRACE(_module_mp_, _drv_warning_, ("mp_query_psd: Fail! not in MP mode!\n"));
+	if (check_fwstate(&pAdapter->mlmepriv, WIFI_MP_STATE) == false)
 		return 0;
-	}
 
 	if (strlen(data) == 0) { /* default value */
 		psd_pts = 128;
@@ -939,7 +934,6 @@ void _rtw_mp_xmit_priv(struct xmit_priv *pxmitpriv)
 	pxmitpriv->pallocated_xmit_extbuf = rtw_zvmalloc(num_xmit_extbuf * sizeof(struct xmit_buf) + 4);
 
 	if (pxmitpriv->pallocated_xmit_extbuf  == NULL) {
-		RT_TRACE(_module_rtl871x_xmit_c_, _drv_err_, ("alloc xmit_extbuf fail!\n"));
 		res = _FAIL;
 		goto exit;
 	}
-- 
2.31.1


Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F5C70
	for <linux-staging@lists.linux.dev>; Fri,  6 Aug 2021 00:40:43 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id b128so4475975wmb.4
        for <linux-staging@lists.linux.dev>; Thu, 05 Aug 2021 17:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PegLaMgCLA483OQ2FYUTnGJ/mPU5ZJS0l25ewYVKbj4=;
        b=Awaib9DcinCrQKCVOepFxC2mmtq/IgBYQ8T3WLZpHfc8BIsWYeIR8H3W0VBsy0Dxeu
         66UEYxaGF5pznr0IANSEBgtIZZrMlSNuHDlHPll+tMuU87QqBWdl3oT5c3YZNlwGXSSu
         XCZufKIBQKuEc2id/5E2zj3qTmomOYKQVFeD9x2btmJEOd0aZKfrgoOpuIDDiKW47lT4
         ifD2x1rQG7oOXkjzhsf3u41epY/KpaPpoPNFomU0l5yu1vnn0vNO2bn4tpbTIvXFSh5R
         ckPhru9LEA0+Kuum1DzlwpuLnsg75X/LEwa92SbMyjn7xnWQ+AElm3LLtxvpzA5ynZyd
         VsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PegLaMgCLA483OQ2FYUTnGJ/mPU5ZJS0l25ewYVKbj4=;
        b=a2t0egidCJPxZRzcKlRp7OmgjLUoS4/r7nFbKmnfmEtn18z3yfucwVYupsIJ+/DjIr
         09UfBK9/O3MusEKQoey+6+3AJxDCkUs5ggvGDfkXVlCvsbwthWlaW2zusZtRxyzrf82Y
         k2MMILk6MnpVLb6FU3znMMLsR8VpAU7qgaA9lt67fq8jv65+9dX5L7CeLfsGgsSuIDgV
         XFhbb4ZMDTgWt/8vz2r+mU2jq/bsdFRN76KaHdGcFSLX/xDlvipIdpP/ky576q3DHYD2
         ML1DN0QBrQJ9obXjhTBqpmjS2ovXJmlaMS4aD8qK2kb1HE7o/4If2IvLRIS94EPtt/ck
         6WsA==
X-Gm-Message-State: AOAM533xuJ80NQ3xtoHOaNjTdYvCIcMQ5V6cGfZ95EJMcFOUYgAYWW96
	zCDhDzzj1sP8jp1vivD7BOovdA==
X-Google-Smtp-Source: ABdhPJwATpORKozWI1nEbiquAzAXagM8kLVSvuKtQRuon+UZMiVwXN95KYzdpeUiWH25NSQ5O+tNyQ==
X-Received: by 2002:a7b:cc14:: with SMTP id f20mr8645502wmh.38.1628210441990;
        Thu, 05 Aug 2021 17:40:41 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id y19sm10727181wmq.5.2021.08.05.17.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 17:40:41 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	martin@kaiser.cx
Subject: [PATCH v2 05/11] staging: r8188eu: remove RT_TRACE calls from core/rtw_mp.c
Date: Fri,  6 Aug 2021 01:40:28 +0100
Message-Id: <20210806004034.82233-6-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210806004034.82233-1-phil@philpotter.co.uk>
References: <20210806004034.82233-1-phil@philpotter.co.uk>
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
 drivers/staging/r8188eu/core/rtw_mp.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mp.c b/drivers/staging/r8188eu/core/rtw_mp.c
index 252d5c37d813..def0c250a4ac 100644
--- a/drivers/staging/r8188eu/core/rtw_mp.c
+++ b/drivers/staging/r8188eu/core/rtw_mp.c
@@ -383,7 +383,6 @@ s32 mp_start_test(struct adapter *padapter)
 
 	psta = rtw_alloc_stainfo(&padapter->stapriv, bssid.MacAddress);
 	if (!psta) {
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
@@ -938,7 +933,6 @@ void _rtw_mp_xmit_priv(struct xmit_priv *pxmitpriv)
 	pxmitpriv->pallocated_xmit_extbuf = rtw_zvmalloc(num_xmit_extbuf * sizeof(struct xmit_buf) + 4);
 
 	if (!pxmitpriv->pallocated_xmit_extbuf) {
-		RT_TRACE(_module_rtl871x_xmit_c_, _drv_err_, ("alloc xmit_extbuf fail!\n"));
 		res = _FAIL;
 		goto exit;
 	}
@@ -972,8 +966,6 @@ void _rtw_mp_xmit_priv(struct xmit_priv *pxmitpriv)
 
 void Hal_ProSetCrystalCap (struct adapter *pAdapter, u32 CrystalCapVal)
 {
-	struct hal_data_8188e	*pHalData = GET_HAL_DATA(pAdapter);
-
 	CrystalCapVal = CrystalCapVal & 0x3F;
 
 	// write 0x24[16:11] = 0x24[22:17] = CrystalCap
-- 
2.31.1


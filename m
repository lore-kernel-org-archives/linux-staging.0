Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603113FC2
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 23:45:48 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id o39-20020a05600c512700b002e74638b567so8248971wms.2
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 16:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QdXktGij0krfVmBgcI/UvjythaqTzQZ5d49NfhWpr64=;
        b=oYsyrjlMGQZIfnLRtTj6TGkS5D0uy7xfmKz2dJ3uj3vpiD5g3FPPgL/e2FMrVVRWzN
         MCwsNUJCx2js+Xe81DXGfa0tS/IeT0wPq2VHt2qqnDPeoS4GcU2eKaTdUN0hxXxTtgU2
         hm6nVLSCuTLQoBaYnG5ya5JvpVPl+b9/b5YsCQazP7CCMGswVplq5GBCTrvAC3r1F7bY
         DlNKOap20UgGNlHL9BpIlQl0uQdBw0bRlYhBO6pOl7JYm9XJnhzmPt2HkSUkIRTmOpAE
         Et3U8TwKfZe1+fKtsSTWN1kEmrugrEBK2ev0y+aLbOBgKA2PKYU4t+t3tbV4FgW8cw5J
         wo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QdXktGij0krfVmBgcI/UvjythaqTzQZ5d49NfhWpr64=;
        b=ZJoQrh7NVB/GYEIEUXDzP1tR68Wq9IZWJKoCcwze+W+p6oJh6o9DUlhiVqHQ1OyJ76
         pBiH61/pI0TIvDKuRv0OYbURqq6q2BDtYkf7q3/bLmVqZlJR3/qQhsWnhsiUw/Ux4p31
         nGCX9reJ7JVEZf4JxfCEQV8d9e9CkXePztjUxOfpLrZY4qxFx5r1IxdNoec8x3LMK243
         7Y1BNykD0LdDM6E8oWbXUC0EqhKw9gbMlab74U1ujfvkdeu90hKRtZKVH6myeGCYV4cP
         H4E2Za+UIVFJEdQzHt7BJ0828wAqVIvTKKD6qn+qMizEK7wJoW/nYquev+47/EsQniNf
         Vwlg==
X-Gm-Message-State: AOAM532Ga/l+IusRUUdl75IYJ06CE9GiBfbwUBbu+Fgu9a7N/LizqSyw
	LMul9JIReBdEruE2W49MJsa56g==
X-Google-Smtp-Source: ABdhPJz4szFLTe5DEj4HsWg0zguAIf1hsHwL43L9VrLFqJv8/+TJixA6Am4DgxvmZYFmsGTtdtGT1Q==
X-Received: by 2002:a05:600c:414f:: with SMTP id h15mr5308113wmm.124.1630280746794;
        Sun, 29 Aug 2021 16:45:46 -0700 (PDT)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id r25sm14500574wra.12.2021.08.29.16.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 16:45:46 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	fmdefrancesco@gmail.com,
	Larry.Finger@lwfinger.net,
	paskripkin@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] staging: r8188eu: remove rtw_hal_c2h_handler function
Date: Mon, 30 Aug 2021 00:45:41 +0100
Message-Id: <20210829234541.946-4-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210829234541.946-1-phil@philpotter.co.uk>
References: <20210829234541.946-1-phil@philpotter.co.uk>
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

Acked-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Acked-by: Michael Straube <straube.linux@gmail.com>
Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---

V2: Same as V1, reissued as part of series for clarity.

---
 drivers/staging/r8188eu/core/rtw_cmd.c     | 2 --
 drivers/staging/r8188eu/hal/hal_intf.c     | 5 -----
 drivers/staging/r8188eu/include/hal_intf.h | 2 --
 3 files changed, 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 14b74f92cd0f..fee4208dacba 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -1896,8 +1896,6 @@ static void c2h_wk_callback(struct work_struct *work)
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


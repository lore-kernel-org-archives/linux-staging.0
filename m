Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E9F4C88
	for <linux-staging@lists.linux.dev>; Tue,  8 Mar 2022 20:56:39 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id n2so197441plf.4
        for <linux-staging@lists.linux.dev>; Tue, 08 Mar 2022 12:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8S8Qc5du8q8iXMWiizollg+y08pSQtHFMISLIZOfmxc=;
        b=VPn6oa8gpFPLYzoFh6lAN+Q0LDFSvXnFJLDHEdn24xbm3GWzY6nSpFNCkr0/2+r7FL
         1uhF9J6esX5X0oXfvW4I5l9XXVivOPcu5aKFtAdZ5B8TprMil8oTxWbd8ZSnE5Rg/+5p
         vdPtGVWt6c1ZwpOM4tCsilm4f8PsaTmue19y08QuSZF+YmB7BUqWGDGgl/L7wSVvRiGA
         WkMFiaJGzPYQ/l4UrsVg7KSMK9lQ/pLTDid2Kw4nRCHFgbw9Hxb9y7DiY+H1+bbwVFRZ
         9/HVtGHsal5+1RezHWUgPmHLJ+ZMDhN1SxMVhCmvHvyCWZLnQEOpdO0alEMYmuMj14dP
         IPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8S8Qc5du8q8iXMWiizollg+y08pSQtHFMISLIZOfmxc=;
        b=eb3tExA4BsWeGmyXS7MMtmv2QLKZBG940kCBJ2gIaZtH0IyiWG0ZHoINI/BLBX2Ke6
         QVVFsC9QRx2rV86cFDsWPsrIr9TzRjrLwUqkZ1kCoOaxXwydeJrDFUuL0TBeDWMgB/Da
         cQFecZE+cT7UhjL4sQLztuncV6CbRG6w+tvxPVUagf19RQLeSxSfGxk1NzdArhXSa1XB
         3kGR9xoNP3DzxdfYIgWzxqINiWMJztG+W6XyQozt1zmT3FpzH3yqScUlEE3YODIJri1N
         Lmp4uUKnH6ubY2iQWARWTBiHc55yB7BbVpGS9RplRm6bT/sf3SaBobQUgzUwTuN/Ef2N
         UiMA==
X-Gm-Message-State: AOAM531BU/H+u4mJWTDauBMr1gvnRg8Q3Qi3Sd46T93Zlqp4wdj1zEQE
	6H3GSk0btAwP0T3Vr29kqxs=
X-Google-Smtp-Source: ABdhPJxTU+k8VbUnz5FYJtFfhaPn5ce7zc55gBOelRp6kTIdZdSvcy4Ex9fCg73Wm4h/VFOmMUuhSA==
X-Received: by 2002:a17:90b:3807:b0:1bf:6c8e:f9d1 with SMTP id mq7-20020a17090b380700b001bf6c8ef9d1mr6651514pjb.186.1646772998682;
        Tue, 08 Mar 2022 12:56:38 -0800 (PST)
Received: from localhost.localdomain ([103.85.9.4])
        by smtp.gmail.com with ESMTPSA id u10-20020a056a00124a00b004f741eb11d0sm1252661pfi.149.2022.03.08.12.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 12:56:38 -0800 (PST)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 2/2] staging: r8188eu: proper error handling in rtw_init_drv_sw
Date: Wed,  9 Mar 2022 02:25:10 +0530
Message-Id: <20220308205510.48431-3-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220308205510.48431-1-makvihas@gmail.com>
References: <20220308205510.48431-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code inside rtw_init_drv_sw() calls various init functions to
populate the padapter structure and checks for their return values
respectively.
But if one of the functions in middle fails then it simply returns 
_FAIL instead of proper logging and calling freeing counterparts
of previous init functions.
This leads to various memory leaks and can be found in 
/sys/kernel/debug/kmemleak if kernel is compiled with DEBUG_KMEMLEAK=y.

Fix this and keep the success and error separate.


Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
Tested on Comfast CF-WU810N RTL8188EUS wireless adapter.
This patch depends on "[PATCH 1/2] staging: r8188eu: call _cancel_timer_ex from
 _rtw_free_recv_priv"
---
 drivers/staging/r8188eu/os_dep/os_intfs.c | 60 ++++++++++++++++++-----
 1 file changed, 47 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 197568422..6279bba07 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -469,32 +469,46 @@ u8 rtw_reset_drv_sw(struct adapter *padapter)
 
 u8 rtw_init_drv_sw(struct adapter *padapter)
 {
-	if ((rtw_init_cmd_priv(&padapter->cmdpriv)) == _FAIL)
+	if ((rtw_init_cmd_priv(&padapter->cmdpriv)) == _FAIL) {
+		pr_err("rtw_init_cmd_priv failed\n");
 		return _FAIL;
+	}
 
 	padapter->cmdpriv.padapter = padapter;
 
-	if ((rtw_init_evt_priv(&padapter->evtpriv)) == _FAIL)
-		return _FAIL;
+	if ((rtw_init_evt_priv(&padapter->evtpriv)) == _FAIL) {
+		pr_err("rtw_init_evt_priv failed\n");
+		goto free_cmd_priv;
+	}
 
-	if (rtw_init_mlme_priv(padapter) == _FAIL)
-		return _FAIL;
+	if (rtw_init_mlme_priv(padapter) == _FAIL) {
+		pr_err("rtw_init_mlme_priv failed\n");
+		goto free_evt_priv;
+	}
 
 	rtw_init_wifidirect_timers(padapter);
 	init_wifidirect_info(padapter, P2P_ROLE_DISABLE);
 	reset_global_wifidirect_info(padapter);
 
-	if (init_mlme_ext_priv(padapter) == _FAIL)
-		return _FAIL;
+	if (init_mlme_ext_priv(padapter) == _FAIL) {
+		pr_err("init_mlme_ext_priv failed\n");
+		goto free_mlme_priv;
+	}
 
-	if (_rtw_init_xmit_priv(&padapter->xmitpriv, padapter) == _FAIL)
-		return _FAIL;
+	if (_rtw_init_xmit_priv(&padapter->xmitpriv, padapter) == _FAIL) {
+		pr_err("_rtw_init_xmit_priv failed\n");
+		goto free_mlme_ext;
+	}
 
-	if (_rtw_init_recv_priv(&padapter->recvpriv, padapter) == _FAIL)
-		return _FAIL;
+	if (_rtw_init_recv_priv(&padapter->recvpriv, padapter) == _FAIL) {
+		pr_err("_rtw_init_recv_priv failed\n");
+		goto free_xmit_priv;
+	}
 
-	if (_rtw_init_sta_priv(&padapter->stapriv) == _FAIL)
-		return _FAIL;
+	if (_rtw_init_sta_priv(&padapter->stapriv) == _FAIL) {
+		pr_err("_rtw_init_sta_priv failed\n");
+		goto free_recv_priv;
+	}
 
 	padapter->stapriv.padapter = padapter;
 
@@ -510,6 +524,26 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
 	spin_lock_init(&padapter->br_ext_lock);
 
 	return _SUCCESS;
+
+free_recv_priv:
+	_rtw_free_recv_priv(&padapter->recvpriv);
+
+free_xmit_priv:
+	_rtw_free_xmit_priv(&padapter->xmitpriv);
+
+free_mlme_ext:
+	free_mlme_ext_priv(&padapter->mlmeextpriv);
+
+free_mlme_priv:
+	rtw_free_mlme_priv(&padapter->mlmepriv);
+
+free_evt_priv:
+	rtw_free_evt_priv(&padapter->evtpriv);
+
+free_cmd_priv:
+	rtw_free_cmd_priv(&padapter->cmdpriv);
+
+	return _FAIL;
 }
 
 void rtw_cancel_all_timer(struct adapter *padapter)
-- 
2.30.2


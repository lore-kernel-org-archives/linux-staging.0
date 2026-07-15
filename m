Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEED480959
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119846; cv=none; b=ut2Ebs+HGmOZ/Sb+qhCQTmRrS13Chnvlg437qCM9ce3O5c2Nv5i3QB15cuwWRUWqkRZaucYWg7nQlt3xlGiOiB13eDEA3iV2H15UDlwKg23BUgQaSADtK+LeuQZrv/EEo/Fcls4K6EL7LRlU6dyuQ5A+eoToqtETkjBtJLNcKbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119846; c=relaxed/simple;
	bh=WWVrQEGBR/w9v0EI6kme+tNtURJsD6oKvV59TvhbnAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GI8CMb8rLcY0J0pzYbrYJxIiiF7lKHjqMC/NjIx9/Df8rZC+0PcjVtX0U2zHeIFSd4/rFSGxtIr6e52IoRWkOKBucz5+T8aAG5ObVytpWEBjyat5P664WDRnpVoM2JCO+1UVRO1hRa//m+OXGwPEwey0enTqRJ+vsDi3iHVVJzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QVYXD0oJ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QVYXD0oJ"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aeba09900bso1548360e87.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119840; x=1784724640; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FtlASsqkw0C4v5Z/7LIib8Kc0TPvk4rZzD6C198Kz1k=;
        b=QVYXD0oJyC3Cfiik4r7eSmObOQVEsAmuPeGXNPtY2/9yQNAovoI+1F/fzK84HzdHkh
         cexT78EGY7SOMqyejScOAFROFWCjQOEVWUHVCyEBJSCTXa3OvUm/J52XKF1PFk1dk5oV
         SVx7MPDSSVpy4vWT6RDkGbcKhxnRGayQp3D0k9xlI/w/oc/4UvEt6UwRUpztbLzfEafZ
         RqBKFfetAlkIZClah2Ucd4EeX4XDbXoHcST6h0KmlhGZr5ReDMtJ8b93lob5WVivANUK
         7j5Eg9QCqpyHvNijvsmNvWDpy3E5G+PaF6lx/Ae9+rOeaAwvtbNcj57Kb0zKg4vT5NWB
         zHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119840; x=1784724640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FtlASsqkw0C4v5Z/7LIib8Kc0TPvk4rZzD6C198Kz1k=;
        b=RN20hjpDGPq0W3E7FllAA0+1lx3ApOfYxB+91fYq3DDyZIc6cSOi6vr3OCt/O8dYK7
         OtzH0LT4LABocxv+eLaPr5RQYEQvzZPzIAoCPVTyuvL6T6UqHl97wHAk8xF73ookkOo2
         CAFOcxfggJdTi5bqiJ3WkIlrF4XQjhT62j0HpVJq0v9SX5vmBY3hBqqNDiCO7HZfUyhK
         2hhGFrJ849xv18HtDTlDN6pyey7S/iJullPLV9QojkOA9lB44/cicazRrbknZhdcHmx+
         phi929n8t/vJ6CCTAjEyG+qwutarcLffENP11sI23D37XpL9+HCVx6k2y6RqzwAvnPPT
         uHGA==
X-Gm-Message-State: AOJu0YzMnsuiCL4J4U8tFXeuLq41H5PDmVSq/KoX5ghYF5kp3vxKMUWr
	uDOYc0hbIvqoh64ntcK6HnzvwcQkTMQYhKFZYpLxANlXtYI4MzODqMh/
X-Gm-Gg: AfdE7clnRWPcT4BlrIvd3QUeEFJQ2VokiBdM6WVf2FlXJmp8VI7KIzF75jVtRNLRDaN
	A3amORR3hYr/zrQSJw/tGpR3Sy/kdlCwkQ+2WFaBmYP9UDjWlu3JAXi4vmmtpBSFE5SCC6nswBp
	/vYxzZelyB5EoV9khzXEiSsMewqsEg77mg9hK5MAfkv46y6o93JynKpTONbpTc1FjirR7+03/+g
	ijYQtkqfpT4CX3DO+ubrGuUWJfEbDyLmhl7JbW/xGNluTUWwk0qgRSLal9sKfVy9Smc1CdKifut
	tV0AL/MttgEBgpeCIzOqC+XyfI30Xj5gBum7VGV16iX93CKJUCkbBUVYzhQmeon5VM3yr6H5uG2
	cUuoMNogVGEsJOP80/8RqVCmOrLYE5wsBnh1sN1NIRpMr4kfC/jV7c2vlqlpNxnFkagGPO8HJtO
	eDmMkW3U9NB2XEcwagAMiN/wbFXLLuruCiKBmblIktenQAiDAMo32hAF5foocrxoA24tiqv8zIR
	CSAqvGrB4AoJA==
X-Received: by 2002:a05:6512:3c88:b0:5ae:b7ca:33ec with SMTP id 2adb3069b0e04-5b0235613f8mr3811386e87.9.1784119840071;
        Wed, 15 Jul 2026 05:50:40 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:39 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 31/61] staging: rtl8723bs: replace rtw_sctx_done with direct status call
Date: Wed, 15 Jul 2026 19:47:59 +0700
Message-ID: <20260715124829.90290-32-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the redundant rtw_sctx_done() wrapper function from rtw_xmit.c
and replace its call sites with direct calls to rtw_sctx_done_err().

The helper provides no extra logic, serving only to pass the fixed
RTW_SCTX_DONE_SUCCESS status code to the underlying error-handling
function. Removing it simplifies the transmit context interface and
reduces call overhead.

Clean up the function definition, remove its prototype from the header
file, and update all invocations across the driver.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c     | 2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c    | 4 ----
 drivers/staging/rtl8723bs/include/rtw_xmit.h | 1 -
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index c8bdd0f3c..01f8b378e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -463,7 +463,7 @@ int rtw_cmd_thread(void *context)
 					   FUNC_ADPT_ARG(pcmd->padapter));
 
 				if (pcmd->res == H2C_SUCCESS)
-					rtw_sctx_done(&pcmd->sctx);
+					rtw_sctx_done_err(&pcmd->sctx, RTW_SCTX_DONE_SUCCESS);
 				else
 					rtw_sctx_done_err(&pcmd->sctx, RTW_SCTX_DONE_CMD_ERROR);
 			}
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index fdda407c1..9a525be74 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -2565,10 +2565,6 @@ void rtw_sctx_done_err(struct submit_ctx **sctx, int status)
 	}
 }
 
-void rtw_sctx_done(struct submit_ctx **sctx)
-{
-	rtw_sctx_done_err(sctx, RTW_SCTX_DONE_SUCCESS);
-}
 
 int rtw_ack_tx_wait(struct xmit_priv *pxmitpriv, u32 timeout_ms)
 {
diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index f67cb22e3..f85a03efe 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -212,7 +212,6 @@ enum {
 void rtw_sctx_init(struct submit_ctx *sctx, int timeout_ms);
 int rtw_sctx_wait(struct submit_ctx *sctx);
 void rtw_sctx_done_err(struct submit_ctx **sctx, int status);
-void rtw_sctx_done(struct submit_ctx **sctx);
 
 struct xmit_buf {
 	struct list_head	list;
-- 
2.55.0


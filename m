Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC73B165F16
	for <linux-staging@lists.linux.dev>; Sat,  5 Oct 2024 20:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728160493; cv=none; b=TuILuxb/fIgqLUSKTmCtPhatlAETmNK2pb3NKssRUcZnCogzKzFDk3uhXpRxGuFm2cyAp0blUoLVJQ7XcbYRSYGAL5Liy1T0X2Y2ggUQPEYienuh0PYXoC8RW7mb1eFG7UrmAI/otxZRuLCm4izipp8G2VeU3INGyq+yFPoJzKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728160493; c=relaxed/simple;
	bh=TpQGa5ra8SvXLVOyzl0JFjYveChuJ/zm53KUwg/ByIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MUp2TF/OaNY8I9XxHJ7a6RVUvOe8SCwFR/ZEvKDnlA6YC+UAvcXqcHo72MRfxhw233+ULdfM73OUlcRVRJk9i8IjdzzkYXU52NJlwqV7JCuWhd/oogNj7hCsSFLVzbfDUyxVqGgf0s62gmWRcVR7mPduyfKY8lKNm82CHkB8rJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKeYVP3j; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKeYVP3j"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42e5e758093so26743375e9.1
        for <linux-staging@lists.linux.dev>; Sat, 05 Oct 2024 13:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728160490; x=1728765290; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTJ6ZMxD1+jB403ZdV13gEam1qNwb5U1WYSGSXkZ//o=;
        b=AKeYVP3jWaC4NnfE8IE2U2IqCVNqfmrDJurMb1K5g9rnUEd5E7HXpen6Eh0AC/CxAk
         rTLwpfeKogyYgndAzhXSYFupUEAG6hNkGkgR5je05PMRjdpHeIt4yYkMxM96JG83wfS6
         Wjfdyberuj/F5hfFM9HEv95oqPtYBKzrLtZzxYOONFgSCUyRAM4UYErtAa6Y+vQVSWpX
         5NtAFM4mEYDPaZK2crmOxLylLx5NsiEU3xrEwhzZxL41yV6LZu+E+OvCP9C16c6hr72h
         Xy5/iWtkQcQ60hjYkCKo0Qq8yasPpFup8elBU2L9cCOi3fT6UmapLs6HtxMM7+MRXnTK
         0yvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728160490; x=1728765290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NTJ6ZMxD1+jB403ZdV13gEam1qNwb5U1WYSGSXkZ//o=;
        b=F+xOsTsgiPrdk8V+hay3gLMLYZEVmrj70gY8ie4Fvc2oCewTpm4eH7z0Ie4m5Mf2nX
         xilisTqp+yArKFaRlnZKEQd+KDcMMtDZG5Ogfk2mFiBhBYu26MjIyG8ZDB3nZmNSyjM2
         KqeA/AwyoErUTnCzo6o2AjAZDTq8boMyeVNuTznEMngVUbVyFVoMQ8W9GszHk0+LA+iI
         mOYMNy+YnxgPsOG3UW+NLmuruQ84S6lC8E0lRY2jqYGzYK42Pr9pyLWKzUsk4C6kHBmM
         6WU2103mSuixeQfq1ojPsTFIgVJ93Dm9sak6nR7K0v8lmxdgfz6WiW+ulX9+Pl09sAqb
         eETg==
X-Forwarded-Encrypted: i=1; AJvYcCVj0OCNc1vZ+r6eSbXzVhK7xQTMBQvVD1+pHSCvaWoKRocmj8E9rRWlUl3Ft9EF88UURon55Ft+FErKSOio@lists.linux.dev
X-Gm-Message-State: AOJu0YyVMNIn+nCk7zdS8xix97dl84YCj3W6F9ZWZRAPoe+vhmiw02AV
	euKMqMNCptbLgEIW6PEsZ++PV8XyntwdoGB/KmDzUvzoN+kSNoVA
X-Google-Smtp-Source: AGHT+IEBGRzD+6PW+UmhjSaUgcj6XEwk43MFvOUwqaFUyu64I9Bnl8stuR8amDF/ANROxkRpC+T8jg==
X-Received: by 2002:adf:ce8f:0:b0:371:8a3a:680a with SMTP id ffacd0b85a97d-37d0e782737mr3700315f8f.32.1728160490258;
        Sat, 05 Oct 2024 13:34:50 -0700 (PDT)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f85995932sm41824805e9.0.2024.10.05.13.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:34:50 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 05/15] staging: rtl8723bs: Remove function pointer free_xmit_priv
Date: Sat,  5 Oct 2024 22:33:48 +0200
Message-ID: <01ee48c459ddda882c7616e6cf257d96429027c2.1727966761.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1727966761.git.philipp.g.hortmann@gmail.com>
References: <cover.1727966761.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function pointer free_xmit_priv and use rtl8723bs_free_xmit_priv
directly to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     | 3 +--
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 2 --
 drivers/staging/rtl8723bs/include/hal_intf.h | 2 --
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 1d1e4f438e7b..bbead941289d 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -225,8 +225,7 @@ s32	rtw_hal_init_xmit_priv(struct adapter *padapter)
 
 void rtw_hal_free_xmit_priv(struct adapter *padapter)
 {
-	if (padapter->HalFunc.free_xmit_priv)
-		padapter->HalFunc.free_xmit_priv(padapter);
+	rtl8723bs_free_xmit_priv(padapter);
 }
 
 s32	rtw_hal_init_recv_priv(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 55cf827fc255..ef70ada68f2c 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -1259,8 +1259,6 @@ void rtl8723bs_set_hal_ops(struct adapter *padapter)
 
 	rtl8723b_set_hal_ops(pHalFunc);
 
-	pHalFunc->free_xmit_priv = &rtl8723bs_free_xmit_priv;
-
 	pHalFunc->init_recv_priv = &rtl8723bs_init_recv_priv;
 	pHalFunc->free_recv_priv = &rtl8723bs_free_recv_priv;
 
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 696a71c01bf9..0782a13074d7 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -162,8 +162,6 @@ enum hal_intf_ps_func {
 typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 
 struct hal_ops {
-	void (*free_xmit_priv)(struct adapter *padapter);
-
 	s32	(*init_recv_priv)(struct adapter *padapter);
 	void (*free_recv_priv)(struct adapter *padapter);
 
-- 
2.43.0


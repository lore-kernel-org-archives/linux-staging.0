Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2D621FF3F
	for <linux-staging@lists.linux.dev>; Fri,  1 Aug 2025 08:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754037162; cv=none; b=MTM5ADucxFqlK+faZY2ZLpVh0+xCuXNyunSjjqgbidHzY4ln1oJNwCSG+fsy9bhbIiPuWtL/WKTTdJj8LECvAAN47Azk42pg+6lZq6R56K6JXPpWNI7MZiKEfy8Kdebt/RjRg89Bcq12gHt+QSFesgTIKG1veppFuJJf9fS56hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754037162; c=relaxed/simple;
	bh=Ganb2QpLnyafKOMT5g+9k2Q7Ed/ovV4Up8+46CnLsUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jWfqSeu//rxToIpUw2RCIO4Gvc+X7tc8NQgbasIpviaVPGkVflUPhQY+OYVjHu+BnRHRFNBbIYgB7uk3L/AMBrKJVKvFYUCYW4wRlpkh3vzIFgSlZKRrfJKxpD1xPLiZQooUz9AbXa/Z3MRRvcQRAwVfSlGeOourgeU2VTBrT9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lb1YAY+L; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lb1YAY+L"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6153a19dddfso2042535a12.1
        for <linux-staging@lists.linux.dev>; Fri, 01 Aug 2025 01:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754037159; x=1754641959; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hir56biQJZn+xxylTDOOLZm1B/0sdMegpTfCz+mQfxM=;
        b=lb1YAY+LpANGldsXJOw3cY2EtxuylnEP2muYZqvRYz8LQUDew9NEzB5Ahv+98o0zqk
         eCc7qxiKklAtBODGB49x8hJHNEOQ5eQHh7DYfgZPAyRWu2c+V+nEyU4RF8+8Eb+BRec8
         Rv1S0eVIKb1nwI9X3TTamNHxuSd32b6EcQd+k1ro63TTImdoIP1pki0Lt477HWbd2EGB
         RUi8fC10HXcKY2d/PKNtk8KhIFUuNk8VAyHpqfeeRLsFVYKbid160PUGxrDc7xHcQlDN
         6dNae8vcOYld267tqmvPkD9Nk54VBtnsLaqA4jMhfS2q5UxlJp7mamBBYuX5SiTFu0HO
         kPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754037159; x=1754641959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hir56biQJZn+xxylTDOOLZm1B/0sdMegpTfCz+mQfxM=;
        b=J1YJY90ha+b34/TnIacblgljGvP2r4Nue+oRIapEQBINDdAkrHOU+xp5l+g2J9+fY8
         voCAfpYLt9R54qIRNDyUNtruybY2aAdGlsNV5Zvq50uxjDDOFSUXNqGjjGiH424lGULO
         5x4qBMyaOVtaXLSb63aUOz56KojabWeMzyEDH/V+UymHf9Ly8SWCTcL/DllQDuQfQ8qS
         lUSCs2JhpVMJZ732p9wwNccrocz+AnwGsxZYEbNLiDTe5gz4Ilx8y5HUdQKnrKLr8baT
         XBEn3B71dGBITRZbMtFTzLsDOFFoBxT7UgtN4dcFvmuIYlR/ZSHnWFvTBHy7nGXDtzRM
         Pc4w==
X-Forwarded-Encrypted: i=1; AJvYcCUbBmG8P+KonqWC+mRnVGC3uOn3zaUskOufwuCFR4OKc6mJllRtL0DfRZoQpXr5QRaHA1w3sfJlun4eafHk@lists.linux.dev
X-Gm-Message-State: AOJu0YwBJjBW8eBP1O0m4gUI7rt/qrBpIRztdDDynHBi0Lx0bc8ryM71
	gh3RalLggjJB8ZipZCvIAO06KcQ72udHwJbBSjEQdDExhIRZYh8zPb6F
X-Gm-Gg: ASbGnctIr5H7UO5vvsaeqahroNCens0n5VSWK0L4vzrvgQQCpFYEnnNN9wrMzBXNGVh
	fycBpI6xWhnth+Geh3z4Yjw7MeJ7xcXdOJxKxbVD9UYJHg2QdAMrkDtC1oQM9ZHkbIiw8kmtLC5
	QsDEMX5GVEH1CsSJq1x6SIM5mpfvQ9EhU+iDgA2u2GLj0pn+u0/Pm9aCg4lnfbDV9ADTg8sRmZ1
	LSxz4GWasyoXDFbOYl3wr8Apflcc1nqMJWFWaNFQMgJ4NvyFyDfGATyGWysGno9tPuWvmIiQByd
	QXocF8IcV9l2QEpw9QZVdVudXqDxR2AOauNk50d0fVfXp6CIu+SBJJAO0n4uAEhdEKUVZVZrlz1
	4JpbFfQNoAxzB18MMi87Dp9sSkVrKvIM6jIoI396m0WG/THP/1vg=
X-Google-Smtp-Source: AGHT+IFAUkqpznwVuXqoJimFFmaLnFKl/kGMRyRExyxQFtkGD492C+NwhNSINhu0USmY2WxK+oqUag==
X-Received: by 2002:a05:6402:5603:b0:615:d33c:5383 with SMTP id 4fb4d7f45d1cf-615d33c5759mr598535a12.16.1754037159085;
        Fri, 01 Aug 2025 01:32:39 -0700 (PDT)
Received: from tumbleweed (ip-77-25-33-2.web.vodafone.de. [77.25.33.2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a911a59dsm2362735a12.62.2025.08.01.01.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 01:32:38 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 4/8] staging: rtl8723bs: remove wrapper init_addba_retry_timer
Date: Fri,  1 Aug 2025 10:31:27 +0200
Message-ID: <20250801083131.82915-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801083131.82915-1-straube.linux@gmail.com>
References: <20250801083131.82915-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function init_addba_retry_timer is just a wrapper around timer_setup.
Remove the wrapper and use timer_setup directly.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v1 -> v2: no changes

 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c     | 2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 1 -
 drivers/staging/rtl8723bs/os_dep/mlme_linux.c    | 6 ------
 3 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index 1d2b53c76afc..4d51e6993ca2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -229,7 +229,7 @@ struct	sta_info *rtw_alloc_stainfo(struct	sta_priv *pstapriv, u8 *hwaddr)
 		for (i = 0; i < 16; i++)
 			memcpy(&psta->sta_recvpriv.rxcache.tid_rxseq[i], &wRxSeqInitialValue, 2);
 
-		init_addba_retry_timer(pstapriv->padapter, psta);
+		timer_setup(&psta->addba_retry_timer, addba_timer_hdl, 0);
 
 		/* for A-MPDU Rx reordering buffer control */
 		for (i = 0; i < 16 ; i++) {
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 58e2d8e159d6..53fac838c36a 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -426,7 +426,6 @@ void init_mlme_default_rate_set(struct adapter *padapter);
 void init_mlme_ext_priv(struct adapter *padapter);
 int init_hw_mlme_ext(struct adapter *padapter);
 void free_mlme_ext_priv(struct mlme_ext_priv *pmlmeext);
-extern void init_addba_retry_timer(struct adapter *padapter, struct sta_info *psta);
 extern struct xmit_frame *alloc_mgtxmitframe(struct xmit_priv *pxmitpriv);
 
 /* void fill_fwpriv(struct adapter *padapter, struct fw_priv *pfwpriv); */
diff --git a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
index 5cb27ddab769..f85e17ae0e7f 100644
--- a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
@@ -128,9 +128,3 @@ void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 		kfree(buff);
 	}
 }
-
-void init_addba_retry_timer(struct adapter *padapter, struct sta_info *psta)
-{
-	timer_setup(&psta->addba_retry_timer, addba_timer_hdl, 0);
-}
-
-- 
2.50.1


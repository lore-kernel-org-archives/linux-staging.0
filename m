Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D452070
	for <linux-staging@lists.linux.dev>; Fri, 25 Jun 2021 00:08:07 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id dj3so4303473qvb.11
        for <linux-staging@lists.linux.dev>; Thu, 24 Jun 2021 17:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IdP6173OvGMXvCi/zM6T3ofP3z8rnih6Sxt2r3BfdM0=;
        b=VntY2aoDqoad8QmR907pbvocFofYK/i4WtxjG0SgmCL374+EqJFWY3KypPONDX9dHG
         ycnfrtZvzZN9t6tshJnH/yWVRSu0letVU4fCLSBbbbZFoGcRpW6/siP53hriGInUj9IJ
         kqrchinoRHBDWj6bYU96z3veIbblW7OQ0SDMuX0/KkzFHQI3OLnAIiMnYcmOSl+P02ep
         cho9dJTvNBRfXr78PmEHnuL5oqAEArxjbfT6opevChY17f2Kj/Dqg3kpro7YCTXVf8Py
         X1Is42Km5zm/igzXivtBG2SoUPrz6TKGNQZjiUX/k6IHykrm6Ja85hMrd1wFgYR8g50W
         4rXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IdP6173OvGMXvCi/zM6T3ofP3z8rnih6Sxt2r3BfdM0=;
        b=iA+iblg1TkQWhW7pwFb+AVMnWlSx700PfpT0YS0hB0pxLxaKyUrQtzvJPmF8QOuIv/
         TXdwZjvSrYq81I87zwnd1TTKp9PhM2qQ4qkYpQoEcRCPQbd3PDsHVcwjS48IqVBoB7k9
         J7IYTYOO+eSZrf8Kw5dIY5MXhattk8eD4usuZabIPyVGl3b/xRkNkIlvIsxtZ01PfyJb
         5eyB7yj27QypPR8TUcLQardyR8PZPlhLvYypc4rqQAsUFubyw4iC/VhfWH7VobsX5gJ/
         EzZ1IaIkG1fqH4205tpI9qHyWY2sOiZ2rsWn05eKMHHX0IqtgscYDBiqoJ7Q0JY7QGeQ
         TiEw==
X-Gm-Message-State: AOAM530RVnZYwBXdaOl8obTKyg5N0qRSTkesVYryTcGvnKW0LGrRFeOa
	wxoPrK6BeEkkkTEWelc6L2njkw==
X-Google-Smtp-Source: ABdhPJzx7bF9fnG9gsVkf0UfdLMrIDFh/hZcE72ELSFONualK4kgZT1dawd/2OesiCc/IOSgISpejg==
X-Received: by 2002:ad4:574d:: with SMTP id q13mr214970qvx.20.1624579687053;
        Thu, 24 Jun 2021 17:08:07 -0700 (PDT)
Received: from kerneldevvm.. (5.6.a.8.a.a.b.f.c.9.4.c.a.9.a.a.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:aa9a:c49c:fbaa:8a65])
        by smtp.gmail.com with ESMTPSA id m187sm3629014qkd.131.2021.06.24.17.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 17:08:06 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 04/23] staging: rtl8188eu: remove all RT_TRACE calls from os_dep/mlme_linux.c
Date: Fri, 25 Jun 2021 01:07:37 +0100
Message-Id: <20210625000756.6313-5-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625000756.6313-1-phil@philpotter.co.uk>
References: <20210625000756.6313-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all RT_TRACE calls from os_dep/mlme_linux.c as this macro is
unnecessary, and these calls are dubious in terms of necessity.
Removing all calls will ultimately allow the removal of the macro
itself.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/os_dep/mlme_linux.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/mlme_linux.c b/drivers/staging/rtl8188eu/os_dep/mlme_linux.c
index 8af58e847afb..f12d8a707376 100644
--- a/drivers/staging/rtl8188eu/os_dep/mlme_linux.c
+++ b/drivers/staging/rtl8188eu/os_dep/mlme_linux.c
@@ -87,12 +87,8 @@ void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 	u8 *buff, *p, i;
 	union iwreq_data wrqu;
 
-	RT_TRACE(_module_mlme_osdep_c_, _drv_info_,
-		 ("+%s, authmode=%d\n", __func__, authmode));
 	buff = NULL;
 	if (authmode == WLAN_EID_VENDOR_SPECIFIC) {
-		RT_TRACE(_module_mlme_osdep_c_, _drv_info_,
-			 ("%s, authmode=%d\n", __func__, authmode));
 		buff = rtw_malloc(IW_CUSTOM_MAX);
 		if (!buff)
 			return;
-- 
2.31.1


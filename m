Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3053FCC
	for <linux-staging@lists.linux.dev>; Sat,  4 Sep 2021 09:39:19 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id f11-20020a17090aa78b00b0018e98a7cddaso1191423pjq.4
        for <linux-staging@lists.linux.dev>; Sat, 04 Sep 2021 02:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=plYva5hHszvERh5e5dbtWwplKYm4ip7TSv2p3MOtQOE=;
        b=WekawAkPIMwH9SiTHXg0fIPfJ5AA+4tzFsWmBBqY1GowcQCgEi3/pP9JbmAlfrudkj
         MHzJfaBpDPD5zZ+t8YpfTsopDfg3SoNvUGwo9fBAlokQC3VhsUPmkkxw3KbENR0NEGdV
         U2FyyVDfVLZlKt+ZMCWWbFT43nr94yDfbqM23lGY+emAUZXAdPTnrzAU/zhIflBltgYd
         kF/YwkKiSCLtKgrmwUU5qMSDhT/SUztOxzUUU+1dLjBtIY5OR57vnrAIdflQVSSPm/nC
         ucLvtsC0+SHMOzjwsCNHyMJPm9I1asW89f6eS4PhV4v6PL1Vpf4mlu/qDnV1/KxtYaj6
         LIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=plYva5hHszvERh5e5dbtWwplKYm4ip7TSv2p3MOtQOE=;
        b=KpVUFfQFfugUEWxDKZR9o9WwnNnGDB+jTIXRh3/nymNS+SMAbr+HAFu0KKjGc9obUr
         t6X3F9z/i0Rf7azDtUwcBqSq22tUSJsej5U/AoAZfsFVXFmQQX8lgFvTBrO17oOXcuYv
         2CuYNEJkpfEJVbvCVFYn7dDzl+d1TGXlWyMWTDWCq0Wvhwp7xfEAQ/4DR89h98bkO+S+
         RKddccWooCo+Mnlr0lZ2SWYYN9XtIVRa7/OYE4Xj9Mt5NvHpC6lnAjrZB39RonUMOlq9
         l+WoPQZVMH5cgirBxqLjLXPzu7K4Tf66d6lnNdBN0OrEWnRsvOWOIw14lymVkbJQyx1s
         hXvw==
X-Gm-Message-State: AOAM533UJumTSTSBxxz4BuYUoqEkJrUIlt6AwyLXPcRVR0j7OcG7eNN6
	h09UkX4HD4oYyYR4wWTm3TU=
X-Google-Smtp-Source: ABdhPJzuW5wxNK9ghnYeDDYhnYgqDuo8ge2Jk/t+M6m5fh4W6grNKjdqI40IpAoPkGEpq3ixlvSfmA==
X-Received: by 2002:a17:90b:1d02:: with SMTP id on2mr3468540pjb.204.1630748359223;
        Sat, 04 Sep 2021 02:39:19 -0700 (PDT)
Received: from user ([117.98.200.228])
        by smtp.gmail.com with ESMTPSA id j17sm1890612pfn.148.2021.09.04.02.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 02:39:18 -0700 (PDT)
Date: Sat, 4 Sep 2021 15:09:13 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	straube.linux@gmail.com, martin@kaiser.cx,
	saurav.girepunje@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: r8188eu: os_dep: simplifiy the rtw_resume function
Message-ID: <YTM+wayCk2n2CrVP@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unused variable ret and pwrpriv.
Remove the condition with no effect (if == else) in usb_intf.c
file.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/r8188eu/os_dep/usb_intf.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index bb85ab77fd26..673cd3001183 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -493,14 +493,8 @@ static int rtw_resume(struct usb_interface *pusb_intf)
 {
 	struct dvobj_priv *dvobj = usb_get_intfdata(pusb_intf);
 	struct adapter *padapter = dvobj->if1;
-	struct pwrctrl_priv *pwrpriv = &padapter->pwrctrlpriv;
-	int ret = 0;

-	if (pwrpriv->bInternalAutoSuspend)
-		ret = rtw_resume_process(padapter);
-	else
-		ret = rtw_resume_process(padapter);
-	return ret;
+	return rtw_resume_process(padapter);
 }

 int rtw_resume_process(struct adapter *padapter)
--
2.32.0


Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B63E80B
	for <linux-staging@lists.linux.dev>; Fri, 11 Nov 2022 08:37:50 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id r14so6665600edc.7
        for <linux-staging@lists.linux.dev>; Fri, 11 Nov 2022 00:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Si9XFxNri8mLzDVBs0OAg9hzoexdDFNJE3YaOOciu+c=;
        b=XSBHG4K3p/UZ1gh1fnNp1FKmdxFFb86t/hTrcXm/F/Jg3sWvT63v7SO1kiP4P3dvL5
         qgWEMfqY4lTw39sNBWEzvM7sPBP1PJh8/V9/S0mTdQuCTANNeM3MKh6ZOzhVjo7wKTAC
         IqqgQ2zZu3fSO3tqVYm5vYSk6bF0o819y2tiS/OTF1wCzCmWQ/eoczRz9GSfkHXdqNGn
         ET7ixl/C+7sh/jdAecuHccCSm0fXfJk+h85RNfD7WVPwHCj0RFGD63MWbMkghCx1S4JY
         XBmDfjUChVxH8mOgoNDI/FS5bqQ76XsVAmKIo++I6j+KHIi7h3rnZoAQWvr9pUkC/Ne1
         VrRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Si9XFxNri8mLzDVBs0OAg9hzoexdDFNJE3YaOOciu+c=;
        b=0HFPrjtAMECsIYP88XFlPngeflutBq0RQ1gWQsT0I/dRjioVEUwj7YQwR/edk25Enp
         YE4KGGlsVFgAq85tOEIBaSVUEKHItPIxrluKEAnSmoAjz53xSExjEq/NolplAIF8BVHr
         7IJ/p1lVMSuNtBZIWZ7arDrdMTPKrcquUF2hiivXmTczSPrhbLgouufKTs0ZhIWYVZfn
         oYrn1jNpcCH9kl0LDqLMF9Se8gOXoPel2KUby4NYMq4m8Tpmpw6m2lQvFA9m6XUuhLRx
         lDrmiF7bHzZNoF4CM9s5GNo/ofODr2dWPF+vepoSRn7hFeVUlgCUqccWDmOtvCK2d/Qo
         nh6A==
X-Gm-Message-State: ANoB5plECK+cc2A78eGRxx+kqydiF/rNFVw2t4hBewo4KJrXbtLP4jao
	xS+EQGtZCXykH4P280ASi+E=
X-Google-Smtp-Source: AA0mqf5qmgSJlE3KEXHw984duxSXDyi5NfCNIjnyM+o48hqQOKctWFmzTu0yEcJubYuMW6BzpV95mw==
X-Received: by 2002:aa7:c3d1:0:b0:45a:2d7c:f3a0 with SMTP id l17-20020aa7c3d1000000b0045a2d7cf3a0mr597699edr.98.1668155868387;
        Fri, 11 Nov 2022 00:37:48 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb9a.dynamic.kabel-deutschland.de. [95.90.187.154])
        by smtp.gmail.com with ESMTPSA id b2-20020a1709063ca200b007ae566edb8bsm643190ejh.73.2022.11.11.00.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 00:37:48 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/4] staging: r8188eu: binstallGrpkey is set to _FAIL
Date: Fri, 11 Nov 2022 09:37:33 +0100
Message-Id: <20221111083733.3144-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221111083733.3144-1-straube.linux@gmail.com>
References: <20221111083733.3144-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable binstallGrpkey is set to _FAIL which is defined as 0.
Use false to set the variable to get rid of another use of _FAIL.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/os_dep/os_intfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 44eb95a7682c..2f59bb994796 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -405,7 +405,7 @@ static void rtw_init_default_value(struct adapter *padapter)
 	pmlmepriv->htpriv.ampdu_enable = false;/* set to disabled */
 
 	/* security_priv */
-	psecuritypriv->binstallGrpkey = _FAIL;
+	psecuritypriv->binstallGrpkey = false;
 	psecuritypriv->sw_encrypt = pregistrypriv->software_encrypt;
 	psecuritypriv->sw_decrypt = pregistrypriv->software_decrypt;
 	psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open; /* open system */
-- 
2.38.1


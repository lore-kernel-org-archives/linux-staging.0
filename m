Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518956D09
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 09:14:53 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id q26so847457wrz.9
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 02:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0bzab+wyS6KvStbR7zDn+0HIWgAiRTCX8kg+zp342XE=;
        b=oKK4ATlPz63YglMxho0RkFxIej+0VLGq+6NFX1sb964k1dmGO9Fz3xWV8tEMFIZqLr
         gnLires1JRCiu8MyDpR0eBNr3Ui3k60NnVfxHP6pSzzur6dkB3/l3bXrT/zr8pxebLn1
         fEWO88PQ7vV2t8jHgakO2gxORfdvrmiup+vDUq1WawjVNQQxTrO20/3lVyV7pTp/px6n
         2d08aU6zQC9/ivIr7zBEEhNNDxn5oVdsLdukFqGR568DqpzZ9cGyUcUI2VLhD1E6pNgB
         vCbhpzWlgjQTxbw6XXW3Xo62oHXMSDlk7O4ORDOFBNBwvMPMT+qzR8iHCP2gw17n0pDj
         gedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0bzab+wyS6KvStbR7zDn+0HIWgAiRTCX8kg+zp342XE=;
        b=QsCNXRXi+Ff5Uam15nHv/r0oT2YkbGbq3g8KBg+Y1JldVW9P3J+B2dL2qffeMJ6C/l
         ZgpnsuCakP3h/NdJBY0HNvLOrb9AKfslifj8CGIUdPLoi/2EHywqNdTB6NUed7z2P3Xd
         j750UInCszZrTKPKeZMDEP6DGWiI3TzQmNaoxw3b15vzJ03TVKPxTl9jIIkN3Awh3IUn
         mjMVfAgV+NpeVrfmy5tDX6Ar8Dg6i55snu/DICc57WphY+805WbK8qwJue+bfM4A8+D3
         wLhAbeUgqBMY9fthJUM3AED1NfhzNlEHyOtXt0cJiZPfKWPWUlaWjbyhCb+tJAgxT/Ff
         +etA==
X-Gm-Message-State: AOAM5316JksF4phLZWV9dVDOye3pEtEiVY686W5ACxg0AMQkmc/bhtFI
	uJAR3h5LhWXkjGJQGpI9EAo=
X-Google-Smtp-Source: ABdhPJx6aiQNiY9q0OrelcNpOzAhVydSO1/VdWy7CuSw+s+79hNE8KaEJ8sn871vxO836lvbRrzhuQ==
X-Received: by 2002:adf:deca:: with SMTP id i10mr1609520wrn.319.1617441291952;
        Sat, 03 Apr 2021 02:14:51 -0700 (PDT)
Received: from agape ([5.171.72.64])
        by smtp.gmail.com with ESMTPSA id s21sm15207799wmc.10.2021.04.03.02.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 02:14:51 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v3 24/30] staging: rtl8723bs: remove commented RT_TRACE call in core/rtw_ioctl_set.c
Date: Sat,  3 Apr 2021 11:13:46 +0200
Message-Id: <22243acbf44c80ffb578d9a56cbec293f7c02de5.1617440834.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617440833.git.fabioaiuto83@gmail.com>
References: <cover.1617440833.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove commented RT_TRACE call in core/rtw_ioctl_set.c

Remove all of the RT_TRACE logs in the core/rtw_ioctl_set.c file as they
currently do nothing as they require the code to be modified by
hand in order to be turned on. This obviously has not happened
since the code was merged. Moreover it relies on an unneeded
private log level tracing which overrides the in-kernel public one,
so just remove them as they are unused.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 7d858cae2395..14eb01df69b0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -451,9 +451,6 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 
 		/* SecClearAllKeys(adapter); */
 
-		/* RT_TRACE(COMP_OID_SET, DBG_LOUD, ("set_infrastructure: fw_state:%x after changing mode\n", */
-		/* 									get_fwstate(pmlmepriv))); */
-
 		spin_unlock_bh(&pmlmepriv->lock);
 	}
 	return true;
-- 
2.20.1


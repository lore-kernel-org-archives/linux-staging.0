Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B1A71
	for <linux-staging@lists.linux.dev>; Wed, 28 Apr 2021 17:55:29 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id t22so10040279pgu.0
        for <linux-staging@lists.linux.dev>; Wed, 28 Apr 2021 10:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=EOlR2LB50FEmXOIlb44UF+AW0LxIYM4DBDtW/EDmbM4=;
        b=UsmH3lJn+uVfWZiEIV0TIdAUxseTWvlwBFpLL2BwHQ1/GsavFQseePn0nZrQqS4277
         xyfqvnLp9srT9Vb5O+1a3ZNC415j4NZaqW63A7nNy+1E7nKqEUx0M+/4nyRd3nRE8N/T
         7hX0yRYnBIIudzCxaLsdyM7OAGSJvbkN8cbWUHrZ2HbXMkhxnxMkXiefJAupFRk1csy4
         rgmr25F07/ranBJOjSTqH0BcPTlpbZOJ4DbwWZeE5rr0o9r4jN6ttu7xOIRPEqZt4u9J
         YnrfnElG10KQibLawwRgHlT4Fu8izjuvEmIpmH5LtaTAaNssfbFeolYhEhhOnG99iVwE
         tr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=EOlR2LB50FEmXOIlb44UF+AW0LxIYM4DBDtW/EDmbM4=;
        b=a2mPvysPS6bSSRPufRLCGfFS1p1DF2jdefrRDmmIHj4hrSALVuUpoyFacD5gB1mfnA
         IPEt0XnEisfCIOdUoCY+lri3vKMSn4/yEAJqOnPuntrYE80q4cFddwsbB0lOT6gx5HdC
         rKCfgmDl7fqGRQUF22hQGzkcB3rmn44ljKV57W1rekJhOQHli6rQR5F4LTdq9t66P9lL
         WgcPPyX1jkLnLzg+++5h/5ipO0/0w5Uf/5sOUkyU4EK/44Vx7ZH56xRILjGAj2wgqZM6
         fjd8IKLUdpiJ3ax+fbRsRjT9d7Sy7vRmwbDEQWfhsuJEemPG0lHhDviJ7cQP9abiWmHD
         le5w==
X-Gm-Message-State: AOAM531JuZeM1a2JYmAU1PSOFHXPOT7BMWhVbJ1KVjbRdnZRArWnrAf6
	x39c2f3/W3THq8fxB3X9kls=
X-Google-Smtp-Source: ABdhPJwOTdy/HQ6OjYlOdx8j35mKQEpMtqo1lvVwZ/Hh6rXjztHurrAJfAG3Hrhl5Zpcceh3L2iuuQ==
X-Received: by 2002:a62:be16:0:b029:25a:e1b4:5deb with SMTP id l22-20020a62be160000b029025ae1b45debmr28574499pff.66.1619632529191;
        Wed, 28 Apr 2021 10:55:29 -0700 (PDT)
Received: from user ([2001:4490:4409:14a:3c1e:9a4c:c5d6:1dec])
        by smtp.gmail.com with ESMTPSA id gn24sm190185pjb.13.2021.04.28.10.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 10:55:28 -0700 (PDT)
Date: Wed, 28 Apr 2021 23:25:20 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: gregkh@linuxfoundation.org, marcocesati@gmail.com,
	fabioaiuto83@gmail.com, dan.carpenter@oracle.com,
	saurav.girepunje@gmail.com, john.oldman@polehill.co.uk,
	ross.schm.dev@gmail.com, insafonov@gmail.com,
	hello@bryanbrattlof.com, hdegoede@redhat.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: rtl8723bs: Change the return type
Message-ID: <20210428175520.GA8921@user>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove the ret variable in rtw_suspend_common() and change
the return type from int to void as rtw_suspend_common()
always return zero unconditionally.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/rtl8723bs/include/osdep_intf.h | 2 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c    | 5 ++---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c   | 4 +++-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_intf.h b/drivers/staging/rtl8723bs/include/osdep_intf.h
index 48c90f00cc2e..111e0179712a 100644
--- a/drivers/staging/rtl8723bs/include/osdep_intf.h
+++ b/drivers/staging/rtl8723bs/include/osdep_intf.h
@@ -66,7 +66,7 @@ void rtw_ips_pwr_down(struct adapter *padapter);
 int rtw_drv_register_netdev(struct adapter *padapter);
 void rtw_ndev_destructor(struct net_device *ndev);
 
-int rtw_suspend_common(struct adapter *padapter);
+void rtw_suspend_common(struct adapter *padapter);
 int rtw_resume_common(struct adapter *padapter);
 
 int netdev_open(struct net_device *pnetdev);
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 1f34cb2e367c..724909078d80 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -1146,14 +1146,13 @@ static void rtw_suspend_normal(struct adapter *padapter)
 		padapter->intf_deinit(adapter_to_dvobj(padapter));
 }
 
-int rtw_suspend_common(struct adapter *padapter)
+void rtw_suspend_common(struct adapter *padapter)
 {
 	struct dvobj_priv *psdpriv = padapter->dvobj;
 	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
 	struct pwrctrl_priv *pwrpriv = dvobj_to_pwrctl(psdpriv);
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
-	int ret = 0;
 	unsigned long start_time = jiffies;
 
 	DBG_871X_LEVEL(_drv_always_, " suspend start\n");
@@ -1196,7 +1195,7 @@ int rtw_suspend_common(struct adapter *padapter)
 
 exit:
 
-	return ret;
+	return;
 }
 
 static int rtw_resume_process_normal(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index a9a9631dd23c..84c16925c4f5 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -452,7 +452,9 @@ static int rtw_sdio_suspend(struct device *dev)
 		return 0;
 	}
 
-	return rtw_suspend_common(padapter);
+	rtw_suspend_common(padapter);
+
+	return 0;
 }
 
 static int rtw_resume_process(struct adapter *padapter)
-- 
2.25.1


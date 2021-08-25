Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC462FB2
	for <linux-staging@lists.linux.dev>; Wed, 25 Aug 2021 06:15:42 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id a66so7169975qkc.1
        for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 23:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PHpfJ/+giY//PTSV9hmjgFnWiFlaULLHw5pVUFnZXjI=;
        b=JZp+aGqCxDPf0C2vqWl3gA2RSraLRFI1hV70cyMpIkRx5EsSHupFwyXuMRF2sY0o/V
         3exx9IPtaTXNJZVSFYan6mqnNA3KxqBC39RXykjscq3IDmE5Y7Kn42/Ja3Bh8zpCrLun
         UXeuRCwGzg16JxZxt25nL/DDN/mACvf4wGIQUnn9/ZFUZSZA30xAMXSfzzDc0p5apHyT
         vE4GEL5gRgXaljlWZGFfto19WbDSj7ZLqTbDeoCF1hr7bTvUcu8cGDvRqEwRDQa7HDoN
         Xn6YqpqUF4yUpuf5h5jQVz2yv4JUWpZCXdOOeaqjtvmnQyF1bMr+VYZZyHofB4ZDHPjh
         VJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PHpfJ/+giY//PTSV9hmjgFnWiFlaULLHw5pVUFnZXjI=;
        b=TOYLod4w5QbbxcdRx7cotQjobZbReELlB3WjgkweVriFKCqe/vkK5CzD/VpLNyiXqD
         8RG5uDHVC4da5rvNEsLFvSLORAy4gDAru0/VI2j9rMG/4n/vbQjc1AG18uzW3YgNCsmk
         edWl3IKcXiNE6FZj1h8C8J03qblchwtvFxSf0d9RHw1BTkCHg8+iiwZ7HWRvKsWXp6Te
         /xkjupOFNLDPSsGIQ+RffnVkC3n/sjecWlDWwyN2epYn68Gze3sjKD3IzzKY+1fSN5Wd
         oixIAKgUMAVMsNqZURe9WbKfHaenWhFXtxf/B01GgsUBCiXZPYDOrlrK1g5u0OvXGwfJ
         O26Q==
X-Gm-Message-State: AOAM531r6Oa5Dk4Q1qmFxPBz5uW7v+8+OOEZQKp2gLrVqEdfdPFaTh5Y
	e97qAkIRpCHoHz0Tp+L9kFo=
X-Google-Smtp-Source: ABdhPJwhUJUOg82ro0dDkyiSwfBWb+7ycl9aLnNjwi6aXYf1eB3dwg9mrOqQkoLySuxT66fAme/wCw==
X-Received: by 2002:a05:620a:14ad:: with SMTP id x13mr30242912qkj.172.1629872141200;
        Tue, 24 Aug 2021 23:15:41 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id x8sm9397102qts.69.2021.08.24.23.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 23:15:40 -0700 (PDT)
From: CGEL <cgel.zte@gmail.com>
X-Google-Original-From: CGEL <deng.changcheng@zte.com.cn>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jing Yangyang <jing.yangyang@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] drivers:r8188eu: remove unneeded variable
Date: Tue, 24 Aug 2021 23:15:31 -0700
Message-Id: <20210825061531.69678-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jing Yangyang <jing.yangyang@zte.com.cn>

Eliminate the following coccicheck warning:
./drivers/staging/r8188eu/os_dep/os_intfs.c:505:6-12:
 Unneeded variable "status". Return "_SUCCESS" on line 577
./drivers/staging/r8188eu/os_dep/os_intfs.c:772: 4-7:
  Unneeded variable "ret". Return "_SUCCESS" on line 818
./drivers/staging/r8188eu/os_dep/os_intfs.c:823:4-8:
Unneeded variable "ret8". Return "_SUCCESS" on line 849

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Jing Yangyang <jing.yangyang@zte.com.cn>
---
 drivers/staging/r8188eu/os_dep/os_intfs.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 9d7d2b9..8436a43 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -502,7 +502,6 @@ void rtw_proc_remove_one(struct net_device *dev)
 
 static uint loadparam(struct adapter *padapter,  struct  net_device *pnetdev)
 {
-	uint status = _SUCCESS;
 	struct registry_priv  *registry_par = &padapter->registrypriv;
 
 	GlobalDebugLevel = rtw_debug;
@@ -574,7 +573,7 @@ static uint loadparam(struct adapter *padapter,  struct  net_device *pnetdev)
 	snprintf(registry_par->if2name, 16, "%s", if2name);
 	registry_par->notch_filter = (u8)rtw_notch_filter;
 
-	return status;
+	return _SUCCESS;
 }
 
 static int rtw_net_set_mac_address(struct net_device *pnetdev, void *p)
@@ -751,7 +750,6 @@ void rtw_stop_drv_threads(struct adapter *padapter)
 
 static u8 rtw_init_default_value(struct adapter *padapter)
 {
-	u8 ret  = _SUCCESS;
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
 	struct xmit_priv	*pxmitpriv = &padapter->xmitpriv;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
@@ -797,12 +795,11 @@ static u8 rtw_init_default_value(struct adapter *padapter)
 #ifdef CONFIG_88EU_P2P
 	padapter->bShowGetP2PState = 1;
 #endif
-	return ret;
+	return _SUCCESS;
 }
 
 u8 rtw_reset_drv_sw(struct adapter *padapter)
 {
-	u8	ret8 = _SUCCESS;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct pwrctrl_priv *pwrctrlpriv = &padapter->pwrctrlpriv;
 
@@ -828,7 +825,7 @@ u8 rtw_reset_drv_sw(struct adapter *padapter)
 
 	rtw_set_signal_stat_timer(&padapter->recvpriv);
 
-	return ret8;
+	return _SUCCESS;
 }
 
 u8 rtw_init_drv_sw(struct adapter *padapter)
-- 
1.8.3.1



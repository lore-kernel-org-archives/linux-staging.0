Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC88168
	for <linux-staging@lists.linux.dev>; Sun,  7 Nov 2021 16:43:22 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id h24so5360030pjq.2
        for <linux-staging@lists.linux.dev>; Sun, 07 Nov 2021 08:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=mu53NIDDoFP2FNYr7iEB3rEkhW3EvAwGtudvbec6i1s=;
        b=k2ZgHcuzmu3dJkqZh5WRCan3LLmt6CPEL9CG/WP+7azhJHgoaxi43uXwZCSg2ud6Q+
         aR96OLZHJJDYjtqYuW/7ThVdSP2Glw6Ngfht3NcZ7JWDqWYq/f9lY1e8NYFF7GiCn26C
         KVEik7/k65JnkCYylfQ9iQn6juwo2bidmZE7duo4B57FL5ABq3QW4MsRapr2BEbjyoMV
         Vwrz/nFMauGaWSW7yyZoHkP+IJcwLOA2Iy4jZPLeSkCMyGDkE/IxryhHIhDRR0x6IDAH
         3DSILQprrSSLWuGBTMP3mM2QZ7oGQs+iIaeJXAUhXR6h2JiGHLs19bGK06oDm5wRjUTx
         Fpbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=mu53NIDDoFP2FNYr7iEB3rEkhW3EvAwGtudvbec6i1s=;
        b=ZV9Wm9jobwCxRz72wFFHA6+f7kOBtPNnZrCF3K9Qangg4jt4rGuu5jzpBz/PSc5xxq
         sZO0mcdu1m0ni+JBytdVT17EvGil+ie6jIQbfTz2k09fADkBU+fh+r3vk4TMEmE8/Xej
         5TvrJGDyY2tD/AIjl7lUSS6qBgAFq7vT/IwMuCE9XE2eZZs6NqaDGvQS703SVhGNOi8g
         AKLSIKhngai+5z4spMkhtG+XGkHpNypzx2BQHZzZMstr5qkpIsY9dQsZB2mg1iOBqd8R
         9EueT+Zjh0T9xIJH576223azarZHEQrhcljWDivcb3NJtDJFf4WEC/DpWEjynsqUTWcL
         lhKg==
X-Gm-Message-State: AOAM530Go0rQzApn79Au7v1BheUNfk5lE7grNeXq6Ofy3ua1uR3uo1sO
	Ijy1B1SLaU8WvDsrJVz4UmY=
X-Google-Smtp-Source: ABdhPJxt2xBtjHC0BLn+jNW2puOFCSuwWkIJIrxKT6vazgKxJFv7o72HGUqwIpywHOLxOxfKRAtsMw==
X-Received: by 2002:a17:90b:4a50:: with SMTP id lb16mr23987566pjb.147.1636303402305;
        Sun, 07 Nov 2021 08:43:22 -0800 (PST)
Received: from Sauravs-MacBook-Air.local ([59.88.109.27])
        by smtp.gmail.com with ESMTPSA id l17sm14003627pfc.94.2021.11.07.08.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 08:43:21 -0800 (PST)
Date: Sun, 7 Nov 2021 22:13:10 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, straube.linux@gmail.com,
	saurav.girepunje@gmail.com, martin@kaiser.cx,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: r8188eu: os_dep: Change the return type of function
Message-ID: <YYgCHkVXFQ4r9dVp@Sauravs-MacBook-Air.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Change the return type of rtw_init_default_value function
from u8 to void. This function always return success. This
is called from rtw_init_drv_sw where the return value from
this function is assign to local variable but the local variable
value is never checked. After change the return type to void
remove the local variable ret8 in rtw_init_drv_sw function.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/r8188eu/os_dep/os_intfs.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index ec96e837ab88..6b38b2d26d8b 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -398,7 +398,7 @@ void rtw_stop_drv_threads(struct adapter *padapter)
 		_rtw_down_sema(&padapter->cmdpriv.terminate_cmdthread_sema);
 }

-static u8 rtw_init_default_value(struct adapter *padapter)
+static void rtw_init_default_value(struct adapter *padapter)
 {
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
 	struct xmit_priv	*pxmitpriv = &padapter->xmitpriv;
@@ -443,7 +443,6 @@ static u8 rtw_init_default_value(struct adapter *padapter)
 	padapter->bRxRSSIDisplay = 0;
 	padapter->bNotifyChannelChange = 0;
 	padapter->bShowGetP2PState = 1;
-	return _SUCCESS;
 }

 u8 rtw_reset_drv_sw(struct adapter *padapter)
@@ -478,8 +477,6 @@ u8 rtw_reset_drv_sw(struct adapter *padapter)

 u8 rtw_init_drv_sw(struct adapter *padapter)
 {
-	u8	ret8 = _SUCCESS;
-
 	if ((rtw_init_cmd_priv(&padapter->cmdpriv)) == _FAIL)
 		return _FAIL;

@@ -519,7 +516,7 @@ u8 rtw_init_drv_sw(struct adapter *padapter)

 	rtw_init_pwrctrl_priv(padapter);

-	ret8 = rtw_init_default_value(padapter);
+	rtw_init_default_value(padapter);

 	rtl8188e_init_dm_priv(padapter);
 	rtl8188eu_InitSwLeds(padapter);
@@ -528,7 +525,7 @@ u8 rtw_init_drv_sw(struct adapter *padapter)

 	spin_lock_init(&padapter->br_ext_lock);

-	return ret8;
+	return _SUCCESS;
 }

 void rtw_cancel_all_timer(struct adapter *padapter)
--
2.33.0


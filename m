Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826F970
	for <linux-staging@lists.linux.dev>; Tue,  3 Aug 2021 13:52:46 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id h7-20020a4ab4470000b0290263c143bcb2so5200889ooo.7
        for <linux-staging@lists.linux.dev>; Tue, 03 Aug 2021 06:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PVmYRiU+rLASZ08i0ZQHsqvZPCSQrNJBkub0LVsh2Io=;
        b=fCxssyIEXbFBEvk1gDhZz9TzBoNFVZw8WWiCA+hk4+6f3Fh4K44xe5xzzRZoOmZY6s
         ux2m9QT1Xv6m5g9AD6dnfw+SvVuGWJSfnqJ2atfjNdQN/Q93rn5n4KeMByZF8zQNJ9pk
         b93O3RD0zaynuf1y72JG1atYuFDCAv55aRQhdTFX8c+WFncFV1oD6d/K9POZ5HAWtt8d
         1cTiwQlsHe9nbNF7IssjUGzOeLDX0dWyFLSuUYlrMYjXTr4vBYUwhHGXy6IcSwRsYnF0
         yDfvLC9obniqkfIzEZou/bShKG8nIEF+KGhpcv0lA2tf2RB4aB1gTXGUlVlmmJi06ci4
         SKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=PVmYRiU+rLASZ08i0ZQHsqvZPCSQrNJBkub0LVsh2Io=;
        b=Wybyo2Uug29low3Dxvbho5kTpnP5H9wayhB1/9mMrc8vzfFgLXocsFwH1866jxoC0t
         eWgSRiR2jBglU2AKSh1LK7tn/SNQzCHNv4WeZMVBvvpOPNdbBUVTyA1+hSnYXfUTBOxC
         cEC010uhPrvgTeQX1xBXLB9d8Jy4ovmR5jIiC8U1diOsGI63XgeVIjRZstCdY16BCh+z
         UnMAPa3QIXg5KOiiNif1dX6FWYyXlDqwuSIxW0DiXyHMy0Zt9x5O3lJ9KddB1firfEx2
         6k1PeBkC/Rj0eZQzahNCpX7GrswpvgGuyjP9UyU1HNDrUFhB/eSFjMF4eZEhrcPkWUjm
         ySYQ==
X-Gm-Message-State: AOAM530c/9KA3bW3jlwFu7Yp5q64b2tpUVJoeKp2d+4Q6FXrDCLUOCsi
	vQAviJrZe8q3x9doYx3hfm8=
X-Google-Smtp-Source: ABdhPJwliS0HE3ZXN6dcD0h4c96jB8hMyLoI346NeiYNz+EGF9akgcoFabf3oJB8/p8kqLVMB6lQZA==
X-Received: by 2002:a4a:2242:: with SMTP id z2mr14320002ooe.90.1627998765789;
        Tue, 03 Aug 2021 06:52:45 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-1010.res6.spectrum.com.com (2603-8090-2005-39b3-0000-0000-0000-1010.res6.spectrum.com. [2603:8090:2005:39b3::1010])
        by smtp.gmail.com with ESMTPSA id y26sm2504106otq.23.2021.08.03.06.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 06:52:45 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
To: gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>
Subject: [PATCH 08/10] staging: r8188eu: Remove wrapper around do_div
Date: Tue,  3 Aug 2021 08:52:21 -0500
Message-Id: <20210803135223.12543-9-Larry.Finger@lwfinger.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210803135223.12543-1-Larry.Finger@lwfinger.net>
References: <20210803135223.12543-1-Larry.Finger@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wrapper routine rtw_modular64() contains only a call to do_div() and
is used once in the code. Remove the wrapper.

Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
---
 drivers/staging/r8188eu/hal/usb_halinit.c       | 3 ++-
 drivers/staging/r8188eu/include/osdep_service.h | 2 --
 drivers/staging/r8188eu/os_dep/osdep_service.c  | 5 -----
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 441080bd0b74..0d945a3bb1d7 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1453,7 +1453,8 @@ static void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 			struct mlme_ext_priv	*pmlmeext = &Adapter->mlmeextpriv;
 			struct mlme_ext_info	*pmlmeinfo = &(pmlmeext->mlmext_info);
 
-			tsf = pmlmeext->TSFValue - rtw_modular64(pmlmeext->TSFValue, (pmlmeinfo->bcn_interval*1024)) - 1024; /* us */
+			tsf = pmlmeext->TSFValue - do_div(pmlmeext->TSFValue,
+							  pmlmeinfo->bcn_interval * 1024) - 1024; /* us */
 
 			if (((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE) || ((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE))
 				StopTxBeacon(Adapter);
diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index 6203e3c219ca..52862785647f 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -344,8 +344,6 @@ void rtw_free_netdev(struct net_device *netdev);
 
 #define rtw_signal_process(pid, sig) kill_pid(find_vpid((pid)),(sig), 1)
 
-u64 rtw_modular64(u64 x, u64 y);
-
 /* Macros for handling unaligned memory accesses */
 
 #define RTW_GET_BE16(a) ((u16) (((a)[0] << 8) | (a)[1]))
diff --git a/drivers/staging/r8188eu/os_dep/osdep_service.c b/drivers/staging/r8188eu/os_dep/osdep_service.c
index c05b7589e9b4..f2fae1c7f147 100644
--- a/drivers/staging/r8188eu/os_dep/osdep_service.c
+++ b/drivers/staging/r8188eu/os_dep/osdep_service.c
@@ -283,11 +283,6 @@ int rtw_change_ifname(struct adapter *padapter, const char *ifname)
 	return -1;
 }
 
-u64 rtw_modular64(u64 x, u64 y)
-{
-	return do_div(x, y);
-}
-
 void rtw_buf_free(u8 **buf, u32 *buf_len)
 {
 	*buf_len = 0;
-- 
2.32.0


Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0733FCD
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 01:01:11 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id k20-20020a05600c0b5400b002e87ad6956eso3635517wmr.1
        for <linux-staging@lists.linux.dev>; Sun, 05 Sep 2021 18:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rw0OBiIEre63urMzZ8KWwtl0W1HzxhcByazQBFA9usM=;
        b=M0hte5732kaBr5j/gRn+/N3Qyigevj1d4HuQdxQGOzQ59niTaWzAnNxH7ZEI1Lq5we
         VcohT5UGC6z+ImNFD6ijhkXYFgEA9zBxOmNzDdkW1TTHqojIjSie5NhsyO4MzF8DONDG
         R812nBLzItFnC46s+4dzeHA3ec2Qsxx6BkeyA051rxqt8uJKvtcnDJiefMzigUBb8Cbw
         Uarg8m5ZQsODrkQqmqaYH/OZ7KxrFbqvHAjeokz95Y4fso1XP+IqbOv32hMdA95+MwuX
         zbEZslj3wYGl1ZoTQDaS32y2pAG5sO3LjCGWlYUBnmi8MW8kZxZts3s5RMzJBqVqt8zc
         FfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rw0OBiIEre63urMzZ8KWwtl0W1HzxhcByazQBFA9usM=;
        b=OE7XvfC/5a3bUNqVrR9EzFdd5duLt1t2TIU28tpDj9Wxl/In+X0H00p3aybUtjKiih
         GbV1BH45jSuu7tsUlp5cD+BmukN6vDCIn21MG4hBCCh7Rg3n+sK/jf2xyAsvPTqkTVsR
         DZxxzxLKC1CBPD2GM8TVWJIvt/kVLU4lBs7MwhCrUDCQsI45bAHfBF8KniNiPmGTiXXb
         X/x6xuR2mRMU6Uqp757gP9/1l/PTZG3lirIp77pzKt+IagTbhR70WirjH1UdClr/4uaU
         ESHLj0OvXqgwUMYI3cehuVpZwSHSzPlaWZELsvXden+U418l2/ixeJhHCxhEuQvCiWsx
         AEWA==
X-Gm-Message-State: AOAM532rd4Dx3C0JKgpNaZiQYmhHmXil9gTuCIF7Rj0hhTLs55UEvOLM
	/A3HPxN1ix5cnTWpCSI/S1rE1w==
X-Google-Smtp-Source: ABdhPJy+mpjFVfAixcLw5VqYpG6YrfEXAUgFYjTWaScP9ob8plTtFnXkJHYflTH2VXpTU7NPraowzg==
X-Received: by 2002:a05:600c:210a:: with SMTP id u10mr8748271wml.127.1630890070370;
        Sun, 05 Sep 2021 18:01:10 -0700 (PDT)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id r25sm5151232wrc.26.2021.09.05.18.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 18:01:10 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 01/14] staging: r8188eu: remove rtw_hal_reset_security_engine function
Date: Mon,  6 Sep 2021 02:00:53 +0100
Message-Id: <20210906010106.898-2-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906010106.898-1-phil@philpotter.co.uk>
References: <20210906010106.898-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove rtw_hal_reset_security_engine and its one caller from
hal/hal_intf.c, and remove its declaration from include/hal_intf.h as
well. This is just a wrapper function that calls the function pointer
hal_reset_security_engine in struct hal_ops if it is set, which it never
is.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/hal/hal_intf.c     | 8 --------
 drivers/staging/r8188eu/include/hal_intf.h | 1 -
 2 files changed, 9 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index bcc77da06c08..06ee8ef69ce8 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -81,8 +81,6 @@ uint	 rtw_hal_init(struct adapter *adapt)
 
 		if (adapt->registrypriv.notch_filter == 1)
 			rtw_hal_notch_filter(adapt, 1);
-
-		rtw_hal_reset_security_engine(adapt);
 	} else {
 		adapt->hw_init_completed = false;
 		DBG_88E("rtw_hal_init: hal__init fail\n");
@@ -420,12 +418,6 @@ void rtw_hal_notch_filter(struct adapter *adapter, bool enable)
 		adapter->HalFunc.hal_notch_filter(adapter, enable);
 }
 
-void rtw_hal_reset_security_engine(struct adapter *adapter)
-{
-	if (adapter->HalFunc.hal_reset_security_engine)
-		adapter->HalFunc.hal_reset_security_engine(adapter);
-}
-
 c2h_id_filter rtw_hal_c2h_id_filter_ccx(struct adapter *adapter)
 {
 	return adapter->HalFunc.c2h_id_filter_ccx;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 5f6ef4d6333a..5612274dea4d 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -360,7 +360,6 @@ int rtw_hal_iol_cmd(struct adapter  *adapter, struct xmit_frame *xmit_frame,
 		    u32 max_wating_ms, u32 bndy_cnt);
 
 void rtw_hal_notch_filter(struct adapter *adapter, bool enable);
-void rtw_hal_reset_security_engine(struct adapter *adapter);
 
 c2h_id_filter rtw_hal_c2h_id_filter_ccx(struct adapter *adapter);
 void indicate_wx_scan_complete_event(struct adapter *padapter);
-- 
2.31.1


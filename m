Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17436346AFF
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 07:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770364525; cv=none; b=t0nNQ9aP8G3XeW9wzdM8eXVseFmLyee038gREJqpW0RoPlK4LxaNgX2LZc5l2zodlO/tpicphbERlYX+yD9HEGauBKFU1xKQXcmcxMzfizjR3GKEq0KeRiwiFIKqIRAtdd+s81U2qTbUwukffdsiMBg+8PdXffl38nY3+op0U+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770364525; c=relaxed/simple;
	bh=lg+pskYF45lEQ99xlfG3TAp1tr1CswxT5dN1EpwIcB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=snNbnUJtkQM+1deLVgpDoP42hZqksU7pn/Tg480+O8aZWMJLIIeLwiyJYtv6Hj+MqeAqqBYSrCNNzh9d7OBbdE99gZd/j3b1saW78/dD/FrhguLCAfJdep6ZKr7fUu1YH2b9hk49Pyfjhg3tYyTvVGfPZYVxyBXch6a3eUytaho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXYgV5gl; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXYgV5gl"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4359a316d89so1447568f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 23:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770364523; x=1770969323; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pa2zrDJa/oTe3oaHqMpK42PUD1ADblXYdEjjrc0tdg8=;
        b=SXYgV5gl8y6s6hYtac642jsmvTi7J958IF2WxjOm+5a+MbiXfMCmiFeF8ZjwAtVxTm
         ll0gas7pThLY34NDCXDMWkusKKrGOQdauZR7YlCpTiVmb58jkN5gj8+iNnZV6nWNL7Ft
         15tVkwYgeP5VJzO48+rFffhlQfWLWBHuSxjcd/q11qTO23JkXUMi5pLqEwEde/Mhl1eG
         z18hjJVNbUVD5RYRGhpQu0ygPKDgcelLSJywVmjp5GetZu3nKuK8yYSKRHcgNi+6Os3K
         lQ3w9ma+F4Xayg25gD+y/UKxTzlcugGjwowKqe7bUY7NB9LyxI0F+lCKdcHkvah6fZZM
         EAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770364523; x=1770969323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pa2zrDJa/oTe3oaHqMpK42PUD1ADblXYdEjjrc0tdg8=;
        b=mIqYpvUbBFgeUhTUvTougRSdHad+g5+Y+sK4hyTKx3arWLhBHWmRrTWfIMjHEce/CY
         HeG0+5PZZYfjl/d+AxI13h6d/E7M2ivFbMmejczywLF9YqtGujc95nyMEOGAEwTIORGr
         Yw6wZzKQenDQrQjPkbO5xIxjoimGL7llZ1Jyoiqpe/X5kgKnFxsFCeCi8wRYHAx539R6
         9kTM48zpxDlXVS2EMW3L/J7WtwYofsc7qnEEJ3n7/FECeG0RLM2wfIOIcq4kyB14ZnGe
         wgvaImSoykkt+LVhQONNsf3aFS2UW29pq/g5ViC29qZF8pDaivLpUdvKWwlsM8SiB2AR
         icTA==
X-Forwarded-Encrypted: i=1; AJvYcCW2zOmgO49i8hkx+m0y/SQyC9jAwVPvG1F/0NQeXOMfmTH+045vrFf6MEkDqvPiJvpsNLEuP3y4KEZB3czw@lists.linux.dev
X-Gm-Message-State: AOJu0YwZXCaVuC3vsAYkM4Ed94zaplmHOgw9IdyD+6QZKrpkYnE2pLL6
	/iXnjUuCf0DYBuVTLLcky80gOi9sIuKiofXvA9LTr/VVU0heaW2zOwHnmDFAsLI=
X-Gm-Gg: AZuq6aK0LL1X1Jsp5L7+LINEUmw6xoAU3Xzwk9KH7LtVS2S+xVwL1MVtRSPCAKDDn/Z
	YEhykR4s5iw4YSaJvezoG0eEqwfHccV2lTs++yuD4J0Nftiqy3om4WF9dVnl4dzIoRIPEwniWq7
	uQTgFLO7ZSC77vw66YhGU0EVnduyorsrACu002EjxN+0Fc9RMCZCZrkekX3bPsl52ZbPs4xpQ87
	z3JyP+R/oYsuLFjEwe5wLPu0Quwvcq4iw4PauvDIJITylDbA87XyLIfl0FslhrsKwmyJ4CQAil/
	/n+hX3E6WGsKn44NplLA/2sQasDyzbWqlBm5/PK8FQg5ojc0o+vKbpc7jCVXdnwIbVvXNhCg0xB
	dxkuPmsRi9GbEw5MFCEADcJRvC6qstPcdLt8KOxhglgFaoABDyBYVTnr+VT2ZKxG3ler0/540DS
	wav3s0ntCNRjKJLMYRhiyAyMyDoDAmRCgxYmJeWYXJ9iHkoHIlj/5R6HYAtym5Pp28igiqCTIRr
	w==
X-Received: by 2002:a05:6000:1ac7:b0:435:dd87:fc2d with SMTP id ffacd0b85a97d-4362937b4bfmr2959062f8f.45.1770364523377;
        Thu, 05 Feb 2026 23:55:23 -0800 (PST)
Received: from LGPC ([31.223.131.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd3b8sm3836039f8f.11.2026.02.05.23.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 23:55:22 -0800 (PST)
From: lukagejak5@gmail.com
X-Google-Original-From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v2 19/26] staging: rtl8723bs: core: fix various line length overflows
Date: Fri,  6 Feb 2026 08:54:32 +0100
Message-ID: <20260206075439.103287-20-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206075439.103287-1-luka.gejak@linux.dev>
References: <20260206075439.103287-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luka Gejak <luka.gejak@linux.dev>

Fix lines exceeding 100 characters in rtw_io.c, rtw_ioctl_set.c, and
rtw_pwrctrl.c to comply with kernel coding style.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/core/rtw_io.c        |  4 +++-
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 16 ++++++++++++----
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c   |  3 ++-
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index fe9f94001eed..9dd1b747acb9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -115,7 +115,9 @@ u32 rtw_write_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem)
 	return _write_port(pintfhdl, addr, cnt, pmem);
 }
 
-int rtw_init_io_priv(struct adapter *padapter, void (*set_intf_ops)(struct adapter *padapter, struct _io_ops *pops))
+int rtw_init_io_priv(struct adapter *padapter,
+		     void (*set_intf_ops)(struct adapter *padapter,
+					  struct _io_ops *pops))
 {
 	struct io_priv *piopriv = &padapter->iopriv;
 	struct intf_hdl *pintf = &piopriv->intf;
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 587a87fbffeb..f16e94b28448 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -174,7 +174,11 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
 						set_fwstate(pmlmepriv, WIFI_ADHOC_STATE);
 					}
 				} else {
-					goto release_mlme_lock;/* it means driver is in WIFI_ADHOC_MASTER_STATE, we needn't create bss again. */
+					/*
+					 * already in WIFI_ADHOC_MASTER_STATE,
+					 * no need to create bss again
+					 */
+					goto release_mlme_lock;
 				}
 			} else {
 				rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_JOINBSS, 1);
@@ -309,8 +313,9 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 			rtw_free_assoc_resources(padapter, 1);
 
 		if ((*pold_state == Ndis802_11Infrastructure) || (*pold_state == Ndis802_11IBSS)) {
+			/* clr Linked_state; issue dis-assoc_cmd already checked above */
 			if (check_fwstate(pmlmepriv, _FW_LINKED) == true)
-				rtw_indicate_disconnect(padapter); /* will clr Linked_state; before this function, we must have checked whether issue dis-assoc_cmd or not */
+				rtw_indicate_disconnect(padapter);
 		}
 
 		*pold_state = networktype;
@@ -365,7 +370,9 @@ u8 rtw_set_802_11_disassociate(struct adapter *padapter)
 	return true;
 }
 
-u8 rtw_set_802_11_bssid_list_scan(struct adapter *padapter, struct ndis_802_11_ssid *pssid, int ssid_max_num)
+u8 rtw_set_802_11_bssid_list_scan(struct adapter *padapter,
+				  struct ndis_802_11_ssid *pssid,
+				  int ssid_max_num)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	u8 res = true;
@@ -399,7 +406,8 @@ u8 rtw_set_802_11_bssid_list_scan(struct adapter *padapter, struct ndis_802_11_s
 	return res;
 }
 
-u8 rtw_set_802_11_authentication_mode(struct adapter *padapter, enum ndis_802_11_authentication_mode authmode)
+u8 rtw_set_802_11_authentication_mode(struct adapter *padapter,
+				      enum ndis_802_11_authentication_mode authmode)
 {
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 	int res;
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 0ef788abf403..405df520e5cc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -335,7 +335,8 @@ static u8 PS_RDY_CHECK(struct adapter *padapter)
 	return true;
 }
 
-void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_ant_mode, const char *msg)
+void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps,
+		     u8 bcn_ant_mode, const char *msg)
 {
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
 
-- 
2.52.0


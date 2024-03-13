Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4213DB9A;
	Wed, 13 Mar 2024 10:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710327515; cv=none; b=KzkXSBJE0UoxWerRMAOvYEBthjyCgljq4fykUwuyp2Am+Q+Rs+xcRnP1GDQ8roqpaAju4Cp5PRx0W3VI/Lq+otlbrfqv69QRq4Dka+Cw+htecvN22BI5Oi7lHD7hhtVVnOn+neP/J9WQNSIUndTO/EL1d9k8YxuukzLKTGjVFv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710327515; c=relaxed/simple;
	bh=GQzWZxCfHS0uKq1KU0iHmiPNc54xlpTgQpONYUeXORo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n2xW9UazYjDiMunPmDpDuoS2pleuJ3gPvIoY3eyzVdOvgyH1qcTb4PVBjf1dzzkyKJM56qGBOghaAhGbsOvBRjZ6g9bOFNyx/n8fVIkslAAAsXyeKlexhFl1wBPT2mOdC7EdPL0ZDLtJ83JK4Dh0YzCFWPnxIMHprEQQFUEE0d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nCBGQ7ga; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nCBGQ7ga"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33e82c720f8so6026712f8f.3;
        Wed, 13 Mar 2024 03:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710327511; x=1710932311; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IdUl28bu6wuHS6E18fGArN7xnZx8OvKOOgXrVCy3z4g=;
        b=nCBGQ7gaod/NOIsNYVAlTt7uPyKVCZ4nUG0yuIub1djEijVrsvfwovt7vf+HySYS4F
         ymiFLyJwbQdt5Lmsp9wLjs+gDihO987tNEXCmc0y6lEJmd3ZcjUpae4iqPcsgvDbhgWg
         LGHGQeArQqZY54aQs5Rn6hPXw9SVA+k0TXzwfK3YIY5/Dd0anFkgEz6wGxnFklZmv+tB
         vsipKi5vUnDeWBPSMvbaXzf7Az8Ygiusb/BSTbOFe7htmT+B3Ap3vcldDynglYLPIhzt
         VXHP+pbs4OtvDVgQrPMFye72SUSuNzYJnKop+wuqJZFkk8db4cMS0fgMJVMWXI0afv2j
         AaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710327511; x=1710932311;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IdUl28bu6wuHS6E18fGArN7xnZx8OvKOOgXrVCy3z4g=;
        b=BVY+xjVZ8dwAaPxXpDedS+amah5Lub+EarOS28lSKKNOJFgLy56v4lpM0ELCu50qN1
         fyGPcfUqtXlUqIjy7tfNnaCYsW18WzB9QSr80TF8DLlnH+ylV+YdT1E5Z+cewxL5dfrL
         3GEOu1qJFeHr5CmwdKcT03sWil1Uk61QUyHgqAMsnQMdZOGKiMeKHyNJc/ESBYlOO65G
         QLDJ2xww66orXs6ur15olpo0fMY2kq3r4QeiDMZ5FfED6xwPjxqzJe6ATSBodxYmkp+S
         xqkwyt893illfp6Do6ZESsPhG5LO1M4346SAkeJEgcGwGcgGwLDYLqN6fbguJcwkPfm8
         g1yw==
X-Forwarded-Encrypted: i=1; AJvYcCVAVwNgJLvefJPsBdV0WbIguEMrVy3HYKCjKI+I/LFYsZonuPcIHarY7ojpN5diAN+f8kSEuCQDmmKKSTUY/gzQwnFW/EQuXx314kR/wg==
X-Gm-Message-State: AOJu0YyEYGMRV64ByK6citiMbEOltr4mgzwLF3o1uzTMsvxXTXITyKbX
	RUHOdFufaOoDexwLwDWjPBQ7L162KP3T6y/06h6gaosk4xwlzuxzNcZKyiRQ9hFtrg==
X-Google-Smtp-Source: AGHT+IEB9UHcDIQ78guLQDf4AJj6xGqrC/YEpz8y0KYTa/Omd/1dnJn0o6WN5Cnnql4aLdNJ2NhtwQ==
X-Received: by 2002:a5d:6845:0:b0:33d:c3e6:109d with SMTP id o5-20020a5d6845000000b0033dc3e6109dmr1589334wrw.61.1710327510417;
        Wed, 13 Mar 2024 03:58:30 -0700 (PDT)
Received: from MOLeToid ([129.0.78.232])
        by smtp.gmail.com with ESMTPSA id d9-20020adf9c89000000b0033df46f70dbsm11597015wre.9.2024.03.13.03.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 03:58:30 -0700 (PDT)
Date: Wed, 13 Mar 2024 11:58:27 +0100
From: "Felix N. Kimbu" <felixkimbu1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: outreachy@lists.linux.dev
Subject: [PATCH] staging: wlan-ng: Rename 'wlan_unsetup' to 'wlan_teardown'
Message-ID: <ZfGG093fyjI4G/ci@MOLeToid>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename function identifier 'wlan_unsetup' to 'wlan_teardown' in files
p80211netdev.c, p80211netdev.h and prism2usb.c, a pairing function for
'wlan_setup' to match common kernel coding style.

Signed-off-by: Felix N. Kimbu <felixkimbu1@gmail.com>
---
 drivers/staging/wlan-ng/p80211netdev.c | 4 ++--
 drivers/staging/wlan-ng/p80211netdev.h | 2 +-
 drivers/staging/wlan-ng/prism2usb.c    | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/wlan-ng/p80211netdev.c b/drivers/staging/wlan-ng/p80211netdev.c
index 8634fc89a6c2..284c1c12e1d1 100644
--- a/drivers/staging/wlan-ng/p80211netdev.c
+++ b/drivers/staging/wlan-ng/p80211netdev.c
@@ -689,7 +689,7 @@ int wlan_setup(struct wlandevice *wlandev, struct device *physdev)
 }
 
 /*----------------------------------------------------------------
- * wlan_unsetup
+ * wlan_teardown
  *
  * This function is paired with the wlan_setup routine.  It should
  * be called after unregister_wlandev.  Basically, all it does is
@@ -708,7 +708,7 @@ int wlan_setup(struct wlandevice *wlandev, struct device *physdev)
  *	context of the kernel startup code.
  *----------------------------------------------------------------
  */
-void wlan_unsetup(struct wlandevice *wlandev)
+void wlan_teardown(struct wlandevice *wlandev)
 {
 	struct wireless_dev *wdev;
 
diff --git a/drivers/staging/wlan-ng/p80211netdev.h b/drivers/staging/wlan-ng/p80211netdev.h
index 485f2c697f5f..e3eefb67aae1 100644
--- a/drivers/staging/wlan-ng/p80211netdev.h
+++ b/drivers/staging/wlan-ng/p80211netdev.h
@@ -204,7 +204,7 @@ int wep_encrypt(struct wlandevice *wlandev, u8 *buf, u8 *dst, u32 len,
 		int keynum, u8 *iv, u8 *icv);
 
 int wlan_setup(struct wlandevice *wlandev, struct device *physdev);
-void wlan_unsetup(struct wlandevice *wlandev);
+void wlan_teardown(struct wlandevice *wlandev);
 int register_wlandev(struct wlandevice *wlandev);
 int unregister_wlandev(struct wlandevice *wlandev);
 void p80211netdev_rx(struct wlandevice *wlandev, struct sk_buff *skb);
diff --git a/drivers/staging/wlan-ng/prism2usb.c b/drivers/staging/wlan-ng/prism2usb.c
index 0e0ccef4871e..416127e5d713 100644
--- a/drivers/staging/wlan-ng/prism2usb.c
+++ b/drivers/staging/wlan-ng/prism2usb.c
@@ -128,7 +128,7 @@ static int prism2sta_probe_usb(struct usb_interface *interface,
 failed_register:
 	usb_put_dev(dev);
 failed_reset:
-	wlan_unsetup(wlandev);
+	wlan_teardown(wlandev);
 failed:
 	kfree(wlandev);
 	kfree(hw);
@@ -208,7 +208,7 @@ static void prism2sta_disconnect_usb(struct usb_interface *interface)
 
 		/* Unhook the wlandev */
 		unregister_wlandev(wlandev);
-		wlan_unsetup(wlandev);
+		wlan_teardown(wlandev);
 
 		usb_put_dev(hw->usb);
 
-- 
2.34.1


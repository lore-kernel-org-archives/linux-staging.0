Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9BE20B208
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 13:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729085930; cv=none; b=unKjPURlP2o28LgpmJYH5K3UDlBtEbq8tdEJRGymCIUEqKtxv1EmqxkC+0sz4C7y2zzLuIWjqHMXwSX9H9AWd6cW6hQMEPe5bPzAak8oNX9fCeyb2fnHW5nrwhT238Vr8SW2EpJZzMhLMXTzae04Nwj8gGcrWcDwv2UwL06XILY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729085930; c=relaxed/simple;
	bh=2iGGqAVBHJntRMHWX6jOevO8dBWQcGxKqwLVmWqYUmg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Lo3YxQXF2laSH0+khGJvijpHkbe5BFAog/Bnxx2+vU+588b6CZ8XePH4GNrQgUZO0iXkNyAe5Od56ReaUbouA+GKYMX986qraEUiQktFEpmbrh6kYbak9iQF2JwlcEAJDsObYODR3EhtjpSjJeLs0V/C7MbwE6Uy/2x49Cn4ZC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9slBTER; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9slBTER"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43117ed8adbso75521655e9.2
        for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 06:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729085927; x=1729690727; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hmD6BPFZpejVOP036PkGm6Ii4/AqtCue8JTUJjawmM=;
        b=K9slBTERe6LiWJL1tEQyAGXszhRcpGJhNMKqc49hPdUAA5q41yDsF0Q40LCBRiGkoA
         Vll4G92UAlkkJ8pbaM4Ov3B4g+RAe98BeNmOmDyX+ZA+ZYxfcZ9W/JWcqm0ETea8r2DI
         JRnRjOVcSDnbwuhUSF7b5URTHuCbrSoZF/r8K/5IrB2dEi9TvUvSJqEaigsC6vFSm33r
         N8c2nGUhX1LYNvGRPb7BtYV5mfyxwBLwopiBWDjEIBGMOqCta0DoL91GtqHl2Sx1CdmE
         yZ6RaNI1uR53jeIdsoZA6cPfqrB++Ess5QXT/CU/fhfkLmDo21n89WH3/bv3d28Xvvu+
         ffFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729085927; x=1729690727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1hmD6BPFZpejVOP036PkGm6Ii4/AqtCue8JTUJjawmM=;
        b=UWdS311dpHuxZlL8yi8FwmNSyBVlTO3Y4jb2UfckSEc85Kv+Sqm2UeIhyNRJa8cRH/
         HhbdkS4FTIXPc1Xlk0eNUYW6PjG+BLCUaKCwo655R6Wn8M36SN/MKnu0yo1DxtBh55tk
         HBd73MeDpWYRejhWi6uuzPoby4D+OaChydPMMUIxSXc8L+Lk9qfD/+kLwLQMl8YfX99/
         gVpYol1FpsR+Tok5NXgqaT3niYOAXFYqyh0WeFS/NYBsYDi8BjaSUo2b0LXDc8zSp6P1
         TkwHFHNmeLg4ErBfh9C2lhG+Syqu360HwgsvLiDm+qM5bUIMv+oCI/5jDRgzA+ji/8pU
         WLgg==
X-Gm-Message-State: AOJu0Yw35wB6WCZ0IH9b91f7GVwbIfvAyEASaxcNjr1PKPE0psJvh8CS
	dzGX+LODhIS4jEie5E+5k1Nln6uDLEAWwsNBmmlAJCPL3uMuw8XR
X-Google-Smtp-Source: AGHT+IHySe/27C9cQj9adSB0NBDFQwVCsUdqClwj5RQnuO5bRhSbExShHakKC07Kqv6UrMSk68XKew==
X-Received: by 2002:a05:600c:314c:b0:431:4847:47c0 with SMTP id 5b1f17b1804b1-43148474899mr53342475e9.7.1729085926748;
        Wed, 16 Oct 2024 06:38:46 -0700 (PDT)
Received: from ARL1114-LINUX.. ([196.233.5.237])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f6c5524sm49415035e9.44.2024.10.16.06.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 06:38:46 -0700 (PDT)
From: Aymen Khalfa <a.khalfa.1012@gmail.com>
To: gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Cc: linux-staging@lists.linux.dev,
	Aymen Khalfa <a.khalfa.1012@gmail.com>
Subject: [PATCH v2 3/4] drivers: staging: rtl8723bs: Fix missing blank line after declaration coding style issue.
Date: Wed, 16 Oct 2024 15:38:29 +0200
Message-Id: <20241016133830.2485315-4-a.khalfa.1012@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016133830.2485315-1-a.khalfa.1012@gmail.com>
References: <20241016133830.2485315-1-a.khalfa.1012@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Add a blank line after declaring struct.

Signed-off-by: Aymen Khalfa <a.khalfa.1012@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 56a85174965c..cc4d08ce1d2e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -1011,6 +1011,7 @@ void rtw_free_pwrctrl_priv(struct adapter *adapter)
 inline void rtw_set_ips_deny(struct adapter *padapter, u32 ms)
 {
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
+
 	pwrpriv->ips_deny_time = jiffies + msecs_to_jiffies(ms);
 }
 
-- 
2.34.1


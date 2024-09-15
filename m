Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B612209F
	for <linux-staging@lists.linux.dev>; Sun, 15 Sep 2024 06:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726382462; cv=none; b=eSPD4pD6efLUvqmnC+B55Yh/drs5fv6NvFVpk2TQg7bb9KQpYLvFJfHp4FNaalUcEPvj+F7350Lioo/Op6ULi0+9vMteN7VjFYZI52l2MEZCDyEgJTqyfzo6TAGzQ6/01UiF9c7TB88zI/Nf+X3N4Ba4PlPw9G/xDMB6DtYQ6eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726382462; c=relaxed/simple;
	bh=L4ckoOgEcriXUQL/QwBl2nPhAj6DntXw9Idi22OGWEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gXnzjvlzQCGYC5INFonS/U4VQHSpoa33pws6cmrniF+ZuU6O9C0MiekdVnxhXWH7pvQPTHYk7yHW3ImGMgDkhZT7Q2M1wLu+sMy61toRT9+Jg1PI/Uoopp17hxjDwOZEfqk/BWJShNb5usGWre/yRndn+ipbCtkObMKMyXwexqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iwWG7KG9; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iwWG7KG9"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a8d2b24b7a8so821628366b.1
        for <linux-staging@lists.linux.dev>; Sat, 14 Sep 2024 23:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726382459; x=1726987259; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4ZygK0P53MPJenBWV9IM3wiIoWtojdoXnHHdWub24s=;
        b=iwWG7KG9aocYQtVOzAmGP/b2pKlov/HZnSefojZrreT8t6u3wVjSdWN4je1q3W3eir
         bfEOSgpmj0gWGZtjysUys8Rf5Er42frv7OS5tQhbdsGrUm1MpelZcS1zglD0lqXgTF9q
         A4Eq/YzNgIjqCTSqkabttdk3eAXceB0Upo9wTyD859Clqb1xpedeBIJ93FdcWY9Q3qRR
         8A1QBxuHi5w96bfQcHNNp5w8sLL6Psi361cnI8Sk4qT58i9+wkdKAMlYi163coY5Grn9
         GapLOHuwWszNjs2tgclwOiWBcn1yOWh/t49zQYS7FAqFKWHVSRNG0RJZfVSC/RhQLFee
         jDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726382459; x=1726987259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l4ZygK0P53MPJenBWV9IM3wiIoWtojdoXnHHdWub24s=;
        b=kZLWRCfFqAxQNc4jJ/zZQWLUi6p/pQURJa34KdljFSZQ+jvrzXiYLR47UdDuzBNExS
         v1qQErMI8ouLsMa94vKnnNPhfKaUbSU21M80CB1EC2T9HUKd1xD2hOWChJVVmqVXDDLE
         ZuGTjecvMewGCOVW5eaLbkTyqn1yjlbqwz4878ApYwD0a/Lwv02spMAxbYfO/i2pR/5G
         EaM3hjRF3Q79AzAkTiy6Xn1K+V21bgC75/IE5Lo3ix3A5cA9RGAZtcKYqyCMZlS1yxbN
         YoSwHcTZU8dDFLxPy7BcfpU/NUMvj+Wq1V2WlbQNvQ++mcC59rMSvT9NvCaR7PwxpqMb
         lskw==
X-Forwarded-Encrypted: i=1; AJvYcCWGPTDLk+SgJvABLREhIuCBsT33/VgsZDdpr36ovJdx54O9eAg2z3UhQCIkcmtFwX/JBShnCkzZu3G+7nVl@lists.linux.dev
X-Gm-Message-State: AOJu0YyM+2BXnz2tE/4Ibem3hNcff8A6aYchS/68d9Dnvn3UhrBG7fsf
	4+nL5cBpHUlYZ5eb9+cWJ5e3JByOL2V/dMi9yJopnTEbILAHUYyJ
X-Google-Smtp-Source: AGHT+IG+uxlo7sFJ2vaJ7TVX2coDVGQhTxMRdW6BBaBH6eaD1KrSN6tp27pyrtkLpdwgT042uKGnkg==
X-Received: by 2002:a17:906:7951:b0:a8d:481a:563a with SMTP id a640c23a62f3a-a8ffae040c5mr1829070466b.25.1726382459156;
        Sat, 14 Sep 2024 23:40:59 -0700 (PDT)
Received: from kernel-710.speedport.ip (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610967bbsm160201066b.8.2024.09.14.23.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 23:40:58 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 03/17] staging: rtl8723bs: Remove unused function read_cam
Date: Sun, 15 Sep 2024 08:38:17 +0200
Message-ID: <a4d6cce804f23d4ac8267a572d168356bc7e84ed.1726339782.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1726339782.git.philipp.g.hortmann@gmail.com>
References: <cover.1726339782.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused function read_cam.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c   | 13 -------------
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h |  2 --
 2 files changed, 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index cd62ea47577c..85215838a004 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -460,19 +460,6 @@ static u32 _ReadCAM(struct adapter *padapter, u32 addr)
 	return rtw_read32(padapter, REG_CAMREAD);
 }
 
-void read_cam(struct adapter *padapter, u8 entry, u8 *get_key)
-{
-	u32 j, addr, cmd;
-
-	addr = entry << 3;
-
-	for (j = 0; j < 6; j++) {
-		cmd = _ReadCAM(padapter, addr+j);
-		if (j > 1) /* get key from cam */
-			memcpy(get_key+(j-2)*4, &cmd, 4);
-	}
-}
-
 void _write_cam(struct adapter *padapter, u8 entry, u16 ctrl, u8 *mac, u8 *key)
 {
 	unsigned int i, val, addr;
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 82709ffc7bad..ba39435d1a10 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -459,8 +459,6 @@ void r8723bs_select_channel(struct adapter *padapter, unsigned char channel);
 
 unsigned int decide_wait_for_beacon_timeout(unsigned int bcn_interval);
 
-void read_cam(struct adapter *padapter, u8 entry, u8 *get_key);
-
 /* modify HW only */
 void _write_cam(struct adapter *padapter, u8 entry, u16 ctrl, u8 *mac, u8 *key);
 void _clear_cam_entry(struct adapter *padapter, u8 entry);
-- 
2.43.0


Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D6D310763
	for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 17:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776532197; cv=none; b=lwf77z+35z+BZCdv9vHDH5blsczAXKQLII5z2yiA81X7tEL/Wy2StTMQtSvw/2uHgARRmNaS1jXpqfA+Ndzu6t2P5vmEK7ShvQJog1/mMQ6Dk2PIA2Tz+IvbK58/f6CKWPa5HaseJKPs52g2eIsycQWynqJLSGz65WRCmBIetMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776532197; c=relaxed/simple;
	bh=qAghfy+emkG7KBIZHTiOhbYhf2hfKMFMzJfyGZMPft8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nHJi7mlIeC42/cdSoJtxZkSCFMowEmRa30QRi3RubcX6Qc65/+lgx/xYOkhbhI/d2eUdI3RDRpx69wJdnEDmZ75r8FgrgjrTDxiQoxy+yNaSA5ldaAVDuHYhG/I+JvBnFcv0/MCllv8XRc3nCLY6tw/+gDeukeNKUGmTfX0W0yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxAUoxwR; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bxAUoxwR"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35e576110adso1177887a91.0
        for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 10:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776532195; x=1777136995; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nS0ahebg0fRohy7Is9VdVoNNNMpf1PsIvfgHa7dGZaE=;
        b=bxAUoxwRmyu8V6QaTVuqNqx5ymgSRh8ggRTmft8oHicsSCI2kJLyLQ5KzD4sh/bXCK
         eYz2sYCmIkCWtJPs+AtTXykdRzTKdt+zD18cUA0e7NW0CHqE2KZMD+KFDYpQhYTiXWNe
         CVM/GovxGb+25Q+xJc+F8pOKdSn5blE0IpiqqJ/nrbMnF7rZqQGGSk5SGKUlk1AKWklC
         lT0rY801kZR/Z1tBtEzGCebVJt17LX7RRzEci4gYFdbRdp08zftbDkxCqIklWPvrfzCS
         R6EI8aBgNMLYc9b5Q4+6qSLkGpfHmeEl70oR4qWPCB2Yvk3k5gkM7jrswU+c8fxuxmsU
         fYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776532195; x=1777136995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nS0ahebg0fRohy7Is9VdVoNNNMpf1PsIvfgHa7dGZaE=;
        b=EnTHgmCTEWPDSz6DURx2ICgsAL2GV8O1p87eBGOXGCWcLVOngTqnZ2zNY5v8AnaFaJ
         h/bCFHXJ2ux6V22Wu9/MYhmEZkOjXp1f2wXVBHfqa5+0ZR4QvSgWvmnqC6T8hcW+0rAf
         02kDACbIwZRQMXTC8gxZtsEiKsCEciG5uzRKMIViGk94ffD3+KzKfQmpuvJP5t8h+fSW
         /cfx68mNsOfiWE5DutSZ8thWVssDg8IjjSzaHg9kfQcG/2VXDUXTn0frmfufbH5ZMMNC
         jicpiy/i+tOqjJvkRsX5T+tdhRMWcp0V6ATJ4Hw7CB4MscT7IsuJG49DqS3l/gPGEk2C
         CsNw==
X-Gm-Message-State: AOJu0YwBk7CEiDaCIURYmTAFYfw6+Vmqc7ok/by5tv7iyM+C228BrkDf
	d5ayrAikckeQ3KCYlyadsRqONPPF5bPw5jQImsO3bLts6UuzO16m61AM
X-Gm-Gg: AeBDievUPFfaPsSQ40dDKuSXgLFfKuX/kQZ7HPq1m6/GxlhxwzlBpzrCHU64aIxcaQR
	Zh8PxhRY0PngemE07z3hnCcM3CcFcrJHm2uje0lp6d+bkNU7NiBn4EzIbqXAWDyLZ+5uZX+tORY
	FzR81C1dHIstoXr+PO1/+1BM0bCyWRHQel180Zbp+D37Qx2cZJ3Qkqm1//mUFSBVhb8c2qVu3QH
	IlMVlihEZVifT61GzEjF1gOMXm873giGPhXwDYs2c3x4QFAegoCbaf5TzrwYZC9MsG+HnzN8nL1
	ece3WKX3UKAVsJDZE8FlpnD7bF3P/pYoGVd4j8FAnXc8ixAkIlSQFw0ecDjgaippFOKdLfu0Tnn
	cWQHhsSbGMq3A5c7mbo/X774nvxs5X0s1iPYYXyVoTQUd7JY9u32zKuusiOyx9cLhB1C6oI5YMc
	LdlkLSbI60HzD49RjGXMpjwc1U1bPEPnKJsXQEOSjRqCDbzPYKwB6G5Ove6gAJetL6TWtrokuEF
	yC0jQg6h6eZtXesFkCr7ZCHSz8z2mWGAQ==
X-Received: by 2002:a17:90b:380c:b0:35f:bc9f:e1b6 with SMTP id 98e67ed59e1d1-3613ffce9b0mr5989915a91.1.1776532195295;
        Sat, 18 Apr 2026 10:09:55 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.114.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361418c3944sm7073844a91.8.2026.04.18.10.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 10:09:54 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: gregkh@linuxfoundation.org,
	ethantidmore06@gmail.com,
	straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	samasth.norway.ananda@oracle.com,
	vcaron@bearstech.com,
	adrishbora@gmail.com,
	ofirmirovsky@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH] staging: rtl8723bs: os_dep: remove redundant else in rtw_dev_unload
Date: Sat, 18 Apr 2026 22:39:06 +0530
Message-ID: <20260418170908.16257-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unnecessary else block following a break
statment to simplify the control flow and improve
code readability.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 29939bf5a156..3207d6d2c727 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -988,12 +988,10 @@ void rtw_dev_unload(struct adapter *padapter)
 			rtw_stop_drv_threads(padapter);
 
 		while (atomic_read(&pcmdpriv->cmdthd_running)) {
-			if (cnt > 5) {
+			if (cnt > 5)
 				break;
-			} else {
-				cnt++;
-				msleep(10);
-			}
+			cnt++;
+			msleep(10);
 		}
 
 		/* check the status of IPS */
-- 
2.43.0


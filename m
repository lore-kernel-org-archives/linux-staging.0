Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B0C39C64C
	for <linux-staging@lists.linux.dev>; Sat,  9 May 2026 09:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778319717; cv=none; b=P6RPuCL4x9fMkqPsPKKMTaK+5GdS7KG/is/S5dA+kAb3aNP7WzN84AVehVXZSzlyY5joZ0YJjatSJSdWXtw7Mb4JUQWeSAhKtrLgr/iEFKg4tRJBP9ooN3+2q0imsnVNfDzZOWk8RF06EHoZtg0xN6S1ElRNOEKqXz5ppMIOxb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778319717; c=relaxed/simple;
	bh=IJ1KKGW6saFdEihjKlHQbh/SsVofp9AocS91sxhh+Sw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ek8NMwzS4rhyBncXCCvDkrPcWJGMoxaLRksdfzhElRgWdP73gIX1+ecV5GPKl3NZ/SuQAvMXbGI5kARUoZTqP570SQVqmC7je6pGcjUowkFVww5jX0C3Te/XtaUW63J3bVvdIGkraeON4WT1lTKLZDsX8mVtTy9z70s1tEZazfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yp1J5Wyl; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yp1J5Wyl"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36608b2f2dcso1811478a91.2
        for <linux-staging@lists.linux.dev>; Sat, 09 May 2026 02:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778319715; x=1778924515; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SLzZzFztxH/Et8BDGHx0o2S49BECr2qFJA2Mw4eLEfM=;
        b=Yp1J5WylSNyzzZzksyEYot7xpZFgauZhXlnHHdRMxA33TFuP8+dcYKIlwXDj6EcMd/
         PbEhyDUakOpovUkku5fiSKhYKjv/obtACz3deTfkqZxI4IIrSUdJnVQ1BCmxuZxmTCPG
         P6ol7og0C6z6fGd4LMRWaED0yiyQGER8xhMbP9k+mDbXddeljXF48/wUBTTqpWsNBuGM
         dI7gTFobZUStpIwOQv0LonMwhTSByE0oYNAwdOyO9r1r/0BTWD2DX1gPYfoPMHzQ0xtk
         cE7bQv7HKsJsAKesbdsDO4di69mX5E99Tr9HI3fn6+NUpdLKtahinGVpkbsTZYWc+IAs
         0wwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778319715; x=1778924515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLzZzFztxH/Et8BDGHx0o2S49BECr2qFJA2Mw4eLEfM=;
        b=omdjP+mSdMa0TeF0f1usR/zy+W/rG81i/S/pDdCK5RDejKCb/bwtiD6tX9wygy0I/h
         +/l6EPxOnOHYtcdshMd8fSBNnZk0FH6CQ8IsQEl7WLDmmmRxYcc0Nd5s/hQKUVZ9QWeA
         ZG+SuJS/oXrzBjuD/hRNQ3RjyO5wdp0tMD7dqnpO0jNpyymqr/9KyYk+8rILuKeBeVM8
         w0huUInb013wtfUHzuS8HXovUY53QIqmFFkXc9Np1X10TPofjXCFQ33b3zdC4kMd6yYi
         atmv+SAnu8grLP0KbwH9mPn38ZYS8CeB30FtUA7W1yIooscsNnPRV0HHZgmP9sfxFSbD
         VTSg==
X-Forwarded-Encrypted: i=1; AFNElJ+ElAvcAmvZ9MFBCMS6WnfW6YlRlpuC/xcPZ/OG5/05+dDqolKXlvhL2Mvy1xl339psmrNbWwNJ+cswBt4u@lists.linux.dev
X-Gm-Message-State: AOJu0YyN3ApKTh8ekp+YRvOd/lmywUsy70W3K72pdkxhggUv9Ovzubuz
	cM/Y0Q7JE1KP7pqTEdy1j5byjTt7097floVMHlfL93J2QbuYjUplA9aY
X-Gm-Gg: Acq92OFlAY+UvwdW8FoNUyliLcgvRPqsoO+wed9SDnXraXHCrwkr92ryVDZVHL3bxhm
	TxPo46zHRlncFB6htlm+Ln8hD+GzQ6/cuU1WoYE1ZHYfJmEQAOMnSbqMOBQS6to4dLCgDEDiUHM
	7sy4CCMPod1OupLxKTOPszPHrGemnOsCsJPpOLCVqWOYiYoVkBn3Q283PaiJ4NpJEllUZY6nkb4
	qrayFWxWapdBgQ/pmN4kpdeOxES9Nqf8HgSHaQqrttNORZUFg2Z1r+8dMXubLjvVyN5QZYc3Cum
	PCPnpZWqHZvTKylDryz7EnbhsSZwgHG5dpVa8Nmoq0j2e3KxSEu2+bf+AHgL+nZI3GJHmJCxMYn
	tNqDUypbGQr3mwBQ6PaP3YgPVcd1IK8GJ5fk0cC7aTSAEj0CAQ1GZPjaCj000viR35mUHiuklBj
	6WKab9fREPXlihEg+lPDBJh5nsw0w=
X-Received: by 2002:a17:90b:3bc8:b0:35f:b3fe:18dc with SMTP id 98e67ed59e1d1-365ac47ab2fmr16754357a91.19.1778319714985;
        Sat, 09 May 2026 02:41:54 -0700 (PDT)
Received: from sridhar.. ([2405:201:c034:9078:b86e:bb57:a91:e02a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d629b446sm2078699a91.5.2026.05.09.02.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 02:41:54 -0700 (PDT)
From: Sridhar Arra <sridhar.arra.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sridhar Arra <sridhar.arra.dev@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace msleep with usleep_range for 1ms delay
Date: Sat,  9 May 2026 15:10:59 +0530
Message-Id: <20260509094059.22101-1-sridhar.arra.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The checkpatch.pl tool warns that msleep() for values less than 20ms
can be inaccurate and oversleep. This patch converts the 1ms msleep
to usleep_range(1000, 2000) to ensure more precise timing in the
power control path.

Signed-off-by: Sridhar Arra <sridhar.arra.dev@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index f074ea6e0f38..cdbdcb7bde32 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -414,7 +414,7 @@ s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 			err = -1;
 			break;
 		}
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 
 	return err;
@@ -567,7 +567,7 @@ void LPS_Leave_check(struct adapter *padapter)
 		if (jiffies_to_msecs(jiffies - start_time) > 100)
 			break;
 
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 }
 
-- 
2.34.1


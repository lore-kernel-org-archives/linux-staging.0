Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBC32417DE
	for <linux-staging@lists.linux.dev>; Sun, 28 Jun 2026 19:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782676512; cv=none; b=hGoC15cM/4E8Z7jEUPVnvPsnXr5+C4i4uD1Ln1lV53BApVZ65pxobRrEgC82CR3NjznA0Guk1K/hnATITajTUARgeXFUEQqcKte7dPGyzL+ZBhZzhzRPwfuNv84Do3/SRtAIF2EzkxC/eyb1urkE0s+enorRWH6qo92wDfgZCEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782676512; c=relaxed/simple;
	bh=SFNXT43ub/Phw6BMdFu4K8ryaufewQYmqKN22NrsTpE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TG3lCDTvpCBGnExMA12SZyZ+ePTHysF1DVSLBqduX3HSHOWKHXG0O2C/Z1gS5h3XaF2pIjc9EeDY+cfA5zmH9iIvS3HXOAIdsyG65ljUlAFpyApGluDuIzQPFwVZvkxdMI+/li0iXGTDG32vOJoa1X77uuvyXnRbK14+DwhJ/tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/e/vILg; arc=none smtp.client-ip=209.85.208.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/e/vILg"
Received: by mail-lj1-f196.google.com with SMTP id 38308e7fff4ca-39adb9a103aso17508301fa.3
        for <linux-staging@lists.linux.dev>; Sun, 28 Jun 2026 12:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782676509; x=1783281309; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rn3JavDmWzOKOlBSsGVAqhj2DsfKIH4zSOkpZo9NHv4=;
        b=k/e/vILg+HEAXQ0dmTi6wmjGcC3eZRaDy0In6PxbjPnzHORmytBrmddvQlsnH928KV
         6veaOefetbIFAv8GQ61hagupghOr7ggmUtsKBSxFOeByICQM/pvAABlY7SmVPg6ACvmH
         DNzPKGqVDf0bonLgaksbjIWwZ2m8UTCTzmhrddvDjuuxZLCfzdlxO1JJnoywvQe9+roc
         AsmqczAaVdPStWwL9cIXmp/ylb4h3U8TSs6takPv+9GgNzU6uh8HMpfmYv1AUL+IKhR2
         JM76VAlUPyyBT3mEbzNhUZUAMAAoSoP81mrRaIaas8Dn39CIs8PUXE3vCA5Zrsq/cYPl
         YQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782676509; x=1783281309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rn3JavDmWzOKOlBSsGVAqhj2DsfKIH4zSOkpZo9NHv4=;
        b=Iu/AiDa6wK38EGxoXUWgpuuDzu001JzukkGQ5M8FmOzWA6rMH+Z1sM8o2UP9a0M3rH
         lL4nbtnd+/4d5agWCRw/iKcFXN3y6WfNfY4IGJzGhl7eNkzrvuxMsAEWOE4Z3bT2qs4e
         tmEyQ79pjfiLRc0fwQKb1GydzWf6VAzKuIPAVD8moBo6IAPlWSYcJ0ijNe0BzuLMjYLm
         n9kG+sBtPM1/2R2obd1P2797C9Wvqku51wcd7bBMMACDZXskVVT/095wNyYhY5S42yH+
         GQDYqpopcfpNV8Mcd8e+BuskkQ9SY0YGUmDNXJQ7b3NadXE1lMEegoaOL018mMixx1rg
         iaZg==
X-Gm-Message-State: AOJu0Ywu5xeTCnI8VMIX+aca63IffY69FSVpa1ya69t3Z1cEc/STVWT1
	UFr840JZ0t867/I/43qkKUf8nY9CPVAz2CCtvndcD4c79f7Bzgp18l6MajUELNdT3Gek6A==
X-Gm-Gg: AfdE7clh4aSJCgydf97f3NQbonaNWAP9x5YdBL/gkSNB5iLcwfX1gmjuQH+viOsX5By
	Z7j7U2Mr6puevGPBh1MtwFKsZCSA9PCLJLtM7vn3bIjGPX006DHU6l2A5MH9mLcarcVAvCPWkr9
	6rU1/G1JudHLOGPVBWddR/PjHbUKfysW5gJEJqRHm6HSI6ceW/9FkhEyiBPM1PyNYWdR99Q4W5b
	VH8MCdairwBrCM/5zUERK1ua9CVTf4KdfzCEWQljWmpLTkds6jGvfOfN5e7I3nc2IhCJxlLnitP
	bZXo1ccYwWmWTPFNzzaQ+a7feXBDagMO/i97ICiq3zVQYXnzFQzGZcXNH0CsQ1OzJVIWxqBQX92
	V73RrIbJra4ni8gEwJ3IFjwB/ck0ZutL/+A9nSTpICq7a4/jt5bFNO+sL6w2w8qCDLD1jjXr+hR
	IzQnFd85YcwCqfx/E1
X-Received: by 2002:a2e:a99a:0:b0:39a:fd1e:6529 with SMTP id 38308e7fff4ca-39afd1e68a6mr6865421fa.26.1782676508430;
        Sun, 28 Jun 2026 12:55:08 -0700 (PDT)
Received: from myhost.localdomain ([89.253.43.146])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ad317dfc3sm30104351fa.31.2026.06.28.12.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 12:55:08 -0700 (PDT)
From: Ruziev Miraly <miraly.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev
Subject: [PATCH] staging: rtl8723bs: fix msleep warning in core
Date: Mon, 29 Jun 2026 00:54:40 +0500
Message-ID: <20260628195440.57986-1-miraly.dev@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function description of msleep() states that msleep < 20ms can sleep
for up to 20ms. In LPS_RF_ON_check(), replacing msleep(1) with
usleep_range(1000, 2000) allows for more precise polling of the hardware
state without forcing the kernel thread to sleep for excessive periods.

Signed-off-by: Ruziev Miraly <miraly.dev@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index b9f8cf101..262c5448b 100644
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
+		musleep_range(1000, 2000);
 	}
 }
 
-- 
2.54.0


Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB1C2820A0
	for <linux-staging@lists.linux.dev>; Sun,  8 Mar 2026 21:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773006989; cv=none; b=Vm8gJWqsOfPUElKaT2R/C+I0GiGa3LWizzVSeXU9Qv+fobBKfFJgOUB4gqz17owvHfwr2dvbyAZx6z3k0+AgSpAni7uy4ShEBl75VCAsIL+IQykS8v4V08unESQAblTh/D5DBlqTmCGV41G4F+WOrtUhb3IGYGCyJmIXu4X3Afo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773006989; c=relaxed/simple;
	bh=sAmIp7Tx27Q8L0ZLh6tlSt5GAjCilb6siI/5Z7EWBII=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bFZesI/RWId2MaGN67yevjd+Z0EJw1JvQRp8a8xxTALl1Fqs5eMkicUPcmBd0UhegIVr67sC00U43Nc0xzYFdU9Q2FCRq9Q+ODrkfggSyWaPF1kaoimAsqUNXNdMS48mAfXEURwPjbIRlUGGpEaOThNyGIAWakRTbI4zHoUd4Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VezPCP8X; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VezPCP8X"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-128d7db88b9so171348c88.0
        for <linux-staging@lists.linux.dev>; Sun, 08 Mar 2026 14:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773006988; x=1773611788; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LRVuhn8AKvbL1BzBOz/lrTvPhUeYUHTr/4WG0dctf58=;
        b=VezPCP8XLR42qXGAffLqqY7d+FeQpNu6/ytGd7fpU6AmUykmsxZpjzMTk4d7huH4HI
         /ylN+NAAenAWYQFJVJqOkb2GvW5HZ7MbvPeQLQcJcpLKFPyLfAOiQtZJ4/wt/H462cVL
         NsWhPaS8LVg9fSDw3hELk60+pnitJG6osFK9EcS2ottRFpD6ul2XgmaYes6dzNXgIHhE
         FmqF+Ze5mkt1jpEayoQS57JD/QKQOOJZ9qFmxpOtScVhCky5ow/BizqhvN+BjA/t/n4e
         3OEqXMdto59vsrJgaOOZk5rApmMFaNQldY8oCbz7ROzyi7htFnzZNYP2uQyyplMXiNTh
         9GwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773006988; x=1773611788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LRVuhn8AKvbL1BzBOz/lrTvPhUeYUHTr/4WG0dctf58=;
        b=NqmKqVUINDDO8EmS+YzOe+ERH2hxVWUwFW7JaJMEuszdEeO+O8jGGQOjFobVJtRSv2
         DCuM6R9MN/OFDF95iPEjTBL5j0W5gwdgr9rXSCv6+6K1/zgZad/r0fQwmHJ1Zw6I3UqT
         BQkw93SPlWQ2u1B57ntcuEG4AlMBxaB3+QD+zrbbxallkjGUI8qko+ULsi9UO1r6uCZz
         Q4POzHw9MV3eLaUJ6ka7D7U6UXKhAmI8DZ4jm0ACtOHHVrjYwNQhPaxwyupdD5v4ovZ6
         F3/kyKjI0E5WqP919f6cKlx6r3K5VGiKIMKvhYb5nTSUs5TLVcqqe61vumcec+02bxJN
         ql/g==
X-Gm-Message-State: AOJu0Yx4tBgvuNwBdvaqa9YjLu4eGx+sJq9fnbQ2hEiaHNxKjjEdHefr
	JRolaly7HxLZ7/KUWPeYxXrOTOZTkTBFdzLjeHLuHOiOzAgRR5COuk4M
X-Gm-Gg: ATEYQzxFZeZrPdbwY7gMp1uNr0i6j3ISJytegZsWNo4eAxB79t3FRsnNUttebBSoVSn
	2GHOJulPAcuuZ1L8SHvcy/71NWmgAXdVPYlS2PJkRPBc74rd7HzlIQ8ftyoMMSN6OM2FpkM2t2k
	gNon9VLTHe1gMJ+q0hnlLdopNUbkWACHdtK1pfkNrHBx36xg06qzUq2ByGFTHChFbuf/QKx1DmS
	7sxkUXKLg/cao/H1agMiI/TdttwvrZxFuPV/sAeC7yrGpdPv03CLJjuWjUqaJfy5waTAo5zEmt2
	YZCoAHHXXrHtTy7wxiJPzjaty11oEdf6hy4P0hNVJxKB8ve6Xwf4XB6roAoBOVCcTxf4lPFo8fZ
	EYQL6+s+DRRArWoAOG2DfLxb/Vvv6aw8Ntld5lInLQCeIRu85KEYAJQ8hEHJ8DudLR04ChL4foD
	RGqEvH9UsgV0xk+N0cNrxHRcOBaY8F2alp4pBBN5bCUnw=
X-Received: by 2002:a05:7022:504:b0:127:148b:3fcc with SMTP id a92af1059eb24-128c2dd1cecmr3676435c88.8.1773006987582;
        Sun, 08 Mar 2026 14:56:27 -0700 (PDT)
Received: from localhost.localdomain ([2804:d59:7f1c:1e00:6632:a8ff:fea4:c8d3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128c3d7a001sm6089062c88.8.2026.03.08.14.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 14:56:27 -0700 (PDT)
From: Gustavo Arantes <dev.gustavoa@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gustavo Arantes <dev.gustavoa@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace msleep with usleep_range in rtw_dev_unload
Date: Sun,  8 Mar 2026 18:56:19 -0300
Message-ID: <20260308215619.608685-1-dev.gustavoa@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace msleep(10) with usleep_range(10000, 20000) in the command thread
shutdown loop in rtw_dev_unload(), since msleep() for values less than
20ms may not in fact sleep for the intended duration and will often
sleep for up to 20ms, as documented in
Documentation/timers/timers-howto.rst.

Also remove the unnecessary else branch after break and the associated
if braces to simplify the loop.

Signed-off-by: Gustavo Arantes <dev.gustavoa@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index f2d64b05debb..b5fac9ebc3c7 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -986,12 +986,11 @@ void rtw_dev_unload(struct adapter *padapter)
 			rtw_stop_drv_threads(padapter);
 
 		while (atomic_read(&pcmdpriv->cmdthd_running)) {
-			if (cnt > 5) {
+			if (cnt > 5)
 				break;
-			} else {
-				cnt++;
-				msleep(10);
-			}
+
+			cnt++;
+			usleep_range(10000, 20000);
 		}
 
 		/* check the status of IPS */
-- 
2.53.0


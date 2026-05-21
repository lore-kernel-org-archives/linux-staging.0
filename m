Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AAE2F1FF4
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 10:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779360238; cv=none; b=AeFLbS1OE6jvM2pJ2WMqKfms6znokOJ+UTL+9YK4TM2C6Bq9hFAezsB1EgMbIU4W4Z2IaKv9tcamBC/TMzHoOlUCMCGmjbqDklj/FFcbVfHBJzB6DED58GBEBBV8XcTM99ApG+HaQV84aTNSQSnxdPp6tyeKdX8I811VAZkUkGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779360238; c=relaxed/simple;
	bh=YHSkAZ6xRu29Cuqd3YuBLQhuidytf+VlOkmSjnPWoNo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n3KCMgIBxNdh5Xcy86tDFd7n1Kkl2nM921rrTNLqD7GrxdqowOo+gth3ZpTEqsuLbTXYGRN5+aCK3+gCC3b3DkRT42Ys5n8UrW+6FSNjz4E3TSOxjdygTZrESMeqMb1faU3VyBreHUNfAguxWQ+HOxTBzdgWf8pUzzcR0HPkFLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eIQL3lQk; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eIQL3lQk"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-303f2fb7225so4249964eec.1
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 03:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779360236; x=1779965036; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywrJCfH6HqleCDiPu2u6TD1wJvM9tizyU4jB3RATzRs=;
        b=eIQL3lQkEC++izNN5mCVqlglMAg412rRaLf97L9ioctLoaxTiFZNB+eaZ/QmJpuJU1
         v0Y4AU+Rtej8wIkGcQZeOqAt9oP4PwJIpv5dOMY4D26nHv+S5YP4eQaEyE8npF5AJvyZ
         03eTKVa3qi4oBS+lpz1OvkxidHVPHzF0BZS0l9837do/Jv+WCuzP/g6mlY03qK7+oE91
         llIQ/2+LrriGnnRHXOjQ0ZX16Ih46DpFIEZtOdzdyaeDXlKFVxFcFvJ/3K5zMc3JMj3R
         2bRynpwUALx1aqluwYprK9YYoddwdxGRsws0mm1oHcpJ7VTKTtX7BV2LiqZemk6KNliv
         zLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779360236; x=1779965036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ywrJCfH6HqleCDiPu2u6TD1wJvM9tizyU4jB3RATzRs=;
        b=T9Rs3W+fuf0L2F0cODIUEht6BDN7eaIsHTMf5YCooh5ickyZ8V8Y8gBkbcZuiDMSai
         C7xMJGo2J3nM02c1yjcPfG1pCA4Rd6ysZLvHVooxdO4Wg39PA/azCW7hry2md8k2WLqM
         ihK/GruHHCVBmgkWdXgTpPy5a8QOSesg+ekimtmyseimZHHT3r77XAF0kVNQuzAfULmy
         IBxRVkuMDonge6YYZ+Gs4OmHGL5be38emjgbjmkyB416tfHME/IJ42l9zicFNIjG1pps
         5tfNvikaPRk+fqyEZyyhSiKK+/QOY8+sClvZ8z7HZ08vZcURZbP6NSWc6iM+U1lwdrTg
         N8vg==
X-Forwarded-Encrypted: i=1; AFNElJ+7XPpYihx0/Ql9fDyZ2FUBltdmaxFUrcDpn4CiyzAiAW5+o/mob/GhGOS8OjFVdPFdrc3P07gFkTDGo0Pe@lists.linux.dev
X-Gm-Message-State: AOJu0YydKxabPfcFoclG/ytINreFFtZQXD/w/dHlOIbdLdTKUS2sSTih
	ThtgP6MLFRTOhqOk3TCqOZILYNjfubUsPSvB8C7WjSoxXuzXmkW7bUPe
X-Gm-Gg: Acq92OGqJmS4TBYVwiy024aQRaqlW24R9+Z3mzfrZeIUKqbHBUjxWYmKyIg8/+TJmdk
	Sa86735KxJFKKfqQbJ6NHok9/ITRkRzawR+TDVgQdMU5QxobfF4Pbx75vs/YsvVxOrZhBs0KqAj
	4gaQWWhkQIWfgOtQg5TAxuLBFmuID2ktHf/vOaN8E5ymZTZhMxLp7XOLGQP1pj1TqM282Cjlv+J
	qqP9I7mTsl6HCI40c1uz/5maj23oFli68hx+DKK1Z9SQN3xD+lFVpH26EzKBunN/5Rr99uM4Y53
	1RxuMTc72dHp8fgke1EmVgahLHk5OEtB6MOR9QltybG4qYxajXzosLXMhTzBb874mBgOsLFFahQ
	keOWW3OO6S3aSTpzSFmRF27aqlaBA53Vyp2u+qqUSA1YKglhkYNb8conRSHVR6Z+qhd64/iy05W
	1sI3AQq4fq/X8rN+hz18lrjaNSNhyu+dr4IKvcgQ1jAKexVlo04QbfX7+QCAA/UWRozQ==
X-Received: by 2002:a05:7301:2a0d:b0:304:ab8:f89a with SMTP id 5a478bee46e88-3042f476e17mr1284848eec.1.1779360235907;
        Thu, 21 May 2026 03:43:55 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30443578ab8sm167176eec.14.2026.05.21.03.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 03:43:55 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2 1/2] staging: rtl8723bs: simplify LPS_RF_ON_check control flow
Date: Thu, 21 May 2026 10:43:15 +0000
Message-Id: <20260521104316.27739-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260521104316.27739-1-dennylin0707@gmail.com>
References: <20260521104316.27739-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace err + break pattern with direct returns to simplify
the control flow and improve readability.

No functional change intended.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
v2:
 - Drop unrelated comment formatting changes

 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index ca1cb58fc801..56dbe0f36d65 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -397,27 +397,21 @@ s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 {
 	unsigned long start_time;
 	u8 bAwake = false;
-	s32 err = 0;
 
 	start_time = jiffies;
 	while (1) {
 		rtw_hal_get_hwreg(padapter, HW_VAR_FWLPS_RF_ON, &bAwake);
 		if (bAwake)
-			break;
+			return 0;
 
-		if (padapter->bSurpriseRemoved) {
-			err = -2;
-			break;
-		}
+		if (padapter->bSurpriseRemoved)
+			return -2;
+
+		if (jiffies_to_msecs(jiffies - start_time) > delay_ms)
+			return -1;
 
-		if (jiffies_to_msecs(jiffies - start_time) > delay_ms) {
-			err = -1;
-			break;
-		}
 		msleep(1);
 	}
-
-	return err;
 }
 
 /* Description: Enter the leisure power save mode. */
-- 
2.34.1


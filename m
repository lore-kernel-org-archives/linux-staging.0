Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6BE37F8A1
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 10:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779360238; cv=none; b=M57ylJb9SKRBb4yxt9tIVtXNg083yjeWTJOSysXbsvmd80rY0fwy1EltOhx1Y1DcEw/GXykvL92gi2LF9zifu7q986Y2SGEAnGOhN8dywSrtokfxMI5g9kqNisFLXOXeg30vJ8RQmCB0PidT56uHR17cc/r9ariAc5PpYsxgSBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779360238; c=relaxed/simple;
	bh=rTf6ylnM6H6xTLT2JAhk1V4t7BfC4qfMoqviL+ivGhY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SdgVUhBekLXjMdmfopJXCkH/N1ZJZyEfm0DmFJt1VOEMsweM+84UXB9k4fQo3JhdprdQaYWwUKeItEEzv9lGtAMHbqj2TCgihoyehKSxQTVP0o4QcEsHJpkJsLl75aio1Hqk3zvNNCR757PTFLfZi+MXrE6Ixqd8wbrf+uXXlqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxPNgC2O; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxPNgC2O"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2c156c4a9efso8313970eec.1
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 03:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779360236; x=1779965036; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8md7FvszOiQsr4bVvzySccgOHi/BXJxIGcaiVJzxv2c=;
        b=hxPNgC2Ogllaqzf/KfUpbl+pB1lkdjnHPw+ZPoN+bpQeUj1ojGS7y6MVHW59xZFDYq
         cFuIg/wzhT0IkWfy9JiWih4p6FBCef5lNwfJdV4lA8G3rnoV1rZ5A+4dwmhiN1PD6NRW
         +gmFFVrQkmcz5m1RYl7kvNZ3kKYAmeWcRpRxKPFnOEisEt34loM/YZ5jQxAj4Xi5vGUw
         PcIH43OcAL4g85UeGmKDK0pd5YmWQzF3pfxubrypYGZrjapALMTpe8rq6/1Gc/VqHT65
         Rp/qV94b4HBRfHEDRnQfR6koCrnVwFYJoqmSodS1SmP1ChbpGlwvPYgSIYaOuSvxcTO2
         NRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779360236; x=1779965036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8md7FvszOiQsr4bVvzySccgOHi/BXJxIGcaiVJzxv2c=;
        b=q0KXpQ3TcxC3K+CzMR2NCHrdBcVv7A2CQX5tIrQxHhGxkcl0O4OIPNWafzGhRjqe6N
         K4TzgYKFd3d8OjZPnWrlXwFjvh5IsE2xoOIrZ3QfJNPHsM5gwqg0Spl7EEFZI4TzxxyY
         gr9RMqmjiv27VWjSmTBrUi7HO1T4m3Qm/E2faIpFfx0NzG9IZyHGokEVjdGnYADvG5gm
         8FUv+SebPjIlHgfOPFHuRVOANJP6z8RQTA4a4+AGHiNr/usjhxCpEYXFAcQPB5/FKk27
         i9CnP9O8r4IPVVk9uHW6SrEFCWfZMHZ0VrpMlAXgeUwzd2wC+eWpHfvd92DaRQ+PANWO
         xiXw==
X-Forwarded-Encrypted: i=1; AFNElJ8P9TDs7cVHjdP10ThhgM09bs+2jzZaDxVTW78q8ITualkmmBOGllQlWcaKVeObi12cHYJfYEzoShhHvDMe@lists.linux.dev
X-Gm-Message-State: AOJu0YzZib8KW22nqpla3fdAwjWaZuZcKhiNR3NXdNwbglz9KCEMm5TD
	M0AL+2uw9CG34kc9raMi5X2mciV0klYc6yD9uxF4lIPdMia2lbTF7spi4dLgLznWw4I=
X-Gm-Gg: Acq92OHh7GEP2VAhDlnVBWlDpHI15F15qmX9WMrGSsDZ5BFdnErfvSIwDtDb2fgFjv1
	qO8aCwlJiagOQ62BogBOKTPCS1EuEVVPWK9KPIpIy8pKSRqd5ilcWKjYZddALrkBLMmZljnUYr9
	hhFPVq4X1KnEaLkGZ7QKwB0uAzDGrZhybLVfRqBvo8SU9dEVGk4oknVZi+Umqq/VXMKSVIoiEi2
	VSOetK6+UWDBtWlMUSVstAk5lUA9z9vJ/ABZ4mpwT7pcbnGM2KZ4r32Fpcf7jSzSXac9V8eI6MA
	XgTfOleYd6ZH0deQcZiBXssXSW59kiHCSdlfnOrMBmB0EHx7mZF5C+oMVpwP77+cU2RfVU9H5ve
	QWb8w57igFQ7KMFOuCqNaUBvdURjnHTewM9HmsE+Yo6w6WXH4K/dvWIESDePzcSifN9QSDQpEpQ
	+BGeoZy2bFKc6CMUihbQJHJiqP8ZJUzC1f28eoJy/zfY3zDe5lGVBVbvg=
X-Received: by 2002:a05:693c:2b10:b0:2dd:8ac2:9f7a with SMTP id 5a478bee46e88-3042f5c27bemr1385844eec.11.1779360236524;
        Thu, 21 May 2026 03:43:56 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30443578ab8sm167176eec.14.2026.05.21.03.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 03:43:56 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2 2/2] staging: rtl8723bs: convert LPS_RF_ON_check to errno
Date: Thu, 21 May 2026 10:43:16 +0000
Message-Id: <20260521104316.27739-3-dennylin0707@gmail.com>
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

Convert LPS_RF_ON_check() to return standard kernel error codes.

Replace -1 and -2 with -ETIMEDOUT and -ENODEV respectively.

No functional change intended as callers currently ignore
the return value.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c    | 12 ++++++------
 drivers/staging/rtl8723bs/include/rtw_pwrctrl.h |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 56dbe0f36d65..661d4a7eb797 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -389,11 +389,11 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode,
 
 /*
  * Return:
- *0:	Leave OK
- *-1:	Timeout
- *-2:	Other error
+ * 0:           Leave OK
+ * -ETIMEDOUT:  Timeout
+ * -ENODEV:     Other error
  */
-s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
+int LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 {
 	unsigned long start_time;
 	u8 bAwake = false;
@@ -405,10 +405,10 @@ s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 			return 0;
 
 		if (padapter->bSurpriseRemoved)
-			return -2;
+			return -ENODEV;
 
 		if (jiffies_to_msecs(jiffies - start_time) > delay_ms)
-			return -1;
+			return -ETIMEDOUT;
 
 		msleep(1);
 	}
diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index c27d07861b8c..7dc9c4e2dfd2 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -233,7 +233,7 @@ int ips_leave(struct adapter *padapter);
 
 void rtw_ps_processor(struct adapter *padapter);
 
-s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms);
+int LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms);
 void LPS_Enter(struct adapter *padapter, const char *msg);
 void LPS_Leave(struct adapter *padapter, const char *msg);
 void traffic_check_for_leave_lps(struct adapter *padapter, u8 tx, u32 tx_packets);
-- 
2.34.1


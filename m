Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B251F4C8C
	for <linux-staging@lists.linux.dev>; Fri,  1 Aug 2025 08:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754037160; cv=none; b=diUoRhpnTPv/xaaR4AjoVsWqvDzeomqFUX81jiTHzxr6OSEVkXN136ifjUfyLkCDraKwRMMBkNt9mznXVfRbJ7I2Xi5X65dvlPI6tc4/9p3noYkzOKspnd3JYx7Q6FdfHyv54F7mpeirGWYTiJNGcg2DC0yDXqjGqK4qLZm3IH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754037160; c=relaxed/simple;
	bh=jNw8gYyPfEc0lCn2sfYFphv3M43A+C5B83Bw6t3WYKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eDhcnokrS3EWvtBMCljZsjPPSE1xqxGX+b04Vu3GIPDCcwXvaGYPZznszqmDu1TuC419X0VwZoD+bow7YIbHmcZY4SyE3b9qd1lfPm8nM5VKyhJRHDRGtCqJF630Wx631nUb+WW84NvXbc0rhXo0vI3+i/3Q9lqqkOwLbWudaDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KX+/2Q5y; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KX+/2Q5y"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-61564c06e0dso1075521a12.3
        for <linux-staging@lists.linux.dev>; Fri, 01 Aug 2025 01:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754037157; x=1754641957; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFCk7W4PYpUqrlv5983kKngtATqBDHXd47fbmciqnpQ=;
        b=KX+/2Q5yUAwZ3v6FVTXJbtbtc0DN86VRjM2FTcFHUBGWlNJqKD7yYZPkSi9qRpd9RR
         on3Hv07Xl6Wz2shML/SaXe6tIcBe6e0e57kxdH3Zsam3Sa1SQ5mOOkwIlXn43Adt7z8x
         Aef7/I6o73SSJmABzDSEqnT2UFkhAGWjZKjplZkq/fJkPBPzrERDQqndPXMX9nDRMxqH
         kaVljKFQsRadBQ6YWSPXt9kaUCVwmc9cjRqtCkgKmb/1HAIV+B206PQZCXcV46qSb7h2
         r7dpeMl5bfmutvz0XwHgJDhb9cuZSN6dswYUj0BnBTDiQq2qbsdCSF/+X0g6Q/4U2ABB
         svEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754037157; x=1754641957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jFCk7W4PYpUqrlv5983kKngtATqBDHXd47fbmciqnpQ=;
        b=ezKE7C5PHXIweYch02b43uywbPbVLsvm4W5FIyJVJ1UC0kkfVGoqWLZ3dAH/9VNXs9
         YKI3v2X6lTRh1Tz69OztIwPH0hz01r+9hZzXVDOitC7Ch/PZOtgfPVOWnmBc/JQaYYWv
         9u54ONIlU6LaWWDiztFFBr2WfPXip7CffCvKG8en7s+l48VhIvqPqQqSRnbgUVKZty51
         z3FLLSvw9M/2h13ywbm2E2A28MwMv9u3numrLv6vVlSBy90q5Z/HM0AISKRwarETe8X2
         nsVWqjgsFcWaB2no+IOkJ0au8XSTEvK/xJ++WOQs0u2TROQKNWycTHoGsRpqPvmqKZhe
         hZCw==
X-Forwarded-Encrypted: i=1; AJvYcCXVLsAewKd7uwEE7MTdOF2lrkJ+/PqVfeI2eZSDMw7wmaK8vwj50YgupkVgJag0Y35LDivfYd2l33B4Tdfh@lists.linux.dev
X-Gm-Message-State: AOJu0YyKHwJkPcHi2TCK325Tfe+z7EHsN+yOVeC6axqoNGZXPOy/pmFb
	F94B51bUjh4dYibNjZDuAV6QDTwwNRccEEgp+VamCwvSaznEGNiM3a14bkarLQ==
X-Gm-Gg: ASbGncthu/sjO4BOiZ2m1NWZ/UOx8qy8M/V/khg8FsoMJyAocA3gQXKgaJzIttcHs8L
	INpcB6dKbYWMYbO4Q2kaX5K+kWDO7n0ZkGw3ojS0xiUXf8eCUX5UrSplyXXtJvCJcCRgZaH7YZg
	fyrCNo8koGiW/gQIl865Y1V/IiqAC1/dHcQForP1k8utDenVp4T+jjvXr/mDPChL0u/V1bJT/RI
	3cCd4xsHVFCAztHPcr5T5ab3V8V6w9w8FEpl8oC0f3gqtDvvqczB+vadLxi7v9xQcij8PuLHSHv
	N0YX298NA5FdTmpsmFre0lfB9lM09LbHCvQhQQFVcTXyK0Yr1u9tPedTrs50EA1jTmzDewyjhCu
	oH+ziVmd7SJd7tf7V1nPwaW2YIriPdrTk2OYTI5BMJVdRrEdjoSQ=
X-Google-Smtp-Source: AGHT+IHySLJVS0XBT69Zdi5WfqISPJkGXDMtshkA3DCyFm3wMtzq+ZwLvezA3jCI5dEpOq7Bfd7tzQ==
X-Received: by 2002:a05:6402:518d:b0:615:a023:b809 with SMTP id 4fb4d7f45d1cf-615a023c154mr7761384a12.4.1754037156305;
        Fri, 01 Aug 2025 01:32:36 -0700 (PDT)
Received: from tumbleweed (ip-77-25-33-2.web.vodafone.de. [77.25.33.2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a911a59dsm2362735a12.62.2025.08.01.01.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 01:32:35 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 1/8] staging: rtl8723bs: remove wrapper rtw_os_indicate_scan_done
Date: Fri,  1 Aug 2025 10:31:24 +0200
Message-ID: <20250801083131.82915-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801083131.82915-1-straube.linux@gmail.com>
References: <20250801083131.82915-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function rtw_os_indicate_scan_done is just a wrapper around
rtw_cfg80211_indicate_scan_done. Use rtw_cfg80211_indicate_scan_done
directly and remove the wrapper.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v1 -> v2: no changes

 drivers/staging/rtl8723bs/core/rtw_mlme.c      | 2 +-
 drivers/staging/rtl8723bs/include/mlme_osdep.h | 1 -
 drivers/staging/rtl8723bs/os_dep/mlme_linux.c  | 5 -----
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 692d0c2b766d..ebc4bd6ecce9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -909,7 +909,7 @@ void rtw_indicate_disconnect(struct adapter *padapter)
 
 inline void rtw_indicate_scan_done(struct adapter *padapter, bool aborted)
 {
-	rtw_os_indicate_scan_done(padapter, aborted);
+	rtw_cfg80211_indicate_scan_done(padapter, aborted);
 
 	if ((!adapter_to_pwrctl(padapter)->bInSuspend) &&
 	    (!check_fwstate(&padapter->mlmepriv,
diff --git a/drivers/staging/rtl8723bs/include/mlme_osdep.h b/drivers/staging/rtl8723bs/include/mlme_osdep.h
index f0d19637fb0f..c84c84c68286 100644
--- a/drivers/staging/rtl8723bs/include/mlme_osdep.h
+++ b/drivers/staging/rtl8723bs/include/mlme_osdep.h
@@ -11,7 +11,6 @@
 extern void rtw_init_mlme_timer(struct adapter *padapter);
 extern void rtw_os_indicate_disconnect(struct adapter *adapter);
 extern void rtw_os_indicate_connect(struct adapter *adapter);
-void rtw_os_indicate_scan_done(struct adapter *padapter, bool aborted);
 extern void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie);
 
 void rtw_reset_securitypriv(struct adapter *adapter);
diff --git a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
index fd4ae870a617..09bf363efa8b 100644
--- a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
@@ -53,11 +53,6 @@ void rtw_os_indicate_connect(struct adapter *adapter)
 		rtw_signal_process(adapter->pid[2], SIGALRM);
 }
 
-void rtw_os_indicate_scan_done(struct adapter *padapter, bool aborted)
-{
-	rtw_cfg80211_indicate_scan_done(padapter, aborted);
-}
-
 static struct rt_pmkid_list   backupPMKIDList[NUM_PMKID_CACHE];
 void rtw_reset_securitypriv(struct adapter *adapter)
 {
-- 
2.50.1


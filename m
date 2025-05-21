Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF072A1BF
	for <linux-staging@lists.linux.dev>; Wed, 21 May 2025 01:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747790047; cv=none; b=RIno6p9gPswNB7IZqHdqA+NN4DQ/9M46ydFujwfFGa8Ispv/5QTmTN2VTt5Cr+Rrc8WQNFI8ErkS8PskWJ4kMXOxlsaXmYNHaKoidPud4OtgYjAAEFjly2dkdhVpWbXUUX1Sqdx/uI5WcpiZBoYbOk2MiGnYPXd/vns2NjVGjkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747790047; c=relaxed/simple;
	bh=qMJ4csJg98ZhrS7WlZUwdUP2evzFFz6V0gihixsQJ0w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZsxvWOnJ+7wiuauQ/1Y0no0fbnz3z+FAbmt0RHmdiw/nGUJgmBb9OPxXa6IiumKpFvzTGJbZgBEeAFZYMiX9uzLUp7Roy23l4lDZwVGSPhHVsX9pDAVNTjHUvsVMig/vY01BCie6SkYtpCPrDmX0c1eyCqhMoRZKFazwk2aXJds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QFV/w6K2; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFV/w6K2"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-70ccf9a4ab3so31154587b3.1
        for <linux-staging@lists.linux.dev>; Tue, 20 May 2025 18:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747790044; x=1748394844; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LmjcNigsQVjEpA2aug+Qo0lMaEy+M1lUuYFlaoypoM4=;
        b=QFV/w6K2RdSptk1VJ9qjNpBtZ1GW4mZwGdSOv5g+z5pUaennyxoSwTnzGiQS036Kfw
         p8i0aCN1jjF6Dn0VCv6NEcTTZs+6p5NWNSWp6tRt69Mxyimj5bu6PHWbchaYTpgEkcFN
         28k4yFQwZ8HEtDNUbkeBNyHBkLz4C166H+xnTHO2MD/zXwSnrNWDCUPdqAEtaQxS4ZKP
         c88GZUz1Uy3kh/zyK4j7/3uu6LeKN8Lr3bCUVmtpT6SHLyOHyF+CnJC57+bfu8+D2gg8
         KdE1cVFwKQRF9E/OfP0hrovdJJdQ3GXQyr7OBTEwcJcc9PjKWlfUCZzCitXYnvkm5t/b
         ekJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747790044; x=1748394844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LmjcNigsQVjEpA2aug+Qo0lMaEy+M1lUuYFlaoypoM4=;
        b=szljoG9eZkf1byLzwCOPIVWtkwINNDHgye53mbVmP842/OI75qCizgZKDd80opeuAp
         bqjx0Tb5NZnziXsC5/HOt+bPPgZuh2aboAkjsOioY+TLE9eH7qOrtuNbcnt1hjQx+9VN
         DprdRxb0POBkeVUjbeSRpqsK4YZXtcinDQwepaC1wu/F7hdNOfz8JK03Sywm7o4XdwzF
         m5X/XoCkq+jBlf2F2uRsQyFQlYDvU6yhZ3nOF6jngnU8tz7sABgXLtj4J0bJMiqj2E81
         LV39EgxUOX1Uci5duJt8pbEdlbrUAHbnAsSjol/KnryjZrFVOSSa2OZ9BnrW6AVRbmFd
         Mebw==
X-Gm-Message-State: AOJu0YxRLVl4LG66fEaXWCPMVfEwNfOSaCLrfbVU6/Ji0h5LDEYRp5ZV
	7icCUmdXHZQy1cbJitgBYQMVb0f94zc2L29L15xOSmZ38QVfnmPclx+v
X-Gm-Gg: ASbGnctaR1V8D6mlKHQhEAsRzUD2mc+NfcQyxx2u6LB2CeghjvpgRyAu8Gwimdrf4Y/
	IDmdRFMt7ZFgn3/Uk8xfTK9817kIkqBJwLgR6tGOStlJjSC/+g3FaYwpDNW5Px5Ut23sUb7Nar8
	7qCHTL6qH0wYofoOyIjAl4rjdxLcMQbhs7qynXeZ1DdnJ8NS9bGsqstRaxZH2MADJePUOHwn14n
	nxAX9Efnh5GG96bA/bhNZHh+N5hnzYpJmMGgAjpowPEOPir1OQqir0D/b98sZbY3UwnbICkSVs5
	MkWmx8Y/pTsrsePMBKZ5uWs4WxYCha1ooicWqt4cPSNgGCEJfSotY9maKHj+ppHWMZg82VprCi1
	1YMrF
X-Google-Smtp-Source: AGHT+IHIlGV3LSOYT7VSOxIMNzfi5TeysXDt8zuB/Mhjo+FxH8UcsBWqFSIsousT5EsdwluKCoyYVw==
X-Received: by 2002:a05:690c:6e10:b0:708:ca91:d583 with SMTP id 00721157ae682-70cab0b8e9amr254374177b3.25.1747790044448;
        Tue, 20 May 2025 18:14:04 -0700 (PDT)
Received: from maquina-virtual-para-linux.. ([191.156.251.100])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70ca852d92asm24633917b3.110.2025.05.20.18.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 18:14:03 -0700 (PDT)
From: Donny-Dev <donnyturizo13@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Donny-Dev <donnyturizo13@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Fix typo in variable name 'ips_deffer_ms'
Date: Wed, 21 May 2025 01:13:57 +0000
Message-ID: <20250521011358.12910-1-donnyturizo13@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable 'ips_deffer_ms' had
 a spelling mistake ('deffer'
 instead of 'defer').
This patch rename it to
'ips_defer_ms' to correct the
typo and improve code clarity.

Signed-off-by: Donny-Dev <donnyturizo13@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index c60e179bb..90e50bb9c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -1010,18 +1010,18 @@ inline void rtw_set_ips_deny(struct adapter *padapter, u32 ms)
 /*
 * rtw_pwr_wakeup - Wake the NIC up from: 1)IPS. 2)USB autosuspend
 * @adapter: pointer to struct adapter structure
-* @ips_deffer_ms: the ms will prevent from falling into IPS after wakeup
+* @ips_defer_ms: the ms will prevent from falling into IPS after wakeup
 * Return _SUCCESS or _FAIL
 */
 
-int _rtw_pwr_wakeup(struct adapter *padapter, u32 ips_deffer_ms, const char *caller)
+int _rtw_pwr_wakeup(struct adapter *padapter, u32 ips_defer_ms, const char *caller)
 {
 	struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
 	struct pwrctrl_priv *pwrpriv = dvobj_to_pwrctl(dvobj);
 	struct mlme_priv *pmlmepriv;
 	int ret = _SUCCESS;
 	unsigned long start = jiffies;
-	unsigned long deny_time = jiffies + msecs_to_jiffies(ips_deffer_ms);
+	unsigned long deny_time = jiffies + msecs_to_jiffies(ips_defer_ms);
 
 	/* for LPS */
 	LeaveAllPowerSaveMode(padapter);
-- 
2.43.0


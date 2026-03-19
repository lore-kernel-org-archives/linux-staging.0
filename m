Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052D03B4E83
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 23:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773962094; cv=none; b=IrJMza0zrcAp+Hs2Z8tEp+32Eut1K+D40Y3AXu1BzWu9uEhyUEAgvvubaB8osG1weEl3snuwKMHPWJwgjAH2762UZQy7r3hS3uw7tqRUt9XjsvvmA4KQmElv6EbNlAfcfjNlZPZX4oYwOJFsfCypGz7oKJPpF0pFo4QI0wKNsUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773962094; c=relaxed/simple;
	bh=Kp6IjVEjLlGy5WnhPLWjptcEFf75RF/kLuFwJWXqN0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UOiOyJiRt2xOmuknoRGXD6ZWu643VA4Ig8ErLC1ccTXe5jWRt3nuXQ6CSStgFuLDoQykXXb8JgCl8JOI3YrGwaj3PFDxBGC2iKSEaEHONtg+XP08b0jfg7OYQyIeR0IJQkQWShDjl5E9sPCIN7Bmecs4bIbDXE0rUNcQMJ65B8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jt7Ebc92; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jt7Ebc92"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso10974335e9.3
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 16:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773962091; x=1774566891; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNAofQ8GE4fNXYlR3XYlXGO3JPt3QB1r0SX77vSZvNI=;
        b=Jt7Ebc92zVPDYP8tjHIxlmWn2Dm+5pnOak1P4KFCv0oeREbnGX3C0VCC2MIrc6qs0q
         cWclFNmBaG2miFqL4HpRJ2XWTAMpBjV6aQMz6rQe29FZ8rPCxmW2MOUWAHZh/2QrPbaN
         cgrN/yCVoVTN75ohSg5PVwOWLAR569h3+xOBs/wiiOaSX6XkhwWCXb30y0EzmYz4ytkv
         6Sbb5snBp5xv4EKiAKdwUHiRZB6tBOegnAc2gJxHK3e4Js7QOT32Ty7C2I1aWckydlTO
         Ke/ZG6kiWx1vHZK4cTzRMfdws5WfQOBoEcsimLHZwBNQUZYX+ypv2doDmbxuBw3G/XCu
         jPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773962091; x=1774566891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZNAofQ8GE4fNXYlR3XYlXGO3JPt3QB1r0SX77vSZvNI=;
        b=RHzvJkxnh/Aw9Z0vbhTVBE983Uww6Ikn58FIj0A/Ix4Fz4Z6MlBkUX+Q7w3q8X6mJx
         GmYK9C/cSD3SC37anEwjljzzgv7bMhg5eD80XhVm6sd2+P4LEUxqr1UFpm60FqCrfQ3O
         UgKgBX5sMp886zl9xf96+FlRe4I2njF+k3pvpnyuIADzdEMwce+9z4x4oelAXB0IP3fq
         px0ObWyjQK3bNJt5DgQv4sgMofkQBaNNFvgDEQr1kPkQOhbL5vzRtBbLozM1kWgrh25N
         ikxtucWOG0gc66a/3o0VVlNh4GDMck6uJZ3KkSGFsof9DcbQRRauJjIn5vxd/GRX7Jpf
         OHtg==
X-Gm-Message-State: AOJu0YzIVXl4PSn+nBcFsSWe87v9lADp83qViLmlMRVa2q2uPny2Jtnc
	DDcld0jsPd6mKlP5BTccFf1KgYvZakeqJFEdg7EyJ4Jkbf6OOnDD++Ha0VTANBvT
X-Gm-Gg: ATEYQzyweIbQuQOS/CAI8YynIQKJCb/1ch5CwGruql7TXzBqKekgEtpsTafKy72Nctu
	G1kLEtRM0gnAzdGqTARctLgCvt4T0acPuZ8CT/p6gobS4ukN8h1RLCGBDJ774aDMa63Mbv5v9n8
	tNuL1wOojLCwMKEMAqQGiLor+DXYJvfGa9xFO/CCOZfmp0OIvTniQtE3hPJBP7a2h0ov15C1+2z
	e+sSKkKQ+6NX05ClXXNEWOMMUd/AgyfbfoA5z4ZrgspkyWPwX6rqOF7J+vD0uI1GPqY+dnO5kdV
	RH68exsYSoWOUtE65dWjzPYMgTuhWKZIIlCKZc77babTyJk8V9LkENxGQmYbiwbBqkXSxlLNKYi
	F43WA8r4WYWrUvlrr6yZJrfs7LlLv0QomyWV2lbLRorsO1sy7Z3FUo4wwM+2AGFiMbkTBsthZ8l
	ZnLWU9LXNsxGU2Np/0Ub1LKXjq2L7TwTRRR2EhV3KGiK+CfA==
X-Received: by 2002:a05:6000:2508:b0:439:c2ce:1226 with SMTP id ffacd0b85a97d-43b642755f3mr1791689f8f.33.1773962090961;
        Thu, 19 Mar 2026 16:14:50 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:1c48:8ce3:7093:e9ff:fede:440c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c35sm1983888f8f.22.2026.03.19.16.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 16:14:50 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Nino Zhang <ninozhang001@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] staging: rtl8723bs: remove dead REJOIN code
Date: Fri, 20 Mar 2026 00:13:34 +0100
Message-ID: <20260319231344.569418-2-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319231344.569418-1-azpijr@gmail.com>
References: <20260319231344.569418-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The REJOIN macro is not defined anywhere in the kernel tree. Remove this
dead code to simplify the function.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 26 ++---------------------
 1 file changed, 2 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 2adc98c955fd..805427353aa6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1153,7 +1153,6 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 /* if join_res > 0, for (fw_state ==WIFI_ADHOC_STATE), we only check if "ptarget_wlan" exist. */
 /* if join_res > 0, update "cur_network->network" from "pnetwork->network" if (ptarget_wlan != NULL). */
 /*  */
-/* define REJOIN */
 void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 {
 	static u8 __maybe_unused retry;
@@ -1250,29 +1249,8 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 			_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 
 	} else {/* if join_res < 0 (join fails), then try again */
-
-		#ifdef REJOIN
-		res = _FAIL;
-		if (retry < 2)
-			res = rtw_select_and_join_from_scanned_queue(pmlmepriv);
-
-		if (res == _SUCCESS) {
-			/* extend time of assoc_timer */
-			_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
-			retry++;
-		} else if (res == 2) {/* there is no need to wait for join */
-			_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
-			rtw_indicate_connect(adapter);
-		} else {
-		#endif
-
-			_set_timer(&pmlmepriv->assoc_timer, 1);
-			_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
-
-		#ifdef REJOIN
-			retry = 0;
-		}
-		#endif
+		_set_timer(&pmlmepriv->assoc_timer, 1);
+		_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 	}
 
 ignore_joinbss_callback:
-- 
2.53.0


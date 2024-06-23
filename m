Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42388181D15
	for <linux-staging@lists.linux.dev>; Sun, 23 Jun 2024 17:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719165481; cv=none; b=c/3hqnSooppq5yZYw27MZAuMZ7Y7KiZ6R2QewckSMZ2uXAEQioQlOgqpZr95exoboELxtTINi5xUkWuLfj50nh0SgmHH9Dm2MBCvAFMeK1jfNiRUhhZj3PfVXnSshb2UYCDrOc14KbN7ZMuZIcuCaijD3r8GL5wOJpz0fB0XQxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719165481; c=relaxed/simple;
	bh=4y99/Bx95YqKoijdJWQ6liswcalzChA+1DSzWRfTZQk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=StgWICIoEwAXx5Lb763+YP9uSIwJM3QB2N0hmnMR3Nt/6NcgNQgPhSkSQIiYt+ReKCKI+YdMCZR+ajYWpTyKze6+Pm7m6QADXNYh6FrdX6sM4mHgCvzjpFZOOof7B2Tt5mlkDal9AA1VwHT6jiM3h7dtcW6w/Xt5Qo9Rm5ML8yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XkqmDQfB; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XkqmDQfB"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-57d106f4025so560674a12.1
        for <linux-staging@lists.linux.dev>; Sun, 23 Jun 2024 10:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719165479; x=1719770279; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DTvgNDU+h3og9mxQKfg7iaFGh0/NWIwcOhQKR6cLy8I=;
        b=XkqmDQfBP7CXTusA2cX80Cf+9i/EpJt+mCUA1jbNSlMfMsqTOFetv0uE8aTGPNbcNe
         ZilkuZSyi7oLHEqdp+4EWg7E7aGzeQygzIjYGKs+vT6o++3jW8v1hwHFgodXHoKQQT+d
         mhI+krxKACOVMgOhl/wOiphBD3swioQpVv1rdSIUnX20GYQkLiW0c89XkKU/MZ99gPVY
         9GG/P49nJddl35gy+vpw18QzZDi7dW7N5vo1ovwqVB839tO2QrAt3VCoEjdBMJpFfnzT
         xYjDCkZwAi0YiFFMXeGwUSICUztqX3W+wMt5qUpavwAOSehikBeh/VrC8OsoBhJ2SPa9
         tDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719165479; x=1719770279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTvgNDU+h3og9mxQKfg7iaFGh0/NWIwcOhQKR6cLy8I=;
        b=fAopE8EWtwu7y/Px9zWrKjctT0uzZvbNHEvcSx8tSg1t/0+QY8IZUAp3JL0OlPk2aV
         g8bWVsrA93FVnkSKs5QIYmog2dARZ7qQXKT9jnOmlug5R+HonsB8rdkdcoQkRH9/Qrv2
         mYOLNpC4i+pjfOvqr1M9M/W1o16YDm5VdV9OxlKKLtc/jBJAdLBFDE8Pp0GIV9qJVvIC
         dsVcg6WBePv1c6fg0vpWSAByg6Mp94gmDHhfEfutvqjAz70g3fThYtbAQNAcyAWSf5L5
         /DvEb+MTcWd1LHdP/FK0CUnqzl9WaXzuRlDPT/Czk9V6DflFx3NTqEeg82MUDaPNoV3C
         edOg==
X-Forwarded-Encrypted: i=1; AJvYcCWh2sNUbmh6fVKi4ZuAIx2smtxUcPjTVuNDPlO/c9N8Vt2yj2ZdprTKh0m8qNI8MdVC29ZNEvb5CMI2AQKVng8IqcjxTN9odnpbmUU/lw==
X-Gm-Message-State: AOJu0Yxjgs+Fk2uDgRIG5/J+AO1A8267nAKEuIw/bdpsgcfJ1XY4r3Wa
	RAwOyirhjOdoqotWb/dvv69FRHMWHOtyLicUmrdwZ8F4jveheIg7
X-Google-Smtp-Source: AGHT+IHMPaQGprf4rtmy3Gu/mjzQPRZSiz6TtuTyq3VY53ubxDRFgFMzVhhddc0O/8P6jBruBA5Uxw==
X-Received: by 2002:a17:906:2a14:b0:a6f:bbfd:39d1 with SMTP id a640c23a62f3a-a6fe087be90mr271230566b.2.1719165478521;
        Sun, 23 Jun 2024 10:57:58 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a724cac7c48sm78050566b.220.2024.06.23.10.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 10:57:58 -0700 (PDT)
Date: Sun, 23 Jun 2024 19:57:56 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 10/14] staging: rtl8723bs: Remove unused macros in
 rtw_pwrctrl.h
Message-ID: <41f7ed26b5a6de187a71bdc7f062f3817993ba5f.1719155208.git.philipp.g.hortmann@gmail.com>
References: <cover.1719155208.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1719155208.git.philipp.g.hortmann@gmail.com>

Remove unused macros.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 .../staging/rtl8723bs/include/rtw_pwrctrl.h   | 38 -------------------
 1 file changed, 38 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index 0767dbb84199..c27d07861b8c 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -9,25 +9,8 @@
 
 #include <linux/mutex.h>
 
-#define FW_PWR0	0
-#define FW_PWR1		1
-#define FW_PWR2		2
-#define FW_PWR3		3
-
-
-#define HW_PWR0	7
-#define HW_PWR1		6
-#define HW_PWR2		2
-#define HW_PWR3	0
-#define HW_PWR4	8
-
-#define FW_PWRMSK	0x7
-
-
 #define XMIT_ALIVE	BIT(0)
-#define RECV_ALIVE	BIT(1)
 #define CMD_ALIVE	BIT(2)
-#define EVT_ALIVE	BIT(3)
 #define BTCOEX_ALIVE	BIT(4)
 
 
@@ -58,31 +41,17 @@ enum {
 #define PS_ALL_ON			BIT(2)
 #define PS_ST_ACTIVE		BIT(3)
 
-#define PS_ISR_ENABLE		BIT(4)
-#define PS_IMR_ENABLE		BIT(5)
 #define PS_ACK				BIT(6)
 #define PS_TOGGLE			BIT(7)
 
 #define PS_STATE_MASK		(0x0F)
-#define PS_STATE_HW_MASK	(0x07)
-#define PS_SEQ_MASK			(0xc0)
 
 #define PS_STATE(x)		(PS_STATE_MASK & (x))
-#define PS_STATE_HW(x)	(PS_STATE_HW_MASK & (x))
-#define PS_SEQ(x)		(PS_SEQ_MASK & (x))
 
 #define PS_STATE_S0		(PS_DPS)
-#define PS_STATE_S1		(PS_LCLK)
 #define PS_STATE_S2		(PS_RF_OFF)
-#define PS_STATE_S3		(PS_ALL_ON)
 #define PS_STATE_S4		((PS_ST_ACTIVE) | (PS_ALL_ON))
 
-
-#define PS_IS_RF_ON(x)	((x) & (PS_ALL_ON))
-#define PS_IS_ACTIVE(x)	((x) & (PS_ST_ACTIVE))
-#define CLR_PS_STATE(x)	((x) = ((x) & (0xF0)))
-
-
 struct reportpwrstate_parm {
 	unsigned char mode;
 	unsigned char state; /* the CPWM value */
@@ -91,10 +60,6 @@ struct reportpwrstate_parm {
 
 #define LPS_DELAY_TIME	(1 * HZ) /*  1 sec */
 
-#define EXE_PWR_NONE	0x01
-#define EXE_PWR_IPS		0x02
-#define EXE_PWR_LPS		0x04
-
 /*  RF state. */
 enum rt_rf_power_state {
 	rf_on,		/*  RF is on after RFSleep or RFOff */
@@ -247,9 +212,6 @@ struct pwrctrl_priv {
 		_set_timer(&(pwrctl)->pwr_state_check_timer, (ms)); \
 	} while (0)
 
-#define rtw_set_pwr_state_check_timer(pwrctl) \
-	_rtw_set_pwr_state_check_timer((pwrctl), (pwrctl)->pwr_state_check_interval)
-
 extern void rtw_init_pwrctrl_priv(struct adapter *adapter);
 extern void rtw_free_pwrctrl_priv(struct adapter *adapter);
 
-- 
2.45.2


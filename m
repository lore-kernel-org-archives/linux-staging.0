Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8C6407CCC
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 10:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785494641; cv=none; b=ct0oNHpndlQBy+MJ7nMiVbNkgUT2xsXcDWO+nRhEaMhk9LZ+hT8psiTt357tljr1O8pjVMRWcbFA8XAoVn3A+5bir9xMewOmzzCbrOweHudWbAttjLMxYTthecqcmVNO78ue2czOodkqaahDcY8yYeF7p9k5g0L1Gqsx5YH7m3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785494641; c=relaxed/simple;
	bh=K+vJbAC8Id1W3KleLtg9zUbUBVEVfAcnrfTeLUgnt5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MR0M4Of0iZrMeICADY8p5LOsXPAl9c+oUy+IV/NYULn8ZqHDGQRXd2rgmqCzGKmtqkdYldemKXA/qpTj84NwESZGPDdvR++wIodbCyVj5Z0wcE6s5+T98qxtG8BbxssvCgmRqScCJ9f9IG8sDQSxYIGs4+Zp5A729AwGzDLNShg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=slGS8bf3; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="slGS8bf3"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f84023916so852845f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 03:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785494626; x=1786099426; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m6zJBjR+mvcaIlTy8xSgJ5FSu18xQ+6e4Aiu2C8CT08=;
        b=slGS8bf3xjxnRBtRhJJs9dBQcf9Q8b6xfzjU2IjBeVzxGTy0aDl4PlVJBY9QZFL4CM
         08uCGcYSNamqYsytmNUtmCtFa5TI27g4FI1RZTeFp4lfjo05hOdWAFPkhYX8jg+rXyA1
         D3JQ5OUy6oWkK5xk8QcpzYgS20gYlvFyYvysXA3QF4ukx/HY+CGyI5WxzSr/Wo6uCYSs
         WX2CjqwhNJcFlKrWFcJKiwQsJNe/Wbfy8eTJFcTGNekWoi0UJ0dxxuNYFRl52vFqS3M/
         jbXjk3zqfT6/4S+T2fGoieQ91XpG3N63CPJPN8fKgGYhuOLSLzFfCkVDwAuvR90uj2JN
         ShSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785494626; x=1786099426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m6zJBjR+mvcaIlTy8xSgJ5FSu18xQ+6e4Aiu2C8CT08=;
        b=G8+x7rsnIXh1XAIbhIguXNpFee9eHrTv8sjZtOSnLIA7ZJ4+Bh+ugLK4yO+IczzpsR
         a9VVPKjodyVHQQjws3lNRsQjzfUx0sRd41iEOQmy7fwBZ+J3EqoVToR8vt9nKpG4FsFU
         zoIzqJUfOm0/YKSIt8flCUCxrkzEGcJiAcM84B7uJqQwENan1FogaBQAEWObK0tAAgew
         ELEmFCwiToKlo04JrOyfM4ZsSPN7Zc9sSPH8Vm6TXmO9jFXAQBAt10VVA80U2I2J5yoY
         QebRQhR1VwADA03NG7a0hro3QydAAaYbXKqWrVEOzML1HY9RL/MMuFtOKtPJv0BvKQRD
         csvA==
X-Forwarded-Encrypted: i=1; AHgh+RpEo78XDrIafcHLoHLHro1DwvjFKn39iaHzszrRdoBgtX31gg1bnTarZrsTUsah3sPJGoO/qgP0ExGjxGku@lists.linux.dev
X-Gm-Message-State: AOJu0YxAuj7IWNmz0bPppv7WyC8KRxZFHJxnp79QeBs3WC6MQ3iZbJ8h
	X3jnoPM6oJ8/KN7SdhJ9e8kCbAuYVzJYTRWFZge/miaiczJ6B/9PT89SIF1CQmMr
X-Gm-Gg: AR+sD10TXvxZIytOlYlVeWUWTwILTEoZrAFJfpyjUtvhzGI1eqLffRjflBHstCW0QA6
	4Toml+995MLgHYAlMSZwoFOtzMhACor3uleHUuI7MMi+Dh8gcg2vapbxTMSc+VMyLrhTlmsvrRi
	kAwxm98aaPm18lUZtpq5e6cWJHXF8lVsvdOUctJQ67dNwVxn995XsCstM8anL5D7vf7v5+CWqzk
	hKd0O8+2xVhZEdO4I2tJKdvaLKW2MrQp94aGuGCEJlvDlyxJDYr01zhd1k7SVKjtQq2HbmjcY4C
	25MaK1uJDuPZEXvaLYfel7Kv4K6SDVgP2+QW8x4WkEHfvm7ntXLOSgGo1g69YuWoKzJzQYh77k7
	VsjJfS1UQVwt8HKu9vvm523L0Maa/hsp4iQKCMujspOgpUIFF6Jk+CTORqL6TQgnxyhwHX01VXU
	FrceAA8AuGRUpKvZsrIUtKH9t6bj5yg2VwAHuHOlwrs4zTY1IuBjK6QbhgZ/lqnvRuKfEZw3Vev
	QaspMHJQ47kF4IdptnWtI/h3VSfxMfmxXd7dMVcSDIF6CqtqsCs
X-Received: by 2002:a05:6000:268a:b0:47f:7b85:b883 with SMTP id ffacd0b85a97d-47fd2b6983fmr3363564f8f.47.1785494625931;
        Fri, 31 Jul 2026 03:43:45 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-233-039.088.074.pools.vodafone-ip.de. [88.74.233.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6d7sm3423134f8f.19.2026.07.31.03.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 03:43:45 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH 10/11] staging: rtl8723bs: renaming variable bHwSupportBeamformer in rtw_mlme.c
Date: Fri, 31 Jul 2026 10:41:33 +0000
Message-ID: <20260731104134.12754-11-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731104134.12754-1-fliegbert2@gmail.com>
References: <20260731104134.12754-1-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renaming occurrences of bHwSupportBeamformer to hw_support_beamformer
since the prefix b is an old naming convention to indicate a boolean
variable.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index caf8c7623a73..e0dbf420ac62 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2184,7 +2184,7 @@ void rtw_ht_use_default_setting(struct adapter *adapter)
 	struct ht_priv *ht_priv = &mlme_priv->htpriv;
 	struct registry_priv *registry_priv = &adapter->registrypriv;
 	bool hw_ldpc_support = false, hw_stbc_support = false;
-	bool bHwSupportBeamformer = false, bHwSupportBeamformee = false;
+	bool hw_support_beamformer = false, bHwSupportBeamformee = false;
 
 	if (registry_priv->wifi_spec)
 		ht_priv->bss_coexist = 1;
@@ -2221,10 +2221,10 @@ void rtw_ht_use_default_setting(struct adapter *adapter)
 	}
 
 	/*  Beamforming setting */
-	rtw_hal_get_def_var(adapter, HAL_DEF_EXPLICIT_BEAMFORMER, (u8 *)&bHwSupportBeamformer);
+	rtw_hal_get_def_var(adapter, HAL_DEF_EXPLICIT_BEAMFORMER, (u8 *)&hw_support_beamformer);
 	rtw_hal_get_def_var(adapter, HAL_DEF_EXPLICIT_BEAMFORMEE, (u8 *)&bHwSupportBeamformee);
 	CLEAR_FLAGS(ht_priv->beamform_cap);
-	if (TEST_FLAG(registry_priv->beamform_cap, BIT(4)) && bHwSupportBeamformer)
+	if (TEST_FLAG(registry_priv->beamform_cap, BIT(4)) && hw_support_beamformer)
 		SET_FLAG(ht_priv->beamform_cap, BEAMFORMING_HT_BEAMFORMER_ENABLE);
 
 	if (TEST_FLAG(registry_priv->beamform_cap, BIT(5)) && bHwSupportBeamformee)
-- 
2.55.0


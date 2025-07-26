Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC67B21ADC5
	for <linux-staging@lists.linux.dev>; Sat, 26 Jul 2025 04:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753504442; cv=none; b=ULvxHGFH+IquoHkPlCpugpOG8UyPnhd2cbSgy73IASuNwKeQ3ptQ7dDWACI/OJvt+VtvG53O7D0hOI8EW7HKtAzGC8caQZd+Fd1tBXy5KrQV46H1Z5VQVmFsIuYXO6+ZOHuNjLhYuSs0Kanpb4655G2nbNw1Goue+QU3XbNOHyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753504442; c=relaxed/simple;
	bh=Z5OaX+7jHTU3mMvL+WEAgHUArV9m2T9NzvHRba30tZU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dtIqM+PGum38GijE+50SPaqtRfekfgPjTeoiDf4HEEIAWTzc/bZ4uwFQAKj6wz3xfnv/jdhih6tkOQu0Js9tQbnhwUbVN4pkWYThaiXkiQKvswdo+GqJXqyff+CTcTfjCBwA02YemoXBijtLywjoHmfUZuLIM/roxwkH1xST2tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1H2PR+l; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1H2PR+l"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7e62773cab8so272338785a.1
        for <linux-staging@lists.linux.dev>; Fri, 25 Jul 2025 21:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753504439; x=1754109239; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODpIvfyNJQSFOOSJUan5t1Okvzxpa4QfGplGbiE7DTQ=;
        b=H1H2PR+lO4eBk1soF1+jJvAacDZxAdwb367OEOKuKeQd7rn/mOxZuqUTtEZ55UoPEg
         lG2ecLoRBybsneP+2UuGm4s6sY67oxQ/3vEA2f8JxGpa7pOSZQiiuvihl/KvcpjrKpgJ
         vyfputD0no9Td5fBq37sF+taagUH4o0Q53URGzAfQ3WUPR7gUlpSnxfVZLXaVv51iQFO
         MgeMqv89REYZev5cndvVggC5W5mulhw3cN9cD9Z70yai6hc3wQZ9NlFKmhgQOLPX7070
         ckNgRIIpQsCsMNAG6E215G1oS0T04mw8Z8KjMpVGjLDIUWXedViUgw2R/M04bXfIvLdX
         ERtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753504439; x=1754109239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ODpIvfyNJQSFOOSJUan5t1Okvzxpa4QfGplGbiE7DTQ=;
        b=Z+xbSDv1dt/bwS0PGDZQnqc5u8Xnv7/55+Y9iL9cOSbaXgNxei+jzz/P+61sb10xWL
         bkza2jMrRZ27cmr9iAm25Hlp3IMhwpAITcY2AofoxLUrmjXDXYqfHK8hsVBX2C2r7Vhd
         gXOlJvrQonLoXL+B2tE9Z0XqkPuR1wjC6H88sDmVWBzsyatD9WHfdbiw0fHgxMXEPDf2
         44xcU9OeL5IQ8Kr6yFPSvP+EtwZdAQH2NfIP7CWJ+eyKebChj2vL4I8ZN7KBiFSh0zzI
         AtPyA8ptKUbZSRF2RUw4vLRAOOvZh4vBzJ+1dVgNTmfUHUhwp4t0gLRB9qZ+ZuUR6rdl
         sqww==
X-Gm-Message-State: AOJu0YwizAW3C/mX7qzChblO615+uVq849YN4brV/y9kKndLzzXbv+4s
	nQLHY+WjRPgz+L0qEoMqhPxpvzpMSryyRF9F4pDhLSaQlLdDWOREQcDFbj8+2w==
X-Gm-Gg: ASbGncu5YEB9jVNlcMi4UtZl5YhOfY5uaI+CIlhG+EDApVX5dkXLQRj5FDl6gwTmixD
	uAl7YHWY0JiboJA+CSRvEjCvxFZp0dLYvwCY/n+8wQc3oFxhL+YDhRG00oshtmr4olFFHcKaPi1
	DSfQnXa/eVHsKDaiFKzi5UkPtxNZ4AQlH6lnHEJbyrbm7LO2kZbaf+X+sM3o8qiOwkb/Z+fKmS6
	Rn/fWNvu9PCm0qNh7yVMKuOQXl5onXHLtrXvr+ZKom7jqxOZq/1FBwNAIIRnWkDwIll3PAGsQ1e
	fJi2TzA2eTcBwhDyDw02PD+U1nZnG2jFGqmp0OOLhz45y+8+IHKBHNuIRGX4zdQYNdPTGA4pUvs
	2eo8+t1ZSxjBs8nOU5ikgHDfxyGdWI2xaqZZWYLsGSoABoauZgPSRQnR1POHpjw==
X-Google-Smtp-Source: AGHT+IHSwjMogwktb6Ggg2pYyg91/CxlwjpPDIMYKadReDTC0+8wXd6HyXUmMXE9QwJMXp80jeRtaw==
X-Received: by 2002:a05:620a:288e:b0:7e3:477d:53ae with SMTP id af79cd13be357-7e63c1b1868mr579325085a.54.1753504439572;
        Fri, 25 Jul 2025 21:33:59 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e6432a885asm70322185a.36.2025.07.25.21.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 21:33:59 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH 14/20] staging: rtl8723bs: remove unnecessary parentheses around assignment
Date: Sat, 26 Jul 2025 04:32:12 +0000
Message-Id: <20250726043218.386738-15-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
References: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed superfluous parentheses surrounding an assignment to match kernel
coding style. This simplifies the expression and improves readability
without altering logic.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 3702d7e7a954..d845eaecd615 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -700,7 +700,7 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 	rtw_set_signal_stat_timer(&adapter->recvpriv);
 
 	if (pmlmepriv->to_join) {
-		if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
+		if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) {
 			if (check_fwstate(pmlmepriv, _FW_LINKED) == false) {
 				set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
 
-- 
2.39.5


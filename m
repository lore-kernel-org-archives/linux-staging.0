Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB653F65E1
	for <linux-staging@lists.linux.dev>; Mon,  1 Jun 2026 20:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780346566; cv=none; b=FzUa/hzApEn7SWu5sBJaqySY5q+opLDMdJlkeaoMFZnZqRCpc7na4anxlyiwFpgLG9dh+dVT14slJRXjdO9Wlhz2DOZm0+g7kGBc7ntrO8bEwPrFDU3qfvtVTBnDyxUsMFDSJDcc4jnceRB20XiqNJP6K3VJ9BkW9L0Q6C9G+vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780346566; c=relaxed/simple;
	bh=PQNUxQNXmTqAZN6syKdW43aV+wqV1idCwoA95Bb9sbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JTHSrIzmyfzgZEp0fiUDPKwuPw5qyLvyOMKsJL3SKFbrqZ9UcRLPzRB3CqCSrual4QkJtsqYFATk89w7wq78Vnt612vFa1W3xe4xjlwKUMKivO7uLDaioM3vDs9TL2kq6bXu4+sjLFGmIa+3Qt6VKnSBvdeorc6GCS8QoPvIvmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFA2LORh; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFA2LORh"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4904c1ce4c1so118334855e9.3
        for <linux-staging@lists.linux.dev>; Mon, 01 Jun 2026 13:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780346562; x=1780951362; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=truU4KCt3VwNQsO+VfNERRWKn6gcqCyali9Ny/5W4Vs=;
        b=AFA2LORhu9e6JeNjqtZoh3ezMyH4zcvPyZgaYJNmWwIt5FmJvwckuF6F8AyEj+oKrZ
         PwY9w4z2ThDsDpB/gd+7dFKW6vTwEfOdll3lf+dwm1ZFuLEA47WHhiwirmVsDLyAuxXb
         ZmD7eGV3t713adquWs5cisSdGT2LB9pJl29ipHZeLVrxqK2eJLGxN+0Dn1MHazDrslAd
         c6LlVufhtP76D/wRBFtl6RnMCoe95wDQkZ4WxZQK4DqqVvfhRI1TiAJ8/oX5bnwInhia
         pyz+eU8W/HkGX20Yagv8m4qZWjXa1i2pX4FPSjmonzi+ConDkArtoft60z4Jt6sOwzwS
         zaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780346562; x=1780951362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=truU4KCt3VwNQsO+VfNERRWKn6gcqCyali9Ny/5W4Vs=;
        b=TuCxiFILdLg2Fv0h/n6H3dq8Pjq+TKZY5rQH9iVQ7G4DJdowqwKjf4Y33M4M3dhSYs
         PhVMeciwxjjhUMKjeLqvbO5FBH0FDfvyWp0/NEMczzh7BNRi5nD/fESbhKN2gb+8NXf0
         10LlT2VEZJVw7Evk5Btu0h/VQpKU2STO0kx5nkIHAXg/mSHxn6qRF506/PsLwrFUA08t
         fGr6E0mnVDM5l2iFsqtAY8LelNbX7RzQ5GTm+g554FqMlmW0sRVbqNpcXtVLTi+pY2QC
         gP+GsPxFF1+x9e2h1X8P0E1YtHMoESc+Ha6cYirlVorxm72HGcjCscYjO5sO/N1pgsoX
         RDSQ==
X-Gm-Message-State: AOJu0YxI/Le22PUsBdJ23brj0/kRlF2kcTPLomGlKJrXYq47rDGk2ROW
	5CwQj1/WqGKnK7EZhPAfO82l4Ew45vvDDaJamLVnhBJuQ+bW5rxLWSBu
X-Gm-Gg: Acq92OE2oSGuFU0YqVoO2n6kZ+4sfnhBzU3ni51LmVgQFmPVLQwI4OVvf7v0WUzFWdO
	upotlKS5wtGy8O0J9CljbwJfbd7b1Zao8TYZZUft7SpuPB8aNZ6goqRz6gNXcKASOEgZiO7XvZ5
	9FRrK7JtFBpTIpUehTRMZsWe8hpNocBVXFdNrQ/VAAGNgap5CLnRcFGOtYHNLg7AuCsiwGm2qnz
	/AcYyRdO8m5ZyZGvz3IZy49EM04z66QZ35wGBxq684/Z+j4i2pIensxCasSjqp1yLLa2ZXBg3e+
	QiWt0jCIVQJsB3Mv/5BjK6YUDQgtlymf4wqkkW0Wt2xwqZxPSCnRYxaoJfhNX8bGF9AXh8uPRUF
	5rKOS6ltGiwtpmftaJG4kmxr6tjMFptJgy1se8g5uS9RxU+1+DajlqyFm30GosbzfyHenV6Y6c/
	ecyZvuzax7cZOy7ExCUY9Ura0oL4kuf6+DM0jRbueSUrS6w3YpJaFGTt3Aycgo31CN3SsgABko7
	9qYRx2ThP3EyumrLDHQkIfJFtA=
X-Received: by 2002:a05:600c:a111:b0:490:469c:556b with SMTP id 5b1f17b1804b1-490a2933355mr185088225e9.12.1780346561826;
        Mon, 01 Jun 2026 13:42:41 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-002-204-131-161.002.204.pools.vodafone-ip.de. [2.204.131.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e19a06sm16988405e9.5.2026.06.01.13.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 13:42:41 -0700 (PDT)
From: fliegbert2@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH 2/6] staging: rtl8723bs: Replace spaces for tab
Date: Mon,  1 Jun 2026 20:39:54 +0000
Message-ID: <ff888abfb61300678c150ad3fb67534c22a72bcd.1780343502.git.fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1780343502.git.fliegbert2@gmail.com>
References: <cover.1780343502.git.fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>

Resolving checkpatch warning by removing spaces and using tab instead.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_mlme.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 5e4468f23a64..4128944af68a 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -13,8 +13,8 @@
 /* define   MAX_JOIN_TIMEOUT	2500 */
 #define   MAX_JOIN_TIMEOUT	6500
 
-/* 	Commented by Albert 20101105 */
-/* 	Increase the scanning timeout because of increasing the SURVEY_TO value. */
+/*	Commented by Albert 20101105 */
+/*	Increase the scanning timeout because of increasing the SURVEY_TO value. */
 
 #define		SCANNING_TIMEOUT	8000
 
@@ -44,12 +44,12 @@
 
 
 enum {
- dot11AuthAlgrthm_Open = 0,
- dot11AuthAlgrthm_Shared,
- dot11_auth_algrthm_8021x,
- dot11AuthAlgrthm_Auto,
- dot11AuthAlgrthm_WAPI,
- dot11AuthAlgrthm_MaxNum
+	dot11AuthAlgrthm_Open = 0,
+	dot11AuthAlgrthm_Shared,
+	dot11_auth_algrthm_8021x,
+	dot11AuthAlgrthm_Auto,
+	dot11AuthAlgrthm_WAPI,
+	dot11AuthAlgrthm_MaxNum
 };
 
 /*  Scan type including active and passive scan. */
-- 
2.54.0


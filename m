Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2153843E9C5
	for <linux-staging@lists.linux.dev>; Tue,  4 Aug 2026 17:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785862929; cv=none; b=OLeM69u2IrAbcOtSZWBC0ssCt0VchdTXvGPoc5I6i0qEqZzAkWR1yBIJ3s5KwLa7GsggSykSHzD3vbnVIpKCPk2V34AGArmfKNw50ZwlOQ4RzE7bGmV+UKGyZQ5Sjb9hl9/3B/MyoEuIktm7jNGnc1hDwQ+b69Ojce6cdgMPx8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785862929; c=relaxed/simple;
	bh=mo79aw1+TOp8sDbkx88w3lmayfW1Lp7Dz7Mp8zNBvIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s14RKj8LPuPX2iqrZBlAp+g+Pmphfni0GZ/0RY02AWHfcH+sLQGGMWLih96IVmTWVFnah8g5UF0SbAv5eTtdWRcIOhVkrsTUkQl1l4Nix5+sBpz/oijIq7MAXHMB9j32hV8RcHzXlsOgtzqZuqz3Zpf33y4L+ScElZFDixy49Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ewvxeXoE; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ewvxeXoE"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cfff5f88dbso1108935ad.3
        for <linux-staging@lists.linux.dev>; Tue, 04 Aug 2026 10:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785862916; x=1786467716; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/hnfj8veXavr0nSDei0G049x9vlBzE5gjo2jGjbRpK0=;
        b=ewvxeXoEWB1M4OvEyCA7AvyN3W255g1JBmQe29QcL0kUgyXsbd5DwaIC0Oq+bgl2YT
         NUUCHte3D3Et9MjP3k+eROS6bnA459PDPY2sOrGmvVmWzXloC03z3HKBOb9f7H1f5hy1
         uASeEpHpYSLCfG7r4SI1MQVGvybB9QGS7YZBWl64x45BER83U2LZQEx1d0JS05KPCdku
         fPwJHRuTCd5ITbySYtmwZtcY5ZKa0yjPt7IuGWT9MZGSiQOvsVb6gQfD3gVmkXh2M2tx
         f26vzBOA6wbMAX/S6/zTfr8iTllRJh8XdEEb4iLi9lP9IhzKAprA6WZMndt3JnGgrt2v
         NVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785862916; x=1786467716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/hnfj8veXavr0nSDei0G049x9vlBzE5gjo2jGjbRpK0=;
        b=d2Xn2+tKsQMpyvDEIL5N6MRZLphcg43DgiQ+hpTYUVJ/iBp+tRW63POBxLpTKfHhY0
         1Kf15EuS//msF5R3tOcYxKWxJqQep89y8g0whR0Wg4RciVJVQXVK5sU2EXOQEcEbmRqV
         5gWiHFcwTTGMIXKhPUtcnjL1BybNx4byOXpNI2PgQtTLIuv5g+igNryuXhWedeAm6IwH
         r47NNGw5eOilzxTO6c9NSGs9iLEE+pIrJdO2NaErqaweF7ZMo5zS6ro2O0BsON0lpSPf
         VgkL4QINMvpF2VaERDaS+FeiEbwn9rXazobjlVq2MxI8+SX7WX8oi41u1iVm2YioJN51
         KMaQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr+quJEUCjkqXItCBa0nkL6cPwbIIXQMSZiIrHBq8bSM3A+RQgnw5nfdgl6iNq0mTcqzZ32qjuwfStcPDDK@lists.linux.dev
X-Gm-Message-State: AOJu0YxaFcGKeCqucDb1pl4zloZEZQ0D0t9SBUYzOs5lecUdYCEXv/5Y
	qeQCSt0swRXxXB13us0eLIcjSpJDp1WWimRdkwkURGAbs26ibNmSMd5y
X-Gm-Gg: AR+sD107POq87/swr7YAxSu0Cov5rcpPhFJCggX+yrWomdoeScZ4jjzRRrOwWtf80SZ
	7YYQBZauO1sAyrKQUQxsBwlQ67k1fg1LT7STQacZTt8gj3eP/ymW2M5IEctXZ61VDfDCVnRvbc1
	6jNoBHM2YOzMA6vRhjAFpWd79iZL0xkt6QHqlcVpjP0c3VexOgJtOARO12urIi6EYC5jhugOYF1
	rJlpTQugMeFNXUNczUIPavP4JiuKJweiRieGKNmnmxNYLUYpetqplUUBScMqVJmKnlLG5X7gs+k
	71rMRvBJOpVekKJrpH7eIKOG57bhQEV7UFxVxdLVNIUaP753EWJxwS1eqzBwWLFl/mcsw/9uutE
	xexfnK7PN6zQuCCB3mrJu+Q/mycPiDrJsYM0n5Nn4e6cqCzgFfOXgPUe7094P51AAVRwL/mYePe
	dfErMXYI3vkSSST7rNK3KssXBqKdyDKw1/n+jYbZKKQLCxD/6+uQL5GCgVoNabN+UKdY2FeQ==
X-Received: by 2002:a17:903:1ac4:b0:2ca:cee0:e172 with SMTP id d9443c01a7336-2d0ca9d094emr1865565ad.30.1785862915140;
        Tue, 04 Aug 2026 10:01:55 -0700 (PDT)
Received: from PC.. ([103.172.209.59])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863b761asm10731504eec.1.2026.08.04.10.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:01:54 -0700 (PDT)
From: Mohit Mishra <mishraloopmohit@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Nikolay Kulikov <nikolayof23@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohit Mishra <mishraloopmohit@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: convert swing index variables from u8 to int
Date: Tue,  4 Aug 2026 22:31:37 +0530
Message-ID: <20260804170137.20708-1-mishraloopmohit@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <YOUR-ORIGINAL-MESSAGE-ID>
References: <YOUR-ORIGINAL-MESSAGE-ID>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In ODM_TxPwrTrackSetPwr_8723B(), Final_OFDM_Swing_Index and
Final_CCK_Swing_Index are declared as u8. Using u8 for variables involved
in arithmetic calculations and lower-bound comparisons (<= 0) is unusual
and triggers static analysis warnings.

Convert both variables from u8 to int to clean up the variable types,
aligning with the TODO item to "convert any remaining unusual variable
types".

Signed-off-by: Mohit Mishra <mishraloopmohit@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 6c5f56d5a1f4..2ec2d4aada56 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -160,8 +160,8 @@ void ODM_TxPwrTrackSetPwr_8723B(
 	u8 PwrTrackingLimit_OFDM = 34; /* 0dB */
 	u8 PwrTrackingLimit_CCK = 28; /* 2dB */
 	u8 TxRate = 0xFF;
-	u8 Final_OFDM_Swing_Index = 0;
-	u8 Final_CCK_Swing_Index = 0;
+	int Final_OFDM_Swing_Index = 0;
+	int Final_CCK_Swing_Index = 0;
 
 	{
 		u16 rate = *(pDM_Odm->pForcedDataRate);
-- 
2.43.0


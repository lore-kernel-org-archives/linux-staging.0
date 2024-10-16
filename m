Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC84C206945
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 12:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729083407; cv=none; b=YZGeCU2RK3uCg7bKaBEs9ZGCnqN9z2TH4YUHef0HYyqNDx33Qcse8aFlVSv2Toe6U2QhgYgaK1feR4Z7Unpvrhg6z+AFaQFHAg+t/KbWWSypFopCFZyviniAp2K2jUlb8VNL0ZjhCkJZr3Qc5JMcvFo2JE/rsSM3ZraAQN+ckpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729083407; c=relaxed/simple;
	bh=IySJiiHKQ9uzg8Y6/9egbralZWhforGpWViQ50tt5NQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c2Gocxk+seHdvdsyMhEWHFjrrwyvEEaKLHcXVwAY2lTQguXGZCevCb2JX03MtF5sDNxV90ZwOzAKdxHJIlcCbcARcgAqxMKrpWQ1CnBFh0jv5LYIfsXxlbB+VsgIZwtslV2ZXIuSxUia+qiqTQ8w/bUenjz4wPU7YBDSnyN89Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MvOOPiF2; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MvOOPiF2"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d70df0b1aso2729933f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 05:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729083404; x=1729688204; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pa6exbdx6NUoRdCrQdTchcVOej7ISzyDCTBB7HgeisE=;
        b=MvOOPiF2Gh+MWGUNw/IGEZBGBYQZtFdjem81d1QiMFDDk2D8+6K29/lorDC46kWids
         QPlAKfaIOpSgjAybB3exXXCkzE9NViR2paUqCTfK1K/X7agfl8yWN55MWLHcDSL+CMa1
         axUFaMZ1EYYlpNJY/dRbHRhnc3RHBWJgUpRPHHlmMwrw4a/maWK9uSo3S23bNt94QRCW
         v6rcoTS/pQ3SJX50LMJ2xnoITq/Mc3iRhEWWClJD0AFQu2Z64SG+jk+n0rDy2PpPbzH9
         JC3Ob4OTwHKSicLgwhQzZNAB3mb+nyT78e2cDyuQIFjs/iNk2VEwstxpKry2BRU2SA9U
         5gHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729083404; x=1729688204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pa6exbdx6NUoRdCrQdTchcVOej7ISzyDCTBB7HgeisE=;
        b=JErqpRaZsOqxCfwTa37wyFok4ONBjlJoALNpgVibXocKBRZUnBaREXQ7Gym1Z7w8W5
         34NvVvr1UgX9iQBYoKvVGFR3xqFUY7Tj1BvhNbHO/3szIHfhujtyrcCBofab6Pf3IEAa
         bInb1jBdSOM7qWgRmIhTVoXGOIfhe8hQAGi8+eZtVXjEEI5ZUXzwGhP8A4mj3niP/O5g
         ETE4rbg3f2GJNFc/eMuF+dE09/mUPmPjH7ZORRO/mPxLbukQcJHfK92RiuqnQP5Q55t0
         KrYftZhLBE+OAM4FhA5cg56oKLgRpJoQw6E/ygyTkly25ox5eZOuguayVGlk1Q/TgRxK
         N9Sg==
X-Gm-Message-State: AOJu0YxyW7KUXmnBxafEu4mjYiZ5KXqYv1iPTq5Y1aykn3asdKYkWu4r
	qVUciH8kbS8H5WSSqCZBzNqNpRifMvWCZfc6JyyOPByebrpUkAGc9yGOWJgy
X-Google-Smtp-Source: AGHT+IH78AKUk4Gz9iHhSvSIfFbQoL3QqtCbWoy/aXkqm/CRzXTNe7Grz37dLgMXqpo9zErbFK9UAg==
X-Received: by 2002:a5d:444f:0:b0:37d:525d:5a60 with SMTP id ffacd0b85a97d-37d86bb6707mr2210100f8f.8.1729083404134;
        Wed, 16 Oct 2024 05:56:44 -0700 (PDT)
Received: from ARL1114-LINUX.. ([196.233.5.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa7a13bsm4249405f8f.13.2024.10.16.05.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 05:56:43 -0700 (PDT)
From: Aymen Khalfa <a.khalfa.1012@gmail.com>
To: gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Cc: linux-staging@lists.linux.dev,
	Aymen Khalfa <a.khalfa.1012@gmail.com>
Subject: [PATCH 4/4] drivers: staging: rtl8723bs: Fix comment alignment coding style issue.
Date: Wed, 16 Oct 2024 14:56:30 +0200
Message-Id: <20241016125630.2479807-5-a.khalfa.1012@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016125630.2479807-1-a.khalfa.1012@gmail.com>
References: <20241016125630.2479807-1-a.khalfa.1012@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Align * on block comment.

Signed-off-by: Aymen Khalfa <a.khalfa.1012@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index cc4d08ce1d2e..5566c01193fe 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -1016,11 +1016,11 @@ inline void rtw_set_ips_deny(struct adapter *padapter, u32 ms)
 }
 
 /*
-* rtw_pwr_wakeup - Wake the NIC up from: 1)IPS. 2)USB autosuspend
-* @adapter: pointer to struct adapter structure
-* @ips_deffer_ms: the ms will prevent from falling into IPS after wakeup
-* Return _SUCCESS or _FAIL
-*/
+ * rtw_pwr_wakeup - Wake the NIC up from: 1)IPS. 2)USB autosuspend
+ * @adapter: pointer to struct adapter structure
+ * @ips_deffer_ms: the ms will prevent from falling into IPS after wakeup
+ * Return _SUCCESS or _FAIL
+ */
 
 int _rtw_pwr_wakeup(struct adapter *padapter, u32 ips_deffer_ms, const char *caller)
 {
-- 
2.34.1


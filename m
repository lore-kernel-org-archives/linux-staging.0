Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C64394790
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 08:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772613975; cv=none; b=rtAfrgwzLlIZjLr4M4imCqKG9uIYn3jdfo8LmdtQzAUxeQZZBt1jcKvSWDYohLMSqbCR6QFYdpCDgCnttyV15MmdfNL7zzfVSLJeuuBq9/UlaXp4LkFCrsHxasf16d+Aidau4UZKaRIS+r509zmMDv2ieJreQ4UXk+22DmjNx60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772613975; c=relaxed/simple;
	bh=ch9Bjf3rYYQFZ3B+gWt24r/KcnGxHyK/TdO8+vbOhlU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZY2ChjbM+z5ePjpuaeGFoRFd8bj83MGIHzi8/WKQ/pVDi+kBB7xZA6iRWzu1MnWOlfF6AknVQnByyPRP+AjnR0bQCr9C40kcXJrtwCNWuGO1RjDXJPxgvkQZ+zUn6XRnKVKtuAqgb0uhch0P82G+lwAHhL1bUzcfMvmpHmwSEIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bN1f9nqX; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bN1f9nqX"
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-c73770b3f15so116728a12.2
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 00:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772613972; x=1773218772; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ntj2ZFCjKKBGx8d4Pk8uGSO7QWDo31vg+Q85kRhTYF4=;
        b=bN1f9nqX/An399lcmBZJ/4NGx4VEM/uGkq3SzZEBlgRqtea317zsFstnKG2QhDHgi5
         khWtabCQzwIAdTKXgIz2PyuVj1ozndxqyjGOfo1bOP9CogtZpr/oGNbbVsersz9qxIHc
         Z+v9jOa31NPxzS5atfFoknabjs6va/1gpJMa0anNH3EVgGeJOLtCmBbnLqbPewbIBo/F
         EV/8JO7kOgSw5As3jIMLseBef6Dk58+I03zDJcBCN2IC4D+UnFCJ9pX0F3fxY2xkfxqP
         ZBmntMrekxSrSKKgynQ8S78WCCG4Mh1X9IAr4JM6236nmjF5S7+jsa7xvDnUE5lymxbc
         Fzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772613972; x=1773218772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ntj2ZFCjKKBGx8d4Pk8uGSO7QWDo31vg+Q85kRhTYF4=;
        b=Xby0JTZpndfyTaBotdnTlPdO4SmTCV0/OcG874MpeX0OIPs2x6lSMDILI43RgHRL3V
         Dsy7Jg8Gbo+jpW9miyFESu9eaykwpuKeevXEkGFNWlCf7mCQwFFWlECVCF0Opzmz6Cyw
         9AHb4jCwXUDdje6NufVgr3FFvqVFxgcpytZN3IhfY2ISe5AJi3eTHLfYB5HHcLaa60E0
         /WwisxH9AZYmvEcDw6su8sDMN9rPRBWzFANLe84qWjyMI5YW4JwBB06/gYXUYsg4zoMG
         t15BeUGT2NY3r2uLNhcFmYejW34CZG56MgvpA9Zk7y54xo62E4uoVzljFG1LVGSP5pSl
         824g==
X-Forwarded-Encrypted: i=1; AJvYcCVUgNRKUsVAdusvjAIEAIPv6L5Gb/E8kaP91m4+pMM90tKaJRpqUlqSd2q+AXMXyXXAlFK9sVsMOJvSsKve@lists.linux.dev
X-Gm-Message-State: AOJu0YwoagUDMMKrIvYbBKw6XWSoxBZvzL80urBtT6+LmzCdxR5Ya9Nm
	oVP0C/zwk1QdzBlmPXFVZ0VKagTL9Usv1kbwDe35jZG+P63VpdPq7SD2
X-Gm-Gg: ATEYQzzYFAXMrvICfTc8EIrSD2w4lyapILCkDGdbohf2oKqUePJ3daQiiRyjr4PMcQW
	w9SeG1ntHpejTtm+IKnwH0w4lnMA2MCmnAUPSIcGI0KHASHm3iKnnyjUr47Oa2+U/SaJQxcIuDl
	cXERpk8ehCfKyqGjVgnFZQ+it49ncFmXFS1igNifOPdlaY0zR5y44J/9/Htm+g6QGNfHuvSsboV
	O8S6NuiK5xNrvLl8+V05MqZUg5zgXCMh4+25Y0srL5lT0dcwmvEExg+3EEabevA9/C+hWQ4/1EO
	QrsMRQYUSAKYVOfZxsH+1aXxGQumGxbrpenpzrLHsRsHf4Q9dPaCfZ/1Ya4IOvsTpiGEEBmxXUb
	gwkcK4d7RZR3Obpoju7DcvYrE5qSt1pz0jCIUAfwWlBL6U5X45DbbIflW1vb9foslyAQijJittr
	hvl0c0YmM/5VwZubkCF60pqX/Qrk+6Uh4mZr9LNxqCdHUhKh6PWrdDDasP2WPLpFWh+ZD/WVhiI
	OHFoow4DAbtl3o=
X-Received: by 2002:a17:902:d50f:b0:2ae:59e0:5127 with SMTP id d9443c01a7336-2ae6ab51eeamr11142715ad.3.1772613972063;
        Wed, 04 Mar 2026 00:46:12 -0800 (PST)
Received: from cute.. ([2405:201:31:d01f:950d:ab7d:5e5c:5244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3d1b2c5esm122010285ad.6.2026.03.04.00.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:46:11 -0800 (PST)
From: Soham Kute <officialsohamkute@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Soham Kute <officialsohamkute@gmail.com>
Subject: [PATCH 4/6] staging: sm750fb: sm750_hw_imageblit: propagate de_wait() error
Date: Wed,  4 Mar 2026 14:15:43 +0530
Message-Id: <20260304084545.156170-5-officialsohamkute@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304084545.156170-1-officialsohamkute@gmail.com>
References: <aaVT1mSeKrSSlrha@stanley.mountain>
 <20260304084545.156170-1-officialsohamkute@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Propagate the error from accel->de_wait() instead of returning -1.
The caller treats all non-zero return values as failure.

Signed-off-by: Soham Kute <officialsohamkute@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index f2fde011e7ca..7d11810864ae 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -325,15 +325,16 @@ int sm750_hw_imageblit(struct lynx_accel *accel, const char *pSrcbuf,
 	unsigned int ulBytesRemain;
 	unsigned int de_ctrl = 0;
 	unsigned char ajRemain[4];
-	int i, j;
+	int i, j, ret;
 
 	startBit &= 7; /* Just make sure the start bit is within legal range */
 	ulBytesPerScan = (width + startBit + 7) / 8;
 	ul4BytesPerScan = ulBytesPerScan & ~3;
 	ulBytesRemain = ulBytesPerScan & 3;
 
-	if (accel->de_wait() != 0)
-		return -1;
+	ret = accel->de_wait();
+	if (ret)
+		return ret;
 
 	/*
 	 * 2D Source Base.
-- 
2.34.1


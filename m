Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827911DFD9A;
	Wed, 26 Mar 2025 12:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742992823; cv=none; b=pbPHU/6+n/sjasJ0qkMsGVpuorx9Rur/yiREQ7kZPvVMuyMyN6LzWC2yk9e5mfKCGAYqMPE36r0/xe6eJtAZxkfPJBpljIe5wceJdm+CQ/iaF6h2nYNRBM7xMCLC+GqlJRA2GwIuOSj3qu+tbSSeEE9CQjoiGEKLjMA4w0BryqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742992823; c=relaxed/simple;
	bh=EidWf1smEcccrMWZMH5+INfITris3Gt4B5G1RWuRqyw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pK+TzNqGrayNBoVzqTW/NPkRe/UYWBZzJ/f0HFywnevt1+HpyH0wSerNmHyWybouopYMb5MSsAqNleX1kAUV1KN4Wo86zbCHPahRgTt4kKdg12l646wQh3/wWvksAqK6e0wl/4ULY6oZQ/wKjlJQGzvtYQyKqm3t3qblaT+aM7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PMVYBP5r; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PMVYBP5r"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so11972223a12.1;
        Wed, 26 Mar 2025 05:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742992820; x=1743597620; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=57GGOAaZN1XoYLh8BKnwS9BMIWEfDl/68HkmO3s4Tj4=;
        b=PMVYBP5rq+7dECfOtg0CjQSPi7gJDWO3uDqav7/3otXbMybTxcmf7AYThPKvnLHqy6
         Y4PEfyvlaTQFximLomQXykyO/E1+w+0pqUYTsQTAhjCPKlCo5hZFcSpCxNoyWe7fl1Hk
         JfS4XEaXuEEwqPt2ohyuXRnLHCnpdLFm6a62kstIq+PnntxZSfiaVz8x3Nf/Udxe0gh/
         4h/Va5Bs7W3Gk43lGkqtqjBN7aZY+xpVe64ooOYWxnW9zcORruqux0bhvZr5AsS2CF6b
         7OHryJ6tCr8mPAq5Gm8TfFEvuyxptozCTYgyLYM0vA5faYyiCHDQoicOpApabbKeKr9D
         XPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742992820; x=1743597620;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=57GGOAaZN1XoYLh8BKnwS9BMIWEfDl/68HkmO3s4Tj4=;
        b=gAbopJuPFtosJtNPYIFtSslF9XE3Lj3e1XMWxs+BUYQp2Bzqqt5OQD15StwDhYYaB+
         bDKaVtDRX2VFCBYrw2E0aSEqITg6f1VWR+8wh5J3is0QtNP8rLh/Nb+Yv/T5rBU1Oq5C
         PMhiOVoPDNe/gwP8OhH95Vksym4pSfHXfcFqx4VPemxod6qrZ1Zo1/rcvfjooeQNG1j1
         azNMcvsgwb1ri+2e2ewVtdwBfsgTy5aHFZbbBI2zSq1K0h2dateBYYDcOt8uliROk876
         EYzc/5D73Os89WaFlERrM/SK5uPOzpDbbyFPPxGYdUBdgZaWBbiDb8UoU/FheDHLPu9k
         qlyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWgWG8+pAkwVWlYvl03hvs2PkbV8+5NKAB0x9Oo7v5ylG6W33o5mE4xV8xErpMdBHyv06rU1xaCu4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9zuAWdsffUCVLDMsbV1IAwLrcI0YU3J73ga1kduXfl8kndyW2
	81g6qlKtLIeFQarhkrzAT2Qb8RwMd5s7kDHNCVZKMjkMQIV0cElS
X-Gm-Gg: ASbGncvgxeA9UTg6VWlqhN4Cm0+cLxXAdBS6Rgs7Nc9nRhPln35ebMVFYJjp4QSSuuc
	hg5zoKV2/x4JVDADtXY3y5Z2sssaJmwlLSEJ/csBtIVYDoNFsrG/85dfNSoh0TcZV3xHyIfGZkF
	ZGev+8WpxMFzggKxoohH6G4AKKnJ67jISg9IOuIZHa3wEJkPMOQOAm4PiF82EtnTZ7IcAA3UK4U
	Q2cWQdNlP2CO8NkxavF5v32oQRmc5oIwfhPMc86JT8FGLLvMnPE2y3O0pwecnPFKbvwpSrIbU2D
	5j4TwEbcKNzpOz7d56L0iUddwNGurjPbNI/Hlz/H23NnaUnhJg==
X-Google-Smtp-Source: AGHT+IGYAScV+oczm6r/JGUZSx4iBrHklfsgOR7nh1Ox+2Mbys7FxPkGsbq+bEKXPKTG0i7XEVIsFQ==
X-Received: by 2002:a17:907:7295:b0:ac6:dd5c:bdfc with SMTP id a640c23a62f3a-ac6dd5cec3cmr454680066b.50.1742992819282;
        Wed, 26 Mar 2025 05:40:19 -0700 (PDT)
Received: from HP-650 ([105.112.229.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac6d28d26dcsm211942966b.60.2025.03.26.05.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 05:40:18 -0700 (PDT)
Date: Wed, 26 Mar 2025 13:40:05 +0100
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	outreachy@lists.linux.dev, Julia Lawall <julia.lawall@inria.fr>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: rtl8723bs: remove braces around single statements
Message-ID: <Z+P1pfLSKpiRtpaF@HP-650>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The code contains braces around single statements in the if blocks
which are unnecessary according to the Linux kernel coding style.

Remove the braces to improve readability and maintain consistency.

Reported by checkpatch:

WARNING: braces {} are not necessary for single statement blocks

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
Changes since v2:
	- Add more patch recipent

Changes since v1:
	- Remove extra blank line
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index c60e179bb2e1..74a8fcf18e84 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -56,9 +56,8 @@ int _ips_leave(struct adapter *padapter)
 		pwrpriv->ips_leave_cnts++;
 
 		result = rtw_ips_pwr_up(padapter);
-		if (result == _SUCCESS) {
+		if (result == _SUCCESS)
 			pwrpriv->rf_pwrstate = rf_on;
-		}
 		pwrpriv->bips_processing = false;
 
 		pwrpriv->bkeepfwalive = false;
@@ -549,9 +548,8 @@ void LeaveAllPowerSaveMode(struct adapter *Adapter)
 
 		LPS_Leave_check(Adapter);
 	} else {
-		if (adapter_to_pwrctl(Adapter)->rf_pwrstate == rf_off) {
+		if (adapter_to_pwrctl(Adapter)->rf_pwrstate == rf_off)
 			ips_leave(Adapter);
-		}
 	}
 }
 
-- 
2.34.1


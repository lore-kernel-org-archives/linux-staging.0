Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576E32A1B2
	for <linux-staging@lists.linux.dev>; Wed, 26 Mar 2025 09:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742982843; cv=none; b=mFVPHE9DRpSORgQsl1w5apyufrWUooT+uqdf30bNqWimcKr1TxA+EpBJvTtZQYs0XhcZCsYCTaMAHafQOa6ADte7HPRFfj6jh+AD2rG176sffl7kDy+nFeOkyfzXcRRdvmvvye1DWiwzrUjKxyR2aJWXGTnLv6HNYCleP3iSldQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742982843; c=relaxed/simple;
	bh=Do401Dto4eRSvtWazEdu6e192DKWa4YpzeqwJ406zZk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iuD8DiuxXHqnsnWIr53w9u2AI9tBXXsF5F48QpkEJnwjWGBDzo7nb2SvVXEoQiWL5rFc6vCRPRY7ymnaYyjAFGcEtOTkbol9lDmrBsmCOETy6ukXyc2h2OTx7Iw/ovdbDP3m3+WWhyfRONyg4UV3GWjKFEL6IIQhViK/DpIUer0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5+FFhJP; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5+FFhJP"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so1008662566b.3
        for <linux-staging@lists.linux.dev>; Wed, 26 Mar 2025 02:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742982839; x=1743587639; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yjXPiRIp8YYDhIIaTUKI9YmEVChKDwNiiPGSatLAKIA=;
        b=G5+FFhJPxS2KjbtRlBzntb4KuI0+13+FnwFy9ILjujRCXjOUExTpoF4al9wp1P1VJH
         om3VwNBs//3ExY/tyZ2BN/uss/KAheYp/TEZ4D6U5MF87K3qTe098lvcxIRAPK58Us9w
         n//Ezcz8OtnGzFz6ehmISAAjlF2fbVEt/pe2TWeVWWWD6hG35Ihsr+pmMlxgvgIwLDhR
         vUzB1yhTWVQda1kkwvsQbE4tXGeLyB0MA/RePp13VEt0D0uWTAoxNACCMoysND8tMuX1
         SXrnm1rF9JKvN+TAEsOVieh7QR8rI2YLyWRC+ymva2U2wGkOEU3goDi92Fxa/7SQtIIM
         cv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742982839; x=1743587639;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yjXPiRIp8YYDhIIaTUKI9YmEVChKDwNiiPGSatLAKIA=;
        b=CG0y6fULWD0aVd796ypCPzUUg8/cIeyL1ITamuagQxHWnKDe/T6IUGTMBGo7ttrPwm
         Z6g+r+qvmd3H4gd6B8msPO7Cgj+YTZ+nOJYn7ncVkq01cUbzXhQYOkpwjAmVaTF5Rck+
         c0bndK5phtf2gWdm+o5AJXedwORBPfIgVRxWrqx3BRkjXyW51iDhMMQVQBKyNTePmNVN
         uucquLZPjPQ1a1XsnApDCNqqh7z0F5jGfRZUh5ttTyApuYVe5xc+Ls7KSl+DUHr5rIIt
         QlgzmRnxu+dBnWRfq1gKnIopRofIcv0HcJcEYMjHJsJlsc1Gb5JtY03okEQSbwld/IO0
         q5kg==
X-Gm-Message-State: AOJu0Yz/xcuVyU2dQXGhyduvVV5aR86QV0ewIdLBbGbKCWsBNMHddcTV
	vDbjj9tJFooMHxpS5gV6NgYVpAyWy4kN03FCa3PJkf2PrKs9pNRV
X-Gm-Gg: ASbGncvDWofWwhHicDP9e6J8XX4mU2lh+ILA1+p86qAA8EjFcVeuuNRYtIqnJvj3ZMp
	NCZ7Cn3VLMfi7XyDXSlpnZ+CewVHd9oCwT5cOuIfcvfpEYNd/RtUahgeKcqt4ZXnvFouQmTSZgD
	Lc3AZ56+93DwAaARbS937Gq9LryPU69BkLTEBIwJs86wTty1RLMiFb4Lszwdfkz2TVy2OWsBEha
	W3ueZsgGc6kF2576359KjsPjLL+fkqLst6+tgWAsl7Khi3iGGfGCEdhGAJzmVbWEyckDM+LmOte
	RDerB/BjMP+EloNN2ggV/8kgTctAxTJX86Vc9JwbbCXvsNaJZw==
X-Google-Smtp-Source: AGHT+IFZQfqPmKMBaA5lUpDx8wSPCrGqm+FenqOZLIhKis+yFvTwmUpU0KWJCXNfGlHGxrAzmuiCyg==
X-Received: by 2002:a17:907:7295:b0:ac6:dd5c:bdfc with SMTP id a640c23a62f3a-ac6dd5cec3cmr389055766b.50.1742982839262;
        Wed, 26 Mar 2025 02:53:59 -0700 (PDT)
Received: from HP-650 ([105.112.122.183])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efb52c24sm987282466b.114.2025.03.26.02.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 02:53:58 -0700 (PDT)
Date: Wed, 26 Mar 2025 10:53:45 +0100
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Julia Lawall <julia.lawall@inria.fr>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8723bs: remove braces around single statements
Message-ID: <Z+POqQpWsgMRz/UT@HP-650>
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
Changes in v2:
	- Remove extra blank line

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


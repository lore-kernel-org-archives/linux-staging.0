Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E2A209F5A
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 13:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729085927; cv=none; b=lOG+vMDyC4N4ZzODkIIw0VpzFg3co6mdXvGgYenirE7SjQZrMMg0mhJuqJgaA3yHozWrB3wfGmpoOyyDnDf7X2HAK4rBwlDrfv+qreSPIf51iEPjC5A4JEOEFp2NxiN5slIg6A6BdBaV2kZu5exJov6P+DOXwUPL5wZDo/qq7G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729085927; c=relaxed/simple;
	bh=bJo1wR66LxZz66uBsx7b3YPGLki4nx/QMECYckCDz2k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tkhFTXxplK3eqjLugRGKCW34FsBtQFrPI6a12cf1qc7VgBaZ/i/5uDxgbKlPrfcoyoxRIqga+yxeapBmnKNHXUPVRDAwaBHL3zHQweijQ3VCI9i37KmpOf2pilI8cAqbcNaV6NslBi8K/w9AMA0QEnrIyUnrx2/UNJ1XAslTi2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ige7Rk0g; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ige7Rk0g"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4314311959aso14847145e9.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 06:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729085924; x=1729690724; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQfsseZjnFfh9Gg9XTPNTmAU5/IvNZ9mOEFHN5IESnI=;
        b=ige7Rk0gbxN23XI+Q3yv+/YToRcXgLsEPtNh9I73o2gf9yM/KQwnBwExNF8HnPjhmY
         dB16XPfDjOv4CIfo8d1d4hHvGO4Kkm8Z3spWsqiRVnonOngx8rQqin5xUwYstaDrsAvm
         E6Klw5ooFHBtufgvngcGA+E4Rt81AmipbEl12oLMj38l0nCn5fiRXtL/L0mQIo9budyF
         KIKdi3a0Vq8GIZfzawsckZDJdcqhDSo+7ERykSGW46wut1/jAapov0BXlked5JsG3fJx
         oJWyYAq0cDijpUefH203auhYbI4SXi8RDKUwMlakEdKzJ/U82pIcajsw8rOEAgLAd0M/
         lp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729085924; x=1729690724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PQfsseZjnFfh9Gg9XTPNTmAU5/IvNZ9mOEFHN5IESnI=;
        b=nSHRwgj1B/DQNKWJ0B7iPiHvHgX31Ga1P4vmv+vIKGb+ocDJU++nZWUez7GUBGidKw
         B4lbSnHQlqfI/u0fD5j17CufyTXN0ikGY5Rfz0Dl0vQHVF9bmIZYR77Cwo+m6km6CYlf
         AdZ9gYtRvFu5bgFVXJnX176LO4VpqHcggJIwIawH9UCewVrAyo8WrDX9CWquTK26PY3v
         czBCIDG9zb6oOryo+LyQfqrquL5qo9gK0RYRq9bNh/TRRkZK/lvnEWEhmOL2Sonar/Kx
         gGRHvbAJ/W2yDSGvmWXQndA80Km1B9/bTN8mDVqgtyYImFqICAwm7RGrUP4uY3CbWVSd
         6B3A==
X-Gm-Message-State: AOJu0YxrcsXilvuOc8EL05RIsFxk/4qY/fxxh9fJshGbuNXumNcgPhQX
	eqLsb8a4gTCO39D5G9fFJWd7Y8lnb6sADWlekUVVAQo8JrwOT/Hl
X-Google-Smtp-Source: AGHT+IH38pAHCSzPRJgJrROSxmGnK5qifhkevGY1KvjUZFTwLTSs1L/tCf208ZKxEu6bBdvPxbXayA==
X-Received: by 2002:a05:600c:5126:b0:42c:b63e:fe8f with SMTP id 5b1f17b1804b1-431255dd131mr142134545e9.13.1729085923717;
        Wed, 16 Oct 2024 06:38:43 -0700 (PDT)
Received: from ARL1114-LINUX.. ([196.233.5.237])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f6c5524sm49415035e9.44.2024.10.16.06.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 06:38:43 -0700 (PDT)
From: Aymen Khalfa <a.khalfa.1012@gmail.com>
To: gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Cc: linux-staging@lists.linux.dev,
	Aymen Khalfa <a.khalfa.1012@gmail.com>
Subject: [PATCH v2 1/4] drivers: staging: rtl8723bs: Fix braces coding style issue.
Date: Wed, 16 Oct 2024 15:38:27 +0200
Message-Id: <20241016133830.2485315-2-a.khalfa.1012@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016133830.2485315-1-a.khalfa.1012@gmail.com>
References: <20241016133830.2485315-1-a.khalfa.1012@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Remove unnecessary braces.

Signed-off-by: Aymen Khalfa <a.khalfa.1012@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index dbfcbac3d855..1ced6f7ac552 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -56,9 +56,9 @@ int _ips_leave(struct adapter *padapter)
 		pwrpriv->ips_leave_cnts++;
 
 		result = rtw_ips_pwr_up(padapter);
-		if (result == _SUCCESS) {
+		if (result == _SUCCESS)
 			pwrpriv->rf_pwrstate = rf_on;
-		}
+
 		pwrpriv->bips_processing = false;
 
 		pwrpriv->bkeepfwalive = false;
@@ -556,9 +556,9 @@ void LeaveAllPowerSaveMode(struct adapter *Adapter)
 
 		LPS_Leave_check(Adapter);
 	} else {
-		if (adapter_to_pwrctl(Adapter)->rf_pwrstate == rf_off) {
+		if (adapter_to_pwrctl(Adapter)->rf_pwrstate == rf_off)
 			ips_leave(Adapter);
-		}
+
 	}
 }
 
-- 
2.34.1


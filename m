Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75A11CFBA
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 12:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771678152; cv=none; b=ozIa+QkIIy/QXy6hwMQDm+6HBWucwx6WOUk7EEe/n2vALjVwZ8uFGjDGLxfawQI4qchBaAapytoteC5JJqizV8HWI6rP7LrX2W5brfs3gNAxGBib0TvY5Jti+ymHeJQvE0bZnO08RBo1Fc4eFVB6vJgGLqNxtVB3ocGpQGh6Ncs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771678152; c=relaxed/simple;
	bh=SJCH74Fi3XVpLSYBNl90Os049Ruc/NjS9rgH3HAgdC0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IwtaJAD5wXPPRWmIY1BaYUMliO4E5sKYxjsNtOkfQ1HwL90uz37pfxAd4eqIG8Nlsm7CwEg1ddLvaBwbezK9HHmDCvweO4lHZHPvX1oez925iBICiJmC/8iLEOxJhWgd65sDrybb25QYlTL+UPJPmZ0t7dTqpYaMxXiHavOMpi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZTmaW11v; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZTmaW11v"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4836d9d54f6so4614905e9.1
        for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 04:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771678149; x=1772282949; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w0JV+oXZsMoEYt+my8k4u1Lt0rpk3zovYNjUGyw5Eno=;
        b=ZTmaW11vboirItrOUzKjotKKvFX4EaZCO8AraUCM4JDvYNe39/iaNS7dbk9ZBIXy1m
         RrEYLQMttw+0aVABJ0UoQKM3caegWpWuSAjEfiNtd/E6QtD6/+6ysrsOsPsuxXPEJHsS
         F391pjW35lK4SYiMH0EJ2lTSl8im4uJgrEHzWtNhZO4JTEZ21up6MAeyTnPg33gPb5oM
         wNlQqjSiCh46Bgfdg+Qxo4uuRE/1lMI3pUgozgYjAp5DuAvdioDPW3dyHCl63ZN71DQ/
         UyCKv3NBVd+mOls1YMgVP+PXWGHgyKTsIklkavzGQmtNUdctiHMyCG90QoGELyCouHsa
         kE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771678149; x=1772282949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0JV+oXZsMoEYt+my8k4u1Lt0rpk3zovYNjUGyw5Eno=;
        b=dJKKpKfGA+D5/xlw+yCeTzheed1+V8XJ1OUseD3yw4E35D2O18qQQblJTVq429DgSe
         CntlSxMjeATBn2N21O3GXSbw3T6PFYcaZ8hRV3FzDn//pzMx33p6VPTSIIZHPWodM91W
         KxQ9iVo2ENdKwIj6P4tOmB9mgZuz7fuYZd/HGWiIucHgPT/RJctZ/KqVJW/tOXUNWiI1
         PcJ37K2YtiRya2DGBqsBz82PLBQnl1+SZNR9L8iZP8i2kp+RHvSkk8uD7RDlwXTDHhH6
         YHjqrzwR3g02QoJyC4hD9uhG2SBDAQ29LsTArUR0viX89iXvytoRy2n4mKlFeUfSMCpw
         K2Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUnXgY7X+LoiQrIBM8taeHlzrEBj9EHvSFwl3X3ujLz9GNyKiTGQh3wLS+zmUCAnpOw/03HF6xII9r9MOyN@lists.linux.dev
X-Gm-Message-State: AOJu0Yzb8NQSr2GatQYKu0NJeKTzroptb3X3TwCLKRY4SLQuuaCF7Miz
	wgWIrHgaLWtz4kqUYYhkyInCviS+UAKvW8jWHpdvhKBNYp9+QtloP0Rw
X-Gm-Gg: AZuq6aJNoUaASy0qV9mLnaqE8rkqc6OuN4i2aX5J2nFhBk5+053hyWlzI9dmeXYDcKL
	0NU1e0+7U2vXIFfwKWIKodzSyCSUq53ujwBONXMMvH+SJpMzv75Dx3RchpjcyW0CFY2UrzPEuii
	KYRC9I+l2HXWbPwCkPy+WNX0pikWIgg99ZqBDvk4NDt1QJWitxeSPjXamGW9waE4KZQMfCV7uvg
	71aOKQxLC6gh7Tod7ZrKVyyuijm5T9YlT5hD5KAWMvWZkR4fNX6tWYJA0NvatDg+VgLpoSMzepS
	5Tmq25y4Kfn85lW2490nb7Z+lnqSX5RWbRZYpuQ9/haG7P4xfZ7KWxHFVcqRnhNRkS+5Hqol8ug
	8NuSqwG+2zX6SKtzUvYUkwJ9UukOFQmvFVhjcuTdVuJcQtmu0az9psu7EvZ4Vj7/bimfxr4oG0V
	fF6IFvo/Y9ChTFL/zUeD2Qne2rZwFi09BpFGUPJIA+Lyjdo0orKoThyFzs8+EomqBfkNx2xLA9w
	qAveggmDzr1TbeGvURmFINQYMmPIsH9pNiRNI9bz7wJ0BBQzjBM0Scxl38UD+U=
X-Received: by 2002:a05:600c:3b10:b0:477:a6f1:499d with SMTP id 5b1f17b1804b1-483a95e24aemr24260295e9.3.1771678148793;
        Sat, 21 Feb 2026 04:49:08 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd902sm40538995e9.7.2026.02.21.04.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 04:49:08 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove redundant NULL check on premainder_ie
Date: Sat, 21 Feb 2026 16:47:33 +0400
Message-ID: <20260221124732.327156-2-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

premainder_ie is computed as pwps_ie + wps_ielen, where pwps_ie is
already validated non-NULL earlier in the function. Pointer arithmetic
on a non-NULL pointer can never yield NULL, making this check always
true and misleading. Replace with a simple check on remainder_ielen.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index ebe73abab892..2b28c5fd436b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1439,7 +1439,7 @@ static void update_bcn_wps_ie(struct adapter *padapter)
 
 	remainder_ielen = ielen - wps_offset - wps_ielen;
 
-	if (premainder_ie && remainder_ielen)
+	if (remainder_ielen)
 		pbackup_remainder_ie = kmemdup(premainder_ie, remainder_ielen, GFP_ATOMIC);
 
 	wps_ielen = (uint)pwps_ie_src[1];/* to get ie data len */
-- 
2.52.0


Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C4530F816
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 08:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768205279; cv=none; b=QlXJv1oKnNn9TgrOndfSImzVwTvEFEdHebI7rYJEmPnuwdUawudxyGiW2z+OUO6T5mxzrNkmTH2icbMNmtkojeOIwyodvESnSloXWlmozTYStIj3m9K3tpXf6eXCV2l0T34G8D4A0qzoHaiJ8Z9rO4d1cu8TDy5I9hM5PscMGJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768205279; c=relaxed/simple;
	bh=Tfgap6dMZUCe5Hn2zRCgloslrAZ8vmYo96dunI/qEdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gQMR6gmoTrhop2YJRTQRNoW8Xb4kAGU3Z6BEZ7+dnf9A/BJOd9C/sThNB895mIjkkTwc4ICZ/ATyM51ctsSnHzxJBt/s+FKKd784oPDNR/r5C086raekohHC/iFN9SRez7z4KCXfCdKZMB6Y2aGkRFgMotHuPzeW1xhidG7eVv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipC7eLEh; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipC7eLEh"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47aa03d3326so48464615e9.3
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 00:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768205276; x=1768810076; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YAHZt4Dup1UEKXXufrzDbgBNhbqpw0IfAaI3RCyOPlg=;
        b=ipC7eLEhtVyhswIH4kdE+XZGJiPrJPOXos+6sbZ/FXnemBUOUgkX02AnA7nR0gwS16
         va7zvNrNgMr6cexCGWAZEoiaV9DGnYco+8O2/OLoPKGC8yrQTOaEqLW7P7oIJc2Kq7/3
         1k5TpIcVEDh0Q97UszsLJ+mWsI8PxKyrivpGnXaiKR7mt7da/XZCEjqHR4vN7+SLHBVD
         /3P1tQy7d57GrbruLEtxbYq7FbEhFuHR7sQ0L0oxQZr3yl/5e5SA4SEgOAbbch4eBhZF
         bphlvPNlehLWXesa2a1+ftacuNtSV05rQZKZ1tnmvemIy6Bo8CVgpFzNtfoiiIPj8+xL
         2EPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768205276; x=1768810076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAHZt4Dup1UEKXXufrzDbgBNhbqpw0IfAaI3RCyOPlg=;
        b=PY/FaO8s4ZTGSFvZDJnT19u4mWTHUX8XGTUIOtvb/69cGhFbXe/TdRheOBSukclSrI
         7hmqXOKF3C9ph35SiuLm9jw+0+fE9vbHq1A9yXFS6njk8O3bF1pGfy+7iTbA6W7G6dpf
         t5DlMX+48QpY5D6ntVaOusTBD70DeRGM/sEqPfzWVjh/kCx9TsdH1PWPAExoeStdiE3x
         6KH57dK9gzsToOBkNIRoCxqAQS/QRbzRm3N6z00VSLA9pi71S68AitH21SxZpescWFUB
         76A10U6Cq+KksE/efm2EOCeE3eKGS3mei4W24xVvqNpuzhw9g/a4LtPqOiccp6FzNSY0
         Feuw==
X-Gm-Message-State: AOJu0YztgucH8jAfiZX+F3elwkWIDvXaF7TzQgc3q/W3h5OwCUKOZpry
	ckwMWQvc8YKxuZJ5IqLd+jIkwRAFNq6ceL/Bw+or6FXXdk7wHS9c7B/Q
X-Gm-Gg: AY/fxX7EVJR4MNQUPO1bSeACT5b8H8Azyd9n2du6jDxYa8jz31G/g3BfDM1QRkE02Mv
	/8+fll/WB3Liydwy13b9j41bjXt4p9Er9npTar5fIrk/UvDATUmDM2kuCZRYFkKw/ktCfGF/+Tu
	TaTSgBWr7XKsAkyaMOB/mfuh7SA9JIaWaiCF/9M5uX0unZyyUUlmeEhZp/1MWlz8ewWv0T8OIbV
	CZ3ATiws/yhAt7CZxJg2Eg4NXqJKre/lfWHpdW1Y1cwDhbTuGO9Kc9gQqzfbSwr7HKZJfygzZat
	2clgkXBbV4+/FeRvezvic6CFj7Rlz1GnoNWZv3mXofckL/R7oYMiimrXqFQFUx6zf48C85/jtFR
	6LNJjTIjlt9V+MWWzI8HvPtZILzDaUesk921GXu4L3f/+eoY5BGC7b+gceE09Ms+ToIuvtKWmqa
	B5kN4ZFq3chz7k3JNf3d2qSmaflRf0go1G/hVgKVZVKercKOya3fMKQpKi6P+XLkU=
X-Google-Smtp-Source: AGHT+IH3FP5A7vn/T/nVgRRdV6ZiThqc6g3W1Kw7VLexpYDa+phyvOUBBRXK5xSwPP5BwsYCuTyCKw==
X-Received: by 2002:a05:600c:620c:b0:46e:33b2:c8da with SMTP id 5b1f17b1804b1-47d84b3be47mr180983145e9.32.1768205276128;
        Mon, 12 Jan 2026 00:07:56 -0800 (PST)
Received: from fedora (host-82-54-122-237.retail.telecomitalia.it. [82.54.122.237])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f661a03sm356505855e9.13.2026.01.12.00.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 00:07:55 -0800 (PST)
From: Lorenzo Simonelli <lorenzosimonelli02@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lorenzo Simonelli <lorenzosimonelli02@gmail.com>
Subject: [PATCH v2 0/1] staging: rtl8723bs: style cleanups in rtw_mlme.c
Date: Mon, 12 Jan 2026 10:05:45 +0100
Message-ID: <20260112090546.367502-1-lorenzosimonelli02@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains style cleanups for the rtl8723bs driver.
The changes focus on removing unnecessary comparisons and 
trailing whitespaces in rtw_mlme.c.

Signed-off-by: Lorenzo Simonelli <lorenzosimonelli02@gmail.com>

---
v2:
- Dropped the patch for sm750fb due to build regression.
- Consolidated remaining style cleanups into a single patch.
- Verified build with make M=drivers/staging/rtl8723bs/

Lorenzo Simonelli (1):
  staging: rtl8723bs: style cleanups in rtw_mlme.c

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

-- 
2.52.0

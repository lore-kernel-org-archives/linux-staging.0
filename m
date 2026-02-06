Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66080345CDA
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 07:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770364513; cv=none; b=fHa9zkYvSNSlGSM6v/PUPti9zF6QrQ0+T7dfhc+bav7nVZNdGvNTWrQPRhqyb8Uf7h/K9RPSSdld8Ts+ogxOoqhpsvQ7eYV+FOEOWZriI+hCNSsnVyke9Lhos86eGh0jmuNGYwKG0OAN1WmrHTZ2Qeu13JBi8EZnl1rnGSvjHh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770364513; c=relaxed/simple;
	bh=gjz8v5ZY0HbL/KoCVNbCH0V1XI6Gj6X/JcPsgHXWFmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MfkcN9oQL87f1C811S0UbfKulpZXI0L+bnta/Q75OBXmKQ4Bucg6XY1dcHCDOKgUUKSgw8S0VJyvXrEgrNSGBAPBqy3ZwQ1+Qqy+uBQspoT1N+VLw0JQ7ojYzDamNoWS5Yr55Ex1o5WEkFQnNj6pFtOTc298ejHLza2ChzfVKdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/LgmzIG; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/LgmzIG"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43629377370so508281f8f.3
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 23:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770364508; x=1770969308; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hxIC7touXtNw7AoeIXY1HoE08ravNX7m9QTPbmfjlA=;
        b=K/LgmzIGVjn6HbtarxgrUDFkkLAuwykit8p8IjJUnMemP9fnoc4g21qrMIa+1AIUyv
         ekVUm8YABpWVoFPKbi6L1bF7uoM4OT0LUq7mnzVxFzgOqmfKqE721+OW6tz6ZVrce2gP
         oi+34tCcjrwezTouk0RNh1Qb4zp4riS9vAdU5bRnuvSB+F8tNVjPUPIA7szVkzVvQgrz
         qccK+lpE34l8LFw20qCrwMmhEktiyy/QNpMY5wjmeFWLsAqFmMD4lcH9p3IbVnfhTt7b
         Y3kJL88VAL6gnkGlczNIh2P6yUIGk1cip46l2aG40j3Pjy5ZNyImt2sKuEeloIxWI38A
         o2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770364508; x=1770969308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2hxIC7touXtNw7AoeIXY1HoE08ravNX7m9QTPbmfjlA=;
        b=oe2ANAkSTFNJ5e6Z1lFEhq7FW5brEL0Z98wsP9DuSU/b7592B2KKoH4IdZIlBzLfMg
         1eVghlJU9Ht/EJaiIbX8dNbjMmmYlHO5wC6JtuJ2UqDz/XUQXQy0LX3yqEV7dIenYHc1
         er7/mv0TnGwIRPBQCSIht4vv/3z/q2rKS34PrZ/WOcBFmwfBwItGOXCkDL3pSJe/A5hv
         S+oknkICaxpBwX6RsqvRM++FSbQFPOvh0chkLlmlTiEu9yahWPC7XrYPhynp8AVseEoh
         c/o2H6UUIJlu/8HlVMy22Yeuk2+P7yywu4Vvf7MQvPsZduRzcHwGYPEwqdzEsnHsYdkM
         atxA==
X-Forwarded-Encrypted: i=1; AJvYcCVxuR0WDqZvdSsxdz20PwHxscSoyJIfIOGEZAXm8VtIe3pD4v8UAGKVXfVzRjoQMcnBpHv/BjttevDjMXfm@lists.linux.dev
X-Gm-Message-State: AOJu0YyR+0iIAcWkmuT6Xj/n1xZ1SvgkGZvxqBtnIxbNe6LB8ZJ+b0Ga
	0h4I0EYKr+MiayAbII6ds7o807t8hpFsPjzB1ImtSVmt2fUAH4DJPqI=
X-Gm-Gg: AZuq6aLvVpnUm6L7MxBs3yZ6ZwXmyPNQhoK8h+BaAGfK1p451sUuyZYTkKZemuMjEj4
	tgJcBpMvthFNtBQ/6HaOoym6Uex6Vvij5bg8XY+FXpi6x1hgAoIBCqWzVtGPFAWFmszbeSE15CG
	aDX2oCRddBZmmMJO2cJOSg4672GUbSV34i4VWqQb7h5MGMrj5S5PTZc0VuKl4Xw31NfA4IgDGoj
	8JmUfonSxvx9ZAUoWLK6wueUgnD7R43n5QN/VMg2XMeNJMJLRB78xulBGbD5lQY1UPm/NYFRh3Q
	WdELJhjm7YA3RW/CLCo8eAqqaqR2pFtb+UFZnet1m/63NExBEks2t50Du26RTkv8dRmnniuvLsM
	t9D1TGiSmCqQOKnAQiVKGEo3zkdrz4lIOwHd0LicJUiYb2g1pTVB8Qz0UZBvRYsNoYX7hbCf3Es
	9FLQ5h/dG5Bg2uCj6Fqmqe6cBRKnL9++tkEnUoWs/41akHjKwkdDKWtJ1tDrGeIoQ=
X-Received: by 2002:a05:6000:2689:b0:435:94c1:3714 with SMTP id ffacd0b85a97d-4362901adf5mr2733254f8f.0.1770364507796;
        Thu, 05 Feb 2026 23:55:07 -0800 (PST)
Received: from LGPC ([31.223.131.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd3b8sm3836039f8f.11.2026.02.05.23.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 23:55:06 -0800 (PST)
From: lukagejak5@gmail.com
X-Google-Original-From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v2 07/26] staging: rtl8723bs: remove unused RECV_BLK defines
Date: Fri,  6 Feb 2026 08:54:20 +0100
Message-ID: <20260206075439.103287-8-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206075439.103287-1-luka.gejak@linux.dev>
References: <20260206075439.103287-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luka Gejak <luka.gejak@linux.dev>

Remove unused RECV_BLK_SZ, RECV_BLK_CNT, and RECV_BLK_TH defines from
rtl8192c_recv.h. These are not referenced anywhere in the driver.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/include/rtl8192c_recv.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
index ac3e08ad53cd..b63625ab4e45 100644
--- a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
@@ -7,10 +7,6 @@
 #ifndef _RTL8192C_RECV_H_
 #define _RTL8192C_RECV_H_
 
-#define RECV_BLK_SZ 512
-#define RECV_BLK_CNT 16
-#define RECV_BLK_TH RECV_BLK_CNT
-
 #define MAX_RECVBUF_SZ (10240)
 
 struct phy_stat {
-- 
2.52.0


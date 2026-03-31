Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2DD36C580
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 05:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774935530; cv=none; b=Q1FAKtPobfBSkMHiXQAQ77krSxUwqqnph+aF0ot8ZjydQgigFwMLwh18ZKFxYjL5FYcGZ2YU3+0hi/cRCdnRLS00cPNL64Zp6pyS3R868coFy2HIXHQ7a5YLU3K51WmQ2mL/WQiBhMYYcewZqWgSHjI/sHCyU4RcaWSOCnSXUj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774935530; c=relaxed/simple;
	bh=8HORAL4uK2o7wObz8gvtpHwcUlZj+oQhYgAGf/a/Feo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lZI6Vg2r549MbIMl0kvKx+MTgHBGTS2B5i2tRTfBsyjmK61PkX7b1/JOQst+/NqxckWS2SZFrHIL2rW9fGOony6AqwqT8rIYC9dYuSVdkHxe7rAjFWuHF9B7O4sXLlLOUJ1y1prNnPw/5mPFUrwARgrtSWs3tnTxIbMgevXruQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHuVQNvv; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHuVQNvv"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a13e1cfa45so6185968e87.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 22:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774935527; x=1775540327; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b3C/dulqRMCOMJsFuKraQtabyP6IT015xSbMgv68e7c=;
        b=FHuVQNvvdqd/2GnhdH4rlvsFsu9o3iYWIwQy8Lgyd5lxJGKydaSGZj1uB7BVEonoq4
         ci+N1xKrIoem9sNhKrH6kZuDypXQ0vrlyxYdfp6AFULpUHq/AuJmfp8+3FggLlZ789ku
         HiWMqhVTyhSWuUazk8xGMVRIytHXjXeo2ziPumMQxwi5dcpoBiMyTDRUD8FfxNkojJeg
         RyJ5AhD79omqI6Psj73Rfjg0JYbjBYJeN/Sogy5tHnROY+px/UMwW353Or3oKxIKQD2c
         RlcpVYobwxaiNbn0BlTTCXuruO26aTL4rKOWuE/ILgFJxucZWckVwlkxESobJuyfHnhU
         eXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774935527; x=1775540327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3C/dulqRMCOMJsFuKraQtabyP6IT015xSbMgv68e7c=;
        b=lK8O0sXPi+jMXTVztZbP5Pny3tOyxE7w0S+QM5K73AjsE1e5VX41qCighyD/cRN8y9
         rDRJjmMGRXpxrnFwVyQC26+pW3P3DcdhiCRudAAJTyqWUZC0IPGpk9SNQrYTTrB9m3jG
         ZnfHiJfQrgw2olwnSKa0kJifj79k7mEB7li/5l24ESjHcNSsw9z4XnsLKkDBkcLLnqIB
         48mraSYkCa0NtcOXDGhITQ8MnKzEtLJUIh1+v9Kec0JHNyLjIpBZedQp6ADvPzd6AeR2
         6fCtablsOZR2IhnDQf5zZ/MZsqggY82eDWLfzvaBnlVB0lfrN/rRLheNj/jGYPRrnPbN
         c+TQ==
X-Gm-Message-State: AOJu0Yz30/iJhS/k7GAUEypokzXpiO1xmw/qdfBL7QMk5Uk2HXR7yRiL
	PMQvEMf4L97uxe2xsdzQ4RPUeiILf5nImZUQHR/2TTD0zPb/Yg6IBusn
X-Gm-Gg: ATEYQzxAV4Y1VlY3tbpufRPmYvfv1v6C8TLywG18VeYWsQV58AvAJHbXc6Ff1qkwHY5
	ltiNpX2lhRSxBbQxUMcsq0Q2Vs+DMhf0czMo+rXA7t9zyFxo9i2OvNQ5WDqtnwbSjc2VF4VJii8
	WNTAXYmzMZ3BbNAP49NdGonguJIfvkuPEpvqzXvjANMfprUKXHQqfMbzUADJNgDvHNIHMCqlOl1
	+AGkt4Jw3+M9SfNlsQdfa6CRKqTcCf/6G9bdvk+lPvYjs8Xzc/LgydC+Htv+vYP52IGISCIhyl8
	QWcZ9SjLFLrJHiHDRSmnCqC63ZrBIZxz26fiGkncv3KeOSHmVSZhb0aftTWSVPnxeb0HtTOsqMu
	I6Z48FCXDa4dZw/VJE9l8MsTamDn6kyRVVEbCxlH4iGrGF9Fc7O0nUKMH545FkG6BUqJUnPOxEQ
	PGVwkaBZ8WmrKFe6AIhHsPjYj0HKvHdNaTJKdVNqXkUg9jmJ2Br50cIlxAPaF+fA==
X-Received: by 2002:a05:6512:1193:b0:5a2:bcbd:579c with SMTP id 2adb3069b0e04-5a2bcbd595cmr334045e87.28.1774935526560;
        Mon, 30 Mar 2026 22:38:46 -0700 (PDT)
Received: from localhost (c188-150-77-196.bredband.tele2.se. [188.150.77.196])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1403cc1sm2146373e87.28.2026.03.30.22.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 22:38:46 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v2 0/2] rename and remove functions
Date: Tue, 31 Mar 2026 07:38:41 +0200
Message-ID: <20260331053843.108678-1-linus.probert@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In v1 this was only one patch and it has now been split into two. The
first renaming functions the second removing two functions only declared
in header which were desovered during renaming.

Thanks,
Linus

Linus Probert (2):
  staging: rtl8723bs: rename global functions
  staging: rtl8723bs: remove unused functions

 drivers/staging/rtl8723bs/core/rtw_efuse.c    | 34 +++++++++----------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 33 ++++++++++--------
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  2 +-
 drivers/staging/rtl8723bs/include/rtw_efuse.h | 14 ++++----
 4 files changed, 43 insertions(+), 40 deletions(-)

-- 
2.53.0


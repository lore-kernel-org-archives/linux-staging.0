Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75CB2BE051
	for <linux-staging@lists.linux.dev>; Sat, 14 Feb 2026 17:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771090327; cv=none; b=KNWVLihhLzI3s2TyBWA/WNwLs4pf9mvA09FH/NQgmccX5VHrSQckhT/S3x2YqfvYib4zJ1a1G/MJJY+043uDTjW+D/Ieu8c0bQT8j+tqT9uaiV0w4c4x7bH7Tv94fvPU6Sx9vWA3f8st2TaKvm4/2fOqS64zlkhMoWlLWcvx4z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771090327; c=relaxed/simple;
	bh=kmv+joalhDYufje0aBdVNJKzDl3mxXg1VCx1jKqGzk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eTtfxiXZkRlV5mL1uf2Rh9vp3OdxKCUhXD0+HImigqAe9KlDOsR/ObSUZ4537RdIdgG51mIMgnM3GxlvQvuCQBlDGzorfnHD34zAMl3GP0pLvAY/QKnGVIeWQOrnA2zCA+CkgFfAWKg6sFduJwbXxT0/CclAm5/o5pKKZt7d7Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gJ/zDmfI; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJ/zDmfI"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4375d4fb4d4so1521514f8f.0
        for <linux-staging@lists.linux.dev>; Sat, 14 Feb 2026 09:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771090325; x=1771695125; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VhcE4+W6elAAYMnN0gMluDEnFYOZmlMKa9K1k+eYusI=;
        b=gJ/zDmfI2XSZTOvTANDsGfFi1r5XWtJBParSqseUL/y+/zthoDv7K5/fsJ3a2DUTb6
         lBQakwav3Iv8HVparYKwy1uTDViuXZW6opgtqMjmWl0Ca/2NMlkOeczywbCJCVH8pBrV
         pb4/RgB2Ba+gE0Keo7Qnw7NciAHFpapMxPF5Yqggrup5WixQYCJoecioWphOVRieidoK
         Gqpm8kCTTUiyvenR7dYo5MBUIyQKHbxzDqi/YtNXh2I5Je7Qx9b+U0+Vjh8wlxsNoUXw
         aYg88dK/u1QOrhl7bhGzQY324JUXorauV5H4L0JHxxcSFj+YfM7lRkIafj4l4PAZPUbw
         JP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771090325; x=1771695125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhcE4+W6elAAYMnN0gMluDEnFYOZmlMKa9K1k+eYusI=;
        b=msm2/H35xuJCorpXzZFba1no/zLu1AVz8HdDKE8Ye6eyl45UpXX7WjJYm/kL42b2fq
         EYasSC9bs5VQ9OqF5HUouwOiX/sO+bq4e3pMhtyLR+bUzehjaMoMvzZ/lZjuHzFYegS6
         GsPvIHtAPOBFe075Pg6jsytE23Q0FNCm9gXmg3E81dnIZUekFFpxhZ9Gw11lw5eRTdWn
         gUk3PdJ/4Ag154HmL8g51l7ni0NVrNU5Cf2gbIIPTDPdn85bd7FY3KVbXfUCHLhRe6Yf
         MpoiXl1qiP2KH6vS6tuG1tM08CdKD/1IYOchHFNlNI/c8IbSNhZs2pNnhYZ6cgzYeZpP
         rc7g==
X-Gm-Message-State: AOJu0Yx8MQDHe+7Qjy0+RxwRIAoaKCpTMPhtI1lcmon1q99BBO1HmFrC
	TOvPU9fCoslBsi+G+c+2vpb5rganU5iAnibRyUv8eVSmXbXhCGKUW8lD
X-Gm-Gg: AZuq6aJr0PJYug2oq9ZD68az3AhAHw9tUXgsYmIQDV21TZ3a45RUvzHy+qe7HO6tCsy
	jZ2GkPhj0Vs9DhDEmae05QKPpdJvJGJ3L9FsbszjKsfRsui9PtQJVt+a3BNdWeYG2SB5pFAx6lt
	lVqI4t6fwVVeuiwYjcFD21tLqlfnfdQIhtc+03FYiYxXMkZwdPzdlFi7ai+U+wHfX4+m3CuNtP0
	1IkmEK1Ah5XR5wT66PzljU8kDfDlxPXS9oljTv3zbqbnI3YSuKDg+LOO3O8lBrx70eAtTGcfyfF
	Ndx69w/diN5UgRzyTadGNpa+6s8FQY2TRdpC1Rt2f1dtNPLqnpTMQ5ERiYwy2+inUieji2d6YQu
	8vQai4P6r+EaN0npGUGv+3yoiMsVmDx5886KmvI36Augc0UMw7iqWS1xo9ZRn5zfyGECVTTF4OC
	63b3wpbtyNbPA/2FfAs5B4ms5aQxN7lm21EtvNNeoxSfbnKabe5T6ANm7DczWAlEuuwFdRbvOb9
	bqVV/Ff6xAaIqmRoCIEcW/nTIY=
X-Received: by 2002:a05:600c:8a09:20b0:483:76b2:cacf with SMTP id 5b1f17b1804b1-48376b2ccfbmr53971165e9.32.1771090324756;
        Sat, 14 Feb 2026 09:32:04 -0800 (PST)
Received: from DESKTOP-NF9VEQD.localdomain ([87.70.136.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4836aa0847asm267865895e9.3.2026.02.14.09.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 09:32:04 -0800 (PST)
From: Ofek Almog <ofekalm100@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	s9430939@naver.com,
	architanant5@gmail.com,
	andriy.shevchenko@intel.com,
	Ofek Almog <ofekalm100@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace msleep with usleep_range
Date: Sat, 14 Feb 2026 19:31:39 +0200
Message-ID: <20260214173139.49094-1-ofekalm100@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch replaces msleep(10) with usleep_range(10000, 11000) to provide
more precise delay handling while allowing the timer subsystem to coalesce
timers efficiently.

Signed-off-by: Ofek Almog <ofekalm100@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index b2e7f479f72b..3f5b3ca2066d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -214,7 +214,7 @@ void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 {
 	_cancel_workitem_sync(&pevtpriv->c2h_wk);
 	while (pevtpriv->c2h_wk_alive)
-		msleep(10);
+		usleep_range(10000, 11000);
 
 	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
 		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
-- 
2.43.0


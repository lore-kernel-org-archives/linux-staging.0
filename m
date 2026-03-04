Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6FD37C91A
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 08:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772613957; cv=none; b=dmy5ZdaI6zKYe+YHM+/IINDjDLhPW5VIB12+nO336FCES1A6geRVMGo95231MGm5gXk7eXSg7JcA1NCTKDSAtq4ROHhp3HaxTUBij8kXWcDqgfTC1iFiZzLUDxjML3SAbmu4tQSqlFbuQDvKvoL0kdoSBKN4wC61H7qdyw4xLzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772613957; c=relaxed/simple;
	bh=THfLGrQRHE61+kilKBL8NidbBAzC6FOlwjMO3nb9rL4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K/o37G/THST1q2pIeUQk3mfRSu0WjW7sgCVg1aGDp9R4dawAhqhn+t4v09zLVbmmNyPvl3rjG8U6mbxcGIRJO27rQmuTtYbNUDTzxnKm15xroGpPS+R8syiIskQh68MTNJ100oC9VRXNFEHZIInHCRKrmKbAplTYTde4FXf/U5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cW8fjXbS; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cW8fjXbS"
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-c632ca0c317so1069180a12.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 00:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772613954; x=1773218754; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THfLGrQRHE61+kilKBL8NidbBAzC6FOlwjMO3nb9rL4=;
        b=cW8fjXbSxDaqIxjRRSPJwRonz0lDAfl0DaHyVlyOMPZjg9ThYsHaXKQdt7XjOQxuIp
         hpJbEm8Y4YP3+niXxITjXajIgnzMXxOLaGzNCWGebK4Wa15l83l5zeOIbM0ntS7bjduo
         oHI835oJCpXwN/M4mf0gwVt7j2QQpAWVte4bYW9geyICArgtn2Ihtq8YzzNbif0cL7Hs
         8z0uVCMmPGxCy2s/JfGfcmS+wT+ccPiKWam6R90DOEhIVkED1rKzRPH2HQJOarnp/Cmq
         FPa89xGwr6F3FLFGH1jSLRd07cMhJKDbqjVWy+k9KTdQyol0a2hym/6mjwQR7/gcselo
         6teQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772613954; x=1773218754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=THfLGrQRHE61+kilKBL8NidbBAzC6FOlwjMO3nb9rL4=;
        b=OoW1HqPzIVPNIGKtb9oSt/WuDK/BK+NCFTGo71yOdkhmjuOUU+y1njdYdMOto7rtnJ
         QydC8pZ0KOzu/1U3yrfh79MIaYRAFGK7F2QeUYFsnLbFUOAMdJm2Q7MonhhOpe1naH9m
         y/WBUDvuXIhTNLWzP5Xl9COKYjlhh0oWnlvdhDjhtWV2bgrQ9Ous0XrCnEMF6NTmi/Lw
         elxflprI21ZfkH6iHKT+sEiSODWjQRlf7xkMFZoINrOPPNgQBL40E+WVf5wdRFS5chLt
         hlf1clqqKTz1DiRqwhjTEL4slr3soyXe2a1Uc8LORRBr3+YXt2OCUr105KooH3B1bpyW
         7J4w==
X-Forwarded-Encrypted: i=1; AJvYcCXYNvRNkJtJ2AjEYocLuBmoX/w13Xj64xb0p5v9/GO+BBRqDydRhnQPCiPcb3CBMIo+9pPc6aMFFKutAdz4@lists.linux.dev
X-Gm-Message-State: AOJu0YxrMbVPa3U8x9+YJ9zjVk0W0c+5qgIK8FshVA8Ub+iJknl3BaXo
	d7h3/Kk4c9QtXYmJefQ60xDyKflmBYphj5iIig//aE2RrzQWGW0KEiaI
X-Gm-Gg: ATEYQzwWXOylHhDknbrVDJO9yBAI7I5znwYfafE4H37ALTOsj7QOiZl53+UbZW7jjq/
	Cwt1ItEAc50zq44N5tOl0ZcqKyoRu2CpCyKA4I0ks24KukVDS+lJz8CIlbX1wy1hFaBeozCS3iL
	Ivtz2EbNvCqimL9tjBz+XBQEcgedCj7T8MJlKuQrE/zopka0xXLO0hERX82VZRwcGx1uCdAVQDj
	K48qTqmUr1mI6F85HaIBUQ+98P4mGs576Nbw7qKIBN1CEf5xdNMSgBz5Evw6M2cbqTJnOIXB/iL
	LPTT58KfEOXSMp950fOY2YMK8KcS0jGKARn+UEz/ZqXmT4Ll8qCHVrQSKGwouE0eqnGIQNXdwnE
	qCiDn2FkQHfG6q32KfNprIlkE/uRk5viGLObJ/UIKwMC/o3KsPSzn1CD0YKBDWovmSxXYJ+KUnJ
	vCgihzJhfCDlv6zEXlaufxDTMs/FJtDfzCA/7ThnJj8AeJnyaGuydscU/4EIfXdUv3+8IJzAupx
	OkPdWHUw5EU9Nk=
X-Received: by 2002:a17:902:d50f:b0:2ae:59e0:5127 with SMTP id d9443c01a7336-2ae6ab51eeamr11137435ad.3.1772613953992;
        Wed, 04 Mar 2026 00:45:53 -0800 (PST)
Received: from cute.. ([2405:201:31:d01f:950d:ab7d:5e5c:5244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3d1b2c5esm122010285ad.6.2026.03.04.00.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:45:53 -0800 (PST)
From: Soham Kute <officialsohamkute@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Soham Kute <officialsohamkute@gmail.com>
Subject: [PATCH v2 0/6] staging: sm750fb: fix error return values
Date: Wed,  4 Mar 2026 14:15:39 +0530
Message-Id: <20260304084545.156170-1-officialsohamkute@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aaVT1mSeKrSSlrha@stanley.mountain>
References: <aaVT1mSeKrSSlrha@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 of the sm750fb error code fixes, split into one patch
per function as requested by Dan Carpenter.

Changes in v2:
- Split into one patch per function
- Propagate de_wait() error instead of hardcoding -EBUSY
- Each commit message describes caller behavior

Soham Kute (6):
11ca38f0ec63 staging: sm750fb: hw_sm750le_de_wait: return -ETIMEDOUT on timeout
28df828cc89b staging: sm750fb: sm750_hw_fillrect: propagate de_wait() error
2378ece78154 staging: sm750fb: sm750_hw_copyarea: propagate de_wait() error
85139ac8c7fe staging: sm750fb: sm750_hw_imageblit: propagate de_wait() error
9c2430311e23 staging: sm750fb: sw_i2c_write_byte: return -ETIMEDOUT on timeout
915599b01e9b staging: sm750fb: sm750_sw_i2c_init: return -EINVAL for invalid GPIO

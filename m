Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695713E9597
	for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 18:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773254429; cv=none; b=X15kEsg2kGk+VEmBMqLoqpMSrQf9ekAgDnWT3RkMQT5xyEGOFqz7htf/XzLtGiHt5k3ywAAJUDsaKbZZF3SgBzRiv+bvmxCp39JMIlvAWSrHwzjVDxtNbTmOBROuy/EdLeevbWnK5K90m2sXRNVfJ0wcJz/2P4yvZC+VNGKGRXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773254429; c=relaxed/simple;
	bh=is5nN+TX0unizFQTKEQ7DdrzwQGC5E3Me2H9mDq6+tc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MEGOcO/U1Ly9XT4JIorcAENdfRXWkGvVLN2H82DfD4Ht0FTHbi0iDNk2GdfMqcWtAmRo945gw6uuhDuLl13w43Nk0PYJCYNjZ1cxjsBi+XY7ikx5/K2OTiDF8xchU6R+UsXQn5xkQ2na9DuKjolD8oudVNkQLsY3kl9D3jXcUrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rn2wcLku; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rn2wcLku"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48534237460so1507255e9.3
        for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 11:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773254425; x=1773859225; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=is5nN+TX0unizFQTKEQ7DdrzwQGC5E3Me2H9mDq6+tc=;
        b=Rn2wcLkuYtO5oKfvOOIbNwMYrlCRFygCS183n56uWIufbCjQc99VK8laYfhk2fRWVV
         ChxSKXfZ7mbMvcDAtWzuig6H+qJAVHoJ50yRd2Hm2WneXnBm8Ff/9nmdWNJF+rujDuYl
         IW1qM79ZW83fVxewOWxNCoZ5sZvBPXGu0cEzLRdEUP2nYCPDLyaU2n+XhgSsAj+KQrLX
         zhEUEonTn6p3p9Jx2AkIWeTElgCCPSfleYaqTLqGNJjfJ92hCgN6UlflpvyNZsFBe2oS
         u4wBYBM1X166l6pZtOPHOmi49qakrQLMtwoLr/MFIE51Z2hCcHv/rWoquOF4msoEWndG
         WKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773254425; x=1773859225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=is5nN+TX0unizFQTKEQ7DdrzwQGC5E3Me2H9mDq6+tc=;
        b=gyl9pET84YVulE6Q2f98KYw4CKoRmnmhFUOpXG/jyop3N6rgbnfS3CUXhKiqZL8YKo
         H6QX3W+0bfIzukI6qQqsqgUTUPX4WvOL93qh5bn65SqNeSSghHBwPM0VyKuoLgWFZ0+5
         ndbegrDHbLvyaAFILM9pSvGLAqla/TEp+eSAyuGiFur9n7OoFZBYVtetd/KEe5YK1pGa
         ZVjP26cNhlgtPY5q0jLK/K160HQW/G0pi9K/7s4/YEqdtF67p+JITvRMtH5JbSXGU0An
         s+0QuNVZbZgLv62Pz1sWiAtyRKeAJWE/qiyvVewH+F5rvNo0OW9F4+stky+uzzC+jV3O
         Ix7g==
X-Forwarded-Encrypted: i=1; AJvYcCU+p0ypXOnS+0yZnXg/qmf7LBGvj5C2xAb3xXsOgCWmAA0779FeFlp4etw4yLAibkq8UzVu2wcGBjw/zdNd@lists.linux.dev
X-Gm-Message-State: AOJu0YzRwf8EfQ/7QejIZ4AQLLVvaCSpphVLRy6x4PDjsLqDkVPbYW8+
	cNOrWxAEVQi/fA720ILNPxzls3NEJZcNQOnmf3ifaQoC7EJqskd6KuTe
X-Gm-Gg: ATEYQzw+d/nYiVzm21qLNSMrE/ab7t8xaen/JgzXcUK9RIO1qdD5Xc5PKWUVsApfGLD
	/A4Toq8dM3eghwm5l5ErjYehVml58qH47Czz/S+bWDkzoaYy8C0OuGjrx6L83y7cpTAvP6RKwD3
	GKwWZvn3pQNUbI5hae6RHTGFyDRwn7YfkUbq73ZFPp0sVhOfUF4zIzAkhgFJlt/oh9uDOOi0rgS
	wgI1/g3kgokHz+0BnKlvWbx2NgRRtcVay+U6G/6OEs922HrXO6OAs95i8kpThb3oDSI8q0c4Hus
	76PI0HgENaHZgy+Ysm7GVKJEkAjTH/ZDsD2JeJPdvcuckx+GcYYBfC3P064YMEvpaLMAxNjJYu2
	zEtf/JpaEaayIXAjPQkD1aW4TzYxqQKvsyX8koolzosc7up4A5Xh0npZ6nFgmsOUUNyJbGxK5OK
	yvI8E0hAkt07/1iaEpmYMr5DttGFjK3Si90U2LvWJ/0tFmaqRK+A==
X-Received: by 2002:a05:600c:a08:b0:485:2c61:9459 with SMTP id 5b1f17b1804b1-4854b0afb48mr64033025e9.8.1773254424412;
        Wed, 11 Mar 2026 11:40:24 -0700 (PDT)
Received: from DESKTOP-VOVUFNJ.localdomain ([5.14.84.168])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0dc8d7sm22165535e9.25.2026.03.11.11.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 11:40:23 -0700 (PDT)
From: Bogdan Sandu <bogdanelsandu2011@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bogdanelsandu2011@gmail.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	tian.shu.qiu@intel.com
Subject: Re: [PATCH v2 1/4] media: ipu3: fix alignment
Date: Wed, 11 Mar 2026 20:39:39 +0200
Message-ID: <20260311183938.6289-2-bogdanelsandu2011@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aak7s0qFNf4xgNhZ@kekkonen.localdomain>
References: <aak7s0qFNf4xgNhZ@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Sakari,

The quoted change was made in error.

If you'd like me to resend the patch, please let me know. Otherwise I will refrain from resending it to avoid creating noise.

--
Regards,

Bogdan Sandu

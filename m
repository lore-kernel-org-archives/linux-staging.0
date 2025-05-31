Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068DE1A2643
	for <linux-staging@lists.linux.dev>; Sat, 31 May 2025 21:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748726041; cv=none; b=Ze91M+3DBSwVbdpxfgW8MmjGNgCt+CnXy27aL3v9Yodvc/abkf7AtlneWHZL4bOnuO0KzMAvBxSQL8Mvp2ywNkRFvdhJ22mnSnMezrx9ZpxGwjh/FxkjmPVaMT9tBp9zt7vPN4CHfao0f22q7zWuw4bdSydCkvo1cHapjwRf6Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748726041; c=relaxed/simple;
	bh=VPPHlfqUzR98R1C0Hq7Qr40ovgOaO9nWuetLhV41n34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tjZAJfcXbBonJ+6nDr6PHbqcQaGG602MoXIzW94DmuM9c5njtwDfpI09hWuX3R7J0pe5W5t0sLL+37zPQytA8xdkKgxFOSm/bc/C7k2+wQKk4gdD0g1hgXgMda1k7aLE32R5OtWWhGJyQrrPcmEh4nt4xY7xOjXCK9YOjDiA+X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K5Bsqzs3; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K5Bsqzs3"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-742caef5896so2463833b3a.3
        for <linux-staging@lists.linux.dev>; Sat, 31 May 2025 14:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748726039; x=1749330839; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+Hw/XilsTCcppc7+np/QVEAhg7lSuqi8GdQaDLo6eE=;
        b=K5Bsqzs3Onmj4Hyf9MRzzZxKRTZ8v/itFNyfi9Yvrgt4ZTdXzwoQ6ZOy1TSMrNB2f9
         Lcc3Lm1L/2LPTroYFrkO41/gphg2ukNd1EBSsZaIxx716UBnqJ66z8mDGuedc9c4X3Sp
         BwHpMR4SacmL0oEWlfkX4TYiuiN1gXAuzRri1cVoNwZ8K9aJx8tBPQsPTiZof4LvMyO+
         d2n1QF4aEw12NyCU1ttBPg3whj71rhilT2RTTt3LRviQLZB7pyeHkftq3BHJs1GnBkdx
         bmOWequwJeaixqdA7Li4I5OiEAxiLzfpMqjq6v9TFhpdVPW8AZOFFUyzyJF5eTf70GiB
         MBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748726039; x=1749330839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i+Hw/XilsTCcppc7+np/QVEAhg7lSuqi8GdQaDLo6eE=;
        b=oeSRdKMRhYX04nG4/9lQWomwuxrtaNYbxOflPtnUoaDP+Z0/xuTcKnJS3jGBPYIG8c
         LYvNyzI/7BN+LssIyKMXYSI6fZPH07pVzcvWtMMuYb9hNKJZIVRQ5ae4yBR5uJ2zp9l1
         j3zsrTJeejk4rHbJd3VFR4zxDoCJcgyoeTrceNLHyNCu8jGDu08UahfhgNsREq1a5mNz
         ghgbIsh0rQvwQOUbVTStk5DQEjmNFeCORLqBs7f71d6cMGYmVky2FTssUFxjWvNBoZ/d
         qpobVx14+CCG0WFfrhknPx4ivSjq2L76QvAVQDPwzc6U7dPpzHkKRPQ0e6ZK3CiWBprZ
         1O4g==
X-Forwarded-Encrypted: i=1; AJvYcCUt1JAsv3cpQrSvscy468fpIISsJT26Gx+strztdL+WWu7iLoNVjvcpQzmMjvJS4sfm20mYw1BFwgIz+uR4@lists.linux.dev
X-Gm-Message-State: AOJu0YxYblrZ+ua0MNYVUW+Rnphi+5m9iYehsxljfdRxEe4A3zuhYcsd
	WPUI80kHQX6MpEuxz/WHh0Tbg+UPwSvlUg0yOnjca3EDVP6oiTzVFcS2
X-Gm-Gg: ASbGnctw5nok6zGi4prQsHogCktHYhTgvP1K3IUf/GNUHP+aIFcDECoYIZu66RavEiw
	bJ0vvMYckoqDfyRJ60JEBGIGejVT/LDyxnuklEarzW2d+f6NkxqAehUfO+OolvdVy8IQ9ONkPnP
	CGMGGU4rwLGWNdX+/Ji4BuWWThEHP3hZfOv7d8k184wqDwIxGfcOZ1AqXyZvQ4kZUQTD1t2bTan
	7mi6kcYFezC8kw5kSfq4G0DooKs9SYoNw0WZoK0OIfE5NCiv+L0X4XIe9Ibv2dVdiXIa655cKR+
	MLkof/5W+jsoGnLFcMLPlfevUgroYGgFi+3Inhu2JIRgn1NNb0sw/RWt0TmZyM+r27+w
X-Google-Smtp-Source: AGHT+IEePTRjoDKaPPluoCvoyqlgcI2sBsl94rFvsSGnUDIVsgbH2C7dGBrEm5FdAVCErZEbDuL1Ww==
X-Received: by 2002:a05:6a00:a90:b0:73e:2dc5:a93c with SMTP id d2e1a72fcca58-747bd984f87mr10707720b3a.11.1748726039316;
        Sat, 31 May 2025 14:13:59 -0700 (PDT)
Received: from khalid-HP-Notebook.. ([49.204.30.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affaf9dasm5161824b3a.109.2025.05.31.14.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 May 2025 14:13:58 -0700 (PDT)
From: khalid.datamax@gmail.com
To: sudipm.mukherjee@gmail.com
Cc: teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khalid Faisal <khalid.datamax@gmail.com>
Subject: [PATCH 0/1] staging: sm750fb: convert CamelCase function names to snake_case
Date: Sun,  1 Jun 2025 02:41:02 +0530
Message-ID: <20250531211319.55682-2-khalid.datamax@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250531211319.55682-1-khalid.datamax@gmail.com>
References: <20250531211319.55682-1-khalid.datamax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khalid Faisal <khalid.datamax@gmail.com>

This patch updates various function names in the sm750fb driver to follow
the Linux kernel coding style by converting CamelCase names to snake_case.

These changes were identified using checkpatch.pl, which recommends
using snake_case for function and variable names.

This patch is part of the Kernel Janitors cleanup effort.

-- 
Khalid Faisal


Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1995C34751B
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 23:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781567041; cv=none; b=bfVmeTxbCE021YSJ0fWwjF3QMFUpHMoISVU89TT+J1sTiadt3BKJVx4C1Zh6x9VLaz8ECY5tVi3G1K9hu/ouu8WmtrdPVcAY6q3xsc/fMvZzga0ZFxavUS39evssZeBcnnp5cQrYFgnryEfZd2Ne2Qahx4l7j93Shq5jmFbK8UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781567041; c=relaxed/simple;
	bh=PcgT9uG0KV5DYCJTkROERAzYN6/H+TGtluYKGweNJO8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GrNUJrSLdR19OjMYEYEPau7Gr4vJTPyKpdmxUCdypuPV5ASlchSnr70ocgHY6ZwZee3his+cyLRja3Wiovmz9n4/dkruqVN5cVO1EFoxxz+/IyYb7GZFwRPctsMLhvAP0ep96eUn2IF+WJBEtE+JcF5XayuBUUSvdzfEQNxymNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iawsoek6; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iawsoek6"
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-304d0ac5e3cso9104501eec.0
        for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 16:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781567039; x=1782171839; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nF0GRul4E55PQK/Vp20D58A/vZwcYDX75EIp7HY3KBQ=;
        b=Iawsoek6V1uXj8zHIpYMWS172l+85bERWbIM8jIisMv8qus1znwkM+k5gyRlE0Dubg
         V24wEDncXeNNHfSOSqBI8yk4Rx5cL3SM2rBsyorWZ9D6v2fuAmRlhS9k8DU3InhC3+ez
         U6Td0MHvuBs5MNSieFFsdRZH+kbMaN4ueSoccIpdzShr1lP2oz0uRUlrSk3YnlS2kAMa
         MUhQYJ55lNF3tUYml0PJIYgDKGqHhatzRFXnzfgb7p8S/7VCLKpZPIgLI3Vc38TjnzMW
         UlEz5G0TwKiwKMAHzm3cWWYwr3mQgJ3LXLApXNbftkBcHR+xVML30bEk3dnHVCUTnMbi
         xHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781567039; x=1782171839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nF0GRul4E55PQK/Vp20D58A/vZwcYDX75EIp7HY3KBQ=;
        b=nQJvjkbRCkBYdvZjULv9ViLpDf3/i+eLsoy1Vqu+nZtZ1k2d82RFTHpuO1E2qWDht1
         XSAATih2Jcp1MIPGLPXMmVigleb0Ji8hGHBowdZOE3pbs6zaT6gB0HQiHFP8LNlqcyg7
         Z0lxNosvyj/+zMVGAKFDwGI9BzinV5KHNg4JidwU9wwUK7hJCBr/kKWiI57CFZFN9VpB
         Ba4GtkqO0F5qRSanf8RrL7NvuxHtt/obE7dJ1QA+sb0NCDn3s+4c+MRsjVnDW/9GDctF
         j8ZYvZWVspP0IW5DEgL9uI7iyofwSxkAKFaAVSlOFZJfURnHjSWTgVSsKH28UrPctOal
         +pzA==
X-Forwarded-Encrypted: i=1; AFNElJ/cKCuJO6RvbqSgAcTB81BdKcc6EO82nribKyryTGJayHr4RcpC2pOEwyicNrJYjMrF4s5gJpiXckmhZ9e4@lists.linux.dev
X-Gm-Message-State: AOJu0YwZvRV18EXKaPWJKSZJF6CF9q9Hv5dOTIREzNeUtrZtJRGvwXf6
	xCd6CuujCHH+heOt8EYoZwuD8b0WZ3g3bcZdx6XbaRcTNoJ7VQ92+H33
X-Gm-Gg: Acq92OHZvR+s7dec7sht3P8JQk5aMwb8cEUWTD9cVy7D4rO3jqqccG02SiUo5WAEnIF
	7L0W05HSUeHPMhlx+E8CkK/9vOoohGzPRVxJa5Tovo/7rxd0xP9ZNAHSWwy/vZ1YtsljDPCIL3M
	Svv+EokMlIblOXZYd4LQUP6fmZXIZmB9TYRDAbmDasBrZQjcwom6jkxg2S0s7UzQT2xfIO+pwFL
	JNHyb8dI3M3EHJR4sfAUExLxD0heERecEpebsMnpCaxcPh2bbqivet5oGeacDjMpvI/HK+RVThY
	ljimzLUOA90HZlkAoy85O6+VIdByyCcFn2z/CkQbAtJnFwLp8N7SKpVAbtCzP46d0FSK1/v2Z/3
	dkvGX5ouBmfl6JrstK9MULMgmjP7UHB5960JqmdZZuI7ciJiOvCx/lf/DBBC9Q4gT4xm8GWXLqH
	QU4DRnU1jpsQBwTU+5jcMotPmThK4i/ILuN5lsX0sR9e5ENuXQGy9UV7c=
X-Received: by 2002:a05:693c:3742:b0:304:e865:f7d1 with SMTP id 5a478bee46e88-30ba5f0313emr858012eec.25.1781567039107;
        Mon, 15 Jun 2026 16:43:59 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e92096esm16988335eec.15.2026.06.15.16.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 16:43:58 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2 0/4] staging: rtl8723bs: convert update_attrib path to errno
Date: Mon, 15 Jun 2026 23:43:36 +0000
Message-Id: <20260615234340.97299-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
 - Keep braces around the multi-line if statement in update_attrib()
 - Split errno conversion and propagation as suggested by Dan Carpenter
 - Change update_attrib_sec_info() and update_attrib() return types to int

Hungyu Lin (4):
  staging: rtl8723bs: simplify update_attrib_sec_info control flow
  staging: rtl8723bs: simplify update_attrib control flow
  staging: rtl8723bs: convert update_attrib_sec_info to return errno
  staging: rtl8723bs: convert update_attrib to return errno

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 55 +++++++++--------------
 1 file changed, 20 insertions(+), 35 deletions(-)

-- 
2.34.1


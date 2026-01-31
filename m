Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D06F33E377
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 18:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769884065; cv=none; b=ZD2FylNMs1rwCi1CQfiJmLylOjfuf9bzLDbPJdkWxwckjqJ/tEM7cXp/a42l9Fy/flRxEKjmwRjsx4MoFGHuNRJX6sFn8ZrJ7uax6wL4JkG8Dd5Mml4DEiq/mdcbctAfcGAm92QudZyDNvwYFl2DSBv7J7U0sWORLRIiDXX1u6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769884065; c=relaxed/simple;
	bh=c+Sr/cHwLew7b6Kit5G7DAvVOtph0mX6p+Cdwx5M5SM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iKll25efysjoxi2nbUWlkyg2vtGMlBGnWrzhcB9LYo9J0iodLi4BGEbx65WsLGkA48TtDOZXGTGwtekKDErWBCnyHt8HUgQeRS/iOQYSNzzCbUq4FvyB1CQF6z45nIUnOhNokdu1/1Aim8F1gF7IYgtg50kKGJhoTXlpNpTax00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mWXmN6BP; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWXmN6BP"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b71515d8adso3215382eec.1
        for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 10:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769884063; x=1770488863; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/EIX+Ff+QEnzGMcqsIIUwBmMLPj6UjFblU3ADrfo8RQ=;
        b=mWXmN6BPSncXrfJvfF50g9TgqlfJuM2X1jABxzC5Yhuo0Arc7NlJ4M4kwYDz4nMk2p
         mMeD37Z8QIDLzKM/8dPW9GokD5WFchJ2tVBLlOy6tXK2VuMj0AB91Y1JGS6xQstpdU3r
         aCk8enrObfZodvOWmPJiCsDFrHQgRSJ71tFd+kecAZ+OPuCuyY/lk84xAQVYAojHYaKD
         1JChT7qJnT/TrPieXb5+aC3InhQjGM5bRuBW+dVyt8fAwvay4yc+ApEANg6OTkx1udZR
         4P76jWXQ+M5QLKy1O13754SDYjZWR84dhSSHuBnVlyIapINmasX0zS25KjbWHGASlSBK
         wVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769884063; x=1770488863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EIX+Ff+QEnzGMcqsIIUwBmMLPj6UjFblU3ADrfo8RQ=;
        b=wQ28oo/sPYSyj6QNUxS2gLzpsdNdwzfpTWvpgCJB39tJC2OowZnyvKO2r2orVWHCJ7
         84uQAPFokaUjTEYa4WCQfZdEBNlgCi8MMnOE5XrBS+l0MGhGvgEsUPzAFFR3/9ngA3Dh
         QXUeWqnB7KWDlhEo0MCHZz0wcQu8lsgZs+gv1yIUkzWeScWiTtq0fTUsyNkMDPLTSvD4
         6rj+oB+uy4qmsJA/lRlXcasDDvJpUy/JXpy6hUv6giqxrDjWQ8y2BZQO6qt9K0OcxiP/
         hc6XZUCVvH1oy1vs03W5yIQ+/bq5dwaBNPnkFg3yqbH6/0L8zCKH2h//k/UykTMo7zoo
         XoNA==
X-Forwarded-Encrypted: i=1; AJvYcCVvZZ+U7g3ROqE/6asEO3ZOF00OV87NCNb9Wd1zfRYCye42PJona8RfH/SwqZaZN8tdCmKiWf8x8CN3gMde@lists.linux.dev
X-Gm-Message-State: AOJu0YzyG5kjDhHgenJclgASJMu0/PGcOlGWl7mRBFVuaZu1RFMzHbxL
	/MbDKPVhIH0tBUA4fjIRMwu1273YqU8coVjBc5FRcXQURf5icOMU+v4K
X-Gm-Gg: AZuq6aL44MKxR0fuTOmrDJmRAwVJ5ZbadVz972/IkkHRQBAqYL76jb0D5QqW6eRSQPb
	HuREAZOiZbplXLHB05qof/6A7hesCVA2IsKrhuF4ukjfv4b+w2gFfqVV8nT8654sbl04jWnnPon
	2KW1t4YK0eswL6SKCzcXcBDMi0GPxadbXMDvgghZ8TDmwtUkFMh043Ud+FqUo01Y+XzmYzsRXqS
	vFg+KMHh4+SjwQGDj5qOvLAMlZxPe02fqPipMkZaNHa+rUleYssd0mUjXkixsNISVJBQM8yaeK1
	qSN1zwUAAwUYH0pc2/w+hllEs0ae3OZDOD69bIhDetNUYMMfeXKl0YEJyL30SSw8PKO6OMundmy
	jf0uH5tMLecaM6d8GK3WhN5qJw2aybO/UUIdoTD3SMbAIA7UFI3MZdXzcfAG3wlf3Xgi6lQ8Tf+
	ykrUpJ9MUKPVoNgEIgYPWLOWt+ggr5BlDs
X-Received: by 2002:a05:7300:a146:b0:2ae:5d9c:9548 with SMTP id 5a478bee46e88-2b7c88faacbmr3151247eec.32.1769884063265;
        Sat, 31 Jan 2026 10:27:43 -0800 (PST)
Received: from gustavo-arch ([2804:14c:f25a:845f:5b8d:2e7c:d238:2d28])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16ef3b3sm16105513eec.12.2026.01.31.10.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 10:27:42 -0800 (PST)
From: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Subject: [PATCH v3 0/2] staging: axis-fifo: refactor and cleanup
Date: Sat, 31 Jan 2026 15:27:30 -0300
Message-ID: <20260131182732.62857-1-gustavopiazdasilva2102@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up the axis-fifo driver probe function logic.

Patch 1 aligns the struct types with the OF API to avoid potential mismatches.
Patch 2 refactors the parsing logic to be less verbose and removes goto usage.

Changes in v3:
 - Split into two patches as requested.
 - Dropped the "fixes warning" claim from Patch 1, focusing on type correctness.
 - Link to v2: https://lore.kernel.org/linux-staging/20260131140517.29771-1-gustavopiazdasilva2102@gmail.com/

Gustavo Piaz da Silva (2):
  staging: axis-fifo: align fifo depth types with OF API
  staging: axis-fifo: refactor device tree parsing

 drivers/staging/axis-fifo/axis-fifo.c | 80 +++++++++------------------
 1 file changed, 27 insertions(+), 53 deletions(-)

-- 
2.52.0


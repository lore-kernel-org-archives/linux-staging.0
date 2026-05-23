Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30F81F5825
	for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 06:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779518901; cv=none; b=DbZinBcvWOFrmAEwNOqUOsJYDjHp9ZEh+L8gs/Yo4GuzDERjObTsbhUxnu9jVj22ftbSZz1PI9az7cQKgRQgKqZ5rZflgX4l12nh6kK/GhHVAQhbfR15Y7F97vN/vw1uPf2GZr2VbHX+sshXehdF4Lm/xGEwZIv+4h0OgeQqp5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779518901; c=relaxed/simple;
	bh=OhJBIZtPSl37iTCor/8pHea1pmiMgmwQ3W0MWlsm5UI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KkADz3KpCBCsykM1IBhi3+HCK+rRLydK3DJoW47v5ALibCyS8K8GCtpbNvJxlVUj7jCEl5wr7DDrT+9OZQbE3FzNw770B8nQY7Lt/NLfZGKtaoYcH7A3elq9iVZjEzU4PriHr92ctF8qpeSI7oJmrVM4G/hIVeDoXDvvsOCYC00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EpTUo+Lf; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpTUo+Lf"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6870ad8072eso4337539a12.0
        for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 23:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779518898; x=1780123698; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cvbKAQfeepNA8bbLBATd/Y6PlNgiV7+B2hbMPq8f+ok=;
        b=EpTUo+LfuiVZ33xNKPgdE1gv4iMZhcGXOBAyW4rww4umUPKJerOG3kWjL8nc0IhXA8
         fn/UDL50s2IZOgQvsxr0o92yjboPrY/hpuqcQhjhEBuD5FcBdSiWktFQEX7CniHSnY5D
         0OV/3uueU3WJ2FU0nOcgGZPfkZjDSEFPOonsk6TCCmHiyKvEHrJBSxUN3T913UazS4Gc
         vtljKRxS7wlRaYDmSDPqRsKPtbvjOCaFHH0LBCEMSAGiUK+Ss5tft19ttZmr+Mp62ycX
         2ZIm3LjqL9vQvDFx5c61PfsQQJdGHGJIL+1wWh2Xah7IXVc5FbQEKg/Uo5duYK0uN5be
         QmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779518898; x=1780123698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvbKAQfeepNA8bbLBATd/Y6PlNgiV7+B2hbMPq8f+ok=;
        b=Gx+n+4Mql0I4CiBM32gU+hPhT8OijMkIusxrwRCoPmw5PV0+XU6140HgXhQdX3bgrW
         N4e+6HMoOk9SaIc6YZe2bDQ7A8Buz0/vNOf2Suj1G7aItQPHUNju0Er551dQN8EPo/m2
         ROTlpHfU3T5DRK6kNld/he3U100oqgRivLS8+V20hza8p2S9pOEyVZRAS+g94ojVPg+/
         p4oCMsmq47ngr/n/toL4DCFycMxa0/ntTn2FqiXWYa1Arj7+bipcdVGKe67OZPMm922j
         LlaJR57IDEdkCtJo+cj2eWkpzfE7kLjNpdCecpgWK0AB/Vy9x67PjZx8W7dY/Gm6xbrP
         BBeQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Vuqkijqjjo2n9DFpRdtg3pr0z8RXoPffwKvxeqycKV6sM5m7RfbRg4uD4Qklpmj3InZJiSonryeWrwOJc@lists.linux.dev
X-Gm-Message-State: AOJu0YzJ0TpUhVj9rfKIpJLliynJmde/7vMFc2/KJMHV3ThIU5vsf+58
	04Af3ai1Aj7YpPFhiMi3Jh4lw9tjJ9Lsa5qTFxQuonCf+ZIxAQoi/Pv1
X-Gm-Gg: Acq92OHUE8osU5IyS2+oowlpt+Uv3rKoc7jT2dlHcgPEwe7d6gn4CDwRKVYcCooj8Ip
	uyxrmAqRgqqyvHRd3a3E8Ep4U0TiBI39THvX0N5bIQIlwuqGFAmI4Rmrl7PQhVnLNY2uwlGbcxj
	CxXQByGNNEmNbld1BhkTiIlj6dqXhvlu95T8sxwaK5TOd931gt1tunK7xmb/wdK124IrxYMryKm
	XHTm7EVzQwsb6L55+7cS2E9QPgyhr0G6KPb3qoe72Ih3p98VuYiVx2pxRKDHXbeXI7DdIdqnCOg
	t/Qf0EkHxv10h3Tw06nV0KUIlj76/CQGKSf2JR7AmjylRJAFGTJ/Nkm0SDLWvOEBDCUFjAR0FCI
	T+jbJA5efXzIBd4+l1ArC3OaHbJuG0itbfGnHatXfj4Xf/sv7A4iVRzmHdk/Waa8R1jRWBThguz
	Fdq4s7U1RUbf58JrFxPwWLMEc=
X-Received: by 2002:a05:6402:4049:10b0:688:e2f1:bb2f with SMTP id 4fb4d7f45d1cf-688e2f1d224mr1253439a12.5.1779518897892;
        Fri, 22 May 2026 23:48:17 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bb62b6dfsm1532272a12.30.2026.05.22.23.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 23:48:15 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] staging: media: tegra-video: vi: improve VI graph building logic
Date: Sat, 23 May 2026 09:47:49 +0300
Message-ID: <20260523064750.35553-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing tegra_vi_graph_build function relies heavily on a one-to-one
match between Device Tree nodes and media pad links. While this works for
simpler configurations, it causes issues when Device Tree nodes do not
match media pad link logic (e.g., mt9m114). Switch to the
media_entity_get_fwnode_pad helper to verify and retrieve the correct pad
linked to an endpoint, rather than assuming the endpoint ID matches the
pad ID.

---
Changes in v2:
- fixed use of NULL fw pointers in debug prints
---

Svyatoslav Ryhel (1):
  staging: media: tegra-video: vi: Improve media graph building logic

 drivers/staging/media/tegra-video/vi.c | 78 ++++++++++++--------------
 1 file changed, 35 insertions(+), 43 deletions(-)

-- 
2.51.0


Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB3827F728
	for <linux-staging@lists.linux.dev>; Thu, 24 Apr 2025 19:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745524598; cv=none; b=s6WAy6ab7grQTneyaDlBHTR/5wL0+zhdhn7XfMR3FSVrAEbNtSvEjAFbEykjW7vjC9qFxoug5nsmzIHzfIT/YtYJj6tSCLGdD2oUTkPkRgGlkFlk4zBRSxuUJCPeo34JC3MUHECMxcVCpU4WJDvi3vHnYbCH9Mg3KJoA++VFZKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745524598; c=relaxed/simple;
	bh=qA9YoPq6CuoWeTtRRakNPovo5iHdyScKFmDoSPkkEoA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JPR3Dcoas4UZnL6pqyzfrlUSZ/OfroHfXwoFO6e4mQZSlbz8QO5goEZ05l2CNKVTeBVCgegUMH6Ohwl46HBhTj5SBhxCAdoAv/X0/SQsE1yaEDrHX+68ZbR0vb4pRvtQt4geeyXS3oQjWK20FVhfgkBjFvlNvUrb7yIsPh99TJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GW15qbsx; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GW15qbsx"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso9943805e9.2
        for <linux-staging@lists.linux.dev>; Thu, 24 Apr 2025 12:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745524595; x=1746129395; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GNd+hGIfs44rRYDBiAICDUAQsHqXFgJsXPqMw+zJJw4=;
        b=GW15qbsx3dTYREUlleth02qlP3SFrNubMp7HyKJSLsrPHr2Y7fGeExg4FbJCqwOIjn
         B6r2e4/jMgc5CPp69CuAMvJCG3ElGPjMuZPEQ+fElEWasstgljOLqo2ryQZoKgNUknhQ
         MVp/6tgI1TWPiZ/tCEJDkJ/YpuxR+rs9XPfVBkmKsXDiP8lWy4nE5HEw3udp5pt+lIg3
         eefu79fNe5C7Cg0fEZWvrObD8wckQMy7Jz0RVdIzzCOduyN1Lc4VirrKrwTj14IhgJaI
         m57V1sYMRyKNlz53Y5Iywmc5kcxOUhDdaEzP8fc2jmevk0Iz5XTY3ZcM6lHJpp5Ub08O
         /CbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745524595; x=1746129395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GNd+hGIfs44rRYDBiAICDUAQsHqXFgJsXPqMw+zJJw4=;
        b=jqLb6cBWOP7EzMZ4F6nek7LCUmKX2i0zBzZW6E9jq/r2fBvMjUKWndcMymUCdDFXY+
         sJAfyG+giAeCHpcbPLFAKhH8BT7UAmiz3NFpkOJHWAX57iOP6i9Q6UujYU0Uu6M9uKh+
         OsrowSsL/H/r3p4BVM9iRVcojt3O1lhsytCMWnmWc2ensY/45n89BQPxNq4IRwUFdjm3
         oxnzw+uyeNiob0qwziUU5NdtphzpUNlYVVf7j3rJ0fT47ISP1yvf08up2QQc69RpW9PT
         +a21t3oFHD/TKg4LS/NwDvmm79FZMGJvDOvs3IsArGjle2Bbyrhtoxl97ZmWtZeDGvYf
         UCMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBGbKxC9aeVOZDeynz4vZOI8/gcJgoWEgpMKP5pzC3A+KiG4SZsjGB6jdBuoG0SHkazCKMoUtbP+STwmDC@lists.linux.dev
X-Gm-Message-State: AOJu0Yz22ZqIzWaZCxAqZI27ucorKSI0jmXaRUcbA0aZ8/ZV3gAiAsk3
	YmzeLxw0nxcTYsCtFknw7u1Wuh66Wsu6B/l8XnMQu0VSpJZHrr17
X-Gm-Gg: ASbGncu7MFaXj4Jc8gc1r9/OuJjZbaOcjVkml79NhwU1e8aeB2dB8yXhvssZMIAmn9y
	QKvKYiCv8c00OAh6x1hijyoMCMQ/9FR8chanpxTpRZyM1M42y2viplmPOwQqz4ysEp7+DYolhSd
	ckxbP3m7SHiTiDsjUG+/l6sY9vl7tqqmCghgg4u3Dvu6dQtHrkHWJps8O/CMIeE8U3eHQIWFR9p
	9tO7A2vq9XoxGvdtNxlIiKamEnKaJxtmC4oWeANP4FYVJAfn6hmP1mNIUQf7pOnkJfkpfmx00FC
	9J5IIdeRBnIY8zgSQgrS/UkOW+z8m24eQmdshQ==
X-Google-Smtp-Source: AGHT+IG7dyXDbntHmwfxv2xygxQxfNjf9DIjhc6tLqZgw8oly1UT1EXhRIpaV2+90MHpm0HStcNuUA==
X-Received: by 2002:a05:600c:444f:b0:43c:fbba:41ba with SMTP id 5b1f17b1804b1-4409bd8e0d0mr25220135e9.28.1745524594894;
        Thu, 24 Apr 2025 12:56:34 -0700 (PDT)
Received: from pc.. ([196.96.160.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d8842sm32385865e9.31.2025.04.24.12.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 12:56:34 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org
Cc: julia.lawall@inria.fr,
	karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] staging: rtl8723bs: Use scoped_guard for mutex handling
Date: Thu, 24 Apr 2025 22:56:24 +0300
Message-ID: <cover.1745523325.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset updates the rtl8723bs driver by replacing manual mutex lock and
unlock operations with scoped_guard(), aiming to improve code clarity and
safety through automatic resource management. This change makes the code
more resilient to early returns and error paths.

Erick Karanja (2):
  staging: rtl8723bs: Replace manual mutex handling with scoped_guard()
  staging: rtl8723bs: Switch mutexes to scoped_guard

 drivers/staging/rtl8723bs/core/rtw_cmd.c     |  14 +-
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 281 +++++++++----------
 2 files changed, 132 insertions(+), 163 deletions(-)

-- 
2.43.0


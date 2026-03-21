Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F659322B8A
	for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 18:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774117428; cv=none; b=ET9D13PWbf78+Uln/4mxV4x+gOjH5/YNGhf5VjmutSxSlF4p6/SY6DlZJQuuXsNtgUl1FyN0w8oV6/XOzMJ+7DC41Agx0LtuuoWY6cVb0BJzuVEHKUN3s8b54WOMqQUsRzg26+HLDIUVjSkVj8lFylRRaglFJ1eMsJhgIxUyPQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774117428; c=relaxed/simple;
	bh=M45HBzZi/DPHhiEVVmFrD3PNcMJmCosyRbAWgQNCU4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PVHM4ISzVgXGfCfcwJ45H6KK+J73l6sw/XvCiTNhJ48JGitih/j4Dz0XEcNVl58fzJtH91DxXtYSA2Io+GWQBeZPWZ2xPdhAlOM32/86xNoDRP78DcL3x+8NpJcV2D7hq2HanQnuH5wxTf+BOEDJa5z7yABiJsM51Lh51xrLzvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+14sp2k; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+14sp2k"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-829b8b6c4d0so2495821b3a.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 11:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774117427; x=1774722227; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M45HBzZi/DPHhiEVVmFrD3PNcMJmCosyRbAWgQNCU4U=;
        b=A+14sp2kKuBXmr8dvpJtnpSvbUWhAowud6F9Q3kOI+TiHBV4q4nluxgoqyPbdahqLO
         igt1ff4EmJdnKNf5cLlD5tyNQFRKs9dCxGO5PkdkXEJMOZlOUe1gIHOZ0p59d0Vu8Js5
         lWXFXHOc/lqWfDGhHFXUARscxXE4DUetpu/WVBXfbHwib1FigWxKQPG3LkfVfQQHwt3J
         9pG1uNyYiaqI8DrzfryDkQ3xKr0hg3Li5it0i4SxYrhoYuDbVItKka3oMtUC3fE7+lqm
         yaaWLcdPiXO2GILKQ7lPkBeAovck5jH5AovEJS1WdxsT8nn8uz64f7AfYJ6uYWXWRrcF
         KV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774117427; x=1774722227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M45HBzZi/DPHhiEVVmFrD3PNcMJmCosyRbAWgQNCU4U=;
        b=maXPB4IMDwToalBhJecf5TYDwqsVH1FulmlgjxUtn4f8/sA/3Df2T4wOUFOMH3iaeo
         wdfHtRMLx0r6kFFaal5wUwbEM+cNbKQgmEkZM9/SGXRqSHW63HlfyaFnu2bfFAZauia9
         pEahoJfntRyF5bwZ6licSfLbLOVWYrY4sEpFltRB3z6h0GxnMD4yEz+kd1AqGVHNXh0j
         ezpCusme2ZN3BC+vDBSHpYXIH1bmPo8nRxmHiAaWJNqx26EkqJDLqy+e7ZiPzrjFMPC/
         kT2TOQ7E53vx2gneUHnSN4dLQ6mBNWbiOWsPZoMsQiU7VV3tfTS5RCcaBjvIo78R1hTc
         9viw==
X-Forwarded-Encrypted: i=1; AJvYcCWpyGfxfFuIfMcbydGwV8aCTptXYPKOW37+uWD3da1RKe6kAOuEih8XX3KDVIsptwUJ5/l9dDUuPPkDrSO4@lists.linux.dev
X-Gm-Message-State: AOJu0YzNuZD6Q1eSOQrwpIj1PgKpXTzhwh0Dt9Ts/nGkWBcxug960AK2
	gALSKulfzArdU05fGtqJgVIrsbC7IbJj74JkhaAByV45T78sD8j5ZkNs
X-Gm-Gg: ATEYQzxey8JE4vv6Gvn4vijo1WsUli1H/NquPtn2YRxYXzZph81ZHSCcr83a/JjzW8K
	1Mvq+rh9vrUI1Hra+Q7LEHQXDxozpZqfBx+JM5yGqWWh/QXjB9t8YkZkaZrS0eScAuh/vn0WHB0
	w4kPhM4NMcgU5PY+kYgnlGsP/KiTR6kJh0bCM8y6YIM+KZ/NHlXKkNpfqqDgDjgSJJP4TymuisX
	Ri4UwYm/4frO2gX5ESqDwwkasqyb+DXNPj7lxDP5wZ4iAbmc2etqlStjfEo7DaVo0sB1Tgescbi
	RD5UVchbz3iClxBtKTqhxi23E7BHKb2QKGnX0x9P8zNGjf5QU1TOW/oEDHEslSRGbkkQMUdrtUI
	hiQa9OdhLmygReA3apa5W3vRpjMY2uSvRJmqCs4CT6X+jB+qbZhupXjzwl7mzzqw/uHmXsx2EwO
	qzXKDO/8LRinv6zD/oidYHbDi622BzKWsFRchCh+A4OpFLqQ7pfWD9oKwqwlRWUQ==
X-Received: by 2002:a05:6a00:ad03:b0:823:9c6:1985 with SMTP id d2e1a72fcca58-82a8c22b807mr5751693b3a.16.1774117426892;
        Sat, 21 Mar 2026 11:23:46 -0700 (PDT)
Received: from avinash-INBOOK-Y2-PLUS.bbrouter ([60.243.255.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03aa79a8sm6047357b3a.2.2026.03.21.11.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 11:23:46 -0700 (PDT)
From: Abinash Singh <abinashsinghlalotra@gmail.com>
To: abinashsinghlalotra@gmail.com
Cc: abinashlalotra@gmail.com,
	d-gole@ti.com,
	daniel.baluta@nxp.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	m-chawdhry@ti.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	simona.toaca@nxp.com
Subject: Re: [PATCH] staging: atomisp: u32 over uint32_t
Date: Sat, 21 Mar 2026 23:53:39 +0530
Message-ID: <20260321182339.32229-1-abinashsinghlalotra@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260321180330.26737-1-abinashsinghlalotra@gmail.com>
References: <20260321180330.26737-1-abinashsinghlalotra@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

please ignore this patch

Thanks

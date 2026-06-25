Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA110367F31
	for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 08:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782376400; cv=none; b=RdTUN2Ydt/0lCHpd3Q28cROQDZ91sZn2Ll10+fHkEY+91KporPNuv7a73I1T0ixwMkxn/s9QiRxbemoCfGL2P44+2G9N9QXPjzSzJPSjqT6Wuh+ECrD5l8fgvyeoKCQ66GHozlvqyONHafwnYJnf96WepRtPH+xHM+lTybawkYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782376400; c=relaxed/simple;
	bh=OhJBIZtPSl37iTCor/8pHea1pmiMgmwQ3W0MWlsm5UI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BDsipWV4MjSCydHcCgTkZv3cntGV/Iu7MFuMKSOCoaxBpBM8Yr0XbxdNGNGxVnSrlukBYg60t7A9jECHGwxd1/HJFMyCTOJqCFq4dXQc42pKreuyxQ6U33jxyiIbdk9IHk0fJzhb67t1Z5dCMaXc9Z0r+UuRw0ddaKrmDnawVVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hj8MkWWu; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hj8MkWWu"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39669bcaadfso17630571fa.0
        for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 01:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782376397; x=1782981197; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cvbKAQfeepNA8bbLBATd/Y6PlNgiV7+B2hbMPq8f+ok=;
        b=Hj8MkWWuVJNZqjoRi2n0a54Prwt/cIByDgAt5745amWa/FTC2xI3XDgAg6/pf4yebl
         FUAlOBJWCc4gWeUVkbmDtnAvPqVIeDmSKKQCaLA3Q+2v89U0+jxMwZQcXJC5+Fxf3eiA
         b72UMxekNA4fRMoeAkBnYEYAnz0XktflIHfFWU7cEVsx7AzfQB8gfUk7e7gEPrgb98/i
         1d76BUMkMSH8dx/IV8dQrgD3bRHa7tUZ5B9NAuykxkML16RccaRr8kVPZreirMG5JSWO
         I2NBL//MSPagYm64EkvSP+IlLKxe6mYxC+6Tj3Qt3ZXCbgoKFc2dxdGxh/ixJWXrGLC7
         m67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782376397; x=1782981197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvbKAQfeepNA8bbLBATd/Y6PlNgiV7+B2hbMPq8f+ok=;
        b=rySMMI+cGJZbcXeOI/QamFmSylJ3PTdDNP5xzDj9+uHMfa3bup0scth20+0LJzi6UE
         Yd9oBNwgAEm35ksH9ZAqZkAY10EmdvKjW00VCw/llud0STL+ApBs4m72aiH42RJ1vfp7
         xMDyu7omyNPYW3S4gvKRfWCXqctul3SQUffHBESe6H7f1Z0sbXKh7oLwxcoUJ4tPcQla
         4hUfqi9ROjnUAzd0rHEbxVGIg9eMyy/53Pf0AwAYAgdwMoBo2B30spVA9a3LdcVV7f8i
         YFWsLOKrGy7gSAUEAXS91Pv/KUMw4uT4mzYC47ezeLEHbqWJblWNyE40fqo4S/Bz3fcv
         KmQg==
X-Forwarded-Encrypted: i=1; AHgh+RpfMDl6/wC13hVghxkvIvGrfv9sDGRVJqLOZoPSEzN3DQRzGrikKENI5Q6szMqjgaw792sl4qWlsDxoet4/@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2WLx7RIHAOPeZs1Ezdce+buXrpFMUcfjWQ09vh9eExLwB/zQH
	VlF/9z1C0b7rWukcshmMBgUMFX/kSnB08ay9ODheVnZx7mOWah7MQX+m
X-Gm-Gg: AfdE7cl1zo2HPdgQL3y8H89JMtMAZ/EmJb8aMCAo3U//51j1uv1+G6LncKUDPsE/s3I
	szC8N6nnTWFRwEqB2yp1lY9c1vPmhFCW/ChZ0vT2txg0ytO6ML5IQPJAXRSFfKs+5g0PONni1W4
	M9ShQIUlm33FyaaF2M+TZYFAfgL3p17owkWlrpVdUKe0uheFKZpvhIqHPhurfSpYbIobQILJ8If
	vw73dXVOpsBoClJWIYyTBXZNP6eSP0w+YTz2SC+Hf/VOObpqRhiy6itnUbJi1cDzOf9uvnjkdc4
	iUYXtOAwE/WNUSJrV7oihmRfVpZqQ0DdGa4thJOX13XXMxfnQ4sbVJYA+TXAV6PrzS6QA3OgRsW
	YsJ/cqRYSeN9+jNqs5JDlbl3lcOPxhSln1Vx2heSlA7ZVabm+Rf2TtqwD71o+n0cnYbFvev4b+S
	RlnObGFtqmPd2AbQXK9jdwas9s7x65nDZkIg==
X-Received: by 2002:a05:651c:893:b0:399:83a4:4f2c with SMTP id 38308e7fff4ca-39acb635f41mr4003281fa.18.1782376397041;
        Thu, 25 Jun 2026 01:33:17 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999b1b143fsm40327521fa.39.2026.06.25.01.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:33:16 -0700 (PDT)
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
Subject: [PATCH v2 0/1 RESEND] staging: media: tegra-video: vi: improve VI graph building logic
Date: Thu, 25 Jun 2026 11:33:01 +0300
Message-ID: <20260625083302.71651-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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


Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83CA4A2E33
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 10:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580242; cv=none; b=E5qz1Gh3n3hHUg2S6lCXn1eEYLw9QdIrWv1qUk1YEg/1E9cmczoHTQY/KkSPfD50iGG8CW+bubZI+z5FXbkleFeE0XVVy4oND9rrubu4VQODZlnJNdnP5A2Jc4N8QhaiXM8rKpy6vVIcJgD2e9KINL9OQhvWms1RTOauYcrQDTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580242; c=relaxed/simple;
	bh=nMF5wmtNIU0TdQwozJkWBIpubcYRs7NEVSZzMuEjElU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ISps2F2CkA9b0Ly8L+GNKDlzlv8YqWklOHb4h520VqksIK2ZBH3K1596V9qBJ7SpI6D2UdHRpsYoAmrhUbwzJcfKumDiTuj5+bX94AUJ0b+H0eC7NNEpTCpTEqZADzEXFYEGHaxY9CtR4JnPdWf7kKEi9DcA4j0wFc6wPqa0G7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1GM6vkC; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1GM6vkC"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ba545100a13so907053866b.2
        for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 03:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778580239; x=1779185039; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RBMmjAeqhyczJE1w2fvu/8tw1IKm+NA+d/AMe2qIoNc=;
        b=I1GM6vkCgw84ke2iUHwmTQlVixxItmWovgo0+I5IkiPIsFWsS4DiNGF0ItIt+adgKX
         c5E2+tTnXJOqwfxv9d+8TA+cBT/CPIPLo0UU1oakCpjXXWdHo4IsuaRfjoUtJa19j7BN
         1Umyui6VDNlDGCNvKPORA0FJrGxDfRycjQiN4wBTv50wAL9FJ93BtiZ9nZtlFz6pLUp1
         y3hwNeZfhoiOUeefz2IVdS1y55KjAqC4lCpoREHxv736Ha1RM7uI5DJ7AucTTvYr8u0u
         8MQaOLPrapxmHmtclcZHsyh32oAx9jqzEYaqiVnqKc3aMrpmY9Z3updJDqrn5VpOpwy+
         62KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778580239; x=1779185039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBMmjAeqhyczJE1w2fvu/8tw1IKm+NA+d/AMe2qIoNc=;
        b=YF9wAk/nMSGjScQRs5KNqYmfrEuNwQGCM441ZVuzjPp0GXYX2r1m7NjDJ2e5DieXtZ
         JyuAWAvXK16Qv0Y/aJpmhU76qNpExqY2o2+ayO+huLlA+r/EF2prFuzhRz5w+yh6u4DD
         rCpMaLsq8Zp+GjiBBISS6spd2CpVtCdufPEq7BpIXe20WHOA3A6c1YrXUzEAvfYyMUGD
         FIbRCeEu26hazdITUtuguv1EaRhdPE3Ui8yljbjCEPW41dqYbI1JBCDvOJmORjtHt3F2
         eS1BzF7QQENoBB4nOopQ1BZ8GmfqKrbteDZKsTCoyE1pf+KHH71TMirsBWFkuMb6s4Zo
         YElQ==
X-Forwarded-Encrypted: i=1; AFNElJ9z128gpASn3f5zDt74Adm/n3F163j995ap9dVBGpHk0qgQ0WEsD/TyrETou78vGTPh9gve09DJezD2j5Au@lists.linux.dev
X-Gm-Message-State: AOJu0YwZthe0sokGromy/gYqu0stjDtn+1JpHwLqJyyaUumFszWax3yG
	sqOOyycZ+ZR8c4HGucoHxRUj5VXkEnbIxiv5SMaA6jEYyWFop83bdUra
X-Gm-Gg: Acq92OHrP08KLwqka1d5sqbWkqYh4w7ffmo9z0WfLH4GWIuxCQwEBJtSNPYJmqu8KbD
	8tC9OwUodyCVtuD3Qmpqa8XFF6kXhK/wjk9OwiWPvDwxIFg+0F/54LXgphG35j8QHLzwza2mo88
	YQi4GXJFtyWT7uo3phTmZxP8ujtvZDO3pgexnylyO2Pq/sDJ/kA8twu5sPHH6Eth7i2cNK379ln
	+IcN4JixLCM4mecVzDWYsshDn0MRz8c2zxLMRx3OXVoYAynGnR8CrQsD/vTuoBLWbbALAxzTyQR
	gQOUMeCj0am6hHDVIsGh3U4N+EZf+v6KEML/n6jIx+cIokpwi9xwZRbQj0yys7sZtOBzTzHfmkP
	RqnlGXX2E9KsGfGm3gQEZnP0OrDbdj678PfIHaKZGjcTYka6etqdLIFFpXB6lsvAM/tDkSmVGBE
	89lOYku+El6VnUdAE1priJr7o=
X-Received: by 2002:a17:907:7fa0:b0:bc3:7b0f:91ea with SMTP id a640c23a62f3a-bcc12768e96mr741948866b.19.1778580239083;
        Tue, 12 May 2026 03:03:59 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcb94415c94sm570531266b.53.2026.05.12.03.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 03:03:58 -0700 (PDT)
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
Subject: [PATCH v1 0/1] staging: media: tegra-video: vi: improve VI graph building logic
Date: Tue, 12 May 2026 13:03:40 +0300
Message-ID: <20260512100341.53769-1-clamor95@gmail.com>
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

Svyatoslav Ryhel (1):
  staging: media: tegra-video: vi: improve VI graph building logic

 drivers/staging/media/tegra-video/vi.c | 78 ++++++++++++--------------
 1 file changed, 35 insertions(+), 43 deletions(-)

-- 
2.51.0


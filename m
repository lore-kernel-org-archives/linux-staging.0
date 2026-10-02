Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3898B4570D4
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 09:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932349; cv=none; b=aTU6/d6+WUv+JIAviomMFrE5atUHWtdCw+mvCR0yAHXxjjfbC7upPMLEzr7KYBhQie42VgEQrpL8rhiBenEgeBpLVqIbD4iPKDG99k5+VQmPBgBcgXBPTml2h1BKjQp5xHor3GdzZ4qPXntU3hCm/3VNgy9LQErcNT9Y3VvzTPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932349; c=relaxed/simple;
	bh=SE7O4E988zSh9vSP67BegOg04lMQBsr5loyDqg4tI1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I59uRmzv3pTZzaZKW1I9eUkls6MLgCXAO6jV0bmIzNI0fBa+ckrk2oKvrUKAxWHyiycDhnnc3wD3tM6X2DSqUBRDzQtPMn7A/KyHPcaB9dNi5XXSiirIyykQqbwfuFQGhFJrgDN5EA5dmufLgkanvubIxOl7FmqIRX1IoQGEj3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dSBbq0rm; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dSBbq0rm"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so41801425e9.0
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 02:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932344; x=1791537144; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SE7O4E988zSh9vSP67BegOg04lMQBsr5loyDqg4tI1c=;
        b=dSBbq0rmAMpV3xC7boSksZmQ8xM/eV7YaJADal3VM7nD/4PhXuCC7wWdtFgIjivEhc
         rstdWe434NFn00pgbtByqv/wq2OcvIpdLM3kPgsegnWzzXg+W+dxD1ytc8RvXLKsqKRE
         itKl+j5BXlGypyozeGJVMFDxiCepdkkB6ehcguAXnDNpO34s7WSDdZ5WYW53u0mTXK48
         /BQE0W4WspM5K1u7YUFVZDPV4/H8dLjgSU65foT2FVpuwDfJaFPNhb77HorYMkfx0rmY
         uH3XscTWbexW1EuThB9imUWN2d50/seYWqLOLfWv0oteWlc5fiYWetepp1CsqoiLT4aj
         uzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932344; x=1791537144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SE7O4E988zSh9vSP67BegOg04lMQBsr5loyDqg4tI1c=;
        b=iW7DDN124r1N1kmz1d/uCF3QfEGW5rOjBCb5OoVKtG+6dc8cD8BlxXqyFjJYPN1kcj
         NaHfzBUYRLsaVZHxekF4Sh5vlmx5rka3l7KwyNvotQVNK3HVHClsd01en2TNgxC58pv5
         howgKmwZImHEpHpcwh7z4wFR98MEbvcaKAZ+t6mBM9vBGu67ZVXueknQU6GoTBSEf74S
         WJJV5PvcHD1QeYighnEJA9wm/1CtmACJzZ7E3clN7TKOvmvXz0ooFa0X9GM5SGawhPDu
         IM3yh86kN8cTGOW9MaHlG9l0kG6ayRgjSWONlxBCaioDYHRjLTD/AoieKuvlHEQnZDkk
         bSWA==
X-Forwarded-Encrypted: i=1; AKwUvBxsXQQH1NSDPUChHYxoqDageLmugNaP2DI6uWtO3/NYaYdnQR0aWUhr7Jbah/9EtQSCtSrD9NzPIRqQaaQU@lists.linux.dev
X-Gm-Message-State: AFuF++mlzTj7jGscqvqg2XAgFdyTP9jVXTd65HPhNhSfQDkChFW/jPuj
	Eehc9fH1SkoF13591JiQ+kKM/yxSDSF4tXLP+Z8us3YgZDv+/2cw9aSl
X-Gm-Gg: AYBFou30yhahPNgUKtcBwtLsGHHjbObhaDcE7CvChwZDW60LZqeueIsnd2e1+xIgXI+
	ybFoNc3Sm9j+fxbPgBSZwpNg3gtVGsuLyWg0+SI0czovD2tWwR9uBlOQYQpRuEopNNh5mSm+Tja
	YflEK/i8F19TVfpXYXb9/zcmO7PztXF/cfwKFC9wksZ6B/WyMtZoE5VJ+Y1mvlq6SLOhGDwe1Gb
	57vIn8ux+p7DBT1QhF6KjKM7GUX1XmjQlhzfCO1kMxeDnEkxzJ0urwsh4yICmYDduonz1ZfoY//
	Bbye83xcWeVdFTZQkqSIpzZJDYRMNRTqtcwW7wxQ/ALS2XqMyasx8NJtJKvE5kcnJrix9IwjToQ
	af6Ka1Wy+a5O+IRtXOTrIBFLyLVj9nwg4npIZU/ghic6O0RDh1KsABB0IV24y8uZ2fTBGojZuCT
	TuKLJhg7CDm5wswWviCHN1P+/wsZGu7IP5M3roVkR33vXU6Lq5803ieSPcZydpPJckAIiUi/QvN
	I+abb14dTU/p1dxdkQF0uTo/UYTX7gnvNrVbNf4mtvI2AanpuEvjJLblXE=
X-Received: by 2002:a05:600c:8b2a:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4a0276ad704mr41194525e9.27.1790932344110;
        Fri, 02 Oct 2026 02:12:24 -0700 (PDT)
Received: from 1Z10 ([2a02:b123:8010:a99a:44ac:6cdb:a419:601e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38307190sm4006072f8f.45.2026.10.02.02.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:12:23 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 00/15] media: Add Lenovo Yoga Book camera support
Date: Fri,  2 Oct 2026 11:12:20 +0200
Message-ID: <20261002091220.534813-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ar9wlk34f_aNlIyz@stanley.mountain>
References: <CAO7O_xjhrLNFu6sKEFWp8z+UCkcHu9kr9KfxtEQ=T9yKHCQT-w@mail.gmail.com> <ar9wlk34f_aNlIyz@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

You're right. I missed your reply before sending v10. That was too soon,
and I should have waited.

I will not send another revision for at least a day. Any further revision
will also wait for the v10 review and CI results.

With Best Regards,
Maurizio Casciano

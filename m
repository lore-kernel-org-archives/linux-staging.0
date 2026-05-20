Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFC71C3BEB
	for <linux-staging@lists.linux.dev>; Wed, 20 May 2026 00:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779237086; cv=none; b=euoo4XuL4616KbvwSyqRxsnRBqGMztP77b7UEGMSQlE6gDEv6pOOAJ8DQ/3C49SIOYl26BZtCx4MtPdlkUUcHhGjH+QCNcAKjQPS9IXTYSQ0rDP/D9hgH7D6eSbZoEffFGbuxztGCKYVXe8Bcko0rGibWYeCgg7beP7xiYfvzzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779237086; c=relaxed/simple;
	bh=X9TTEKkyQJa6oTQ+JZkhfD0g5LD7Je7O+pGwKp6x+k8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ImT9QZJcSbb+4EgtZiwJFDv2VE9BVRx3Hb1094K8wz/PWeEKVImqqZVuIxtGY/rm/iQ7Q23MwfQQhJiyQ2HzXc0sC+/qKpQqutmXpyOGp3BU7/D5lYeFtEmfMnkA3yKJN/qkjikwDhnVdlljRawGLTyi/OPmrmmvg7ib6cj3Go0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKsm2Jdh; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKsm2Jdh"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bc763e2ba8so19440785ad.3
        for <linux-staging@lists.linux.dev>; Tue, 19 May 2026 17:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779237085; x=1779841885; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X9TTEKkyQJa6oTQ+JZkhfD0g5LD7Je7O+pGwKp6x+k8=;
        b=KKsm2Jdh211OWckqCfsQlspStES8nMV4t+3WdQV6Aq7E+aOAUomjMY7UFgXKCrsAow
         dRSj/MgcSdmhwKVFjHrAlRChqtIxQa3HQq3RcMXcn31XpfJVOTVuwJvOxcCbC8+q2HGo
         bgRlqfLrsgYbttv5nLp2/52se/nQHIqPNbJ9MeO7oxXC0nvT4qdhGttsPGm8VejB46oz
         E7TVIcCIFOfNrboYHJHJwljfIPsOxHY6LwXfYTkclvhknqhKuG9v33wMMTEchz9CCIiC
         4zKSbT1F8+VU7PMHFS52o4fGaGSVl5FaTlkFdDMBGHZlnWLi+tgqnr3915Umzc2aTQfa
         957g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779237085; x=1779841885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X9TTEKkyQJa6oTQ+JZkhfD0g5LD7Je7O+pGwKp6x+k8=;
        b=Emgn+maCSBNW1onFS4wZS/iE2/ijeAvZaqXDkVyQmI0IDAJ4triJGunYyoy5Q25DYP
         eke5D2euZ51isVFIkwL8yUp3leZB06NI0XfbbxhivDVI3HksDABQWYaD4gg6vYEaFyvo
         z8Ed9A34EIdQr3W79Iz/Q0qqdZDRiOzeZYX0jATM77XDCUThHa36oZIDGDaKGM96jLZo
         yTdS0TT+oyuoQkXsusUu5ggxPXdq30AAhqd2kusntDz+0aInGN+QZIJ6gqmAi/O0LR6t
         p9z6FCV90pbN6IZLjM0B2GYZq1dVandfi6687rNK5LYNRbX/S196a0LjtexNL7ckxpHG
         1hqA==
X-Forwarded-Encrypted: i=1; AFNElJ/rY2tWRkc+WrWJ1u420hxOywy20fNG6waol0ZsTqzbvth62Z7Z7VBp1KHoJKQt3pkWH8xnFvoJ2B4n4yjB@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+t00KJ87ybBlqVOjU4dYY//pojZb4XorrXh/R+ZSqqxwMzTna
	FOiNoa7M4ADx7mePzlbL8oIpIJ8McfJATZECvnw8+gWx1e5+0uUP352v
X-Gm-Gg: Acq92OEbPE0Y8ZlRiUUfptDllw8AxSpA5aMfDeQnYa02Pl3HU3qJMdyU7DjeNTh5ivS
	rS3uZ11lRXVBOYs1B3xLdG2ATzkCUt8/ZaEXI/yFI8rcp2hjjZ1GCqsGwyOIJjtAo/5tIVzZzXc
	tNA42mVGCrFESYR7B+W5jdf21eSVVkq32aT535d6oYUtymMrLaAC7GimZe8nzWlsU/QqXUtGeCw
	kmu+qjCzCN0G7iydR6E8DRsNT35z79kF1Q2Co9Neh25NftLB8mpt07ZGLmR+vJXcN3kepNvosgk
	on7SL9qmZ3RqtHT2+aKR1UAU//N43j11izVottdFBCdDZj2gcgVf7Yiy3uwoxoMcoRRF13xD8e9
	muF+p8GMUdI6Zk7NQnwjlwyjqenHsml8biUvs9xST8LOmibF1fqEHDjtFqtpUDFgxoBkPnYMpg0
	aFyULT7uZk70bHN9p7E8zoBdJ6HVaL8iJM1ZpMOAQqsw==
X-Received: by 2002:a17:903:2a83:b0:2bd:2458:50d4 with SMTP id d9443c01a7336-2bd7e9ea9f8mr215661635ad.41.1779237084677;
        Tue, 19 May 2026 17:31:24 -0700 (PDT)
Received: from arch.localdomain ([2405:201:8043:c04b:347:9864:7116:e114])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05f36fsm245556425ad.21.2026.05.19.17.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 17:31:24 -0700 (PDT)
From: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: andy.shevchenko@gmail.com,
	andy@kernel.org,
	debjeetbanerjee48@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org
Subject: Re: [PATCH v5 1/2] media: atomisp: csi2: Remove unimplemented DPCM decompression
Date: Wed, 20 May 2026 06:01:04 +0530
Message-ID: <20260520003104.17521-1-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <aeqJt8gI0I8KnMVB@kekkonen.localdomain>
References: <aeqJt8gI0I8KnMVB@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 24 Apr 2026 00:05:59 +0300 Sakari Ailus wrote:
> I think you just remove this comment and squash the change with the 2nd
> patch.

Hi sakari,
I have squahed the commits and sent a PATCH v6 many weeks ago. Could you
please review it and send feedback if any changes are required. If the
Patch is acceptable, what is our next step?

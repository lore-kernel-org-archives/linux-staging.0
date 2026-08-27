Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B284B0492
	for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 18:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854792; cv=none; b=G0R+TCSNjNsAuhJITpohXTX8MyCHo3cEDaeCLkHRF8W30KxkF+eIg35YJTOiwKxOqDskcpEHcxqezwOkj2AGidfELd2K68nn0+RmcWGwMPKocF9HYURM6xM6AdnFns34jh2D24uBQihudQgtIZZmL/t0UtRLx1PFmOvFnHYoqdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854792; c=relaxed/simple;
	bh=AKhAEVoGO6Qib2+bHKs6sCdqjH8YE7UeUi86MuSqJIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bm5ssE0pS9H84ElWppvHea42xuhSZvU9wrR3zoGzioB2hnk2t9Dz92l7i13gOB2n+eMyfkb4ZXPko4zckst5I36CAn49Aq7ziK6hQFp9Xyv/TEPkBM2lgkz+G5bE7E8byOyS1ckT8hUsXpkwiSvSKyhZ7WHxQ5Bq4JbIf+a41Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tjb0ukie; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tjb0ukie"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49978908b35so435755e9.0
        for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 11:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854789; x=1788459589; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AKhAEVoGO6Qib2+bHKs6sCdqjH8YE7UeUi86MuSqJIM=;
        b=Tjb0ukieKTEfVpkAmifH6HyKFk2VreEJERWVFGi150KeEHO6C3FNf5kioS7kPYb/21
         qBQ2xDeDyVDeNl80nrIiqxyc3nYdCn+JQeV3FDSBQD2QDRDeQfuo8v0oCF8kUWgO3Dyp
         uuEL0tWOtieqj2n6NdLJHN6lrqqX2OQcfKyimvN++pGEtlnfWtpAf+5qBmf2CxCKA2pU
         NfLanGmErLFIOJEp9IbT4MBIR9Om3h5UYnM1ruX9Oy+qX4jqoawCR9yfEX+fT2ZTTQx9
         wrMeP/it8nmZFyJrN5h3IwRMRIE8+yJZpNFjwiTksGadA/95e8rP7swcMVsl6xFSpz/q
         Uw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854789; x=1788459589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AKhAEVoGO6Qib2+bHKs6sCdqjH8YE7UeUi86MuSqJIM=;
        b=cqUtlr6oMMsy3xYe9cvGRj63vXTh+ol0bdJFxj6evTr+mBDK3XuSDqz5EmyGq55JPx
         HvLpzO7XtAuzqwdjoz0zqbPUa+8mwijlOvWMqere8xqQ31iotzA5AM5xcIN+8eSoIoiE
         2quI7tFJEYvGgKzaTCoDrafOBbsSNcPqs4KgGV9ZdSOFONJl7wJN1lK4PWcpcmC7MPJd
         xSyClKqjLx9qv8GcE5ag/2UFSByrOHGIVp4IvlD7mphBMR11LvRnwggboUkrflt6+WWL
         Vv0SfzyM36zX6k96GGKtFwKpiDkq2hJyPtjGaTUjf86NGBJkdNd+VnmhduaJYbqOCjhC
         BPRA==
X-Forwarded-Encrypted: i=1; AHgh+Rqmm3eTMEi6b+yICcY/teQkX9X/C+o+AozNGsZruOlWoBO8hC/uU0PGepMVA/JePCiJzLz+oRS/FVgmbBkt@lists.linux.dev
X-Gm-Message-State: AFuF++k733frhRNJjStkymUJ0ZEL+P7yEvcdaaoaafRUbJ3JbZGtQ43O
	zCGsQEXvTkZkGyLpel9mZJ7456ZIOBqujIm5qp2Bg0B1V1wh0z1fIAzwInbyNyjQ
X-Gm-Gg: AR+sD11Mll0osAwIExQ+nBnu1LDDBM4jog6txLv2CGF5dmcNpdekVhE3na8k3iZy9ss
	3fbZ80sTHFXvVV6QIXYFgY9LHjSXtB/u+PpQEnPTpQRo17j9yLMlifUg8fMN/gk3dytE3ScszVW
	wI0XaV0u6jgokyXbRg3Wqu37c3rfSPic6mDSrdoE5KjYIMb3zgkhdByUyhXfMvXxTlxV425uYye
	gZuwrqqn6bx8X4NtH2XS8+mRHVlf7kxUOb32UjlpYOZPGe2cHRnXfnUViUsyV1YPohfcexFzXo2
	95N0RwK/5fFaM/AVjVYo7LPXmoyG5GW89iTg94chOg6/Y6GTK/0VjYbdvHpkx1zgiwyWz8o5lyU
	xJaJHDSQ6aBLP+1p/JLy65cN7J1qX5sTuy/AaS7dJ3h3jd/Ln74WuwhJRSqWdJAXXMW0ZW6PmVb
	Y0iVS7BxR5esipuBcHguaXDMATpN92kM15CJTK2YKTK6fbffkApIoKF+KW0I9PzIBgvdHhNwvkN
	aQeX9+r0nP6ocFldnik+gECtS7Gi+0WsndAvUbjEW/3
X-Received: by 2002:a05:600c:3b28:b0:495:4749:16a7 with SMTP id 5b1f17b1804b1-49b91c56cdemr12076895e9.14.1787854789174;
        Thu, 27 Aug 2026 11:19:49 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c510c9sm3721015e9.0.2026.08.27.11.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:19:48 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: Re: [PATCH 8/8] media: i2c: Add WV517S lens actuator driver
Date: Thu, 27 Aug 2026 20:19:45 +0200
Message-ID: <20260827181946.2432907-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <apAt5fsysjAjU38q@kekkonen.localdomain>
References: <apAt5fsysjAjU38q@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you. I addressed these points in v2.

The driver now records both Intel's 2014 copyright and my 2026 copyright for
the new V4L2/regmap implementation. Board-specific text was removed from the
Kconfig help and driver comment. Register access uses regmap,
pm_runtime_get_if_active() errors are propagated, and controls are restored
through the control handler after resume.

Maurizio

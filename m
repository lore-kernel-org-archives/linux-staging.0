Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CEE39DBFF
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 10:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775038202; cv=none; b=pc0kBv9tyjDbFIy/s5LbhFjd8aCbxJpFWfjHKDkl8HaBtg8YtGWoe++Z2uc1oMP9WwReuiquYBKtjDVy6YbuYzV5E1l7V3EEzCplVxdy+4WYKKGoGSUr36xGFe9YFjRjFTUALbmgldxqETc7v4M2iqzmbb9tnK98okFIsT21SfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775038202; c=relaxed/simple;
	bh=OazJXZzaswCkwt+8o25PlXm/nM2wdFCfDjKh8SeCTbA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=agydW91y4s0jHA4xd0MQqXJol4D/4khGpUiVcXLrFRlYMlh6IqlZsB8ru9zP+xQ7NCTsV1EByWpQs7T2AioYjVw7Xc93TCChNClz+pl8hqhFRRDaR3TIrFSOQv8Kka2+iq7stqTgQNPbhGqoqADjdK+uO45QUHmYUsg2X1jwHnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RdGz9S6g; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RdGz9S6g"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so66979575e9.3
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 03:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775038199; x=1775642999; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbfOo0YSngwbRzgcLO4MRJ2H012Ob9tbDWEvMc7/oQ4=;
        b=RdGz9S6gvxsgz+41NAu7BFuxLwBSvzKKGuti3n57IE9wa/nuzJVFJwi0iisd1X2+sS
         UfaITB7rHV2TMRlKWt1qn0eoEhrCrTw9MTz/6rrZdQT2RAe0J3+RhVfgmegWD/qsWOYX
         yv51lc4oRKFVpMlOwuwqq0C1aStEKDE02gO0hVA20Hj/2GAA98Ny5DnwRR1Btj//xjpW
         YmPSISOUg6G9dNpPuoJ+OoNfdumJLXLpSdZK6N+MNNJ0SzDSc5LjTuD6g3Fiskyq55TB
         aZWX9fdFBWkKak1cJspsGeTYNYFBU5S/IIzX1TgE+m9pZL9PwELfU6Z4sSIFtR4Doibp
         3zSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775038199; x=1775642999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BbfOo0YSngwbRzgcLO4MRJ2H012Ob9tbDWEvMc7/oQ4=;
        b=fMftKHC/jI7N5SrSJz8l0RsZMn0iSdUSs9t4uc+WQR1FKd11hlPs/zCYTlHWA41aG1
         611K4wib8+O3/lV4h2+7GnpWWZZYtPrsaG6NJVG0KWqIMPKQSF6WEm2yoT2zagErzZk/
         bCt2Hp+lxiKXg7ptcknCPAlDFkffmRMJoKeqkR9nJEgFSK1CmM1g+Hujwt/5hFoHY19v
         QqXn7ZVnAYTlci2oPg0qHFANf4f8EFTDxtHcjb/WCJu3i/AFWEMvSNxBt5zMXvp9Y13k
         TmsK1RWhIrn0JQpJF6tAriXxPasxxoPYtuim0cx8LF6dtSTC3yILt+y1DCsYQI9SOce2
         q3fA==
X-Forwarded-Encrypted: i=1; AJvYcCV4JaVlgurKhQXD0YbHYCYGdxRyUEiHZ3/bpoFLGPfZSyWAZC1CArU6Jk0pkX/+Hs27f0NHsJjDM+fE+lrK@lists.linux.dev
X-Gm-Message-State: AOJu0YzWG5cuG3oHHGhSEC8hr2C9bam3y9y/qu1V41f2Vtm56OQ5E324
	r4L6SdQNStHIDqRpmevW2HhKSP/WNMcWDHkEGAh+8iPnSE9gqLcpPe+U
X-Gm-Gg: ATEYQzxtmSATpexB5tLyBKoifkgKt1vpaQOuEz4gsG+DjJOQVI1ZCQz31oHds0Av8X1
	drvtyVji1/9UTVkU4JO4PuqRu0SOSFHIfDx5bbbbO3nYrvnvJ+B8SeUc5KtB2cMsroDYyXfMqXI
	Ofm/KC+Y0d6AFMKcMA6kNZqoLKCnh0bZ/hhCHtaeDi3KIxCOC+fTDk/VHWgP3iiHmfa98h5NmNm
	RmFHjpzCAAwklYgSrJ0mEjJau9k11Y6elWlGkPp9DkOPb513CyCoAw8jL1a203sjBHdKdP9NXjj
	ZySCViDJJlQE5o62wJ5Y/etlLbL0E6YqjxfG8Vm9Zwy0s/z2ZlPawr6kgMPqEPKWt23i6TIMY9B
	CUmwZ3aM8poR9N3nnpm9T0NqcoljstO5uwt+2hul5PFX70ymPsem0r/NjHBoockZ4PLPEtdRNsP
	/BvNNs7zLr4+NmzXPLKdwmoI2LvpJC/aTSmEBtSJCJoKcqgCkrHrD3
X-Received: by 2002:a05:600c:1910:b0:486:fc61:541f with SMTP id 5b1f17b1804b1-488835d5a0fmr45239005e9.29.1775038199197;
        Wed, 01 Apr 2026 03:09:59 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:6c9b:a000:2d1c:ca82:e123:e111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e884dacsm150158905e9.15.2026.04.01.03.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 03:09:58 -0700 (PDT)
From: grondon@gmail.com
To: error27@gmail.com
Cc: gregkh@linuxfoundation.org,
	christian.gromm@microchip.com,
	parthiban.veerasooran@microchip.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gabriel Rondon <grondon@gmail.com>
Subject: Re: [PATCH v2 2/5] staging: most: dim2: replace BUG_ON() in service_done_flag()
Date: Wed,  1 Apr 2026 11:09:56 +0100
Message-Id: <20260401100956.22590-1-grondon@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <acwjEHyEYg0V3OyC@stanley.mountain>
References: <acwjEHyEYg0V3OyC@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Gabriel Rondon <grondon@gmail.com>

On Tue, 31 Mar 2026 22:40:00 +0300, Dan Carpenter wrote:
> Check them all, right?  Maybe the others are similar?

Checked. Patches 3/5 through 5/5 (configure_channel, enqueue,
poison_channel) only check ch_idx range, no hdm_ch NULL check — those
are fine.

Patch 1/5 (try_start_dim_transfer) does have the same unnecessary
!hdm_ch check. hdm_ch is a parameter there, but it's already
dereferenced on the line above (head = &hdm_ch->pending_list), so a
NULL check after that is dead code. Will send a fix for that one too.

Thanks,
Gabriel

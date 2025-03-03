Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC5E1F1302
	for <linux-staging@lists.linux.dev>; Mon,  3 Mar 2025 22:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741040136; cv=none; b=jrnneUs0r+qctiMi9gd1j5WnrZv/tzWI2doxXFsaggg9huQO3f8Kfk8TvtTxTHMsTwXDkPigdsu2PVZlc5o0WgUGfwqqh8SD3hLI7ofalZ7oWqClSsxSRVn2uijlzjRlh8VvvHlRDu3mVq3pg/p5SjTMklNENXmW4H4ohhWb+N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741040136; c=relaxed/simple;
	bh=IZpDwxvIz6DxvmWHj8fUJpQVS3Kqnbxep5cixkk7/hg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jaqGugg+PEymsLpdI4p0nKb1+lujqctjq4uIQnSOUrpxMoSR5daDpCe5UaBdA1LCn4vJ7hZlgmG2BB7qn5FxICVPJB5JjiwYk5i/uIX/OVqi9vqw6qevgGNaOv/rLJPdUKeGm9iL4Ig6ou7kv6zlZhVT/xbzlSTmea9t4oTlAcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oiw5Yf+y; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oiw5Yf+y"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22337bc9ac3so94409855ad.1
        for <linux-staging@lists.linux.dev>; Mon, 03 Mar 2025 14:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741040134; x=1741644934; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZpDwxvIz6DxvmWHj8fUJpQVS3Kqnbxep5cixkk7/hg=;
        b=Oiw5Yf+y8D5EwrRllJK4HstXSZDT81UZobefTHgr9eE3yPkzoSr+llvGUthyUeUX3f
         k1EGuYp/I38Y7abpqXRp4l0IC3TJQ5TfyUkna3/8Ouq/GX/AHzYoGxdvXj7r7d54NeDO
         tOX9rsPoMALAL+6/xFqtJd6N8rZqmvbEtdhVQa+7IHWguKGukluGe5Ejrz/0NhmzBgGb
         ys7rbFMGl+6imSpLg3nqkreBvj/i+nYFt3rJe18V2bSO5hmNNmWKg7flXbYn8JOWbz64
         em7yo0/0oirqN5hz4o/rdRfV37f2RG1mr+QJ+xRpoM/jj3HK7MIw0W+7RklkVkFEB9La
         b8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741040134; x=1741644934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IZpDwxvIz6DxvmWHj8fUJpQVS3Kqnbxep5cixkk7/hg=;
        b=AS+/gpYSO2VLi4qYVsRxWQQ7H9OLSFJ5qEogCa8G+64rUBWwfzQARa7A7cXXaz6vkT
         LBpjcXkOqGArYst6YI125oWN+iJ4KfUqZBHqgc+Sh+G7fSvSxxTx0BuT8jCTPdISsOL3
         L2UBhkdLt1VDJdVMLdTrBvFRFzwy5ecFuaGawZOcNp0x77aCRBYpAmEPkEbRcVgxa6P3
         p34sSIhfo2dpB+YsMxFTi1L/pkKay+Iz9JUqa0KRKSavtnVKgrFtFRLuqYV7NR90PHwM
         UsjsjhpmLtBIG4y5mi5NXCnuhQ4o/Ix3HiI6SoAmP8zPljJIxZ4JGNEBL69Ga6uBAvNN
         8ywQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtk5Q0pKii/z/bscbak377cILbf4lSMq67YieB8rv+qdFxUVkIHPnAW4ma1cNZn08R+GMfzFxp+FRlXcZu@lists.linux.dev
X-Gm-Message-State: AOJu0YzbG9qBefDHqaGqgXjN4KMPiyzrpwC6gau2eXxvHfPUJ0CRAzio
	uLmIFtHRv2lSvYlH2z5eE2u4oHNCSQBZPrpPVb3S0WtjXJkGr+Qj
X-Gm-Gg: ASbGnctNLoPCwsuRHzpIlRAvsQERPQp1NLCIpNZD4uHIaux8XoGfSQKusRFFTgWu1L8
	a4pcqzAJYyeJyHUOg6fvNmYezedsGIXgxHIxiB6MyuJqK6W1AQZdNGGg0fhKIg7HpTH935rP4kQ
	OCv1u5Sgh3a6gXRZiYHNzy6U0t/7f+UhNUrTAuPbH1UucWya3l46DnBYShix90UrJrCDpfFy8IV
	Jta2TsSMZSs8GhOo6SIN7rfoioYl8vP7rEMLjSNsesqE44szUCe2xW8xkvpeMAEylOlJpChphP5
	ATiRGxnRr3S+G7WoVRzzXD1gOYOPGNUoFoA5kFpezAxmd6xyFAmkvEcbQ3DOmScFWRWG
X-Google-Smtp-Source: AGHT+IFNqmjqz1COtK+C2fcfRO8OdpVR4SgcV4rDelIRPY3vO/qJitu3N0K4RCEFeU0jlTv5N22kRA==
X-Received: by 2002:a17:903:244d:b0:210:fce4:11ec with SMTP id d9443c01a7336-22368f6a5f1mr214828215ad.1.1741040133969;
        Mon, 03 Mar 2025 14:15:33 -0800 (PST)
Received: from danascape.tail34aafc.ts.net ([2402:e280:218d:2e5:7b03:1e42:d492:fb71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a003dcafsm9670438b3a.132.2025.03.03.14.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 14:15:33 -0800 (PST)
From: Saalim Quadri <danascape@gmail.com>
To: marcelo.schmitt1@gmail.com
Cc: Michael.Hennerich@analog.com,
	danascape@gmail.com,
	gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [RFC] staging: iio: ad9832: Use devm_regulator_get_enable_read_voltage()
Date: Tue,  4 Mar 2025 03:45:29 +0530
Message-Id: <20250303221529.31204-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <Z8YoM4ycB0qMQwOG@debian-BULLSEYE-live-builder-AMD64>
References: <Z8YoM4ycB0qMQwOG@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I sent the patch in a separate thread, if that is alright.

Sincerely,
Saalim Quadri

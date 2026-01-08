Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CC14AD691
	for <linux-staging@lists.linux.dev>; Thu,  8 Jan 2026 11:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767870583; cv=none; b=TLg55BN74C3tsehcpQHj1/W0h2ZGc/79NVnD3ggatW1SxTpxRjrIuCEaFU+b4aVQZTGjBKO5D5P51Ot1ts/SaibzANUAzQonTyA4mEND+4K+fAukvYODqf1VbNPq/Q3OnGlQ2FODFWMCa8xzAcH89AWxJCVtxWSPWvIzz7EBMhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767870583; c=relaxed/simple;
	bh=B2oC77Ha7LvHEF3hW5d//bqcH9w4Ql4XZ8jwvha8XBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BGfSm+pVRl2BEdFYZC05afeuoXBuaibA0in0KlI9K+shnT4398v6Vdt7US1bp5HQ++JVY46l42b/ISwlfodwD1M1XI96RHS9eg7RrJUw5wZYDnrogMIxbJjmNgOJXZYyX4njumavOYS/oh06kppEi1LJpgYyQeeEvdGBwlxSYcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7lvopA7; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7lvopA7"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c05d66dbab2so2007116a12.0
        for <linux-staging@lists.linux.dev>; Thu, 08 Jan 2026 03:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767870573; x=1768475373; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2oC77Ha7LvHEF3hW5d//bqcH9w4Ql4XZ8jwvha8XBk=;
        b=E7lvopA7YOr8apvlkTws4cWz9UIcsMQ+C/i+PSewSJpG24MVh0aW+0MNibHPlcR48J
         rljoTGt8ZOd+a2FTvZ/BlWrxtvch+qgEz+5V2W771iLo+oGxcULe3ajba4Nr3MnGDY7Z
         gnsgYOFQH1lEaLDk7260N+1jUjBF+/DQLapvt9P/ZpL1UbZyE3Pp3gZuvc1bKewmzT1C
         3Ov+vHrb3cRDcJu1VJEotj8r8YMwOqnKq+pq3u+L5BEETvukhRu1/+3EzpOJPtr+oAvN
         GKuF2J/M3RZfpiEk7GTOfn4VfseEygPuH6DoqG9GAS2cAKRnP70KQ6+dHDZRylX+3uWX
         t4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767870573; x=1768475373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B2oC77Ha7LvHEF3hW5d//bqcH9w4Ql4XZ8jwvha8XBk=;
        b=pClt49DywqHH0bHtmobC2e/ac4WPOU6dT7fwsH4tBCxixeMPpg+LWzNFk0kCaA2OB9
         iGWSnvb+WoXtsB2sWua3p8ANldpM5grsb4o+iUSlIsJ0z0uH5Q81PxnsUfVpHjvSAN3/
         DKTZH6L8B8C9436LqJ/0/FKQNJpiRhVJUE2ef+pyTu9b9aTFLU/cvS6zuGmsUSNsZJ1g
         MGHYZjc+nYx5HKW1wWTX+6AJvXQgFwtxivmp2wqB+r8XrY6tqz1AFfaBz309riJ4BnYO
         +aqFYmZbh15O92MjxTnJaiEmxUR2W2gs0DJVn+/ZEpB0JEij1wSfdhtDKuT8kBkxnOFh
         9E/g==
X-Forwarded-Encrypted: i=1; AJvYcCWiDGxd1U9KTsL3BkWhaJuVwZgVAVbzxTG3Y/uTKMzcSGNyoZE5zZ6AHiGceHb45N6d74Bfc5QAoDLo3y7t@lists.linux.dev
X-Gm-Message-State: AOJu0Yz282aGooj4o3uxCDAeJvhfh1IlyRsBIBZ/3Kp3yff+ChlYGj1u
	9jwjUU7zb00KZTPShkSQbfDC95mTeXcW87ZoqT0t3fExfJtXupYCMX1q
X-Gm-Gg: AY/fxX6WQtskM/Vk331x84nuk4Bhm8PBGr7wlNJpt26np/craib7ZP4ZGlDx6LKcIDM
	TKZBCU8XFPvfcDcjMWJf7sR/urT+/hqgFs3+wIS/H5/FTwWcXEOmxTPWjvTtIZX4zSkFZLO3EjS
	aR8DjClAM52xbB2KqlUicyhVzlcpYunNRA7HFftENp+28zDXEDU0+4G+E33zi/+S5gc50lXmqRb
	GF0mmEsdYouDwPhZlwTMBrmaclmLdM96RgxRZa5FyARE/qDwI6xxZ25nrn/XcK4GNM4kdQCRiIp
	oUaQdMlOU34gEiYcDxTR2x1r6UM1qngGznGH3Dvb42GqVadQqjDsD8DSShEoCw7EnLJ3XkbL6Cp
	IaPu9NuLcSmG2k2AAb0JBu9fuhPdnYyJtoBIkXhwclTUY1emWAPQMb0R6O14FmSr60J5lz4nR95
	ejYhSmxN5nfvktMQsbm5i6W9ynyaiJhyKduLD97FHW4cnqctCUGEGLfOhUxL8=
X-Google-Smtp-Source: AGHT+IGnxuGNdUMPbO1oq+nViur7Qi1EUWpykigU5oE4ChITvq0x1nr0O4LnSYVeGpamEGqM2eTjjw==
X-Received: by 2002:a17:90b:2b8f:b0:341:315:f4ec with SMTP id 98e67ed59e1d1-34f68c30789mr5303673a91.7.1767870573165;
        Thu, 08 Jan 2026 03:09:33 -0800 (PST)
Received: from localhost.localdomain ([2409:40e3:44:c9c0:8d34:cc3d:a8c9:1a48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fa93f30sm7541870a91.5.2026.01.08.03.09.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Jan 2026 03:09:32 -0800 (PST)
From: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
To: rui.silva@linaro.org
Cc: rmfrfs@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chaitanyamishra.ai@gmail.com
Subject: Re: [PATCH v3] staging: greybus: lights: avoid NULL deref
Date: Thu,  8 Jan 2026 16:39:26 +0530
Message-ID: <20260108110926.29018-1-chaitanyamishra.ai@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260108110743.28579-1-chaitanyamishra.ai@gmail.com>
References: <20260108110743.28579-1-chaitanyamishra.ai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Rui,

Thanks for the review.

I sent v3 with the version history below the --- line (no code changes).
I couldn't add a lore link yet since the first version doesn't appear to
be indexed; if it shows up and a respin is needed, I can add a Link: tag
and carry your Reviewed-by.

Thanks,
Chaitanya

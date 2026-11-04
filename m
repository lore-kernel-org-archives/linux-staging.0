Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793817291;
	b=e5IzYE1vxC14h2Jho6bbiy1F0E+oVecPjh0BZsOmmnS18ulMfUZ+UHNGP/djyJ8HgG9v
	 h+4BDJzrC6d1qTkLJu93fqRc843ihNqoq0TvwKZJf/Vbeh/CsaSsRb9HZzeZ3KwmcB35a
	 5p9w39duJ5e/Ga/M5ODd6siAzPd3+/0pLRcIMDjVIyPoaoMOLuBiPJsDMmZVNPssJjYOW
	 DftTOKV4D59QtuDlH3cBI5lf739aBq6xcqtDUX1sVJ/sLDsNmV8ndyQAjmCvwvjzPejqg
	 By+SnrzwCBLTnakllJLEknQzt7sY8UEVkMV5wJTFyx71uHPsYuFHKr+qHf7tnjsOtHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793817291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YPds6qHWCOYStiDKSkZJvhkMlbF1mlXK1Bt3SccenlA=;
	b=Y+HXjXVAYJPSxCfCP6H5SACMyXrYToKtaom7jLUUB4+ZLXC29ETnAnx9jhURie41GrbC
	 1tiJ0qgrfkXMNOuz1O03+UwGdPdr/uKrPtBh2D3zM6a1gh+lseuIgFbOW6X21z5fAEY4n
	 vyb4gty/3TogVIpV+FEENcc5ymEdK21hgYcbAsaWXvqm7PXGRHtJhYfDIF/Lk6y+6hET4
	 TucoIsiGUA+d3CGntMlnri1za/qq+lotWT15YEowiHg+RoZQY7A9dz7g9aOmxAmrNO1m6
	 Sku/BUXSCw8H4dXTIy8aR7zJ+FNFcLdOB5Q/DJ+Dj0kzBN/QrafYCU8Vpa7Ja+qXSBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nuL/D4UD";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56893606A32E
	for <linux-staging@lists.linux.dev>; Wed,  4 Nov 2026 18:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56893606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nuL/D4UD
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so12419345e9.3
        for <linux-staging@lists.linux.dev>; Wed, 04 Nov 2026 10:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793817290; x=1794422090; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YPds6qHWCOYStiDKSkZJvhkMlbF1mlXK1Bt3SccenlA=;
        b=nuL/D4UDghLxrlj2b5TIeRd21798CHJIVRxZQSwQVW2sCPEmRwDn93oYynJmXBLf8m
         IBHegW4fSnwVATzdLEVTSv0rV17p+cQx1WZvb7CAGooVOjL83CDOhXcZCXr9ZSWGEtVU
         gfUb+XZeiQXcs+1o0t7Zg4essjKcX3pF4qM5RJevXMeisZgMYBlX/iLIeyxtKGIaBBEZ
         yPKGaveAfQRo6hoqoqxfE3wXIurd3OfHJFPm0grMIMsK148ZMlEK43EciWIO9hquxY3D
         E96ejl+FJyPPxV1sjB0o1YZehbDQq+TrLLRqwZfA4Ap0LDZYJR0rj060b0sByckpnh/v
         VtCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793817290; x=1794422090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YPds6qHWCOYStiDKSkZJvhkMlbF1mlXK1Bt3SccenlA=;
        b=K4IhYLAyv3biuxHbikjqyNNIiX5ijaZheh5IJM0NgYdcZgmQBfiVoCU3WuWCqwoI1Q
         kSoZMyxFBhHtC51k113Q0SaWFQiSxxIKeESfkQFv8ukqdoom8k1S8MU4ZyT/GP7uYMUy
         mgnFx5oDdiBIvdQRNZRJYrFj7cdKskGlk3I+6Qx7QxYQSZpRW7dNkHtN8ONJf0LdVT9b
         VEMkeYU0t3CLpmWWPutJWRSFxmk4wKDeB6QuBKqIdFKyDJBJScDgb3mwnSnJygPCufcN
         0fwrpaofMgk5ETekRjOMcye79OEHHIXIytdittqVEpso5J0H2jn7NoIOB4uLhMvA4eVM
         gjHA==
X-Forwarded-Encrypted: i=1; AKwUvByLoOK+QH14oOMywjUFXe6oI9fds07Zn3wrzIKMO1kK0wgS06ns+nx0z0YCt8NKkvXoEdVtNwbMAL0RWgLZ@lists.linux.dev
X-Gm-Message-State: APuU4Z/u3qLXH5+X8cQdabDoAsPvyntjhafbDUrI34Edn83CCY/96qJe
	Yjad2PN3/z1YNbHvVS/Gc3S/6J5AkKig1Sh2X2mvXEJziAPn9PPuKVmI
X-Gm-Gg: AYBFou1K+5xAhHPVNHOOxfh8HWoT/zEXxGui1t4TsTPtyXeCwNiYkyzlh+iXs1ecvp1
	HDeArkQtDTmtlKdQJ+Em43Geb5MPv1lrWObEU75caTmYeFUWiwudTM+MSWhjIa5sKtCb1m7AFEt
	686tbl11+BIfL4M8qkxYkmIEmi0vtft1jvFhjMhRX0rpxVwlXyYHTqxgJHL2D8PJn93jsgSOEb4
	yZGSHFjtFWXl7m9l6ivBahKTJkRvpuopKhh9U5c53+i4kXRIn85Baw2G0fle73tIOBTASpRaQ0f
	cMVDcGmqjyDtu2eI65OvT0CJoS+DJACWlT4zUUKIx8J1+DnhlPQSKf6mfjGZ6mqaAhKtgXMoqgZ
	DmRI329g+VCjQo3kE1s9eEHtYYXFmu2up2Av/kqjpMmANo4AxtHfFwLqJYj8S+Nf/3jPHd8bNHe
	96jCLBPfpCgjAue/SJLq7wQgZGVuasYz+ZL7X2U5TQ26Y/FXmkxNK0AGOnoOwEgjBcSr0TbbJhX
	+XV/n2/3Ye3/pCYM60vhy4pFUDYpB/tQZvSqiOUYdNegeriQVyqCAlL17g5DtYkNVZHR5+f2+C7
	Xc+ES3E2sdjJ0e9IHb7jUlWlegcxVBqv8fJARw==
X-Received: by 2002:a05:600c:8b2c:b0:4a2:5267:3cd4 with SMTP id 5b1f17b1804b1-4ac151a8c26mr403871945e9.3.1793817289631;
        Wed, 04 Nov 2026 10:34:49 -0800 (PST)
Received: from fedora ([154.183.179.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b432a883ffsm31404915e9.3.2026.11.04.10.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:34:49 -0800 (PST)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joshua Crofts <crofts@kernel.org>,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v4 0/2] staging: iio: addac: adt7316: clean up header inclusions
Date: Wed,  4 Nov 2026 20:34:27 +0200
Message-ID: <20261104183429.20125-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up header inclusions in adt7316.c. Patch 1 sorts
the includes alphabetically. Patch 2 drops <linux/kernel.h> and
includes the headers the driver actually uses (IWYU), removing the
unused ones.

Changes in v4:
 - Moved the list of added/dropped headers out of the patch 2 commit
   message, as requested by Andy Shevchenko.
 - Added Reviewed-by from Joshua Crofts.

Changes in v3:
 - Split the series as suggested by Joshua Crofts: patch 1 only sorts
   the headers, patch 2 replaces kernel.h and adds/drops headers.

Changes in v2:
 - Split the original patch into a 2-patch series.

Abdelnasser Hussein (2):
  staging: iio: addac: adt7316: sort headers alphabetically
  staging: iio: addac: adt7316: replace kernel.h with explicit headers

 drivers/staging/iio/addac/adt7316.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

-- 
2.56.0


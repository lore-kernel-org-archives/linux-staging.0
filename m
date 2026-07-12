Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44E139FCB1
	for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 12:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783857702; cv=none; b=QQEMlfVorPboF2fTdT0HUwbOPIicR/fkQB63HxIitXYugGH54g31m/mUKcR1C6+Y6x7v78ZodoIgUtu4AKDg9N+x0RyoZeB4eg2ZhfZkyYwYe58amdJ2xOM2j7Ok+a2CwVtHoaXNCDAuDb5T7AhmAPoK9xuj5TtuRMQR15lydes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783857702; c=relaxed/simple;
	bh=H4Le8eUfPEeocN6zdps5oHnUAPhq5t/jTLqWjWm/Dr0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CVEjvhXoc76d3DUeYmjGWYVvtQaTY8U5V0RljEtIq36CXQeHFK9MWxGWbO44IBfLIuLyvbIps3cHCFKw8AvU5op9IOK1rLJ6n9osQuPbskwagPyR3dIjR9wiDwcSVrBQvLQ1G65gJkhkz+J5MiN3z3qUw08gHtQ8vvmDRD6HA0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rbIp8kwh; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rbIp8kwh"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39b51882d71so18012831fa.2
        for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 05:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783857698; x=1784462498; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FhaV76GWohZUqdyYEFqWpcN/yJOC7//M5Ylh0672MRY=;
        b=rbIp8kwh52cVvcaePlyKGq1agbGQLe2HjiW/GkmjDdod6EZWGDB0bvXxA2iXOxDAHU
         zVod2Yd7aJXnrc/AQ63xz4Gdi4ZB42H8nHwD+UcAUnQba8/oCLSo6s5s7cAJoaQY/2/u
         S9uX+mepEEMovttzNIW8BtUYdeZnEzqd+paQpiazQ8r+w85MYr9IQxxGL49hqDV7+DyB
         Pxair5BWT77Na3hYkEaahde9LUf6w/qfKzakUZjded7HCOrF04b5G7DHgOr6hnmGT6W6
         UhD2xoDQGX44oNZ4RuyIaZRsdzvgKgO6sVwXGKmUp6Fb6XHgdvZ6JoBw6a5CFl6eaK02
         P2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783857698; x=1784462498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FhaV76GWohZUqdyYEFqWpcN/yJOC7//M5Ylh0672MRY=;
        b=QluM2AqwiN6dHNAaCn/UqYW53e7pAaCrTtgYhRqQLvwSitCorQsLGDImYUjSm2sZDU
         Y7gUX7ZiO1I+m+yp6/OFSVDNAM0C9VyeIK3g7B5FWpnq0gRkN908WyDd3VsTfKYdjsnF
         v1BAXZLMH7nvos+xC6BNwUKcOYYGzMJCQxgEFZppM6ZL29y7nIZIl8EWnMXO2qDVJlvK
         BZnEQUBgHrxsLzdEz8QjqmNrRBVTYVPNEJUWkNjADtQuaM5yIjnQ/hyGzF7l3Vkw2EUh
         2j0SL/G+OT2M98cKtjvV8FeqNGzVQp4pd58PjPFo+7xf6CdUp4svpmjxgBk0OikZGfTx
         MAzQ==
X-Forwarded-Encrypted: i=1; AHgh+RrpexKLdWncWYhDcKDkR39HRVFuBq55Q80pKAZmjZdH9tY657JLZq5PASO0la1o8V/T9kL65In/FxKVAI/l@lists.linux.dev
X-Gm-Message-State: AOJu0YzIE+tUfdlcWl37NEy9OceJA66mjKbd5gkgAU4NlXatIrg1Bebp
	7OpBW3MhT+gNBDpM/iDdL7/KMPWbrbjeLQE4SHj2ltxgTQK5qiD0saa3
X-Gm-Gg: AfdE7clvPkMeqkyidx4Ij4IdGcuMU2zViUFUUHoMawY5tiekdjkx8Gl/MSMvD0uX0nM
	3fJ9yX4puPSqgHxIIulzgYo4v2ZQVUIDdjyzDD1DIvERuzhKETwWLSBIsUvBBkVI/+St1qdBH44
	ZEw90Rw5Ej/AL8WEPGDdjH4qExho4DFnpiqKL78D3eTzm0NN4SDR26An7d8RmzJ9xci1jxIvz7C
	LOn9BWmeYeA71sIFsWBTNwTyQrv0gn+B+PDO+UnyA5ycPjlcpcm6yd1FF3tLXg3uZMUZ+gl94pV
	xtDo3ZXxA4OwBRCkmscV1GwONl54v7YH9xFJCG+1yRuKdqGzkAaxNVTwzfJdh0HEQclUZCRC11A
	78ph6E6K21WZ8bnja1atEL0cRdexOmiHER0f4g9jHmQ0ouNiL+bEPtj9gtK3ENbxYbu250OFDKI
	UoCFEqqfE=
X-Received: by 2002:a05:651c:1b04:b0:39a:e29b:78fc with SMTP id 38308e7fff4ca-39cae8db771mr10400911fa.40.1783857698298;
        Sun, 12 Jul 2026 05:01:38 -0700 (PDT)
Received: from linux ([195.54.40.37])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84ba1b9dsm21339001fa.35.2026.07.12.05.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 05:01:36 -0700 (PDT)
From: "A. Kalimov" <erqeon@gmail.com>
To: error27@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	andy@kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@intel.com,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"A. Kalimov" <erqeon@gmail.com>
Subject: [PATCH v3 0/2] staging: media: atomisp: cleanups and style fixes
Date: Sun, 12 Jul 2026 15:59:23 +0400
Message-ID: <20260712115925.79047-1-erqeon@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes a checkpatch warning regarding indentation and removes an
unnecessary return statement in atomisp_cmd.c.

Changes in v3:
- Added missing commit descriptions to pass Media CI checks and address Dan Carpenter's feedback.


A. Kalimov (2):
  staging: media: atomisp: remove unnecessary return statement
  staging: media: atomisp: fix function arguments indentation

 .../staging/media/atomisp/pci/atomisp_cmd.c    | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

-- 
2.53.0


Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4C51B040D;
	Wed,  9 Apr 2025 10:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744193057; cv=none; b=A6/wjd4nYqB2m7bRtMfJz9s20PTjepBEMQOPswXiYCJfyIufLjQcNiDhIHpk9HXWTEu8FByvQGSBVBLTmPeYtXCxTibnPkC5rC2XVTcoGwRA1gmHm6+3Kvb5JJsSy5++b+xXAPi7+rxJjrIakIzYKOG1Iw6SzLL70q2cQ4h1a/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744193057; c=relaxed/simple;
	bh=YLY85+aEoNfSVC2HitFUj4mOJGwNfEmC8mgtNUqmfbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zh4HopsDiYu8e9MSPVP/irls2wfsXI4tKYgMYCDlAnPUhxcBj+bVSY84JfrTYUbPC3gvzK1B/EwAWxsSGaBFIx7JuFpTEzTkoTQO0vsU1Aj914N7ZFYM2FHVeOPWU670SoVeRDwUee/sxYOqClmJXYVDzoUK2B8PIc+/JtK/sUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NrH0r8aw; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NrH0r8aw"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39c30d9085aso3958406f8f.1;
        Wed, 09 Apr 2025 03:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744193054; x=1744797854; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m0f4x3Zup260IsKBz1eH9LKPwcNpgqo4pZi6j8gWVw4=;
        b=NrH0r8aw84Ef0/rqtyOdvdS6D+Bj1I0neKHUenI1RfZFW0m/odIqvNYdzDLlvcFJfQ
         AraI9Tx4HlmdKCq1UlH4c/sXdGdFoFRKhyS3q5gQYPQXw4Ax3hJYHdk05VGchhPvTPAv
         c9sbjy1i/38QsbCgtErV1PPcVzMKjS6TBdR3NHAoy6OVXcg6Su/JuQ/yU1XKp8B7RMTM
         LYGs7xmOn8mfHZ/E4Lpn6f79si9C1myM7gRH7bpxkvHK0bRMu9oaSXguNEfT0PIWNOrq
         w82DuNT82mLrMKu+QN/u3yz2ifRs0bHqqCueeNEf01Nzfk1hKmijZSo3JbJly9ooO30u
         7jTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744193054; x=1744797854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m0f4x3Zup260IsKBz1eH9LKPwcNpgqo4pZi6j8gWVw4=;
        b=uRAT189ez/VblWV/bBa7RcHYBTgenC09AJbeKgklTJ3U/gQodaRUZS75K8/9rFBEsH
         cNYSJ4Kw9yXNuYJ2NCw3yB9AWqDN/Pn6EXkBLCAeZd7K/aSj4lJZUvastX3YigKykkHh
         VIC7CttigDh9prBhe60DV+gvEremlfcKodgdEAXVXYEPtTWFf31l9rO5qCevKZYDAD6Y
         4y68P9Fq6glC9gt4ijlHrKhaKfOMbLzik5cC8CYOq3Zob8EpXhJLB/mIlphP704fQteO
         UHKeqK0txd/0LUu7Zzt2jy6XbhBabPhVfXbxpH1WdmKyVUHMEuDhWjRZXlICG1AOiG7H
         O85g==
X-Forwarded-Encrypted: i=1; AJvYcCVo0d48gZB4jzhLfW08r2NskpZmOS5TzOepu1zQ1Ro+TxqnmSIt237zxRfSNn/fdmGkpv5fXS7TBud3@lists.linux.dev, AJvYcCWIDZB413gM9/vUUu6Jxi51NFyFmhywUvXT12GOss4GJNZG5r751JmnWIMPk8P1AerRw1N5kQsi2oSxgwSX@lists.linux.dev
X-Gm-Message-State: AOJu0YyjV3oMcvN19le06JR0M0gh6hSmaksMusE603qhHyTx0mVtjMam
	xVq3iP5XOMj1g3fCj9Qb0w/77oDdFfLjo8xD2wHRGSH6g2sRAwcc
X-Gm-Gg: ASbGnctFFMrzj3Wmt3/VdX4FT2KNB3G+paZZQfA1iMFOlAYkRKJ7emMmfb905qGbc0a
	bPgoqR27sKfPn/VK3wMwCLIFjjuX0ZNKubiAXtarx7dBN4eX1Xh8xayzTyMOINmoJ6rNSIL/fcj
	0+u9YLPWE0osTSgyjdgEbh9Nv3GeRjhBrPBNJOn3ksFJ6vxcvvFaaJ5MMJvhJGqh7124GFIrGC9
	S/kvBwKQ+2W4iefUxW+JHPqsMPJ3BGBts5qypKeoWslYOaME5dzRA1xQuKRhjhWiUY4lZVeLG5q
	ryIC8LXj8N0PXJYXP1D5buY2/NBAG4kDJmKuqA==
X-Google-Smtp-Source: AGHT+IHOXkKXB241y9+td5oFHAZFEO0MlOveykXTd9mVNFPAUBq8YU3o8C+oP3KOpYY1Dmo/NsgZRw==
X-Received: by 2002:a05:6000:2913:b0:39c:1f0a:ee0 with SMTP id ffacd0b85a97d-39d88525bdamr1694768f8f.2.1744193053570;
        Wed, 09 Apr 2025 03:04:13 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f205ecac8sm14930295e9.4.2025.04.09.03.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 03:04:12 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Improve code readability in rtl8723bs module
Date: Wed,  9 Apr 2025 13:04:03 +0300
Message-ID: <cover.1744192642.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patchset aims at improving code readability by initializing
variables at declaration.Key consideration is made to ensure that the
code is clean, maintainable and easy to debug.

changes since v1:
Avoid mixing pre-initialized variables with not-initialized variables
and handle an edge case where initialization is made to function call.

Erick Karanja (2):
  staging: rtl8723bs: Improve code readability
  staging: rtl8723bs: Initializing variables at declaration

 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 84 ++++++-------------
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 39 +++------
 2 files changed, 36 insertions(+), 87 deletions(-)

-- 
2.43.0


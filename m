Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B507528E3
	for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 19:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="GoeIIQ7P"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d0a5422c80so32620435ad.3
        for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 11:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1702237029; x=1702841829; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nWMq+fsJDOtZmzmL+dlI9RAA4JQyKEd0rPprq/Mm6AI=;
        b=GoeIIQ7PdExsHi6qLH7ThtNPvcpXk4mHrs8DuImKihdQwY5srZEnLpRpifXlUkG+tz
         AhiP4p2p9mkcxSiio4d89yFmxtmdnpRZ0VdHyrA+DHu4gW6x4q1hyv2sb4P5clxbA5G3
         r5oOmIPxMP8d4VcNV7S3j7YoSiENsPXlb4WCvrhBTsZR2b6IvyTq2fHAv+n/bRgMt1xA
         QGAVBZORZsJOXbRB431MdmRIy//jhmc2psmwviO0zR8XYXyPx8L7So8bjkBqbOUhIZHW
         cEnwnRdGVta5Vb04UgpdEmrzZUJTHJze6KaoKe8jTjDE8Iqt9nBGXNZ5LsVXjx3o31L3
         vX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702237029; x=1702841829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nWMq+fsJDOtZmzmL+dlI9RAA4JQyKEd0rPprq/Mm6AI=;
        b=vvlObYV2HDaxitmWcHxJO/fAC4bXwkRBtpnsmb/nZb4MN451fgdZ6peMhe6RSI7+Z1
         IPhQI6inMazs7fFgApK2wAYsMvMEBPeSFLEFwTCVBAdsvkCnKqV+X64CVBoWPc4YZ9WL
         KSsidL6y57zrLDsZ09T9FlD9o6Fj93Ik2qKrtIQ2KXGqBc/yhIMVzW0BGd/KSBIJs/iA
         ByU4H1nVAmvKtuFpNpzi7APXr+j3jcPrBvxyV78FgrqqxQjjCrvcz4NDDfaGVGc4r9ri
         qUdC387D8amZo9fUTbWtUI+jSxpEpLA0+9f+gksvpDCCKSLJIiUR767/dL0sCb3qG0B4
         N8Gw==
X-Gm-Message-State: AOJu0Yx20WZJwSa2goJRBgfMTjz5cUEH8QbBsaQZmmwwhgIZEM9fEfQi
	sWDRbA5A+dY6ZWUNWjZhE0q1qQ==
X-Google-Smtp-Source: AGHT+IGr/MvG95lLuKzFxIXvwXlSw/NAE8PySqhzQPaocAekiGryY/Tyyls5+MukENzO0Hze+3yu6A==
X-Received: by 2002:a17:902:704c:b0:1d0:ba40:b0e1 with SMTP id h12-20020a170902704c00b001d0ba40b0e1mr3851430plt.124.1702237028818;
        Sun, 10 Dec 2023 11:37:08 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id k9-20020a170902c40900b001b9e9edbf43sm5117419plk.171.2023.12.10.11.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 11:37:08 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 0/4] Staging: rtl8192e: Remove unused variables in struct cb_desc
Date: Sun, 10 Dec 2023 11:37:01 -0800
Message-Id: <20231210193705.2131807-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes a few unused variables from struct cb_desc in 
rtllib.h

Thank you in advance to reviewers.
~Tree

Tree Davies (4):
  Staging: rtl8192e: Remove variable bFirstSeg
  Staging: rtl8192e: Remove variable bLastSeg
  Staging: rtl8192e: Remove variable bEncrypt
  Staging: rtl8192e: Remove variable macId

 drivers/staging/rtl8192e/rtllib.h | 4 ----
 1 file changed, 4 deletions(-)

-- 
2.39.2


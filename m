Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD5B2C876;
	Fri, 13 Oct 2023 23:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxD294jW"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-27d1373f631so2056805a91.1;
        Fri, 13 Oct 2023 16:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697240843; x=1697845643; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VsmJKoEfZzH5dGYcow1pJhun4pr6MeJ+V/BA29opGNE=;
        b=jxD294jWEeaBLNpRli54vCxmQmx1wdBGGWHTt/rZGXyRv7E9Sq7Waef9GMtVJ6jC8b
         AJz70U58okXA/0rZt7cQcbq6anUdEg37/iI0JRJJR+TA+1dn4hiLUHfKJJPogMXoeVr2
         8qVjFp4W2LpHc35SVqb+ujCE2lRYmXtIa9vY7Jbx/XuZtL2U/sTOYDaPSJuxJH93HdMa
         XvZrNfsPQqtSQ7D8fo2T53yA1p661fWD41G2jjfVwy+TCZl+xP/YAAPwPARZbH9ye1hR
         h3CkktbnrI+8LuP/dgEvzCJSqOMDu0hm7sD6N3dtU2pM8edYKal14+5W35HSi+3GEpAn
         FZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697240843; x=1697845643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VsmJKoEfZzH5dGYcow1pJhun4pr6MeJ+V/BA29opGNE=;
        b=QTVNNJy8fl3VMreOaMXHdbYvAomGMupGJDSdaBLJgbliQFwwnWRtrj/zsmDFe5eFeQ
         YH06darFJshjd9at4Afkdtn1Qmzar6CBMOYdKpDbUmkbnsCvKwqlLCZCmWynMXXAPTO5
         6VyO2tpXXjUlN94ZM8kcl3D2CgQLuWH9xJcA/FzfczgpgU182mcJSqTmsVyA/hHPx83Y
         m6VYYje5ZES3Y0Vm15hmU8ycaMic6LDt9EiiccuCWiG0ha+++eB0LbQk8XwrP2ExaJ/L
         Eso75zWe7jvGyM215Diy8JqNz96qsQkvERXIk0CwVwr7SDHkE1HprK5v+1RgB6kGLcFl
         oXIw==
X-Gm-Message-State: AOJu0Yy6okgN9YYpBraK3IEtDUO8PnDcSYBiBmMGpsWrFqM3YpYp8EIt
	ls68+pJhdM7Q7rcgr5czNZU=
X-Google-Smtp-Source: AGHT+IGiZmINZuvHcm5NXBP1zW2GwN+KlqVDpBtLEE4e25BQLM8VJn2APtskH4zjuBFz7ve0BvcqqA==
X-Received: by 2002:a17:90b:888:b0:27d:6dd:fb7d with SMTP id bj8-20020a17090b088800b0027d06ddfb7dmr8827933pjb.17.1697240843536;
        Fri, 13 Oct 2023 16:47:23 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id ne10-20020a17090b374a00b0027732eb24bbsm657618pjb.4.2023.10.13.16.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 16:47:22 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Soumya Negi <soumya.negi97@gmail.com>
Subject: [PATCH 0/4] staging: vme_user: Coding style cleanup patches
Date: Fri, 13 Oct 2023 16:47:12 -0700
Message-ID: <cover.1697240381.git.soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset performs trivial code cleanups on the driver 
staging/vme_user to improve code readability. All patches address 
issues reported by checkpatch.pl, and may be applied in any sequence.

Soumya Negi (4):
  staging: vme_user: Correct spelling mistakes in comments
  staging: vme_user: Fix unbalanced {} in if-else blocks
  staging: vme_user: Add spaces around '*'
  staging: vme_user: Add spaces around '<<' operator

 drivers/staging/vme_user/vme.c        |   7 +-
 drivers/staging/vme_user/vme.h        |   2 +-
 drivers/staging/vme_user/vme_tsi148.c |   7 +-
 drivers/staging/vme_user/vme_tsi148.h | 548 +++++++++++++-------------
 4 files changed, 283 insertions(+), 281 deletions(-)

-- 
2.42.0


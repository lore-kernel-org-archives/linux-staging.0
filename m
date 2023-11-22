Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBB71E536
	for <linux-staging@lists.linux.dev>; Wed, 22 Nov 2023 09:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NgXDn79V"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5c18a3387f5so4212517a12.1
        for <linux-staging@lists.linux.dev>; Wed, 22 Nov 2023 01:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700646125; x=1701250925; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=abM4W7xPRLNxSr6XVpDl8XekNAlf56sZOpqa2J1fPeA=;
        b=NgXDn79Vp9hajYlG1suscNbRktJx14vP9u884VLr4jdCqqhO187AaZgRsnIcPFUqA/
         /ejRselvpa5ESjPZpq6hWoY8u4uJUOR8wcRgh3TJfsAVvjxdyPiMpHAiYjIm7cyhBKXS
         PLtlI2iq02aW4nvOrCdrVbQZXBqZ6moekgStH2MYerKTSfMTTzgPpXIs36kiIwXMgjz7
         7zXD8ihVfq9pB71qopdX8fXJ88dWMu/r+7T9+cf4WkMRx5E2SR01cxFEHMugVxx+9D24
         dMlvi5nS5ultBcuIsf0L2yEFG0jWvYd0ju+qizcWTykF+BfOwSosGDj7lhWMjm0Y22j8
         dFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700646125; x=1701250925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=abM4W7xPRLNxSr6XVpDl8XekNAlf56sZOpqa2J1fPeA=;
        b=vWtLAf7rvU2Lyact40Xkgolx12u5qHd/0l+h0VqaGvqy1/nEKl3P9V154J/gHgtK35
         natLi7jiRMbdQNXnDGWKgDRdqVbZ0UUSs2oQST6qYh577jJ4aXFijf/8jw91XS6tzhzB
         EuO2Ue/TK+rlj2BkWP5O6qsJ1RvtXHa/UTQIlIJLdWJCji0XeFAeT3fhB4QuDjfa4UMk
         qmGOGb5zizF/gTjwje4NjwTmXUXhbuvp93F8OJK6J6INYq+2m5wL1uxO68IBWxrh+VmK
         QoaF0g6hkyhee2K0A4/kSwPaoMFCEb9RwnolMDy7pcWW30eReLvnmZ3Rn145NyPL5ir5
         JjTQ==
X-Gm-Message-State: AOJu0YzeAZwEVAtmwD+ZtzdxG+pSIxWPD01BK/8lqecVEDeumPJm/NwE
	oTRTJXXx3kWF4vqL0u85fCo=
X-Google-Smtp-Source: AGHT+IHqeWNO23DIW2lYuAdRhp6TKZ+eKAtoCVKFyJQdL7W+3OHe2cC/WMjkijKCBJRvRfwDqiTwfA==
X-Received: by 2002:a05:6a20:2c91:b0:187:ce9f:e198 with SMTP id g17-20020a056a202c9100b00187ce9fe198mr1422428pzj.5.1700646124816;
        Wed, 22 Nov 2023 01:42:04 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id b14-20020a17090a488e00b002851466f471sm937659pjh.31.2023.11.22.01.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 01:42:03 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 5B10110210547; Wed, 22 Nov 2023 16:42:00 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Staging Drivers <linux-staging@lists.linux.dev>,
	Linux Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Bruno Moreira-Guedes <codeagain@codeagain.dev>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH 0/2] MAINTAINERS update for VME subsystems
Date: Wed, 22 Nov 2023 16:41:54 +0700
Message-ID: <20231122094156.30642-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=856; i=bagasdotme@gmail.com; h=from:subject; bh=2Jh5t3H6agB2YlqKVyZOWg3kjv4ysogPOLg7wiXeDUc=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDKmxpx/vc4r/zffF9Mi7w+4/1SZPCBAQnq/Vtqp14lyV5 bFTuKZFdpSyMIhxMciKKbJMSuRrOr3LSORC+1pHmDmsTCBDGLg4BWAi5/8w/Gabr/jL4GbTtDhl YRXmEI4lp0RnbOp+u2GKcONyFy1udTtGhsklKo7i22cs5VrgefKDJOsLZtZZd6unf5z19qJxUY2 TMj8A
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Since Martyn's last VME subsystem review [1], VME maintainers are inactive
with respect to the subsystem. While Martyn is now working for Collabora,
Manohar is AFAIK MIA (his last email about 9 years ago).

Update MAINTAINERS to reflect above situation.

[1]: https://lore.kernel.org/all/3e91b72a86294b542acf460657d0fd94adeb252e.camel@welchs.me.uk/

---

This series is based on v6.7-rc2 (same as current staging-next HEAD).
Greg, you can pick this series up via driver-core tree if you want.

Bagas Sanjaya (2):
  MAINTAINERS: Update Martyn Welch's address
  MAINTAINERS: Move Manohar Vanga to CREDITS

 .mailmap    | 1 +
 CREDITS     | 4 ++++
 MAINTAINERS | 3 +--
 3 files changed, 6 insertions(+), 2 deletions(-)


base-commit: 98b1cc82c4affc16f5598d4fa14b1858671b2263
-- 
An old man doll... just what I always wanted! - Clara


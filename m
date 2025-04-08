Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEBF239095
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151111; cv=none; b=QabVSaoIgCy5U0zHacjw1riRqtuWKZzQstAkz7Q6FkUaQOupDfjTnbul3Vy+A66YROBZg8tVgCsOHmMm1hGievJWXAKpHVvshPoRHz+o/GatoZYuE09PtS7vhQREGzBYq/2oZq0U52jzv14dzc8ETAWcRPs6baEAm3hikTaCqkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151111; c=relaxed/simple;
	bh=6mgVkkpsjWIgIp9gXlW4Cyz9Lws2PKbkHc0ayWK9yXk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DxgbZbOgg3D9X6It5WQHgSom7rqp2kledPMz8KDw/7KRdORCecGsjCWFwUiMFOhnc67z5Nip5BNO4ktISmesNLD+P7ghl2VBldc4CEHSLqx5W/17Zcbhh8GLM09i6jstTaOW0/MaAjrZtr6EneZVzZCIR7a3vBbVOGHB0rzMco0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=OHW/g3UU; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="OHW/g3UU"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-736b34a71a1so7173958b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151109; x=1744755909; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ViqAkuD4B+wSto7DcoJaE9q3C70rJlubL0ef0OPS3I=;
        b=OHW/g3UU7Pw2G5eHSNbrwb2Fsw29jFXX7yW2vUV2hxJTzW3Zf5TYwsgxTE68wGRJC4
         PLM/CJ0SJnFt6XYoOJhUtMjlVNYb3b08RIuktzLvdClH64XA84WfJK1zuWEaNRPmuO/j
         kEkP0tFTSmzcoMIoTCG9VwOKmU8tGHy9CX4gDKuVVyRSNMprZacg10f2PVNBxsoyVQBC
         Pk5UxlNEwM+K8muZr3ytzrFFEwPu/TtlWwx8fvNXxs8cEROw4WTc5QWzjy9GHhc120y4
         R5hYna7iYvAzSvV8SY32LwEEWzph8GZwpEWWRNy73j9c/7QR6Yk1TpJSwP10KF+0hCtn
         r3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151109; x=1744755909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ViqAkuD4B+wSto7DcoJaE9q3C70rJlubL0ef0OPS3I=;
        b=WNdebtIRP7s1gNGTHKv3YaLCPvHgZMiyDgRwqVC6j1HNtfdlfXGCP3R3q+sL/kFi4c
         WDzq6IYPar3cmrfcz+MVH7qzZxDx5OI/MQ6qeHERJOYa0c9VGmmlN0N0vWuyyKduyLK/
         efMhL0LdcjHbg442sohAT63RNkJMggEMc6G7gxvJeGqPoyUYrYIHvrupK3hi2eWHElOp
         ejc4eIDK761qB2Y5Zydp7NGqPuN19o86nQOKem+Tqv3MQWi9vplnNS/nCnIOo4LKIXuc
         29H2w/Hu+W5F9V98DXgtyZN+ws6l82nv95uSKFxt7Lu2EPVGakJqWtHY7E00joDSNMYv
         yyRg==
X-Forwarded-Encrypted: i=1; AJvYcCWAbC7pxhHOS+37HzInMNCa0seC05w0yd/vBSWWXFYJd+z2lMdHMkLHlhoRz+UbGEYLlY6jfVYKLG2zDxHn@lists.linux.dev
X-Gm-Message-State: AOJu0YxPlQs7W8e11MMvYqC6kLc5X+ufk3Wp2bXuQZ5v8AKJ5xxVXNHd
	qCUKOfQ8rNg/d6bEsUm8HDawcvqF/6+6XOGdKDenmTyCEBzoPQ/pxVA5+MKsqQ==
X-Gm-Gg: ASbGnctwo/uq9wEGvRGoReMfsL4ARhgHT+ayXqs0IF3QX0Xq54sNyI6YbOwlBhoKgQW
	kPbdtCOtcYCaVDR86fQg2Qk1uGJJXOFq9N9/P/f15/CSpTWQt21g3tSM5BW5OuGMZ1SNBonmJ8r
	m8t3SuySNywzOziIRALyOnbO7+0Jo7Kmw1HQO9E1+yzrl/8aAH5VD9MBwPBtucGXYylcd4UtVZn
	rGTgwofiLLSmrn8wxOCMSNaGOq32RcZG5lgAyYpye0vQMjTA642+x/PGsu3qPwGgubNrjVq5Foa
	qhwgUNz2WZzvRjiT6RWD5KRrJdP2za9ExZcUNQ7MSDkciSAX0uONdIZzZPJJIuf/uh97Tb33AJn
	vwPKZ6+3bwA==
X-Google-Smtp-Source: AGHT+IGiBppSjaQteYHQJXrW7OuRfab0zZwBhov0YdifkfZ3l21wx31Di7eLQuSk96wm0lnB3s9uKA==
X-Received: by 2002:a05:6a20:6f0e:b0:1f5:7280:1cdb with SMTP id adf61e73a8af0-2015aeb5bb1mr188900637.16.1744151109169;
        Tue, 08 Apr 2025 15:25:09 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc41ad0csm9593343a12.66.2025.04.08.15.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:08 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 00/18] staging: gpib: Removing typedef of gpib_interface_t
Date: Tue,  8 Apr 2025 22:24:46 +0000
Message-ID: <20250408222504.186992-1-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.


* Patch 1: Adding "struct gpib_interface"

* Patch 2 - Patch 17: Replacing gpib_interface_t with "struct gpib_interface"

* Patch 18: Removing typedef for gpib_interface_t.

Michael Rubin (18):
  staging: gpib: struct typing for gpib_interface
  staging: gpib: agilent_82350b: gpib_interface
  staging: gpib: agilent_82357a: gpib_interface
  staging: gpib: cb7210: struct gpib_interface
  staging: gpib: cec: struct gpib_interface
  staging: gpib: common: struct gpib_interface
  staging: gpib: fluke: struct gpib_interface
  staging: gpib: fmh: struct gpib_interface
  staging: gpib: gpio: struct gpib_interface
  staging: gpib: hp_82335: struct gpib_interface
  staging: gpib: hp2341: struct gpib_interface
  staging: gpib: gpibP: struct gpib_interface
  staging: gpib: ines: struct gpib_interface
  staging: gpib: lpvo_usb: struct gpib_interface
  staging: gpib: ni_usb: struct gpib_interface
  staging: gpib: pc2: struct gpib_interface
  staging: gpib: tnt4882: struct gpib_interface
  staging: gpib: Removing typedef gpib_interface_t

 .../gpib/agilent_82350b/agilent_82350b.c      |  4 ++--
 .../gpib/agilent_82357a/agilent_82357a.c      |  2 +-
 drivers/staging/gpib/cb7210/cb7210.c          | 18 +++++++-------
 drivers/staging/gpib/cec/cec_gpib.c           |  2 +-
 drivers/staging/gpib/common/gpib_os.c         |  4 ++--
 drivers/staging/gpib/eastwood/fluke_gpib.c    |  6 ++---
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c      |  8 +++----
 drivers/staging/gpib/gpio/gpib_bitbang.c      |  2 +-
 drivers/staging/gpib/hp_82335/hp82335.c       |  2 +-
 drivers/staging/gpib/hp_82341/hp_82341.c      |  4 ++--
 drivers/staging/gpib/include/gpibP.h          |  4 ++--
 drivers/staging/gpib/include/gpib_types.h     |  9 ++++---
 drivers/staging/gpib/ines/ines_gpib.c         | 14 +++++------
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        |  2 +-
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c     |  2 +-
 drivers/staging/gpib/pc2/pc2_gpib.c           |  8 +++----
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   | 24 +++++++++----------
 17 files changed, 57 insertions(+), 58 deletions(-)

-- 
2.43.0


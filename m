Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC01A1CAA81
	for <linux-staging@lists.linux.dev>; Wed, 19 Mar 2025 21:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742421579; cv=none; b=hlbUqQN0a1ADiQIAd9PwrI5piqjo2JFlYOn0strTA3yCYYTYt83Zzu7/WT//s+LjSwXx/+dhDGTJRgl3ZTwxhB9cjHNc0iOUaIjWzGNzk4+lOWJ0vxg6OEQRqlUFGSAnJ9l0cVGVt3+FI20FnH0Dj4mRidxmsbK/uqrwwLP1x08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742421579; c=relaxed/simple;
	bh=DuHROmou9tfYbDx47pfkG9I5pk+qCEdU/XjY/OEtDl4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iGyjxPhWwT+7p1dPga7dPc0hd2vAbyL9Z9qs6xAi1Tyg6E5eEI+Wp4z5wFyMQPTZ1PSl4YgCQsm4Rh+h2fuH7v0eRgwpZc0wVfjGvfGfhzEqpumwXiSmWcFVgsDrpCqFvajCiO3o5fKRvk/k4K/iu/idK730xCYtuC3feF01LXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=GPeq+NUd; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="GPeq+NUd"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22403cbb47fso1007845ad.0
        for <linux-staging@lists.linux.dev>; Wed, 19 Mar 2025 14:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1742421577; x=1743026377; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qhHffwlirpZOJ87BsBnAyn0bghFD+bu1krAlw6AA89Q=;
        b=GPeq+NUd17lZ/q2hKLIrFkQvOr8j1JRQLgjdMVPMQ4Inp9rmHupcSvjd7wwl0thsYc
         tAKZXFjBB5/mFP2oo0bYg2FTHB2knmg89rXMmVsO2SGxne/BFhozykU+F4nUFGORJQnD
         wu4G0dADoZadM9JfEbqLIxlWYGKeiNcp/oLWEfoljjrIfDuKa+lLCoTh7H1nebGPe1wZ
         kjVOFJgBWbAHuVbGJE2WsQHp+hSvJzzPGupQ6h6hWRO7VYlrBRnyPFuLR5hSQ3oD+6bk
         nqImj/cyNP+VevpWQU3HnDMfFKbyPgTyRxqj4T7ttF3YJctePOI/6jsb0LIli/5Ow9YR
         h6iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742421577; x=1743026377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhHffwlirpZOJ87BsBnAyn0bghFD+bu1krAlw6AA89Q=;
        b=Gz0PkkhyXYLiDRqhc3UsEHZ2yrgSw/cIXx1FkrAjz4zqnI2SKyglIYgTlLU1Jo8myj
         gPJb5hI/nRrFF316LwQ2liRqZc0LpRr8XwRjcfStX2xi4BFIxUG26zY09aLo4TDudH7z
         c0MzsMG/sZuqbsW69ARBAHwIiFlGFexgJN/xVdJVyqEgZUNuIYfOyawtYHdMe0r2rsAn
         9JyTUR6v1oOcxvB0AuP3bJmbcg3yi9pLGs2rCYOD/cJefFgqK8MOs3UODkMjJOr3m9/k
         u5G+dhwM8QmOOfP/3i3xmXNKEmT/V/xESthpjbyCjS3nEqdoymmkcX/O3VlGWWDsyCBt
         6tpg==
X-Gm-Message-State: AOJu0YxCNM0Duqx4sQ/3k+KxwHMOU4/FAbg16jga92hzHrEH7I+f7JKx
	xx4Etl2GwWQL12cfTOW2iLmPdqTzXhraCq9pyG30FSuhSDlCIcRIAgBuLjlK+A==
X-Gm-Gg: ASbGncu4to0uK/G3DkGiZ3zms+J2lIH4Hp43IlCcmNQtmXwfCl+hFqLu7z2ymE/oWvb
	3V59iEGDJOsn5RvcLkDCNDrIlfJxWnD65qcY9dKc2pobbjK7KOA3HRQubiQLm+DfB15xguY/wb0
	/sUAPV8gYbuEI5htI29u+WSFRRUXfJX+4dNXxdvUNpqO9Jn8g7InrqWj57YIBE+dtGpKp1s98MS
	2GY1lKc5GaLPa+5AtxnWk74yn+ozW/6UG5zbPHhbJvLMpGZD9KryOAPY6UnvMGTQ7XnlQNyUP65
	W6bgXu9xbAOCwJktFJjUR73PRxW4H/Eeh1y9z9I6qpueogyxbr+H/ej/5p2UMSiRRU11lNGy3iV
	1b5wpEz+oBw==
X-Google-Smtp-Source: AGHT+IHijFMQ5qiJupJGGoqNu3+/AqRhKkzmiIpkcLRmsE2+T0qD4Wrj3bd9cEZPaXOb1DWS7CHUHQ==
X-Received: by 2002:a05:6a00:1ad4:b0:736:32d2:aa93 with SMTP id d2e1a72fcca58-7377aa4dc65mr1501168b3a.20.1742421576913;
        Wed, 19 Mar 2025 14:59:36 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737115592b7sm12623597b3a.64.2025.03.19.14.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:59:36 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 00/20] Removing typedef for gpib_board
Date: Wed, 19 Mar 2025 21:59:04 +0000
Message-ID: <20250319215924.19387-1-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

staging: gpib: Removing typedef for gpib_board

Adhering to Linux code style.

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

* Patch 1: struct typing for gpib_board

  Introduces struct gpib_board replacing gpib_board_t

* Patch 2 - Patch 18

  Adopting "struct gpib_board" as opposed to "gpib_board_t" for each
  subsystem in gpib.

  *  staging: gpib: agilent_82350b: struct gpib_board
  *  staging: gpib: agilent_82357a: struct gpib_board
  *  staging: gpib: cb7210: struct gpib_board
  *  staging: gpib: cec_gpib: struct gpib_board
  *  staging: gpib: common: struct gpib_board
  *  staging: gpib: eastwood: struct gpib_board
  *  staging: gpib: fmh_gpib: struct gpib_board
  *  staging: gpib: gpio: struct gpib_board
  *  staging: gpib: hp2335: struct gpib_board
  *  staging: gpib: hp_82341: struct gpib_board
  *  staging: gpib: ines: struct gpib_board
  *  staging: gpib: lpvo_usb_gpib: struct gpib_board
  *  staging: gpib: nec7210 struct gpib_board
  *  staging: gpib: ni_usb_gpib: struct gpib_board
  *  staging: gpib: pc2: struct gpib_board
  *  staging: gpib: tms9914: struct gpib_board
  *  staging: gpib: tnt4882: struct gpib_board

* Patch 19: staging: gpib: struct typing for gpib_gboard_t

  Adopting "struct gbip_board" as opposed to "gpib_board_t" for include files.

* Patch 20: staging: gpib: Removing typedef for gpib_board

  Removing typedef for gpib_board_t

Michael Rubin (20):
  staging: gpib: struct typing for gpib_board
  staging: gpib: agilent_82350b: struct gpib_board
  staging: gpib: agilent_82357a: struct gpib_board
  staging: gpib: cb7210: struct gpib_board
  staging: gpib: cec_gpib: struct gpib_board
  staging: gpib: common: struct gpib_board
  staging: gpib: eastwood: struct gpib_board
  staging: gpib: fmh_gpib: struct gpib_board
  staging: gpib: gpio: struct gpib_board
  staging: gpib: hp2335: struct gpib_board
  staging: gpib: hp_82341: struct gpib_board
  staging: gpib: ines: struct gpib_board
  staging: gpib: lpvo_usb_gpib: struct gpib_board
  staging: gpib: nec7210 struct gpib_board
  staging: gpib: ni_usb_gpib: struct gpib_board
  staging: gpib: pc2: struct gpib_board
  staging: gpib: tms9914: struct gpib_board
  staging: gpib: tnt4882: struct gpib_board
  staging: gpib: struct typing for gpib_gboard_t
  staging: gpib: Removing typedef for gpib_board

 .../gpib/agilent_82350b/agilent_82350b.c      |  99 +++++----
 .../gpib/agilent_82357a/agilent_82357a.c      |  85 ++++----
 drivers/staging/gpib/cb7210/cb7210.c          | 107 +++++-----
 drivers/staging/gpib/cec/cec_gpib.c           |  59 +++---
 drivers/staging/gpib/common/gpib_os.c         | 196 +++++++++---------
 drivers/staging/gpib/common/iblib.c           |  50 ++---
 drivers/staging/gpib/common/ibsys.h           |  14 +-
 drivers/staging/gpib/eastwood/fluke_gpib.c    |  93 +++++----
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c      | 122 +++++------
 drivers/staging/gpib/gpio/gpib_bitbang.c      |  72 +++----
 drivers/staging/gpib/hp_82335/hp82335.c       |  56 ++---
 drivers/staging/gpib/hp_82341/hp_82341.c      |  68 +++---
 drivers/staging/gpib/include/gpibP.h          |  10 +-
 drivers/staging/gpib/include/gpib_proto.h     |  58 +++---
 drivers/staging/gpib/include/gpib_types.h     |  58 +++---
 drivers/staging/gpib/include/nec7210.h        |  58 +++---
 drivers/staging/gpib/include/tms9914.h        |  52 ++---
 drivers/staging/gpib/ines/ines.h              |  54 ++---
 drivers/staging/gpib/ines/ines_gpib.c         | 111 +++++-----
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        |  66 +++---
 drivers/staging/gpib/nec7210/nec7210.c        |  76 +++----
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c     |  70 +++----
 drivers/staging/gpib/pc2/pc2_gpib.c           |  68 +++---
 drivers/staging/gpib/tms9914/tms9914.c        |  66 +++---
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   | 100 ++++-----
 25 files changed, 947 insertions(+), 921 deletions(-)

-- 
2.43.0


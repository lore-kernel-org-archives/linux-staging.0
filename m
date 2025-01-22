Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376001F8F19
	for <linux-staging@lists.linux.dev>; Wed, 22 Jan 2025 10:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737542347; cv=none; b=T6rVkfq2QlrvCB/FaplVzyeYldbxVhbVVjXlMLAZK4L4OfpvHwaHnCYFQNPmFpoJrii1xGbsw4ZlbedTTdQbfx7GJwe6Jv4RBdiGWsIxHs6Ll/BCsFY3C9t8sepcRCmImTWQErbs7rC/OjijctHPOYOC8Fan3Aq67vsFF1U2GYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737542347; c=relaxed/simple;
	bh=dAy+S2w9cUh0R8EYp0QYkI7U7tXGPjByBZtpfUBTjko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P729F5Lgj7SPUmuVfwlt4ZM1o2R1HP8/M4ITtRZjHjMnRRJdTItUTUOyK4nX1wW/CJnoIg37ARYcjjJ2968eGrkcz0ii22x/s5BaE3j2Qt/TK/Lptp8rNfxPPqCWJ1wkM+pnBDaiGl4ZTgvUZb4R7/8bKa/0vIW4bpCjCxOSqRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aB0MoEYs; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aB0MoEYs"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38637614567so3266484f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 22 Jan 2025 02:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737542344; x=1738147144; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Pk7oVaD9xaNG6FC+wI0nCYDaGmSZYDv8FosrgIBx8A=;
        b=aB0MoEYsi5OBU6SPJs5jP2lvYpXSFDhlB6UUhb/lB2ZtJCU3aCvHDLIDzpTUcSSmTd
         57PDvo0fUsGZAADISSgNbZe90eYYR2c+LSrhvm4ocfi/CZTA3B5kqsopPkaIYOVX6wM4
         +rxqlfrzqXCJWzInMIiUHqZE8nvcixvvsblYEmNtH7+2n9IH3fhGhIwpBDphPNuMeihO
         5oCcsz6WDU3K6rxkuz4hPZt3pqJnn9zIHeNq5Uc3gLC2MhPkXCaBx7hKEK46To3NwZrD
         qWreu1FD5XnKL1RpkpnkAuukM54Z/3tpuSeeoPY5Q3Ow5qYpDx9YjRIckTi85JuP/GNt
         WHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737542344; x=1738147144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Pk7oVaD9xaNG6FC+wI0nCYDaGmSZYDv8FosrgIBx8A=;
        b=VbriVi+0N5ELIyOOSyVK8GnPDYn/9STVtnQsTiPqoGf8V7ZiPWL7N+fFvnQ+dZLC1w
         X/HZMGn8xOVZZo2pB1hTcBJtnSAHGp8VJfrVu/76ydecLAoFjof51dGJJbVCHrMSET0f
         xmteStEwsK+lmHwX+5tBQk/2dDiyM8Zj4WQPWCuf2yM4E32znPBRfJwZ/rFLQ6aGyjtd
         vk/Ve4mtazJThEE+o4rXUqdj6qUzzRejWyVjfnf5ppkKUX4SLg6PGDUw0VYXG/wStYH7
         Vqt7osnS6QC1EfQXHurfdGH7hmGGBF5U3iF22D8FdwkNZzcWp2ZpkMzzRGCtRDY3VFrz
         JkKA==
X-Forwarded-Encrypted: i=1; AJvYcCWQkzIi6Jc9eU/8PEEwG8kRjICpKfXW281hRZzGEWGByneQH2HFiNSa+WilZ+6eo2UDph8v3j3Thn69FVvs@lists.linux.dev
X-Gm-Message-State: AOJu0Yzzs2v3moKRAfGnczcImKXxqQ/ycOofmeMtM++JdaZpz6zbxSqI
	KJW1vDI1XshqsZArsN4ZryuqNN2gMGrkG3q4vs+lxA1PvyKy1ZQ53LRX/Y2u
X-Gm-Gg: ASbGncul5s1VxCGnJtu8SvHKBCNmEep7hSUy29GjjrY2S0K6INsExiL+uL5f6LjnDdl
	2puO9mgcUcfprFtmb9uUP3+WGVI88xPVoJ57/6fNr8RIFeDwo9fC5mgyWNHnNWHqMawL5rRzqbt
	/SsiNnz45p4r7DrmfCJ2b8Zl6PKA1HX9g2GL3+t7YiIxZLXLTkVSJbGUAjSgS8T5O5XeNl1qB6c
	tqtNeSdkdSUSGCTYpLKHaMEoQE7614W9YNOEegQJD/7cnIfyYxfcrWupnixYQMFObYdzoYJ6001
	iSJZdIqMSbfHvKYVlctUKqHbqWqV8g==
X-Google-Smtp-Source: AGHT+IEAKdsmN11UZ53C0EniwcJHZ3xd/zK4GEq/Y8cRG95vGWNY6LkcONMklYIBfr7lJO8j3q51qQ==
X-Received: by 2002:a5d:6a92:0:b0:386:3403:7b63 with SMTP id ffacd0b85a97d-38bf57b3d42mr13597623f8f.36.1737542344078;
        Wed, 22 Jan 2025 02:39:04 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf327ded8sm15661328f8f.89.2025.01.22.02.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 02:39:03 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 0/2] Driver entry point clean-up
Date: Wed, 22 Jan 2025 11:38:57 +0100
Message-ID: <20250122103859.25499-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches make the driver entry points static and tries
to minimize the number of forward declarations.

In the course of the cleanup a missing entry point in the
interface structures of the agilent_82350b driver was
discovered.

Patch 1 fixes the missing entry point.
Patch 2 makes the driver entry points static and moves
        the interface structures to the end of the drivers
	where needed.

Dave Penkler (2):
  staging: gpib: Add missing interface entry point
  staging: gpib: Make static and reduce forward declarations

 .../gpib/agilent_82350b/agilent_82350b.c      | 110 ++-
 .../gpib/agilent_82350b/agilent_82350b.h      |  47 --
 drivers/staging/gpib/cb7210/cb7210.c          |  89 ++-
 drivers/staging/gpib/cb7210/cb7210.h          |  45 --
 drivers/staging/gpib/cec/cec.h                |  29 -
 drivers/staging/gpib/cec/cec_gpib.c           |  51 +-
 drivers/staging/gpib/hp_82335/hp82335.c       |  52 +-
 drivers/staging/gpib/hp_82335/hp82335.h       |  30 -
 drivers/staging/gpib/hp_82341/hp_82341.c      |  71 +-
 drivers/staging/gpib/hp_82341/hp_82341.h      |  40 -
 drivers/staging/gpib/pc2/pc2_gpib.c           | 247 +++---
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   | 718 ++++++++----------
 12 files changed, 638 insertions(+), 891 deletions(-)

-- 
2.47.1


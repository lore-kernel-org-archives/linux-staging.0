Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126F020A5DE
	for <linux-staging@lists.linux.dev>; Wed, 19 Mar 2025 21:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742419112; cv=none; b=RXvLeCry0gjhoDwLwUjrFDbwzct0Ud+bzSX3tXNEDVW1/hos9PxlES0Wsg1x5A9IVlsYS4DOVrwMBvcgMRjPPnl29wZBFwFsoOGXU3LyRcdTXIlArInNdiYap//w9I/VrHfPZL3NtxYsy7RbRUx++bHHVP3Jn1fEgIvlnacwStQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742419112; c=relaxed/simple;
	bh=rEGsX1ZL7wxRIM5cdnEr5L4KQRNNecaXri8d4lShATk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AaexaWfcLb2RVGvP1fHqhyb7vtQ37Eb4/1IJB6GlS72KQv8dIuorkH0Ij8cU54+Y51RO3EJxFcb2xiQtctT8AwxWwpie2NveCOuqoLoylL9tdrBhTtL9MUbTSmU8CdHwKiR5ZPMY0/PdQdTqhwavmHhh95hKpAhKAq8sZTeQYNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=a4bJ8Ca2; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="a4bJ8Ca2"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-224171d6826so425325ad.3
        for <linux-staging@lists.linux.dev>; Wed, 19 Mar 2025 14:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1742419110; x=1743023910; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cD3gOFG7Y44R7WPaqCPkYl7FsfAV4wAGj9YVcra0uh0=;
        b=a4bJ8Ca2h/BGpmoSjM88H14iLsdFIei4Td8skRNlDUPNaS3xrKni8ZXRq0VG1eFJwV
         tABGIt17AeVgP1sdvzZImCr9EAWwobFZNhOJ5QzXr9KK6Zaqkf/rXL/pudNmMpOdQb30
         LGwrYfq9oKRFdACMdwsMj3qTa10keaoadZjemiA0PjSfPdjNozntHx6xEgqvLSRJNSQ7
         WeycjdpehTEqEdWJMKyGfNexm4t+rm5d2++PMKQ+ZsaMiflFDQr/XnbIIOypIdQokAYH
         qT5fzYtUd+XTIcxKyxkPcCfCZMlJL9ng8SF5U7GON4FaqELc0ZbdIHH9M4FgBgTIt7yr
         pklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742419110; x=1743023910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cD3gOFG7Y44R7WPaqCPkYl7FsfAV4wAGj9YVcra0uh0=;
        b=mzq/CduTMXZXkidQ3jnFOPsf1chhnIhvjFQVjNx52ZwDivDl9Z2HgKZQjeehIz0DZk
         neK3UvAzMMNZIFqzu1zIql2iR+6htP3sFzr5zT1p/9jqzyoCWcUMsf1eNqYWVV3IT9si
         erxRAokJbEQQtTLO4kaDKcUc9h9UfVdXy0EjMAtRw90od1UJ8arqs5aV+q2gRpKAF9uo
         h7XUJj+IoSejOhXMwED42+LW6/dhdtbyItAGdtbi7Lnlfo8MfYQMDPEyI5aP5ykPRJHR
         v8cYscu4xXytciD7FAdtiZTS0nzV4L1pUCLNFYtDpv+fYOPh3SR0+2gSZoOSNcKmGA+0
         zdKw==
X-Gm-Message-State: AOJu0YwYsZlkDjjHOegL8rDTVIB4gNXOnPR49xP9cbLxRkULC3zjyC76
	3H51drtxUlqfXjwMcqt2jg7BeJUI65uhYF1dOJRp0z7d1FWRe9L4sLiWPDGf4A==
X-Gm-Gg: ASbGncu5Dk2CkAHbLh3SLyMGxUQ/9RpduRxOIFz2RS4Q3xm/Sp3CDMtRGLIj3kOArqc
	8rY1ktJ4llxetcAh568ZQ4TvkYOtJIgiBCvV6airTQV86OmmFj/b09IZtsqP5GfYEKnDUbTWOIs
	CJsGhpQjGBDE/qcbmewhoR/zUyjR6g6avLliGLMoOVCEc4HyhT9qcmMwhie8KEQ4ente2XO6Mdg
	kkMzBVxxUx8S/h2JU+y3TdfKFCJecWW8pjyehzK3PFzUcg+CaaUEYDzAxh9qP2xq8lDNi+PAYG3
	SfvI8sB3w/68YSN1vmTNevAqDV6VcQDTCKTzzdqbrINHjoSR6diafL450UgDcnDYujahHDPA3F/
	bBdl/BkAnXg==
X-Google-Smtp-Source: AGHT+IFkg4hzypHJQaU7F3QeKg9ZJvAq0sy5ZjBTlPcQfXuwvWG4p+9v0kVC6v4mQJM5FPCf1KuMRg==
X-Received: by 2002:a05:6a20:9c89:b0:1f5:8e54:9f10 with SMTP id adf61e73a8af0-1fbecd48b02mr8691848637.34.1742419110314;
        Wed, 19 Mar 2025 14:18:30 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9e2f45sm11460782a12.29.2025.03.19.14.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:18:30 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 0/2] Correct CamelCase drivers/staging/gpib
Date: Wed, 19 Mar 2025 21:18:25 +0000
Message-ID: <20250319211827.9854-1-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

staging: gpib: Correct CamelCase and remove duplicate entries for bus control
lines.

Adhere to Linux kernel coding style.

Reported by checkpatch

CHECK: Avoid CamelCase

* Patch 1: "staging: gpib: Correct CamelCase for BUS constants"
  * Removes duplicate entries and corrcts Bus with BUS

* Patch 2: "staging: gpib: Correct CamelCase for VALID enums"
  * Replaces Valid with VALID

[PATCH v1 01/02] staging: gpib: Correct CamelCase for BUS constants
[PATCH v1 02/02] staging: gpib: Correct CamelCase for VALID enums

Michael Rubin (2):
 .../gpib/agilent_82357a/agilent_82357a.c      | 18 ++++++------
 drivers/staging/gpib/cb7210/cb7210.c          | 18 ++++++------
 drivers/staging/gpib/common/iblib.c           |  8 ++---
 drivers/staging/gpib/eastwood/fluke_gpib.c    | 18 ++++++------
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c      | 18 ++++++------
 drivers/staging/gpib/gpio/gpib_bitbang.c      | 18 ++++++------
 drivers/staging/gpib/hp_82341/hp_82341.c      |  2 +-
 drivers/staging/gpib/ines/ines_gpib.c         | 18 ++++++------
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        | 18 ++++++------
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c     | 18 ++++++------
 drivers/staging/gpib/tms9914/tms9914.c        | 18 ++++++------
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   | 18 ++++++------
 drivers/staging/gpib/uapi/gpib_user.h         | 29 ++++++-------------
 13 files changed, 104 insertions(+), 115 deletions(-)

-- 
2.43.0


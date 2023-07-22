Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2114658
	for <linux-staging@lists.linux.dev>; Sat, 22 Jul 2023 21:54:12 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-346541baf2aso10286915ab.1
        for <linux-staging@lists.linux.dev>; Sat, 22 Jul 2023 14:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1690062851; x=1690667651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b9FhzjLfl4fSYGH5UbNVsYq5D9vHHykt+h8l2ZdR56A=;
        b=YoMngk95JITerUrexXkhCSPWWii3zUHq6ljWr8sTbh9YjLI4DILtX1aa0yurWH3tbV
         2iIIKNt0HxnT4obnVubT4BBtk9PQ6E5ngEcN1igajP08KspVK4SubKM/yiIF3i30Tss7
         IApJdp3NRJeUtTu3vTKYh1HHsvareZtfrX5/3ds1XLC61R/cWMiHL+nc5H7EAOp7uEtm
         U54hAbqFTVrPzMBH9rcsyYG6ef++9swW7Y3g0ygI6SFNq5pJrZK5PywqHZqIS4gZq608
         CbNyRmRAcZzsSY6iNh5osP4s59hY1mifj2bNP2Ayl0YlbTCgN0xn+jkboQGLFvJ03+t3
         jWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690062851; x=1690667651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9FhzjLfl4fSYGH5UbNVsYq5D9vHHykt+h8l2ZdR56A=;
        b=LSwTz6+Z/GyiwMlfxccnBpOHjHm2sgUNFlrfNs/uRUJM5CKkXNXzD9Z+D1whh1tWWw
         xb2I04brz+ZV3SdfHWDNf/Q6LuzgSCXjqPMG1Ey//kMF6+HZcXMB9xxlD5hSxrV/IIfu
         FrkYvFeXvz1b70Lt+LXa0fsEugoiSrNS0+5zxb0k7aI6qMmwvoFC4JfwllaZexfqgfwK
         AuuoSOXuUbehxTF4iZp8gEADbneMo+dVwV8oaU5fMuOQ+8cBsYpLOLYQEi0yEQHi3UMx
         hbkAQ7hYq7AZvrVRfstP8U+OTrOHEMw57lvN8/kdoiwLA0/CSfVY5alvDo5mV7HoOyqg
         lsew==
X-Gm-Message-State: ABy/qLYSjqDEUl82v4skKJ7HFX6NQIeSOu9aOdcyQkahycfl5T19jl58
	+eQ28hbX3O9frDy/qepYA+waLKSTVVeiJA==
X-Google-Smtp-Source: APBJJlF9+MtlbWiIguzIDzEWOTGPycVaLnMT8a7GagVAQwC2YthJVAy49NJTXsA5sdv3HPgdPoUIaA==
X-Received: by 2002:a05:6e02:1d01:b0:346:23b0:3725 with SMTP id i1-20020a056e021d0100b0034623b03725mr2214985ila.13.1690062851351;
        Sat, 22 Jul 2023 14:54:11 -0700 (PDT)
Received: from localhost.localdomain ([161.97.244.155])
        by smtp.gmail.com with ESMTPSA id k11-20020a02a70b000000b0042b45475212sm1929783jam.81.2023.07.22.14.54.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Jul 2023 14:54:10 -0700 (PDT)
From: Franziska Naepelt <franziska.naepelt@googlemail.com>
To: linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	Franziska Naepelt <franziska.naepelt@googlemail.com>
Subject: [PATCH 0/9] staging: rtl8723bs: ioctl_linux: Fix checkpatch issues
Date: Sat, 22 Jul 2023 23:53:30 +0200
Message-Id: <20230722215330.4114-1-franziska.naepelt@googlemail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a series of patches to fix some trivial checkpatch issues. Not all
issues have been fixed.

Testing:
* Build the module
* Boot the kernel with busybox in initramfs
* Load the module

Franziska Naepelt (9):
  staging: rtl8723bs: ioctl_linux: Fix else on next line
  staging: rtl8723bs: ioctl_linux: Fix code indent
  staging: rtl8723bs: ioctl_linux: Fix block comment alignment
  staging: rtl8723bs: ioctl_linux: Remove multiple blank lines
  staging: rtl8723bs: ioctl_linux: Remove unnecessary blank lines
  staging: rtl8723bs: ioctl_linux: Remove unnecessary parentheses
  staging: rtl8723bs: ioctl_linux: Fix alignment on open parenthesis
  staging: rtl8723bs: ioctl_linux: Add preferred spaces
  staging: rtl8723bs: ioctl_linux: Fix comparison to false

 .../staging/rtl8723bs/os_dep/ioctl_linux.c    | 161 +++++++-----------
 1 file changed, 58 insertions(+), 103 deletions(-)

--
2.39.2 (Apple Git-143)


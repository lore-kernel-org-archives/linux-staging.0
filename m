Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03177F
	for <linux-staging@lists.linux.dev>; Sat,  4 Feb 2023 10:17:01 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id mf7so21706217ejc.6
        for <linux-staging@lists.linux.dev>; Sat, 04 Feb 2023 02:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iQ59r0rotKFAuZhlDECOo7ijCQQ7bHkTI5v6Lahur6Q=;
        b=K21aNLW4STrtjUcxxtGcKDexYbtrAOVLdDkfx/LQrZIMWtzk9zQ9N/ZDdudXQ4PfQi
         9jpiVNZ5RR4ZJfiX8xmSvaRdb+N8ZNfa5MvrmbMm8WO4UVd7MjnkDsdOtDJJJpBtiadJ
         1lit9dHymNEWBfsP5ol47Ipk1T4OfoRaLgPVh23yYBcbaVvDMDS1FbZ1xpLeJWVdrQtp
         x4wPlDOr9DQ5qTk7lEcm0XOw6eBjLoFqo45megdD4d2tu4aGvaGKW8RNuwQHh6nbbLu2
         3K35V8dOhchMg8QzDXjiF0dwsMVRrLKWmw3mGKSTWG6VzsG9n15f8NIoA/PPwsHBv52w
         6hrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQ59r0rotKFAuZhlDECOo7ijCQQ7bHkTI5v6Lahur6Q=;
        b=0xnb7cbGmeP/ctJH3QvqxeYts0z3JoKXxHiI4tY0uXsWaUXM7UBPFteHnTIpGWw/hJ
         5H2I4XxcaTcksHHiXKnmnwjyzGcX3AyowJj2zQgAj1B+FLPt2ZwH4EJ7AIQkYDOOQj8J
         qI++n5TSgXKtlz9hre+f/dRXRviP689H+LpVjMItuzRS1TjUfBfdPgxawlbZM4ABotbC
         gPNMxAnzp7fwIo1AnNNHVwry6dpQDafTRQMC5pDg6COMfet26IyB5DBMOjofzThAg9fp
         4wpZfyyAkBfLXo6MGhCLxP0ZD+55Wxyx9bN5hqdshBfVqoAJ79N0UMDqrtx82XDOBDRV
         Pi7A==
X-Gm-Message-State: AO0yUKUQsT3ysk+KE1SZ136IXtCGlNdyV9mhIEMBdlWykqCjVB2hK1k+
	lOjdF3Y/bCkBgS/96+0ySz0=
X-Google-Smtp-Source: AK7set85HT+nNzxKeDL4gH6o+uOwgVuNKxD8+DKHD/QqkyLv5yOuTGdWkqdAYlnKupfqT4d0BEhp/A==
X-Received: by 2002:a17:906:230f:b0:88c:6345:d0e7 with SMTP id l15-20020a170906230f00b0088c6345d0e7mr13744319eja.36.1675505820177;
        Sat, 04 Feb 2023 02:17:00 -0800 (PST)
Received: from localhost.localdomain (ip5f5abbf9.dynamic.kabel-deutschland.de. [95.90.187.249])
        by smtp.gmail.com with ESMTPSA id m19-20020a1709061ed300b0088ed7de4821sm2632378ejj.158.2023.02.04.02.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 02:16:59 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/2] staging: r8188eu: correct error logic of two functions
Date: Sat,  4 Feb 2023 11:16:52 +0100
Message-Id: <20230204101654.10232-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series converts two functions away from returning _SUCCESS and
_FAIL. Another tiny step to get rid of _FAIL / _SUCCESS someday.

Tested on x86_64 with Inter-Tech DMG 02.

Michael Straube (2):
  staging: r8188eu: correct error logic of rtl8188eu_init_recv_priv()
  staging: r8188eu: correct error logic of _rtw_init_recv_priv()

 drivers/staging/r8188eu/core/rtw_recv.c   | 30 +++++++++--------------
 drivers/staging/r8188eu/os_dep/os_intfs.c |  2 +-
 2 files changed, 12 insertions(+), 20 deletions(-)

-- 
2.39.1


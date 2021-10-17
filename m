Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2E22C82
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 14:28:33 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id z20so59985016edc.13
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 07:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GcnZmPhYZ4EKSXWrlwtHmKjB5xxunTLFlUoYIZsuugc=;
        b=ggr7K/NPPlN9hbbLxjlJIycROVMc8i+e43DP9sp3J76bc9rVpgu1fxc9mYlIiTAwXo
         k/ZNZzxwcS5dKq/xO9tTX8GZWu15vDh/O0bbkDHqiG0ygj1XdSZOW/rYykr7UMtCF/GK
         twMqJLPW7cV34rkySCdwE6eoBEjTwYWfFCHDbAEYEYGaGm8//TjZrCAKin/5WSqZkJ8g
         UjFBhQPHzO4T8r+wJPpvt6Ge0euhAAmg58oWj1+eiNmBYjl9sch0pakCtVmnV7CbEu/L
         8YfPfsFiljgLHeV+WyaMuAglWvcYawmZxHA+ucf6POiM4DomHZIlpkxl3M5Ar9blls00
         6G+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GcnZmPhYZ4EKSXWrlwtHmKjB5xxunTLFlUoYIZsuugc=;
        b=f9CmzrQqjEmqPUOscw0Sdn5WYOZe75SVMmKzmk+p7rU6cJR1sMCJOi+jf1HMlHLDyA
         h+zvYz+ObwSAdlvVRYjyBZ3JRb2Gk9HAvEyYe3QUbZXVDrn1ljIBFGc6XuLqRCkcG6ub
         /G17SBZ3os1GfL1mpfeLWAgLtT2d1iIYvL9UEG8+MszBM/VCe1utZKjJQwZ7AHmsS8hN
         VXUp8G+jdllPI1wl98UqyTrF1Npttrd+WLLa04eTgawdEyAB3hI037LS3Rpk2hwErdgE
         Nv2GrVfcK6PUlnFwcVCppCHkYaD02ujYdKW2DFJxjneG8N4ogTFeSs6RqPne8bJeTIfq
         8wjA==
X-Gm-Message-State: AOAM531he5nnH3OlI9e2rwj4INm0zWNaebQrCdHSZCm77W/BEJr3X/HE
	mJLZmXYS7/OyuSNOtPJs1NU=
X-Google-Smtp-Source: ABdhPJyRhbArPHVFmNmjg6zHsifsRuSwrKaO+aFocPVgCCTSKwz2frUYDQxObFi+0aiz6g/MbUx5RA==
X-Received: by 2002:a50:cd02:: with SMTP id z2mr35459438edi.241.1634480911442;
        Sun, 17 Oct 2021 07:28:31 -0700 (PDT)
Received: from localhost.localdomain.it (host-79-47-104-180.retail.telecomitalia.it. [79.47.104.180])
        by smtp.gmail.com with ESMTPSA id p23sm9094537edw.94.2021.10.17.07.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 07:28:30 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Martin Kaiser <martin@kaiser.cx>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v2 0/3] staging: r8188eu: use completions and clean rtw_cmd_thread()
Date: Sun, 17 Oct 2021 16:28:09 +0200
Message-Id: <20211017142812.4656-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series replaces two semaphores with three completion variables
in rtw_cmd_thread(). Completions variables are better suited for the
purposes that are explained in detail in the commit messages of patches
1/3 and 2/3. Furthermore, patch 3/3 removes a redundant 'if' statement
from that same rtw_cmd_thread().

Tested with ASUSTek Computer, Inc. Realtek 8188EUS [USB-N10 Nano]

Many thanks to Dan Carpenter <dan.carpenter@oracle.com> who helped with
his review of the RFC Patch.

v1 => v2:
	Patch 1/3: No changes;
	Patch 2/3: Replace wait_for_completion_killable() with
		   wait_for_completion() because killing the kthread is
		   not allowed and so there is no need for killable
		   wait;
	Patch 3/3: No changes.

Fabio M. De Francesco (3):
  staging: r8188eu: Use completions for signaling start and end of
    kthread
  staging: r8188eu: Use completions for signaling enqueueing
  staging: r8188eu: Remove redundant 'if' statement

 drivers/staging/r8188eu/core/rtw_cmd.c    | 20 +++++++-------------
 drivers/staging/r8188eu/include/rtw_cmd.h |  5 +++--
 drivers/staging/r8188eu/os_dep/os_intfs.c |  8 +++++---
 3 files changed, 15 insertions(+), 18 deletions(-)

-- 
2.33.0


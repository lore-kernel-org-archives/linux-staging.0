Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8552C9F
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 11:38:07 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id i5so2501226pla.5
        for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 04:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jy4A0xld4cnoSeYnYltPRwIoXa2YiW35xmuIijSpqiM=;
        b=QtCI5q6lSrZGoZglRRmuMJMG5nwV42u1uVft1BqwOYfEVFeTe8YvuVxHzib5n7ssrJ
         sjGTEGZAO2W83XHupV+epq77AnNI828PmmeE6WczTyN1teSzg84/BGLxgov5bB8vr6Xi
         DQqV25+pGxsTOR9eG4wv8d2kBzvyx3imQOOiuYtMUtrTrR/OBDTV3URIM0aKnwa8isYG
         VfIpcyLvJ4gg+7SzelTseXbVUbGZIHfmP7jEgKm1KR2KbLWiNlkem1KUzWfZLc/mEjse
         bKNgfhgHxF5pmND0FNctzmqt+Bpv8QUPs+9s9hfqpcXNhdjqTMa3K7KHelt30DdPFAI2
         zrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jy4A0xld4cnoSeYnYltPRwIoXa2YiW35xmuIijSpqiM=;
        b=dxCEgXvko0qDjqFHSWjtKCKNWXGe9bYKn6N+jIJaZNTn81jld/ND9K9fJ8I4bquPoM
         l1eqx4Y2B/hJNi3FJjB5v5y2md8yz43Pi4OJKFsV5U62uzH4NZd9TelvUInkR8r0FJJc
         ZGRaNdfxx7Xb/nBokqpzsy30tiRPbLU8TeGlUDvCaaTdFGI7v0lhCUzEC+PccKwFeZ8Y
         JlbJS9hRG+DLFpx6WQ0YM2GPxm5ImqSDFilgK63F7WIwOLYcGN3znMQMWl66+/nXSWHS
         7fMX+drJGT0ETHv8UFDiPB7MPdoytB23X9h1WuUT4AzAcQ8OoHuvgLe28eiSx9OSelh3
         tmLw==
X-Gm-Message-State: AOAM531evSrsiiTG4Ep0MYi4JeyM+KVFQpa1GwYC8v2GkqzSPiiT7X6E
	wd9JOlHjI7ooVnIe2rs2LrXkbpShxW441Q==
X-Google-Smtp-Source: ABdhPJx9S4u/WGe9TJCFiETqYHqSttLKWDlzjeCvRsZsULYgBzw3HKvzk6yhwBzTVOmKlEn2Q4zPpA==
X-Received: by 2002:a17:90b:1806:: with SMTP id lw6mr13947074pjb.222.1634902686626;
        Fri, 22 Oct 2021 04:38:06 -0700 (PDT)
Received: from localhost.localdomain ([115.96.219.100])
        by smtp.googlemail.com with ESMTPSA id t22sm10946224pfg.148.2021.10.22.04.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 04:38:06 -0700 (PDT)
From: Kushal Kothari <kushalkothari285@gmail.com>
To: gregkh@linuxfoundation.org
Cc: kushalkothari285@gmail.com,
	kush19992810@gmail.com,
	outreachy-kernel@googlegroups.com,
	fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com,
	fmdefrancesco@gmail.com,
	marcocesati@gmail.com,
	straube.linux@gmail.com,
	philippesdixon@gmail.com,
	manuelpalenzuelamerino@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mike.rapoport@gmail.com,
	kushalkotharitest@googlegroups.com
Subject: [PATCH 0/4] v2 staging: rtl8723bs: core: Cleanup patchset for style issues in rtw_cmd.c
Date: Fri, 22 Oct 2021 17:07:34 +0530
Message-Id: <cover.1634899405.git.kushalkothari285@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kushal Kothari (4):
  v2 staging: rtl8723bs: core: Remove true and false comparison
  v2 staging: rtl8723bs: core: Remove unnecessary parentheses
  v2 staging: rtl8723bs: core: Remove unnecessary space after a cast
  v2 staging: rtl8723bs: core: Remove unnecessary blank lines

Changes from v1:
  [PATCH 1/4]: Moved unnecessary parentheses change in PATCH 2/4
  [PATCH 2/4]: Added the extra parentheses change from PATCH 1/4 here.
  [PATCH 3/4]: No Changes
  [PATCH 4/4]: Fix whitespace error.



 drivers/staging/rtl8723bs/core/rtw_cmd.c | 94 +++++++++---------------
 1 file changed, 34 insertions(+), 60 deletions(-)

-- 
2.25.1


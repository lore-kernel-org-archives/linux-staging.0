Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9D01FAB
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 03:13:45 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id g24so8276168plq.3
        for <linux-staging@lists.linux.dev>; Sat, 05 Nov 2022 20:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GlryiTuhWGpYZ55w8aKcxwdOIFsmDboEh+8If5PMp54=;
        b=M+7//DBspHtFga2JTwlMmTCv7yBpINTaAknyJ3Z9YY0YnNCPRI2PYANVL0smCYFGfF
         4qCNQrXvsyBKQ5hqRLcJGzfiwffO3xmohgEvKhV0lwaHvcoYQx3/JzW2tlsnja+zLTxy
         uTe5hjQTBGcARsSknr+LAPt8UIfmY6Cg3v6nEEq0btSiW8rzBEb0GF/7CvpIoiIeSlqP
         CqUqf7sd7sSDJdxtznekAQoG8jIaE7qT5+SueLOGQMcV0Z9GUpK1nKiK2n2qyb3IikfG
         K2wZuIkURZ5SdkGtFfKcrFugArIJGKfusVMDv6RrYbFZ12Y4/+X3lgsA0l9GNmn0XXNA
         Fu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GlryiTuhWGpYZ55w8aKcxwdOIFsmDboEh+8If5PMp54=;
        b=TRfgP3FPuv6L4L5ZEhI0TFnBbYeFdujZNn7S7PT0EUUbKexaBSd19V9c4h6Qad1zdS
         bU29x9T2BgdUINYv2UCLd+zHzbqYxtZpkApjgGOv2J1p7xEHOudaF5OJYxkAQFcYa8Em
         A9LulX7384aJ1pXdL4ZM0juze7oV7rjqpQ1xEr1p6MjoW3Tl2hGOOJrlG/B/Ynvlipph
         XuTzvF+nqWlpf9rqAsaZgBoPCwDupKySvDyV7v7VFnO5Ms3DJbkg4thH1RamlWVH6+ke
         kvSst2zv7rXA6q0hJMhN2lt98Quj0i7vkB5T13DHckax8bwOElIBgz8qVC9gnl5w4eO2
         hDbw==
X-Gm-Message-State: ACrzQf2NYpsV51hlkPEcQGR1iiwNXv6zm4rXIVTC5SYnwnDLgm2FPTgM
	D0vAST2yXxnuwLS8892iCAQ=
X-Google-Smtp-Source: AMsMyM5XeDR3a8cToBiG0H/ubNRQvJErSnLzD/K/PNz7FLpBKxPhxGCgPn5Y6/IsuTNoOVdn07SXtA==
X-Received: by 2002:a17:90a:cb03:b0:214:219:b2b9 with SMTP id z3-20020a17090acb0300b002140219b2b9mr30506867pjt.191.1667704424857;
        Sat, 05 Nov 2022 20:13:44 -0700 (PDT)
Received: from jacob-Ubuntu (126.224.215.218.sta.wbroadband.net.au. [218.215.224.126])
        by smtp.gmail.com with ESMTPSA id h3-20020a63df43000000b0046fd180640asm1876817pgj.24.2022.11.05.20.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 20:13:44 -0700 (PDT)
From: Jacob Bai <jacob.bai.au@gmail.com>
To: joe@perches.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] staging: rtl8192e: trivial code cleanup patches 
Date: Sun,  6 Nov 2022 14:13:37 +1100
Message-Id: <cover.1667704057.git.jacob.bai.au@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename few variables and source files to make it align with other
rtlwifi drivers.
The patches are required to be applied in sequence.

Changes in v3:
	1.Patch 3: use ARRAY_SIZE() to replace macros, feedback from
joe@perches.com

Changes in v2:
	1. Patch 2: modify r8192E_firmware.c to include table.h instead of
r8192E_hwimg.h.

Jacob Bai (3):
  staging: rtl8192e: rename tables in r8192e_hwimg.c
  staging: rtl8192e: rename r8192E_hwimg.c/h to table.c/h
  staging: rtl8192e: replace macro defines with ARRAY_SIZE

 drivers/staging/rtl8192e/rtl8192e/Makefile    |  2 +-
 .../rtl8192e/rtl8192e/r8192E_firmware.c       |  2 +-
 .../staging/rtl8192e/rtl8192e/r8192E_hwimg.h  | 33 ------------
 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    | 54 +++++++++----------
 .../staging/rtl8192e/rtl8192e/r8192E_phy.h    | 20 -------
 .../rtl8192e/{r8192E_hwimg.c => table.c}      | 34 +++++++-----
 drivers/staging/rtl8192e/rtl8192e/table.h     | 33 ++++++++++++
 7 files changed, 84 insertions(+), 94 deletions(-)
 delete mode 100644 drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.h
 rename drivers/staging/rtl8192e/rtl8192e/{r8192E_hwimg.c => table.c} (91%)
 create mode 100644 drivers/staging/rtl8192e/rtl8192e/table.h

-- 
2.34.1


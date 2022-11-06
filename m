Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70F61867
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 08:31:22 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id f63so7948956pgc.2
        for <linux-staging@lists.linux.dev>; Sun, 06 Nov 2022 01:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QVmSnXt2cQp/FGtsTIfuWxTO1qzExefIA3nhCwOwGEM=;
        b=TO0EsbJtWRFqDgIWJq/In23egRIvivDjs3i7F5P2C3YDuEA3NEftvGxLYjNcNk2Kmy
         Re8NU/fyCfZ89E7yFVUuxbXm6/MNJWWHXzlXSTnUhLc43bMR6SGfGoQppKD3jGTysTbN
         z/MZqJevuVzCLTvHfFJdNPwIP76jL5iOQ+8Cx4QEBN2SnzATSaEQwoGcFMUMa1xOblF5
         mx3Xlj9rJfxmuV66loHKPTzVMXZAyPEVFEC8g+xaTFCfX3TS4PsH9NOMrPlxJgzWKHpV
         0yRYkIGCW9+LObbJCuEkXW1ln+zVj4ki3UZZLv1llAqdzqPTRsxjazu2nWU1FzeSM0fi
         QRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QVmSnXt2cQp/FGtsTIfuWxTO1qzExefIA3nhCwOwGEM=;
        b=SOKUoRUdQ/+ZE+IeCGx7qNU6IwcszT/BC/MjVWIP0LRNmbBZ2pfXW/cMhOKImPufvh
         t4qBFhpepQzGUQSnUOHPOEEztDeDQ4ePd9JxWZgCTQQadpmrO3vS1Oi8G+QLvhUDIPeW
         p+pGobMwhOvapUyDhhaJhGwzOPaQB5wsw4QeNfEuX0P4jA8HyRIXm80YoV4IJxL543aj
         t+awTR2jExs5AxC6rfTBxXnOq/hADeKOIBZwY7rp1utvvktggNgx+EX9sJwthnsgh7G5
         Qcsrml3+H/qcETn61XrWrlsE6hwwFHc8xysi4s18UZ5jUqYqw3stEpri1BA3R0G3DsN7
         mt4A==
X-Gm-Message-State: ACrzQf32a2FjSkOmhJoV0N0HqENLHNkWmeqeWRhQCiXsjS7vhuUS0Ts3
	377m4GAs3xgIhB0auxBXSGo=
X-Google-Smtp-Source: AMsMyM7xW3vyHDXGjWfbVETA+rdoG4p6NKnLwUfKFXjm/xk+clR4UzgxIlx7+oHsNdKKQsoOsGNrsA==
X-Received: by 2002:a63:215f:0:b0:46f:c464:a054 with SMTP id s31-20020a63215f000000b0046fc464a054mr29083875pgm.420.1667723482154;
        Sun, 06 Nov 2022 01:31:22 -0700 (PDT)
Received: from jacob-Ubuntu (126.224.215.218.sta.wbroadband.net.au. [218.215.224.126])
        by smtp.gmail.com with ESMTPSA id x10-20020a1709027c0a00b00186b8752a78sm2790487pll.80.2022.11.06.01.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 01:31:21 -0700 (PDT)
From: Jacob Bai <jacob.bai.au@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] staging: rtl8192e: trivial code cleanup patches 
Date: Sun,  6 Nov 2022 19:31:15 +1100
Message-Id: <cover.1667723306.git.jacob.bai.au@gmail.com>
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

Changes in v4:
	1. missing vision number in the v3

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


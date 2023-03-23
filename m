Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A2E3C04;
	Thu, 23 Mar 2023 19:20:08 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id b20so58228430edd.1;
        Thu, 23 Mar 2023 12:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679599206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JZr1Ijlukfl1tsPFSXdSVz01ek4cKP2HaY1FmMiyzFM=;
        b=Q2Yy1Px4+xgzAEvQtzE6shkKlwSbIo37r5g16hVfBntNEfdX3LA3fJ6Z4h22SQ+WnD
         7pbdreOgEg9xamVXjOKljOM95Azfgltdc8tH0HE51L4Uw2txVhZVa+TeldJhCVxTFubU
         mrlSMfp6ajGOY7fay7aGvnFnrtyYfLT6UW36nlwslr+b+SSQeVd5ADyI6/psa5PbWHeR
         9SHnkEppGWUQ6PiYo2OzQUvOiYpHw0wblkMYmOvcmqGR+jB6e2++RrpRZNpOcwbKLe4v
         Bk+rS21nTWuimy+Ng3KiGYY4Y8Jjpz8/SKbdxTcsZM6ClR50D8uERdXifnpT1eeiNutm
         clwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679599206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZr1Ijlukfl1tsPFSXdSVz01ek4cKP2HaY1FmMiyzFM=;
        b=auEbGcMsISfIUY2Yu/GpT82oLBJDF9zt44Ec3Mn2YKv4onLL6Q7ST5xIKagotB7IdX
         B/Nl8frnWlGF+pifKDKCIrZ1w5RxIcQPdeWPqs9kSd7IibcClXKMyYmwnVI0teJNtL+O
         SNkTpIVB05qfPI/wdF17x46DyBEbBtl3/Zq25SnVQxyRaTzIcCTE+H3am5mezzO0oZZj
         l1lT3gzVmLZNh3c/EEqwOF2mHMkiETxiXYwUad7ErLcDVjZJa2YkN82dPHFgUobu6Fnp
         AL4PQPhHw6Nx4x2bytsDMZh5llEWjKoLpDpA91eOGp7HzY0M8scJjBFyMEjXZj1zTgXe
         Q+/g==
X-Gm-Message-State: AAQBX9eu61lAJfaAK1T7a4oXyqkDKo6C4028Dy54ooq/JlpIDx2LKQRK
	0EkH79xyTAyWLpP+u6NWn2UaQ8BYOcCRsv0j
X-Google-Smtp-Source: AKy350bBHTF9pI533SDCueO0sqE8C7PMX/vfJVHZsPciPw1gYWrEYkv2l9xFhUXdCyFby7O4dkDCAA==
X-Received: by 2002:a17:907:8c0c:b0:92f:17d:4438 with SMTP id ta12-20020a1709078c0c00b0092f017d4438mr151802ejc.47.1679599206300;
        Thu, 23 Mar 2023 12:20:06 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id ia9-20020a170907a06900b00932b3e2c015sm8161409ejc.51.2023.03.23.12.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 12:20:05 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] staging: rtl8192e: code cleanup patches
Date: Fri, 24 Mar 2023 00:19:58 +0500
Message-Id: <cover.1679598576.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix several cleanup issues reported by checkpatch.pl in module
staging/rtl8192e in file rtllib_rx.c

Changes in v2:
 - Resent patchset with the correct email address

Khadija Kamran (4):
  staging: rtl8192e: remove extra blank lines
  staging: rtl8192e: add blank lines after declarations
  staging: rtl8192e: add spaces around binary operators
  staging: rtl8192e: remove blank lines after '{'

 drivers/staging/rtl8192e/rtllib_rx.c | 73 +++++++++++-----------------
 1 file changed, 29 insertions(+), 44 deletions(-)

-- 
2.34.1


Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520A872
	for <linux-staging@lists.linux.dev>; Tue,  4 May 2021 14:45:34 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a4so13582173ejk.1
        for <linux-staging@lists.linux.dev>; Tue, 04 May 2021 07:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MrNRRP5SJ6baqKnknhBwCQY1Z26L7q2lhMbIH9OHrkU=;
        b=iwMfWsESQAHEPLFYNV7ya22UK2nRMhI/L2LIJhVqE1Vu8cgg7M9nI4VzmTfUloSSIT
         B5JIp8Eq33vPY1z2+Ax6M3oK0iYibC9q2ge+5KpEc7u7DVKPSEc02KUbE/QWS9Xc3rMP
         7ghLp4Xt+BaA70PXu5tBuCmrdckCjXfxtGGtFzxP9kdV3+GeozZMFUyR/G8EOzGpUXuD
         NEN42ivq59XnIJ4cq2J9aya4YkunbAoLv5PKpgp625WBHgU7nTDRIKFaiOIz9cFAHyAW
         8YoBivl1Wdc5+fB+IuCUdL38nSqbU/w26wgZ0sf6JNyJKdmTzRTziChV8nXX6cNrxbBU
         Gc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MrNRRP5SJ6baqKnknhBwCQY1Z26L7q2lhMbIH9OHrkU=;
        b=bj7LylXePuz9Gb9hSvwgmwUDs+JswygKT4nZKM/Nm6+CunE62oHQPJa6ZozJD7Hr5O
         zzxAMs5IpuI3bWYrnrZkxWDTnquwsMjDTlFSO5he8K0f+kWigMwfiFR+MGpWOXePlnfC
         WeaiuFYwZ4UtCNe6w+FF/C5f0Me3Y0km89PfsgVLNbg8WEBLknbrORoxMT235um52sql
         rMmpRmpKwW8qgmd/1LK+ONNxq7rgTeFkeTnJNaMgPEjOyPWjiB0yq0G1gVzKpforUBBb
         mMChjyv0tl2Li8+AIqLFS/Ba8X1Z19nvZhs1d4BbCwLJ+252M77Lp1urrZsKsx0D+zrY
         jUwA==
X-Gm-Message-State: AOAM530SjRv+MLDuObl80wbNw1NGk0eb09bFnaBuNQ5rlZ4kmX0VDgWJ
	IBUlvQgYXisxV5Kjsn28BxM=
X-Google-Smtp-Source: ABdhPJw3mtfpiE5JPvkG9j5fK2Iy3mMEMe4PzbI0Q88UOzvFRKxZtDLeyZOGaAmhG1Em1f51H77yug==
X-Received: by 2002:a17:906:8693:: with SMTP id g19mr19100701ejx.270.1620139532930;
        Tue, 04 May 2021 07:45:32 -0700 (PDT)
Received: from agape ([5.171.72.210])
        by smtp.gmail.com with ESMTPSA id cf19sm1549686ejb.24.2021.05.04.07.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 07:45:32 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] staging: rtl8723bs: use in-kernel aes encryption
Date: Tue,  4 May 2021 16:45:28 +0200
Message-Id: <cover.1620139318.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset replaces the private AES routines used to
encrypt data with in-kernel ones.

--------------------------------------
Changes in v2:
	- Move aes.h include file in .c
	  file, where it is needed
 
Fabio Aiuto (3):
  staging: rtl8723bs: align argument position in a new line
  staging: rtl8723bs: use in-kernel aes encryption in OMAC1 routines
  staging: rtl8723bs: use in-kernel aes encryption

 drivers/staging/rtl8723bs/core/rtw_security.c | 328 +-----------------
 1 file changed, 15 insertions(+), 313 deletions(-)

-- 
2.20.1


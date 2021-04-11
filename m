Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C619670
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 12:57:46 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id ba6so11778654edb.1
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 05:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hQ3KhKNaIAv65viKNom5ztQKo1tKi9jzie9qsuyWYb8=;
        b=UKuQeDPkM/nzrybImZKMdqYUHtBhYlkZAuQC9Icqm3edP8axICFYup/p0eCwGAih1Z
         kgKqxSnlakZCxaUoagYWFzMYk8L848F/JK4XPH6loJWGIOekP21hZ9e2YFwH632VCcix
         dYZJmSHvs8fVE2MC4Zh019+ien2kPbxw9jJeo9veIjv7sCCKc8nks4/xK/6WVV/oJg9I
         qsfFeSbXjUOE+E2zD4mNU10Q5TMGVWI37FdFK+SUbvxxlVhXO2i4QRdnWrip5e1QHSEe
         uQ0HhA0Z+gO5D8Kz36VuheHUn9ht0fWjwAguAzDTZHMH/aqhFE6CQ1aVTg2H54kHicEK
         G97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hQ3KhKNaIAv65viKNom5ztQKo1tKi9jzie9qsuyWYb8=;
        b=hcn0fK9dFZkqY/AaL9uvxZj4G74adovfOS0y+LS8PmPHbZauHBx5U10dZ5Whegk6tj
         /gmZAhV1j6rE9Ow6kKRS7KCZ16zEsL5EACySuhxMRf8YeDvzruxu+cf6Rp3MvE0Zb3aF
         DveSnYgLZ4y6RbHdoxtYwGriCIHvqNdUrzuCmZ+R6N3dK50HCyCoTwMe5mDfuZXJCJC0
         lWnXX4DWbm6PY/sZh2K3DoKF/ZOVcG0ts8ZqpqXEhDeExn4sXM6MXp/ITUHiHKqc608F
         xjkie5p/5JVNtakwHPh9QoWEo7pLW8547nDepiSQJ8V5DfS1G5brCKjQxT+RHwuoLkf4
         xbKg==
X-Gm-Message-State: AOAM530nzAnTovusShwHq67VQwKkle2FVxOb7j6e1tqST9GJgk18/ss0
	RKOfYBebp9L7js/44v1q/bKFltCMbCQ=
X-Google-Smtp-Source: ABdhPJymfnWUqp7atG+xzSlCFf12VksRJBn5V/NQeqLTGrgW2XZDVaahFPO9kBu0uRdGCMdhgX9suQ==
X-Received: by 2002:a05:6402:84e:: with SMTP id b14mr25723849edz.194.1618145865398;
        Sun, 11 Apr 2021 05:57:45 -0700 (PDT)
Received: from agape ([5.171.72.218])
        by smtp.gmail.com with ESMTPSA id r17sm4708201edt.70.2021.04.11.05.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 05:57:44 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] staging: rtl8723bs: fix compiler 'W=1' warnings
Date: Sun, 11 Apr 2021 14:57:34 +0200
Message-Id: <cover.1618145345.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset fixes some compiler warnings related to unused variables:

1. Removes unused variable after applying of
https://lore.kernel.org/linux-staging/99b111d2bac822b9dc7ff6e1cfd3d3efc62ef836.1618064275.git.fabioaiuto83@gmail.com/

and the issue was reported by kernel test robot:
https://lore.kernel.org/linux-staging/202104110133.bI35NiNS-lkp@intel.com/

2. Fixes two long lines checkpatch issues
3. Removes unused variable

Fabio Aiuto (3):
  staging: rtl8723bs: remove unused variable ret in hal/sdio_halinit.c
  staging rtl8723bs: split long lines
  staging: rtl8723bs: remove unused variable 'start' in
    hal/sdio_halinit.c

 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

-- 
2.20.1


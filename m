Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19377F
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 01:11:50 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id p12so2645670plq.4
        for <linux-staging@lists.linux.dev>; Sat, 05 Nov 2022 18:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r9sXGVgxlgucjcB491+VVt6fi0bJrGLCKS3sBo3gKhU=;
        b=JykyOAMSIMcEcsBRsaS37YRp6g+2b5Vc7stDMREvIjXCs6QeCyd/HYGL9OXf7/mNvX
         THJ+4uu1JemfnvOUgXNrRDuks/CIBPV3M/jxG+zZaMOL82W6P/TV8rA2nFb99QgVzAfL
         3FZQvHm6uVM7VOqWKqbURNLr8ZjkoxpMKnmyTaHcYmiPboPHdRtpB+gYo/CxSP97ufQW
         0+cooDENmqsENiVQiiRb7NCJkBvplfotc89Onc4sqzO3CMcH754enPNDvVmFGQWCHcJs
         j+AYIDSgbXCO2duhwKLGPDccLZpjPUl3+MI2GFels6rulyu5ybK9qsW2tjc46NzKQKPt
         gQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r9sXGVgxlgucjcB491+VVt6fi0bJrGLCKS3sBo3gKhU=;
        b=HCKPO85oTauxP76zCpV8QXVIoSZFkNRId57HK2Qqq29WBHf9kf03v8kQnUZpnNHvox
         4e8MxF8pMPrdeL2jWyeCVCKxjxiDKjAlS1V4GMZ1KgNjit+j1YQY2TQo+0GzO2Cr54d+
         qmOsE0X3/Ui5lphwuXosJn2zHi65/63MYm07CiRMzj+1o7bNntIwcU2AcebJeAR1v+cj
         uKu38kX9XI8/sQBg4utXx9EhzJXZPbb/fgCAGFYazCT/3Xnk5MJocpnvkDgxK+mA5uPd
         IgAo3zvTwqdYuYke9sgSjETMOtOgQUbfryOE4lANCgIviaYjcqBxw7rWKXkCL0f3OoLx
         GdqQ==
X-Gm-Message-State: ACrzQf251JwpNDw14o5bYXHQ9QzA+rZnYpplACq2vjOVNXE5kMHy9uqC
	NQ9RAIud2gfDryhfI6lAj4k=
X-Google-Smtp-Source: AMsMyM7B34fDzvbojkDxXNhYI3UCM8uvz5tOnH3xmqPyoBcsVOtRs4pNsoLF4eT+lS/QjYQFucEcrA==
X-Received: by 2002:a17:90b:3013:b0:213:ab5f:d388 with SMTP id hg19-20020a17090b301300b00213ab5fd388mr42359103pjb.66.1667697110084;
        Sat, 05 Nov 2022 18:11:50 -0700 (PDT)
Received: from jacob-Ubuntu (126.224.215.218.sta.wbroadband.net.au. [218.215.224.126])
        by smtp.gmail.com with ESMTPSA id c18-20020a63ea12000000b00462255f5aeasm1812343pgi.40.2022.11.05.18.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 18:11:49 -0700 (PDT)
From: Jacob Bai <jacob.bai.au@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jacob Bai <jacob.bai.au@gmail.com>
Subject: [PATCH v2 0/3] staging: rtl8192e: trivial code cleanup patches
Date: Sun,  6 Nov 2022 12:11:42 +1100
Message-Id: <cover.1667694826.git.jacob.bai.au@gmail.com>
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

Changes in v2:
	1. Patch 2: modify r8192E_firmware.c to include table.h instead of
r8192E_hwimg.h.

Jacob Bai (3):
  staging: rtl8192e: rename tables in r8192e_hwimg.c
  staging: rtl8192e: rename r8192E_hwimg.c/h to table.c/h
  staging: rtl8192e: remove unnecesscary macro defines

 drivers/staging/rtl8192e/rtl8192e/Makefile    |  2 +-
 .../rtl8192e/rtl8192e/r8192E_firmware.c       |  2 +-
 .../staging/rtl8192e/rtl8192e/r8192E_hwimg.h  | 33 ------------
 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    | 54 +++++++++----------
 .../staging/rtl8192e/rtl8192e/r8192E_phy.h    | 20 -------
 .../rtl8192e/{r8192E_hwimg.c => table.c}      | 20 +++----
 drivers/staging/rtl8192e/rtl8192e/table.h     | 33 ++++++++++++
 7 files changed, 72 insertions(+), 92 deletions(-)
 delete mode 100644 drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.h
 rename drivers/staging/rtl8192e/rtl8192e/{r8192E_hwimg.c => table.c} (95%)
 create mode 100644 drivers/staging/rtl8192e/rtl8192e/table.h

-- 
2.34.1


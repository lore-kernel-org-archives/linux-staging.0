Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA851FA6
	for <linux-staging@lists.linux.dev>; Sat,  5 Nov 2022 10:00:34 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id v28so6515320pfi.12
        for <linux-staging@lists.linux.dev>; Sat, 05 Nov 2022 03:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=faUzu67FJ/vE0Y/rYOSRDt5IUPW4ac/77L2ocXglKpU=;
        b=KZq8Sm8m8yK1ql+Y5hJ2BKfRpsRlHaoBUEC+SgKNawxruW6mb/pl9IbWz/7g7hu9Up
         loIo37A0r89o/nhoBQiokpms/RqmKrJwkyfbQtYSwiQzCdgXv/xleENRvOQ6Pk8nYPZ3
         v2LvA7gDmssdtJDq+HrJL4PEHPI3tBZZbnh85zBPDKXNF3OukGjZrVBg9aHdIIqH0QTK
         pu3gLc3j3fjBaVV0ox5uO7ef9rnDQzCJtSpx5f5PEvk6ZFrdbi3L/4o0nAuGhwgNi/ho
         TZfKu1ydhyiHxtVSMS7SHKk9IsqVGWvzWPfc2NJlcUzAma7b5ZsbixC+YsJVoaJKqYCI
         00AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=faUzu67FJ/vE0Y/rYOSRDt5IUPW4ac/77L2ocXglKpU=;
        b=lwO7kGrms5HHV4lsi1BOkPSgI+9/I/EEDyk2CM2+Wx45RiM9bIb/u8DsJbTl/IkDtf
         oF2Qd8Azy0FFGDeZSdwbhzoMWW0VgN8u7PqkFB/D2EbvGmYVsYfMRirg1JV5dWzdOIkz
         sEUzxdaD4auCIGQ3avwBDGmapf6pQN5PT7m/WrfOOavBe211ZlMpOe/y/nALiROW5O26
         CVCEyS9ZOy5KdpbjOvVmzCvvcejaRVyKhbgJSf3Xu/2GLbm/GSyA5FFd2g/Z9YFX3Zg0
         OLCbu7j7Wzi4jgBfmIFPyEg1KgGhpV28xEO9NUKLo0tE2cao0cmuM/V3FNs6snTkmXh+
         fS4A==
X-Gm-Message-State: ACrzQf0KxfM5cGhdeptudYrgT08OCzEbN9pjnz8KwOLeTdzN4uJEIQfE
	a2ro8x0ic9oAuyjjeL1GPkB6kMUe6TQpZuwM
X-Google-Smtp-Source: AMsMyM6bVVN6ImWSLUkEsM2JZtUpJhPkVDzB7Byeon1ihmYzM92MCbVCnINN79j+3MURqKzDppjgcg==
X-Received: by 2002:a63:f903:0:b0:46f:1b5:b4fd with SMTP id h3-20020a63f903000000b0046f01b5b4fdmr33338089pgi.544.1667642433589;
        Sat, 05 Nov 2022 03:00:33 -0700 (PDT)
Received: from jacob-Ubuntu (126.224.215.218.sta.wbroadband.net.au. [218.215.224.126])
        by smtp.gmail.com with ESMTPSA id m28-20020a634c5c000000b00451f4071151sm958515pgl.65.2022.11.05.03.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 03:00:33 -0700 (PDT)
From: Jacob Bai <jacob.bai.au@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jacob Bai <jacob.bai.au@gmail.com>
Subject: [PATCH 0/3] staging: rtl8192e: trivial code cleanup patches
Date: Sat,  5 Nov 2022 21:00:27 +1100
Message-Id: <cover.1667641211.git.jacob.bai.au@gmail.com>
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
The patches are required to be applied in sequence

Jacob Bai (3):
  staging: rtl8192e: rename tables in r8192e_hwimg.c
  staging: rtl8192e: rename r8192E_hwimg.c/h to table.c/h
  staging: rtl8192e: remove unnecesscary macro define

 drivers/staging/rtl8192e/rtl8192e/Makefile    |  2 +-
 .../staging/rtl8192e/rtl8192e/r8192E_hwimg.h  | 33 ------------
 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    | 54 +++++++++----------
 .../staging/rtl8192e/rtl8192e/r8192E_phy.h    | 20 -------
 .../rtl8192e/{r8192E_hwimg.c => table.c}      | 20 +++----
 drivers/staging/rtl8192e/rtl8192e/table.h     | 33 ++++++++++++
 6 files changed, 71 insertions(+), 91 deletions(-)
 delete mode 100644 drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.h
 rename drivers/staging/rtl8192e/rtl8192e/{r8192E_hwimg.c => table.c} (95%)
 create mode 100644 drivers/staging/rtl8192e/rtl8192e/table.h

-- 
2.34.1


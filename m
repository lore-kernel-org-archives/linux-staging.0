Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0536C3FC3
	for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 20:50:46 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id t18so4435387wrb.0
        for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 13:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rccd+FaDPVuDVeT3ukG1P6kvqoGb4ZgC6X7OYACoy/s=;
        b=cER3bO29OcgSodf61vRqIvHUBKosrXwEHSCrlWi02cr3+6CKJxgyu85jqtaMe6W1ee
         /byGcMOhvnZQ3KdjahfAwtB+lttckYtDeKnipUZKsnX+I4Rcc/RryIF6hYvYpxAYDEEd
         NLmA2J85CD7qGJK765ZP0k6+xiH9rukkVMsT8qTFBoYAYasKcnk5GnljdaYe0wefsFaZ
         qPRdmHnlpZcIx9wGAKLi5GidA87wNRS2yTHb9zeoxBnYnB8fH7et3YcbICxgRK+JwI6y
         umTCDdhsy68K0mQ5VK4uH/5H57sXq2Gk5b+ei4G6eamtv6DuCIW2pZMp55IKeNKwOMvo
         09UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rccd+FaDPVuDVeT3ukG1P6kvqoGb4ZgC6X7OYACoy/s=;
        b=gzz5RKSFxnmVCI+gONQuUKo9UXJ8DCebgSfEEt2Kxv1QHr2hHxCgy+lgHW8ge6fXTs
         EL1ngPINCi+LoKhBVFrb5pInGp4SDEJtcuM6hwZvw1z31t4pp3uqo6eKH/K64Y3ABjH/
         Y1yBeiQBCr3u3zf5nmx2xedoifhqrmfBRRFj2Hk8vW4xrgle/uKU7buxzOMMMf3hqQJ6
         2zYkwnUOyIYMlqRv9OsGRT8Qdms/GcaV8Z44Zr1BfGVR35dYhhhIMTYYeNPRdDZ+O5RW
         E2BFUCkTXrlKXQ6RdRVRImwGJ5hijNtwaN+08ngUc9JroE8htQT/aRaBZ9q83LGwipTe
         xZBQ==
X-Gm-Message-State: AOAM5304aZWONI2EIISFJmCB/8xuX9gmXy2MOFu1e260bImYIpDkaK/I
	qNFw2wV+LzLbhWLBN4wxflI=
X-Google-Smtp-Source: ABdhPJzIzcb1KBsTMTxM9lVfQOfg2ZnjsBwcWGfoUEi5Ppy63exjH+qlsqqhScjjK1Zpke/3AHaUkA==
X-Received: by 2002:adf:e44f:: with SMTP id t15mr4031973wrm.394.1631307045259;
        Fri, 10 Sep 2021 13:50:45 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id g11sm5592427wrx.30.2021.09.10.13.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 13:50:44 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/7] remove pointers from struct hal_ops
Date: Fri, 10 Sep 2021 22:50:26 +0200
Message-Id: <20210910205033.3778-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes some more pointers from struct hal_ops and
removes the function rtl8188e_set_hal_ops() that is empty after
the removals.

Michael Straube (7):
  staging: r8188eu: remove mgnt_xmit from struct hal_ops
  staging: r8188eu: remove hal_xmit from struct hal_ops
  staging: r8188eu: remove read_bbreg from struct hal_ops
  staging: r8188eu: remove write_bbreg from struct hal_ops
  staging: r8188eu: remove read_rfreg from struct hal_ops
  staging: r8188eu: remove write_rfreg from struct hal_ops
  staging: r8188eu: remove rtl8188e_set_hal_ops()

 drivers/staging/r8188eu/core/rtw_debug.c      |  8 +--
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   |  8 +--
 drivers/staging/r8188eu/core/rtw_mp.c         | 10 ++--
 drivers/staging/r8188eu/core/rtw_xmit.c       |  9 ++--
 drivers/staging/r8188eu/hal/hal_intf.c        | 51 -------------------
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c    |  2 +-
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   |  7 ---
 drivers/staging/r8188eu/hal/usb_halinit.c     |  5 --
 drivers/staging/r8188eu/include/hal_intf.h    | 29 -----------
 .../staging/r8188eu/include/rtl8188e_hal.h    |  2 -
 drivers/staging/r8188eu/os_dep/ioctl_linux.c  | 24 ++++-----
 11 files changed, 31 insertions(+), 124 deletions(-)

-- 
2.33.0


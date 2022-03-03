Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B917E
	for <linux-staging@lists.linux.dev>; Thu,  3 Mar 2022 15:53:02 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id b5so1679972ilj.9
        for <linux-staging@lists.linux.dev>; Thu, 03 Mar 2022 07:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L6DnNvmYXESsi6H9sVmRWdYUNZpUkiKH4XY2aaJ2v7k=;
        b=eFdjzhSBjBqGbQVz8REEDf5wYsUbQQpEfqotJT4Svc1l5sFNthp49ywgecvpI7GiL0
         Y/fMI6O2Hi8pRjSnJD0TbzRtSangyvBm5ol+ZR8nr7zEJYFq3HrxVo6TbE1oXyU1RfWB
         Y4JUX5tVy0cKnzjT0FdHIOh53ejLog1y4fiZYjUuOtcLElGG+MYs7sjRfJ2bz1JY1SJa
         3ROG+7oei6j17b26oAor5ObZHr69hCYuwjeRDM+1C5v98jZRnN+9OxyJ34+wT7Ra0ESr
         1T+tCtbcGRloVm4hDA4u1PIMkENEWKznmO9fGl10tJ+ATC0QceVSHmu34bgQkE25YVMh
         XHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L6DnNvmYXESsi6H9sVmRWdYUNZpUkiKH4XY2aaJ2v7k=;
        b=hyuWrw44744vriuBcLPDs3SUF1x3rjnX4icJ38++OKeqTc2qyd/ziWGLgc5cOGNSTC
         l8oVurleRb8gioICPP8AhP195hutvy9XtbbyHXQ4LcxeOPpwqAJdcFDrYtHotl3WnOhy
         3JCBf1T/6/m04lgJzSQ3jmiWY0VUQIYLKBzkHmPBVGx2Q9d41gH6mndjC9Asclbf9OIm
         uFjfPTcETkW1RHgqr5m2TrJHUcIDjg4HKHgbzXTp6G4EoEuxHu7YqZA6048ZU3n5I1Su
         JVtN6XWhdqO+u4EKgmlHXQTf2e98Gmm8xd+Sxlu/3pThE30+STZfN9WDv+4ZjKBFe6Mh
         FpEA==
X-Gm-Message-State: AOAM530uSfsTk9s/3v1BzI+p0j0N2CV4ynVEWz+dq6ZnmN0T33MJNaXG
	G3IBhC9ZUkApkeKnF6nUBk6ccblx1HI=
X-Google-Smtp-Source: ABdhPJyqUeYDkSeRzxoBSQL92b89Gu1qPXC2ESMANoM1lLusFXD1c8ae76BujXWrVrMPFa+DQJK51w==
X-Received: by 2002:a05:6e02:178b:b0:2c4:d0a9:8399 with SMTP id y11-20020a056e02178b00b002c4d0a98399mr9956736ilu.144.1646322782035;
        Thu, 03 Mar 2022 07:53:02 -0800 (PST)
Received: from localhost.localdomain ([122.164.186.156])
        by smtp.googlemail.com with ESMTPSA id a6-20020a92d346000000b002c1a6040691sm2506599ilh.70.2022.03.03.07.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 07:53:01 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	paskripkin@gmail.com,
	martin@kaiser.cx,
	abdun.nihaal@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] staging: r8188eu: clean up struct recv_buf
Date: Thu,  3 Mar 2022 21:21:02 +0530
Message-Id: <cover.1646321515.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes set but unused fields from struct recv_buf.

Abdun Nihaal (9):
  staging: r8188eu: remove unused field list
  staging: r8188eu: remove unused field recvbuf_lock
  staging: r8188eu: remove unused fields in struct recv_buf
  staging: r8188eu: remove unused field phead
  staging: r8188eu: remove unused field ptail
  staging: r8188eu: remove unused field pend
  staging: r8188eu: remove unused field pdata
  staging: r8188eu: remove unneeded field pbuf
  staging: r8188eu: remove unused fields in struct recv_buf

 drivers/staging/r8188eu/hal/rtl8188eu_recv.c  | 20 -------------------
 drivers/staging/r8188eu/hal/usb_ops_linux.c   | 17 +---------------
 .../staging/r8188eu/include/rtl8188e_recv.h   |  1 -
 drivers/staging/r8188eu/include/rtw_recv.h    | 14 -------------
 drivers/staging/r8188eu/os_dep/recv_linux.c   |  9 ---------
 5 files changed, 1 insertion(+), 60 deletions(-)

-- 
2.35.1


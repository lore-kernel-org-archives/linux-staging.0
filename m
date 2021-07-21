Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1E172
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 19:34:32 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id gb6so4922590ejc.5
        for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 12:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xZ0ej/xlqgZRChvPE6flzxwaHipob78lAAQBtqKCFyk=;
        b=iGTLXypEwA0xgrrWmhC0QTc5++cVg7UBLLk18t7uJqEVSAWTDZk2sJtvMRo9LNzULz
         /CbbTRChxHkQOZfZFDRegnuAlTu7lCXhxvgQ2Y9OKYOMUCV0odQJQCZ+YjHis59np+qR
         goC79xS7n6BEIgLEBYtaA/Xc7Gmt4QjIjTa+0sTGr2jwSKdyMfoxs0/nTzlP7MYkLKHe
         MeZFkyzo63c/NTG47+alUDS+xKtdeacMskKamRsvY7Bpthpa55GkMhLYAvRryrOOeNH7
         /fa+tiw1iXVGnXHI8ogVsuppOhmHLmU5n9adm/Mt0P7Bwn9rUJgvT/9ZkTbHPpO2mmjL
         i93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xZ0ej/xlqgZRChvPE6flzxwaHipob78lAAQBtqKCFyk=;
        b=hdngRJ5DU9rNz30XLGbaH91t8qAuSrXzAHXi149ENw3rNKcRJZ1cTv0MvY0nxB4zq6
         Xy2GzZFJgrhgc8ECtFe7VCQgBBu2YzGr/9FNHO/lpCZlSH3lZqR9xGZEOYuOME0bUu+x
         a5WL1qfwzTJgjdb8jZ60ISKz5XvgSxwnXMzhbzdMppy/z7nVmTeKEc82xF/lod+GOctd
         JsrUU8fxnD9J7Kudm7VjSO6GTGnLZw0BVv4zS38k+BDsHLh7fR3skWEjef5YEa0VbSuj
         j7nUSyOq/TkcOC1NnJRJ+TxeDpfE4+m1GvZJf+NLcAT8tYlvs2mhOFbbXDYKs6F5+WGU
         vDnQ==
X-Gm-Message-State: AOAM530H0+mk+4Wsw9knYMZHFvtiFto2oyj7CZ7PGzpDbEaha/hdiQ+r
	zQkPTZPxT4MI3u0ZqQlIE6s=
X-Google-Smtp-Source: ABdhPJwOIBT3zOReL4o/86VvY8k3AZk1n6Bh6FKOn0tIYsBbMdHqNPYi329AFtZcpmALpY60Rbleog==
X-Received: by 2002:a17:907:961b:: with SMTP id gb27mr3488399ejc.340.1626896070700;
        Wed, 21 Jul 2021 12:34:30 -0700 (PDT)
Received: from localhost.localdomain ([176.30.239.20])
        by smtp.gmail.com with ESMTPSA id e22sm11359084edu.35.2021.07.21.12.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 12:34:30 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org,
	zhansayabagdaulet@gmail.com,
	straube.linux@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH 0/2] staging: rtl8712: fix error handling
Date: Wed, 21 Jul 2021 22:34:20 +0300
Message-Id: <cover.1626895918.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, rtl8712 developers and stanging maintainers!

In this patch series I rewrote error handling approach in rtl8712 driver.
Detailed description can be found in commit messages. In short:

There was strage approach to handle fw load error. For some reason fw callback
was doing clean up stuff which can lead to UAF bug. For example:


CPU0                                        CPU1
r871xu_dev_remove()
                                          rtl871x_load_fw_cb()
                                          free_netdev(netdev)

wait_for_completion(netdev_priv->compl) <- UAF, slab-out-of-bound or smth else

I've added free_netdev() call in my previous patch to this driver:
e02a3b945816 ("staging: rtl8712: fix memory leak in rtl871x_load_fw_cb") to avoid
memory leak and I believed, that this approach won't trigger anything else, but,
unfortunately, I was wrong. Syzbot found 2 bugs [1] [2] and I decided to complely
rewrite error handling in case of fw load failure. This patch series was tested
with both reproducers and did't trigger any bugs.

[1] https://syzkaller.appspot.com/bug?id=7646834b55c71c45ed85f601032daa6c23db0513
[2] https://syzkaller.appspot.com/bug?id=89c3ddb9936d3552995130298f1d2633ab9d3541


With regards,
Pavel Skripkin

Pavel Skripkin (2):
  staging: rtl8712: get rid of flush_scheduled_work
  staging: rtl8712: error handling refactoring

 drivers/staging/rtl8712/hal_init.c        | 30 ++++++++-----
 drivers/staging/rtl8712/rtl8712_led.c     |  8 ++++
 drivers/staging/rtl8712/rtl871x_led.h     |  1 +
 drivers/staging/rtl8712/rtl871x_pwrctrl.c |  8 ++++
 drivers/staging/rtl8712/rtl871x_pwrctrl.h |  1 +
 drivers/staging/rtl8712/usb_intf.c        | 51 ++++++++++-------------
 6 files changed, 61 insertions(+), 38 deletions(-)

-- 
2.32.0


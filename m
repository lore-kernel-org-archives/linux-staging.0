Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97FC6D18
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 08:45:24 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id f16so15559038ljm.1
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 01:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=YLqQGd/T46D5zGOlykZcGAUvnOsHHqPoJRmoNN6xMvY=;
        b=ulSxid11kzmFSepZFCYx9snxXUw8kuxz7TyIiG3q/zhkOYukdIEERyp7D0yTCdby3O
         P9Wif3THUTcJJyYyG3Vc47vwYOUBD4nfce540PDzkY3pxGvi4pQ3SV2uvEGPUyygip9D
         5xTmjV+s8dx7zNZ7aMy8VmvL1WuY7+/bsFj7ZeH7lp1H1cfjZfZ2njkpHz750Jzs8zHc
         5uVMeQg9Khmx6C4gEHDCF8PAVCU5TISoErOe+ZvTLg7DOShkKjdeZZ9TxgpcZB9KNcBq
         8E78duyPdw5l6qyVqE6pPB+sxrd8RjAbQGHJbKPT5r+xmZBSMEmE38SgB11aQmwtyGbw
         zayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=YLqQGd/T46D5zGOlykZcGAUvnOsHHqPoJRmoNN6xMvY=;
        b=HJH/DB899yuxVrlTJdpST+GJG3FY/8ylOwIaV4z8PyBzfeyrAeXFp0VsE/f8x7HV17
         2smsr8SvNlAbJxOzwVQcw7Dah/H+E7w8PRa0NXjBPZO7Wf1hzmFEc+n+uUzGl041KoHa
         8cboBvBqvLxA3LB4inIjhPCShIRx/vHsbldSgRjItMSvhBUHzz3J6EAK+JYRu8Wjtvjg
         4lZ9vhg0qXgHcEGhJYxmA3DA/OmFh76oiY6TG+sOP9wMtYrUCwYPQJmnygLOAOn/mTjB
         YNRH1AGqfKgX04NBVvCaMKA9I61DRGm+xDZzQHhEUxKjfxsKmnrkreEgj+qkJm8GLf6/
         xotw==
X-Gm-Message-State: AOAM530dfWHKp2OluL9e4lQMfJt6IMJKpov8XjNHAHn3RRoDy9j/BQQc
	vrZE38ZpQY8fDOi38mfWghs=
X-Google-Smtp-Source: ABdhPJxKp6VmTi/7ptEmpnj7Xjt67ejAcc7ZV7+cZb7sszoycP5DJgP3JuQmCqDyMlCEK+CQ1sR0zg==
X-Received: by 2002:a2e:9f08:: with SMTP id u8mr19268358ljk.50.1617698723125;
        Tue, 06 Apr 2021 01:45:23 -0700 (PDT)
Received: from zhans ([37.151.32.231])
        by smtp.gmail.com with ESMTPSA id n7sm2077713lft.65.2021.04.06.01.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 01:45:22 -0700 (PDT)
Date: Tue, 6 Apr 2021 14:45:21 +0600
From: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: [PATCH 0/4] staging: rtl8712: clean up coding style issues
Message-ID: <cover.1617697237.git.zhansayabagdaulet@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

To fix style issues, this patchset removes blank lines, adds and removes
spaces, and matches paretheses alignment.

Zhansaya Bagdauletkyzy (4):
  staging: rtl8712: add spaces around operators
  staging: rtl8712: match parentheses alignment
  staging: rtl8712: remove extra blank lines
  staging: rtl8712: remove spaces after a cast

 drivers/staging/rtl8712/rtl871x_ioctl_linux.c |  6 ++---
 drivers/staging/rtl8712/rtl871x_recv.c        | 22 +++++++++----------
 drivers/staging/rtl8712/rtl871x_security.c    | 10 ++++-----
 drivers/staging/rtl8712/rtl871x_security.h    |  4 ++--
 drivers/staging/rtl8712/rtl871x_xmit.h        | 12 +++++-----
 drivers/staging/rtl8712/wifi.h                |  2 +-
 drivers/staging/rtl8712/xmit_osdep.h          |  8 +++----
 7 files changed, 31 insertions(+), 33 deletions(-)

-- 
2.25.1


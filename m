Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C5E1FB1
	for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 03:34:02 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id q7-20020a17090a7a8700b001f300db8677so6880032pjf.5
        for <linux-staging@lists.linux.dev>; Fri, 29 Jul 2022 20:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=2Kumxoqs7AvCSJdhNcNxhF7BApmJfZRgV7qFRKrYcUE=;
        b=hmXTRIA69MzhV74YEMUufK9wSgn3Edu17dSLeKTg60rUDBDPGw6WDGkCvrU6HA3Phg
         gwajv/4uoyfPPZBsuwBW65VfdQyl9GAzy4Tanf/VmpXhMkcbpOz1Dfdhosx2FhSvPHBt
         gjfdZ4ocXiyrsJIdgZ+uETLcucHUV7+GRTQXidxxFQQ79VI9yrBhwe4K3ZOwidKYppjH
         leYx+zMrJsnt5F47O9SAoWd6XDgVsUkOUzUvsH2FK+9rvv9GdDeeDX9AZ9LKOQwWqSNV
         knB/4dzKRtJyeJe4pqfwjy8gY/j/OqJwdgS8mtwuuKny/xLLw7IBz2UPOH76pC3rHuZk
         mtlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=2Kumxoqs7AvCSJdhNcNxhF7BApmJfZRgV7qFRKrYcUE=;
        b=RcV9/osHZkD1yqx9wbzx6zTgSEXlIY4uATGWcBOWcO/ajlI05imQ1H0mWZKZFBXpCE
         EqiMl6UIqf6DcoocEtJpKWSk00epZtK8dknkfehfqk5pN4Dpe/UFz8AqR6/Q3i5fsov1
         uQfO1Li53+2/SnouoHrMybv0HdIpuW+8qy6ZN7aQ86/bET5MUn3/Gagd7jgHI787iyc8
         FDpYAe3S41ULXuFLpUVjQh7kL1LJQq0oDfUhtVMHDb3ivmaf+N5+Rz1taQVKVAg3DJQj
         owzq4iyeBDeMLf3DMDXohAqCKYcHDEkNzG6nOqaIlOBMmZfcjvnXI8n4iIoANJP46zIV
         A4rA==
X-Gm-Message-State: ACgBeo14WwNNdIgflO3+HszhZkV4AePXl7+aTL4/eushSwOF0trno2Ui
	BaosgR/cU8Lu4MC+79xJJ5c=
X-Google-Smtp-Source: AA6agR6wabXPHPGmRpggvNsopcw/KJSlTV4qOHdg3UtL38sXWVKODrDtwk6vWpe4OJxwQo4NQelRTA==
X-Received: by 2002:a17:90b:4b4f:b0:1f3:19ed:37b5 with SMTP id mi15-20020a17090b4b4f00b001f319ed37b5mr7913275pjb.108.1659152042180;
        Fri, 29 Jul 2022 20:34:02 -0700 (PDT)
Received: from tong-desktop.local ([2600:1700:3ec7:421f:f0d:9a23:40c8:9423])
        by smtp.googlemail.com with ESMTPSA id h3-20020a170902f54300b0016a3248376esm4441555plf.181.2022.07.29.20.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 20:34:01 -0700 (PDT)
From: Tong Zhang <ztong0001@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tong Zhang <ztong0001@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Colin Ian King <colin.king@intel.com>,
	Saurav Girepunje <saurav.girepunje@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Zheyu Ma <zheyuma97@gmail.com>
Subject: [PATCH v4 0/4] staging: rtl8192u: fix rmmod warn when device is renamed
Date: Fri, 29 Jul 2022 20:33:20 -0700
Message-Id: <20220730033335.74153-1-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YuOLybUZ8cBWntY/@kroah.com>
References: <YuOLybUZ8cBWntY/@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are 4 debug files created under /proc/net/[Devname] by
rtl8192u_usb. Devname could be wlan0 initially, however it could be
renamed later to e.g. enx00e04c000002. This will cause problem during
debug file teardown since it uses netdev->name which is no longer wlan0.
To solve this problem, add a notifier to handle device renaming.

Also, due to this is purely for debuging as files are created read only,
move this to debugfs like other NIC drivers do instead of using procfs.

The directory structure after this patch set will be like the following

  /sys/kernel/debug/r8192u_usb/wlan0/stats-rx
  /sys/kernel/debug/r8192u_usb/wlan0/stats-rx
  /sys/kernel/debug/r8192u_usb/wlan0/stats-ap
  /sys/kernel/debug/r8192u_usb/wlan0/registers

Also note that we cannot simply do debugfs_lookup to find out old dentry
since by the time the notifier is called, netdev->name is already changed
to new name. So here we still save the original dentry.


Reported-by: Zheyu Ma <zheyuma97@gmail.com>
Tested-by: Zheyu Ma <zheyuma97@gmail.com>
Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Tong Zhang <ztong0001@gmail.com>

v2: break down patch and fix pointer check
v3: removed unnecessary checks, casts and move debug files under module's
own directory, only minor change compared to v2
v4: move cast fix to one commit. use KBUILD_MODNAME for debugfs dir name

Tong Zhang (4):
  staging: rtl8192u: move debug stuff to its own file
  staging: rtl8192u: remove unnecessary cast
  staging: rtl8192u: move debug files to debugfs
  staging: rtl8192u: fix rmmod warn when device is renamed

 drivers/staging/rtl8192u/Makefile         |   1 +
 drivers/staging/rtl8192u/r8192U.h         |   9 +
 drivers/staging/rtl8192u/r8192U_core.c    | 226 ++++------------------
 drivers/staging/rtl8192u/r8192U_debugfs.c | 188 ++++++++++++++++++
 4 files changed, 241 insertions(+), 183 deletions(-)
 create mode 100644 drivers/staging/rtl8192u/r8192U_debugfs.c

-- 
2.25.1


Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4217A
	for <linux-staging@lists.linux.dev>; Fri, 29 Jul 2022 03:52:42 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id 72so3108779pge.0
        for <linux-staging@lists.linux.dev>; Thu, 28 Jul 2022 20:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VqJty/jAzkS9ddhZQ1LDWqDzmo4hUT9KrNKCMusTL4A=;
        b=FlPfntePR/J/cEvMPOmNckBJmON2t0BOxiMCZwbuKxVMJVJ3RL9U0W+4++BtQa0ZaI
         3+OJoGYekSFqxNRUOyokFw4gHIrslHTMLcNnUffuKSWwwGhcB4t31Un5lj0ibI/4S6gF
         m0fdAPM4OlSHLsKBbcCh1Yp21moOKqU4FIVJapUqSca0nlEgdvtBZGoy/gjMRMtJ3JFX
         0zJ4F1mU8PIDkCONY9XMxkuKo36NE4ntbSwaWgCBgxrCh5CNFkjQwDmhfg0ZNiPC2bDK
         7gkM4XSuUptSl/i8Px/id6GOslM4VcO4Qz04h2j+c/s4ejnETiyk4VLV9Iq51ywnOx1Z
         aO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VqJty/jAzkS9ddhZQ1LDWqDzmo4hUT9KrNKCMusTL4A=;
        b=NLgTlM6ybEUGhC0ezU/8alsz1OG5qEWBhjxkMVNV2fMFd1K7rZgGJvW7YpXIHtE/Qv
         7qpu9T0SGt/U5eoUVW8NMkASZyINHfXFxaCvtksVONsBJhxmDj1TNzUOiuPNYgIbzu29
         3ealKbNj0XzzjmrSJLpTIS+V/SCEZJfWRoctl3oyug76R2wTMB8sPqNjJlEFrd0NbXfl
         1n7QDUIqJGPGqWMb0fjrdYKPs+0iDbAAELzRnhQxvCxldFyqDIliCnLTbsjVt+D8gw3j
         8sdBiLkxL9qOtSRJ9b1efCohSV9eBb3lh9BDMSYVJrgJgZqLUaGU7HBxmMo0gO9USCsf
         nbqg==
X-Gm-Message-State: AJIora80HyrV5rQ/9rs59xF38PTevGwBcSIr8m/SLW4QxHwWK5UVhMV0
	aro9JZaZHpagjzXPLYvHUFM=
X-Google-Smtp-Source: AGRyM1sIJs3Dnljo1GEigT/XZ3kQLINUljpQF9FQob2GwqnjrXIMkOa8h/tRyK4fRHE6hRi8QVGmkA==
X-Received: by 2002:a63:d64e:0:b0:41a:b83d:1b2a with SMTP id d14-20020a63d64e000000b0041ab83d1b2amr1429057pgj.122.1659066761783;
        Thu, 28 Jul 2022 20:52:41 -0700 (PDT)
Received: from tong-desktop.local ([2600:1700:3ec7:421f:a06b:5560:ec65:277f])
        by smtp.googlemail.com with ESMTPSA id h14-20020a170902680e00b0016d2d2c7df1sm2135478plk.188.2022.07.28.20.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 20:52:41 -0700 (PDT)
From: Tong Zhang <ztong0001@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Tong Zhang <ztong0001@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Colin Ian King <colin.king@intel.com>,
	Saurav Girepunje <saurav.girepunje@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Zheyu Ma <zheyuma97@gmail.com>
Subject: [PATCH v3 0/3] staging: rtl8192u: fix rmmod warn when device is renamed
Date: Thu, 28 Jul 2022 20:52:17 -0700
Message-Id: <20220729035230.226172-1-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YuDdHMaB6jWARQzA@kroah.com>
References: <YuDdHMaB6jWARQzA@kroah.com>
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

Tong Zhang (3):
  staging: rtl8192u: move debug stuff to its own file
  staging: rtl8192u: move debug files to debugfs
  staging: rtl8192u: fix rmmod warn when device is renamed

 drivers/staging/rtl8192u/Makefile         |   1 +
 drivers/staging/rtl8192u/r8192U.h         |   9 +
 drivers/staging/rtl8192u/r8192U_core.c    | 226 ++++------------------
 drivers/staging/rtl8192u/r8192U_debugfs.c | 189 ++++++++++++++++++
 4 files changed, 242 insertions(+), 183 deletions(-)
 create mode 100644 drivers/staging/rtl8192u/r8192U_debugfs.c

-- 
2.25.1


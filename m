Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB3DEA9
	for <linux-staging@lists.linux.dev>; Mon, 16 May 2022 09:21:54 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id t11-20020a17090a6a0b00b001df6f318a8bso681626pjj.4
        for <linux-staging@lists.linux.dev>; Mon, 16 May 2022 02:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=ZE2sTJsadm9K7ftIu5rqHwlhK0KVCsbqfIVmJX6zs2s=;
        b=Lqcn2ru4ZoTSodzxiYNqnxDMBm14zt0c7pBGCyFRCoe5SB3C7fDbfb7QQ0/ibvr4yn
         x57tFsELEjoV9Qe0AHrIHukOzZXVfniHK+KfImP4SCR27+cO+AkE9RUjFfa76Tw0q96e
         jE8bohbrKfFUwwU304XtcLkizPgRojEm6D0toXn6kzIjfSFeWvDf+4OiF+MIR8A5LxJJ
         O8AHW2+gpL5Gh3ZSU3qToxyZMSHSfnYp+2bQx52DSdKbRqZsyKXILZuaox3rQWPfVtdi
         DUdcCquaWQl6lMqy4WfdrcSnMT2zmX5Tv4V4gjbVDjrYzZz0envdUpHzTFgq4D/sWB2d
         Si4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=ZE2sTJsadm9K7ftIu5rqHwlhK0KVCsbqfIVmJX6zs2s=;
        b=Q7hbo2hXyanMsh01tVgZX/G5oFqEmKRFPTlq9EfMiMdpT2ZJN8YaFUf1gXJeuBJMyz
         sMianuiLYPOOFiNsRDozmBZ5TE3vZiDQaFOgg+5ne6ZovBDJAnpY4QpVb4MiBzTGBOfb
         e0gkJv9OYB8S3wUAxSSx8bG5sBjo4scfDA8xPYbgBikb2CpMV8GnkEo1vW9HEoAP1IMt
         qeNCQAc80uoy85xtEcDF3x6eERmw+SRriFydoFbBYXT1WjGsb6SOB1pAcZLh34c9dpbr
         e1Yd4kQ74wn9c24Pv2lOB9pP051v23uodGBcAfo7t1c3JJFtriOpgL1fnpDluZ3yKDLp
         +l9A==
X-Gm-Message-State: AOAM533lSCf4E57Nogih3t5VP1DvSncPaTG8VRoNw4qi2S/F1Z201FfY
	0sLVuqDhEpPbgvb25S0Cl3c=
X-Google-Smtp-Source: ABdhPJwZoLGjqEmKbmu0QtHDuubjGU2+b4Bxbj3i7J09IyHcUz3VD2136iyJyyMD5uSscATGFeoS5g==
X-Received: by 2002:a17:903:244d:b0:15e:a3a2:5a75 with SMTP id l13-20020a170903244d00b0015ea3a25a75mr17016080pls.89.1652692914115;
        Mon, 16 May 2022 02:21:54 -0700 (PDT)
Received: from localhost ([152.70.90.187])
        by smtp.gmail.com with ESMTPSA id ku11-20020a17090b218b00b001dedb8bbe66sm6029521pjb.33.2022.05.16.02.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 02:21:53 -0700 (PDT)
Date: Mon, 16 May 2022 17:21:50 +0800
From: Wang Cheng <wanngchenng@gmail.com>
To: dan.carpenter@oracle.com, paskripkin@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] staging: rtl8712: fix KMSAN: uninit-value in
 r871xu_drv_init
Message-ID: <cover.1652618244.git.wanngchenng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Changelog v3->v4:
- Update commit messages.

v3: https://lore.kernel.org/all/cover.1651833575.git.wanngchenng@gmail.com/

Wang Cheng (3):
  staging: rtl8712: add error handler in r8712_usbctrl_vendorreq()
  staging: rtl8712: fix uninit-value in usb_read8() and friends
  staging: rtl8712: fix uninit-value in r871xu_drv_init()

 drivers/staging/rtl8712/usb_intf.c      |  6 +++---
 drivers/staging/rtl8712/usb_ops.c       | 27 ++++++++++++++++---------
 drivers/staging/rtl8712/usb_ops_linux.c | 21 ++++++++++++-------
 3 files changed, 35 insertions(+), 19 deletions(-)

-- 
2.33.1


Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B870872
	for <linux-staging@lists.linux.dev>; Sun, 20 Jun 2021 12:55:32 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id h26so465567pfo.5
        for <linux-staging@lists.linux.dev>; Sun, 20 Jun 2021 05:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=AzHdr+g+G22xu4FNJrVzx2j7Uqnqz1oYOgjwhfGEpVc=;
        b=GSEo9kiYAjZ0DoIASDYM5DduxeLzQ7xhNPHyhTDd58rRAgP3Gm1y6d1kCpj2LgqKPd
         mH04cCig1/nQIFhhq7gvIh3SF4WIZt68ht2g/4Kx9La+rsDgKfygM/9dLGYf8pc2Cg/W
         tDNLZxvKfXdQV2GjDyxHbx6kCC4fqU3nqUJkes4dcGJGAgk1WZAvM41vNiqT9y6YG5D0
         CbpJG2URVtM2ddDzB1r14h7kul9sWBgvcBw3eYsM2YhgQzb0Rs5yEgxWClv2lFlEa3eE
         yQrzWkN2ffBj9lcSW+lt8E9VtDQ+OkY/rzTP6A4WlKVanpWU0zb+AnXn5cJNqc4Eo7t5
         lEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=AzHdr+g+G22xu4FNJrVzx2j7Uqnqz1oYOgjwhfGEpVc=;
        b=oAnDy0o5fgwolBKq7A0HoimqunQ335hw+eWpieuNjZj8kOJP3zGHmC/RKblz+++b2E
         dtaM81d03py8vX1nV/+H4fk2WMLECabnic1qKasvC+EOTT0uCkCu+D7KUVW2IuOmjPIa
         P7SnaCF7G5+PNzg5I/yDoFH5klDu4KSHTNmRnOALyncZ4IvfBfBknxv6O6QwUVofGO4i
         c8bJelitp9HG0o4ZKxXhRcxQ71jeQdMLxnhzzA7sggReT/7Qm6SUaF80FWY7O/ADidg+
         cV7fV01i3N7tFOMFI0hEjSJQqoFNt8zEG6T5Tq0V1pLSI0WdoZkyomDo35dFiu0cgkMD
         PQ6w==
X-Gm-Message-State: AOAM532HX+R58pbu62aZFf5DDgcFSFgwFXfIn64WGA1uoNjR+AwA0uzo
	j2FaCqInvAeNObHrYTTKC3M=
X-Google-Smtp-Source: ABdhPJz0yGZcE350ggdOjb8BgBgzAdPPy2rauXtVT2nC3MBXFzT2Oqk1NHY/wbfhTKP2ECRjsTUwvw==
X-Received: by 2002:a05:6a00:26c6:b029:2f5:358c:6761 with SMTP id p6-20020a056a0026c6b02902f5358c6761mr14702668pfw.50.1624193732238;
        Sun, 20 Jun 2021 05:55:32 -0700 (PDT)
Received: from ojas ([122.177.154.120])
        by smtp.gmail.com with ESMTPSA id em22sm17292998pjb.27.2021.06.20.05.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jun 2021 05:55:31 -0700 (PDT)
Date: Sun, 20 Jun 2021 18:25:21 +0530
From: Ojaswin Mujoo <ojaswin98@gmail.com>
To: nsaenz@kernel.org
Cc: gregkh@linuxfoundation.org, stefan.wahren@i2se.com, arnd@arndb.de,
	dan.carpenter@oracle.com, phil@raspberrypi.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] vchiq: Patch to separate platform and cdev code
Message-ID: <cover.1624185152.git.ojaswin98@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

This patchset adderesses the TODO item number 10 specified at:

    drivers/staging/vc04-services/interface/TODO

For reference, the task is:

    10) Reorganize file structure: Move char driver to it's own file and join
    both platform files

    The cdev is defined alongside with the platform code in vchiq_arm.c. It
    would be nice to completely decouple it from the actual core code. For
    instance to be able to use bcm2835-audio without having /dev/vchiq created.
    One could argue it's better for security reasons or general cleanliness. It
    could even be interesting to create two different kernel modules, something
    the likes of vchiq-core.ko and vchiq-dev.ko. This would also ease the
    upstreaming process.

As Stefan suggested in the last revision, I have split the commits into
more finer parts for ease of readability and maintainability. I have
also added 2 more patches to define a KConfig entry for vchiq cdev, and
to merge the code in vchiq_2835_arm.c to vchiq_arm.c

A summary of the patches is now as follows:

- Patch 1: Move cdev init code into a function
- Patch 2: Shift some devlarations from vchiq_arm.c to vchiq_arm.h for
           sharing
- Patch 3: Move vchiq cdev init code from vchiq_arm.c into vchiq_dev.c
- Patch 4: Decouple cdev code by defining a Kconfig entry to allow
           optional compilation of it.
- Patch 5: Merge code in vchiq_2835_arm.c to vchiq_arm.c

(More details can be found in the commit messages)


NOTE:  This patchset is built against the raspberry pi mainline kernel at
https://github.com/raspberrypi/linux/blob/rpi-5.10.y, and has been
tested on Raspberry Pi 3B+

At this point, I have some questions and ideas and would like to hear your
thoughts and suggestions on them:

1. So as mentioned, I have built this against the raspberry pi kernel,
   since I was not able to figure out a way to build the vanilla
   mainline kernel for Raspberry Pi. However, I understand that since
   this will be applied to the mainline, I need to make sure it is
   consistent with it.  

   Hence to confirm that, I tried to "git am" this patchset to the
   mainline kernel but there are some merge conflicts in doing so. I
   have an idea how to resolve most of them except the following:

    - The mainline vchiq_arm.c differs from the one in rapberry pi
      mainline which caused conflict in Patch 3.

   I'm not sure which vchiq_arm.c to treat as the base for my patches.
   The one in mainline? or the one in raspberry pi's git tree?


2. This question is more related to the next set of patches I'm
   planning to submit. So the last thing left in this TODO is to
   completely decouple vchiq platform and cdev code into 2 separate
   modules and I am planning to do that in a different patchset. 

   The approach I have in mind is to start by using EXPORT_SYMBOL to
   export all the functions (and accessor functions for variables like
   g_state) that would be required for cdev init. Majority of these
   would be exported from vchiq_arm.c and vchiq_core.c, and will then be
   used in vchiq-dev.ko. Is this the right way to approach this? 

Thank you in advance for looking into this and best regards!
Ojaswin


Ojaswin Mujoo (5):
  staging: vchiq: Refactor vchiq cdev code
  staging: vchiq: Move certain declarations to vchiq_arm.h
  staging: vchiq: Move vchiq char driver to its own file
  staging: vchiq: Make creation of vchiq cdev optional
  staging: vchiq: Combine vchiq platform code into single file

 arch/arm/configs/bcm2709_defconfig            |    1 +
 arch/arm/configs/bcm2711_defconfig            |    1 +
 arch/arm/configs/bcmrpi_defconfig             |    1 +
 drivers/staging/vc04_services/Kconfig         |   10 +
 drivers/staging/vc04_services/Makefile        |    5 +-
 .../interface/vchiq_arm/vchiq_2835_arm.c      |  651 -----
 .../interface/vchiq_arm/vchiq_arm.c           | 2477 ++++++-----------
 .../interface/vchiq_arm/vchiq_arm.h           |   79 +
 .../interface/vchiq_arm/vchiq_dev.c           | 1488 ++++++++++
 9 files changed, 2402 insertions(+), 2311 deletions(-)
 delete mode 100644 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
 create mode 100644 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c

-- 
2.25.1


Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393CF168
	for <linux-staging@lists.linux.dev>; Sun,  4 Jul 2021 15:56:21 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id o18so14904028pgu.10
        for <linux-staging@lists.linux.dev>; Sun, 04 Jul 2021 08:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=K2diU9KWyJASkYFPtaMAcRisbrNMDviSK63SFvUX3lM=;
        b=KPpTrH5/H9z3ApoT8xnpR8l85RrbAGUeoFvwYlT0NdWhS5jPSYgk+AcJWB/OB9iy7/
         rK30TL4lbZLL4LRrappX97hD4uSpj+ZTEI9G2biGsXYxgGdKP3iYY3og6JZeRelzX/NK
         diNUebuXXoZlgx+p1MOiWp61/4gLIdM4PyVWR8gbmPRNq+d1ja9RZy0aV1CKJMMiAh6s
         rfXvpki3WpD9kvSJakX1auQMXdIDlvujfK429EcmzAsrajDO8FR4GcPProZ7HDg4eUGO
         3Uvx6KJTLC5Ej+1+j8av8WwAaHssXui01PWFqWzxJnDex6dhmqiHPLSJuTkjrtOVCMfR
         Tu9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=K2diU9KWyJASkYFPtaMAcRisbrNMDviSK63SFvUX3lM=;
        b=rp1Fq8t3C7FSriKW6x9k8HXGP79VcqZlZ8+NPkUtu4OoH2OnleuNKZjTz6rY0kjtFN
         V4qI0dGbvykwgTVn4VAQQ1GKwSo1juEmWFn1lGs0Vqh3hyoiWF5KZ9vEjehZq8I9CRqB
         vDh2HsVJQgHgR+LSHPr+jp7t92PeCxgbANjiGDo1uNmlAoj8VdPDHhltWo+rEGKagKEY
         rslOfE3Gm41xNKO2kji06xygSYWzg7Dpg21JwHmWb3NYLrCrMj7dSB7LPZ0U9w4P4WuH
         j0xU9p8xIrZY2AJpW9gCKZxsGrL+7JpWaoT5NihUz+iFmC2xA8neNNvcCj7rs7gj8vtn
         w+Aw==
X-Gm-Message-State: AOAM530xsqrYNG5D3cuTdGsY9CWCTE9bpAO53u3AscAY1txpbol1TlNc
	BeKt1vGF70U1h4jQGTffh7g=
X-Google-Smtp-Source: ABdhPJx/MqrjtL61CGxEabIT5HI65iVP4Obbsncf+0uA9qdbKQH59smVp9MmgLCMwSknI3AZYESzuQ==
X-Received: by 2002:a63:d90b:: with SMTP id r11mr10917482pgg.81.1625414180733;
        Sun, 04 Jul 2021 08:56:20 -0700 (PDT)
Received: from ojas ([182.69.223.21])
        by smtp.gmail.com with ESMTPSA id m7sm2141928pjf.8.2021.07.04.08.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 08:56:20 -0700 (PDT)
Date: Sun, 4 Jul 2021 21:26:08 +0530
From: Ojaswin Mujoo <ojaswin98@gmail.com>
To: nsaenz@kernel.org
Cc: gregkh@linuxfoundation.org, stefan.wahren@i2se.com, arnd@arndb.de,
	dan.carpenter@oracle.com, phil@raspberrypi.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] vchiq: Patch to separate platform and cdev code
Message-ID: <cover.1625401927.git.ojaswin98@gmail.com>
Precedence: bulk
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

A summary of the patches is as follows:

- Patch 1: Move cdev init code into a function
- Patch 2: Shift some devlarations from vchiq_arm.c to vchiq_arm.h for
           sharing
- Patch 3: Move vchiq cdev init code from vchiq_arm.c into vchiq_dev.c
- Patch 4: Decouple cdev code by defining a Kconfig entry to allow
           optional compilation of it.
- Patch 5: Merge code in vchiq_2835_arm.c to vchiq_arm.c

(More details can be found in the commit messages)

Changes since v2 [1]:

* In Patch 1, as suggested, I have added error handling code back to
  ensure the driver exits when there is an error in creating vchiq cdev
  
* I have built this patch against the right kernel (gregkh/staging,
  staging-next branch) to avoid introducing any unwanted inconsistencies
  like whitespace changes

I have tested the patch using vchiq_test utility on RPi 3B+.

Additionally, I had a small question regarding the next steps here
(quoting my cover letter from v2):

This question is more related to the next set of patches I'm
planning to submit. So the last thing left in this TODO is to
completely decouple vchiq platform and cdev code into 2 separate
modules and I am planning to do that in a different patchset. 

The approach I have in mind is to start by using EXPORT_SYMBOL to
export all the functions (and accessor functions for variables like
g_state) that would be required for cdev init. Majority of these
would be exported from vchiq_arm.c and vchiq_core.c, and will then be
used in vchiq-dev.ko. Is this the right way to approach this? 

Thank you in advance for the help. Please let me know if any changes/
additional info is required.

Regards,
Ojaswin

[1] v2: https://lkml.org/lkml/2021/6/20/63

Ojaswin Mujoo (5):
  staging: vchiq: Refactor vchiq cdev code
  staging: vchiq: Move certain declarations to vchiq_arm.h
  staging: vchiq: Move vchiq char driver to its own file
  staging: vchiq: Make creation of vchiq cdev optional
  staging: vchiq: Combine vchiq platform code into single file

 drivers/staging/vc04_services/Kconfig         |   10 +
 drivers/staging/vc04_services/Makefile        |    5 +-
 .../interface/vchiq_arm/vchiq_2835_arm.c      |  564 ----
 .../interface/vchiq_arm/vchiq_arm.c           | 2344 +++++------------
 .../interface/vchiq_arm/vchiq_arm.h           |   82 +
 .../interface/vchiq_arm/vchiq_dev.c           | 1440 ++++++++++
 6 files changed, 2265 insertions(+), 2180 deletions(-)
 delete mode 100644 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
 create mode 100644 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c

-- 
2.25.1


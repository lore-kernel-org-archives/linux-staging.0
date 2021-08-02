Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E9470
	for <linux-staging@lists.linux.dev>; Mon,  2 Aug 2021 17:42:23 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id u16so11963002ple.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Aug 2021 10:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zypShOHHJ2S2Sr8vYY3+01JamPdXVQkfX8nYGZTs/v8=;
        b=UX3jnTK98osl/Axo20/sp012WKEY7J6mC6yrEFYUhrhOUphUJ4DIlviKg6uh3VSAOd
         +8jJTZtowWD9U3d+n92q3KZWt7hgObMzi+/sG3ag5z1WqaiP9LXLT8dH2IadNEQtNUKt
         EDVb/slMJ4IdCrpscFTsgfpwiJI7HTbphOx1OCUgW7imE3IbDDT5gjYaZYX5qq5vj+Xa
         XwWkGs/ju3m0t7p1ERJVkZmU1PkuaKuF34VHaFzNNbUs/V9uSnjQbHehJIsw/Bd0hE8w
         f/kQf1yw7J5Rq1Udw5Q1ZzB3OIZQODyX7USjc60yQpWG7mSGrnHuPSdn2XlIJaPU9ptj
         JGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zypShOHHJ2S2Sr8vYY3+01JamPdXVQkfX8nYGZTs/v8=;
        b=hyXqVFCpmf+A8Y21wsEwwsgmymfXMp6AcLBfWabbw5Qaqwj9dzyiixpB0IMBsBHi8P
         MdFDzBClMGZ0eNfIVlMuEOeimjkjoXJNipNemtG3mWmB0mJM5+AImIHzwT6/ynWHboz7
         GkJ/tyWnNAK9eWXnt8qZBXvumvHwkmDkDIPrRlD2SgaJKG6ecJ14fykWQnBPzERily9z
         B300cA9FwJRL7lZLbXLrzW6WYkFHf80M3Zx5IMgamSl0ve3Do59zjUjAFdntWtxXsf4r
         VD8UV49tcWPqzjU4OPbV7knH3QmDitX3nKkBMJDeksYgFY7vo5vPCZ7GSb9AuIyuA1dJ
         gH6Q==
X-Gm-Message-State: AOAM532DPKtzxU6LpkDyvXgMOcM4OrAPubu18b5bg2F5ava/MiMyrJuM
	JF25vFD3NV+XrEG5j7Z6bZU=
X-Google-Smtp-Source: ABdhPJzx0DKlCLxHPHDUBxDKLhxHxqqYAwRsRUtoR6//mPFMX4uq9eoiTtyOWFbt1sqAQuGunldUNA==
X-Received: by 2002:a17:90b:17c3:: with SMTP id me3mr18083pjb.203.1627926143371;
        Mon, 02 Aug 2021 10:42:23 -0700 (PDT)
Received: from localhost.localdomain ([122.161.50.148])
        by smtp.googlemail.com with ESMTPSA id t30sm14449236pgl.47.2021.08.02.10.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 10:42:23 -0700 (PDT)
From: Ojaswin Mujoo <ojaswin98@gmail.com>
To: nsaenz@kernel.org,
	gregkh@linuxfoundation.org,
	stefan.wahren@i2se.com
Cc: dan.carpenter@oracle.com,
	phil@raspberrypi.com,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] staging: vchiq: Fixups to Kconfig
Date: Mon,  2 Aug 2021 23:12:09 +0530
Message-Id: <cover.1627925241.git.ojaswin98@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This patchset performs some minor fixups to the config options defined in
/staging/vc04_services/Kconfig. 

Summary of the patches:

Patch 1: Makes BCM2835_VCHIQ imply VCHIQ_CDEV to make the behavior more
         compatible to how it was before VCHIQ_CDEV was introduced (in
         [1]).
Patch 2: Add some more details to the configs' help texts


Changes since v1 [2]:

*  As pre discussion with Greg and Stefan, used "imply" in BCM2835_VCHIQ
   instead of "default y" in VCHIQ_CDEV.
*  Added some more info in help texts of both the config options.

In patch 2, although the resources on VideoCore and vchiq are really
scattered around the internet, I've tried to keep the help text as
accurate as possible, as per my knowledge.
Please do let me know if anything is off in it and I'll fix it.

Thank you!
Ojaswin

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/patch/?id=2b5930fb3dc06d86149071f9dc8b6992cac1c3aa

[2] https://lore.kernel.org/patchwork/cover/1469192/

Ojaswin Mujoo (2):
  staging: vchiq: Set $CONFIG_BCM2835_VCHIQ to imply $CONFIG_VCHIQ_CDEV
  staging: vchiq: Add details to Kconfig help texts

 drivers/staging/vc04_services/Kconfig | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

-- 
2.25.1


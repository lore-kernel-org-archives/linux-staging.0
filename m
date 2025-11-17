Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264D9335BC5
	for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 14:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763390441; cv=none; b=m2ALYPEzxVBQ/26F5+i1Uid+W8Sh+tj/YIGnoY0r7lnkrhx52jRXU85FMtKydW65xG/5R1aodmqeguHukgFUEDXpTyqxykKSCTNkU7Lh3vdzC5nwOlzXiFn+ty2Y6mawRz+ScyjndecozrtdO8+uCklLIzsMUEmfxIF8TMBiom4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763390441; c=relaxed/simple;
	bh=49Fq7z8rr9iNUC3aJPrXBEEPETVa64Of6k6EleqFeOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bZpztM3Kt/NoqskqvXTqL/+Xe11CG3yPEgh5Bs6OTn+1iZ/I1cg/m12F6imoOgtepGivFwP0+g0rJCjY3DwMQubDhT2svW7ABkXqPdAoX8YJfIBnsfE5uOv7Z970Nken9N5IxdE1/Fbw+RnPs7aF0NDGis6gs8vMKZpqZn57tqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B1Eksaig; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B1Eksaig"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-429c8632fcbso3091542f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 06:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763390436; x=1763995236; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Yii5C4twAlUJAvClpEWNTwPYcaNMdqvufA42zYcUMg=;
        b=B1Eksaig8tQFvHxV8l9xZ+Fol3BbyWmwHZx3oCFSH5sMrfhG+mnak7YVnPuAU24JoO
         TtagA5HYQ8HeR7L0R7G7k4FrYaXxXNI7mexpvEeNB29W62mfZQTscvt6HxPfu//z8dll
         1+qtWlW/E+JgdfFOPc9nJ+tfV/sKZQtt2cDv2RP/Sk/EL9Phy/M8FKTclfA5UUVgKTHc
         LINDqyH4ta5w8tHTjUM4OwOtgZALr4VxBhSino/LwdO19HRl0KTHEqgYUJHKhRoztPdN
         FFSMpAe1n0vSFTXRDVdjFRfYOcVVNj7lHyDnv5OqidFk8clfNMMcdxt3ADWlKrhmR6ZG
         1JCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763390436; x=1763995236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3Yii5C4twAlUJAvClpEWNTwPYcaNMdqvufA42zYcUMg=;
        b=mRVe08pZHFBg1+szKIhrjXHTdHXnow1wq0XF2fUHCKJ1LU+sqgZTh18pcDWmmElBQk
         ULYqh+Zms0G8wtMRHs2mIIS05isWN5DnPQMcdBGMy84sz/sRoJfS2/JPyEL3n+sjktRs
         I6NT0rK6uiiD/H5RmHd/ddcLUlqrhmNiHnpxsIpzJg+Sqw5fJ8O7ejZBXJDOCDHBKOWZ
         9TN9rV7/rIPXI0YhFpbzbUBRs2DYczm+tgL8xWaGsmWiccUuICqXY3b5z1Bas/f8CAUK
         mf6mfhnsFPX0+B9yggvrfJV4NZBiB1K3WVaFppXi18atGevy+xeArctU3ayD5hVrJKrC
         6WqA==
X-Forwarded-Encrypted: i=1; AJvYcCU3Fo9ZLek+p21rzBIQLSrnowr/ggSB43rL/9Ku6TjCa0RIvwh7LGY2J+rECexC6XTt+8FXMqz4r+b3Demh@lists.linux.dev
X-Gm-Message-State: AOJu0YwWwMh7sEY/CZe0VNqqy4CTylTmbdlqC2CRruCJ0COGBfmfGiSg
	l5e+FbPOuL7EP7BniizSykPES9Id8fTB/r87rsAxq6pT3+2CbL874IY9
X-Gm-Gg: ASbGncvW80wEF2XCexffNpvHBsSaYEY/s3U/UGsJPMg7iQik2jq3QBkCYGZS4L9t6vK
	/0DxYZGQKJMX87L4Gh6t9fzLQo+ziX+kkwcsUvvmnV5T/s4FoLyExyz3wIZH41DD4Mz/uABHTKW
	VYU8a4mzf/mIek/MeyhO8Wj6HNmrnOVqbJNk7355IscPCCwvrRL4/1i2fZxknHzlVkb1IGjOnOG
	ZO2iSkFsI3tXZdheX3vhO9J2i8ObwgF5KouK+bCrT6GjqDzyfv54Bw0SuN+WRiybJHpdrx7csbp
	t6/boQZVQuswf7Zaqfwmunmv/xYScIJ4NZBZl8Gta6h7jSykWYpDOYHHuUZDWcE/t493E9Fuz2+
	ucCKIZr1LUOL75Y/MevHT7ZN60r9sO0lW9vDkyh4f7xgJWs+1/FkcGP1vsnuuk00jYOpa6Ip8qZ
	Rd7y3ONKmFrcIHlbNCZhVOjiWhqQA=
X-Google-Smtp-Source: AGHT+IEpLRyOhmGIeDwoX2P/VD2UBl/lN4AJ3SEi682XMFlHV+G2CHR4lJUiw1cuJClwpnHUwPMRjQ==
X-Received: by 2002:a05:6000:26c8:b0:42b:3ee9:4773 with SMTP id ffacd0b85a97d-42b59323452mr12477636f8f.7.1763390436156;
        Mon, 17 Nov 2025 06:40:36 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f206e2sm26788218f8f.41.2025.11.17.06.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 06:40:35 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: johan@kernel.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH V4 4/4] gpib: Destage gpib
Date: Mon, 17 Nov 2025 15:40:21 +0100
Message-ID: <20251117144021.23569-5-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251117144021.23569-1-dpenkler@gmail.com>
References: <20251117144021.23569-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the gpib Kconfig menu and Makefile build rule from staging.

Remove gpib/uapi from the header file search path in subdir-ccflags
of the gpib Makefile

As part of the destaging process the gpib/uapi header files will be
moved to the standard kernel uapi directory include/uapi/linux
Change the include file path in the code for these files accordingly.

The gpib user space library needs the uapi header files in order to
communicate with the drivers. Copy the common include files from
staging/gpib/uapi to include/linux/uapi

Move the gpib tree out of staging to drivers.

Remove the word "Linux" from the gpib Kconfig file.

Add the gpib Kconfig menu and Makefile build rule to drivers
The gpib Kconfig menu has been added just after the related comedi
drivers.

MAINTAINERS: Change the gpib directory and add the uapi include files.
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 MAINTAINERS                                               | 4 +++-
 drivers/Kconfig                                           | 2 ++
 drivers/Makefile                                          | 1 +
 drivers/{staging => }/gpib/Kconfig                        | 8 ++++----
 drivers/{staging => }/gpib/Makefile                       | 2 +-
 drivers/{staging => }/gpib/TODO                           | 0
 drivers/{staging => }/gpib/agilent_82350b/Makefile        | 0
 .../{staging => }/gpib/agilent_82350b/agilent_82350b.c    | 0
 .../{staging => }/gpib/agilent_82350b/agilent_82350b.h    | 0
 drivers/{staging => }/gpib/agilent_82357a/Makefile        | 0
 .../{staging => }/gpib/agilent_82357a/agilent_82357a.c    | 0
 .../{staging => }/gpib/agilent_82357a/agilent_82357a.h    | 0
 drivers/{staging => }/gpib/cb7210/Makefile                | 0
 drivers/{staging => }/gpib/cb7210/cb7210.c                | 0
 drivers/{staging => }/gpib/cb7210/cb7210.h                | 0
 drivers/{staging => }/gpib/cec/Makefile                   | 0
 drivers/{staging => }/gpib/cec/cec.h                      | 0
 drivers/{staging => }/gpib/cec/cec_gpib.c                 | 0
 drivers/{staging => }/gpib/common/Makefile                | 0
 drivers/{staging => }/gpib/common/gpib_os.c               | 0
 drivers/{staging => }/gpib/common/iblib.c                 | 0
 drivers/{staging => }/gpib/common/ibsys.h                 | 0
 drivers/{staging => }/gpib/eastwood/Makefile              | 0
 drivers/{staging => }/gpib/eastwood/fluke_gpib.c          | 0
 drivers/{staging => }/gpib/eastwood/fluke_gpib.h          | 0
 drivers/{staging => }/gpib/fmh_gpib/Makefile              | 0
 drivers/{staging => }/gpib/fmh_gpib/fmh_gpib.c            | 0
 drivers/{staging => }/gpib/fmh_gpib/fmh_gpib.h            | 0
 drivers/{staging => }/gpib/gpio/Makefile                  | 0
 drivers/{staging => }/gpib/gpio/gpib_bitbang.c            | 0
 drivers/{staging => }/gpib/hp_82335/Makefile              | 0
 drivers/{staging => }/gpib/hp_82335/hp82335.c             | 0
 drivers/{staging => }/gpib/hp_82335/hp82335.h             | 0
 drivers/{staging => }/gpib/hp_82341/Makefile              | 0
 drivers/{staging => }/gpib/hp_82341/hp_82341.c            | 0
 drivers/{staging => }/gpib/hp_82341/hp_82341.h            | 0
 drivers/{staging => }/gpib/include/amcc5920.h             | 0
 drivers/{staging => }/gpib/include/amccs5933.h            | 0
 drivers/{staging => }/gpib/include/gpibP.h                | 4 ++--
 drivers/{staging => }/gpib/include/gpib_cmd.h             | 0
 drivers/{staging => }/gpib/include/gpib_pci_ids.h         | 0
 drivers/{staging => }/gpib/include/gpib_proto.h           | 0
 drivers/{staging => }/gpib/include/gpib_state_machines.h  | 0
 drivers/{staging => }/gpib/include/gpib_types.h           | 2 +-
 drivers/{staging => }/gpib/include/nec7210.h              | 0
 drivers/{staging => }/gpib/include/nec7210_registers.h    | 0
 drivers/{staging => }/gpib/include/plx9050.h              | 0
 drivers/{staging => }/gpib/include/quancom_pci.h          | 0
 drivers/{staging => }/gpib/include/tms9914.h              | 0
 drivers/{staging => }/gpib/include/tnt4882_registers.h    | 0
 drivers/{staging => }/gpib/ines/Makefile                  | 0
 drivers/{staging => }/gpib/ines/ines.h                    | 0
 drivers/{staging => }/gpib/ines/ines_gpib.c               | 0
 drivers/{staging => }/gpib/lpvo_usb_gpib/Makefile         | 0
 drivers/{staging => }/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c  | 0
 drivers/{staging => }/gpib/nec7210/Makefile               | 0
 drivers/{staging => }/gpib/nec7210/board.h                | 0
 drivers/{staging => }/gpib/nec7210/nec7210.c              | 0
 drivers/{staging => }/gpib/ni_usb/Makefile                | 0
 drivers/{staging => }/gpib/ni_usb/ni_usb_gpib.c           | 0
 drivers/{staging => }/gpib/ni_usb/ni_usb_gpib.h           | 0
 drivers/{staging => }/gpib/pc2/Makefile                   | 0
 drivers/{staging => }/gpib/pc2/pc2_gpib.c                 | 0
 drivers/{staging => }/gpib/tms9914/Makefile               | 0
 drivers/{staging => }/gpib/tms9914/tms9914.c              | 0
 drivers/{staging => }/gpib/tnt4882/Makefile               | 0
 drivers/{staging => }/gpib/tnt4882/mite.c                 | 0
 drivers/{staging => }/gpib/tnt4882/mite.h                 | 0
 drivers/{staging => }/gpib/tnt4882/tnt4882_gpib.c         | 0
 drivers/staging/Kconfig                                   | 2 --
 drivers/staging/Makefile                                  | 1 -
 {drivers/staging/gpib/uapi => include/uapi/linux}/gpib.h  | 0
 .../staging/gpib/uapi => include/uapi/linux}/gpib_ioctl.h | 0
 73 files changed, 14 insertions(+), 12 deletions(-)
 rename drivers/{staging => }/gpib/Kconfig (97%)
 rename drivers/{staging => }/gpib/Makefile (92%)
 rename drivers/{staging => }/gpib/TODO (100%)
 rename drivers/{staging => }/gpib/agilent_82350b/Makefile (100%)
 rename drivers/{staging => }/gpib/agilent_82350b/agilent_82350b.c (100%)
 rename drivers/{staging => }/gpib/agilent_82350b/agilent_82350b.h (100%)
 rename drivers/{staging => }/gpib/agilent_82357a/Makefile (100%)
 rename drivers/{staging => }/gpib/agilent_82357a/agilent_82357a.c (100%)
 rename drivers/{staging => }/gpib/agilent_82357a/agilent_82357a.h (100%)
 rename drivers/{staging => }/gpib/cb7210/Makefile (100%)
 rename drivers/{staging => }/gpib/cb7210/cb7210.c (100%)
 rename drivers/{staging => }/gpib/cb7210/cb7210.h (100%)
 rename drivers/{staging => }/gpib/cec/Makefile (100%)
 rename drivers/{staging => }/gpib/cec/cec.h (100%)
 rename drivers/{staging => }/gpib/cec/cec_gpib.c (100%)
 rename drivers/{staging => }/gpib/common/Makefile (100%)
 rename drivers/{staging => }/gpib/common/gpib_os.c (100%)
 rename drivers/{staging => }/gpib/common/iblib.c (100%)
 rename drivers/{staging => }/gpib/common/ibsys.h (100%)
 rename drivers/{staging => }/gpib/eastwood/Makefile (100%)
 rename drivers/{staging => }/gpib/eastwood/fluke_gpib.c (100%)
 rename drivers/{staging => }/gpib/eastwood/fluke_gpib.h (100%)
 rename drivers/{staging => }/gpib/fmh_gpib/Makefile (100%)
 rename drivers/{staging => }/gpib/fmh_gpib/fmh_gpib.c (100%)
 rename drivers/{staging => }/gpib/fmh_gpib/fmh_gpib.h (100%)
 rename drivers/{staging => }/gpib/gpio/Makefile (100%)
 rename drivers/{staging => }/gpib/gpio/gpib_bitbang.c (100%)
 rename drivers/{staging => }/gpib/hp_82335/Makefile (100%)
 rename drivers/{staging => }/gpib/hp_82335/hp82335.c (100%)
 rename drivers/{staging => }/gpib/hp_82335/hp82335.h (100%)
 rename drivers/{staging => }/gpib/hp_82341/Makefile (100%)
 rename drivers/{staging => }/gpib/hp_82341/hp_82341.c (100%)
 rename drivers/{staging => }/gpib/hp_82341/hp_82341.h (100%)
 rename drivers/{staging => }/gpib/include/amcc5920.h (100%)
 rename drivers/{staging => }/gpib/include/amccs5933.h (100%)
 rename drivers/{staging => }/gpib/include/gpibP.h (96%)
 rename drivers/{staging => }/gpib/include/gpib_cmd.h (100%)
 rename drivers/{staging => }/gpib/include/gpib_pci_ids.h (100%)
 rename drivers/{staging => }/gpib/include/gpib_proto.h (100%)
 rename drivers/{staging => }/gpib/include/gpib_state_machines.h (100%)
 rename drivers/{staging => }/gpib/include/gpib_types.h (99%)
 rename drivers/{staging => }/gpib/include/nec7210.h (100%)
 rename drivers/{staging => }/gpib/include/nec7210_registers.h (100%)
 rename drivers/{staging => }/gpib/include/plx9050.h (100%)
 rename drivers/{staging => }/gpib/include/quancom_pci.h (100%)
 rename drivers/{staging => }/gpib/include/tms9914.h (100%)
 rename drivers/{staging => }/gpib/include/tnt4882_registers.h (100%)
 rename drivers/{staging => }/gpib/ines/Makefile (100%)
 rename drivers/{staging => }/gpib/ines/ines.h (100%)
 rename drivers/{staging => }/gpib/ines/ines_gpib.c (100%)
 rename drivers/{staging => }/gpib/lpvo_usb_gpib/Makefile (100%)
 rename drivers/{staging => }/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c (100%)
 rename drivers/{staging => }/gpib/nec7210/Makefile (100%)
 rename drivers/{staging => }/gpib/nec7210/board.h (100%)
 rename drivers/{staging => }/gpib/nec7210/nec7210.c (100%)
 rename drivers/{staging => }/gpib/ni_usb/Makefile (100%)
 rename drivers/{staging => }/gpib/ni_usb/ni_usb_gpib.c (100%)
 rename drivers/{staging => }/gpib/ni_usb/ni_usb_gpib.h (100%)
 rename drivers/{staging => }/gpib/pc2/Makefile (100%)
 rename drivers/{staging => }/gpib/pc2/pc2_gpib.c (100%)
 rename drivers/{staging => }/gpib/tms9914/Makefile (100%)
 rename drivers/{staging => }/gpib/tms9914/tms9914.c (100%)
 rename drivers/{staging => }/gpib/tnt4882/Makefile (100%)
 rename drivers/{staging => }/gpib/tnt4882/mite.c (100%)
 rename drivers/{staging => }/gpib/tnt4882/mite.h (100%)
 rename drivers/{staging => }/gpib/tnt4882/tnt4882_gpib.c (100%)
 rename {drivers/staging/gpib/uapi => include/uapi/linux}/gpib.h (100%)
 rename {drivers/staging/gpib/uapi => include/uapi/linux}/gpib_ioctl.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index df07d1a3c28d..4cb0de3777b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10628,7 +10628,9 @@ F:	drivers/platform/x86/gpd-pocket-fan.c
 GPIB DRIVERS
 M:	Dave Penkler <dpenkler@gmail.com>
 S:	Maintained
-F:	drivers/staging/gpib/
+F:	drivers/gpib/
+F:      include/uapi/linux/gpib.h
+F:      include/uapi/linux/gpib_ioctl.h
 
 GPIO ACPI SUPPORT
 M:	Mika Westerberg <westeri@kernel.org>
diff --git a/drivers/Kconfig b/drivers/Kconfig
index 4915a63866b0..01602581b880 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -161,6 +161,8 @@ source "drivers/greybus/Kconfig"
 
 source "drivers/comedi/Kconfig"
 
+source "drivers/gpib/Kconfig"
+
 source "drivers/staging/Kconfig"
 
 source "drivers/platform/Kconfig"
diff --git a/drivers/Makefile b/drivers/Makefile
index 8e1ffa4358d5..d275b1526cdd 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -150,6 +150,7 @@ obj-$(CONFIG_VHOST_IOTLB)	+= vhost/
 obj-$(CONFIG_VHOST)		+= vhost/
 obj-$(CONFIG_GREYBUS)		+= greybus/
 obj-$(CONFIG_COMEDI)		+= comedi/
+obj-$(CONFIG_GPIB)		+= gpib/
 obj-$(CONFIG_STAGING)		+= staging/
 obj-y				+= platform/
 
diff --git a/drivers/staging/gpib/Kconfig b/drivers/gpib/Kconfig
similarity index 97%
rename from drivers/staging/gpib/Kconfig
rename to drivers/gpib/Kconfig
index aa01538d5beb..eeb50956ce85 100644
--- a/drivers/staging/gpib/Kconfig
+++ b/drivers/gpib/Kconfig
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 menuconfig GPIB
-	tristate "Linux GPIB drivers"
+	tristate "GPIB drivers"
 	help
-	  Enable support for GPIB cards and dongles for Linux.  GPIB
-	  is the General Purpose Interface Bus which conforms to the
-	  IEEE488 standard.
+	  Enable support for GPIB cards and dongles.  GPIB is the
+	  General Purpose Interface Bus which conforms to the IEEE488
+	  standard.
 
 	  This set of drivers can be used with the corresponding user
 	  space library that can be found on Sourceforge under linux-gpib.
diff --git a/drivers/staging/gpib/Makefile b/drivers/gpib/Makefile
similarity index 92%
rename from drivers/staging/gpib/Makefile
rename to drivers/gpib/Makefile
index d0e88f5c0844..2d44fed2a743 100644
--- a/drivers/staging/gpib/Makefile
+++ b/drivers/gpib/Makefile
@@ -1,5 +1,5 @@
 
-subdir-ccflags-y += -I$(src)/include -I$(src)/uapi
+subdir-ccflags-y += -I$(src)/include
 
 obj-$(CONFIG_GPIB_AGILENT_82350B) += agilent_82350b/
 obj-$(CONFIG_GPIB_AGILENT_82357A) += agilent_82357a/
diff --git a/drivers/staging/gpib/TODO b/drivers/gpib/TODO
similarity index 100%
rename from drivers/staging/gpib/TODO
rename to drivers/gpib/TODO
diff --git a/drivers/staging/gpib/agilent_82350b/Makefile b/drivers/gpib/agilent_82350b/Makefile
similarity index 100%
rename from drivers/staging/gpib/agilent_82350b/Makefile
rename to drivers/gpib/agilent_82350b/Makefile
diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/gpib/agilent_82350b/agilent_82350b.c
similarity index 100%
rename from drivers/staging/gpib/agilent_82350b/agilent_82350b.c
rename to drivers/gpib/agilent_82350b/agilent_82350b.c
diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.h b/drivers/gpib/agilent_82350b/agilent_82350b.h
similarity index 100%
rename from drivers/staging/gpib/agilent_82350b/agilent_82350b.h
rename to drivers/gpib/agilent_82350b/agilent_82350b.h
diff --git a/drivers/staging/gpib/agilent_82357a/Makefile b/drivers/gpib/agilent_82357a/Makefile
similarity index 100%
rename from drivers/staging/gpib/agilent_82357a/Makefile
rename to drivers/gpib/agilent_82357a/Makefile
diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/gpib/agilent_82357a/agilent_82357a.c
similarity index 100%
rename from drivers/staging/gpib/agilent_82357a/agilent_82357a.c
rename to drivers/gpib/agilent_82357a/agilent_82357a.c
diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.h b/drivers/gpib/agilent_82357a/agilent_82357a.h
similarity index 100%
rename from drivers/staging/gpib/agilent_82357a/agilent_82357a.h
rename to drivers/gpib/agilent_82357a/agilent_82357a.h
diff --git a/drivers/staging/gpib/cb7210/Makefile b/drivers/gpib/cb7210/Makefile
similarity index 100%
rename from drivers/staging/gpib/cb7210/Makefile
rename to drivers/gpib/cb7210/Makefile
diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/gpib/cb7210/cb7210.c
similarity index 100%
rename from drivers/staging/gpib/cb7210/cb7210.c
rename to drivers/gpib/cb7210/cb7210.c
diff --git a/drivers/staging/gpib/cb7210/cb7210.h b/drivers/gpib/cb7210/cb7210.h
similarity index 100%
rename from drivers/staging/gpib/cb7210/cb7210.h
rename to drivers/gpib/cb7210/cb7210.h
diff --git a/drivers/staging/gpib/cec/Makefile b/drivers/gpib/cec/Makefile
similarity index 100%
rename from drivers/staging/gpib/cec/Makefile
rename to drivers/gpib/cec/Makefile
diff --git a/drivers/staging/gpib/cec/cec.h b/drivers/gpib/cec/cec.h
similarity index 100%
rename from drivers/staging/gpib/cec/cec.h
rename to drivers/gpib/cec/cec.h
diff --git a/drivers/staging/gpib/cec/cec_gpib.c b/drivers/gpib/cec/cec_gpib.c
similarity index 100%
rename from drivers/staging/gpib/cec/cec_gpib.c
rename to drivers/gpib/cec/cec_gpib.c
diff --git a/drivers/staging/gpib/common/Makefile b/drivers/gpib/common/Makefile
similarity index 100%
rename from drivers/staging/gpib/common/Makefile
rename to drivers/gpib/common/Makefile
diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/gpib/common/gpib_os.c
similarity index 100%
rename from drivers/staging/gpib/common/gpib_os.c
rename to drivers/gpib/common/gpib_os.c
diff --git a/drivers/staging/gpib/common/iblib.c b/drivers/gpib/common/iblib.c
similarity index 100%
rename from drivers/staging/gpib/common/iblib.c
rename to drivers/gpib/common/iblib.c
diff --git a/drivers/staging/gpib/common/ibsys.h b/drivers/gpib/common/ibsys.h
similarity index 100%
rename from drivers/staging/gpib/common/ibsys.h
rename to drivers/gpib/common/ibsys.h
diff --git a/drivers/staging/gpib/eastwood/Makefile b/drivers/gpib/eastwood/Makefile
similarity index 100%
rename from drivers/staging/gpib/eastwood/Makefile
rename to drivers/gpib/eastwood/Makefile
diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/gpib/eastwood/fluke_gpib.c
similarity index 100%
rename from drivers/staging/gpib/eastwood/fluke_gpib.c
rename to drivers/gpib/eastwood/fluke_gpib.c
diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.h b/drivers/gpib/eastwood/fluke_gpib.h
similarity index 100%
rename from drivers/staging/gpib/eastwood/fluke_gpib.h
rename to drivers/gpib/eastwood/fluke_gpib.h
diff --git a/drivers/staging/gpib/fmh_gpib/Makefile b/drivers/gpib/fmh_gpib/Makefile
similarity index 100%
rename from drivers/staging/gpib/fmh_gpib/Makefile
rename to drivers/gpib/fmh_gpib/Makefile
diff --git a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c b/drivers/gpib/fmh_gpib/fmh_gpib.c
similarity index 100%
rename from drivers/staging/gpib/fmh_gpib/fmh_gpib.c
rename to drivers/gpib/fmh_gpib/fmh_gpib.c
diff --git a/drivers/staging/gpib/fmh_gpib/fmh_gpib.h b/drivers/gpib/fmh_gpib/fmh_gpib.h
similarity index 100%
rename from drivers/staging/gpib/fmh_gpib/fmh_gpib.h
rename to drivers/gpib/fmh_gpib/fmh_gpib.h
diff --git a/drivers/staging/gpib/gpio/Makefile b/drivers/gpib/gpio/Makefile
similarity index 100%
rename from drivers/staging/gpib/gpio/Makefile
rename to drivers/gpib/gpio/Makefile
diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/gpib/gpio/gpib_bitbang.c
similarity index 100%
rename from drivers/staging/gpib/gpio/gpib_bitbang.c
rename to drivers/gpib/gpio/gpib_bitbang.c
diff --git a/drivers/staging/gpib/hp_82335/Makefile b/drivers/gpib/hp_82335/Makefile
similarity index 100%
rename from drivers/staging/gpib/hp_82335/Makefile
rename to drivers/gpib/hp_82335/Makefile
diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/gpib/hp_82335/hp82335.c
similarity index 100%
rename from drivers/staging/gpib/hp_82335/hp82335.c
rename to drivers/gpib/hp_82335/hp82335.c
diff --git a/drivers/staging/gpib/hp_82335/hp82335.h b/drivers/gpib/hp_82335/hp82335.h
similarity index 100%
rename from drivers/staging/gpib/hp_82335/hp82335.h
rename to drivers/gpib/hp_82335/hp82335.h
diff --git a/drivers/staging/gpib/hp_82341/Makefile b/drivers/gpib/hp_82341/Makefile
similarity index 100%
rename from drivers/staging/gpib/hp_82341/Makefile
rename to drivers/gpib/hp_82341/Makefile
diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/gpib/hp_82341/hp_82341.c
similarity index 100%
rename from drivers/staging/gpib/hp_82341/hp_82341.c
rename to drivers/gpib/hp_82341/hp_82341.c
diff --git a/drivers/staging/gpib/hp_82341/hp_82341.h b/drivers/gpib/hp_82341/hp_82341.h
similarity index 100%
rename from drivers/staging/gpib/hp_82341/hp_82341.h
rename to drivers/gpib/hp_82341/hp_82341.h
diff --git a/drivers/staging/gpib/include/amcc5920.h b/drivers/gpib/include/amcc5920.h
similarity index 100%
rename from drivers/staging/gpib/include/amcc5920.h
rename to drivers/gpib/include/amcc5920.h
diff --git a/drivers/staging/gpib/include/amccs5933.h b/drivers/gpib/include/amccs5933.h
similarity index 100%
rename from drivers/staging/gpib/include/amccs5933.h
rename to drivers/gpib/include/amccs5933.h
diff --git a/drivers/staging/gpib/include/gpibP.h b/drivers/gpib/include/gpibP.h
similarity index 96%
rename from drivers/staging/gpib/include/gpibP.h
rename to drivers/gpib/include/gpibP.h
index 1b27f37e0ba0..e3938ada3e0d 100644
--- a/drivers/staging/gpib/include/gpibP.h
+++ b/drivers/gpib/include/gpibP.h
@@ -12,8 +12,8 @@
 #include "gpib_types.h"
 #include "gpib_proto.h"
 #include "gpib_cmd.h"
-#include "gpib.h"
-#include "gpib_ioctl.h"
+#include <linux/gpib.h>
+#include <linux/gpib_ioctl.h>
 
 #include <linux/fs.h>
 #include <linux/interrupt.h>
diff --git a/drivers/staging/gpib/include/gpib_cmd.h b/drivers/gpib/include/gpib_cmd.h
similarity index 100%
rename from drivers/staging/gpib/include/gpib_cmd.h
rename to drivers/gpib/include/gpib_cmd.h
diff --git a/drivers/staging/gpib/include/gpib_pci_ids.h b/drivers/gpib/include/gpib_pci_ids.h
similarity index 100%
rename from drivers/staging/gpib/include/gpib_pci_ids.h
rename to drivers/gpib/include/gpib_pci_ids.h
diff --git a/drivers/staging/gpib/include/gpib_proto.h b/drivers/gpib/include/gpib_proto.h
similarity index 100%
rename from drivers/staging/gpib/include/gpib_proto.h
rename to drivers/gpib/include/gpib_proto.h
diff --git a/drivers/staging/gpib/include/gpib_state_machines.h b/drivers/gpib/include/gpib_state_machines.h
similarity index 100%
rename from drivers/staging/gpib/include/gpib_state_machines.h
rename to drivers/gpib/include/gpib_state_machines.h
diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/gpib/include/gpib_types.h
similarity index 99%
rename from drivers/staging/gpib/include/gpib_types.h
rename to drivers/gpib/include/gpib_types.h
index 998abb379749..5a0978ae27e7 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/gpib/include/gpib_types.h
@@ -8,7 +8,7 @@
 #define _GPIB_TYPES_H
 
 #ifdef __KERNEL__
-#include "gpib.h"
+#include <linux/gpib.h>
 #include <linux/atomic.h>
 #include <linux/device.h>
 #include <linux/mutex.h>
diff --git a/drivers/staging/gpib/include/nec7210.h b/drivers/gpib/include/nec7210.h
similarity index 100%
rename from drivers/staging/gpib/include/nec7210.h
rename to drivers/gpib/include/nec7210.h
diff --git a/drivers/staging/gpib/include/nec7210_registers.h b/drivers/gpib/include/nec7210_registers.h
similarity index 100%
rename from drivers/staging/gpib/include/nec7210_registers.h
rename to drivers/gpib/include/nec7210_registers.h
diff --git a/drivers/staging/gpib/include/plx9050.h b/drivers/gpib/include/plx9050.h
similarity index 100%
rename from drivers/staging/gpib/include/plx9050.h
rename to drivers/gpib/include/plx9050.h
diff --git a/drivers/staging/gpib/include/quancom_pci.h b/drivers/gpib/include/quancom_pci.h
similarity index 100%
rename from drivers/staging/gpib/include/quancom_pci.h
rename to drivers/gpib/include/quancom_pci.h
diff --git a/drivers/staging/gpib/include/tms9914.h b/drivers/gpib/include/tms9914.h
similarity index 100%
rename from drivers/staging/gpib/include/tms9914.h
rename to drivers/gpib/include/tms9914.h
diff --git a/drivers/staging/gpib/include/tnt4882_registers.h b/drivers/gpib/include/tnt4882_registers.h
similarity index 100%
rename from drivers/staging/gpib/include/tnt4882_registers.h
rename to drivers/gpib/include/tnt4882_registers.h
diff --git a/drivers/staging/gpib/ines/Makefile b/drivers/gpib/ines/Makefile
similarity index 100%
rename from drivers/staging/gpib/ines/Makefile
rename to drivers/gpib/ines/Makefile
diff --git a/drivers/staging/gpib/ines/ines.h b/drivers/gpib/ines/ines.h
similarity index 100%
rename from drivers/staging/gpib/ines/ines.h
rename to drivers/gpib/ines/ines.h
diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/gpib/ines/ines_gpib.c
similarity index 100%
rename from drivers/staging/gpib/ines/ines_gpib.c
rename to drivers/gpib/ines/ines_gpib.c
diff --git a/drivers/staging/gpib/lpvo_usb_gpib/Makefile b/drivers/gpib/lpvo_usb_gpib/Makefile
similarity index 100%
rename from drivers/staging/gpib/lpvo_usb_gpib/Makefile
rename to drivers/gpib/lpvo_usb_gpib/Makefile
diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
similarity index 100%
rename from drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
rename to drivers/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
diff --git a/drivers/staging/gpib/nec7210/Makefile b/drivers/gpib/nec7210/Makefile
similarity index 100%
rename from drivers/staging/gpib/nec7210/Makefile
rename to drivers/gpib/nec7210/Makefile
diff --git a/drivers/staging/gpib/nec7210/board.h b/drivers/gpib/nec7210/board.h
similarity index 100%
rename from drivers/staging/gpib/nec7210/board.h
rename to drivers/gpib/nec7210/board.h
diff --git a/drivers/staging/gpib/nec7210/nec7210.c b/drivers/gpib/nec7210/nec7210.c
similarity index 100%
rename from drivers/staging/gpib/nec7210/nec7210.c
rename to drivers/gpib/nec7210/nec7210.c
diff --git a/drivers/staging/gpib/ni_usb/Makefile b/drivers/gpib/ni_usb/Makefile
similarity index 100%
rename from drivers/staging/gpib/ni_usb/Makefile
rename to drivers/gpib/ni_usb/Makefile
diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/gpib/ni_usb/ni_usb_gpib.c
similarity index 100%
rename from drivers/staging/gpib/ni_usb/ni_usb_gpib.c
rename to drivers/gpib/ni_usb/ni_usb_gpib.c
diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.h b/drivers/gpib/ni_usb/ni_usb_gpib.h
similarity index 100%
rename from drivers/staging/gpib/ni_usb/ni_usb_gpib.h
rename to drivers/gpib/ni_usb/ni_usb_gpib.h
diff --git a/drivers/staging/gpib/pc2/Makefile b/drivers/gpib/pc2/Makefile
similarity index 100%
rename from drivers/staging/gpib/pc2/Makefile
rename to drivers/gpib/pc2/Makefile
diff --git a/drivers/staging/gpib/pc2/pc2_gpib.c b/drivers/gpib/pc2/pc2_gpib.c
similarity index 100%
rename from drivers/staging/gpib/pc2/pc2_gpib.c
rename to drivers/gpib/pc2/pc2_gpib.c
diff --git a/drivers/staging/gpib/tms9914/Makefile b/drivers/gpib/tms9914/Makefile
similarity index 100%
rename from drivers/staging/gpib/tms9914/Makefile
rename to drivers/gpib/tms9914/Makefile
diff --git a/drivers/staging/gpib/tms9914/tms9914.c b/drivers/gpib/tms9914/tms9914.c
similarity index 100%
rename from drivers/staging/gpib/tms9914/tms9914.c
rename to drivers/gpib/tms9914/tms9914.c
diff --git a/drivers/staging/gpib/tnt4882/Makefile b/drivers/gpib/tnt4882/Makefile
similarity index 100%
rename from drivers/staging/gpib/tnt4882/Makefile
rename to drivers/gpib/tnt4882/Makefile
diff --git a/drivers/staging/gpib/tnt4882/mite.c b/drivers/gpib/tnt4882/mite.c
similarity index 100%
rename from drivers/staging/gpib/tnt4882/mite.c
rename to drivers/gpib/tnt4882/mite.c
diff --git a/drivers/staging/gpib/tnt4882/mite.h b/drivers/gpib/tnt4882/mite.h
similarity index 100%
rename from drivers/staging/gpib/tnt4882/mite.h
rename to drivers/gpib/tnt4882/mite.h
diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/gpib/tnt4882/tnt4882_gpib.c
similarity index 100%
rename from drivers/staging/gpib/tnt4882/tnt4882_gpib.c
rename to drivers/gpib/tnt4882/tnt4882_gpib.c
diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
index 075e775d3868..2f92cd698bef 100644
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -48,6 +48,4 @@ source "drivers/staging/axis-fifo/Kconfig"
 
 source "drivers/staging/vme_user/Kconfig"
 
-source "drivers/staging/gpib/Kconfig"
-
 endif # STAGING
diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
index e681e403509c..f5b8876aa536 100644
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@ -13,4 +13,3 @@ obj-$(CONFIG_MOST)		+= most/
 obj-$(CONFIG_GREYBUS)		+= greybus/
 obj-$(CONFIG_BCM2835_VCHIQ)	+= vc04_services/
 obj-$(CONFIG_XIL_AXIS_FIFO)	+= axis-fifo/
-obj-$(CONFIG_GPIB)	 	+= gpib/
diff --git a/drivers/staging/gpib/uapi/gpib.h b/include/uapi/linux/gpib.h
similarity index 100%
rename from drivers/staging/gpib/uapi/gpib.h
rename to include/uapi/linux/gpib.h
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/include/uapi/linux/gpib_ioctl.h
similarity index 100%
rename from drivers/staging/gpib/uapi/gpib_ioctl.h
rename to include/uapi/linux/gpib_ioctl.h
-- 
2.51.2


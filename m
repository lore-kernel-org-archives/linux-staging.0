Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807CA3093D8
	for <linux-staging@lists.linux.dev>; Mon, 10 Nov 2025 10:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762770339; cv=none; b=dNPEi+rs9ix4UElOWVP6Xjq6royeL5U3KjsvpldTnklP2N8d/jJKbrqwy7hm5z/f26k86acXgfv2UNbOyCyG+5V5oS20sQ65S37bSaIjCwyOjuw82jMpu5R76n8OMPto+8VrNlYZ18NQVJqttQbHUbILvY/3WzwPe9YR7ca9VN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762770339; c=relaxed/simple;
	bh=cPvTYylPKLhkKyBx+zQ2OYOXqgBlnW5y7jofZng3bDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bpp5I5cDL72kEGxNBNZDLZOXvMDmsiv/OAcG/VUjEOubAn8tNkl/SoaZbQ7Mh36VMF91UY8LJP+NeHZemQoilwnJzCg4b7rqZhRXjqOZ0SVg+4S+y9P98aRadlhNcJRlYxVfln/1ArVbbNs/ZIKiK7GA9t/UFPwj2EdukAbY7ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lwIsRg2P; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lwIsRg2P"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477775d3728so12143895e9.2
        for <linux-staging@lists.linux.dev>; Mon, 10 Nov 2025 02:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762770335; x=1763375135; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QN17KvwoftxF9+1uJg9AnA6ZLgm5xMfMqT1THoFVmUs=;
        b=lwIsRg2PLHE1eTDWaBnFWAGylkiExL3gt3LSkQmnmxL3aOBPIBOxDcUFtMGjwZ4bY+
         la7cL1JH9kjB9HUVQM8Vf2TKrHBMxsd/PZmjNhWS286SkEAtGrcjqNBW0iifDNpDf3+G
         gF6uGkCxsYongKkajUVUeDhBPSZ7OZ9yhLV+WflTxXmtlpagU41G6HXATSIMtIMkLiZ5
         snCtX2kWI1gVFOdCJas1kIo7N258ZD6vJ5IjkSyTO0f+q/C8xrqy5cN1MuZ9DwPqbySW
         Jbvr/F68yywjebEPEbeXerHrbUDVj2/Pu7lSRm9a8QtsQb1vpgwkM5A2H4vq/RjWRJ+K
         Zecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770335; x=1763375135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QN17KvwoftxF9+1uJg9AnA6ZLgm5xMfMqT1THoFVmUs=;
        b=oMpxwlWKpBN4Qn4nBzUqIIHT7Pd3LbfDGcKk1aVgewNbAmqd23SalsVEpGx/C/PjPe
         Ov2Hi+ZR4dInnsze3LtQP2i1iC+Wuf6YyuzJ3VY/4QCSP9l7VQ61/rbF38o+eYTzJDi4
         yLYZRCMlX+WfPslyktH8d3q+4uWwwoA+K3wRjxDeTvr2L208aRWs8YhUe/GRMPNSu3dj
         itM7rjUbaV1IwhbZ55ErfZvtW24KEXGVYm2fesCqyhlwkyOMD04bllk6rfj0QkOJiQBD
         fVjRMGHHdL1DyBS2Aya8TfH1Eh0KxGx6M6pmsHa2zYckJBtQWoia5vRfvoy8xrkcHoiD
         /KVA==
X-Forwarded-Encrypted: i=1; AJvYcCX6pZI+Gml4DV57Fnprcy7tL8wB3AVurxVRsZ0bionUKnUv42LtqG3vJywGm+E8XWsa/pqxsutPso1itsgd@lists.linux.dev
X-Gm-Message-State: AOJu0YwEvoW6jG7E1qZ5tV2GI8OZv9p9o/kxNgU5Ls/LBa5LY60HSMxr
	0Af9Te4JkV5hOLg4VkCqmZSN+CNiNjUS228novWPhuNVolaPNjE7vmZF
X-Gm-Gg: ASbGnctubWfEI+egiEZQRtTab3h3QymsQnvBL++aNKKxIL8eLifNAXbQDjlUG4iGxEu
	DQ0NVWpwrJz54nH2/tjKoVY/WMOj6vEbaJrFdlVXWFQ0E/EUOT7TMn1thTYCmEIR5yIt8PW8Uq5
	fef6IxeMd+UiggSsJz3hsW3FRjqBw+OtXO0GO9gjvQOLTKEM3bZoG4FRL6QvKsY+Fv3sYxKoq1A
	ZNk8xpuZBLBtxduPig70kg3YT1RYa6Bdr4jqPjv8ZPgRx8hd+Eeko3mlSfMu40FliSmYX11Pob6
	MNH64Zla6L2UvNIWBnnDVQb2RGdqCy5KVVOQqvJYHuXJJWboyilsjL7r01HlmAP/OLB4lTuc3Gw
	uFg4eao2HyPOPmHcerK02uMENpapnxq+/FyfPdT/Xmhnixj7TsLpS4/eASRBHF/bqxzG5TC8XKV
	w4Ah5OHAulx2xVlaFXdUODMSUF760=
X-Google-Smtp-Source: AGHT+IEGoApG9Z7SUKCYXKUAXay+SXZcFSnjEt+qHnpS+eP6mlsODbOzfwbO67/lK473pCqQJ/5S8Q==
X-Received: by 2002:a05:600c:474c:b0:477:6d96:b3ca with SMTP id 5b1f17b1804b1-477732298a2mr67045425e9.5.1762770334462;
        Mon, 10 Nov 2025 02:25:34 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4777a96e7f8sm67326715e9.13.2025.11.10.02.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:25:34 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 09/11] gpib: Move gpib drivers out of staging
Date: Mon, 10 Nov 2025 11:25:05 +0100
Message-ID: <20251110102507.1445-10-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251110102507.1445-1-dpenkler@gmail.com>
References: <20251110102507.1445-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes within the gpib tree for destaging have been addressed in
the preceding patches.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/{staging => }/gpib/Kconfig                         | 0
 drivers/{staging => }/gpib/Makefile                        | 0
 drivers/{staging => }/gpib/TODO                            | 0
 drivers/{staging => }/gpib/agilent_82350b/Makefile         | 0
 drivers/{staging => }/gpib/agilent_82350b/agilent_82350b.c | 0
 drivers/{staging => }/gpib/agilent_82350b/agilent_82350b.h | 0
 drivers/{staging => }/gpib/agilent_82357a/Makefile         | 0
 drivers/{staging => }/gpib/agilent_82357a/agilent_82357a.c | 0
 drivers/{staging => }/gpib/agilent_82357a/agilent_82357a.h | 0
 drivers/{staging => }/gpib/cb7210/Makefile                 | 0
 drivers/{staging => }/gpib/cb7210/cb7210.c                 | 0
 drivers/{staging => }/gpib/cb7210/cb7210.h                 | 0
 drivers/{staging => }/gpib/cec/Makefile                    | 0
 drivers/{staging => }/gpib/cec/cec.h                       | 0
 drivers/{staging => }/gpib/cec/cec_gpib.c                  | 0
 drivers/{staging => }/gpib/common/Makefile                 | 0
 drivers/{staging => }/gpib/common/gpib_os.c                | 0
 drivers/{staging => }/gpib/common/iblib.c                  | 0
 drivers/{staging => }/gpib/common/ibsys.h                  | 0
 drivers/{staging => }/gpib/eastwood/Makefile               | 0
 drivers/{staging => }/gpib/eastwood/fluke_gpib.c           | 0
 drivers/{staging => }/gpib/eastwood/fluke_gpib.h           | 0
 drivers/{staging => }/gpib/fmh_gpib/Makefile               | 0
 drivers/{staging => }/gpib/fmh_gpib/fmh_gpib.c             | 0
 drivers/{staging => }/gpib/fmh_gpib/fmh_gpib.h             | 0
 drivers/{staging => }/gpib/gpio/Makefile                   | 0
 drivers/{staging => }/gpib/gpio/gpib_bitbang.c             | 0
 drivers/{staging => }/gpib/hp_82335/Makefile               | 0
 drivers/{staging => }/gpib/hp_82335/hp82335.c              | 0
 drivers/{staging => }/gpib/hp_82335/hp82335.h              | 0
 drivers/{staging => }/gpib/hp_82341/Makefile               | 0
 drivers/{staging => }/gpib/hp_82341/hp_82341.c             | 0
 drivers/{staging => }/gpib/hp_82341/hp_82341.h             | 0
 drivers/{staging => }/gpib/include/amcc5920.h              | 0
 drivers/{staging => }/gpib/include/amccs5933.h             | 0
 drivers/{staging => }/gpib/include/gpibP.h                 | 0
 drivers/{staging => }/gpib/include/gpib_cmd.h              | 0
 drivers/{staging => }/gpib/include/gpib_pci_ids.h          | 0
 drivers/{staging => }/gpib/include/gpib_proto.h            | 0
 drivers/{staging => }/gpib/include/gpib_state_machines.h   | 0
 drivers/{staging => }/gpib/include/gpib_types.h            | 0
 drivers/{staging => }/gpib/include/nec7210.h               | 0
 drivers/{staging => }/gpib/include/nec7210_registers.h     | 0
 drivers/{staging => }/gpib/include/plx9050.h               | 0
 drivers/{staging => }/gpib/include/quancom_pci.h           | 0
 drivers/{staging => }/gpib/include/tms9914.h               | 0
 drivers/{staging => }/gpib/include/tnt4882_registers.h     | 0
 drivers/{staging => }/gpib/ines/Makefile                   | 0
 drivers/{staging => }/gpib/ines/ines.h                     | 0
 drivers/{staging => }/gpib/ines/ines_gpib.c                | 0
 drivers/{staging => }/gpib/lpvo_usb_gpib/Makefile          | 0
 drivers/{staging => }/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c   | 0
 drivers/{staging => }/gpib/nec7210/Makefile                | 0
 drivers/{staging => }/gpib/nec7210/board.h                 | 0
 drivers/{staging => }/gpib/nec7210/nec7210.c               | 0
 drivers/{staging => }/gpib/ni_usb/Makefile                 | 0
 drivers/{staging => }/gpib/ni_usb/ni_usb_gpib.c            | 0
 drivers/{staging => }/gpib/ni_usb/ni_usb_gpib.h            | 0
 drivers/{staging => }/gpib/pc2/Makefile                    | 0
 drivers/{staging => }/gpib/pc2/pc2_gpib.c                  | 0
 drivers/{staging => }/gpib/tms9914/Makefile                | 0
 drivers/{staging => }/gpib/tms9914/tms9914.c               | 0
 drivers/{staging => }/gpib/tnt4882/Makefile                | 0
 drivers/{staging => }/gpib/tnt4882/mite.c                  | 0
 drivers/{staging => }/gpib/tnt4882/mite.h                  | 0
 drivers/{staging => }/gpib/tnt4882/tnt4882_gpib.c          | 0
 66 files changed, 0 insertions(+), 0 deletions(-)
 rename drivers/{staging => }/gpib/Kconfig (100%)
 rename drivers/{staging => }/gpib/Makefile (100%)
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
 rename drivers/{staging => }/gpib/include/gpibP.h (100%)
 rename drivers/{staging => }/gpib/include/gpib_cmd.h (100%)
 rename drivers/{staging => }/gpib/include/gpib_pci_ids.h (100%)
 rename drivers/{staging => }/gpib/include/gpib_proto.h (100%)
 rename drivers/{staging => }/gpib/include/gpib_state_machines.h (100%)
 rename drivers/{staging => }/gpib/include/gpib_types.h (100%)
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

diff --git a/drivers/staging/gpib/Kconfig b/drivers/gpib/Kconfig
similarity index 100%
rename from drivers/staging/gpib/Kconfig
rename to drivers/gpib/Kconfig
diff --git a/drivers/staging/gpib/Makefile b/drivers/gpib/Makefile
similarity index 100%
rename from drivers/staging/gpib/Makefile
rename to drivers/gpib/Makefile
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
similarity index 100%
rename from drivers/staging/gpib/include/gpibP.h
rename to drivers/gpib/include/gpibP.h
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
similarity index 100%
rename from drivers/staging/gpib/include/gpib_types.h
rename to drivers/gpib/include/gpib_types.h
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
-- 
2.51.2


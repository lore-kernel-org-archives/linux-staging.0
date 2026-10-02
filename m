Received: from mail-oi2-f41.google.com (mail-oi2-f41.google.com [74.125.231.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D8342124A
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 08:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.233
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790928964; cv=pass; b=p/ymsrYypmMfDLR/JuqiYZe3FPmyGsm0ja/XDTwgnxPw5TTG5NPhV72puvAk0SxqYHtMwI5oQIS5Pdu+iOtmre5MbdR9UWHbAIKkmK0G/d+UNSZsUh0sJGBV5lVcS8gcxIpmFvZQkv57Eh5+UyRwYgWhkikQTHxqyzd8Br29Cas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790928964; c=relaxed/simple;
	bh=LVNDiT1X/QOzPtcr4Q/aCqhJ5KW4LJEAvqGBa3y400o=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=XGDjyj5/r4zKch4LkUJhNU2TWule/M5K/wx+e3ffRpY+fxEj6+gaMGYbs3Ev6gB5NsmET8mDqDlv5Hlicbf8g83TbGMXWUuTiyP6ukBHm/aXqnd7CW++B5FS6MVyOTapm7VfsIA64dO3alu2Gr03DzbB7IIR0kanJ1X7LRjcAIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iyo5v88K; arc=pass smtp.client-ip=74.125.231.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyo5v88K"
Received: by mail-oi2-f41.google.com with SMTP id 5614622812f47-4f4a36e08f9so552263b6e.2
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 01:16:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790928957; cv=none;
        d=google.com; s=arc-20260327;
        b=V4UeljIJPuOZ5wU0CPtuiMx9WccJfmGwEyJvpmEWQF82Xf3m8NU0u/9xIWf48tzt8D
         +IL18R5sV8kAivNYppt+Lve/IPlDk9TOqAn6d1KSu43m4nvheszwQDrNnbMxREpYdb14
         bEhRkNYzzE55rI8v0av2cCqKutES0bsi18XKKHO8i8B7c6oG5PVMZnBJxL2fR1opoSHI
         C+gJlQeFA+LYsXUmKXmzeQvjtlXEwyoKSiXxQoHNVPUR3URdUnkzE7s/0YxDF+344yUS
         0ybtFIIOhNRdqAUpbF2gTLew7bqvglrETwqxxAi0yEIEcdxzm/vrHuhS5rIBL2aV2zps
         55zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=vNMZyVK6pFlVTsgLLDPqKMJcnVZLWeRSVSS4Za1mR0k=;
        fh=sPhO5jzkKCPNA8u9+BNF1urNmtQGzqZBU7duP0kQduM=;
        b=eccCRsP+x01Ki+Y6bwojIZiEdOQgyDpp9vDc92hcCEFe9/pib445UM3BVVHv3fe/52
         IjVKibJHA1Dcx+Vicvg+G3Az39Zhb7gZqVU4X+YQHibvmrockhr9AUAdbAzTKeggJfGF
         c2CD7O/WPIM/oQkqYymxyTZMgmo6pGT4PFGKiMO0xc12R68iak0prnl8NhxXlhNMA/ok
         TqdEl2eORONJCwaXSzbVX6+5opfMkqFX2bg4Suanx1f2o/sukhSr539FcKi9NrMNvJ8P
         ATgN5B4JdQzojpB25O0C7L+9AyuMiuw5COhMVaifY5Lh/YjB+zkSljTp2XyS1upFoIX/
         WYmw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790928957; x=1791533757; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vNMZyVK6pFlVTsgLLDPqKMJcnVZLWeRSVSS4Za1mR0k=;
        b=iyo5v88KvuQxxIIzLNsVkmp4OcbETRg3DWLDWLZPN0/mr6fYBLWi6EroTaQD7ps/v+
         lof7yu2f1DIXcK/ijp/shkJn2UJheVYfT+SOxOLVxvEY1ZNi8qQfc3feu9MhRXkfb9/o
         M5vy/H7APYvm8NP1ZSTndf7nzIyaw5kVrnx1g+vdz6heOz+hhd4E+VwaBKEKIKlbie9c
         bjSwIP+WKh/TMbTOiYouRItlUOJCh3kXWgxP0H7dhMyBwBdFQW4uwsOGynRhfPyxLrdH
         WavYOudDpzbzdRqAYLQaFKUWRrXyrEJRFA6ypWl984Rmj9urfP9auXiQSOqs4dHrSlNr
         LKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790928957; x=1791533757;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vNMZyVK6pFlVTsgLLDPqKMJcnVZLWeRSVSS4Za1mR0k=;
        b=ARN1ki+IaiQGNegxzwDnZlgfj5O3v6OsN3X2OVero7kOmIPgPqEq7YNT2uJeGJCMB0
         8jI9erKS8gQEQ2KOmcwTU1j4F4kHci3VtRQuBBoVLfDRCNXTSpn/pYp1J3Ci3QzonAIa
         sWNbckn16VLHlb38rtagLlPwF6tyfYrq9rCKiMxbeRix7dYzS9b3Jz091HA16ah4BVWs
         2/bW+6yNNH//sAukOwk1QzdZ8HKOVZx2qX4aQjqbDKCrvsXOEKxCN4oh9gIa0UzFj1tJ
         MF4MLy/fF40F9kxz4EwAiLQdxN1qlxwXPSASEIXOUO7JCHw+DQqIwO8t15rbA8oW0F+I
         NY0A==
X-Forwarded-Encrypted: i=1; AKwUvByHc6fs+oNiP6HGO7OOmL1gH3zahdtg0Nd96dyFlk2zZZro+CRtM11f0FVdT7kGCpWRBOWlQiOXT4vDQqCB@lists.linux.dev
X-Gm-Message-State: AFuF++nvcy7gVjUQC37FWCRNNsGL/KsNS28aICUdbSrAJpWu2fAtXxH5
	R5JcMmBLhYmOjIE1A/BckpublTc3r/tEldvVW59W6OQJ/J5eRWAd0VDJKQ/6tCMom75toxi3LaX
	1Hjm+lEiZWZbwdoXOX2Svq86lFV8lft0=
X-Gm-Gg: AYBFou2DeDzwJjxW7YiqlqHMILp1tvQhOj0GCFjRPs05m30iAOG/O67y7Qj2meSCPVu
	Tz7kO1jWZ+E1YLPR9OOh76OSyMXXlXpSCrbsrf2m0Jmjgf5Gt41hjDzf8Uv3M8YMWmHpzjtzt0V
	Vczy5gqEINrQ3yr2bjB69dsYcJUfZ8ucuY72ELizrSjZI94O8t/lT/6FTtPSCEzByuoSYLeQBrp
	bRI1nUgZFfIllGZvcqxx9+2cvPB2LeyF+I35qFNVETkCvlX9qZCyJe4XlK70v0+8w6e7dK0baFs
	UcUi5S8gXYCl/QnG4YNsqpYqPYmX2AO/K57ZY2OrSjev6mK1UvsvtN/j+CpM0EyrP+wJ9vm9ITz
	JcQvwa2dkYHXLbIPO5o6arnhR1aktxDTz
X-Received: by 2002:a05:6808:11c9:b0:4f4:3f10:830d with SMTP id
 5614622812f47-4f52ad8ab17mr1336623b6e.53.1790928957337; Fri, 02 Oct 2026
 01:15:57 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:15:55 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:15:55 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: mauriziocasciano7@gmail.com
Date: Fri, 2 Oct 2026 01:15:55 -0700
X-Gm-Features: AclHuK-4GMY47nLXhhsFI0FSEv_G5-9PcUD0mQlubpPu7nDgw-26z3cL3X-Fd6Q
Message-ID: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
Subject: [PATCH v8 00/15] media: Add Lenovo Yoga Book camera support
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add camera support for the Lenovo Yoga Book YB1-X91L. The tablet uses
an AtomISP ISP2401 with an OV2740 front sensor, an OV8858 rear sensor
and a WV517S rear-camera lens actuator.

The series adds the missing ACPI and bridge configuration, selects the
OV2740 link frequency through the existing IPU PCI-ID mechanism, derives
AtomISP CSI-2 timing from the sensor link frequency, enables raw Bayer
capture and adds the sensor controls and actuator driver needed by the
hardware.

Runtime validation used the same 15-patch content on the current
media_stage.git master. The final media-committers.git next rebase changes
only three source line wraps needed by the media 80-column check:

- W=1 builds and sparse builds of all eight affected objects passed both
  before and after the rebase.
- A full x86_64 Debian binary package build passed and produced kernel
  7.3.0-rc1-yogabook-media-v8-20261002-001605.
- The kernel booted on a Lenovo Yoga Book YB1-X91L with AtomISP PCI ID
  8086:22b8. OV2740 negotiated 288 MHz and OV8858 negotiated 360 MHz;
  both sensors bound and AtomISP registered two cameras.
- OV8858 digital, red and blue gains were changed during streaming and
  read back correctly. Continuous raw capture produced changing frames
  from both sensors (6/8 unique rear samples and 8/8 unique front
  samples), including front-to-rear-to-front switching without OV8858,
  I2C or CSI errors.
- Both front and rear cameras were also exercised successfully with
  Cheese.
- v4l2-compliance 1.32.0 completed 47 tests on the AtomISP capture node:
  40 succeeded and 7 failed in invalid-ioctl, multiple-open, input,
  control enumeration, stream-parameter and buffer tests. These failures
  remain a validation limitation; this series does not claim to make the
  staging AtomISP driver fully compliant.

Only the Yoga Book 19.2 MHz OV8858 path was hardware-tested; the existing
24 MHz paths received build and static-analysis coverage but were not
tested on separate hardware.

---
Changes in v8:

- Keep patch 2's commit message focused on the implementation, remove the
  invalid review Link and move runtime results to this cover letter.
- Express OV8858 frequencies with HZ_PER_MHZ/HZ_PER_KHZ, name clock
  tables by their input and link frequencies, and remove platform names
  from the sensor driver.
- Explain that V4L2 exposes standard red and blue balance controls but no
  standard green-balance control, so green remains the unity reference.
- Replace the per-sensor link-frequency override with the IPU bridge's
  existing PCI-ID matching mechanism. Add an 8086:22b8-specific OV2740
  288 MHz entry before the generic 360 MHz fallback. This removes the
  associated AtomISP hand-off patch and reduces the series to 15 patches.
- Add the introducing commit to the OV2740 group-hold fix and mark it for
  stable backporting.
- Use the documented Assisted-by tag syntax.
- Keep the padding helper as a normal static function and avoid a
  single-use raw-format descriptor structure.
- Retain Andy's Reviewed-by tags only where the corresponding patches did
  not change materially. In particular, drop the tag from the redesigned
  IPU bridge frequency patch.

v7: https://lore.kernel.org/linux-media/cover.1788360629.git.mauriziocasciano7@gmail.com/

Maurizio Casciano (15):
  media: ov8858: Extract digital gain programming
  media: ov8858: support 19.2 MHz clock and manual white balance
  media: ov2740: Use C99 initializers for ACPI IDs
  media: ov2740: Add OVTI2740 ACPI ID
  media: ov8858: Add INT3477 ACPI ID
  media: intel: ipu-bridge: Add Yoga Book camera sensors
  media: atomisp: Add Yoga Book camera configuration
  media: ov2740: support 288 MHz link frequency
  media: intel: ipu-bridge: select OV2740 frequency by IPU ID
  media: atomisp: derive CSI-2 timing from sensor link frequency
  media: ov2740: release group hold after gain write errors
  media: ov2740: add manual white balance controls
  media: atomisp: Use struct v4l2_area for padding
  media: atomisp: allow raw Bayer capture
  media: i2c: Add WV517S lens actuator driver

 MAINTAINERS                                   |   1 +
 drivers/media/i2c/Kconfig                     |  11 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/ov2740.c                    | 114 +++++++--
 drivers/media/i2c/ov8858.c                    | 221 ++++++++++++++----
 drivers/media/i2c/wv517s.c                    | 208 +++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |  13 ++
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  81 ++++---
 .../staging/media/atomisp/pci/atomisp_cmd.h   |   6 +-
 .../staging/media/atomisp/pci/atomisp_csi2.c  |  20 +-
 .../media/atomisp/pci/atomisp_csi2_bridge.c   |  19 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  32 ++-
 .../media/atomisp/pci/atomisp_subdev.c        |   4 +-
 .../media/atomisp/pci/atomisp_subdev.h        |   3 +-
 14 files changed, 605 insertions(+), 129 deletions(-)
 create mode 100644 drivers/media/i2c/wv517s.c


base-commit: 4a069a763e8a86821edac4159f7c59a20015631b

With Best Regards,
Maurizio Casciano
-- 
2.53.0

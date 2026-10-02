Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE98459AE9
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 08:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790930112; cv=pass; b=TLKljR/2cybisp2EMXsf4Pke0O5JadjuTLtV51FnVM+7+ifDeV2E+DF3FCHSyyWBlGWoOMuoyGex8pp4O0e4GrFQgFmLW05bpf3ikRSG8igtBA8zRu9wgM2S2FnNnQHXrdJS4edl7XaiiGZjpzYU9kZ4av3O9YAjYoRipVAJBZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790930112; c=relaxed/simple;
	bh=DppAKXqfuP6Qm/NxZ7m0YZf/1aabWVG+ScPkVR8a+k4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ldGCfNDHqj3R5a7WrQWsYDuhvArtSaqAeNFVIsLkb+64SB0e2ee4lcy8OmqLnmi5HtloaMUFebFbkFSLVuueFsXzanM0BuHgKdDM1hPHw8H5cuY9pR7RP1V9L6fvHX6EYeWjANOr4QDURIJKgW8cJWxTlzDvtULQ69h2ohrUTmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kUn6RHJP; arc=pass smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUn6RHJP"
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-7f4f0c89e34so5555668a34.1
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 01:35:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790930109; cv=none;
        d=google.com; s=arc-20260327;
        b=IUtTYfsb+KgJejwpbadFYFmSa4SCnqYViNDxjEpH2Li9r9mt+E0H/t5xQOiBJxfSPc
         xmPseQGqV4Mznr4c6O63pSuC8XOlujZRxLL7hyXxk20Slkt1A+1YR6fY63m02Al6rImN
         dYCdGjKWdvsEqwWzUqWmBSFsDATDmHdxnYiR3ovTm+90AaOYFswk745CwKrbuuaaLWU5
         phUcin6JOb1Rs+leuk7MqRKg/4OhgxcOzf2Goqmgi9E6YdeDuW25Hs7x2tqa1tkdtPzY
         j2z33F/+QLra13B5+ZM4FswmGK6Jglzn/OrEudGZrSFWwVmnBqb6du699hUqkSUfnN1Y
         IHeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=JCwynQzQS8MrwMM0VoK+Vs1Cqa3o1VYlWRD5LT6E08U=;
        fh=As8evhZMrbRUSnKOfGo8WtQS2pXj2dSj/L7xbRW6Q1E=;
        b=Y540BaTr2jI5jZ4EOMBNSZfXnTKOFMMlDpZpTtG6e9EfpyH80QiROkVBM0GjQQPMvu
         CbG1U7zf5w7rD3WvfRTJQa/fq3Sibv0efPZ4+tI44wGR3KdPPYrn6EgA8Cl0aq9nw8zB
         G67Sqwsq7jc53WxMHKI0mGP7O97tGjP0z8wa76BEMkjXOam+dqOIJz+vCuXtYgB73HNz
         WfdyvE7PGPMaExHc7f85sIN4gqYzUXVG+ORzFuEF/LHzV7s/5bDlncHP8c8RUn3vY9oS
         cJLEGduDwxBaaIo7sWGjyCS1gu+W41RBkoD+sTPLfmn36mXxT+HDZ7OwdPui+Zc9WWC1
         k98g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790930109; x=1791534909; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JCwynQzQS8MrwMM0VoK+Vs1Cqa3o1VYlWRD5LT6E08U=;
        b=kUn6RHJPQGzDpT6VBwwqh5aLaOJyJmmAd3GpjfG4FfIWcjvTvBxaFx79qkilP6IkSA
         h6mQc/kjo+dDA2kyhRsfBckBdu2kceSkNUv3QcnEgC08uE6sRtmerCLk7R1rSBnAJ8aZ
         ho5Q86H0gHWQZc/S5qvBeakPVooLVYJEW73uzhOdxf5wQsDl/KWbACYIaS8T7b6dUpvU
         hzHVazNfCmh/X2x6jjev94z908YfRq7eOp1+MowCi2vWfJhADHvB/LZnQ6Ya7XyB8IkW
         weznqvccDABSqytlLGb1N0a40IuuN3XIcMbZeGQK4QfM0WCLfX3X0au9+XhigLS9ihAT
         fKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790930109; x=1791534909;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JCwynQzQS8MrwMM0VoK+Vs1Cqa3o1VYlWRD5LT6E08U=;
        b=xpuVSP1FZ9E6/rDswoIBljrgoUPHX9qMw47p4fAWp+laEdASPu+dni78QEKxnT9VLy
         lWf6rp3YfXNOxp95bHu0DQSfWDO3KTLxobpBfhKtb3xZZg+dzw1NtT3QhbXlkFzxih10
         sNc/TbqReIQT9Jtu6rT4e7M9Au8l3Rd3UOdj4xoOW/ye6CiQEEu7elMcgKo1j+WPkzm2
         Nz5FEZyeFzWP4fsmcNWq1ZwqRqn9ApMrEsc5yBc5JBMwVsEtuiWvtW6x2R5VgvTWue6p
         peOyj9pyPZLZikQY4R2LzKlePnk9nOcPd01Sy8DzaI9gwfU11qIZqh4pCi/ceZ/7aQ2P
         cCcg==
X-Forwarded-Encrypted: i=1; AKwUvBzxffbT/6/uKaO1sa66TDpVzARZjgnnbzoWJQM26BrN8lzWuA5iYQJXZga88Tj7vNiX/Go3ZRe5fPuj+ZMK@lists.linux.dev
X-Gm-Message-State: AFuF++layG4F2QfxIaS9LL9mVk76h0ep6xfGarTwWC8GyypQtp24iijo
	aLAd26xaD4YsIoTHuHHqfYU4K6L4jo6iY/ikrnTc8iscjOxVUziFRxTyu5cMvegTOZ7BO2ZM1/0
	+KwOh6aCDzC4JFYHuiiDPFkAmVYkyylQ=
X-Gm-Gg: AYBFou1mCGUIW7O/TH8pLs+qsB54/dV7JdXlBitUVGUR2ZWNRU76abwB7HF/8BplVL6
	lhfUscWjT0kjtLgiczdNlL5FpNFC2EGwSJ24b+R/xqH+JGGIYoJdX+jUgXQi/Xnnwx2uLfUkfze
	8oTIaY6A3BrUXRiVaQbsf4iblnRiKz1CDyqFshuBw8mY8SaN1dd+s+m+QgT+LZts/WGsDrPv47a
	7Hcs6+cQjNpun03YEDsbullNd7oqQgfXtGipMk6oEQ7WyTC3PzgFTOl/EEThEKRsa4M4KXRFJes
	k2S/UrmCwTcB8s/APedFdUjwceepcOMxwwRTELYDrgNsq36ElA43oK6Yrsn7ENNG24HngGCZvqA
	d0WEFbYk/OstnUXvybFX+50hH8cRC1JStsg==
X-Received: by 2002:a05:6820:80c5:b0:6b7:46fa:1692 with SMTP id
 006d021491bc7-6df3448d782mr1629749eaf.39.1790930109359; Fri, 02 Oct 2026
 01:35:09 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:35:07 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:35:07 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
Date: Fri, 2 Oct 2026 01:35:07 -0700
X-Gm-Features: AclHuK_lIzkwVUGNC0A466c6EgUohcqWHY2f_jeQHwqYNNU_2ok-f3xdMwKP4tE
Message-ID: <CAO7O_xjhrLNFu6sKEFWp8z+UCkcHu9kr9KfxtEQ=T9yKHCQT-w@mail.gmail.com>
Subject: [PATCH v9 00/15] media: Add Lenovo Yoga Book camera support
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

Runtime validation used the same functional 15-patch content on the
current media_stage.git master. The final media-committers.git next rebase
and review edits only change source formatting and equivalent frequency
notation:

- W=1 builds and sparse builds of all eight affected objects passed after
  the rebase. The OV8858 object passed both again after the v9 review
  edits.
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
Changes in v9:

- Express both OV8858 input-clock rates with HZ_PER_KHZ.
- Drop trailing commas from the terminators of all four new OV8858 clock
  register tables.
- Resend the series because the v8 mail transport wrapped patch lines and
  produced patches that do not apply. There are no functional changes from
  v8.

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

v8 (transport-corrupted):
https://lore.kernel.org/linux-media/CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com/
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

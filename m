Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB256345CAB
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 08:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929062; cv=pass; b=SgsgO1O3zBZn8E4hMJQsIO4DrxwURl9d7Guf0Yr09L1BuPS9zsFp+WurFm/0E3ts53CcV0FqbpDd4N/u+d9X/81cVndEelVU3evhtcdNsa/U6CjIMXigexCmIoy4d2Fl4dRzKvdOP1EwCAYb5R87iWdNnOVR4G+tZt+ROa5iv/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929062; c=relaxed/simple;
	bh=2bMtA8WGuflkTB3SvRCnRQIgbTN4Dee/qsspXxo1/P4=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KFpG1yE54EQ94mH2WCYqT7iG3GRNXtnusHGkogETsm3R3AvytQMZJOJmMueGRgMUbdpQOmH7vm970yx7xpvXeiZwAPxqSDuczbqWZFhp2HIM12IxVKZicl0tuaM+ywr5qlcN+8XHJ++p7sa/XlCgi3QsRusOcL4fssAHdXQqw2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aDB8cfmd; arc=pass smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aDB8cfmd"
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-805cc8b4231so5016532a34.2
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 01:17:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929059; cv=none;
        d=google.com; s=arc-20260327;
        b=XLvRelF2igtw6cAdssilsERyaL3p5SP4/FDjoykkYU/DAzw+/RB2ay/R/xmz2/0Klx
         XalLMF2NGSpNnjeo7ZdYV5hYuoNeU3LBQQM+SyKl6b8/FHb6gbizCo1RhXlcS/4b2JMZ
         tX+Dh2wqVXN7g9vSyNEJgvZFekmDyhZZTL6pYhDuHvbs72huK55PIBzp+Gi21mds8Pr2
         cfWblOJPEl41P5GkMxE3GFyXXbVjQsn6WRzx9DzVL6E38LdgTxz7dL7q4BUjrwtYuWYY
         syexojlknm99xR9JlUIt0U5ftOrSTEkzHjP85exzKvg6uhMcKBvlZ3ZL+mFvw5o7f5Mm
         BUTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=M+1E7PWa67rGnSkrRiBVOgb+aRHknlv9AJM5+4lGxFU=;
        fh=W0dltSre1iqDSzypmwCNOvJmpFshU00JfZw1s5nj0/s=;
        b=Ii4cMVa/sNl8u6FLmqaqxu62dYjRJ8yEYb+2RvuSG+xyM7lM66wRdyWiZkddLFgKOU
         2MkbLL5SLdtqATBuGzc4Awncgya+4nKM25n/VK5JCmDEZCvdmsa55VU7J+LT33szzp6c
         JXCq1r+Ap5zV1opcVBYYIbsicuXGeocyij5SNbdxX7KrRZBw9ng0LV4LUBYpJ9Q57j/N
         01LZnwTQ0ijGkY7eYN9dY6E/hPkgxEJrtiLxmB0EDBuzm+prd5Uqw1nFSo0h6DX+Jtu9
         Ww4u1S++Ay9CBD0VOuDduNnHnWt6z9bprP1/Rhl/TdiBsW6QT1TB1IFQmi/QWOY3XnMd
         6GRg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929059; x=1791533859; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M+1E7PWa67rGnSkrRiBVOgb+aRHknlv9AJM5+4lGxFU=;
        b=aDB8cfmdXsqDTAcVfKecSFwmPjcv+P/KfRPsnyOTpKI3u6gqUe+4+/zlYNqbXRnr7V
         2LBXJouMq9c9KjdQsl8GAFobwp++O4/lqVLKwqIIx8K+Ozh/iTGkn7XG+Emlk8bSy64Z
         uweKa3mcKgs1stsW+ukA7oIP7VG2ReG2/Po1q2FZSqKv6Nf0zHXsnB2R/Lb4QshdxgAq
         c1A8CjanqwWK1sPod9EGqUbcjWLUm+mTA54bGyqh0xiz8iYRrHKT3mB9qniBDuDZoiIT
         J0kD9tEsqSUlWzeT+y+SPS4dbkdaXm5exMp/xerGCE5RPdkipO7+2rr9xJx87o95B4Fm
         oSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929059; x=1791533859;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M+1E7PWa67rGnSkrRiBVOgb+aRHknlv9AJM5+4lGxFU=;
        b=A1OwVo7smjp7xCX5pTjzx1KAAGJu88NPaxtvUH9pP+8NOEfXb5/pcfuZgMIqRJX7V6
         m849aIFRsq5HHSn1Cb5MDyG1kg1vjDE2XDdxdETQCH9ePoFiAKg8rSGELjD0ISPeGY3q
         jdkjPMkEzhoP0MqyM9cwhCBVN3SjAcpADipE9/mGjJKz7ukQzw6AhE1Isl+pB7iS/aDk
         AJe8ohvwTSyc5UA1ITyD06TuaGBXlmIbEKBlBPUe7rct3qKXok9KHuXn89F5GRit5J+V
         hFKDF78lRGHTAnQ35pKgJ/vADZxz0B0eu0unyAPJfgLJCnspr6RME0cqkyFiYE39+yzm
         a/AA==
X-Forwarded-Encrypted: i=1; AKwUvBw8ATFFvYuaxsonFkHTppjuAKn6TBhZimSnldKh5gS0rTmwDLpvPENhA4o50zaZ0Dh4RWc5ZTZuRIMr5R33@lists.linux.dev
X-Gm-Message-State: AFuF++lqppvjyOg0XIWKIJkYTKSWDsKdVnZF60xXk20Kgm6r2s0BsYgV
	kwrwS/IrK4Z9DBu+CMvlKoKH6jS1mUTjCqlFQanE8b+ZEW5UzpNhT3WTtlz2rzcZATmRNPoKc8C
	d3aujgWJ19f9PmhEBz+cmnVQzV4FjMBk=
X-Gm-Gg: AYBFou1pSGCAz/MUBPSvB4qI87+bnmmYaqb0navKjlEhX6UZppUip8HHDMZmKJJrtNj
	fom0rz4HIHjeWLJzeCiT7PccnNwxzrh6IDSjZyWGITuSBnsth+fWjm95uVgHx8IfZcPgZiMpMM/
	EkuZvxDOC9/RjtUZA5H3IJihQmG6Gdu2Sf8h8OXBy5FPo2F2A3mbKOyF1IZ2oZFnT36KrFVWJ1d
	dTsCgQ77cQSQW1a63ISiscSG6mN7qXcrJmiyw2kxpbsY+ueiqiUXBlGh2onzHCS4DGajDDJNoCy
	a2vTS2BtBxa71D/dgEc9X4ysind9OXKKSsZC2BTZGf5EFWTWHnf936FKvcdKSIEnp0Jr5R0Ef7C
	sv6l5+MANNq9Y5EDtTuO2VBxK13AL1aOZ
X-Received: by 2002:a05:6820:3388:20b0:6d9:1925:1c13 with SMTP id
 006d021491bc7-6df34480c56mr1208645eaf.52.1790929059528; Fri, 02 Oct 2026
 01:17:39 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:17:37 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:17:37 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: mauriziocasciano7@gmail.com
In-Reply-To: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
Date: Fri, 2 Oct 2026 01:17:37 -0700
X-Gm-Features: AclHuK_WmvR0Tnpx5XYH1S9QMp6yihhTqyMrupidHb-L_FKblip9CEUzcfe3aAs
Message-ID: <CAO7O_xg5+dYPXCmtzT_aUrti+hWywZyxCMn0S=yxzLarZvor2g@mail.gmail.com>
Subject: [PATCH v8 06/15] media: intel: ipu-bridge: Add Yoga Book camera sensors
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The Yoga Book YB1-X91 uses INT3477 for its OV8858 rear sensor and
OVTI2740 for its OV2740 front sensor. Add link frequencies consumed by
the sensor drivers when the IPU bridge constructs software endpoints.

This supplies endpoint data only; it does not establish that either
sensor can stream on the Yoga Book hardware.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c
b/drivers/media/pci/intel/ipu-bridge.c
index 8bd20089636e..62852fe1a406 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -78,6 +78,8 @@ static const struct ipu_sensor_config
ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
 	/* Omnivision OV2740 */
 	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
+	/* Omnivision OV8858 */
+	IPU_SENSOR_CONFIG("INT3477", 1, 360000000),
 	/* Omnivision OV5670 */
 	IPU_SENSOR_CONFIG("INT3479", 1, 422400000),
 	/* Omnivision OV8865 */
@@ -109,6 +111,8 @@ static const struct ipu_sensor_config
ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
+	/* Omnivision OV2740 */
+	IPU_SENSOR_CONFIG("OVTI2740", 1, 360000000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
 	/* Omnivision OV5693 */
-- 
2.53.0



On Fri, 02 Oct 2026 01:15:55 -0700, mauriziocasciano7@gmail.com wrote:
> Add camera support for the Lenovo Yoga Book YB1-X91L. The tablet uses
> an AtomISP ISP2401 with an OV2740 front sensor, an OV8858 rear sensor
> and a WV517S rear-camera lens actuator.
>
> The series adds the missing ACPI and bridge configuration, selects the
> OV2740 link frequency through the existing IPU PCI-ID mechanism, derives
> AtomISP CSI-2 timing from the sensor link frequency, enables raw Bayer
> capture and adds the sensor controls and actuator driver needed by the
> hardware.
>
> Runtime validation used the same 15-patch content on the current
> media_stage.git master. The final media-committers.git next rebase changes
> only three source line wraps needed by the media 80-column check:
>
> - W=1 builds and sparse builds of all eight affected objects passed both
>   before and after the rebase.
> - A full x86_64 Debian binary package build passed and produced kernel
>   7.3.0-rc1-yogabook-media-v8-20261002-001605.
> - The kernel booted on a Lenovo Yoga Book YB1-X91L with AtomISP PCI ID
>   8086:22b8. OV2740 negotiated 288 MHz and OV8858 negotiated 360 MHz;
>   both sensors bound and AtomISP registered two cameras.
> - OV8858 digital, red and blue gains were changed during streaming and
>   read back correctly. Continuous raw capture produced changing frames
>   from both sensors (6/8 unique rear samples and 8/8 unique front
>   samples), including front-to-rear-to-front switching without OV8858,
>   I2C or CSI errors.
> - Both front and rear cameras were also exercised successfully with
>   Cheese.
> - v4l2-compliance 1.32.0 completed 47 tests on the AtomISP capture node:
>   40 succeeded and 7 failed in invalid-ioctl, multiple-open, input,
>   control enumeration, stream-parameter and buffer tests. These failures
>   remain a validation limitation; this series does not claim to make the
>   staging AtomISP driver fully compliant.
>
> Only the Yoga Book 19.2 MHz OV8858 path was hardware-tested; the existing
> 24 MHz paths received build and static-analysis coverage but were not
> tested on separate hardware.
>
> ---
> Changes in v8:
>
> - Keep patch 2's commit message focused on the implementation, remove the
>   invalid review Link and move runtime results to this cover letter.
> - Express OV8858 frequencies with HZ_PER_MHZ/HZ_PER_KHZ, name clock
>   tables by their input and link frequencies, and remove platform names
>   from the sensor driver.
> - Explain that V4L2 exposes standard red and blue balance controls but no
>   standard green-balance control, so green remains the unity reference.
> - Replace the per-sensor link-frequency override with the IPU bridge's
>   existing PCI-ID matching mechanism. Add an 8086:22b8-specific OV2740
>   288 MHz entry before the generic 360 MHz fallback. This removes the
>   associated AtomISP hand-off patch and reduces the series to 15 patches.
> - Add the introducing commit to the OV2740 group-hold fix and mark it for
>   stable backporting.
> - Use the documented Assisted-by tag syntax.
> - Keep the padding helper as a normal static function and avoid a
>   single-use raw-format descriptor structure.
> - Retain Andy's Reviewed-by tags only where the corresponding patches did
>   not change materially. In particular, drop the tag from the redesigned
>   IPU bridge frequency patch.
>
> v7: https://lore.kernel.org/linux-media/cover.1788360629.git.mauriziocasciano7@gmail.com/
>
> Maurizio Casciano (15):
>   media: ov8858: Extract digital gain programming
>   media: ov8858: support 19.2 MHz clock and manual white balance
>   media: ov2740: Use C99 initializers for ACPI IDs
>   media: ov2740: Add OVTI2740 ACPI ID
>   media: ov8858: Add INT3477 ACPI ID
>   media: intel: ipu-bridge: Add Yoga Book camera sensors
>   media: atomisp: Add Yoga Book camera configuration
>   media: ov2740: support 288 MHz link frequency
>   media: intel: ipu-bridge: select OV2740 frequency by IPU ID
>   media: atomisp: derive CSI-2 timing from sensor link frequency
>   media: ov2740: release group hold after gain write errors
>   media: ov2740: add manual white balance controls
>   media: atomisp: Use struct v4l2_area for padding
>   media: atomisp: allow raw Bayer capture
>   media: i2c: Add WV517S lens actuator driver
>
>  MAINTAINERS                                   |   1 +
>  drivers/media/i2c/Kconfig                     |  11 +
>  drivers/media/i2c/Makefile                    |   1 +
>  drivers/media/i2c/ov2740.c                    | 114 +++++++--
>  drivers/media/i2c/ov8858.c                    | 221 ++++++++++++++----
>  drivers/media/i2c/wv517s.c                    | 208 +++++++++++++++++
>  drivers/media/pci/intel/ipu-bridge.c          |  13 ++
>  .../staging/media/atomisp/pci/atomisp_cmd.c   |  81 ++++---
>  .../staging/media/atomisp/pci/atomisp_cmd.h   |   6 +-
>  .../staging/media/atomisp/pci/atomisp_csi2.c  |  20 +-
>  .../media/atomisp/pci/atomisp_csi2_bridge.c   |  19 +-
>  .../staging/media/atomisp/pci/atomisp_ioctl.c |  32 ++-
>  .../media/atomisp/pci/atomisp_subdev.c        |   4 +-
>  .../media/atomisp/pci/atomisp_subdev.h        |   3 +-
>  14 files changed, 605 insertions(+), 129 deletions(-)
>  create mode 100644 drivers/media/i2c/wv517s.c
>
>
> base-commit: 4a069a763e8a86821edac4159f7c59a20015631b
>
> With Best Regards,
> Maurizio Casciano
> --
> 2.53.0

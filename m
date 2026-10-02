Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6AD3559D6
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 08:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929091; cv=pass; b=MxKWAHxcy85A6iVIrO9BBRtPPIdFIBlVKCf+9NWtXEqUBaRk2HRJgthpSCZRB1TQK2cPd6MShF0vPWv3NJVygd9cbJUXg59zP3C5eS6rgOmAPwNmsscoZQ6CPxRjFljKxPEWgP1JqQ3zzW2J7hWvOeRLtUhqTh8pS/UWuh1/zuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929091; c=relaxed/simple;
	bh=LJKFHSTiUvLAjJ/VIXM6YPJb+Zc8LgEWzbj49x57W1E=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iFxxXqEjxcgjOGft3uzGRm6ClWASSoFb0rNRxd/ronUGOiqkKNzqRc0s4rR5NmG6MkO66WH7mI34rfbJS74Fjj5oe3qWepFK+fB01aNw5tf6pm0dN04J2fttl57rad5CbbNXzFF4zso7C5bAhRfT+FGxGan/Bxu+5UZnCfdMNvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rPwO+jax; arc=pass smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rPwO+jax"
Received: by mail-oo2-f40.google.com with SMTP id 006d021491bc7-6df4f4174feso114293eaf.0
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 01:18:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929087; cv=none;
        d=google.com; s=arc-20260327;
        b=NPttPzymY0Wan0p+8ahDartuvTmSjzK1+7HBSMAeuQ2vwCL0ghhYAgl2Yxntc2KVBi
         6xdkMLEBryQN0gZrDN8NwiLM+yIqGc1KB9MzQ9gU8sio2b/GLd9WLrpiVd7kot6OfbCm
         NABXZAHEFCbFNHzx3YYjXDfBVM5EECgRWi9Xj0cH3mpKsdFgJdAWu4+dey7e5/gSokL6
         ZpGBNd9FiR8Ob2J1WEcm7pmmBbtoHBBTpqVfKqlOlZb0agna/z+w6bZ1QBD0BeWb1yRX
         2RNjsxyXBN+9BAeqaq0ZQ+Svme7qEtCpSyT04IUFLZ8anP5H1Izf1+wcxDho4O2YB850
         wS0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=v0dU3KDoaUwlcRWe6yD69OiYZX3sEVsHkRy8Aa+hH+U=;
        fh=i2oezqnsPNStgqy3Rqf6OZJZUMNcYUYUlf+LYzmUMmE=;
        b=LYI4HNqDEPuWa6gB31r6DxYGojS12YnXvthAiSK4qJiM8IGoiMYnJFQ8SCkxhS7Kjh
         onzsIb/A96duVJVLzGWnDiVPlDXUeB9N3SCDppTLsg5U0o0JMDGtJkM36SmI7mKUbNMy
         G1VYaVY89eCpXOZTrQwRrC7TNdqKgEqOPyDeBHUgLmqdYdOi/A2xGD7F72i43gVGeca5
         gIh0NUOUuhP0L1PVI90+TgHZvGYnzQpME/SQXh4hnDYX40VCn1qafkRvX2ivtEhjTGoC
         1pEhbesYrq6VZ121TYvrxA/GGO6OtCAa0iURMs6Im2Kb0kkgAuugbG7f7wOmmqFUOEkq
         /pDQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929087; x=1791533887; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v0dU3KDoaUwlcRWe6yD69OiYZX3sEVsHkRy8Aa+hH+U=;
        b=rPwO+jax7dE3aEkBBzJNXJKx6stbbZQJW+bpHFod79bmzPujk4WuHnshhagOTJL8b2
         8Huuz1Inunsc3fo0Un3y91xnjQ7hE2gWuJ4LVmw57Om6HJjKzsv9KkJ804cdxVZs2xqs
         9UAtWtZ+/A9bXfGZcgC9x2PNHrLYJyusOhu0G3voYwVnYCUQKF/0X6oXNyml+YDLjnj8
         1i/QreWyMvsLrcJlAExTgZ9CnAjFtY2bdMMBCYkI2tN8c1jr11TzSdeJ51yPace5AYoO
         Dk8nnh/NyRs5CIij4HmQXRxMqHOlSNnTdZL5ndtv5k+e+jZ1cVzi1ecckeh0jSSssClX
         woYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929087; x=1791533887;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v0dU3KDoaUwlcRWe6yD69OiYZX3sEVsHkRy8Aa+hH+U=;
        b=Zi1IIXXANUpojsazEv1z7Oq0hbG/45EiOguPr5NXgj/xD67tDjtd2DIz50vgG6ObMU
         UUF3Hdraoh3RtYbsyVeK85Dw8V0TUDKtHBNBIzXFTX6EDhVrkf1KzgsoIdzqt+pBeOXD
         6d8Mk9KjRFuQT16DUMGM1zAvwwEIx9I+vL0OOeS0AK9ZzVSJXsiubepHvizCmBzX6eId
         rE8kwiJiHGwudKI/Qtx54q++nRQkNtE9kRNpKx4BKWhGYPTZ5IPmXydEt0yJKnWhJT35
         uUYB2P/YKg5RST234ye10sAkdyECPX24h91RoiOlNlR09UqdfYbrzxRbdi/5aWSgrn3X
         WHhA==
X-Forwarded-Encrypted: i=1; AKwUvBwbqvtfLl/Q3cZs2YONOFR0F8jPMTO+5w05McSCH7sEVPDWHeqLKcwgfv18qvM+GiuOBJrR7gPHbdEVaY6H@lists.linux.dev
X-Gm-Message-State: AFuF++naiyH9fg0FOrSLnNlmCJKCWijGg0X2tMPuOzpocO3BeZ2lSdaF
	Flf8bJF+IsR4YvBnI6oNuFHFHuy2AkOnBdIdJ3OqVPbMhyAvRytL7zQsLRtrHjUcdh18YAiGdUb
	YXVEkFcqdp9kcQF8fPfVX4IVx5RVKQxE=
X-Gm-Gg: AYBFou3SrLQiCnuuUJgqjZqOvYcY1mbydc2e1jxgjZJkNEUazBIUvEH3+78s/VgbaIX
	B4ACYT5qb/ywj19A78AeowVXYQ7yc/ZvWCWb6NsIyDzZZb2ZwdpSbfsDXl/HAwRw6rxevb9J8RV
	ypsgVmKsykxiz3btC/OTKW1VhnztWCj2AknA/mHvYZDNaaGkRoMm/gwLYESVgfNNcdQ1wapqE93
	UY2Xqd0/b/VyUYCFD6g3KJRG6j2SddjXKA/Ds8k86UNDSrRcB7Svtwz7T/cwCnnN48K1g8swyGv
	MuUsAFLG+BBvqqY87TM0s/PRF6viNJnO3PB62Y4oZ5YAvXYcFddVsywmhEPH8+KQJHRA2qFyK9o
	FxN+lHw8dc+mTE4bolhJGJTnsszJPl1Ttpw==
X-Received: by 2002:a05:6820:4b82:b0:6de:66e3:a1da with SMTP id
 006d021491bc7-6df34e6e7b8mr1524663eaf.50.1790929086699; Fri, 02 Oct 2026
 01:18:06 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:18:06 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:18:05 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: mauriziocasciano7@gmail.com
In-Reply-To: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
Date: Fri, 2 Oct 2026 01:18:05 -0700
X-Gm-Features: AclHuK88D0NKLwKndTFmgE2vFrp8ERoNDOCao5xUibVGg-27A_K-DelGF2nwZkU
Message-ID: <CAO7O_xgAyCn=PeaEzoYqbe1F45C-hFsXKG2QbVWV5DUZMyv_DA@mail.gmail.com>
Subject: [PATCH v8 09/15] media: intel: ipu-bridge: select OV2740 frequency by
 IPU ID
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The OV2740 connected to the Cherry Trail AtomISP uses a 288 MHz link,
while the generic OVTI2740 configuration uses 360 MHz.

Use the bridge's existing PCI-device matching mechanism to add a
Cherry Trail-specific OVTI2740 entry before the generic fallback. This
keeps the platform distinction in the bridge and avoids adding a second
per-sensor link-frequency override path.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM
---
 drivers/media/pci/intel/ipu-bridge.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c
b/drivers/media/pci/intel/ipu-bridge.c
index 62852fe1a406..1a133194cbc0 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -21,6 +21,8 @@

 #define ADEV_DEV(adev) ACPI_PTR(&((adev)->dev))

+#define PCI_DEVICE_ID_INTEL_ATOMISP_CHT	0x22b8
+
 /*
  * 92335fcf-3203-4472-af93-7b4453ac29da
  *
@@ -58,6 +60,11 @@ static const u16 ipu6_ov5693_ncont_clk[] = {
 	0
 };

+static const u16 atomisp_cht_pci_ids[] = {
+	PCI_DEVICE_ID_INTEL_ATOMISP_CHT,
+	0
+};
+
 static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	/* Himax HM1092 */
 	IPU_SENSOR_CONFIG("HIMX1092", 2, 180000000, 180480000),
@@ -112,6 +119,8 @@ static const struct ipu_sensor_config
ipu_supported_sensors[] = {
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
 	/* Omnivision OV2740 */
+	IPU_SENSOR_CONFIG_MATCH_FL("OVTI2740", atomisp_cht_pci_ids, 0,
+				   1, 288000000),
 	IPU_SENSOR_CONFIG("OVTI2740", 1, 360000000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
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

Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1D831716A
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 08:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929071; cv=pass; b=YCxdh94f6gNfnkcLmz+D4gnCwUJisfNrCq2KTykMJm7hE10NPIEJTYXS2msCcObNvM+H+sH5qlD8HGmMUpHe8/Crl3kKZsXJL3oZI43gTw5fQcvV4r078EHEqaXLp414Ew2A+q+xjTFo6AnRJWi+0jnhW1Z6SeO01XGox3kNofc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929071; c=relaxed/simple;
	bh=b7u6ms5Kn41L+dhwtIf0hPmwp8vzNweXFMOb2u0yicw=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e2cwULrFsQvRbjtDBuC2epIoLy7+dic1+uSjHBif+FagQfGenZIZU0YR5cOsVaAhtyIHBUA5pFCCpEnFVViENKoJqKSwW9Uv2bHmejNbKmbGUsFE3T7I6erAAtF1sL7JM+DExRGwjjMypco7Z6PM8AMyJaC017rogEfR/5nnT9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCx6IKD3; arc=pass smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCx6IKD3"
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-7f4f0c89e34so5543172a34.1
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 01:17:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929068; cv=none;
        d=google.com; s=arc-20260327;
        b=pIJ2GZK9z94uSPuf3dI6D7YpNYqszS+efFmHM7HDZrtQenqLwY70+ltMYcaTIgWNi0
         QsFZYyHLobUbdzA3L6GogQxgdza5ZuqbGmIBCxKWQQ0pvzTvsq8w72aPqe0R3elh3UQv
         lYCyXNdfaAYk8U3qLhjsABp/+yypBUOBz3ag9mhrT+hTLS3rE1lgAwYZ2zyUvWA9yn0t
         2Kb12s77vNpRuK+Zw55uz7lCHFnZb4dbZghY6JoeY1PfCrjHO5+CvTZWwp2Bqj42th6j
         uF0HUGWGplqe0+4hFaQ1sQk0Dizssoi8dxLoEFZHUJQbw0KYsAJfEWGYG8HrsohBxSEu
         S5xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=qoH/7SdQ8OfbpSRw3KkFi+BkVsoYo5VaXFwLNXgWpzo=;
        fh=fqFbuO4RYcaqebZDGU6Dn5lLL/4Mpb7YUpYW+Jmuvs0=;
        b=J/QZ/CAeYwn9l2qmWI46x14iF3Gm5AMrzPduUaTnuqtNHtzh6KUrHch7fIpCjMgYA0
         x/5wKAEh3iwXkY0Eev0sw6OII0WtmrxvjwfoKgKjnzdKwiPlDpJM7i/ahcDlVZbK0tgr
         Qnh/422q/Chzct0uOl6UyO3CvgvBo7bzyOJ792Po0/USZ3g2yRI9t9AbV7l7bRQj33Ei
         3GbibnHYSPDaql25oYu6PmJ1pNUb3nHpa26WFYKZcDDwftJoA1XyHGfVmp50OdAmizm9
         stZvZlJJiVLIrcRx/CpCO8HXr6rcMc9hWNdPyIm7nMbpR5jDWCCJGzo6w3P72/+8gkZe
         7xrA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929068; x=1791533868; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qoH/7SdQ8OfbpSRw3KkFi+BkVsoYo5VaXFwLNXgWpzo=;
        b=GCx6IKD3pJnF1Sil610dlF63betGp76Osh0KykHyZXfrV9tyYfKVf8q+fQeTag1sQi
         RuBh9dH8z87tr/Fzxq87Iwv/oIyypwpt79oW/jI+x0EKdn9PlN7baROYpWq4GnM3f4Rx
         nLd/Hl82Czgdo64ovAYB6PUWku6HO0jNAGf/muSabSTGh1ikrOLPl5asBdELNEfNIENm
         u5uMSLXB62WMEAuO+vCwoFtOpWIJTBEhaRF8EXGRqfjW/N4vbYpsqlD6dgM7SqFI5M8A
         ivFZes1oPnMDxjSoNsC3S702pHCk1H0AeUEEcI/VQUYHrzxj3/lRDjRV/94VsTPF8jpX
         2iOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929068; x=1791533868;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qoH/7SdQ8OfbpSRw3KkFi+BkVsoYo5VaXFwLNXgWpzo=;
        b=BuILXjUkUVWqqwJjHjiLS0mqtbwUv4HY0vJkJPyNEqbdIGDvI7ItLkwXmW9qDANbI9
         q727gt2+OoWe9kGWozvQdnre5OoCtDZGiiMnTPk/gEnHE2+K9hEtK8t3/yuOkqv7TlU+
         gcKgLye+nEo4qqTJAXhaAJhzSMxhQCQpAjgk0p+9jhp8CUyjuWno1ZQ86vFE/ZnCAupP
         1+RE7VoEHMLfo+nm6/H4v0vl0mc2VSRSoi6PDF9uA0Cc2Hf0vas75L8SlB7HatCAO59/
         wSo2Xv4S6SCtDNY40HM9kQlJZFWHBKYm1wYEyTkBEnStFrjVlvCnWjFJhed3ThVjNwwe
         W5eQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5lxcB/7wvPvX+07xQmhpd5GJjP9WQIsMO9CYRx2B1+ymwhocuIh+ePXSuIjp9T55yJbGDxQXSkLBPeJ6J@lists.linux.dev
X-Gm-Message-State: AFuF++me4W0GpoyNkIl+KGTv2ZoUOYV3cnO3tcXLzNPHG9PQWIrUzjiY
	do4Hp7rMFJd0N+p++JRBX2W2LMzFvQ5aIb54NsQzCGQDKsmNV0gN7lvRpgjxibPyA7tjvp7G6Aw
	dkDoi3EcHTGt9xmi60YYSmsE/MwEzyaQ=
X-Gm-Gg: AYBFou0hj3svdtHqOT/wVwzJeXXegib9OQDzRFLoNtywZhEcU0KrNYx1K9ztKdHr7V+
	czKikO6FKmJhR/Ic8esJGPTouRHICEXytOZzERyvHb9Y9MLJo6lEJFGzyBy9lUOXhr6Qaxk4AbW
	QfG0yzOZIchBz+cIrTA3BKpgd+LtUm/eja0L2uOo8Yx8lPIKpI2ikjgjU8s6eiFjNXz2GWdM77n
	HLjDhYBzVPn8e0+PJQA9i3VQOKewYSb98l23riyaOsqaRBe29mghgsnjtGKKghHLEz9TXP8X2Ej
	kkccU9M2iIDBURBMYzEneEe5KmuhO3BVh3WKD6QOOFIrXndHgYU0xjVJTWXzIv3VnqF+bFK37nu
	SVutFAQtnd9de64GW+E3J+IulAo9FifwU
X-Received: by 2002:a05:6820:1527:b0:6c3:2390:c293 with SMTP id
 006d021491bc7-6df341909bemr1497792eaf.32.1790929068351; Fri, 02 Oct 2026
 01:17:48 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:17:47 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:17:47 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: mauriziocasciano7@gmail.com
In-Reply-To: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
Date: Fri, 2 Oct 2026 01:17:47 -0700
X-Gm-Features: AclHuK94sf6-8POpQCO1mj6Jk4Vhv0wy6XkoJiDnIey6glgtlnk02WmTfcpubNw
Message-ID: <CAO7O_xjcyeJcY060STXqG53nsLaKdhxeeHEHDUXbp8Wvj6OA1A@mail.gmail.com>
Subject: [PATCH v8 07/15] media: atomisp: Add Yoga Book camera configuration
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The Yoga Book YB1-X91 firmware lacks usable AtomISP configuration for
both cameras. Rear INT3477 OV8858 uses four CSI-2 lanes and a WV517S
actuator, while the front OVTI2740 firmware reports the wrong lane
count.

Add the rear sensor configuration and a DMI-scoped two-lane override
for OVTI2740:00. Add the front sensor configuration separately once
its link frequency can be supplied at the same time.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 .../media/atomisp/pci/atomisp_csi2_bridge.c   | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index cca91c6d71a5..56da454f0d9e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -74,6 +74,12 @@ static struct gmin_cfg_var lenovo_ideapad_miix_310_vars[] = {
 	{}
 };

+static struct gmin_cfg_var lenovo_yogabook_x91_vars[] = {
+	/* The vendor driver and sensor modes use two CSI data lanes. */
+	{ "OVTI2740:00", "CsiLanes", "2" },
+	{}
+};
+
 static struct gmin_cfg_var xiaomi_mipad2_vars[] = {
 	/* _DSM contains the wrong CsiPort for the front facing OV5693 sensor */
 	{ "INT33BE:00", "CsiPort", "0" },
@@ -83,6 +89,14 @@ static struct gmin_cfg_var xiaomi_mipad2_vars[] = {
 };

 static const struct dmi_system_id gmin_cfg_dmi_overrides[] = {
+	{
+		/* Lenovo Yoga Book X91L */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X91L"),
+		},
+		.driver_data = lenovo_yogabook_x91_vars,
+	},
 	{
 		/* Lenovo Ideapad Miix 310 */
 		.matches = {
@@ -359,7 +373,10 @@ static const struct acpi_device_id
atomisp_sensor_configs[] = {
 	 * the sensor fails to start streaming when instantiating
 	 * an i2c-client for the VCM, so it is disabled for now.
 	 */
-	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),	/* OV5693 */
+	/* OV5693 */
+	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),
+	/* OV8858 */
+	ATOMISP_SENSOR_CONFIG("INT3477", 4, true),
 	{}
 };

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

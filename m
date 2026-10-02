Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B6C3D9020
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 08:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929032; cv=pass; b=Q4Dz9xX6GCpD+CY4+hr/m+Vv5ksR9k5EQtgMgmdpbPtwK1EEghoeJF8ALwFH4+5Z/p/BgmG5Y1CJxzx61QmULoWs1QHKtmgogg2XoJaxMnpLRFCcEV7IICyjKTJnArxVM5S7QJ8EXDDjJArLXVmBO0kc3H33hZtoZeFf34gWKIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929032; c=relaxed/simple;
	bh=AW/hl4GAxmdzelzgtfN6Zdian7Bgh15Ju/suGkVS214=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R6eDc8Q65d8A328BZbhiPHIcF6oRtoon4v6/ck8XCIhggM22DhNMTc6nYpzikzEeO3e1OytKOW58hqcCu82cFB21HscVBAFCx/VL4USVhRVae9RSv6ZEKaF7DJQfgKr6DRjqyF+Sgf6ClZMWTl7feVhROSsFkJc0ftxY8OVtLh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gkXSdgV+; arc=pass smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gkXSdgV+"
Received: by mail-oo2-f40.google.com with SMTP id 46e09a7af769-82328163e12so114194a34.1
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 01:17:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929029; cv=none;
        d=google.com; s=arc-20260327;
        b=AJXlV8JbNa4MaZRKCfuxqeSiJ3ZhHlhIFy/Vg8loRhPKH4H+ifZ0EgNdTVI5Qi80kh
         yUTRyHbXp5xw8CHjN/jIWLxI+GSSSpPnzhtiJlJ2bzTzGdz2bysKOFCwz1lDnGR1um+m
         F4yYjHWRMdgkUCKohropj4pMr0LnI9kEBbDDiKSPJmU5lHiqhZWkCj2Nv1CNWg3XeB2w
         2DvP/IVGxi949RTKF5iOKxrwGDJqvJKz7PX0fXDjWFHr0qRp+edmP7kQYGR2x3Bgrrk0
         3KiZrnRWqXq86WgeJWPbd0yx/JUusJK6t75CxImRF8DQXJ7zNJ6saJaffmmFWYQO3L7k
         0MCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=vwlaLQjJD4LA4qoX5aX57TZ11LYaUU8pRjBICIySVm8=;
        fh=wyXW9knJ/SFVA7dZNA2vw/eEjXhFjuMuUxqwiTwm5Yw=;
        b=Y0Bxna32/AB6oAXLojS29+dwksUXcu8DMNy2Z1kSnuBLcQNOk2fgrrhXJzFEzsjpa5
         ZWHnaoIioWqsdgcp6jOgmBmWHYIUkrvi0tEbmPX07h0JLniNCx9xlAfJYJbUgwrym2Mt
         chmldQafisGIxDwkU8Edt8dqVZ0vMfXJ2kdKAJK9n5DRx2noz0/tuMsCSk8oJMue5hH2
         KXBlm6HfXM0OtGcwm+YuGOjxG6OFu1YcivLnS8qcb+CwSOtEZCiwCmj+L2l1YuxX6yOg
         klyuj4Nf+WQ1j8sNXWmU0mly6cN3VdVi9QtOk4kOi+F08uY1d1ke+SZejqpHJTqG4y30
         a9uA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929029; x=1791533829; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vwlaLQjJD4LA4qoX5aX57TZ11LYaUU8pRjBICIySVm8=;
        b=gkXSdgV+0HHeGxyZyXpqTMKDGC9fnrimdpWuf3vMYQg0R3miWkJdtBpUdq277l7ITI
         E95bdakvURcN9jFotYgQenq7LFnGXVIt4YARa4hxZEXcOJowErqQXBPqBdipqUjtOwmd
         HdGu9ZZMotTqtrSxaKRAnEaD5vFZ8viEg0axy4hJsRrAXhYatp6nz37mcb064VIqTeSz
         oDkLJQb3r2QFOhIdRvjmXWGbnODlwuhQb6oG0vfT1XpF4Z9h+rREd4ORPOvMMGDlD+3L
         v692GhKPOACb5xmamdY89bQuI+osb0MFfo0mhpR761txkoFUv+MLfBzad96qEvRuBAnd
         9I7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929029; x=1791533829;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vwlaLQjJD4LA4qoX5aX57TZ11LYaUU8pRjBICIySVm8=;
        b=XSLPOaca2x06GfhBBW9jsPyYMYqOFEL5xn2FpcesEKGusPUps2Wpl1DP9OyRPirY3z
         Ngnds/sLOvtfYiJVUq6Yedx0Rj64HkKzvjhGWMf1FonWyU2dQHJzCLPcoLvE+Qt4fy0r
         +kDG6twqRMT0ogRY/imWi4gyyTL58kUTx2yCe7aaUEpOfL6A+tCGt1xLmwWfuZY5phAT
         xU+ouUcCjU59mvbrMLmkWrK2kQlGu75CJaHdtkBTg96oOLvQVEnUoKY9Luq5RItnU0yQ
         kaz9AifbHwW1GABmSl8bw2O2KmSKviPv8a14v8zi2QYhHhIO4YLSdsDxrnyRrdcI+0bw
         zq9A==
X-Forwarded-Encrypted: i=1; AKwUvBxYGxqRpUGQOnhKndqIfnCDPPx2SoweLSWWx5G14F0NffA/TsMbRYtbXdU+KNL3axNd6Vyza66jjjYwM63K@lists.linux.dev
X-Gm-Message-State: AFuF++m6TEQLND2V3qjOcL5yOF/MkzKKm+LFj+wnjUT2AeiSL0/4uCoP
	5cq1Zr4hboOyYfNbb1HlYq0SqZnlkho65/iQ6Ly3kAl4crqTsMULA2hfRPbjH6+XtyYBKKGFAPz
	MH8p/BX4uk6Z9r/Xa/SrZ94ALRwsSyCY=
X-Gm-Gg: AYBFou1IfnVNIyQSWoooF1q3Doh+y4AEtcGYGHybgkWjw5LlsFKYPFViLXW/86GuUI/
	RDkJwzwlN85v9pQENzM5LFeKGX5C6MaY5E0vPZbgZvn42ZmCgdoVP6nF3eob2KDBMzskiqhm2ye
	erdxsIQbKkY700VdiBVAggLRlJb2g45IoTCk2j5PAnXKXN+/gcAx++Zz3pz5Dntrv1UjWavv3mz
	BHHy+uzK7EjfnpgP+DXsIh6Xja6BH7wKsa/D2FZVfnidXbkpYbwUPNnpcQdP1JS32WhnbeIMG5M
	tDH10rI9xN8tXtMH+xCYHw07W20oRTZFmxEuHhfwd9GHMJ0hQgiM7+MVvJ21NAJyNor8qfxbat0
	A1e6fFF9S1AWBlClzs9UTwxKiiZH1a3C3ZroVvIGbVuA=
X-Received: by 2002:a05:6830:f81:b0:81b:9724:8724 with SMTP id
 46e09a7af769-82284553bb3mr2195651a34.11.1790929028678; Fri, 02 Oct 2026
 01:17:08 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:17:08 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:17:08 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: mauriziocasciano7@gmail.com
In-Reply-To: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
Date: Fri, 2 Oct 2026 01:17:08 -0700
X-Gm-Features: AclHuK-s3En-dBInVKqqd_wUvqqzXZ7qVMyjE-03z1fuCXIHtAVrIsCb8dbhHsM
Message-ID: <CAO7O_xg+aLuRELykNbbBjpku3ttjoHL0EnH3texn3J2ewBL=dA@mail.gmail.com>
Subject: [PATCH v8 03/15] media: ov2740: Use C99 initializers for ACPI IDs
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Use designated initializers and the standard empty sentinel style
before adding firmware IDs.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Assisted-by: LLM sparse
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov2740.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 536325bb7b92..64a85735c1b8 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1462,10 +1462,9 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops,
ov2740_suspend, ov2740_resume,
 				 NULL);

 static const struct acpi_device_id ov2740_acpi_ids[] = {
-	{"INT3474"},
-	{}
+	{ .id = "INT3474" },
+	{ }
 };
-
 MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);

 static struct i2c_driver ov2740_i2c_driver = {
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

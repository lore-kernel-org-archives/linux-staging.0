Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344C9345CAB
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 08:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929052; cv=pass; b=XN/Chv+sl5zCJ5Z5Ezk+7s8BC5xaBt4sKrtLfLWL+DhOuibCjxYLkpaNa1s/3hK8hNda/ApWMK8odKXw9Ye0dnxfZ9FptSaT/iZLYQTAw1qX4U2k8YnFFPoe8xzozxG5l+YuHFSoK1rSVCpmGXrnHk+GIptAERitpoyj3TlejHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929052; c=relaxed/simple;
	bh=yP0Uvka0dBVEPB/Ts+qYbZsrtI1Iq4TR9VK1IZ5/J2M=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hG+6TRUZSMmUK4kwvqnHWV0b7j/3Qj4/BFbFHYNbMYKU4lk8sZgucaMhb/i1lOElRQP6Rvp0crTQfGzQUA8FuknGVpn1twSN6euYr5RqxlttQ0mi8LCnoGqq0q4gaG3T8CrpTSi92S6u5VZKaDs2L6ikLFIxzw0t+9jo750vKOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+cGpqjo; arc=pass smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+cGpqjo"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6dfc4510440so92577eaf.0
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 01:17:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929050; cv=none;
        d=google.com; s=arc-20260327;
        b=UQqKMMg4sWZu0C8WM50syM6BxgquAQM8V5hnMmiCfUDpk89XM/+BK9YLKC4414jwPi
         5BilDuUlTZ6k+u+ZcPRHytUGedDnCRk0XEHMkGoUbBHFnlNkUTNSfNnURhyN+GLerLlH
         qxyRYrg9J48NCFTz0T2qoiOxVLzsL/PuUIq/OrWhtGKpsGGCaosKTrXzYKcz9SSkbjwp
         wml+97FRYCxewNTC+TE4Hij+2kXlEVdlqgB3Zu+0najZQIrX4yDHxeIhyknwCKV3fN99
         8xSc8rDOiZ8Se6FAtUBDYn6QtIuHU/eCroD+RDansqhktyWKBOAHI3Bn4axCbhJwjRJt
         DGeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=nAaf6vnA5XQ9vnvtvU/bvGUXPo3uUVdVfKvAyLZjyh8=;
        fh=VMv/tIE0NmuwmvohXiEc40eNkCM0Euya6XQ/uSybbdQ=;
        b=kXFwzU27Klwu3HGcjrbpgXen/RnxwxUqZ3KNKYz4dFXGjZOJhAJ/V8h06SACnhZcFu
         UNO3jtXLjYMv0D1KXAuCsW0vLbOmrSc615c4vDI79BmFyTYK/zz6Ted74xsYY0jgdPqE
         K6cRxrGE4YliQ9MOIvU5tx4KBlwvpbnl/PQ5A7qVJDFK+uRw3OdvmK/RKMIO/4CHdBRa
         EXmtnIBLSfLj15jdSNBLSn9B0zzumN6FLNFnZhbhh8TXy4eGM26nCYesPdBSvBsst9hW
         mozezIEw3dLNTcvWVoeN/d0WZfvAhM3D0dDfjeNLwLYSijqsdgNP+rm1w2+8PpPA5OqA
         LqKw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929050; x=1791533850; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nAaf6vnA5XQ9vnvtvU/bvGUXPo3uUVdVfKvAyLZjyh8=;
        b=N+cGpqjoI1Hw/u4AAVmftIXdonwAy6B9c0ec0nStlysmOpE6GQn8mkelOC3kiJg5M4
         dyzjp86MbRvnRSxcDWDWwS+X7sDorNgaF1YFsDx9vyLYs5bvvmJ5mJKddcQlYESkSggu
         1t14/44OUbXuRUxmz+BRU9nFey8dzZAZ76DOkIdLpnbRtsC01e2BbcrteoUsrmG80Jrb
         /64OMVkJPni6/oD/aDIzota4yUQFkhKo8psGBgAP6GNU7MnXAndSGlgLkssTnelwvzCg
         xJl634gR3UR6n/2MpWJ+r0VLW15lr+mRyTC7iJuEcKzNzukg9FYI655WBRDdTRKB/p4N
         Nnyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929050; x=1791533850;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nAaf6vnA5XQ9vnvtvU/bvGUXPo3uUVdVfKvAyLZjyh8=;
        b=0Esws6HEgto65IGlvZs4/KxG0kAE9O3BpZfDliu9hGf3v7MJYiKlMcj25rlli6kqvp
         GWuaB5RPhIV/CMGTWpiI6VMttfU+JssHS7IHIIJueBP4eZ7JuNwe/JDxZracZ/UDjdKh
         0hs2YqVHRKZDWJiZbo3CR6IRBTnUkHHazlXBs2sVr931eSnUAKM2pZRX336DVRFEWnXL
         rvZcapGbhexC+Hb9QZxmQmNGddFmWX0Xrl20BRDCXMtkBDGMkoNTDui27qt+r2yKKw0R
         TxqeCE85GloIO2u2fbqh0VThNwE0p8TZnI/xjEP+6C5qyMN6aKkQnzhn+IIIYoQDjXlJ
         oHBw==
X-Forwarded-Encrypted: i=1; AKwUvBzMooLqocjPvDVLoG6xdLcumoLiCODYcVEhH2XUwJkUB0cUp6XsXnxijDUcoVSqbhwTuiqov8qtRk0zMon8@lists.linux.dev
X-Gm-Message-State: AFuF++kEiqoMFmdWvx9+m6Qq+h+w4OAOeQJPy6TH0mZE80gLcebuDFD2
	pB+XbmuU2SF7bIbryheUp6pgYL/sykBHvSdMlAnv0vsIcD/Kev2D4ILMkQghYnU3hc77/LQ33bK
	ynY8apzaKK8qnWywepAtftAIHJWU1ceo=
X-Gm-Gg: AYBFou2FBZpmonpgnq4fVPGiAUC1UfVi0oLpvZaxTMvFyQMKen9BtpGLutjLrMAFRfY
	FnWQ8JXYLM8RUmH8w5VHlSlDiNGO3ueo4WmvVL19Rdu1gSrKmlStC/aHIpp6i/LhtH3hd0xWJV0
	qFTZysHSXPTo2zn2+ufbBE/QnzDkkSrC7/moz8jm7XxepagY2wnZbQMMrfKjW9vECjuC7DQqJVi
	hyGDuWTahF+EXloFb0i/lAI/HF6uojpFDDRUUTJ5sD3XG5ogIjRJ8oABxV2APdY5DY4RYsB6zOZ
	KA3UPUfxMVAu11xV5A2/jPKOMLz4j4GXzDSYLinv8HO7yWtEw/fZLOv+LAnGtRPbeIyPtZbsNsy
	fEmcXzsx+mBKKJG/nmH8ZyTIg1lDBPa3Iq5fGBCMWhXNS
X-Received: by 2002:a05:6820:4d0b:b0:6d3:abd1:9b87 with SMTP id
 006d021491bc7-6ddbbc00bfbmr3849611eaf.45.1790929049888; Fri, 02 Oct 2026
 01:17:29 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:17:28 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:17:28 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: mauriziocasciano7@gmail.com
In-Reply-To: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
Date: Fri, 2 Oct 2026 01:17:28 -0700
X-Gm-Features: AclHuK-LkFsJIx5Cbfw0ls1bBDJPniprCrmiLQY6zRB0q00k-eSSW4zhDq20kFk
Message-ID: <CAO7O_xiWyfnnxh4OrnKCAFtsx=e-187sAW_Vj+Tmii_F_u8tfQ@mail.gmail.com>
Subject: [PATCH v8 05/15] media: ov8858: Add INT3477 ACPI ID
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Firmware may use INT3477 as the ACPI hardware ID for an OV8858 image
sensor. Add an ACPI match table for that ID.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov8858.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 97bcadda3fd8..ed6d3e1cdf7d 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2017 Intel Corporation.
  */

+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -2093,6 +2094,12 @@ static void ov8858_remove(struct i2c_client *client)
 	pm_runtime_set_suspended(&client->dev);
 }

+static const struct acpi_device_id ov8858_acpi_match[] = {
+	{ .id = "INT3477" },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, ov8858_acpi_match);
+
 static const struct of_device_id ov8858_of_match[] = {
 	{ .compatible = "ovti,ov8858" },
 	{ /* sentinel */ },
@@ -2103,6 +2110,7 @@ static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
+		.acpi_match_table = ACPI_PTR(ov8858_acpi_match),
 		.of_match_table = ov8858_of_match,
 	},
 	.probe		= ov8858_probe,
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

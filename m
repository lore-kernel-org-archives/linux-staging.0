Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944893DBD49
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 08:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929042; cv=pass; b=YDi0Y2vNoSNO5O3hAm9trsqWKYEYxcEnmyVkFxbBAOKXp4xo6jWRW7SC8lu97UsHb7eUWdcUwyZLNeZbbFMhOTzrZFalPhto3KBj+E4SSVqDInIe5WLFlxtxxaItL66X9rgYKgQmp1Yv3jC+3sWUiIWHJs2lOC0jEBHIkoknOkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929042; c=relaxed/simple;
	bh=V9mlkn6rFZgJWc3sdMpgHtW1gw94RUIGRN5GFmumsAw=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=el7rOVs/At1SVRGmHI6RQpEIPZ5t7ibaPj9ABwtSzzEe0f8GoedFrJl+inuaUEJPiwxEwer6iA39CUGvAPXevEaXH/ezUfCcgVWF6u4YcSaU8vhPBZ3tysSnyODoBcfYGnRKJPaY3RyGQReFCMauROmPGaOlfxvfr8MaH8XOHLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eKuwEkrr; arc=pass smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKuwEkrr"
Received: by mail-oo2-f41.google.com with SMTP id 46e09a7af769-7fcb425fb68so4670462a34.0
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 01:17:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929039; cv=none;
        d=google.com; s=arc-20260327;
        b=KV8C8PnBB/BW2knanYf3WUGVHVyf03OVKvXWQ4sCY/GY3aUnQz7pu+IyBwRXqFKS+b
         GqcVgl6329qdC2red/zIpZqR0Qnzmc327mPuB0kq/dcoZYGHwLZNf/8ESxX60jw9McIA
         FOdh6iLrlfkTjlJUd6HDuxwT+KUvhnddr5IhJgctrnU001Zxr4+52e+y3FzNaVktB8H0
         aXatENPVltfExOuAm/UUTTYqzRdkDBH1q6o2JcJ2uXeMbpZoDuc9Yk19y7qoItkk+ReX
         xEvChgC5EfWCe5T+THqxt6yqxgLwSKwddwzF9H3Rhgr040AdUGSfeo8n3U3JxogNTnNC
         Xm4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=pcFDa9I883BpJ1qewU49epkbu/O1gg/G2fJgTy7QgDE=;
        fh=/6hi30WdBfsUEW4jdlXt8pIbcZyUsNvuH8QHSMze6Hk=;
        b=KhIsBbIPA0nhwuIuFPkCQ1ynZ5UuWaTxNeDHzb+rKYcOFxMotEMty2xiy+2Kq4fpI8
         GLzHyaKAyYy/CN1hFbJHuuL6xNHTwnSD/ifUunl8Zv9hAv/bSFwZiIltuoHH9p/10yBo
         SPS4IyfLO3Ct3nzPXJPKYO5FYBxqQgjv3BkMN0lsuD8ixxzMA1dC7LGePbIo+7OqJdfR
         5lVj2SVnoz3OiMP81tWTLzbJ1Shh3Y6b7OaCmYvv6tMsLyYw0PochkLEabiJgM3r3jcQ
         c03PcM42UY8dRECfTA1J1LpULQSXDCs/hLJIDwO4vRZ8s4hg+O0qJfwUFsG+IZqdvGAe
         7zpw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929039; x=1791533839; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pcFDa9I883BpJ1qewU49epkbu/O1gg/G2fJgTy7QgDE=;
        b=eKuwEkrrCbZu5KjuE99aUZZEBQpDDfgIwewlsWqOZcc+rxuNnlaykJrRn2rcdxFsaP
         6yfb+/sXbhMi6GLXmf+cq1dFPaFjxnQvI2YMtqXu+DuelKufvhsHPC0a4JwnCEzysH75
         prb5/ZSuxFfYQTnBh1Pj1JCgiiGInqi/LCzGNKsrQJ4xktBSFQWBIUycH8vA4gIDoh/7
         nAWyY9C89LF8TC1uq7VzrwvDt4C1OOkuyFpIUodqJhqeh5PdyPxj4GmGTwwlNu3fXZoZ
         8ty5KR21l5CR7q8EjdLqHB78HKCkPSfcxKgPCntITKwUCPaSsDjjuMB7fAZUyXTwyWbI
         dYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929039; x=1791533839;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pcFDa9I883BpJ1qewU49epkbu/O1gg/G2fJgTy7QgDE=;
        b=pBAjQw2NPTyhtMF8CQaLbZVEgx2bU5/DMrcEFX6W5WgTfpuF3S8qY+G9KRkCnA9R/h
         tvGJ4ja83cbU/SzLZO2fZaGtY1QgZn8ATdAWUFwMeb+TxFqNVy/DrrlJ2Z1T2KQ8LKwL
         4jfTVTGf+PVv/yZiPwROmtqFaXhwIOgeG7X3p8X/snsf7CAVeTe+oj/52U7NIbJYiYrj
         aodWSGlczfBKa/RxeFxKUolmm/gePR97JhBS+DmRmrqpLyrS9WN6gDFRqf0epao7GxXT
         rfy7TSV/JfEb09ge1rWRnqtALVTsE54uQxETgrQ6UVHI3R4FU7FKZdqYPGrmJvsAcqib
         tlfg==
X-Forwarded-Encrypted: i=1; AKwUvBw1WkL1nZSjKZolt9ifpTt/Ay3hBVHM7beS5M8BxnGcG65gao0DDDxMKitydT1o3U+FIHT04xpzUQyiRghE@lists.linux.dev
X-Gm-Message-State: AFuF++mArgYjJCrnKvJbZb4wugjtiQOCyUu2zycom2LoNHRxqmfNUTyb
	UdnvP8HHS+H4T8PGbGNS9JUmzBpZtlb5FHUGfVQMoe7tj95qLiDTUDifrBHJtlKusTxcyhrCJF4
	CVvqFXYdw1VdjdqP9pq4fos5ATBJkGsY=
X-Gm-Gg: AYBFou3DW6HAoUrZs5rFvdaE4WoIQGEAqO2IiuGb3vYndg8AXBJ49noII98UwIKs/je
	6fwCBp20h3cC8ziDvSsUxol0vqVp4vlph4IaTCz7sDbsMh+StkNLKA3jJj8BDPn014vz0b8pov2
	O407NRs891z1mxuAoN+kVUIdqpM9IR/che6zHb3KiFrW8+5dob5qYknXFlwJFvtIy3WgHOG63Kg
	EvmsqRwcMbq+RN9/KtD8LdwsDi02Wwfzfu9iJMUnGNfQTpVlmBQU9oV/Mpdz9k/BFn9CmmUnBYZ
	l7uEEqdampeP8UOv3jIvnfvWDUOihOkqrtVcFe/93rxjDHHtGNgp3gB6Eowib/PdLJGj1dZLulj
	ccg0RErSEmGkyu46nDUQ8HwgGEW1Mo7+qiyZH01R6FKM=
X-Received: by 2002:a05:6808:6408:b0:4d5:295c:a82f with SMTP id
 5614622812f47-4f52bacb381mr1370022b6e.60.1790929039252; Fri, 02 Oct 2026
 01:17:19 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:17:18 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:17:18 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: mauriziocasciano7@gmail.com
In-Reply-To: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
Date: Fri, 2 Oct 2026 01:17:18 -0700
X-Gm-Features: AclHuK8iCzKbWnYiIfO1nOdV2_eMWyLE27DrxpNhzaQNvYCQiT81CDMNKLaOXFA
Message-ID: <CAO7O_xhaMCV+w1qF4hmnFuOBJsed_LnhdRd=x8oxTwLedRVDiw@mail.gmail.com>
Subject: [PATCH v8 04/15] media: ov2740: Add OVTI2740 ACPI ID
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Firmware may enumerate OV2740 image sensors using the OVTI2740 ACPI ID.
Add it to the existing ACPI match table.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/media/i2c/ov2740.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 64a85735c1b8..830f5857d73f 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1463,6 +1463,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops,
ov2740_suspend, ov2740_resume,

 static const struct acpi_device_id ov2740_acpi_ids[] = {
 	{ .id = "INT3474" },
+	{ .id = "OVTI2740" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);
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

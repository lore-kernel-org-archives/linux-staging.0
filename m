Received: from mail-oo2-f34.google.com (mail-oo2-f34.google.com [74.125.231.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D583304BDF
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 08:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.162
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929081; cv=pass; b=qF0TnXDr0s5HLSZUjwEzfrGUAZ7SU56yXr+XudRHYWnPKzlzvoEaHL4qwIzVlgU7RqRxk8+7dnzN4kDD3Q9gZ8jnF7CgKe4VzCTe7xo2iXmFGFIA0Dn0xpU7ATFDD/TwBE2akoNLP3dtIt3nb0qlU2HPnmqE7zZSYmQMcZbrA/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929081; c=relaxed/simple;
	bh=twBPHrY5BKr0n3iVtHv1M8Hxql+kPbMFNXvWJopuaBA=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QiYam0Ph7RdbIGL1jJDilcwtBeinIxOUsC1JJ634LHawX251eeaGrj/8mmZjcZ2wYCfNnPKz7o3YAJIvNuyln3iDAFk4hGvKtJUaPMYf3mbpjdsiQXFyzSYkSK+4LJG7iGanSrQO3EA4MNKXrarxoYJq5kCAkTNfPO6fyjni20g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDs1ffzC; arc=pass smtp.client-ip=74.125.231.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDs1ffzC"
Received: by mail-oo2-f34.google.com with SMTP id 006d021491bc7-6de5d816853so800042eaf.1
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 01:17:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929078; cv=none;
        d=google.com; s=arc-20260327;
        b=Iyf+Wn/Hp0Y6UlluX9bP2LuNTy2jiMdo2x8z9S0u6vu0nAqZfsC3pdBOUIkXqFh5ib
         jwVXntIfy8s9eVdCbt8Ck30AsupRkukDhupc9n4AMaZdjJcmcV0WaQ0vOcgH+7ad9a7P
         I+0CcsAmSjD2OCTcX/nGB0Q3IKdDmr8+HOpawJXZ6lSHfdEKT8GPfQmSEKsFkxzo5vru
         8/MXLY3U7iDnElrmsA4XNZR+MkcLBmwMQE9Gr0Cl9kAYxsj9c1V4ax5lIaSYve3EBGNm
         45y3gN1FyprYCzbdbNnsaBCk6TRW89Jvk2GVWvj6Bk5ijTdD05gvpN6P20G4cwENTWI5
         8vgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=bpg9iRtZofswrYhKLOFSBMFWRKDxygadnyFAvbF7xh8=;
        fh=UXp2yYe/MBhPWj/pQ57B1YYOaSjWftwVK5C47/xUYL8=;
        b=JK6tr0aJAIHFyC9c0TgFcidM/GV+c3lzX5uyja7ggQRQmAzEwgwM6zOWIxyBXDGZIV
         WzNuONUiVdi9fCGo7MrUP4gNjvVWUKBceXEfeYOyCDYYeKBBb+jt7S/KXiRQnlcXz8Eu
         uopfqWVNAspl7ygRRtBSoVHkPLuFMNtemdQ++7YEcu+wX+0mR7YyE/6ZZY/FreiVw3u1
         weh/eOvDw92AaBENKe5omv+piPdY7a6aG+WDMRSxftaSVc/RqYPfMZjl78z00Odv0TkD
         PH416xx+Ppcw9Z2a78M3/hGu0ck9jZn5U74L7ilXChDCJpGzCgYYTZ9CTyyjSvjxkLnq
         p3Wg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929078; x=1791533878; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bpg9iRtZofswrYhKLOFSBMFWRKDxygadnyFAvbF7xh8=;
        b=DDs1ffzCd2frZHCFy9SXDqZ0v2u7sPorPyR87J/2VvQEnw4+1m+MY4T2cMRN8D/lfh
         AjHwf3jjXCOivRSwRGNDKZwPCrUpALBmKXF88MO2659ieXHnJe+88p+WoloGcYbHf9yS
         Hx2xwTS64tOdkzaTRjHBX4tmbLLhv2nfWMDCxEyzLmXJA86j8UApo1PM0e0L8q+OrXib
         poT9GLyUmLpuWH176Sac+4p0y5gFHB+TaNUA3YK+LN1ZCRGyGPEPIxqTj//9cQuR2VES
         BvDnzOOE+x2U8nJgK055y/LMCGI9Mkc5H6l7soCrpmgocQFBUgiGNGyw3nS04HS1e9AO
         pm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929078; x=1791533878;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bpg9iRtZofswrYhKLOFSBMFWRKDxygadnyFAvbF7xh8=;
        b=SQyFPn7Wl0ilXsxulJJ3v0qnveHtCqMxYf3p9w1ka6vvO1eEN0GntQDf1hNmmYtz7s
         30pcNgg6zPH22QWnhgC1H3EQYzmxJs4//NJ30jB+e/Ba25kewD1/VVVUJtnJEwn9ttW6
         4m3U4lWwSaMW5FYKvAPDmTluc0yZk3GoiMtI3B8iYBlryHhg45BtZBtycF3MAJnuJ5kQ
         3tnV7rJ6Wy9lXQjPoi2qlytbl7pAEJw1yx7JwJl3C9SqKucutBFlSLqBpHI3MdXgg9DP
         ABYZCJ7LAIeus1Vb+eULbzuSlZBSnAL2Vt1YqjlIX8JZNzcVRfJWU/z9+zD+VpAYUsmW
         7uHg==
X-Forwarded-Encrypted: i=1; AKwUvBz6NMzl1Bta/GBKt00TnqKLnUx4b9ln9BeJw9mp1YPaXSE5wZR8Mkju6cxGAj9m6s7lYN5uLjk4MK72BTw9@lists.linux.dev
X-Gm-Message-State: AFuF++lkBzRz1JRe4iC6c80XDwgQubrNN7tzdDtOBOAxWhbjCtlJ5T5l
	CoyiiL1z80TJps0PVBlNeloteFLqTTpT6k2CGdAUni+rLUontCseODy2IpvcwwLHJwIB87EVzq6
	FcgXr9pQn7o8EBWF5OxXjbQzYbyMTngc=
X-Gm-Gg: AYBFou3RFjykF0IT5WDOQIOKORnYe/xm+z5xWhxMDgLBD568qVj29Du5UWZukjNfOMh
	85L5libOjWGAvE4tigMV3EQ7DU2ZKNLhByQu1QIXJVWxMoRYxCfDc4fmbX9Y/Xzp1fpYgAHYeR3
	SUQN3QlH2kEktaIT/X/9A2/XIA/Hgm7OW7A0BbS1i/woFsHfXwADe2NBxmj/yOOtMtbQLUzve5i
	oq3+fm3xq9tMMHJWZoWDBWPgLH5BKzNrlc1NsCrbvGE+r06zEARWYqelm0wiK5h68Flp6RDjOkx
	jf+QTA/F7GvoEZZUyTIrvhU/eXtV14pN+TYRMHGEzcf5ukoKjW74OgEr4wzAKoV72FcT43fLjl1
	v+u0TSSGAGAxmvfRryIEZ1Hx/cAJF+oUh8w==
X-Received: by 2002:a05:6820:1787:b0:6b7:8415:d780 with SMTP id
 006d021491bc7-6df33b9a1c1mr1670231eaf.43.1790929078189; Fri, 02 Oct 2026
 01:17:58 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:17:57 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:17:57 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: mauriziocasciano7@gmail.com
In-Reply-To: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
Date: Fri, 2 Oct 2026 01:17:57 -0700
X-Gm-Features: AclHuK_y4aZgp-8VABFxR2YWElsBKo_XUFzWtprIfFIUbpsBiWg0j3l3zIKhLyU
Message-ID: <CAO7O_xgtBoo65XO5K7NMiRZX4QicQgEr1BgcBrk85kwGckS5Kw@mail.gmail.com>
Subject: [PATCH v8 08/15] media: ov2740: support 288 MHz link frequency
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The Lenovo Yoga Book YB1-X91 front camera uses two CSI-2 lanes at a
288 MHz link frequency. Add the matching PLL configuration and mode
timing.

Reuse the existing 1932x1092 crop and mode register list so the Bayer
order remains SGRBG across link frequencies. Cropping the CSI-2
receiver output to a smaller processed frame is a userspace pipeline
decision.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/media/i2c/ov2740.c | 43 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 830f5857d73f..ca33ef30267d 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -12,12 +12,14 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/unaligned.h>
+#include <linux/units.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>

-#define OV2740_LINK_FREQ_360MHZ		360000000ULL
-#define OV2740_LINK_FREQ_180MHZ		180000000ULL
+#define OV2740_LINK_FREQ_360MHZ		(360 * HZ_PER_MHZ)
+#define OV2740_LINK_FREQ_288MHZ		(288 * HZ_PER_MHZ)
+#define OV2740_LINK_FREQ_180MHZ		(180 * HZ_PER_MHZ)
 #define OV2740_SCLK			72000000LL
 #define OV2740_MCLK			19200000
 #define OV2740_DATA_LANES		2
@@ -91,6 +93,7 @@ struct nvm_data {

 enum {
 	OV2740_LINK_FREQ_360MHZ_INDEX,
+	OV2740_LINK_FREQ_288MHZ_INDEX,
 	OV2740_LINK_FREQ_180MHZ_INDEX,
 };

@@ -142,6 +145,14 @@ static const struct ov2740_reg mipi_data_rate_720mbps[] = {
 	{0x0312, 0x11},
 };

+static const struct ov2740_reg mipi_data_rate_576mbps[] = {
+	{0x0302, 0x1e},
+	{0x0303, 0x00},
+	{0x030d, 0x1e},
+	{0x030e, 0x02},
+	{0x0312, 0x01},
+};
+
 static const struct ov2740_reg mipi_data_rate_360mbps[] = {
 	{0x0302, 0x4b},
 	{0x0303, 0x01},
@@ -468,6 +479,7 @@ static const char * const ov2740_test_pattern_menu[] = {

 static const s64 link_freq_menu_items[] = {
 	OV2740_LINK_FREQ_360MHZ,
+	OV2740_LINK_FREQ_288MHZ,
 	OV2740_LINK_FREQ_180MHZ,
 };

@@ -478,6 +490,12 @@ static const struct ov2740_link_freq_config
link_freq_configs[] = {
 			.regs = mipi_data_rate_720mbps,
 		}
 	},
+	[OV2740_LINK_FREQ_288MHZ_INDEX] = {
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mipi_data_rate_576mbps),
+			.regs = mipi_data_rate_576mbps,
+		}
+	},
 	[OV2740_LINK_FREQ_180MHZ_INDEX] = {
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mipi_data_rate_360mbps),
@@ -502,6 +520,22 @@ static const struct ov2740_mode
supported_modes_360mhz[] = {
 	},
 };

+static const struct ov2740_mode supported_modes_288mhz[] = {
+	{
+		.width = 1932,
+		.height = 1092,
+		.hts = 2160,
+		.vts_min = 1776,
+		.vts_def = 1776,
+		.vts_max = 32767,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1932x1092_regs_360mhz),
+			.regs = mode_1932x1092_regs_360mhz,
+		},
+		.link_freq_index = OV2740_LINK_FREQ_288MHZ_INDEX,
+	},
+};
+
 static const struct ov2740_mode supported_modes_180mhz[] = {
 	{
 		.width = 1932,
@@ -1179,6 +1213,11 @@ static int ov2740_check_hwcfg(struct ov2740 *ov2740)
 			ov2740->supported_modes_count =
 				ARRAY_SIZE(supported_modes_360mhz);
 			break;
+		case OV2740_LINK_FREQ_288MHZ_INDEX:
+			ov2740->supported_modes = supported_modes_288mhz;
+			ov2740->supported_modes_count =
+				ARRAY_SIZE(supported_modes_288mhz);
+			break;
 		case OV2740_LINK_FREQ_180MHZ_INDEX:
 			ov2740->supported_modes = supported_modes_180mhz;
 			ov2740->supported_modes_count =
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

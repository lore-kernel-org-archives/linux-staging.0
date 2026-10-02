Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C653890E8
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 08:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929120; cv=pass; b=dy8IawdN95YeXbhlBPd87ErJq5dErfMiAFWo54X4yg4Gd9/7hPIr8XsWPFh1EEfKKGjoIpSaUC5toFi+E3j9ZXFzgnSgbjfbCm5BlNGfcpGUcaHyS0FD4C/hAqwYeDOr7v1uuFPLc0ES3qD7BgHp57eKGBchQLfbMqMMFCq9gIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929120; c=relaxed/simple;
	bh=6Lfx0jV6IMUPHRzAdg+6UtumFBkdv73DiNbwBclrpg8=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GjSzwIuPBxpbamCnWRwlwbW/CO1IvExD3j/lttRatYdO/3CD6A/RwDBE0OGqenYXgpiiwPFVv5ATQUX9UMeCOxOFoWlPMCHj06l2jR31ORbkWJdHHcP41bHYJNpWh6aFyKHgsoqWcq2a78EeD2XLLrs6YGPOkAtzP9SBQij5bgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=faQetfed; arc=pass smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="faQetfed"
Received: by mail-oo2-f40.google.com with SMTP id 46e09a7af769-8231c185333so137116a34.3
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 01:18:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929116; cv=none;
        d=google.com; s=arc-20260327;
        b=EWIxTGFKrhe9HWG4rCyzzYWlDUEMOMet6dSG8e5QPvJfYBtJCBKZSggaw/I8LBXmyb
         hgUUGpkyv9U4sFLgAT20cCCR5uDHpQl1iJwPnTYpn8JmHmJld1JwEyno/YqmeiBqJdO0
         4HKnF6gj0JrZIEQCTHQVLOJ55ZN3sojbgSC/0DJ1FCC6nRNpvKnDKtxexyWtJyVLTIvm
         IJzwFQ/SPUoYSkD/pjCPMD5NDAxmn86ytIFGOTI5J71XjewTF7GiFxlYep57M1K/Y87V
         PSRR0/A7x+ORAK2xbgia0q/XFij/LcVy840GmAFLahejUiZcLjSKfJvYfCmCPPSYaHHZ
         VoCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=346f4gGMT/Ag85J/e8vzhaW40UWlQoH961LBrHXp4mg=;
        fh=36dMWlfMxzCGS+n2uSsZNDCYUYaoXGK5+BmA7GZm5Hw=;
        b=mKJQ/3UfUb8+VgdI37FPfyBAy9EgtKihz1pbPAO1HF7EM7x3QNoJBNSsvGfinLKp/R
         ZLCEE7iLUdsiD4UPD8BneyIblC2Ubhouzz3wzaqN18pdwrWokND5btn8cFC11t4Djirb
         XHA+zdsCFhZaXyyWx4CvEB37SAW5tjN9TWnbT14AELLZfLK+6qFVQvT/2NJzpt0OWYrP
         hPX6jzA/i16MrNvrmTCJNbGC1/CD3Kz0Edtgug1HyHvWdOYC+9alUCCRGpKD99wIx4bO
         CQU7Q2oxgKYITmc2LXTmNzrJRDjYB8dYR3Axb+nnE3+C06ZzlwZSRM88EMBocEnCdQ+O
         Kkrw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929116; x=1791533916; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=346f4gGMT/Ag85J/e8vzhaW40UWlQoH961LBrHXp4mg=;
        b=faQetfed5ZhQFP1qoVbopcOdmYqIOo0o2ke6U7EGiIamqc7HJJxRjcLAsCrEQrI2lX
         YZihYCyJDDSiUQ/J8vLnhKrMeztYigfRB2WW7ZQV0smtaf77cuGvmHbmEAPrShuZHQsl
         ihj9dEyhxUmy4c1qO4YKizkQ+40g4bJVutZyFdxo0Mdb0zJgCDbWDecrSarHWiS/6UHy
         hGk2CYunkjcEpuIKy+kXa5pwMDZzrZCCLUpPz2gqiqxwj2/AXkZT7TJcXmrbTHIDKHJq
         wGEvqBEAXNI/0CjJcB7k11tOpUdF4jW9HHfVXlFvr4cs0XeCJqBz2ewprc8nDoHBsY4p
         Rqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929116; x=1791533916;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=346f4gGMT/Ag85J/e8vzhaW40UWlQoH961LBrHXp4mg=;
        b=MKthY7/aNIGbPGKHYrZ4ogtWM2jhO0+0ZF8n1e0W4X86YmJOEEeWa0Kq4RUhDawiLm
         pxteGnqlNoPHSu/olm0N9dRAe+bd3F3b7Tj0D2340PeU6W/cKaXVomWRBt0H6EpoOTrH
         3lxcOZMyTQPaDdpG3m83VT+HGWctMAoqibTDTFIQ0rNJYNEs8sFqB/akO9uS/7J6hsJR
         LG3rgb+CbYBnfeG1yZZDOphuCh/IakrkUc6cYZy/QfasBUZo/yUdlEeg08NKuKqjyPgd
         1GvPZ3Scsu6nUXnMCzz6vjbJTbPGbJ5TpMhv4CQMo7P6hYKgvPZZQHyMpn/ydUnjNADX
         uISw==
X-Forwarded-Encrypted: i=1; AKwUvBzTROCfZwOQb5Pn+hKu2rEGW2YRtja5hWXxsHoiyMhvqlQxil0pfM1IFcRh1RCG2kO2ITDe/AMiEksdc1KN@lists.linux.dev
X-Gm-Message-State: AFuF++lDDe9p/uPGawloFWC9DRVLmRDqQhPSgcVSNMEEDLrVscisdf1O
	EEZo/SNA+XAwJzGylhJySL6hPgAebY8zEpiqDwwXmlxuPfJC4MHSuZuNt13J4FbQfJZ4e20gkcA
	SEHnjT/6yK50iMrXs6EvRRl1+oc97WF0=
X-Gm-Gg: AYBFou0/57uMyl+7bFwiEeQODqVhboJaWvrZnAhcsGLJLSlkN0P0xN+gnA48V2OdZZS
	70rOB/vnhUpvnIVNTL2fIHlxTLgK/9MX6BEBH1hPUV9vibGalGELGRQ7fu4207cKS8tWNOAnBp6
	GxOG9EVch/yLNIGeG6GEPXz7Jw20aKrpKZR9+SjjIeHwPp+orVuXkwk1qCghEtSJWNnVA3tSyp9
	F8f7mURGK9/rPEVSIoSnS1gFQLl2mnGm5xQ2nTXkB9KLYNE0zUwlLWp++S5yms3/xWfwHUXEQEy
	vCDZ0ipQhAi951fCewrIdZoG2EJ8K57hsUOJvZdOPuFrPVrOLKXY7ILdAY/a7PKqoFyxBEaMk4Q
	cTLhwOeHSJ1P6EXf5NBHWxic+mPjZjX/1
X-Received: by 2002:a05:6820:c98:b0:6c9:80d8:a1ec with SMTP id
 006d021491bc7-6df348866fbmr1590818eaf.41.1790929115961; Fri, 02 Oct 2026
 01:18:35 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:18:34 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:18:34 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: mauriziocasciano7@gmail.com
In-Reply-To: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
Date: Fri, 2 Oct 2026 01:18:34 -0700
X-Gm-Features: AclHuK-3038epjCFa1xon2bRGkGyxQzWMlfNfpE62dQ7SyYg30VE4d-xKNpqNFQ
Message-ID: <CAO7O_xh0emLuDf4GwVXisV6qYiMgdiDJ6Z6mBv-BC5mC59KbmQ@mail.gmail.com>
Subject: [PATCH v8 12/15] media: ov2740: add manual white balance controls
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The sensor has separate red, green and blue manual white-balance gain
registers, but the driver currently writes the same digital-gain value
to all three channels. This prevents userspace from correcting the
strong color cast of raw Bayer capture.

Expose red- and blue-balance controls relative to the digital gain and
update all three channels under group hold.

Tested on the Yoga Book OV2740 with live gain changes and continuous raw
capture.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/media/i2c/ov2740.c | 44 +++++++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 4479666f17f7..42e4cd5d1341 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -565,6 +565,9 @@ struct ov2740 {
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *digital_gain;
+	struct v4l2_ctrl *red_balance;
+	struct v4l2_ctrl *blue_balance;

 	/* GPIOs, clocks, regulators */
 	struct gpio_desc *reset_gpio;
@@ -694,8 +697,10 @@ static int ov2740_identify_module(struct ov2740 *ov2740)
 	return 0;
 }

-static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
+static int ov2740_update_mwb_gains(struct ov2740 *ov2740)
 {
+	u32 d_gain = ov2740->digital_gain->val;
+	u32 blue_gain, red_gain;
 	int end_ret, launch_ret, ret;

 	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
@@ -703,7 +708,11 @@ static int ov2740_update_digital_gain(struct
ov2740 *ov2740, u32 d_gain)
 	if (ret)
 		return ret;

-	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, d_gain);
+	/* Balance controls use 1024 as unity relative to the digital gain. */
+	red_gain = DIV_ROUND_CLOSEST(d_gain * ov2740->red_balance->val,
+				     OV2740_DGTL_GAIN_DEFAULT);
+	red_gain = min(red_gain, OV2740_DGTL_GAIN_MAX);
+	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, red_gain);
 	if (ret)
 		goto release_group;

@@ -711,7 +720,10 @@ static int ov2740_update_digital_gain(struct
ov2740 *ov2740, u32 d_gain)
 	if (ret)
 		goto release_group;

-	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, d_gain);
+	blue_gain = DIV_ROUND_CLOSEST(d_gain * ov2740->blue_balance->val,
+				      OV2740_DGTL_GAIN_DEFAULT);
+	blue_gain = min(blue_gain, OV2740_DGTL_GAIN_MAX);
+	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, blue_gain);

 release_group:
 	end_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
@@ -760,7 +772,9 @@ static int ov2740_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;

 	case V4L2_CID_DIGITAL_GAIN:
-		ret = ov2740_update_digital_gain(ov2740, ctrl->val);
+	case V4L2_CID_RED_BALANCE:
+	case V4L2_CID_BLUE_BALANCE:
+		ret = ov2740_update_mwb_gains(ov2740);
 		break;

 	case V4L2_CID_EXPOSURE:
@@ -801,7 +815,7 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	int ret;

 	ctrl_hdlr = &ov2740->ctrl_handler;
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 	if (ret)
 		return ret;

@@ -836,9 +850,23 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
 			  OV2740_ANAL_GAIN_MIN, OV2740_ANAL_GAIN_MAX,
 			  OV2740_ANAL_GAIN_STEP, OV2740_ANAL_GAIN_MIN);
-	v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
-			  OV2740_DGTL_GAIN_MIN, OV2740_DGTL_GAIN_MAX,
-			  OV2740_DGTL_GAIN_STEP, OV2740_DGTL_GAIN_DEFAULT);
+	ov2740->digital_gain =
+		v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
+				  V4L2_CID_DIGITAL_GAIN,
+				  OV2740_DGTL_GAIN_MIN, OV2740_DGTL_GAIN_MAX,
+				  OV2740_DGTL_GAIN_STEP,
+				  OV2740_DGTL_GAIN_DEFAULT);
+	ov2740->red_balance =
+		v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
+				  V4L2_CID_RED_BALANCE,
+				  1, OV2740_DGTL_GAIN_MAX, 1,
+				  OV2740_DGTL_GAIN_DEFAULT);
+	ov2740->blue_balance =
+		v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
+				  V4L2_CID_BLUE_BALANCE,
+				  1, OV2740_DGTL_GAIN_MAX, 1,
+				  OV2740_DGTL_GAIN_DEFAULT);
+	v4l2_ctrl_cluster(3, &ov2740->digital_gain);
 	exposure_max = ov2740->cur_mode->vts_def - OV2740_EXPOSURE_MAX_MARGIN;
 	ov2740->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
 					     V4L2_CID_EXPOSURE,
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

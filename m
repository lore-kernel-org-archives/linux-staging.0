Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF5043DA20
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 08:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929139; cv=pass; b=Z+aQkt/uF37fo8dIecCquTC+NMJElwpN5YW5n4icWFiWnEj8jsOzXP52R3tzmmEkNRPCRWhYFCwyRBNIYcKera7iB8QfaI7jCcwUXwPptn4LlA+1UZK4UL0w7qHWhksrq+23LFls9D1oNz80sGfhez3j5sZO05LOEs8luJdynCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929139; c=relaxed/simple;
	bh=e0R8qZBXa11DudLfZtnfVvQvEHGmMbO+6kvSXwrNWeU=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NU6LErlxw5/j0geXyhtA0vw08xZVHmsBv4Qb289qY+Weu40SsATfyu9STCruN/FtSXAT80cqe+soQ/jEQudl/UHuqqYB8zC+xSGtJaEv9dMBjcaz/0GE801BTF9t5R0Q2078vwNd6zvTFl+beH6D6s19oPgGL3kmGkQNd0drdHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipDO5E3e; arc=pass smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipDO5E3e"
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-81be5042c56so4310826a34.0
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 01:18:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929136; cv=none;
        d=google.com; s=arc-20260327;
        b=CdNcrXR+ImDydTEYCuupjx7Q1FwSLtezuYIAPG/K3O5QBO0uBFotnMtz58DHqumIak
         bAhdLRsj30l416P3eVV+0PQdCc8h42h1sXP8wnpWEeKL77edIO3PhtepQeUMYtmoIEUG
         Rnu53PdhG5YcD7tfXdGn7z1aHtYhngzS0O/zDOfEscsk/msrcme5bg0/6nwhEQJ5ox/B
         6jtODdOcoMfD8jQzTTNEGJ0Pn5fyfZ14iyrDSAaDhVPoeSGVuKokdpO4j71taWIyD5fO
         GM+2IQ/NhEjzRSTW8j6ZZ9aUzf2Ke1MaWlOV2lfVHtiF058PjFSC4WE378wLOtpLJ4s9
         j7AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=KsxBG92p9ibwEnb4BhwoVnsxppBxJJIvb0AZD7wJfLQ=;
        fh=yWVQrd5tFLF0njcjkzZ3MBwQ3JBgpWLwMVcddMSntHA=;
        b=kWXdg58jAIpLRTJStkENdZS/n+ef+ZyljhvMbxXwnJvHXu5RNMpwZTTm22JoritaBY
         HJdMLx9SxSA2MjKXY8qXXJOz4JGDNen9Nin0EE6kKZlnbisN6Jdriga4LWy11gUN/+XG
         4f/8Zx+LT3GJC2+Hkt1Lf2wFiJTgEcloqq1wzGfFfAVbCKytZvrWwCuZ5mnRyMA2bTpW
         ocv8AatjQO6eBF1NXKUce1auuLAIcLXCuIGLN4EVF21yxdv/TTRSea4xjcir8U4oDTMS
         Sq5BnBipnVDCpVQrQ2rAUGIrXnOlfTMAbB4CSD+h/QgOVJLNzapyOJ0McRzhN9YGypOa
         T1xg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929136; x=1791533936; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KsxBG92p9ibwEnb4BhwoVnsxppBxJJIvb0AZD7wJfLQ=;
        b=ipDO5E3efmEcK0foLtFLGvxk8WN1Y9J0DxykuiUQS6mIB52lAaPQejnlho2KhFY1EW
         49/xPXzJMELBFB8K8QV8yFsC9/I6uo8DKNABkbwqZ4dbHSX/A+1IzqzlPLyosNHnddoR
         lDlzeixNfNSUGIx2GYD3mYDzhr5uzQAV+isgWwcz1+fVqo7joHp81sT4hQsxTWV9hxIc
         zkkqbX89DGQVHj+pRtzOUEiXwnD0CprWjas2US7F6NksHMXN0r5yx2V80VxClSYbSVnj
         40XlxOXPxh90Ouiw/asXzdZIhfcdVzJt9PdcbtLaS2xQg+eQho9UbMdCAIy18HKu8YeS
         HUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929136; x=1791533936;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KsxBG92p9ibwEnb4BhwoVnsxppBxJJIvb0AZD7wJfLQ=;
        b=HxDSFc9SEflQBs3rOeybXrKJU5ji1TDd3juvVKF5OtloPnDqliawV1ldEaa3IXKGym
         s5z7FwtNEVMlBdJQ60uMsa56GGi4MB+vEv2VZZLgITZWY3kBPQfc25pwjXf4aS4GmaRO
         blnIxBQ91mPcOWnuVSHRjYEyLhQfcrxVf6ywCiWsDP2m9CgmX2J7p+FiqW+o/2vGc8lv
         SwhrZm+YXkiEuWDAxcMBGThJVsckoIBUvA9qqIpaQ4tQqxiIIAF7mT0FTUmxNGEKHY9/
         T2/cfued3W+XFG1CH3VZH6vCQdezEUNLFN2j1DggPG7MrneHPAOwJp+Va9dbxvkWAqlZ
         VNlQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIkqICQSLJzX+LqWZxzj1Gp5R/W938yGz9YYANU+1f6E5H5Z/z3HzXdsJR+n89nmwolLSUWrMSwktNWx2j@lists.linux.dev
X-Gm-Message-State: AFuF++kBtZHJp7DO0rwx5APCBXP4eYcu9lK5vxoB/NOOMnQu1Fzbig59
	UbKtPBxtEglvLOfrO0JDREMqDKf2EoiYC8N9cKkiC41xXCGRi5KoCqO+aZ/oKuP0/Ng5HX4XWYp
	nO3T0jBnOPs9oI+afnJBu9bnIl/a+kRU=
X-Gm-Gg: AYBFou22yD6jWfYSOCtkSu9Wj3yCzdTVPrzYgPxoff278e6OyqUPbw1dVWIAVwME1ze
	InUHw7yf5pv2GbX27ionbbOg6QfjwShz/NXhxxqj1e1zohnl7X+P+xKrCeh5Q5QRwlRGOhRJcPc
	c1HGYDOrT9N/JEA6d7gPpwhtbiyLlOdfTBo+7FqRwXKDL4L/aecsM2eAiJSLeNCV8j0luztBioQ
	r7mUGYParcSmoXyFYAegRQktYvbDFBYmGYTsF74H+6E76Y3Z46gkAkyFSvEwzLz85MALtofjaBh
	o+BFrxIHel3PAUKnAiu0IB0ujZgXJ8tWF2RFDgSEOZF48sdAWNFOd5h1aciFRbxQo2+6TFPSGOI
	zl0qmoIg/A7Vt3n0Q6DKNdUbv+QAvJMf8HHMBVjxyl5E=
X-Received: by 2002:a05:6830:25d4:b0:81b:c62c:b63 with SMTP id
 46e09a7af769-82285766111mr2214591a34.18.1790929135793; Fri, 02 Oct 2026
 01:18:55 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:18:55 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:18:55 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: mauriziocasciano7@gmail.com
In-Reply-To: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
Date: Fri, 2 Oct 2026 01:18:55 -0700
X-Gm-Features: AclHuK9nPCYmSaWXDMDuSn5Xjv8o-h6goY4mO41PT99ARicqCQBe20-xJ2G7HIA
Message-ID: <CAO7O_xg4ytm05eBm_vsv-qtXwTsWrn6vExzmB-d58f+PogR2CA@mail.gmail.com>
Subject: [PATCH v8 14/15] media: atomisp: allow raw Bayer capture
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

AtomISP currently rejects all raw formats and silently substitutes
YUV420. This prevents userspace camera processing stacks from obtaining
unprocessed sensor frames.

Enumerate only the raw format matching the sensor media-bus code and
reconcile raw requests with the code selected by the sensor. Userspace
opts in by selecting that raw V4L2 pixel format with VIDIOC_S_FMT.

Raw formats expose the full sensor transport frame so ISP2401 can use
its copy pipeline. Processed formats retain the existing global padding
behavior; selecting a smaller receiver crop remains a userspace pipeline
decision.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 14 +++++++++++---
 .../staging/media/atomisp/pci/atomisp_ioctl.c   | 17 ++++++++++++++---
 2 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 4d4c0726d9de..e7b817fd779a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3822,8 +3822,7 @@ int atomisp_try_fmt(struct atomisp_device *isp,
struct v4l2_pix_format *f,
 	int ret;

 	fmt = atomisp_get_format_bridge(f->pixelformat);
-	/* Currently, raw formats are broken!!! */
-	if (!fmt || fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
+	if (!fmt) {
 		f->pixelformat = V4L2_PIX_FMT_YUV420;

 		fmt = atomisp_get_format_bridge(f->pixelformat);
@@ -3845,7 +3844,10 @@ int atomisp_try_fmt(struct atomisp_device *isp,
struct v4l2_pix_format *f,
 	 * resolution + padding. Add padding here and remove it again after
 	 * the set_fmt call, like atomisp_set_fmt_to_snr() does.
 	 */
-	atomisp_get_pix_padding(isp, f, &padding);
+	if (fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW)
+		padding = (struct v4l2_area) { };
+	else
+		atomisp_get_pix_padding(isp, f, &padding);
 	v4l2_fill_mbus_format(&ffmt, f, fmt->mbus_code);
 	ffmt.width += padding.width;
 	ffmt.height += padding.height;
@@ -3865,6 +3867,12 @@ int atomisp_try_fmt(struct atomisp_device *isp,
struct v4l2_pix_format *f,
 		return -EINVAL;
 	}

+	if (fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW &&
+	    fmt->mbus_code != snr_fmt->mbus_code) {
+		fmt = snr_fmt;
+		f->pixelformat = fmt->pixelformat;
+	}
+
 	f->width = ffmt.width - padding.width;
 	f->height = ffmt.height - padding.height;

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 87c29a940f9b..9ce529b0c7b3 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -537,12 +537,17 @@ static int atomisp_enum_framesizes(struct file
*file, void *priv,
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		.code = input->code,
 	};
+	const struct atomisp_format_bridge *format;
 	struct v4l2_subdev_state *act_sd_state;
 	int ret;

 	if (!input->sensor)
 		return -EINVAL;

+	format = atomisp_get_format_bridge(fsize->pixel_format);
+	if (!format)
+		return -EINVAL;
+
 	if (input->crop_support)
 		return atomisp_enum_framesizes_crop(isp, fsize);

@@ -555,8 +560,13 @@ static int atomisp_enum_framesizes(struct file
*file, void *priv,
 		return ret;

 	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
-	fsize->discrete.width = fse.max_width - pad_w;
-	fsize->discrete.height = fse.max_height - pad_h;
+	if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
+		fsize->discrete.width = fse.max_width;
+		fsize->discrete.height = fse.max_height;
+	} else {
+		fsize->discrete.width = fse.max_width - pad_w;
+		fsize->discrete.height = fse.max_height - pad_h;
+	}

 	return 0;
 }
@@ -630,7 +640,8 @@ static int atomisp_enum_fmt_cap(struct file *file, void *fh,
 		 *
 		 * FIXME: fix the pipeline to allow sensor format too.
 		 */
-		if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW)
+		if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW &&
+		    format->mbus_code != code.code)
 			continue;

 		/* Found a match. Now let's pick f->index'th one. */
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

Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541A63C4551
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 08:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929109; cv=pass; b=SlZyu65nP+zXPOikD/3InP0Fk+8nmSFhyWVJOBspBfNbcLPnLgAAIyAqbYBO2eKFDhPO+9Pvl38ZK0YSJrgb1vnIGBhq27R8p7x0cF2E/KaPCXVCSzzDohnXJdzOpOn4Ut/fkQYH3Fjnb1Xcu/W4+0FrWeUAmv3YXakBb+4IA+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929109; c=relaxed/simple;
	bh=cGjU7/FhsAzIZkR5AqbDl7sNf/YZPkCSUa+7leu9fzo=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BfzlSgCj2UeD6ow5DLIcVBpqGwqksEp5Y5moEaOf8QqV7u1zMn7UY+/HmxAXnCcFtGYYMJBNEX9wpt0J4Z5IGzYh/jy6nDyqp+8tEZO7tm7KKaanpupd/AYj8lDV3MzdmpbopaGf+z5vc+ggK5wYEGWOd2CE50bOuV9CRNX7ChI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PqOwbto8; arc=pass smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PqOwbto8"
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-81f707db14cso3695778a34.2
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 01:18:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929106; cv=none;
        d=google.com; s=arc-20260327;
        b=J2dxfehg1FxCr4pM8CQmun5aXTTmN+G+BUzmrgtPYZswS0LgGoG6pZZL84uQKaT5oB
         fhvG9CdERq8STzpb0drGHLZIzhMPG9RwBgimXm7QupFaYMlptYtxix3lm+14BCGQceIv
         38o6mQ/NyVjl85l3aOZ+H9FswweHr/qbDMMfLH4jANGN8qK2w+TVC+lSb0fOyOvouwN2
         6iD5Mc0bPVgdJOojuPDZDVh4pCo31KVEReMxF8oODYJQ3pCGHMI+Iur1yUInNEZvyplm
         7D+ubLi894MmVl47Fnals/b0oT2WWNaKLKoPZBfyf7HxbCTuiCU4Qb8eTAW4OyPOhuKl
         HCTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=H+2eVhcyFYQvB6WR8E2rcLotxSCxNoAdRJ7uo5dqC0k=;
        fh=MMKexpnuMe+zQH7EFQvqIsrYvDzCSu7fuGlSiBVsNjw=;
        b=VT+W3ejBuqGNv0RnS+qb6fNk6VhXcwJrIXsTjaJEkr08s7c1oIsnrluhPYxAPMW27W
         cvnPOoE9HO1DO6vZARN5XKdl/YJer+fSOGn7VWEDLXHk1YB9AZD2VE4Ifg9ejPdyAaO0
         qEi6wMn4rjOzaazmhzisXw3Y0SS9wQap7WmvT8pkmwyg5Nar37hCtf/4wTXcnLztxREL
         qYQqX7aeTVk14gUqrhKsPssAoHYOE6fmQlNGFCEmVu+jYGu/U/9lQ1QOhtyj39rgU6Rj
         k+C8hAHPsXpZAOp7HCe03vRp/huIx8XhraEWaHP0YOXR43A5qyG8N6G7CMJSeBMyxfFV
         xTyw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929106; x=1791533906; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H+2eVhcyFYQvB6WR8E2rcLotxSCxNoAdRJ7uo5dqC0k=;
        b=PqOwbto8QO6ceMNBdfGx9qTvAdv+BSz+vPjObsRlvZfvUhA6vfvZTrZLEn3DfK/pJQ
         HBJFTiHPQVfCudwOf7F6IF2GIXjIfIxx713hkN1T1b9pMvnZ98pWjjB8JvBTW+HuLyUd
         imSHrqRtVgkeGG0jeTKukgWl3rqMr8sXPOM4O903QQ1JTts+77HeHjHXBTirZdsNa3vW
         WFVwRe9CyiWF2ENtc8i/3YBuI4nHXJS4TUzUpQWEeXEZjASDZmEYijc8zTtvaoj8gXTw
         Ua+z1f7+HkJND1I6kx4tXhn6CXE6U7L9q/0YoO5Pi45GVrigXSX7JgZaHjZsZkGlfWT8
         K3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929106; x=1791533906;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H+2eVhcyFYQvB6WR8E2rcLotxSCxNoAdRJ7uo5dqC0k=;
        b=lwl5WxSbnQ+qrp7JhsorZHKGGklKqEguxcAw7EQ40PXVoJzGfkfGldKFvFN8/hsvA3
         3BKPHiT/34xuzgrnFRDQQLhCm6q+6MMRToirdWzq0ValgoDPywM75rd4nJAckgC1CYVI
         ilrkNvChZMNz/TTCFVMBuCquaeIkbrYzadi9BWCg5/3N2JXq5o2gnR/b2bp1HQvlAoeh
         q/km872CoJgO28OjT9LKzZwX4eiYcpmL8AyLaLR2zUCmaVl8LtOxAFOaSWdB3ZN04cIx
         VaHsuSneVgpcZEVhUz9pEUmTpQ0MpMqNlBznSQf6adLYkO8gYVpiy9k/0mgw0KCXk/GV
         Repw==
X-Forwarded-Encrypted: i=1; AKwUvBxDMHWNLTJJaIFY0l35/EkrvuRt5rRSFsFApb5y21SUPoL0igQqgA9y/aAQ4bm7u11kIpIm67WRssnVSUsh@lists.linux.dev
X-Gm-Message-State: AFuF++krE4qdj9WECUYsLq+c8qEptZ471QOxo5h8a9Fl0IRB5J+OMFo6
	BLnfemDsOd47cfvhIScxwkFER5VojzyxpbzgZ/m5Oo/mdpxbb3LWmQFS3mWePcpwFnK0DRxjovX
	JHh7tbn5lQUWDrgdSjj3mddlSBwPH96U=
X-Gm-Gg: AYBFou1lzFROhebCXmazJNmeIlb/El8iGPS1fYzCXwHbQv5omj59TTXXPuEKIzzjDft
	wMIueqyvpY+Hz/GEdePTxVIJCV/8unOR7NWcLuXpexUMmxYq9UYHRNMlLO/MnA6BIEj1GMjPpRd
	SHdXH97S8ikIg8lbKscN9YqScBEN0pyBgya6XM3960PzpRIRfWW6+lpQy+pg1GLf8MrnRJvAwrt
	FO5HKt6XhhUkOmiTenV5v1bu9cDkICbB9tBQlgdJYIW87FDsmAHz8lkMVQGxYUplfrQr+8bTXyv
	EZ/qDPSE7dB/5wchqWiOVhzp0PbDT/A++AR7/MExx9nkRZFbe/nzCUbMu/L2dgjhFhxmjiBIqYN
	bbfA9GOjvQou87mehntyOvlsUSXg84IKVnTTbO1Gag7M=
X-Received: by 2002:a05:6820:c0cf:20b0:6de:1457:fe27 with SMTP id
 006d021491bc7-6df35751835mr1165830eaf.57.1790929106071; Fri, 02 Oct 2026
 01:18:26 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:18:25 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:18:25 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: mauriziocasciano7@gmail.com
In-Reply-To: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
Date: Fri, 2 Oct 2026 01:18:25 -0700
X-Gm-Features: AclHuK-Hi1IDcNwpre_Y6ZHzm2EeLKmSxo_YJvDRvJiQHnzoK8AHz4gyKppJrj4
Message-ID: <CAO7O_xhSjWWn0RfikT5dWxz9s-iuA-quqwpJj=Q=74W0mKAb8w@mail.gmail.com>
Subject: [PATCH v8 11/15] media: ov2740: release group hold after gain write errors
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Digital-gain updates start a register group before writing the red, green
and blue gains. The current error paths return immediately when one of
those writes fails, leaving the group open and never issuing its end and
launch commands. Later control updates can then be accumulated in an
unfinished group instead of taking effect.

Once group hold has started, always attempt both commands needed to end
and launch the group. Preserve the first gain-write error; report an end
or launch error only when all gain writes succeeded.

Fixes: 84363509c725 ("media: ov2740: use group write for digital gain")
Cc: stable@vger.kernel.org
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/media/i2c/ov2740.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index ca33ef30267d..4479666f17f7 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -696,7 +696,7 @@ static int ov2740_identify_module(struct ov2740 *ov2740)

 static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 {
-	int ret;
+	int end_ret, launch_ret, ret;

 	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
 			       OV2740_GROUP_HOLD_START);
@@ -705,24 +705,21 @@ static int ov2740_update_digital_gain(struct
ov2740 *ov2740, u32 d_gain)

 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, d_gain);
 	if (ret)
-		return ret;
+		goto release_group;

 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_G_GAIN, 2, d_gain);
 	if (ret)
-		return ret;
+		goto release_group;

 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, d_gain);
-	if (ret)
-		return ret;

-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_END);
-	if (ret)
-		return ret;
+release_group:
+	end_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				   OV2740_GROUP_HOLD_END);
+	launch_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				      OV2740_GROUP_HOLD_LAUNCH);

-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_LAUNCH);
-	return ret;
+	return ret ?: end_ret ?: launch_ret;
 }

 static int ov2740_test_pattern(struct ov2740 *ov2740, u32 pattern)
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

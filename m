Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1204E288C08
	for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 20:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776543503; cv=none; b=pk67atX7LdMuniYNotfTESkSw+83BSIJuu6ROnGLgHjtVRDU+ZQywhB9sKEzqEytLBmpO28dUeqPBn9Zn+M4d8l1uzyt6ChdArThpV9JCaZlgBMpKMjd4ypVsfnY8svpeLvwIskS2wSX02HxgksDQVnuu6RY20Y+H/bg4BLXK7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776543503; c=relaxed/simple;
	bh=JrBO5YbQDKA/sMD23kXqcEkmPjDyJVetYL0XxpsXWuc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XyGJm4ms322cVFr5KQ34JnejGU6IZiaVmcUO7p6p0oLlkxp4RvhdO46cvRkKduY1dZYvoumfT70MtFcrAEysJPLSGASPEaAHAE2XhQ5WxUtaiTFlCzfTunrGE61uiqsdnmEeLjqbgr//ynAlR0PF8jd7+Fj4uEVgnXqN5TBQ+a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=JQlLT/+x; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="JQlLT/+x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1776543485; x=1776802685;
	bh=JrBO5YbQDKA/sMD23kXqcEkmPjDyJVetYL0XxpsXWuc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JQlLT/+xjbL1+4esioM3O6N8q2jlXYS84NARRRtJhTjY+QMo9Z4s4cpMvRZwU7qbq
	 lU6PI/Lov8i3A1A6o5pxqtpXie/fHxrZGV60H9CyX0avULF+5BUncmWwyetIfqFDvJ
	 9raJ3j2YDYHbs6L8xMyGBApdnU401BcwqXs+diu1eDV+YKvlshBmydHmZVQ2khiVGV
	 DxWwULfsurCBgdcLBX4/c6NuD25jUxSXOdTmpu413nc23FAJB5XjKHb3gJF35bix5v
	 8Uf0hqJ6Zm7L0W0wv/vQqfIFCeAAKsIUA3VdCRgf8u15Mn5ifz59Efs5pks8+Kn4TF
	 9fhHZFBZWdPvQ==
Date: Sat, 18 Apr 2026 20:18:01 +0000
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Abhai Kollara <abhai@protonmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Abhai Kollara <abhai@protonmail.com>
Subject: [PATCH v3] staging: media: atomisp: gc2235: prefer fsleep over msleep
Message-ID: <20260418201755.2604188-1-abhai@protonmail.com>
In-Reply-To: <20260318212645.2014561-1-abhai@protonmail.com>
References: <20260318212645.2014561-1-abhai@protonmail.com>
Feedback-ID: 8137229:user:proton
X-Pm-Message-ID: af805ef3f39f723eb3dc035b5a2502a8e26d6137
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The gc2235 driver uses msleep(5) during power-up. msleep() is often
imprecise for durations under 20ms. Replace it with fsleep()
to provide better precision.

Signed-off-by: Abhai Kollara <abhai@protonmail.com>
---
v3:
 - Use fsleep() instead of usleep_range() per Sakari Ailus's feedback.
v2:
 - Replaced msleep() with usleep_range() (Superseded).
v1:
 - Initial version.

 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/s=
taging/media/atomisp/i2c/atomisp-gc2235.c
index d3414312e1de..7999c8595a68 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -433,7 +433,7 @@ static int power_up(struct v4l2_subdev *sd)
 =09=09=09goto fail_power;
 =09}
=20
-=09msleep(5);
+=09fsleep(5000);
 =09return 0;
=20
 fail_clk:
--=20
2.43.0



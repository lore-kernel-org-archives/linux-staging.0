Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D20F322A1F
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 20:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773952981; cv=none; b=fwO3TTX3bl3TCWCAeW73ieR50hAAE933LZwmnJR2migcvo6hP+b5c/CGFG0kPa8ROVsPkrh7dzOdKqzw2VOYnSKWzVp2UTZ2x71uMw3Dbvw5LlwR+qTxMfaFpEc4AdHwDSxDA3BXNAbqsav8tru5h7/WDuLFaYMLmwxMzmQjfLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773952981; c=relaxed/simple;
	bh=4hf+2P9AGl/IybtiW3qOGbmO4Ni/rutnBaEKskRIDZw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Eb5zm+66IKnjrQm+o8LARhOPfpfyh10dFKAGPz4GLme8K3x/RBoaiI5WljIlobD4ekqzaflKnC+ozbqlMtUhdhqnw7RhE7FGhoCfKaQljMVmLlF09WmGRlp2yzHMPthuZ/mcu+zv9m9O6d/3ImT9OI6XHGKEEInbECtl10OPXjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=QTKLQJCO; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="QTKLQJCO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1773952970; x=1774212170;
	bh=4hf+2P9AGl/IybtiW3qOGbmO4Ni/rutnBaEKskRIDZw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QTKLQJCOUXsaDk7m4yVsKOxnusyMzvDQVaQVnNPW8OnXsu/J4/kklRG0kY2BJ5jja
	 4Oqp0ZomnxwebxYa8CcECxTW0aADeNfOrqaEm1n5LsA3TEA7VOdIwWY7bVHGNX4Fnj
	 KKQyl1sm4CkOcfWDjnrlqy5B5pwlXp76IxdSR2SlEXY5bGcEsGjEvdymrK7qjlhXXO
	 Gbx/0KLUJZhTri6fbgPG6JbHADGvdUglsNJuTNEvurtxDVwW2aiGBDSrcFdCvqFTP3
	 fOxrFXdhG+Yfav4RnT0u+OW4eZS27wVDqcOwq2LaLnr8epZQHZw2086QOuHHYlgxtv
	 Nx7+cUF8V2Dpg==
Date: Thu, 19 Mar 2026 20:42:47 +0000
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Abhai Kollara <abhai@protonmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Abhai Kollara <abhai@protonmail.com>
Subject: [PATCH v2] staging: media: atomisp: gc2235: prefer usleep_range over msleep
Message-ID: <20260319204242.2076191-1-abhai@protonmail.com>
In-Reply-To: <20260318212645.2014561-1-abhai@protonmail.com>
References: <20260318212645.2014561-1-abhai@protonmail.com>
Feedback-ID: 8137229:user:proton
X-Pm-Message-ID: eb295a95d2e1e12abb5a57bc683bf2657fdde502
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The gc2235 driver uses msleep(5) during power-up. msleep() is often
imprecise for durations under 20ms. Replace it with usleep_range()
to provide better precision.

Signed-off-by: Abhai Kollara <abhai@protonmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/s=
taging/media/atomisp/i2c/atomisp-gc2235.c
index d3414312e1de..db5e007efc56 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -433,7 +433,7 @@ static int power_up(struct v4l2_subdev *sd)
 =09=09=09goto fail_power;
 =09}
=20
-=09msleep(5);
+=09usleep_range(5000, 6000);
 =09return 0;
=20
 fail_clk:
--=20
2.43.0



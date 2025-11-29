Received: from mail-43199.protonmail.ch (mail-4399.protonmail.ch [185.70.43.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546342EB87F
	for <linux-staging@lists.linux.dev>; Sat, 29 Nov 2025 10:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764413093; cv=none; b=dUvRZ7fpglFOThNpMFD1Ge8X8A6wfbHzQYOFSymc8tjVSrW1mSWtUCY1EMlfZnnR7+Nlwm+iUpPhrvhh90pn+pbWyRB6bS3pWU0pmKniGyCbW7+UU6jsiBLRLqUG2pFVqNHrZ1i3si9UHjtMDc/K3wGl7sTibuxtRNzzG+bvqjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764413093; c=relaxed/simple;
	bh=7FyOwhqHg3JEKopv/tVRQRRBWo4CnME2FFuv37OzSdA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=p/Pf7tP2k4l+BIQgdl9I4IHcQgd5z1Y3+aCSXXw6AzYUHkVulsZMwOH290XDbMv14f+851pg+zCWI3gVkTDsr8vX7F/HTF/7WxnfNXCoBYs7fxG1vD6ABr4+9mmBzKrHyAqrd27g7+iCEIId90/MKC7uBTnHPDCzhWw1JhUSxH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=parkour.is; spf=pass smtp.mailfrom=parkour.is; dkim=pass (2048-bit key) header.d=parkour.is header.i=@parkour.is header.b=AIxS6UFw; arc=none smtp.client-ip=185.70.43.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=parkour.is
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=parkour.is
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=parkour.is header.i=@parkour.is header.b="AIxS6UFw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=parkour.is;
	s=protonmail; t=1764413082; x=1764672282;
	bh=GSU4ft/LQAGSvukPJTYavgxlOykLmAtTuNUWK0X3J+s=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=AIxS6UFwQE+8OqgZhJSuRbtILpYPbCCo0EEcLCLUJuF105xsA5ZmVxXXa30dHFt7z
	 sSfKnfvX9ygWkoTNSgyHeOvPtRu+/PrlH72mUNsYrSQPTXI4HBI91XK1Tvzvg5soPK
	 Kl3zLsn6bVO7l/QcQWPGK7uTzQupCk6aPfyfkCF3922JiuCxUNM7Fh3TbyIlZoW8IS
	 JmAJ2o4YkDuaxnB2Ou2Er1314COspsA8TXP0Frzs9J2ZUtQuUFL7eBJwzYggMkcn1x
	 U7BQfHJN1H2Ro6OFoWHICoYotjCmPh2syfeducVtPifIgMKDV2mo8WyWa7jjJNCMI8
	 mYF6nJYpvLmFQ==
Date: Sat, 29 Nov 2025 10:44:36 +0000
To: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org
From: Sammy Malik <sammy@parkour.is>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: Remove completed PWN TODO item.
Message-ID: <20251129104407.145907-1-sammy@parkour.is>
Feedback-ID: 169234940:user:proton
X-Pm-Message-ID: dd4d3330df85c4dbdd1af97df2be76da5a658154
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The pwm.c driver already uses pwn_ops::apply. This item was completed
but never removed.

Removed the outdated TODO item.

Signed-off-by: Sammy Malik <sammy@parkour.is>
---
 drivers/staging/greybus/TODO | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/greybus/TODO b/drivers/staging/greybus/TODO
index 6461e0132fe3..31f1f2cb401c 100644
--- a/drivers/staging/greybus/TODO
+++ b/drivers/staging/greybus/TODO
@@ -1,5 +1,3 @@
 * Convert all uses of the old GPIO API from <linux/gpio.h> to the
   GPIO descriptor API in <linux/gpio/consumer.h> and look up GPIO
   lines from device tree or ACPI.
-* Make pwm.c use the struct pwm_ops::apply instead of ::config, ::set_pola=
rity,
-  ::enable and ::disable.
--=20
2.52.0



Received: from mail-4397.protonmail.ch (mail-4397.protonmail.ch [185.70.43.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB38306B11
	for <linux-staging@lists.linux.dev>; Sat, 20 Dec 2025 13:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766239024; cv=none; b=nTBVdOtdz++iVls16x8qIZ6ztHAjl2mlyXPN0nYi2aeI8rfuqNpOBSax+4qaWbHkjNVPSEq7nbEkPBmGmDL/T1aYpArKdQ4l3+nO1ld3Bv6tqrhjbPik7Vt+hpa9fIVvYtpnPUE2oeRz61YP11r6VM+7s+7R4k2t1sC835yR4dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766239024; c=relaxed/simple;
	bh=6fWe+oVRYsOV9HVbLiXz/wYYwaq1Bv5grjRxbEbSymY=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mJG0FiLBBbCm5PNEuIOrtTmNvASxZBi6UVKk1cGwelXr++IaaqKaH9GKEyDi0SGuOKF/MZDJxbp4DP+kMHajMAkf19Z/FR6rALNU18dQ4QSzWbuVtDEOWPe8sgQBOTOEuSEiK/n5/ufC1tYc/6UzZiTpL4JQssSLCig7OiERFZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=parkour.is; spf=pass smtp.mailfrom=parkour.is; dkim=pass (2048-bit key) header.d=parkour.is header.i=@parkour.is header.b=BWzJh9xN; arc=none smtp.client-ip=185.70.43.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=parkour.is
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=parkour.is
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=parkour.is header.i=@parkour.is header.b="BWzJh9xN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=parkour.is;
	s=protonmail; t=1766239013; x=1766498213;
	bh=nxDz1Vk+5ekSjMdlDr+dQjoEj6eaQ8Fx6OBPXnbcXbU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=BWzJh9xNLzMHVaXZz997Ddf/OcRwmEB2+qxE5N7ziNwjh8SIqvYvtJWc7vfv0XL2N
	 MSx+eEFLXmcTZ/wbcg2QCAGKFzaoRcXtrWoH4hDG1F/aCuNKY7sCaRZfaTSsoc8s3N
	 8LPGa0vrsrc6OQtFIl+3iviNHzXWWmNe+dGq/k9cniBJKQPBKL4Vws8TfIgTOmJcy6
	 N12w20KnO5OcBIPyJg9eA0DE0r++aWmAsLuKd8QtKxf8hgzs1BLBZ4wVznVaR3cbAc
	 FcIPja1RgXXGyuA0lGgIFeewamf5yNveyXL8GUva+L9dYQ3qOkDUdMqyXmWDtmz7Ru
	 +IRagoUIY75pA==
Date: Sat, 20 Dec 2025 13:56:48 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Sammy Malik <sammy@parkour.is>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] staging: greybus: Remove completed PWM TODO item.
Message-ID: <20251220135613.226912-1-sammy@parkour.is>
Feedback-ID: 169234940:user:proton
X-Pm-Message-ID: 97b67c31d679c3af491ce8a5c06a2860105b2a4d
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The pwm.c driver already uses pwm_ops::apply. This item was completed
in commit 832ce36f44a2 ("staging: greybus: introduce pwm_ops::apply")
but never removed from the TODO list.

Removed the outdated TODO item.

Signed-off-by: Sammy Malik <sammy@parkour.is>
---
Changes in v2:
  - Added commit reference 832ce36f44a2 that originally implemented pwm_ops=
::apply
  - Fixed typos: PWN -> PWM, pwn_ops -> pwm_ops

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



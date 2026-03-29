Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4132924169D
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 06:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774765379; cv=none; b=S6vZs6VKm6juAKpRd01Q4eUcRbKTjuceESlw7DqwI8uBJEra/f18AMJtA62lj7kEcc4taRa0cPyRU3K1hgaSy8z9zvQIoioRutZDtZ0QtWJlsC+nJc0UD69tXP8NtM4HBqz5KNj9evjBHOyBIvRLsyCkGHAbVbOs7qEAzVSnwnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774765379; c=relaxed/simple;
	bh=WTY2Bs+KWBi/xry+kQfHDmPb8Mrycu7xQELHKazIz0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m4rGnGNyGIrKpFQ/0RfhcnEkFaLbc2qer4DuU8lPcEBG19i8lQo30f7z44x9uu1d2vWynD8ZNyPaTExy0lKrg85KQJhUkR+0T6DQxZAFT1GZPUPjYsqdti0HWQ3YWsTRygOFXGaUxTsWFjGtR5ht4yRnC8jscjRoL2kRkduvYmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bgcbHRt4; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bgcbHRt4"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-951c5ac6253so974237241.0
        for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 23:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774765377; x=1775370177; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjxqXxyKEmiZIG77mggO3OoX/XZCUgPWLAbtN+CQczY=;
        b=bgcbHRt4vSx36c8b5T9FLnMpbAkHldrNNyPFjStChSKrbFY4EOphdZCZTXKLc2pyAb
         NLfrPt8/IUbL9mpIW01a5b+jgJwTCUOFMMoOE9+PFmB9MeARMIfgqF+OHRt3GO/pNLAa
         Ai6CRnNo76C5yR9Zpn9aDdlphmBe2yVlkctozC5s1B3nhlfLU4PuRC9ixnRldvNX8Ppg
         XV+5U95bkEcYQp0EClxFVeb/qZgYPodAsKlSOiPV8MjE6X5HtxT0bFn2CJAJxT/qFYYN
         wJ41I+RtcxWMPM0YYv5VjnC2W1EDenAVVsBlRHfd3V6khEnc2AbZsr/gjr4y88hkHp4G
         XO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774765377; x=1775370177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JjxqXxyKEmiZIG77mggO3OoX/XZCUgPWLAbtN+CQczY=;
        b=EZQXPKadInVyEyOgQbYm+7ZWTyRqDwsyC83CsuWUkJmqcwX5GIYZ8P6NcqG+dnhHl3
         J9WhOHL+DXLrIw8+XAykluV5RqkdS/rBDqfBo9ULZo8QF7/O/xRulTk/I1M4qa2kjf+I
         QG+BXs94KZtUNTjBb7ABOdYUyQq1Xttl9s8rrXkATnfStlrG6MVBa/iOwnwUP+cugb1R
         C+iQ+ZLX6q15Bm6TrIM2qHSku5/Ig9QXft9sA0eML9BwyPB7HXw28HDE12nvDUGw5oB3
         q7/J/jYvKaMGlPYZoAfCHCBXnzF0ZmbSiK8MnNAQck234bASbPRb4CRbHx/JaVOmZcKE
         PoeQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7lB4VKpFOx32QMNABBKSL4XpWuM0yDGcrzAw/TqJNNI0wSFsjp3LPq3q2KCvZQXnD6iusZBE579mHnVin@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6ANUJsX5n/4PLLg+ULzDCge47qVXlF/oB8wabEGwh1KScFHgL
	Z5zF1q9vMhIlxSHQyhlj4pJJoqw+KsLYLFWTCgNr6crNpksnNe+EVJpR
X-Gm-Gg: ATEYQzw1KGAZDIwscVYLTOJym8tOOYDyH99+ewYJAC+2jnH0BwbEmbIhIii9x2pIGdn
	Gz9U80nndXAouPl5aUh/GnNaK9laf4XwxLqiLVJPS2TZlrEf31LrzuzAfJLZ7PPe9XKulhDPpXI
	NWJVoz901GJ7Jd0Md4R1EBpmn24EA+Wb89ac71gyS+w9EQAtKrx+QgElYOspbiUR5cVahpMrg4f
	JLcUV+4fWmcVm/cyYAqZXcJh1e4c0KYDxdwEUHoNIt1wAo2i3tCVKLnSwxKTCpgHcDxOdLVuZ+T
	hh08c10LuF1Z7FMLcpQNcsONzEAtz7PFpjExPMJulBQfzeSYulY96n0aK9S+5KfwQjXcxn51D9K
	lld+FgqKJcRlW9QQeXYC5PhbZWk7SzasxYF6Khy/QzsVyyRwavHSIf9rYkR4cvALTVbe7z6/hXc
	TGd+HeXmWB86EQigHhCcDpsqpS
X-Received: by 2002:a05:6102:160c:b0:602:86a6:986a with SMTP id ada2fe7eead31-604f92f1d79mr2960909137.27.1774765377217;
        Sat, 28 Mar 2026 23:22:57 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6db:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512d3a037sm4475072137.9.2026.03.28.23.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 23:22:56 -0700 (PDT)
From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>
Subject: [PATCH 4/4] staging: vc04_services: vchiq-mmal: fix integer underflow in port_parameter_get()
Date: Sun, 29 Mar 2026 00:21:14 -0600
Message-ID: <20260329062229.493430-5-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329062229.493430-1-sebasjosue84@gmail.com>
References: <20260329062229.493430-1-sebasjosue84@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Sebastián Alba Vives <sebasjosue84@gmail.com>

port_parameter_get() subtracts 2 * sizeof(u32) from the GPU firmware's
reply size field to compute the parameter value size. The reply size is
a u32 provided by the VideoCore firmware. If the firmware returns a
size smaller than 8, the subtraction wraps around to a large value due
to unsigned integer underflow.

The underflowed size is then:
1) Used in a comparison that selects the wrong copy path
2) Stored back to the caller via *value_size, propagating a bogus
   size (up to ~4GB) to subsequent operations

Add a minimum size check before the subtraction and return -EPROTO if
the reply is malformed.

Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from camera")
Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 11af71309..914ab9215 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -1436,6 +1436,10 @@ static int port_parameter_get(struct vchiq_mmal_instance *instance,
 	/* port_parameter_get_reply.size includes the header,
 	 * whilst *value_size doesn't.
 	 */
+	if (rmsg->u.port_parameter_get_reply.size < (2 * sizeof(u32))) {
+		ret = -EPROTO;
+		goto release_msg;
+	}
 	rmsg->u.port_parameter_get_reply.size -= (2 * sizeof(u32));
 
 	if (ret || rmsg->u.port_parameter_get_reply.size > *value_size) {
-- 
2.43.0


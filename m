Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612591;
	b=x2XFPanYEszp3GGPrtHEMFJI1D+HoYh35+h86/sWBjUoAGB9cmqmM/Mch6npMPhNrYLk
	 4PaA7CcVKFwybZfO7dLngLs8aV72epbhcMqED+7KU9RdfiV8e0+g9SCJxmpKtJs8FuDAa
	 TqBXQR7FXAtVw5K4QXchq/Vr5yzBmWxgQbw9l/3hR7gfMaKQ4iJEjrQA+pNbrfJHpZWOv
	 MDW28dN7twVf3g5bVK3VuXgUdFoQ2Qy/I0D5BulMCa27+nmS5idKliXb3dN7tiay05p/q
	 5b29oXhrXY9Rwq8JoJRLabjuJdgsr3bvrP1IQdgPLgt89kKPJ02x/puXXMIjox/PoiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6B409QdOnvI4K640/GRyjBqzLJCAanW7cL4zy0aAKRk=;
	b=jxFuVV0qHyp6DneNSfC+eE3eDdiE94TicDxX4SuJGaco0XdOZUsFSlCX6mOsDLVP8eXP
	 Vw2EihItiBCdLipMUP5ClVz+NaZgARshM7aBUuOANy29T/dPV25AAfVI5wMhZOe7kYMDt
	 zR5bOdoEyFTBMc16a1523KdJeCqvqldwOSt/zW9rSCh80y3TPwksiTaxxkiFurVJK1wPz
	 3Fsbh90bECT45hrziELnkImAQLOsveHjnWy39PFad4d0FBQC+nJqZ28KhRuNenJ+7Jjm5
	 +N60BQ55CDFYTwhLKdHIRFoBTfyEEIglpuP2Mxy6QX3De73QrQjm0dhq6Fh58iyQXMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F89fhtHL;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA65606A32C
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 09:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AA65606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F89fhtHL
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so20843865e9.3
        for <linux-staging@lists.linux.dev>; Mon, 02 Nov 2026 01:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793612589; x=1794217389; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6B409QdOnvI4K640/GRyjBqzLJCAanW7cL4zy0aAKRk=;
        b=F89fhtHL7n88hXBYS917Qtlr5fi/88YsFWVrZSChdRru2ImFzWysRVVVY7ZEQQKisH
         xO50bnInJ0ObdNXIfehjengFIeKjFMSEGNv4jtNS3Nm/VPEPhnZO9FFa/Vg5h2hxB5+C
         HnNIxaYV5SEBG9FFy9qLVhaPTnr7EJjjUWJhWAjRbRoOVS+wXFbSF6U5a2BHDCvxJTBj
         dsVBZdGFYfRjMwIFsBBDJzg/kEDYWGDP7Djs7G80ZPSSLLmyR8vcmf4uuO/CyEJwlNBh
         0n2C9wFt1GwolqAZnVIW6ykcraNAJFQ3UgjO9KTRDDdAigP8y9KhlwcAOxadJO/GhtRz
         g5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612589; x=1794217389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6B409QdOnvI4K640/GRyjBqzLJCAanW7cL4zy0aAKRk=;
        b=lGieCYoM84dj+YImvfXGSEHOlf5XlcFcXGHmGzV+6ToqDaPuA/bLdFjPlPXixlvrkf
         QROSdoqJAbfyHNtXwr8NvopKUoLPO8ropRaI/hnVwuH/hVjHBXIyZoBsBSnZoDqmOSms
         45gIwqRSW6dvT68weNgZiCwGSalf4EHMLGIk3yXJjWdS4s6KzeMTBOH/QKIy2+LhXOBB
         D3xPWcUYtN2f6kc5L9tnywi0y+4OpxXAuHirCyuxrrANidwfD0ITN74TppwnW68TXDAY
         1lodHXtlcExJ7s6L76ASCdmlGDb9445MN4c0eRDXKpv5yJ4A2u8uEZP8IwuGft4NpbbW
         hI3A==
X-Forwarded-Encrypted: i=1; AKwUvBxErg5KFdFQn/qRPFnGQb38ZP+4yJV1R1yhtEJKtQ++foPSIesrz3+aeR8e3ehN1TpZCasg0znii97VI0wQ@lists.linux.dev
X-Gm-Message-State: AFq9FYJCUJTL61pG/xCZMdVI3uF6OJ7xeP6mkCWecQACPBZxAg3D8UQK
	oc/E3Q1ipr5IDwebkZgFuZcucd3imp7XEa1FNltkQLwBa1JPHbmUY2VJ
X-Gm-Gg: AYBFou0NnaL+LXLQzjM0IXEH1xhFSLyk7aAHzCnlREL21+Br+KGt3/KSVcuYCaMIoXz
	REklXscmQYraRT+KFpUPzM9xzt2QdxClTfY2VQaMa4jSRr7XPj7p4dPyOAPXO03JOfjC3G/eCpZ
	b5fve3atzDQZgiijoq2afm0XNtZX8Ih9MHuRx/wWUVuVz/Peyy9UKbiPiSx/hWGVdaCbLjWn3Zp
	Wb+ATUDQqf4lKUY96xe23shXYNsPt6kbs3ylaY67NmWu4kAYzzR1tC++JkI8wQf7+Esjun8T9+D
	jVJc6AfXBddl07wD3imT59rWIIIPk/oy0yuq9IrWF9L1xovWZi58ueOxl2utqd0NqZkrI9Q8DU4
	tL+04UeMK9z+r5UxME0BLofxUN/5Qy5eRYseSG75Nv4d5lI0LJGEkuQqtTBeGih6mQsJYuFrcE+
	iXR9rn1ukmy+gfj5pwCddFvKgrfbaAEjKCeQ+f/Ixu4mMvD7N+92anMNMOwf3pGM943RVzFusl3
	0d59zDXVUUY0gNVX0WADoTp3Q45c51PBjFXcATv8QjwWyv1v7yi72JsTlA7zDxahOsdIyKMiFkb
	cBIYlTl5SX7z+pYOwRDM2jK05izr1PGJyRD+rGc=
X-Received: by 2002:a05:600c:b8a:b0:4ab:c447:49df with SMTP id 5b1f17b1804b1-4ac182dca8emr210351705e9.23.1793612589183;
        Mon, 02 Nov 2026 01:43:09 -0800 (PST)
Received: from fedora ([154.183.179.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d295csm332507285e9.7.2026.11.02.01.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:43:07 -0800 (PST)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joshua Crofts <crofts@kernel.org>,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v3 0/2] staging: iio: addac: adt7316: clean up header inclusions
Date: Mon,  2 Nov 2026 11:42:34 +0200
Message-ID: <20261102094236.57757-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up header inclusions in adt7316.c by following
the Include What You Use (IWYU) principle.

The series is split into two logical steps:
1. Sort existing header inclusions alphabetically without modifying the
   list of included headers. Keep subsystem <linux/iio/*> headers
   separated and insert a blank line before "adt7316.h".
2. Drop proxy header <linux/kernel.h>, explicitly add missing headers
   (<linux/bits.h>, <linux/err.h>, <linux/errno.h>, <linux/kstrtox.h>,
   <linux/pm.h>, <linux/string.h>, <linux/types.h>), drop unused headers
   (<linux/i2c.h>, <linux/list.h>, <linux/rtc.h>, <linux/slab.h>,
   <linux/workqueue.h>), and maintain alphabetical sorting.

v3:
 - Split the series as suggested by Joshua Crofts: patch 1 only sorts
   the headers, patch 2 replaces kernel.h and adds/drops headers.
 - Explicitly include <linux/err.h>, <linux/errno.h>, and
   <linux/types.h> per IWYU following verification of symbols used.

v2:
 - Address review feedback from Andy Shevchenko: drop <linux/kernel.h>
   and include the headers actually used.
 - Split the original patch into a 2-patch series.

v1:
 - Initial submission.

Abdelnasser Hussein (2):
  staging: iio: addac: adt7316: sort headers alphabetically
  staging: iio: addac: adt7316: replace kernel.h with explicit headers

 drivers/staging/iio/addac/adt7316.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

-- 
2.56.0


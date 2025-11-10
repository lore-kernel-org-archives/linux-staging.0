Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A752830E0FB
	for <linux-staging@lists.linux.dev>; Mon, 10 Nov 2025 10:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762770343; cv=none; b=SGMRJvyULET8qKNntAffxqvdT5vLOmAOsXhpuE3y90YxTikcpP+LP5LOO+yb+nbhoDtMDK6C2QjgumdNzVZtEB3/3xPV8f88Nj7J7cetbPUUKkInJWekKWES8KCVjqdSywP4oH0LnmmC7wWX2e14gCGNmYkCAMTM8wZwYlERCPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762770343; c=relaxed/simple;
	bh=Frd8hw4dYLxqNXW8oZMU3F/+0VvHIFZEWTqp90N9D5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pJpTpgfLFzujUzcRpT81vUz3oJjboyk/PadImD/An+EuqN7bP+3WEIzzP6jexSaKsFsd+zYtekLYfdz2q3xuBh3fDc/d2Id5afVKmcjNt19rPkuiCSOiVMx8WFk/75H4nJwJJDDYgsIf3Eigz8lD7tt/FOzprN3zLvJ1hvuSzSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aWgHhHZB; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aWgHhHZB"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477563e28a3so18851475e9.1
        for <linux-staging@lists.linux.dev>; Mon, 10 Nov 2025 02:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762770340; x=1763375140; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytGXTNjC8Z5iSUdVMoFae3EHPD5igwJPE1XmSPrltk0=;
        b=aWgHhHZBF2NTy4TBpt8KjPIx81GtkeQay8j0kIQwHRhyWh5Kh0wdytCyPf1jc3ekOr
         bIVjZON47wcwdeJo9kTdzeYm9hwByvrDd37wNhiiwsWBcC7YLwjrcFgxwYeBuGP9vZV7
         FbYSlzqYgJIeCv8gped3IsxXD+Euq4ibe/WgJfmwJ+notkRiG538g6RXeKYYTU0cWAUC
         GFrUHlWb9zcnzInl+SaYIgbjdft5VetcXm85qnBNj62S7VC/Qb03YsrFx9PbA2zk8Vrl
         7HmN6b8uXREu9TwxFDDRXB71+k8XQi4EMbvUO+eiWXgw1CYyTuyAhn3HmlLEVAftu+uy
         bnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770340; x=1763375140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ytGXTNjC8Z5iSUdVMoFae3EHPD5igwJPE1XmSPrltk0=;
        b=v/8iFBEjcmXLtwPB1RbOiJc9CwE2NyakUE3nfbESMuwxTfb0fKXmx8BpHj4duqcOeR
         Hk7Rm4JH6UUl53PpHZ9EvKRsfO6QrrACn0rFAC1zyDAnWpkmxrNzBb0UJ/z6r4ybeyKt
         fzbig0BQsRLyg64/S/Ac1hppQm1qVbl7JRD5sSFPdfq+LoVmbGG18ohKrDeP/V8L2UFy
         EGGbDAymvrc6JRk+YcJMVu1JzkPOB8E1vJ9gf0gG8Xtw4QNHrqlui/MspLjP86r6Z85W
         otdwpG/yyplZMcfd+uJogMHCpojsh6fVq7xVJm1oeCiyeRHzi/xsDbfFlhDx7FsG8B9+
         8VoA==
X-Forwarded-Encrypted: i=1; AJvYcCXo9lsKnny+s0tyZ5kxRgI1zO39j7oQRZSvVfC0F8ktroeXnzyDUSVcJ95uz3WHgNwsb031aOpq/j3VPQv2@lists.linux.dev
X-Gm-Message-State: AOJu0YxltiSHbdoUdmicXelqbSRISRaIxsr/mmdnhk12l7p91NKkM0X6
	ALJV50f5AgPSdxpUEHfCmRK9sIDAgoizaawuO/08GDzx2ZsEyPevOVux
X-Gm-Gg: ASbGncvyjWdLRwtel274PlxXW4nH+zFwbSvhdVZwc4MieFeOpOwO6TAl1y3Bziwd7QG
	Sr2OqmmQife70cRY5L9XYN5jRpkDsiaqL6Y9gIKfLqMYriE9j9KYV+i6qF50s6uasHWI8OpxXVA
	2PaFN3nkO4cvBvYmkBiUzNVbg/8Mbh7RAuvwOs70OoOdEONQZg7SaRK4VFhBkQJLq0CuRy8WuCJ
	DVC5Hfy4AARYQa1vU54vkMWPrUTxKdzNedqpnpkeDg451IgKjIKq1KlfncAyr+BZpDnUVNP+/iS
	VHPD4mHWtE1s7mJ267sR2KjLmMaRKV58bT/c5phm4+66hNKZ6V0XHi15HDHwGrDHozh9uB4VtDz
	Bgt7zNhT02h/Bdwn+G8xeoIJ/s89TLqaX01cPvMU9M55Djv6fGZrvrZJBynZIJ2jdeZo+4Lv9PF
	4q1/lvAra5+klFwKeS
X-Google-Smtp-Source: AGHT+IGs5K6nIRJvSlRanofUly7s8XfcPvPm6T/Xv6CDWDlt5Y8NVKkMCch7JYaVka+0Jp7Du4nnrw==
X-Received: by 2002:a05:600c:34cd:b0:477:5639:ff66 with SMTP id 5b1f17b1804b1-4776dcbfed3mr90862785e9.13.1762770339837;
        Mon, 10 Nov 2025 02:25:39 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4777a96e7f8sm67326715e9.13.2025.11.10.02.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:25:39 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 11/11] gpib: Add build rule for gpib to Makefile
Date: Mon, 10 Nov 2025 11:25:07 +0100
Message-ID: <20251110102507.1445-12-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251110102507.1445-1-dpenkler@gmail.com>
References: <20251110102507.1445-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the destaging of the gpib drivers we need to add the
gpib rule to the main drivers Makefile.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/Makefile b/drivers/Makefile
index 8e1ffa4358d5..d275b1526cdd 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -150,6 +150,7 @@ obj-$(CONFIG_VHOST_IOTLB)	+= vhost/
 obj-$(CONFIG_VHOST)		+= vhost/
 obj-$(CONFIG_GREYBUS)		+= greybus/
 obj-$(CONFIG_COMEDI)		+= comedi/
+obj-$(CONFIG_GPIB)		+= gpib/
 obj-$(CONFIG_STAGING)		+= staging/
 obj-y				+= platform/
 
-- 
2.51.2


Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99D725A33D
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151129; cv=none; b=eLBUxxskKFFOuaf9AnEN5Tp24BDT9ijFv74EgDGg7/gDV0arnBhYPdqA932jH2ixEtMKZK3T5SdoMLs/uWUcNZvBoX5OWa3BiI3NyVOiens7U4CsVjmrtsmWxUa26Gp8ZcxXFNqaKYcb1fdOqAGicJF3JnX52n9YdcskrABbV6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151129; c=relaxed/simple;
	bh=pwMACUUFlk6EJPa4bMjnzbX97hafZSOHuPR4dKrIeeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UTDa27YT4jxLlFnkrAEjLvfaeylYFLTbGkZgqfVtAQ70evs3zFTNe6sSVng+0llZCHBTmPI5c55gMUNYRZulOgSSUUMQ91caFlrCy6tbUqLqxUXAmL1vtuLkaf9/D3BnIGXwHGXSj0WK1vLmbtRAbIlhr0c9YmW/zf0KiDFAhm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=YZAHPnaY; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="YZAHPnaY"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso7422672b3a.2
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151127; x=1744755927; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6DPxOlzhlYllRH/6vmFWTeCTxnNAuVnsmGi0YRNeL4=;
        b=YZAHPnaYyuD21Ui7evCffh9sZmqI63CL+8VZKUXukXFibiXcALEjRCko9Tl/jvJnNG
         uaE1ZyEvoAZtZeR6vyrMdST6ar89Mmew7tT+s9FvLnQ7KCOGhJtFTu1xiBjzNJt3UUAg
         xCFilKMUtG2rGsub3YoeyM2aoMG4HmlPdu1ynJkKobGEEGEThA2h1sfLMe+q6YN/KnUl
         Az2GjF8nNZewopOdB41MryCzPFsDB0Y694ulzm811iDQe3oq281Tr5nmNgZjIUqY++NX
         RC5FZd+YO01LZThdPKQTgoXJaKUHn/QUQ2ELTQsVIPCn+/Y2d+OzC5bZ9oLl5DiSfZAf
         6T1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151127; x=1744755927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6DPxOlzhlYllRH/6vmFWTeCTxnNAuVnsmGi0YRNeL4=;
        b=f8x8d5nJFaGaISMbWGNeNK65L74wlJu5nfWe2WdnggwX/WUvGHsoBPa+Cs4Y57IntF
         5T5Q2hjV72mnkShI0DJOluUeKWATXGxMfJ7J3oNbp2tA8t7SgMYrlD5McY+iLC4F2iTM
         1YWxt7e84ag4MMmaCmBQ2Rez0iC8a57T/lJ0B8UBc7NWLpBnZ+yWUk2Ky1XsIl/LTT3/
         ZftALi6curqLldOl/56QOlEC0CmqxXsIJVGxnDzEyg0WclYqQRvsvPNZAqEZrRgipwJC
         tIHyiNyrroMgyO3XHYDIW3yBNawzfd9UTfiu3MZKuUzky0fF4xVcZc02G4Q+sDwvgXuX
         C3oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbekM3yVrfjKXSs33Z1Ts862K0q8c4LN8mk9siPcK/n9jilJ6AlYbtLnI+98QLuNf4wN2U11jr20M1Q/Gj@lists.linux.dev
X-Gm-Message-State: AOJu0YwBf+4AZ0TKkZO8XsIDWtEVKBdAKKV7HlbyuIoEhydhjpfMpmG7
	AWGoP2Sjr/4vtIj6gQ9Y1Sv8g8Cifp4jWZ61G6B+mdQy9d8Sm/fHzrkFaB56sw==
X-Gm-Gg: ASbGncsqthzmtWoXgdHL8LEg8IGxPX4uxhN3CDS3MIev7pg6s5nZ5ZqkUS0b889/s8Q
	ptD5SA5wRkHckm4YK2LGQyfSV/XWQuzvqAxlmBIeM5MRZGHGYRO2jj2T/ylBhUZHrZ1hWF/wBbC
	uuz/OI9LxxMf4MD8yJCqzWf6C6Yz+ZDLRxFX+XxrG/HqwAF9dpunNFwjj0lpwN+0LVdVmyUSRQK
	74Aoze2KCjvjjrWzbwM1movXKU+Hym3JxxvQ6c7WE3ZggoKw/yMDR3C83P3H78DtOHORrVXyB6E
	YZOXTsrPkw5VLcJUTuoTEkdFbBA6RIFymYA3m72reKdyLZtFYY4fq0VvejUJN1IVEK5OnCKfwKk
	n1RdxtuYspA==
X-Google-Smtp-Source: AGHT+IFdRcMhc9cN/ofWKCjwvcJpIKZ/rH97I+mHfxpG86JlK/ig74gEs6cZ8zLKxi7JsG/vNcg/Vg==
X-Received: by 2002:a05:6a00:2e0f:b0:736:eb7e:df39 with SMTP id d2e1a72fcca58-73bae55140fmr865204b3a.24.1744151126998;
        Tue, 08 Apr 2025 15:25:26 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b3009sm11133766b3a.123.2025.04.08.15.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:26 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 15/18] staging: gpib: ni_usb: struct gpib_interface
Date: Tue,  8 Apr 2025 22:25:01 +0000
Message-ID: <20250408222504.186992-16-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222504.186992-1-matchstick@neverthere.org>
References: <20250408222504.186992-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index 14f7049a8e5e..715848a3bb75 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -2361,7 +2361,7 @@ static void ni_usb_detach(struct gpib_board *board)
 	mutex_unlock(&ni_usb_hotplug_lock);
 }
 
-static gpib_interface_t ni_usb_gpib_interface = {
+static struct gpib_interface ni_usb_gpib_interface = {
 	.name = "ni_usb_b",
 	.attach = ni_usb_attach,
 	.detach = ni_usb_detach,
-- 
2.43.0


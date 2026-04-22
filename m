Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835333CD8C7
	for <linux-staging@lists.linux.dev>; Wed, 22 Apr 2026 11:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776856623; cv=none; b=lKR0iEqEWEFcOSu8O1jbibyfnRWRGwU1GDK7BHOCDj4qeQJ0aeptK1a9m0Bo4/02At3A5sDEg8kcUhZHHi86vMy4OpLDaFk3ZlcXhXeeJkO1nvQrrnwJ6Gznq7Bf8lR7y3Tlw6v7/F+QDDPZqGyVz15yxAa8nzbtx/eUONBtbXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776856623; c=relaxed/simple;
	bh=nikLaA78L13NJnXz60ZFuoAdhal5Om5tpindurSqR+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cHb176gGR6noVxN1N+dhs39Fuxh/p8Nt/LMTganpsM7oUWyxyNcnIFoFdDQ28Y19SbbVYYPqe5kRl0jUdj6g8tSKovmXT6x9wO6s8p5pmjbx0arFKF1axKHu0x4Jdkm7Pt6yJ8uPFqDQKN0CRPy3HEfi19on1pLdRr6FC++If8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mt0OTRrN; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mt0OTRrN"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b2ea1b3962so31087295ad.0
        for <linux-staging@lists.linux.dev>; Wed, 22 Apr 2026 04:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776856622; x=1777461422; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2n2qVtDxXB1QkZ7SDG3S4ms/93RE7PN+H3Oc8MJU/I=;
        b=Mt0OTRrNC5nXDPiXzLq31qalpUwg1x0FQKMp7dMMdxKGuphD4DcTkUxzEVzyVz99dQ
         HpmQBEAc9oB7ZEkrFWXkfbRe3SG6gXRj9SsQu26fUbWEVqi5unRdtnrrOZ3KLgRSWWsf
         VQJYR1VaIXxA6vXCP5PY1TNxYeEk20LakgkLFRS9IsAP+E5bT00MZQaqJFyo6JznPpki
         AL87jh9NBH+Azbp6/GvN9W9/5ZHxKYOxe4/Xiqmv/fpqVD99fei70g/nCFaOriMCY7fW
         JsEaXhXBug3rA1aKvuA71W6T7n2sZcqsdUmLxrJMt+IkbpfRoKWTUN32utY+L29KdCOT
         CCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776856622; x=1777461422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+2n2qVtDxXB1QkZ7SDG3S4ms/93RE7PN+H3Oc8MJU/I=;
        b=hAf5sRPrseGc0j+hqu77cxHfXUK/phu14tZzAaeX1/u/3liDrlgYNh6yRp3WNmMm5a
         AvgV/4Zpofx70wM87Woyn8s34huyYXeU4DbwZsPdmJZ/USbLrCuxGJf4i6UhOd/v/O06
         Ymb8MfGetpW/Ep3vnr4EFBFXEyGREwCYObueF4rprV4USGng4giB/qpNSDtZb2zW6NoO
         xXbbHuMhwvKdPOvfgVw84FXlfrpymFPPi1rbpT0Jf2nnOfOFK6jd6VgASEH6G7Op5R21
         0duTzeWCywiSFm04CQyXU4aw+3TpbSoNUGlvYbS6Zs70ZoDZfTAqV8q6EFwEXpbgtKR7
         R4UQ==
X-Forwarded-Encrypted: i=1; AFNElJ+VEQz9K6Ua26P7JYVKOO0/iP7AZ0yhzGi6mI/naZe6HkRyJbiSeDpye+P64qS/kIePLKfKDiEoZkhnJzzZ@lists.linux.dev
X-Gm-Message-State: AOJu0Ywc+itP9AznD/7YQ80tbJB+RxjoUEW7ErLCHa5wqh0BOODiUjeG
	uAXAk5aNUJBb5vQ74ObRaPwJnH/4DLP4rwMTB04pEoLtdV3sH9ke1K4s
X-Gm-Gg: AeBDievb7l7LYe0gA5CCvOjamDMMZqvQX5aODaUqVWL1lulI8tdIUKOWMXlq4L8tHp5
	EWbL1+9b96+YLmS2fGj6b1UkyFjefU7oGlSwzq/WJZ+VynZlCGL0Gj0EFcL4DONpmosGBiOvJAa
	K3w75AC7FSnCK4uijhuFzFQ7wrSr8FxzgTVD80YzniwsxNExbxVX8VvJtXbkP2p0gVu8Aw93YWU
	UL3iUctlngB1kGKvO4cg+mmq63UAz2Jmb0JX/4f6CsAEfu8qyBo4PiCutz9mQoP2bdEdBJhCAiG
	dKuy4JkgQ5mlXZNPI8h8NBttFwRdq01KauAmdYD9sbfFdEVsCWv3XoK5KtymM9/GOOyNBPjzmIe
	VddJs6qxtsdjzMLBL9sERhCQ+UPjVhHscSAZGfCcfskBLLrtHOH1hV6ul22wZMCsBRHLxooHsaj
	a9GRrb0lleUDLfno/jZWFOddtm2B/uAk7gBI/lfqVLDYW+EfBoCq7c
X-Received: by 2002:a17:903:3905:b0:2b2:5840:80c5 with SMTP id d9443c01a7336-2b5fa007e8dmr230079155ad.37.1776856621760;
        Wed, 22 Apr 2026 04:17:01 -0700 (PDT)
Received: from arch.localdomain ([103.182.132.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cddfsm232798835ad.49.2026.04.22.04.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 04:17:01 -0700 (PDT)
From: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: andy.shevchenko@gmail.com,
	andy@kernel.org,
	debjeetbanerjee48@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org
Subject: Re: [PATCH v3] media: atomisp: csi2: Fix DPCM decompression for source pad format
Date: Wed, 22 Apr 2026 16:46:49 +0530
Message-ID: <20260422111649.9604-1-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aeinCTZwB871zRAd@kekkonen.localdomain>
References: <aeinCTZwB871zRAd@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Apr 22, 2026 at 01:46:33PM +0300, Sakari Ailus wrote:
> It may well be but the rest of the driver doesn't appear to support DPCM
> uncompression. Rather than trying to pretend it does, I'd instead just
> remove any references to it.

Thanks for the feedback Sakari.

So if I understand correctly, the right fix here is to remove all the
DPCM-related dead code: compressed_codes[], atomisp_subdev_uncompressed_code(),
atomisp_subdev_is_compressed(), and atomisp_find_in_fmt_conv_compressed()
declaration 

And in atomisp_csi2.c just keep the source pad copying the sink format as before, 
but drop the FIXME comment since we're explicitly acknowledging DPCM is not supported?

Please let me know if I'm on the right track before I send v4 of this patch.

Regards,
Debjeet

Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B201ACED1
	for <linux-staging@lists.linux.dev>; Tue,  1 Apr 2025 14:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743517081; cv=none; b=SHQWiYm3v49YwgGSuWxMs4NlvbLmZ5Yk88a3We/ER0XyTOgvvUAD4vv/VhfbQqB8HHDMIyIUJdXhdAbKVmfe8A4zryZ8buOjUAYt3rOs5MHm+UKfbnOsghdtGw7k0Kdq8Rps2KTKlykoG3+bNwSz6LwH4g2rKcJUqAxM2au7HT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743517081; c=relaxed/simple;
	bh=FJlsgq2QzOzhVpe+zVW0YCghAx8UZtTofJGeg+Vorl4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mkPU7Y3hOQeRgMDlS5b3jKEwLBrklTRhGqlVvqb5LP+tCusbTazTeStxwz9dW1mSbzzjwetVUhU+vqvIL4dRk4DoIHtFdHoKATXWGDNKx1K3fu25XQCHLZ5nBPPXHe5fgnshf+nGenD+QwlHbUBGl+a+54XTQ4FvBrHigoLCvCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ixQRzwxx; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ixQRzwxx"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54addb5a139so6250311e87.0
        for <linux-staging@lists.linux.dev>; Tue, 01 Apr 2025 07:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743517077; x=1744121877; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fMBJRbWhFak+sAV1ZffRRNyDINUZZx4eH4dy87DFJ8c=;
        b=ixQRzwxx49F4NPsY0QmDrr7ZixwUrNfTxGX4Ex+BmjIbFSiJnKWB59xiY7Y3XBQWwF
         jCvd4morJTCpCpsOjJu4jI7yr2dnVcGGVV0rRycwC1ARRk7x7GC8bh+Rf/Eck0G9ULL2
         8jjPf6EL3CBWtu79VfWUt3Kh16SnDetr3AIiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743517077; x=1744121877;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fMBJRbWhFak+sAV1ZffRRNyDINUZZx4eH4dy87DFJ8c=;
        b=khCczLZ0qSt73/hVg/7BqvpmcYjWbeH0LeBeWfmfw8h7w0+fz3BNPiE6rf89n2ELWv
         i0DWA5WQ/YgkBbdnVj2DfFQEa06PaS2wy8ncjtbS72G7T2q8qO6jWCw63CdkG7aZq32U
         8F+5wuQ6babwrTTvy7RhElk641cEFNImeKPbLtgyh7TSIfzWL/G6zjaH9NC+qMs8kuN4
         nX9lkXOxqy7JDTXjGXOjKKZSHO2OUqHJOanTN2iyV3J6S4D4BvwyBzpBDwJtd/1egofC
         1gfUJkJcyzk/Ziw096JVw8TrjtNRXxY10FuCAz1O5o2ii3+EVqhz60/3It4dzMaqwLcr
         5SZw==
X-Forwarded-Encrypted: i=1; AJvYcCX0udeZWosuKS8vLvKZd1f5expDrLk3y08fImvUP5Uofmml+sVo2askzN2rZGE7kghlaGqrzrsJYeKSFHbF@lists.linux.dev
X-Gm-Message-State: AOJu0YyzSfGdVOgVu6dRh7oKTeYBT9BhA6RA9g5iSKYVn9Zjkw1N0A/k
	j8nAzo8dbwOB5sHiz8OQ0n8KUP0N2G3q/3S3EPKVs8mjgS4Lg76s9sU8NN4SXA==
X-Gm-Gg: ASbGnctFnH67BQdzvgzyHzQvOLY0E4HSGHoFVtQ5mshIQfzj+ccjQ4beNcumYbeFh3q
	qs7j1WE8BMu9KS8w00cen5QvQr6t4D8aWl1gD0UO2QYMakrhr4V9rYWB3wkFXsTtFbGWq54YeOC
	jCvuK5DMswWt3g48kCR6ygbakV1QSUivaWRU6TYhOKTfwisscS/d7NSw8fekPCAhR08YcEquLPv
	nPcyLSTXD5lWTEKbhOaDfT2Sg/iFaDan5jwDNmk4T+8n/BE9hcMjoYlwPDL5J+Dfx9VSp8aWRJE
	jARi86NAAWIGoy7ub0veNZopT2+7kEEnZFPQSUkokjpKF8mznf+GHOm1i0/gEGyvG+8TA6m1GIC
	KJws/ObKyqkFVIrAwwATUMKeJ
X-Google-Smtp-Source: AGHT+IFJq5w2B0dugOC2Oo+nxGo04pCzcOgC1humRSBZ8othsPmNpBduKudyA9YdVBqoa7doalBKFA==
X-Received: by 2002:a05:6512:3d16:b0:544:ca1:da41 with SMTP id 2adb3069b0e04-54b11128170mr4067328e87.44.1743517077405;
        Tue, 01 Apr 2025 07:17:57 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094c19a3sm1377789e87.80.2025.04.01.07.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 07:17:56 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/2] media: Fix gcc8 warnings
Date: Tue, 01 Apr 2025 14:17:53 +0000
Message-Id: <20250401-v614-v2-0-53024c4fcdc7@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJH162cC/13MSw6CMBSF4a2QO7amDwqtI/dhGGCp9A6g5FYbD
 enerQwd/icn3w7JE/oEl2YH8hkTxrWGPDXgwrjOnuFUGySXmislWO5Ey0xr9KSUkVZpqNeN/AP
 fB3MbagdMz0ifQ83it/4BWTDO7N11djS96iW/ukBxwddyjjTDUEr5ApzoCtybAAAA
X-Change-ID: 20250331-v614-8485d3382935
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Kernel 6.14 has increased its minimum gcc requirements. After bumping
the "ancient" test in media-ci 2 new warnings have been found. Let's try
to fix them.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Incorporate Hans changes.
- Add comment (Thanks Andy).
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20250331-v614-v1-0-9bc69a873720@chromium.org

---
Hans Verkuil (1):
      media: cec: extron-da-hd-4k-plus: Fix Wformat-truncation

Ricardo Ribalda (1):
      media: atomisp: Fix Wformat-truncation warning

 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c  | 4 ++--
 drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)
---
base-commit: 4e82c87058f45e79eeaa4d5bcc3b38dd3dce7209
change-id: 20250331-v614-8485d3382935

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


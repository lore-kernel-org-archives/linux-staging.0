Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613AA1F3D56
	for <linux-staging@lists.linux.dev>; Wed, 22 Jul 2026 05:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784699195; cv=none; b=ltyqWEPWs+CDC0xaU+sBvXci8P3Pdl+3yUu61Yv0HZ0GD3uQX85UDisEHL5ZcXHppj7+H3UtK58ZgYRRf3yA2KYMxZpo4SP8PDwvmEHSPG3TwzQNK3bLea/IHJaA1u2nscuJMciWMj7gCnZlUofBfDoYXqM21xuGNgvLCC0Ni28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784699195; c=relaxed/simple;
	bh=vtiefrhNBNtUAfqHANiubzLnu7PvlIe4DkrWoSGglUk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WdCuYzAGb8VtMOWelP19cI9TCyGvJbVArK1efO68BfM+nQ+JcUOkAex3nI2kVlTXxAJY5Av1+JqQrufvqPE8vVkYsB99FswrX1gEZ2ou6ZnCRAZHqFesIxLUBycvbOm5xv1gDMjgMf3ODkOSEjJLNdZ/xVC9grZ1W2HXHLcEl94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLNmRCcO; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLNmRCcO"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84a2dcec51cso11349018b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 22:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784699194; x=1785303994; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CI7TlF0b01ltz9AdVM8XyZdeWjq4/wESWt/dIuhHhd8=;
        b=YLNmRCcO6flpxU/gLUnnNVXp0IjK1mMcy0PpD50+GBQowQoJCBO0ieFpG7znX4w3/f
         ls4Nx8m8VVV8k+FUvKlhRMRVpcYPdUCaYtoEY+wOT7SsLF97WyoG+q7HkUZl3eguC62d
         rq71whY33awSoBYKIO+frh8KKvns+7fAvEusnzVpnW/rWe0hXvfsx7EISq3iqIzj2avz
         U3NJTiS9GJ2Pu/v412/U0Jze383uI1xHp5i8J8h8BXGkMrPOvwe8KiyoVdO+5u+emCxi
         j2TAIlHvugB9acLDRkAQoas09q6sYQBlh1zfert3mHs5udDUYCOS7/uHBv73vvAPWkpI
         kSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784699194; x=1785303994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CI7TlF0b01ltz9AdVM8XyZdeWjq4/wESWt/dIuhHhd8=;
        b=WS6/Z7j2mVK2OZFbt27/5JCeQr9qgdkO8XK2tPIFUz1xvJTlRRQif8XdugAr9kBvpW
         Hb587j1Mx5msnLcFoO4HmI8F+SCrAaOuseCZYmSkaAVO5SWq6oLORz6P8tiOWdZ3GOdv
         z/IxIeu2/gEXvSYyYKRqB9ClqHWMkHEeDlmb75Ull/eSgE6iKURIlKuOFScetSckg3rv
         i6OR2X2kwS8+PrDQDbS+RUWLGZBIIJHw5Y8hHO7+d2mAQAlIJH2I9MKSBz6YFMyEbH+d
         +5MzmDkKtQJi3PGUXyJpKU9Bxk9uq9Z76cEYpdBwGg94CGhAcEQL6vNPKO0k2g4Z2D6O
         o5Jw==
X-Forwarded-Encrypted: i=1; AHgh+RqfLD9PLVFWV36OdazWqa/d8acOCoVwV0Rj/BqzMNBdNF9z4MNSkN0fULVddVyHueoB2peu6b5iwinV+u9R@lists.linux.dev
X-Gm-Message-State: AOJu0YyKU5z2lSmQObzYx704jMXtwaDV9srDI96uTZJW8j7wxOm7AJff
	SR8T+0hDuiZg3QCnqP83fH37eyu4uBk28hVDFOUqy4uQtYia39t0MrDE
X-Gm-Gg: AR+sD12HFqQBfGtJk5oumeOLjBhvLn78sUQ2FgDG1to/pZrz9bkD5ST4XJ2rtacKG9Y
	T7vxkiGyJaSASOaOqxH6MtzgschngdsJUH9CgFlMgBCfFRHWkrgRLSVokPlLODzLkYohwEals8w
	fO4Y2ddJ+Q69DejBAu7DdPR16+Kv07o7J1s7hJl5yNidz8UQhenj++wTVf5K0IpKwwRmsTWEQDQ
	vNb+z7YLuPNaO/efmpmHjr/mOotHWYnJtS22EFAI/Bh91ncZJtoai6dLDB1Syea7bMFctMc6EYj
	McaJL/ldmrJvlrs3YgNOBJVPnIAjJHhxauyXp72P+sKIF75AICiLsbWm1uHDMBkU4un93UANS9h
	UxgKaT0eUBAuMPrb/jq2YYOIObzRROqk+efAadf6g+B1YwEweT91/Wtm1QfYmIPwlQk7ztQTIQi
	R4Uih1XLrFaPaDGWmG
X-Received: by 2002:a05:6300:2289:b0:3c0:9c19:6590 with SMTP id adf61e73a8af0-3c3ada1f55cmr22670920637.74.1784699193452;
        Tue, 21 Jul 2026 22:46:33 -0700 (PDT)
Received: from UbuntuOS.. ([2409:4080:9090:9e2f:1d63:54d5:537b:d849])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130a8421sm2501696c88.10.2026.07.21.22.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 22:46:32 -0700 (PDT)
From: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
To: andriy.shevchenko@intel.com
Cc: hverkuil-cisco@xs4all.nl,
	mchehab@kernel.org,
	sakari.ailios@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Subject: [PATCH v5 0/2] This series cleans up unused module parameters from the atomisp driver.
Date: Wed, 22 Jul 2026 11:16:13 +0530
Message-Id: <20260722054615.21492-1-prajvalchaudhari733@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <YOUR_ANDY_EMAIL_MESSAGE_ID_HERE>
References: <YOUR_ANDY_EMAIL_MESSAGE_ID_HERE>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1 converts 'pad_w' and 'pad_h' module parameters into internal
driver defines (ATOMISP_PAD_W and ATOMISP_PAD_H).
Patch 2 removes 'dbg_level' and 'dbg_func' module parameters and updates
ia_css_debug_vdtrace() to filter trace logging to IA_CSS_DEBUG_WARNING
level or below to avoid potential dmesg log flooding.

Output Behavior Difference:
- Before: Trace logging depended on setting dbg_level via module
  parameters. Higher values flooded dmesg with verbose low-level trace
  messages.
- After: Trace logging is filtered at IA_CSS_DEBUG_WARNING via standard
  vprintk facilities, avoiding dmesg flooding while maintaining
  critical warnings.

Changes in v5:
 - Converted pad_w/pad_h to ATOMISP_PAD_* macro defines instead of global
   variables.
 - Preserved blank line in ia_css_debug.h and sorted <linux/printk.h>
   header inclusion.
 - Added explanation of default levels and parameter options in commit
   messages and cover letter.

Changes in v4:
 - Fixed macro constant name in ia_css_debug_vdtrace() to
   IA_CSS_DEBUG_WARNING.
 - Guarded vprintk() with level check to prevent log flooding.

Prajval Chaudhary (2):
  staging: media: atomisp: Remove pad_w and pad_h module parameters
  staging: media: atomisp: Remove dbg_level and dbg_func module
    parameters

 drivers/staging/media/atomisp/pci/atomisp_cmd.c    |  8 ++++----
 drivers/staging/media/atomisp/pci/atomisp_common.h |  6 ++----
 .../media/atomisp/pci/atomisp_compat_css20.c       | 12 +++---------
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  |  4 ++--
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   | 14 --------------
 .../pci/runtime/debug/interface/ia_css_debug.h     | 10 +++++-----
 .../atomisp/pci/runtime/debug/src/ia_css_debug.c   |  4 ++--
 7 files changed, 18 insertions(+), 40 deletions(-)

-- 
2.34.1


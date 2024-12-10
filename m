Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08AF23874F
	for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 09:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733822932; cv=none; b=Rd1ZdLsRdU6Gc/VlsiyPcu36XChVBK3KTRnVAoLBD1b3Vdbo4dxkuEWwKCNU9RkDh1xmTNi3F7+5neaji7ciCvKE+ea+bhW410ON0cMKoSUiYIRxyUeYX+tdSzioMnIH8UraQCnf9xUVgp5ys1xb27IKxwVPDruxHw4AowAgp/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733822932; c=relaxed/simple;
	bh=IwZiUC+xzjT5g/3F2kaFOIMCaS5YNKOYuxFdVzfYR5Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CXLbKoOT7KSO38hEPzCm6Zes89Jp80ZjMvuWWBZczozsrG//wc5wog5sOr/zppm3T/H+hA2aN+VeQ27yP7EpuRaOlNU8saSQkOm5xAT9PL/pGuuZdpZk+W2TrSpnr59lkXHcbSX8qDdXxADZl4lQ7I3u/P3Dl/F6rTTJTzp4WC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C0YwAVvR; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C0YwAVvR"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4676b7ee622so1496021cf.2
        for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 01:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733822929; x=1734427729; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EQ6Sr1zHlK7eVAViMLQBWWxa4rYYIz/gHEKTD7nWi1Y=;
        b=C0YwAVvRju8iCs7V/SBgCB9cehHi9sf3QJ/JPAH3JOrGCgjruefDvK0OJMWk1uROQw
         dH7JssMsxCyKmtI74sn4d+Bcs55aQ67m/z5krxe3WLV1dX813Ji1fA+XkWBNvAS+5CmL
         h0vApkzkJFvBr/Bl1JEqA4S2jhYzqJKwmL+KI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733822929; x=1734427729;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQ6Sr1zHlK7eVAViMLQBWWxa4rYYIz/gHEKTD7nWi1Y=;
        b=SR1GM4nPk6dKgCfk/uQglcYdFJwGA/AxF3Gjjjy9KysO9qSxi0eppuQ+bg1EcDHoVt
         X7hnzmutHX2xuvKKtDhP7GQ71MXKn/U3cAXu36OJG59KQ38yErR3iavAylvL16+8JKhE
         xilRGEifKJGegHUjWcNPKL2AXt2xctfJlUhHrZYbJQLea34QdBmhm+9q4o6p6ZqsXdI3
         8hwA7K+ppqdQJlpe/zIIErDoARAG5+bFqJwe3xR//GfzG60svJarYr/tbG38ccE4stCV
         MOLsi0oriV0aCT3DHVRUPC1oruACBCvI5PWAV3g+9iyEsxAtTWHv+WaNH5ubWWXjdqA0
         I/yQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtQ5tg7mVBFZtA74l5sIYeC6OYExOWvFxlXsFBBSEvoEn6+utSc93R1NsbyEX9hnjVPXpZlD0Kz/GFgocn@lists.linux.dev
X-Gm-Message-State: AOJu0YwSTqw58C872RhhJZBfa0svMgfHA+aGViIY/3iFdhCQsfrvcMiT
	GtY/66LYOwqpWG3IsraRD4Rpf1mb8tqFtkbBZ/qWg4QFkADo3/Ust81AflfQ9Q==
X-Gm-Gg: ASbGnct+c2vAZkoq9ddxuX1+AGsCM0SK1qXODavpr9J0KrbXTfqCNjD9zT2s0lIzeEL
	3aNR11NIuDdZ23fXP592a7OjteHqUWDvZOWwJMKZI90zF8LdhfGnbKCbPYN1gwg1tlmYNZ8CrlU
	77xaEJXFpBQV3ftk0IdJamo5tN3tdxCCvyL27Rq4HqFPGO9BUio6Rc9qh13XtH9EdWfxXIq4yXa
	XCTk9GCH9+B34ARVYjrnaRxrpZNuOBj+9HETXH/bxSiBvuA3SGnMJV8ocZuPDXbdOVlMglJPElM
	0KbyIDd0K9Cj3goFywX17ezpP17q
X-Google-Smtp-Source: AGHT+IG4zLpTUeRfCJvNH5jKuYheZyD8tmB9iprUPnqSv4PhKrfbGY9SonvowS8cKS9US1CIu4W15A==
X-Received: by 2002:a05:622a:1446:b0:467:599f:bdc0 with SMTP id d75a77b69052e-46772013edbmr46291441cf.47.1733822928798;
        Tue, 10 Dec 2024 01:28:48 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4675dd86ce4sm24343241cf.30.2024.12.10.01.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:28:47 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 00/11] media: Remove vidioc_g/s_ctrl and
 vidioc_queryctrl callbacks
Date: Tue, 10 Dec 2024 09:28:44 +0000
Message-Id: <20241210-queryctrl-v2-0-c0a33d69f416@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM0JWGcC/23MQQ6CMBCF4auQWVtTioi68h6GBQxTOolQnQKRk
 N7dytrl//LybRBImALcsg2EFg7sxxTmkAG6ZuxJcZcajDan3Oires8kK07yVCUW58K0FV7KCtL
 /JWT5s1uPOrXjMHlZd3rJf+s/ZcmVVh1ZWzVoscP2jk78wPNw9NJDHWP8AnVABMWlAAAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mike Isely <isely@pobox.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Most of the drivers use the control framework or can use the superset
version of these callbacks: vidioc_g/s_ext_ctrl and
vidioc_query_ext_ctrl.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- v4l2_query_ext_ctrl_to_v4l2_queryctrl
- Fix conversion (Thanks Hans)
- Link to v1: https://lore.kernel.org/r/20241209-queryctrl-v1-0-deff7acfcdcb@chromium.org

---
Ricardo Ribalda (11):
      media: ioctl: Simulate v4l2_queryctrl with v4l2_query_ext_ctrl
      media: pvrusb2: Convert queryctrl to query_ext_ctrl
      media: pvrusb2: Remove g/s_ctrl callbacks
      media: uvcvideo: Remove vidioc_queryctrl
      media: atomisp: Replace queryctrl with query_ext_ctrl
      media: atomisp: Remove vidioc_g/s callback
      media: v4l2: Remove vidioc_queryctrl callback
      media: v4l2: Remove vidioc_g_ctrl callback
      media: cx231xx: Replace s_ctrl with s_ext_ctrls
      media: v4l2: Remove vidioc_s_ctrl callback
      media: v4l2-core: Introduce v4l2_query_ext_ctrl_to_v4l2_queryctrl

 drivers/media/usb/cx231xx/cx231xx-417.c           | 21 ++++++----
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c          | 40 ++++--------------
 drivers/media/usb/uvc/uvc_v4l2.c                  | 10 -----
 drivers/media/v4l2-core/v4l2-ctrls-api.c          | 51 +++++++++++++----------
 drivers/media/v4l2-core/v4l2-dev.c                |  6 +--
 drivers/media/v4l2-core/v4l2-ioctl.c              | 19 +++++----
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 35 ++++++++--------
 include/media/v4l2-ctrls.h                        | 12 ++++++
 include/media/v4l2-ioctl.h                        | 12 ------
 9 files changed, 97 insertions(+), 109 deletions(-)
---
base-commit: 6c10d1adae82e1c8da16e7ebd2320e69f20b9d6f
change-id: 20241209-queryctrl-5c3632b7c857

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


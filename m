Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FEC309DA5
	for <linux-staging@lists.linux.dev>; Mon,  5 Jan 2026 14:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767625071; cv=none; b=QFpSUBQ81Wt1r2aNjSwF/vHMFXGBTNzqnxhdIE0kHKGB5fSQIfcscOCTAusHB02ng7L64RQ7o0ByxT8KI7YG9fRJHWDIPxRNgV83CnZBA82+zRG6cndt9TbRVvzh6uvFIVoY07Ij4cDYGm0k9mjwRag4R9QNxSeKdkYbWKN/aco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767625071; c=relaxed/simple;
	bh=PIgdhokxKmOQqn2YJNx64hxKMduQw5sTcwbexWtt+eU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VfbWQqkf4cmuycDoAxeURCiK1nZLsh0HX39ZlP4TBUf/jlPr96CfSebQdrzubA6JiretmsWlaiDYG8e9KMUxEo0racJ+umwXNWpzNeZ5IpNZs+ug8wOUDrduyfxPmU55yw6R80QpPGpPCPwmChGQ523Z2xQkqsDk3g6fGlUSVDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/KI/veV; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/KI/veV"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a09d981507so15412905ad.1
        for <linux-staging@lists.linux.dev>; Mon, 05 Jan 2026 06:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767625069; x=1768229869; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WxGmxcm8W090/d5nMTt/wORMSUlKQtayAk95lHOSsFw=;
        b=e/KI/veVjxuY+cvX5tD372q5be3pbkbVXN4Bs8pWFFFaQmL0xObRNOVBT9wLn6JtPO
         Il5GEkWXjRutoHBluJ5wxDPE2czw8OzqVWqazdch5ObhrrDfWm1AufV7BmnplBW2Zqt/
         b+vJO+5lfYSd1iHNSOJLyg1Fq34xN/wpDwpXVl4+5CqxzIF8+MyraFZLh/FFQzIYZMyI
         mBDFq8pnRVr427zyoCDN27JhyzJNhAp/N9V+/srejJkHHf4qJBy7KDllSVkCR0Xb5V6J
         22/mSsC0SyoXBHpwsv7QUbOhxf7Q0dtHZNo0+1ZL5IBDvegLgC463RvQn/UJ/WrhIYKn
         /XKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767625069; x=1768229869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WxGmxcm8W090/d5nMTt/wORMSUlKQtayAk95lHOSsFw=;
        b=VG1NHK1m9VrhaX9u5ADl5T05HGycdsIUBfb5ZI5uL2jQ5dpKgKf6DFg2j/bUC4KXYB
         xXJm0kWNMUF9jcl7bxUJH7JNMppWZP0MddEh2hol+F8aYc+xUgLspKWeJm9tr0EkHFzI
         03H1opPnCPYYnDDBeNhUFmw/Lhxkp9BpaIkdqYn0ZR3IPHoCmy4uN65R/+itbwPwN8FH
         8eH4KGeDd4hydx+//U6/RQvIn/aE4NX5JzQWPykU/4mfSXHl1lfB9SIQdKOpcxlE+NHP
         8qzmxDbTEv2Q+RIZOwwDCt1b6XBooQNvaSLFedqq7rMmnugQNMb86hda39xlMjwpyiMY
         vQ9A==
X-Forwarded-Encrypted: i=1; AJvYcCVq5pf9VfWTruYkdGT34efSYGaGzryEe8pVuSX9zyh+ChSAM7O0pigD2Rg5h0qrGPUyHekUzn1oi0JZQdrv@lists.linux.dev
X-Gm-Message-State: AOJu0YxmklWmqGyI/1kYRFzQek8ZpyKq+nCM1cLebsIxSRUrZbitlh+s
	E2CgX9WgoFW0r/HbR1geft7Agxnx6sB1gJqVoJydPQR7IauncZjUIqL8
X-Gm-Gg: AY/fxX5DuqfL1Leph28MCQMOAzcPphaNeVYnOnVJC4eJ2dBQbuDRLVxZyiTui/XKwN+
	NnThRk6phEcxDi25aot6OlCoNJI8m2xLqIYrCa83Iz3G+6Etr1ZB48uWn60TFTd+grrb7Mvx8UO
	pVx5dNwKxjE2+Mz/4WLaSiD2FfiwN2WEDTEGOu6A4qkSkZxht5r5d5pSPjWlVEaQud/TAzzDoAg
	mnJq9+aKqkEz2P6SAEt39xS94YaLSBLhDCiwzgZynPBDxG8LOI9pnWG3YoPrkEylJD85uRsap6b
	uG43koP+bq1FJ7aiwLS22qguY1G9Hr2W6d7bFXB8J9wyDLkuUoGqqKSyi5DOIlsmJCuN2q9CsNd
	TnMd7feB6sZHT2oKMal045xBww/OL4WgxHqUVt5HYtC4HlDcH9Zs/sVu1TZjjhfc1wL72sTovop
	3TDi1/Jedvu/aCpcxKNdQjlQ==
X-Google-Smtp-Source: AGHT+IH9bhTd8a5PTZAsdrcqR6Tk62oZsZ52+Tf7ZJ2jXCA76IraDDZerhlgKhUX7z3DplqKSOR0sA==
X-Received: by 2002:a17:903:1967:b0:2a0:971b:151 with SMTP id d9443c01a7336-2a3c095613amr75717105ad.2.1767625069442;
        Mon, 05 Jan 2026 06:57:49 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e2b81484sm715955ad.78.2026.01.05.06.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:57:48 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH v2 0/3] media: atomisp: refactoring and fixes for V4L2 compliance
Date: Mon,  5 Jan 2026 20:27:21 +0530
Message-ID: <20260105145724.37305-1-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <81e2d12c-342b-4b88-88a0-3e24115541aa@kernel.org>
References: <81e2d12c-342b-4b88-88a0-3e24115541aa@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses maintainer feedback and fixes build errors
in the atomisp driver.

Patch 1: Standardizes the 'Bridge' structs significantly by using v4l2_rect instead of custom shadow structs and aligning ia_css_region members with V4L2 conventions.
Patch 2: Introduces a helper function for statistics buffer allocation to reduce code duplication and centralize error handling logic.
Patch 3: Adds missing error propagation for IRQ enable and XNR configuration to improve robustness.

This series is based on the latest staging/next tree and has been verified with checkpatch.pl --strict.

Karthikey D Kadati (3):
  media: atomisp: replace shadow zoom structs with v4l2_rect
  media: atomisp: consolidate statistics buffer allocation
  media: atomisp: propagate errors from ISP xnr and IRQ enable

 .../media/atomisp/include/linux/atomisp.h     |  19 +--
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 142 +++++++++---------
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 123 +++++++++------
 .../staging/media/atomisp/pci/ia_css_types.h  |   6 +-
 .../staging/media/atomisp/pci/sh_css_params.c |  16 +-
 5 files changed, 166 insertions(+), 140 deletions(-)

-- 
2.43.0


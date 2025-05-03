Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEA51A317D
	for <linux-staging@lists.linux.dev>; Sat,  3 May 2025 14:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746284318; cv=none; b=XqaanM6dpTRJdhGb8Abz4pwDGykgqXtue9SMGaWdvAnPBukABywKLnGlfM7Qx5emOMvkLpGDR09FBGLy82G4RGUYXddBASu+yv0XNHFD1fCdIA8BqJuAIR6xSg0nqYwem6sU19fhNeWCg8arURcSYzsc5+5Xn+P2CjNBwQiP19o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746284318; c=relaxed/simple;
	bh=7CMCI53ZCm+o2eU1OCPEeBtVvms8M6YtlIeCcb1P+Qk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=k+4ob/E0zhE+ro1vK97NMQ2yH2AjXUhJ4GI5ktZAtr7aSuWDe99Pi3kvFEJc3w9SXCrURoH4y7iwFBLzrr1rpatmFgMMvl8w8PHe6FtdGu4SrGGsMrtRFSF4cksWnIPg5FydWx5zMnxUfQlK572dZWcAzafNYqJfr9V0169/kUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hggehinQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hggehinQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746284315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BoON4aBZph9krB7U2nFsXuXGyZxnDGbUx8IU25L8T4g=;
	b=hggehinQWdQNEJZ9RkjvqDruZcKEIA4ElLIQuMBPw3qVX4sFZEg6Y4hl9Fx4KSYzldpdth
	oLHIc4KZ4le9gk1tkvHLt37SQsULPELOeIeEC7M6c7ADJwJTjg4uIqH9uJ0EIDZlEJF3EJ
	ASnsFLF4hwO2MBQU7bE5+RwSu1A+rAQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-v6alq9puPTqM_17rAMreTQ-1; Sat, 03 May 2025 10:58:34 -0400
X-MC-Unique: v6alq9puPTqM_17rAMreTQ-1
X-Mimecast-MFC-AGG-ID: v6alq9puPTqM_17rAMreTQ_1746284313
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5f92fc82c39so2301798a12.3
        for <linux-staging@lists.linux.dev>; Sat, 03 May 2025 07:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746284312; x=1746889112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BoON4aBZph9krB7U2nFsXuXGyZxnDGbUx8IU25L8T4g=;
        b=pczDYJRYmbPv/jyJckX/cik171cw1pgS1Tml21tzASGXZQb4izPbFF43Yl5MtaS6Ui
         pUngkEX7H5sw2vciivsrZ6fwm+1iMtNp2CquLlGvYy4gRe3YBUQmOS/F5zqtjYBAM2v9
         nAwDsWgrJcRa1UfId38NYR9SsE3r6FJF8Hxvbktlg72NET3uW/sNmohxk0XVYpSmfbt3
         qR1tfDOX59ZmRORM+Laruw4ci/5k9Km41fGel5PVxLxggXHEkiBw2imZQg3IGtJ9HhwU
         z2fw2FS01MnLgnfWyL3HzDAyAslVxA3oCASJP78wBZlviffunLgymJ1p4Cpg0Nqz7O/h
         ZmwA==
X-Forwarded-Encrypted: i=1; AJvYcCWDfawqCwySK+cps7JHB52UlKigcvLEKl1ZPFgTWocoNPCH0tKig66DA0NGaViQ4dXf/QuR8sfAJTeGt7KE@lists.linux.dev
X-Gm-Message-State: AOJu0Yxf3Ia0yQZsEunoq+IjyeoW16BMek4TacJWdD6MN2fHlWUIOd/c
	LYW4hTTh1LG6A7q0FwhqI0DGJFuG8gZJlsTBGfbTitIv1G5KKv3Ahfi9+TuTxHQC64K5RZjWEaV
	8bJbUKHFSLn8W59jX+HOB7sEMOKHdSJ2evtiN8iHH5c/l8HYnAgqQgV8SkRFq7sfzYpi+3M36iQ
	==
X-Gm-Gg: ASbGncuXbbJfIuALcbTpbpLgJo/iRCktWS+SFfZqWjjmtm/ScodD3F2KSwQNqcXX8kd
	XyYVHiHUjedVBjt3h4RAo7Xg361XdK4uhnHTopVuDbMJEr/TwwDWSYInPoIrrhJ/JGubBMPMnda
	Me2UmY2LtBJpCtFR6A1e9fva6PM0g8PjJbCi2L+hKaHtBvdmqDySN9n+i/SsX+doCo6HSGp0HYW
	PGtGZBxqcOHEvUPkOelJREfQ3BV7N47syLdSJ9I2ODMQL3dcCYsd/KKLNITtZmpQoHHYBLypB32
	5SQcBcXeeZgDi7FYs+ihleiObZvJX9vLl6oMITKDy7RcaP1szx+ibI6pIkvpmHCvpWWIYAk2nOP
	aIcrGHT7vgW2/FMSFJ7bb9bA5X99BSEKE1OTl397pVY127h3XjIOeCJtYj5M1vQ==
X-Received: by 2002:a05:6402:5256:b0:5f8:664c:9297 with SMTP id 4fb4d7f45d1cf-5fab05e07efmr1359149a12.30.1746284312638;
        Sat, 03 May 2025 07:58:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgo/ap4FA1fmCLOUCK2NwlPsPgMRJbLCDtTG4+d1UoGds/lhAz1DurNizypTkCRIL/KD/R/Q==
X-Received: by 2002:a05:6402:5256:b0:5f8:664c:9297 with SMTP id 4fb4d7f45d1cf-5fab05e07efmr1359133a12.30.1746284312241;
        Sat, 03 May 2025 07:58:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77755abcsm2702333a12.4.2025.05.03.07.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 May 2025 07:58:31 -0700 (PDT)
Message-ID: <fc3e0346-fbb9-419a-ad3d-4bd6ec0088b5@redhat.com>
Date: Sat, 3 May 2025 16:58:31 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] media: atomisp: Changes for 6.16-1
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-staging@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3azp450olZ1wJevuYcP8yHGGju3mkee9ji0iP4nvFRc_1746284313
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro, Hans,

Here are the atomisp changes for 6.16.
Note this PR is based on top of media-committers/next.

Highlights:
- Rework atomisp driver to support mainline mt9m114 driver
- Drop no longer needed atomisp-mt9m114 driver
- Remove usage of deprecated GPIO APIs
- Other small cleanups / code-style / spelling fixes

Regards,

Hans


The following changes since commit 543f81b86cf4046c7454a05c741c491a4fac44dd:

  media: rc: add keymap for Hauppauge Credit Card RC (2025-04-30 09:35:24 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git tags/media-atomisp-6.16-1

for you to fetch changes up to 43fd74079a98c1c29e1825c9677321476c4720d7:

  media: atomisp: Remove atomisp-mt9m114 driver (2025-05-03 16:46:20 +0200)

----------------------------------------------------------------
atomisp staging driver changes for 6.16-1

Highlights:
- Rework atomisp driver to support mainline mt9m114 driver
- Drop no longer needed atomisp-mt9m114 driver
- Remove usage of deprecated GPIO APIs
- Other small cleanups / code-style / spelling fixes

----------------------------------------------------------------
Abraham Samuel Adekunle (1):
      media: atomisp: gmin: Remove duplicate NULL test

Gabriel Shahrouzi (1):
      media: atomisp: Fix indentation to use TAB instead of spaces

Hans de Goede (7):
      media: atomisp: Remove gmin_platform Asus T100TA quirks
      media: atomisp: gmin: Remove GPIO driven regulator support
      media: atomisp: Avoid picking too big sensor resolution
      media: atomisp: Rename camera to sensor
      media: atomisp: Avoid deadlock with sensor subdevs with state_lock set
      media: atomisp: Add support for sensors with a separate ISP v4l2_subdev
      media: atomisp: Remove atomisp-mt9m114 driver

Hardevsinh Palaniya (1):
      media: atomisp: Remove compat ioctl32 header file

Liu Jing (1):
      media: atomisp: Fix spelling error in ia_css_sdis2_types.h

Ricardo Ribalda (1):
      media: atomisp: Use the actual value of the enum instead of the enum

Thomas Andreatta (1):
      media: atomisp: gmin: Fix indentation to use TAB instead of spaces

 drivers/staging/media/atomisp/i2c/Kconfig          |   12 -
 drivers/staging/media/atomisp/i2c/Makefile         |    1 -
 .../staging/media/atomisp/i2c/atomisp-mt9m114.c    | 1612 ------------------
 drivers/staging/media/atomisp/i2c/mt9m114.h        | 1768 --------------------
 drivers/staging/media/atomisp/pci/atomisp_cmd.c    |   69 +-
 .../media/atomisp/pci/atomisp_compat_css20.c       |    2 +-
 .../media/atomisp/pci/atomisp_compat_ioctl32.h     |  244 ---
 drivers/staging/media/atomisp/pci/atomisp_csi2.c   |    2 +-
 .../media/atomisp/pci/atomisp_gmin_platform.c      |   92 +-
 .../staging/media/atomisp/pci/atomisp_internal.h   |   10 +-
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  |   30 +-
 drivers/staging/media/atomisp/pci/atomisp_ioctl.h  |    4 -
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |   60 +-
 .../atomisp/pci/hive_isp_css_common/irq_global.h   |    2 +-
 .../isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h   |    2 +-
 .../pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c     |    2 +-
 16 files changed, 126 insertions(+), 3786 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
 delete mode 100644 drivers/staging/media/atomisp/i2c/mt9m114.h
 delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.h


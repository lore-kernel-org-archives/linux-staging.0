Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D532869DF4
	for <linux-staging@lists.linux.dev>; Wed, 10 Apr 2024 13:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712755657; cv=none; b=W8Ik8cB5j7YOB6/251tJ63JHf7f9QoOKO5tmjEre6czaDWfW7+vI8ehH3GQA5GWnhcURfIOLGymzNPsu9HCEikRJPDVEZcE1ULwB01AMtpIkArJuksit8n2trx6RHh4EMek3XL5fie7rIIHVGHbjcu0ENzJC1VHeH38U5c1ESoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712755657; c=relaxed/simple;
	bh=uekwfcb18dx43Zuv2A5bZgoGi53LxIaSg0xkA8BmqxM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=aJ+kB2JJP4CBlns1HDsKr4Wf2LiH6BgMVDGxXpRGC3nIw3Sosshxr1/4jUjYEPqQSDRaMwVPGUoLgmb6Kvi4zBH0pfDy8BiNSxmN3KXojErLyERMzofJtBjOl5ye50Gdnox56Pw30h2XABg+pbram2n7ng3O6wQGtWLXpVzkZsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=itH7rFMt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="itH7rFMt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712755654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ts6+EaFTV3hqFveRg5zgnMS23rvp01fyPF7R6Av4b8Y=;
	b=itH7rFMtLXYAleziBmeCw0umwdW2mG6+tQoaOazM3gJ8kKIV/XvMf6dGO/pbpIWvKQxxyE
	up2KHGsXafyOVKkseiajkrVmOFp2slIBaoYDITxnJY/IvI0Q02ahOe38ehlEsmInWdbtJT
	j6RNZaGy6pKdbFKhXhp0LuaJ3bplaGE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-Vbt3kRtQMHmGA1izkUEo_w-1; Wed, 10 Apr 2024 09:27:32 -0400
X-MC-Unique: Vbt3kRtQMHmGA1izkUEo_w-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a5190b1453fso401738366b.2
        for <linux-staging@lists.linux.dev>; Wed, 10 Apr 2024 06:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712755651; x=1713360451;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ts6+EaFTV3hqFveRg5zgnMS23rvp01fyPF7R6Av4b8Y=;
        b=BrmI4lNu2COagzYNpYkyzPbkmHptmqCX/nqeXM8upFZ//WCKr22mMXsDdidUxcyrQr
         plYL7s1FepGsqP01Ju0UtyUfwPik9/kQ4QFe7n2M4kyOwUDQfTC3Wc8KO1Q6M4sbgmON
         nmPOITDG3f/yZoX6GKQ8VhOXVMxFag6Nb+ORqieR2ZjzE048re0s/8ZRRD9URo+q5x/m
         457c+rNF6lmyEZ0qgNKxpOQ9WucNVQXgwPQGICW8tIdm+e+OvtWuPQgegWKx/AxYKxwV
         jACn87pG2zODoKkVYGEItJpZUPRgT9Kl9rYj+gLVnFOA9qStQtp9iifLjU7cmEbjHAK/
         /ZFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwfqkoblcxUPHEL+SzxSIUuu26xNf5y8Qtwyeoq4Go2/rp7UL1y4Jd7Ix06CEYhfCfc89//ojn8ycVdUwVl8lHb3HcxiIHQyhQ4KAWQQ==
X-Gm-Message-State: AOJu0YwNwJj+NupWqHh5+qHY5TcK89fYt1WLRuwue57E+5O5EF+BPBtc
	nHImclBTy++bc0QMx9TvWOmGKXxVgh5MZGAJ/HzYtlHQIrN8ANhYJ0Pl5fUxZoIOMRy8siSRgpQ
	g4vBqR5EYWhUo5Qd8hFQpyf3NqjTJhR5pYryLgPiWZGner0xk7ZUftG3IEWdrGhk2rAXeexM=
X-Received: by 2002:a17:907:7202:b0:a51:9d21:2a1e with SMTP id dr2-20020a170907720200b00a519d212a1emr2069209ejc.73.1712755651394;
        Wed, 10 Apr 2024 06:27:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJ+daPelqFrKT4dh1ETe0KM84w8B3Wi+iEbgtKxmadbgK2+t7oBjVXR985fyDy09YM4Js/mA==
X-Received: by 2002:a17:907:7202:b0:a51:9d21:2a1e with SMTP id dr2-20020a170907720200b00a519d212a1emr2069194ejc.73.1712755651009;
        Wed, 10 Apr 2024 06:27:31 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id dr19-20020a170907721300b00a4a33cfe593sm6925153ejc.39.2024.04.10.06.27.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 06:27:30 -0700 (PDT)
Message-ID: <d73b0bb6-2fcb-4c53-aefb-fadc25b98105@redhat.com>
Date: Wed, 10 Apr 2024 15:27:29 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] media: atomisp: Changes for 6.10-1
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-staging@lists.linux.dev, Kate Hsuan <hpa@redhat.com>,
 "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Mauro, Hans,

Here is a first round of atomisp changes for 6.10,
this pull-request supersedes / replace my
"media: atomisp: Changes for 6.9-1" pull-request.

Various cleanup patches from Jonathan Bergh and Andy +
a set of patches from me which has been reviewed
by Andy and Kieran.

Highlights:
- Remove more dead / unwanted code
- Changes to make the atomisp driver work with libcamera,
  this has been tested with libcamera's simple pipelinehandler
  together with an ov2680 sensor

Regards,

Hans


The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git tags/media-atomisp-6.10-1

for you to fetch changes up to b3462fa5eff2ada1f2f6ae750f568af22d5b5db7:

  media: atomisp: Get rid of PCI device ID hack check (2024-04-10 12:48:18 +0200)

----------------------------------------------------------------
atomisp staging driver changes for 6.10-1

Highlights:
- Changes to make the atomisp driver work with libcamera,
  this has been tested with libcamera's simple pipelinehandler
  together with an ov2680 sensor
- Remove more dead / unwanted code
- Various cleanup patches from Jonathan Bergh and Andy Shevchenko

----------------------------------------------------------------
Andy Shevchenko (4):
      media: atomisp: Remove unsused macros
      media: atomisp: Put PMIC device after getting its I²C address
      media: atomisp: Replace open-coded i2c_find_device_by_fwnode()
      media: atomisp: Get rid of PCI device ID hack check

Hans de Goede (14):
      media: atomisp: Fix double negation in unsupported revision error
      media: atomisp: Remove isp_subdev_propagate()
      media: atomisp: Rename atomisp_set_crop_and_fmt()
      media: atomisp: Remove custom VCM handling
      media: atomisp: Remove ISP controls which get passed through to the camera
      media: atomisp: Stop setting sd->devnode for the ATOMISP_SUBDEV v4l2-subdev
      media: atomisp: Add DMABUF support
      media: atomisp: Change ISP subdev name to "ATOM ISP"
      media: atomisp: Make MC link from ISP to /dev/video# output node immutable
      media: atomisp: Implement link_setup() op for ISP subdev MC entity
      media: atomisp: Drop second V4L2_PIX_FMT_UYVY atomisp_output_fmts[] entry
      media: atomisp: Replace V4L2_PIX_FMT_RGB32 with V4L2_PIX_FMT_RGBX32
      media: atomisp: Disable broken V4L2_PIX_FMT_RGBX32 output support
      media: atomisp: Initialize sequence counters to 0 instead of -1

Jonathan Bergh (10):
      staging: media: atomisp: Fix various formatting issues and remove unneccesary braces
      staging: media: atomisp: Fix formatting issues and minor code issue
      staging: media: atomisp: Remove unnecessary braces from single line conditional statements
      staging: media: atomisp: Fixed "unsigned int *" rather than "unsigned *" declaration in variable declaration
      staging: media: atomisp: Ensure trailing statements are on a newline and remove spurious whitespaces
      staging: media: atomisp: Remove unnecessary parentheses from conditional statement
      staging: media: atomisp: Remove unneeded return statement from void function
      staging: media: atomisp: Remove old commented code and fix multiple block comment style
      staging: media: atomisp: Fix various multiline block comment formatting instances
      staging: media: atomisp: Remove extra whitespace after opening parentheses

Zhipeng Lu (1):
      media: atomisp: ssh_css: Fix a null-pointer dereference in load_video_binaries

 .../staging/media/atomisp/include/linux/atomisp.h  |  24 --
 .../media/atomisp/include/linux/atomisp_platform.h |   5 +-
 drivers/staging/media/atomisp/pci/atomisp_cmd.c    |  31 +-
 .../media/atomisp/pci/atomisp_gmin_platform.c      |  28 +-
 .../staging/media/atomisp/pci/atomisp_internal.h   |   7 +-
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  | 362 +--------------------
 drivers/staging/media/atomisp/pci/atomisp_subdev.c | 102 +++---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |  98 +++---
 drivers/staging/media/atomisp/pci/bits.h           |   4 +-
 drivers/staging/media/atomisp/pci/defs.h           |  37 ---
 .../pci/hive_isp_css_common/host/dma_local.h       |   1 -
 drivers/staging/media/atomisp/pci/hive_types.h     |  19 --
 .../atomisp/pci/runtime/debug/src/ia_css_debug.c   |   3 +-
 drivers/staging/media/atomisp/pci/sh_css.c         |   1 +
 drivers/staging/media/atomisp/pci/sh_css_sp.c      | 113 ++++---
 15 files changed, 221 insertions(+), 614 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/defs.h



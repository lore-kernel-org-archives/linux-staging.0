Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C793C49E
	for <linux-staging@lists.linux.dev>; Mon, 19 Feb 2024 15:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708355275; cv=none; b=XGN0ik0BdsClqWlxB+jNWeVTrjk+FPTCjOCMcwGFvMMRTlAnVeL7ByhKki7ZXut/bNoevrkHGkHn78o1Ahx+i+Tu6rGZgTU4uRxZlTEHV1Ke4dXQPDsi7cpSmB9yUAjenYx5/Yj1E0TxkWmYGFbukzzTDMYsjniW4K30ocWNM0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708355275; c=relaxed/simple;
	bh=8beD0l3448gzEPb4ds9oiILOxkWv4XVE1+S1Mecfg4o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=EzRZ/vIHm+Otu7h2N9VQ2K0uXKH0VX+hQd5M1xDhG6SD4r+cSti4I6Od93CFj+2tNSh4gnc8J4TyV5vVaW3XpzlpIgZfUOTtEk/5ZJJ2LQU4j9Ufx/2LvDDn+9hreusq9baKq8aDKB2wT62/vK4MUXldFiQ3os4OzGNseiva5Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L6lUUN7K; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L6lUUN7K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708355273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TGpYaIyw/fiQC5YRWnOH8kAucBMPzGChOJg45ZgKYu8=;
	b=L6lUUN7KrsHnZkvTT5t0Cpzo3BevbzE+VTPSWmN3qpaBCU+btf9wGUuc7Qye73XkMdmJRX
	yA8ns1TiJoVIKtdCWXmY5aeBv+L2/XsUeDjMd9toA2QvGEhJtGNVtAnkZTxrD/5kpz9Jeh
	E+YCSRHiPZLSLBtoz5KVFt0a/mcv3Ak=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-F-OaT4hfMvuAhGLkXuhvGA-1; Mon, 19 Feb 2024 10:07:49 -0500
X-MC-Unique: F-OaT4hfMvuAhGLkXuhvGA-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-50e91f9d422so4967519e87.2
        for <linux-staging@lists.linux.dev>; Mon, 19 Feb 2024 07:07:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708355268; x=1708960068;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TGpYaIyw/fiQC5YRWnOH8kAucBMPzGChOJg45ZgKYu8=;
        b=EhR2/qLeaP97xHzT0mosaZS3CYMcfkYbgMtWgBoJz+JM6UxnDvuF7T797Ff+ScxTY9
         z0hW+U/6y/Bv+SR0ryhGQtskXJ+MFrl+tkoJYg1Ioe65V6dsA8WctKt30g0qrzpTf6K9
         MqA5gveKSD2FxCAgbm+OY8taeRTAR/wFzX8eU3aOT3V+vX9KUQzLrbt1aR+Zvl73gfTS
         Z90do8ABR4F5AsYPegKDbqCBKsU+BjannONWYuMvkST21R8BN0kqDx+Rk8mur6FsDfvg
         cyuInb6kOd0k9X2uXDSusSES6VHacEjXuDpzHM7Nwp2iA0ThdJliJAWSGYYjpJJAq6NR
         HnPQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8qNLQ/s0M5XttwkT+j6C4PPI7+X2j09B0LVxUiJl+H7JJRgYkWs+y+FanUCmnKGt7qzjgzsbIiKZOkBBktnPI4r7MeM63Ug1ET9ThBQ==
X-Gm-Message-State: AOJu0YzRsQGcFX9jUjlvgt9n/r2sDKrA4gvorAFaChDfAC+jF3+5W2Gg
	J/97Bjlz+4Hs6oNrFmOU+KpOmUljjqqsmz5INRb4oLbYa6Pw+MeqVdFyqkaigqw+6j6pOdc50Fo
	20iQOdze01r/GAPPet2HenfMkIWCeNUxV/kMevOx5wHspiz05IGR8DsBSJ3OE7Lo=
X-Received: by 2002:a19:7407:0:b0:512:9e9f:2f1d with SMTP id v7-20020a197407000000b005129e9f2f1dmr4537330lfe.58.1708355268250;
        Mon, 19 Feb 2024 07:07:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7cwVF14U+CoAMztwi/ojg06LyCMEdCzIQVTdO0cqcnVoXLV+tSSIKtYOUxbIl2iUekqHK9w==
X-Received: by 2002:a19:7407:0:b0:512:9e9f:2f1d with SMTP id v7-20020a197407000000b005129e9f2f1dmr4537319lfe.58.1708355267924;
        Mon, 19 Feb 2024 07:07:47 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id g13-20020aa7d1cd000000b00563ec73bbafsm2765650edp.46.2024.02.19.07.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 07:07:47 -0800 (PST)
Message-ID: <7f7ea4d9-1862-4532-b19f-46c1bba36af8@redhat.com>
Date: Mon, 19 Feb 2024 16:07:46 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] media: atomisp: Changes for 6.9-1
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-staging@lists.linux.dev, Kate Hsuan <hpa@redhat.com>,
 "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro,

Here are the atomisp changes for 6.9.

One patch from another contributor and a set of patches from
me which has been reviewed by Andy and Kieran.

Highlights:
- Remove more dead / unwanted code
- Changes to make the atomisp driver work with libcamera,
  this has been tested with libcamera's simple pipelinehandler
  together with an ov2680 sensor

Regards,

Hans



The following changes since commit e0b8eb0f6d652981bfd9ba7c619c9d81ed087ad0:

  media: visl: Add codec specific variability on output frames (2024-02-16 11:46:33 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git tags/media-atomisp-6.9-1

for you to fetch changes up to 9849bf7008dea11626c6dfdc438658d8607fe47b:

  media: atomisp: Implement link_setup() op for ISP subdev MC entity (2024-02-19 15:55:47 +0100)

----------------------------------------------------------------
atomisp staging driver changes for 6.8

Highlights:
- Remove more dead / unwanted code
- Changes to make the atomisp driver work with libcamera,
  this has been tested with libcamera's simple pipelinehandler
  together with an ov2680 sensor

----------------------------------------------------------------
Hans de Goede (10):
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

Zhipeng Lu (1):
      media: atomisp: ssh_css: Fix a null-pointer dereference in load_video_binaries

 .../staging/media/atomisp/include/linux/atomisp.h  |  24 --
 .../media/atomisp/include/linux/atomisp_platform.h |   5 +-
 drivers/staging/media/atomisp/pci/atomisp_cmd.c    |  12 +-
 .../staging/media/atomisp/pci/atomisp_internal.h   |   4 -
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  | 333 +--------------------
 drivers/staging/media/atomisp/pci/atomisp_subdev.c |  95 +++---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |  20 +-
 drivers/staging/media/atomisp/pci/sh_css.c         |   1 +
 8 files changed, 74 insertions(+), 420 deletions(-)


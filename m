Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABD8194ACF
	for <linux-staging@lists.linux.dev>; Mon,  9 Dec 2024 19:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733772337; cv=none; b=funr583k5uclQ26RgQTSgYqULNtguDodDRLnmv0zBaj4RiP3ZROENJhme8540EEVyYnna/KK9CoYiDYWRe17EJ18ASRj4BvHFQc1NfhbZhsgZHlhSuTMP8B+16iwMPYreHwrTTNNpiKWgOMqaSBFZOUpUle91cDoXL7Is+5iKMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733772337; c=relaxed/simple;
	bh=1YPD5dfhPPSSjjJMM8/8DpsgemLtu5hAhcvsO4anuRk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k4FrQDBXoWJJFBg2jncgPj5z7mQTB92bDSSMIkRRHTRlpeGZK/lmf+oW0jlBfTgu7barXrjzeDfIi3+0kRaI9qsRu/cGvvGoNdxOR3e7y3Tv9AawkMmBsel9LM9OGK1LA/KvHOhGhmlWLJFlmturC6aK/rZtHfkAE4hzdRUhiYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Q8m/kJJr; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q8m/kJJr"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7b6d6fe8b16so98079185a.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Dec 2024 11:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733772335; x=1734377135; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T5w/djmSfwnx1UtWBiBpykCG/spzcgrBqm/dY5n0vUQ=;
        b=Q8m/kJJrk2aKCbM8Ph+rj2NNjE+tE0PJGWhv8zYkmiT7jvbkU8PJvb/ZB9DCsWMOR6
         S9avLkll18qqv0f3SIPS9uqzNxWJP6a2sSCIRYGmEbaC4xHghpmsKd3GjfwFzBRW8mZ9
         v/nHdFE08KVCbUrCMp9Y0/6ppj3pGIDqLzTBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733772335; x=1734377135;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T5w/djmSfwnx1UtWBiBpykCG/spzcgrBqm/dY5n0vUQ=;
        b=urYaGFyu6mLCWNou9Dse1z07ZkpnxvtWk2j96nHoLF+ocxBN3NeTdX7aAFCBlJlrwY
         wkMeXh5GZrgT+BXK4ewWvTu2pmZzxHbvz7479hjKNaKRzfl315Wk/RBM7HU3Lfa9sonj
         WZgoM2HfGBUNwRP8a8Akxn3GTreGYcVdXaQ6IYKHUc9mtPmnvJuU4PDPp18QIhNWYmdD
         usu3qSD84w7uhIqDOBWujtCWLSAa/EbCD7u7UWqAt6c4zHJUD1FdQgs3HI9O7wsNaVUr
         NJkcHspniRwGh5iVuKmvhg3v+w7kDRDOIx27UEffdLPm1jAa88iVTSzszhIGrtZx9eSw
         kq0A==
X-Forwarded-Encrypted: i=1; AJvYcCXUvtwv6DEvtO2yp4s3LN3tkgfizQnc9B3CWJSHlXvSrvafMmNIW2o1kIQ7zxsiQtnd1XSpQHKUofYgLmb2@lists.linux.dev
X-Gm-Message-State: AOJu0Yy89T0HVIP46/q0CkNw9HBv2chjBumFV8t/JjrNYBVsioJolBtt
	KpKmVFXF6RR2+i+YWWcGtj6afMrgEB/ScmBjJQQroeRtEBNsT05s1UBhM2dWyw==
X-Gm-Gg: ASbGncsztQ8bad9udtg/Iq9zL7feGrvLdYeG+Jb4SAWhnnsTZsQjPZnyzOaUGzo8uWS
	uQak1f3X+hm7ec+Tw3ws2FaE5W39np1+K4zMpOSOfSPaWPfwz/EaGJHJw8Ke2rkXLYP3Ju6c/Bk
	qP1xrTwc0NmMSuvtc53AxKtvJOa0z3FwXTRNA7Wb/qmIni6cszWNGtGtxIehR01r4NypNZZHhVw
	CrIDYJMLO78P1Ej5t2c5hLDv105C5TNGbK0XzlEkZYblnYReAr7vMTpKJCynw3NdJ8sLdkaigrs
	q5ikQ3GJ4UJqsQuvteXRl+ZS
X-Google-Smtp-Source: AGHT+IHTy8N14hX6y10Y/KkG5JUIcGqpVcCeWrjq1oZqk0Lx9TuMCx/Mta50Hbm2uF+mXX752TqB8w==
X-Received: by 2002:a05:620a:260d:b0:79f:18d4:d613 with SMTP id af79cd13be357-7b6dce86c6dmr235351285a.38.1733772334831;
        Mon, 09 Dec 2024 11:25:34 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6cc1cf6fesm217433385a.102.2024.12.09.11.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 11:25:34 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 00/10] media: Remove vidioc_g/s_ctrl and vidioc_queryctrl
 callbacks
Date: Mon, 09 Dec 2024 19:25:31 +0000
Message-Id: <20241209-queryctrl-v1-0-deff7acfcdcb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACtEV2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIwNL3cLS1KLK5JKiHF3TZGMzY6Mk82QLU3MloPqCotS0zAqwWdGxtbU
 AgCzU6lsAAAA=
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
Ricardo Ribalda (10):
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

 drivers/media/usb/cx231xx/cx231xx-417.c           | 21 ++++++++----
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c          | 40 +++++------------------
 drivers/media/usb/uvc/uvc_v4l2.c                  | 10 ------
 drivers/media/v4l2-core/v4l2-dev.c                |  6 ++--
 drivers/media/v4l2-core/v4l2-ioctl.c              | 28 ++++++++++++----
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 36 ++++++++++----------
 include/media/v4l2-ioctl.h                        | 12 -------
 7 files changed, 65 insertions(+), 88 deletions(-)
---
base-commit: 6c10d1adae82e1c8da16e7ebd2320e69f20b9d6f
change-id: 20241209-queryctrl-5c3632b7c857

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


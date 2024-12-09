Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8382D197A88
	for <linux-staging@lists.linux.dev>; Mon,  9 Dec 2024 19:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733772346; cv=none; b=kKFD0EzdeO4QbeBUtySV5LIIvmlocpwXtg8bxvFGCrSSte+DSu5MUp6QKOJNwYRpUi6rbx6mrGzve4dpLcDfsSOqkTnDaAbJFSEasw0XmaEtYc4wDJt21Qm/zaDgqrZinoStM6q+2JF+HeBW41eZDX6j09zDrDd5vg34kDpmac4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733772346; c=relaxed/simple;
	bh=qjgx+2RW+2qA3Kpo1t21oiWuDE038T0YMMKuiv+Fi0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HQIaaE6MPe4RDA+C/F4NxN88ynO3s2N/BtzYRTjq+oEbBZE5cDDPUvZv/CQ6oeH9qIiG4NeFjEzlD6ns6Vs93DK6N3uNUynlGZbqS7h94/G5mYJMMp4YLDPBKUpwcXr7lPg2j+8RPapUxMDI49F9wdUgEhM/WFH5gi5NdncLY5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hHKs5M08; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hHKs5M08"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b15d7b7a32so317032385a.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Dec 2024 11:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733772340; x=1734377140; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bD/oB3rKRX6sl1z5Slf9ygtbR1yaEO5qPjqhHmqcVUs=;
        b=hHKs5M08Jx0Z0w0/WPtcs291eqskyg2FLWbhRtOy3/nNG1XY4qLpaDRiGnTIYG2gqp
         WfiYsaqEp6BdyOn8IhobDC+LSyxjk4b5S20ZsO6L97P5GQvAgFzA3ROEoHWjt4yN937g
         W61Cz8wDekyNSnKrZhLVTyaFcwL7ehuoRGM38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733772340; x=1734377140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bD/oB3rKRX6sl1z5Slf9ygtbR1yaEO5qPjqhHmqcVUs=;
        b=nEaC84L3HXUKQNx5MVu7GyqqUWy6OigoAcSVRc+I9oULFlx2CBBbkP70uXgoE81+J9
         K67aUPH50wmSSK1PRKLjiElaQaLuv9CCEB4wK6mZdB3rRR7hNurlrXxuMr/YYJI0qfL+
         DXwf93Iv3TCETJH9aYwW4M4941Yx4758csLpp1LImW2VpIa5y8VQalOYUfY4zJNgHZo7
         IX1pJm6H7wmGLjbtnSAJ7g9A8FJth5lYE1kjok0HZGcsHovvoV/QuWn4bj9Kgb2t5NVj
         ZbRAnmpkglvcu0S8nvxXIYBH8AEgEOHiPrB0WHIhQXKjY0mJSGncnShPF5O1GjIt35PH
         8SuA==
X-Forwarded-Encrypted: i=1; AJvYcCW/Hd8qEwlyG2Z6Jw0vGpfgZv4EmnpVzy1NhZqmSbLpRdKtunKRAdcrQVKRLNUxpoNpjcN9Ow/jNW+whs6C@lists.linux.dev
X-Gm-Message-State: AOJu0YzhsgKfufZw0x8RwS+MVO9tRSyfF+QxktXyMGCkyDoz+nED9f3G
	qo7CB+6aEJBOW3go5NLi9w6IJAHfO7tI7wNsVC6OdeauKqa3YX6+icTUn8a8NA==
X-Gm-Gg: ASbGncu2XWl+AxPfd4gEHOKKsYl3lxhptjCElW3uHcaTEdvqCRdTDfPLb5Q7Rv0hql4
	MH8a2riaAkKiiIhhgfzb4i3NKiuVK9dS2WcOYB8k3g3WK4KRmLRhjBus90JgCBwdgEb64VDM+WT
	3avima+c/RRkQaSNQVTcKJp93zM2cY836B6KVPxecbLjC9MtTYxAx3trzxoWnqapjPVQHQlTEZj
	d2cdytxSMI0Urf6D009/BnV4HK2jkHrIJX5NLO9dCJdfNaAgWL5lEcX9v4YFbYOqUV26vxOlBxB
	VFyl4Ovs1HobCYfQZedsuLPY
X-Google-Smtp-Source: AGHT+IFFo3fcSdPum9b6G5uOLTbU7+t/CJfByumNs2Z5/XcG53j0L97A8+L9Fove8A9qec5bpHOBcA==
X-Received: by 2002:a05:620a:450b:b0:7b6:cf60:3971 with SMTP id af79cd13be357-7b6cf603aa3mr1080045685a.22.1733772340240;
        Mon, 09 Dec 2024 11:25:40 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6cc1cf6fesm217433385a.102.2024.12.09.11.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 11:25:39 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 09 Dec 2024 19:25:37 +0000
Subject: [PATCH 06/10] media: atomisp: Remove vidioc_g/s callback
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-queryctrl-v1-6-deff7acfcdcb@chromium.org>
References: <20241209-queryctrl-v1-0-deff7acfcdcb@chromium.org>
In-Reply-To: <20241209-queryctrl-v1-0-deff7acfcdcb@chromium.org>
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

The v4l2 ioctl framework can implement vidioc_g/s_ctrl with
vidioc_g/s_ext_ctrl() and we provide those.

These are the last references of vidioc_s/g_ctrl in the codebase. We can
attempt to remove them now.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index d24420d8bd57..394b6f06246c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1566,8 +1566,6 @@ const struct v4l2_ioctl_ops atomisp_ioctl_ops = {
 	.vidioc_g_input = atomisp_g_input,
 	.vidioc_s_input = atomisp_s_input,
 	.vidioc_query_ext_ctrl = atomisp_query_ext_ctrl,
-	.vidioc_s_ctrl = atomisp_s_ctrl,
-	.vidioc_g_ctrl = atomisp_g_ctrl,
 	.vidioc_s_ext_ctrls = atomisp_s_ext_ctrls,
 	.vidioc_g_ext_ctrls = atomisp_g_ext_ctrls,
 	.vidioc_enum_framesizes   = atomisp_enum_framesizes,

-- 
2.47.0.338.g60cca15819-goog


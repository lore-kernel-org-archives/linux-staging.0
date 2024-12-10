Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3031DC9B8
	for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 09:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733822942; cv=none; b=X3sfqdKhN9nH62glapAgeb6nlxsVdiZmn8BskMOvV8bBrigs0+81tNDHELDlogbmQLJQA1mcbJmgv+3zM23qAlyB9BBHfBrdHaET6soY1qx7fyccqxKQX8vELXe2SJOa6KXTDcPA4unHhAcwjmcPpJCcyhEV7JIYLR2JYgaA82U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733822942; c=relaxed/simple;
	bh=Kwv/wusL3b84HhR/u3oJDyjPqtdw53INZ92ugbbfA2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F8M7Ol+5sDzrUqhg1sTjiep0hF/r0I9NU+dlj8x9qHZTMh8k6/RhlF0i9Wyo9IMJIFRehcO27XgeZIb95VcP663iaGmCW/GRqpqx1YgMv3pnSD0CYvc7CvQ4Hd2RW8leny4K9fSWb/jiC/OmZa4lh2gTCCIZ8YeSMnkX8ccsw3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=S2F5/kzP; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S2F5/kzP"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7b678da9310so463274885a.2
        for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 01:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733822939; x=1734427739; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yvntl3jvEfc//x9pm27kdXuf3uRYNcagoSWI36TzXug=;
        b=S2F5/kzPukZZi5BKz4TlkNv372QFsLA77OA+D2PqOLfsY3zzl0VgZ+9MS1kVKgRDci
         nOt6YTTJrgW+GxMH8JSUkiQLmsjqbi1g5LCOuxTTfvUfLIEcIL0+kuX0Ng/xkD37wVKX
         7Y9gw6hUeDYGOIBbcR88RiamMqSMZnc9yPxlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733822939; x=1734427739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yvntl3jvEfc//x9pm27kdXuf3uRYNcagoSWI36TzXug=;
        b=acQUOviWfT02bhpXQ8Uf4x+z3vOxEutnXUifO00CYk4ZKXCUHDyNoglBHYPADxsmNW
         Tt0mTgg1Bl0gxfNM+7P2bJo9V3dpK9mZ3OFgHshovV6xtzUtA3MOMsrahHQVtjYw9uGo
         LAcZRlbxMhL0c8H116uYwz5O2IP5KhMMXLCZ/Ut0MQIBngJJCDHaXTI8bo7sCU5VWkW2
         87Y2d+2HNwly3USt51PGy5oop8fgMCoonzKqrAg42QXwJm9UvgZIuraTnOGeQIrf413Q
         2pIrlZ4fGU7AzKwkFIIsXt5s1V2vWiXXq2T1iWR9kPfC0CGQ+4MKK3UexoF3ISXO4wU9
         P2+g==
X-Forwarded-Encrypted: i=1; AJvYcCXjcTOA8uSDu9XDILCPZazKYxnhxxszK7hk0DbXyrzuNRE6p60D2WYoYiGcQsRX7EMywNOmmpx+Q+pU/Y6V@lists.linux.dev
X-Gm-Message-State: AOJu0YyKPauK1iiZgrHVgtgCx3/yLl3/bzE5/MW4q/D4uAaRUW9ummnH
	AmxSU8+6l+f/A2yqwKSIuzP45eY5njdXGFas9Bi2C48stQfW/HnlblC6chKKyw==
X-Gm-Gg: ASbGncs+UOz43fUxC/uOhXmTTk2DHzdHgZzovih5d4OtSO4ThABkHm3gVSSbYAI/JHs
	e/BgOVtd6je3YJolM7WzDtu2/I7/w/yIHXQHcClrKu4yIOWv6FMSmy7OKwK+5ZkpX3tEckr023e
	ZxEQnGHBuPNbtuDBEy5d26uGGuVCasrG4etlNuth/9eJHRVfBBl+3B0SRlR8H7oU+z/0YegRjq0
	WLJgKIP4mE8kTv6+aoSfpBSHhcBqA/+WVkkhH8frOe9qORTOMUDc5SNCZPklGSvgsBZLf6E/Ff8
	8iEli0WGs002avP1sOc2ZGsAzrVu
X-Google-Smtp-Source: AGHT+IHfGjM3il73uzcVVahBJWJV4voLVQSpqP4azfgSBEzlCLsR7XuITVeqz6peN1GDRvj/X2uvew==
X-Received: by 2002:a05:620a:262a:b0:7b6:e8d4:9b89 with SMTP id af79cd13be357-7b6e8d49fb7mr13352885a.34.1733822939131;
        Tue, 10 Dec 2024 01:28:59 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4675dd86ce4sm24343241cf.30.2024.12.10.01.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:28:58 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:28:50 +0000
Subject: [PATCH v2 06/11] media: atomisp: Remove vidioc_g/s callback
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-queryctrl-v2-6-c0a33d69f416@chromium.org>
References: <20241210-queryctrl-v2-0-c0a33d69f416@chromium.org>
In-Reply-To: <20241210-queryctrl-v2-0-c0a33d69f416@chromium.org>
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
index 6b84bd8e6cf3..1fb2ba819de3 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1565,8 +1565,6 @@ const struct v4l2_ioctl_ops atomisp_ioctl_ops = {
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


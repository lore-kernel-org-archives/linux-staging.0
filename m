Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244E528B4F3
	for <linux-staging@lists.linux.dev>; Mon, 14 Apr 2025 17:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744652523; cv=none; b=qg5y5x2STH4sFJh4rzRKWdCUgWOEyQ6uwzrYbalWuA9P69G7eTrZ/+fzc6WsPXYIoF5dfsuWSn9GV5XTzmaJvS8JXBlaXlx4S9IV1qvR5jYKXbibl1+ka/wA3HYdZuc/Y0qOW9J59l1xCLf00K5U7VdyiRv+9FTy+cnNnR2097c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744652523; c=relaxed/simple;
	bh=4JpnGmP3Hhgrh73p6ayQO38z3PWEVbCm8A1DvNQjRrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VAaCreccnE69m2Dmlist+PdoQygrPdD3V+m6JIvLxep+bSmrmIBNNnAMjGrx+q+/cE9FRAxxDPI2mRNNPpitUlcQMGCgQ53IXqbNEwAmenRtoUUHJBvUhkGgGJpcbcdS7bm4CDPOr+QUPXUoW3/xOhxSMm66L9RbV1KWhWLLNz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=VflISZ4j; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="VflISZ4j"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so49946575e9.1
        for <linux-staging@lists.linux.dev>; Mon, 14 Apr 2025 10:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1744652519; x=1745257319; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N0NiqX3kmmnvN0D1p8k2XJtWrJOkDyGN772Tt9wsVFQ=;
        b=VflISZ4joROoCcr5BdhfQCSRAc1dIXnGqZOvyTuWwkLqtOGi7/dPAaEutwEP73x8f5
         2MajpgGQjlcKhgMrxbpPFzR979Sc/XCXP5Im8X3xktPyYLcWRlEhvH4m8SYV+EufzhKK
         kVPX5P+GoA8NLPf+Fi6aXmKtyNBvVbEVQoAAlRUGoqhYOVubpSgfSQ2oWgJ765b4yOZ6
         4ixu/KVoZ88eiSRjlE2tFR8kY8RHL/Utl4csql6s0KDgpsGpX8a+vpCEvaPVEILgBdA4
         y8VZYy1H26CdPnrF+T6hJrldh3Yqf2eVZolMPB0CZDkhTf7oflrsPAoWF6q9gDhzSBii
         z19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744652519; x=1745257319;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0NiqX3kmmnvN0D1p8k2XJtWrJOkDyGN772Tt9wsVFQ=;
        b=TTo/h0oKKLWhEslDL10f/AP7DjaMIclLIyLXQIjsBbnKZKxpzKJd/Jn5nROqdaGHj5
         OGKGr1MK5NtNfX6Yq6Fblp65SrMldYx5PNV7AX+UAGs9P4gqRL0Cp//6eVRZZwv0Ep03
         DBBhbXHmW45tgQh5mFnWmC/3Q2GRCV4+wpm3u2/B7aYUOkMJA8ZSIhwraNfUdPF1eBI1
         u0sULFn1LjpWrq0dPkFIuUDEa6a9uIhM2WjpAhvaPjuHSNwrLD4xl+rxh5EClRRrweIz
         s8mNg9YzCpp1gbL6kVs8VGhCawvAeuK1gbrWARItXw/Dutmdmftt3rnYnkEfFt2aNTzd
         WSig==
X-Forwarded-Encrypted: i=1; AJvYcCXw92QpnAviybz8015K1cq3J/ujDwchSl8Xteg8qEikA1hYvoIWV1fpAfROPA6fTtM1W1rNjBc8oDcOQ6j0@lists.linux.dev
X-Gm-Message-State: AOJu0Yyp+Y22mhjtiZEdjcuL5nClzgSmm3gFZnn4yfuWltNKI+KEju6S
	78rZ9kkhErAS+Hj0DHz5aCnC50bXHHyAxDTCrIp1XmMLHl7ivbU8lGTyBye+T0PKvtx6bt+Q8RM
	P
X-Gm-Gg: ASbGncs2FV6lWrjKDnnt+15y8CLQM0v2CEa7D0Hot1O2C5NrJTVTEaNloVlResdweY2
	2t9n+VInHrWm9LTuV3+gJnwEzJN7xQy2xJalWRR8LPAbKD3pH016uPZ2tIWRec3cfxbsy4DWYVs
	XzYB4LPCYGTwe5jBiqmY2r0k7sgZV3XgdoZ4rWvTZE03VRZzNM9ZRzfrKWWw1HgiI/io2Hd6Db1
	u9SQUWAmo7u1Po9rpXzg/tdAIUhJLiWh/KfNJMetbLxuUDzh6PMfHD/y0ZIhA4MMq06b/fef1NP
	rHQCG3ceMekrNWTFSCzYnUxWoKezVxSalXRMIeOoZYM=
X-Google-Smtp-Source: AGHT+IGLnXM1BCPUabzkGT8/AC2HrOP60k3F3Sd19EtJp1J2kT6z69sfo+nXbu/QtW8zZo8TdUB2dw==
X-Received: by 2002:a05:600c:3b0d:b0:43c:fdbe:43be with SMTP id 5b1f17b1804b1-43f3a9beb77mr127249525e9.27.1744652518940;
        Mon, 14 Apr 2025 10:41:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43f235a5e90sm182367365e9.38.2025.04.14.10.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 10:41:58 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 14 Apr 2025 18:41:47 +0100
Subject: [PATCH] staging: bcm2835-camera: Initialise dev in v4l2_dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-staging-bcm2835-v4l2-fix-v1-1-2b2db9a8f293@raspberrypi.com>
X-B4-Tracking: v=1; b=H4sIANpI/WcC/x2MQQqAIBAAvxJ7bsHWguor0SF1s4Wy0Igg+nvSc
 QZmHkgchRP0xQORL0myhwxVWYBdpuAZxWUGUtSoulKYzslL8GjsRq1u8KpXwlluNK0zrtPakja
 Q8yNy1v96GN/3A893aqlqAAAA
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Umang Jain <umang.jain@ideasonboard.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, linux-staging@lists.linux.dev, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

Commit 42a2f6664e18 ("staging: vc04_services: Move global g_state to
vchiq_state") changed mmal_init to pass dev->v4l2_dev.dev to
vchiq_mmal_init, however nothing iniitialised dev->v4l2_dev, so we got
a NULL pointer dereference.

Set dev->v4l2_dev.dev during bcm2835_mmal_probe. The device pointer
could be passed into v4l2_device_register to set it, however that also
has other effects that would need additional changes.

Fixes: 42a2f6664e18 ("staging: vc04_services: Move global g_state to vchiq_state")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Noted as we switched to 6.12 that the driver would fail during probe
with an invalid dereference if a camera module was actually configured
for the legacy camera stack.
https://github.com/raspberrypi/linux/issues/6753
---
 drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index b839b50ac26a..fa7ea4ca4c36 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -1900,6 +1900,7 @@ static int bcm2835_mmal_probe(struct vchiq_device *device)
 				__func__, ret);
 			goto free_dev;
 		}
+		dev->v4l2_dev.dev = &device->dev;
 
 		/* setup v4l controls */
 		ret = bcm2835_mmal_init_controls(dev, &dev->ctrl_handler);

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250410-staging-bcm2835-v4l2-fix-b8dbd933c23b

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>


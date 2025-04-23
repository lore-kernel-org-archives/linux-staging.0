Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3345122F755
	for <linux-staging@lists.linux.dev>; Wed, 23 Apr 2025 10:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745405243; cv=none; b=E/jwRXVCPsiMwDBIhFS3D1YubxdZW3WLRDgkZ8CIk0nRQaA+OOav0uANfXh1zlFyveslGdLO6Rq2CEGng3XnUQY26usFzEQqpi/1V/6vHWoaAllmQ8w6cVreUKHMMlBemy+v/CB1e8klucouSDAahW1ULRF6IzYmt7aXAnKHvbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745405243; c=relaxed/simple;
	bh=UU9YoAHKOkXYDXJAShmuDPdc1qbY8RZWY4PpxLmQsaU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gG7nK40vFQIIdZ6EcP6pZoPYzW+KI7h0TariVm8IBcwD5ltBpv88tSgELGq4ZhUIxBzfAqb0u5JOQe4gUT8ClErYiYbhokr1nxhCuoK+9Wx3A5CejxcVIyqDOp/+4HKnBvAsGBy8rAnikUAKr1LsdUUAb0VD4I9hzqYaBhb15GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=NO6FcoSo; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="NO6FcoSo"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39129fc51f8so5248435f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 23 Apr 2025 03:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1745405239; x=1746010039; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fMrbMlTagXkTnenmyJmmNlOF+FvuaE9CmrOSpWPOLlw=;
        b=NO6FcoSov4sTWC2decyAyXNgWKun8Vmci0Sj/554ELdTBXyN8RGIOmpb7KL/gVEswg
         MUCyH6gKMzhAGxDdxXq02fOKCS7rM5nATp9cfRVjaZonVFYIpfRPU4eNJigHxEG5tahu
         D3Ox9pMaPNa7u8rqBRjpmJqlRFwGC+qKmqKDG4bFeY/f/UhFwqvc7y0isu0y6RW+VyFy
         1MYKfOvUv56itSYJFSPvPCb9DkPQ020mua9VrWZxuLJnBiueXSDi3ONYFER1DMAoA6lE
         7DzHkNUQcnRijPl1TSaUtcoHpiWfab6Q9Sdyv9K0RkRpY3wo3EjNYBKcxIdORbOQYgWd
         xCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745405239; x=1746010039;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fMrbMlTagXkTnenmyJmmNlOF+FvuaE9CmrOSpWPOLlw=;
        b=ca2ET7OjmKsc3k3xQmz4NPD2XjSI8HHLW3kqRvyuv4sUoLL2lTq32I5OKISG8sjcsu
         eg+ZoNJ/LV8EZljtxPOfU6kDtksbPMNaaeEDm6wsdPGG4qEHf16e17rSYUEFGWtgN4HC
         tLr67ZflCD9yfRcLiSkJs2+QsV+G4Dy1Mcp/9CzvDYhTdclvjaFXSyZ9Y06ysuQ/uifm
         RPOgcpQfakHMelz519w4XsZZ3J7IKCRkcI7eVbOACHCcWZlBF7bF5FNbA3irra5JfTvo
         3geLwdDV2bhRSf7HH18ce4HhH12TkfjhUybTPyfiXNZkw3PvLMFGGnYXIAYIsM9G5wNr
         048w==
X-Forwarded-Encrypted: i=1; AJvYcCXAXnGidtXapBmMrBEyhfaYeJl2dSwdUvRFFRxEi2bsQ6jiqlN0+odXqjxIBFzklLTe0ql179fikfkdd/xA@lists.linux.dev
X-Gm-Message-State: AOJu0YzNTsRyi8/s7RRathxeTboOaW1SKIa7/vIKtYwe1vNqh+Q9N23C
	c7SwUd81xGMTtAun3O6OZWCHhn3Vdi+vLLuHOE/bAiCLhtqF5OM05Ci7R+b5tTc=
X-Gm-Gg: ASbGnctOO+DqPQow2P+AfmePnXSU/4XHBwMA9eEZaIrRm8vhMNHOq8kbTt97WQ0Da9I
	QOw5kG3sj0E6swBstgaeZpNdwBCP6EgqG/KLDd8gTHntxHtLFW/jr41PctlqcLqopDb36jh9Ll0
	bQthRulYsts9VuJckNBP02HWj8tGlRlufjLib/fbaEqNtaoVT86Jd+24sZyrIeJPKLxpWSCmdkM
	asUXu5/TGr5bUqf0WfxUfPu9iPlPvHoair9XlNLbBHq7MnsjZs7X0lUexkf0uW9yHt54kpBk+3r
	zsh4TtrFUYWloltFQ1M40ZmWB6OM2nBHwmRaIDhtXy4=
X-Google-Smtp-Source: AGHT+IHzSNJo3Tq0+q1KtrvricG5SZh6DtKPLrPA5t2OxS4b3WEMt4hP3LFMNMdr80qgkwfOW+ZF3g==
X-Received: by 2002:a05:6000:4308:b0:390:f6aa:4e7c with SMTP id ffacd0b85a97d-39efba5e837mr14942355f8f.28.1745405239415;
        Wed, 23 Apr 2025 03:47:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-44092d2f514sm21242895e9.24.2025.04.23.03.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 03:47:18 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Apr 2025 11:47:15 +0100
Subject: [PATCH v2] staging: bcm2835-camera: Initialise dev in v4l2_dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-staging-bcm2835-v4l2-fix-v2-1-3227f0ba4700@raspberrypi.com>
X-B4-Tracking: v=1; b=H4sIADLFCGgC/3WNSwqDQBAFrxJ6nQ5Oj4JmlXsEF/NTG+KHHhki4
 t0zEbLMsgpevR1iEA4R7pcdJCSOPE8Z6HoBN5ipD8g+M1BBVVGqAuNqep56tG6kWleYyhdhx2+
 0tbe+0dqRtpDni4Ssz/SzzTxwXGfZzqekvvYXLf9Hk0KFZMnbxtQdNfohJi42iGwL39w8Qnscx
 wclnBYlxgAAAA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Umang Jain <umang.jain@ideasonboard.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, linux-staging@lists.linux.dev, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 stable@vger.kernel.org, linux-kernel@vger.kernel.org, 
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
Cc: stable@vger.kernel.org
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
---
Noted as we switched to 6.12 that the driver would fail during probe
with an invalid dereference if a camera module was actually configured
for the legacy camera stack.
https://github.com/raspberrypi/linux/issues/6753
---
Changes in v2:
- cc stable
- Add Stefan's R-b
- Link to v1: https://lore.kernel.org/r/20250414-staging-bcm2835-v4l2-fix-v1-1-2b2db9a8f293@raspberrypi.com
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


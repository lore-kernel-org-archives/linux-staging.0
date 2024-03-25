Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A9512B144
	for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 14:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711376398; cv=none; b=ZbFR9Nf/NbZQsrV99YEICSVXg6GQien/sWUJZftiMny73s3kPIAUZGUVo/ygEBNaWjI+/GwQcchRMOk8R0mQqX27+LPeWuJ66LSgMJXqYFuin5NB+83jVyHMfkNx0yqrVBdMHdcrYFH2eO88VJQ7bJq6rDh2sRkiTGXC5dfOaUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711376398; c=relaxed/simple;
	bh=JKbdbNdPOYQQqddMWH6dBM0cjrj/2ap/o5f7isOs8AY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rvdlAiswsiddHpttWjGnBy4RWZt8+8yZLp0AzCRAdLp0K/P3SXFSim0BUGuV9gYhy4DKiwl9UAGwyhd5p9GGAThCl+Uisr2Ydg4jXuwC2Wm1l4VpLJp3l8dVBloyW9TcJKq6Emwo1V0tUCc9dEDzD0Dnq1rmBuP3XZoDDftVJCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ruj5+5hE; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ruj5+5hE"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6dc8b280155so2672647a34.0
        for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 07:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711376395; x=1711981195; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mXrTB7+ol6tbk+bHTpvN5T0GXtoDHNWTCFN/jK6yyrw=;
        b=Ruj5+5hEGU7LtgKk8spNttIhM3XusfNcrarok5kkHMurXoJIBFl8vjPSH+MAGYfYvo
         siJVxLxccz4BN6iEaasICO9P0wmAhNL/b0PrvjFsTu0BNgstzy5rB+SAKLcEXLnjIA5E
         AgxBFKYTLG8iIeDlaFB1/9aBzBtD81inG/p/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711376395; x=1711981195;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mXrTB7+ol6tbk+bHTpvN5T0GXtoDHNWTCFN/jK6yyrw=;
        b=AE0N/3L3ZljLnKeFGmKWeMJJvR8co2oyNA3x0JDhVqQks3Nu9ccsUJSw9zBkAISjMj
         4Wh/AhVnH+pZQs3PW10FHmgycqTHglpcT1CNgkx+3xhU1GGfayi8FvJ3WC6OU2J1rrM6
         fW3B8wyPy9vNHj7s35ZxRS9Y0NNNMY/McvkiE1imdOJH084yno7J1G3EfYIOdfqEMqwW
         oGv8dklG0EKv4A7yP+3XPdWqRUbTA3KKKbsFd4kAZ+rYG5WZD3S3dwKm2WTMXfCvPd0K
         TTIjraK9VEkqiwlLdVclyUq5OmCD7YVE16Ea/iqdBmMTk6Ctx+Xc1TUpnrHHKnpSW0Ew
         GBng==
X-Forwarded-Encrypted: i=1; AJvYcCVNU5ABJTMXiJal6AG9jaYUwinGqK+v7TBUq+3xD7fKaS9nNdAQ56GFutbbPZvcdWlC4KieTEkNSK+KWHzQVISRzYvlx4Rtw96/7WRuIg==
X-Gm-Message-State: AOJu0YzrstlRbPTkx/pdJkQDPXzzSOfSwF2/1jG3SNRR8KLBPBwPTi6Y
	F9vx0+SkUOKa+eQpj4yYQOSHvNWq4RPDZHYDfpk7VTsfXTQEZsjy0oWsXiERXUwEKPkJfLGb+VD
	7rA==
X-Google-Smtp-Source: AGHT+IG+csagqpvPTu78ZUHHmPYI/wP0o4on29JF1NkEZT/PFJ0Ha9SsmHe27984oyp+F6/Vtl/r0g==
X-Received: by 2002:a05:6870:d0d1:b0:22a:4345:5731 with SMTP id k17-20020a056870d0d100b0022a43455731mr2324674oaa.29.1711376395371;
        Mon, 25 Mar 2024 07:19:55 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id br11-20020a05622a1e0b00b00430a9b20a55sm2618759qtb.69.2024.03.25.07.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 07:19:54 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/3] media: Fix gcc warnings
Date: Mon, 25 Mar 2024 14:19:52 +0000
Message-Id: <20240325-gcc-arm-warnings-v2-0-47523cf5c8ca@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAiIAWYC/32NMQ7CMAxFr1J5xihN0wEm7oE6pMZNPTRBDhRQl
 bsTegDG96T//gaZVTjDudlAeZUsKVawhwZo9jEwyq0yWGOd6WyHgQi9LvjyGiWGjOyodZbG3pO
 BOrsrT/Lek9eh8iz5kfSzP6ztz/6JrS0aNKPriXo7dSe+0KxpkedyTBpgKKV8AZduLGezAAAA
To: Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

drivers/staging/media/tegra-video/tegra20.c: In function ‘tegra20_vip_start_streaming’:
    drivers/staging/media/tegra-video/tegra20.c:624:72: warning: ‘yuv_input_format’ may be used uninitialized [-Wmaybe-uninitialized]
      624 |                          VI_INPUT_VIP_INPUT_ENABLE | main_input_format | yuv_input_format);
    drivers/staging/media/tegra-video/tegra20.c:617:22: note: ‘yuv_input_format’ was declared here
      617 |         unsigned int yuv_input_format;
          |                      ^~~~~~~~~~~~~~~~
    drivers/media/radio/radio-shark2.c: In function ‘usb_shark_probe’:
    drivers/media/radio/radio-shark2.c:191:17: warning: ‘%s’ directive output may be truncated writing up to 35 bytes into a region of size 32 [-Wformat-truncation=]
      191 |                 .name           = "%s:blue:",
          |                 ^
    In function ‘shark_register_leds’,
        inlined from ‘usb_shark_probe’ at drivers/media/radio/radio-shark2.c:306:11:
    drivers/media/radio/radio-shark2.c:212:17: note: ‘snprintf’ output between 7 and 42 bytes into a destination of size 32
      212 |                 snprintf(shark->led_names[i], sizeof(shark->led_names[0]),
          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      213 |                          shark->leds[i].name, shark->v4l2_dev.name);
          |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    drivers/media/radio/radio-shark2.c: In function ‘usb_shark_probe’:
    drivers/media/radio/radio-shark2.c:197:17: warning: ‘%s’ directive output may be truncated writing up to 35 bytes into a region of size 32 [-Wformat-truncation=]
      197 |                 .name           = "%s:red:",
          |                 ^
    In function ‘shark_register_leds’,
        inlined from ‘usb_shark_probe’ at drivers/media/radio/radio-shark2.c:306:11:
    drivers/media/radio/radio-shark2.c:212:17: note: ‘snprintf’ output between 6 and 41 bytes into a destination of size 32
      212 |                 snprintf(shark->led_names[i], sizeof(shark->led_names[0]),
          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      213 |                          shark->leds[i].name, shark->v4l2_dev.name);
          |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      AR      drivers/staging/media/tegra-video/built-in.a
      AR      drivers/staging/media/built-in.a
    In file included from ./include/asm-generic/preempt.h:5,
                     from ./arch/arm/include/generated/asm/preempt.h:1,
                     from ./include/linux/preempt.h:79,
                     from ./include/linux/spinlock.h:56,
                     from ./include/linux/mmzone.h:8,
                     from ./include/linux/gfp.h:7,
                     from ./include/linux/umh.h:4,
                     from ./include/linux/kmod.h:9,
                     from ./include/linux/module.h:17,
                     from drivers/media/dvb-core/dvbdev.c:15:
    In function ‘check_object_size’,
        inlined from ‘check_copy_size’ at ./include/linux/thread_info.h:251:2,
        inlined from ‘copy_from_user’ at ./include/linux/uaccess.h:182:6,
        inlined from ‘dvb_usercopy’ at drivers/media/dvb-core/dvbdev.c:987:7:
    ./include/linux/thread_info.h:215:17: warning: ‘sbuf’ may be used uninitialized [-Wmaybe-uninitialized]
      215 |                 __check_object_size(ptr, n, to_user);
          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ./include/linux/thread_info.h: In function ‘dvb_usercopy’:
    ./include/linux/thread_info.h:208:13: note: by argument 1 of type ‘const void *’ to ‘__check_object_size’ declared here
      208 | extern void __check_object_size(const void *ptr, unsigned long n,
          |             ^~~~~~~~~~~~~~~~~~~
    drivers/media/dvb-core/dvbdev.c:959:17: note: ‘sbuf’ declared here
      959 |         char    sbuf[128];
          |                 ^~~~
      AR      drivers/media/radio/built-in.a

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2: Thanks Thierry
- Make tegra20_vi_get_output_formats() and tegra20_vi_get_inut_formats,
  consistent.
- Link to v1: https://lore.kernel.org/r/20240323-gcc-arm-warnings-v1-0-0b45cc52f39e@chromium.org

---
Ricardo Ribalda (3):
      staging: media: tegra-video: Fix -Wmaybe-unitialized warn in gcc
      media: radio-shark2: Avoid led_names truncations
      media: dvbdev: Initialize sbuf

 drivers/media/dvb-core/dvbdev.c             | 2 +-
 drivers/media/radio/radio-shark2.c          | 2 +-
 drivers/staging/media/tegra-video/tegra20.c | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)
---
base-commit: b14257abe7057def6127f6fb2f14f9adc8acabdb
change-id: 20240323-gcc-arm-warnings-e4c142cb5ac0

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


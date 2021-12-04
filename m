Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF992C9E
	for <linux-staging@lists.linux.dev>; Sat,  4 Dec 2021 13:43:56 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id f7so3714049vkf.10
        for <linux-staging@lists.linux.dev>; Sat, 04 Dec 2021 05:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AydR8F2XpQAwIIfynMtw323GpH8B4sQw/G4MzaU8WuQ=;
        b=Y90YtdyZGO6pOjo6kMX8e6oJmhT5v4ENZvx82CUq+gQVik7EfzsAPm6hlO/oiiPyvO
         F/+WB/QnmhfOln5IWC8h+TkNpwBmyvm6d2OID2Em45rtf+nNNgB8HdbdQyNUDG1JhKIm
         CmwcCN3vX0bfFnF62LppXDl7K8oKr6PDjIL1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AydR8F2XpQAwIIfynMtw323GpH8B4sQw/G4MzaU8WuQ=;
        b=q3FfSsM7Kuyel/bohiDnjF/Z+rqd5PoP7G+rEGdEyLBZArhx6ydNLg8h798V4GT9oL
         eDHy3s9azeQVy69ROxlGNuMCT0wmO3NsoykZ/2jsfFcxLwuqZYIKcCgFWMCJCczSsYIE
         zn8COPOg5DZA2n+mhGC5e1cBriADnbVXJ/sFJvdzyCIaWadmO8hudx/KcuvpaPPweSaH
         MQ4qOLvZanJ3lJpQXaGTZaF2aM4pSXSKPEddv6LCYyPtFwsU/OOBBkY3fD6s8F7a2Tmv
         hogRAup0xnQKPstwLHT6N0GapvX2wK0l62IG0Mc+3WW9/JshzsmvwNTUk4cHiBdRk/7E
         6cYg==
X-Gm-Message-State: AOAM533vDy3r7FImLQmOJcs9yw2kv/4rteWgfY1bCT7rZmllN9ErY7S+
	K4Y2pQjvmz2dnAndKs7kYaUv2u5vH+qu/5FJbVRLUQ==
X-Google-Smtp-Source: ABdhPJyWq3GJEv3s6U1N7Tj4Vpnfo92Fykb0igbE9UCam071qn22efeIi3Q5vxJfMv+lS5V/Yj6Ry14ehVV/Y9DphRY=
X-Received: by 2002:ac5:cdad:: with SMTP id l13mr29280068vka.39.1638625435253;
 Sat, 04 Dec 2021 05:43:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211201175613.13710-1-dafna.hirschfeld@collabora.com> <20211201175613.13710-2-dafna.hirschfeld@collabora.com>
In-Reply-To: <20211201175613.13710-2-dafna.hirschfeld@collabora.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 4 Dec 2021 22:43:44 +0900
Message-ID: <CAFr9PX=6Pd1Rg=wJvpuX6WX63L=iAnwPA24e59An3Kac5f_vzA@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] staging: media: wave5: Add vpuapi layer
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>, Robert Beckett <bob.beckett@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, hverkuil@xs4all.nl, 
	kernel@collabora.com, dafna3@gmail.com, kiril.bicevski@collabora.com, 
	Nas Chung <nas.chung@chipsnmedia.com>, lafley.kim@chipsnmedia.com, 
	scott.woo@chipsnmedia.com, olivier.crete@collabora.com, 
	dan.carpenter@oracle.com, Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dafna,

Sorry for the piecemeal emails..

On Thu, 2 Dec 2021 at 02:56, Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
> diff --git a/drivers/staging/media/wave5/wave5-hw.c b/drivers/staging/media/wave5/wave5-hw.c

... snip ...

> +static int wave5_wait_bus_busy(struct vpu_device *vpu_dev, int timeout, unsigned int addr)
> +{
> +       u32 gdi_status_check_value = 0x3f;
> +       u32 data;
> +
> +       if (vpu_dev->product_code == WAVE521C_CODE ||
> +           vpu_dev->product_code == WAVE521_CODE ||
> +        vpu_dev->product_code == WAVE521E1_CODE)
> +               gdi_status_check_value = 0x00ff1f3f;
> +
> +       return read_poll_timeout(wave5_vdi_read_register, data, data == gdi_status_check_value,
> +                                0, timeout * 1000, false, vpu_dev, addr);
> +}
> +

This looks like it should be s/wave5_vdi_read_register/wave5_read_register/.
For wave511 addr passed in here is 0x8e14 so well outside of what is
directly accessible.

Also it seems that this can either return 0 or -ETIMEDOUT...

... snip ...

> +int wave5_vpu_reset(struct device *dev, enum sw_reset_mode reset_mode)
> +{
> +       u32 val = 0;
> +       int ret = 0;
> +       struct vpu_device *vpu_dev = dev_get_drvdata(dev);
> +       struct vpu_attr *p_attr = &vpu_dev->attr;
> +       // VPU doesn't send response. force to set BUSY flag to 0.
> +       vpu_write_reg(vpu_dev, W5_VPU_BUSY_STATUS, 0);
> +
> +       if (reset_mode == SW_RESET_SAFETY) {
> +               ret = wave5_vpu_sleep_wake(dev, true, NULL, 0);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       val = vpu_read_reg(vpu_dev, W5_VPU_RET_VPU_CONFIG0);
> +       if ((val >> 16) & 0x1)
> +               p_attr->support_backbone = true;
> +       if ((val >> 22) & 0x1)
> +               p_attr->support_vcore_backbone = true;
> +       if ((val >> 28) & 0x1)
> +               p_attr->support_vcpu_backbone = true;
> +
> +       val = vpu_read_reg(vpu_dev, W5_VPU_RET_VPU_CONFIG1);
> +       if ((val >> 26) & 0x1)
> +               p_attr->support_dual_core = true;
> +
> +       // waiting for completion of bus transaction
> +       if (p_attr->support_backbone) {
> +               if (p_attr->support_dual_core) {
> +                       // check CORE0
> +                       wave5_write_register(vpu_dev, W5_BACKBONE_BUS_CTRL_VCORE0, 0x7);
> +
> +                       ret = wave5_wait_bus_busy(vpu_dev, VPU_BUSY_CHECK_TIMEOUT,
> +                                                 W5_BACKBONE_BUS_STATUS_VCORE0);
> +                       if (ret) {
> +                               wave5_write_register(vpu_dev, W5_BACKBONE_BUS_CTRL_VCORE0, 0x00);
> +                               return ret;
> +                       }
> +
> +                       // check CORE1
> +                       wave5_write_register(vpu_dev, W5_BACKBONE_BUS_CTRL_VCORE1, 0x7);
> +
> +                       ret = wave5_wait_bus_busy(vpu_dev, VPU_BUSY_CHECK_TIMEOUT,
> +                                                 W5_BACKBONE_BUS_STATUS_VCORE1);
> +                       if (ret) {
> +                               wave5_write_register(vpu_dev, W5_BACKBONE_BUS_CTRL_VCORE1, 0x00);
> +                               return ret;
> +                       }
> +
> +               } else if (p_attr->support_vcore_backbone) {
> +                       if (p_attr->support_vcpu_backbone) {
> +                               // step1 : disable request
> +                               wave5_write_register(vpu_dev, W5_BACKBONE_BUS_CTRL_VCPU,
> +                                                    0xFF);
> +
> +                               // step2 : waiting for completion of bus transaction
> +                               ret = wave5_wait_vcpu_bus_busy(vpu_dev, VPU_BUSY_CHECK_TIMEOUT,
> +                                                              W5_BACKBONE_BUS_STATUS_VCPU);
> +                               if (ret) {
> +                                       wave5_write_register(vpu_dev,
> +                                                            W5_BACKBONE_BUS_CTRL_VCPU, 0x00);
> +                                       return ret;
> +                               }
> +                       }
> +                       // step1 : disable request
> +                       wave5_write_register(vpu_dev, W5_BACKBONE_BUS_CTRL_VCORE0, 0x7);
> +
> +                       // step2 : waiting for completion of bus transaction
> +                       if (wave5_wait_bus_busy(vpu_dev, VPU_BUSY_CHECK_TIMEOUT,
> +                                               W5_BACKBONE_BUS_STATUS_VCORE0) == -1) {
> +                               wave5_write_register(vpu_dev, W5_BACKBONE_BUS_CTRL_VCORE0, 0x00);
> +                               return -EBUSY;
> +                       }

but this is looking for -1 on failure.

> +               } else {
> +                       // step1 : disable request
> +                       wave5_write_register(vpu_dev, W5_COMBINED_BACKBONE_BUS_CTRL, 0x7);
> +
> +                       // step2 : waiting for completion of bus transaction
> +                       if (wave5_wait_bus_busy(vpu_dev, VPU_BUSY_CHECK_TIMEOUT,
> +                                               W5_COMBINED_BACKBONE_BUS_STATUS) == -1) {
> +                               wave5_write_register(vpu_dev, W5_COMBINED_BACKBONE_BUS_CTRL, 0x00);
> +                               return -EBUSY;
> +                       }
> +               }

Here too.

Cheers,

Daniel

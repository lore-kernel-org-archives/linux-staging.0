Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DF3173
	for <linux-staging@lists.linux.dev>; Fri, 21 Jan 2022 09:33:21 +0000 (UTC)
Received: by mail-vk1-f182.google.com with SMTP id w5so5185823vke.12
        for <linux-staging@lists.linux.dev>; Fri, 21 Jan 2022 01:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PgMSke+bZlszGyLm6pe6KT+pr+k2kujaqqD5VTRN9qE=;
        b=fBo8ITDcmEA3l/exKfPkfGCjMZ9NsvsqTOBl2NR+NqtF8MYsqLGqdu3gzfxvKurapw
         YogIUgcRgHWi0sXhdhydmV1XLdkoPurTTcO+gQX/n+1pBYbrNY5rxqgJo859TsEwTI3c
         ZyB4pBmDWAaoYFmI/SnCPdPAn2Bpa+PvNMoOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PgMSke+bZlszGyLm6pe6KT+pr+k2kujaqqD5VTRN9qE=;
        b=DC6m9bJ46+bJgZPLVQFhSiVrPq3KgRhADaW9j1aUWJ3s3EGDsGIACR8wEBe/een8iV
         xYt3+5HGotVMiqY2x0Dw7BPAs3BQIxX0txwCYzMNEemf4Y5O7rf2nT8RHSXgDl7e6sY8
         fDX4tszIMEq0IiAW4ZO0IcZFrekoqt4nCIus7vMedUzHfTn5J3QXe75DrLCBeuJptd0I
         zu5LSJNchSCQT64cEk8jz8P+wP6h2PpAX+XdbEF5pov+vcYaoGpQqlFaIW2xPTin55U4
         OQSyrNrCWEBpgT6l8aWQ5wa6WJEwFAkbW+3J71XCzbvYgykyS3CHxPM6Cr193AU9WnFL
         g3Zg==
X-Gm-Message-State: AOAM5311IqXruO56dtt6kXrPL26uu8VSMSrRn3XeWV0Y0OmaJtRAf0pN
	98Sb7MgF4J/ztGUrcGyxd/mjNoqs1qa5npdv+wgLKA==
X-Google-Smtp-Source: ABdhPJysL5/C8W15z++JiLJLa3mgwmZ3xFfYQnPZR5KRkrI9f+B+VkmLAjSX6lKEc5/6IAx/XDetvmPYxJoPVKaiThU=
X-Received: by 2002:a1f:a54c:: with SMTP id o73mr616568vke.34.1642757600880;
 Fri, 21 Jan 2022 01:33:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211201175613.13710-1-dafna.hirschfeld@collabora.com>
 <20211201175613.13710-2-dafna.hirschfeld@collabora.com> <CAFr9PX=6Pd1Rg=wJvpuX6WX63L=iAnwPA24e59An3Kac5f_vzA@mail.gmail.com>
 <cdd9b485-364f-c6bd-776f-a0ca2d260762@collabora.com> <e9905774-a994-6311-7b53-b40588d4f6ec@collabora.com>
 <CAFr9PXnnGc1TUQBeW8JW9qGewhU99gmRbvzZEsZaDmr12jMg0A@mail.gmail.com> <25e7d6db-1cff-6fd5-1071-1f21c5ff7a8a@collabora.com>
In-Reply-To: <25e7d6db-1cff-6fd5-1071-1f21c5ff7a8a@collabora.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Fri, 21 Jan 2022 18:33:10 +0900
Message-ID: <CAFr9PXkppeU-M2Sm7EQv3pO-1PzaD-UEckFWX=B_U8CKbzP7RA@mail.gmail.com>
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

On Fri, 21 Jan 2022 at 18:22, Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
>
>
> On 14.12.21 12:20, Daniel Palmer wrote:
> > Hi Dafna,
> >
> > On Tue, 14 Dec 2021 at 16:48, Dafna Hirschfeld
> > <dafna.hirschfeld@collabora.com> wrote:
> >>>>> +static int wave5_wait_bus_busy(struct vpu_device *vpu_dev, int timeout, unsigned int addr)
> >>>>> +{
> >>>>> +       u32 gdi_status_check_value = 0x3f;
> >>>>> +       u32 data;
> >>>>> +
> >>>>> +       if (vpu_dev->product_code == WAVE521C_CODE ||
> >>>>> +           vpu_dev->product_code == WAVE521_CODE ||
> >>>>> +        vpu_dev->product_code == WAVE521E1_CODE)
> >>>>> +               gdi_status_check_value = 0x00ff1f3f;
> >>>>> +
> >>>>> +       return read_poll_timeout(wave5_vdi_read_register, data, data == gdi_status_check_value,
> >>>>> +                                0, timeout * 1000, false, vpu_dev, addr);
> >>>>> +}
> >>>>> +
> >>>>
> >>>> This looks like it should be s/wave5_vdi_read_register/wave5_read_register/.
> >>>> For wave511 addr passed in here is 0x8e14 so well outside of what is
> >>>> directly accessible.
> >>>
> >>> Hi, I didn't understand this explanation. I see that
> >>> wave5_read_register eventually calls 'wave5_vdi_read_register'.
> >>> Could you please explain in more detail why you think
> >>> calling wave5_vdi_read_register is wrong?
> >
> > Mainly because the address accessed 0x8e14 but on my machine the
> > directly accessible registers end at 0x800.
> >
> >> hi, I see know that those backbone address are indeed not read and written directly but
> >> the address should be first written to a regsiter W5_VPU_FIO_CTRL_ADDR,
> >> and then the content is returned from W5_VPU_FIO_DATA.
> >
> > I think so. But as I can't get this driver to fully work yet I can
> > only say I think so.
>
> Hi,
> Thanks a lot for helping me with compiling the kernel and booting the smart display 'ido-sbc2d70-v1b'.
> I am now at a point where the probe of the driver on that board fails with:
>
> [   30.710385] write --> 0x000000f0:0x00000001
> [   30.727445] wave5_vpu_reset:1594
> [   30.730712] write --> 0x00000070:0x00000000
> [   30.734944] wave5_vpu_reset:1652
> [   30.738186] write --> 0x00000024:0x00000007
> [   30.742382] write --> 0x00000020:0x00018e10
> [   40.746598] wave5_vpu_reset:1656
> [   40.749849] CPU: 1 PID: 1 Comm: sh Not tainted 5.16.0-11196-gd076cd89f795-dirty #14
> [   40.757531] Hardware name: MStar/Sigmastar Armv7 (Device Tree)
> [   40.763389]  unwind_backtrace from show_stack+0x10/0x14
> [   40.768647]  show_stack from dump_stack_lvl+0x40/0x4c
> [   40.773720]  dump_stack_lvl from wave5_wait_bus_busy+0x10/0x44
> [   40.779579]  wave5_wait_bus_busy from wave5_vpu_reset+0x28c/0x584
> [   40.785696]  wave5_vpu_reset from wave5_vpu_init_with_bitcode+0x58/0xe8
> [   40.792337]  wave5_vpu_init_with_bitcode from wave5_vpu_probe+0x2b0/0x560
> [   40.799153]  wave5_vpu_probe from platform_probe+0x5c/0xb8
> [   40.804663]  platform_probe from really_probe+0xc0/0x2fc
> [   40.809998]  really_probe from __driver_probe_device+0x84/0xe4
> [   40.815854]  __driver_probe_device from device_driver_attach+0x24/0x50
> [   40.822407]  device_driver_attach from bind_store+0x80/0xec
> [   40.828002]  bind_store from kernfs_fop_write_iter+0x118/0x1b4
> [   40.833860]  kernfs_fop_write_iter from vfs_write+0x308/0x3fc
> [   40.839631]  vfs_write from ksys_write+0xa4/0xd4
> [   40.844268]  ksys_write from ret_fast_syscall+0x0/0x54
> [   40.849427] Exception stack(0xc189dfa8 to 0xc189dff0)
> [   40.854497] dfa0:                   004751a8 00000015 00000001 004751a8 00000015 00000001
> [   40.862700] dfc0: 004751a8 00000015 00000001 00000004 00000015 bea7eb50 00460a6d 004745e4
> [   40.870900] dfe0: 00000000 bea7e924 0045d43f b6f71cf6
> [   40.875987] write --> 0x00000020:0x00008e14
> [   50.880186] write --> 0x00000024:0x00000000
> [   50.884397] write --> 0x00000020:0x00018e10
> [   60.888598] vdec 1f344800.video-codec: wave5_vpu_reset failed -16
> [   60.894726] vdec 1f344800.video-codec: vpu_init_with_bitcode fail
> [   60.900889] vcc_5v: disabling
> [   60.903890] vcc_sd: disabling
> [   60.904026] vdec 1f344800.video-codec: failed to wave5_vpu_load_firmware: -16
> [   60.906869] vcc_4g: disabling
> [   60.914729] vdec: probe of 1f344800.video-codec failed with error -16
>
> Were you able to reach a point where the probe succeed ?
> Could you write in more detail to which point were you able to make the driver work?

Not yet. It would always timeout waiting for whatever it's waiting for
after loading the firmware.
The hardware exposes the program counter for the internal CPU (VCPU?)
from what I can tell.
From what I can see there the firmware is running as the PC values
look roughly the same as the same hardware running the vendor SDK
image with their binary driver.

When messing with something else (2D gpu) I saw the behaviour change.
So I think there is a clock setting missing.
I will debug this over the weekend and get back to you.

Knowing what the driver is expecting would really help though.

> Does the driver code in https://github.com/linux-chenxing/linux/tree/mstar_v5_17_rebase includes a fix to the bug you mentioned above?

Yep.

I'm going to have another go at getting it to do more this weekend.
I'll update you if/when I find anything.

Cheers,

Daniel

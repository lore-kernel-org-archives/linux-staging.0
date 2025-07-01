Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C771D618E;
	Tue,  1 Jul 2025 15:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751384042; cv=none; b=rrG8obQ6DZCFSOQhPLnhKL8VS61LO81RhLj6jBwRCRA4YWVMI1uqi5IoGcR/xG1kD1EfTLpspSiMuV5EvTNjbzFrtmvjL1oRKhkZO8ue+bwPxhhDXD2rRyzAUCCe9pdJio2QWXtm88h97xq1FA+pApe1JtEYCbooz5tRyM4ZSfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751384042; c=relaxed/simple;
	bh=qQ3EePd46gcHTXj8xnWA6RkVYwV+x8EZZ1MfpsCMXfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GBJquipkms3BLCTVW8kMWL6n2dppIKdZFmpBZthQyUgX6lK+TKbFMCFN9xX/Rri8x4IiecIAdPT6IJw8Nk5NobbXDJEBZ9tzKdFb6zSo2Z6JC4j4HZZHRQC3rTODA/CvE0CamStSmpPazJoVbrpnpwWeQESO4po2GmmrRt9uW3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bx586HMI; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bx586HMI"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e7dc7245bcdso494367276.2;
        Tue, 01 Jul 2025 08:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751384039; x=1751988839; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4nN2brsZ8jWbfGT4ZLwpaNj0SJ51Kk3PP0m0nDTI1zI=;
        b=bx586HMIKNinDq8HNvByXIh9HXZAtF2G1/6d+663HD5AeD3utQ7DvtEcztFQT/Rl6e
         frHV5yav13fplr6F1+0hDc2bVBmghvxDwT1mjD/VhM/XwOSStQrD1a7/LO4ZueU7EhX9
         w7h2W7FfUwAH4FifHlIdwnsJFQVtcJ1kUvh72ixYKxMxaCQHphrFp7QiDrsgYhp3Vd/b
         htRqu6dZS5caBvRamPAsmkWNkhUUPuhYr3+0MhFKujYz+cFRXcY8LvFF85EdakBsPnHO
         AMztlNqV6NBGgQoDTYXgWGmoS3t7296OTbhnLZOrDaAnnEY3MoiUgcdTY5ztzF/umRVH
         CzHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751384039; x=1751988839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4nN2brsZ8jWbfGT4ZLwpaNj0SJ51Kk3PP0m0nDTI1zI=;
        b=K2izyz7sDv/gMITRh+hw9nGN/Qd1vTqR/UmEgau+3cp+mNs2+aan9g8UXO42KaNns3
         xXcWhKUYojiZrElBy4D1uzHhwszNEvJdCmgoD95hun4y5TwddGZh5yTtk/em9lhb7bpl
         VgFMUOKehrLED+vqTFVpEW48Tn9QsL1k+dPyNDZXauBz71539Msy0nPp4xGRCm64fv3c
         r8edmXxVfgRf5rpy37pflodPHsLysBBvCZw7Cjr6JAejXMS9nSzjnIez1m5Gg172u04j
         Yxlv+fPFqbum90tC8qTO2678+8EHIG7Zb1aemIwQFxevczwntThoJXpGCosRn2T+Ogn0
         SC2g==
X-Forwarded-Encrypted: i=1; AJvYcCU+nixe4tHUA35oJ9TW5MMxbsksBCdsgDLp265tw46jV7s1NNt36fbY33anRpAIhO0NhBObYFC/q0zmNLIfJw==@lists.linux.dev, AJvYcCWSkCG7akx43MLbsRQJjnXIyQsECYdgKGQ6xBz+16tY7D764cbox20t7abLYOslhyUzK/7u+/eHZLoiVpJzWbGCrDaMNw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQ0SnrgOHKKZlcbNYIZ+WTQ30IC5Yai8ZnRuKcxucQSr1eXPEO
	nOqfLEpVxwxPipKSBjnJ4EiepQyuQbGcExyyvZRHW1AnsaCQSCiBXpOWssRky1a5WvHEYVY4kpC
	aWWkIsXaX3j9ElG0LLQkQi2uWe3e9hy8=
X-Gm-Gg: ASbGncu6BxDaWdM/PQE9CYlCG/LWcPcLdPPtnpAnXs+9S5FaWAe6okVsg8iMKykgxVp
	AwNqgIMM9NR7Y9Hc031Tr5bQsiYTaviJYxMYay6X3XBQEaYRWKsVaCWLhoQ6zJH/FQyDaXBM+20
	hXA78KNwML8mEeygLDvv7Vg+bAQUJAzJbgt9oGDjMh00s2QA==
X-Google-Smtp-Source: AGHT+IFmuhdQA4chjO1UerExkei66B1tPjaaDTa4uwC17TYvzZDREfWVIA/zAABYinglwQIb14fRHynXMFvAPyO5BXI=
X-Received: by 2002:a05:690c:fcc:b0:712:b566:bf7c with SMTP id
 00721157ae682-7163f6e9a9dmr24531877b3.1.1751384039129; Tue, 01 Jul 2025
 08:33:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250628052536.43737-1-abdelrahmanfekry375@gmail.com>
 <CAHp75Vcy3dHRu8Wb2KZ=xK7adz=-P-iuRTeR8vOWzHzZL9uFeg@mail.gmail.com>
 <CAGn2d8OMRaeozOMxj1Ry8i9T3sJ5J1QqA_Jpk7wYO8KiUbpKBA@mail.gmail.com> <aGPYZhK65LaD0wVO@smile.fi.intel.com>
In-Reply-To: <aGPYZhK65LaD0wVO@smile.fi.intel.com>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Tue, 1 Jul 2025 18:33:47 +0300
X-Gm-Features: Ac12FXxu143NJfeCyJzpFMkjr5UhMphuJFKw55RkiPP1VxDmU_e220rWksBxkXE
Message-ID: <CAGn2d8ONZpOHXex8kjeUDgRPiMqKp8vZ=xhGbEDGphV1t7ZEFw@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Fix premature setting of
 HMM_BO_DEVICE_INITED flag
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, andy@kernel.org, hdegoede@redhat.com, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	skhan@linuxfoundation.com, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi andy ,
On Tue, Jul 1, 2025 at 3:45=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:

> > > Nice. Can you make some fault injection (temporary by modifying the
> > > code to always fail, for example) and actually prove this in practice=
?
> > > If so, the few (important) lines from the given Oops would be nice to
> > > have here.
>
> > I have been trying to test it without having any intel atomisp
> > hardware and failed continuously, do you have any tips or maybe some
> > resources on how i can test this driver.
>
> So, the easiest way as I can see it is to ask people who possess the HW t=
o
> test, but you need to provide a testing patch (which can be applied on to=
p
> of this one, for example).
>

Well, after several hours of trial and error, I finally managed to
find a workaround that allowed me to test the scenario. As expected,
the system crashed exactly at the point we discussed. I was able to
capture the kernel panic log, which is shown below.

To simulate the issue, I injected a failure right after setting the
HMM_BO_DEVICE_INITED flag, this mimics a failure in one of the
subsequent initialization steps. Then, I wrote a test module that
calls the hmm_init() function directly. As anticipated, the kernel
panicked at the hmm_alloc(1) call inside hmm_init().

Here=E2=80=99s the relevant panic log:
[  161.802542] atomisp: loading out-of-tree module taints kernel.
[  161.823358] =3D=3D=3D=3D=3D HMM BO DEVICE TEST =3D=3D=3D=3D=3D
[  161.823666] (NULL device *): Simulated failure for testing purposes.
[  161.824064] (NULL device *): invalid L1PT: pte =3D 0x7fffffff
[  161.824427] (NULL device *): hmm_bo_device_init failed.
[  161.824818] BUG: kernel NULL pointer dereference, address: 0000000000000=
020
[  161.825309] #PF: supervisor read access in kernel mode
[  161.825693] #PF: error_code(0x0000) - not-present page
[  161.826100] PGD 0 P4D 0
[  161.826237] Oops: Oops: 0000 [#1] SMP PTI
[  161.826482] CPU: 2 UID: 0 PID: 3688 Comm: modprobe Kdump: loaded
Tainted: G           O        6.16.0-rc4+ #2 PREEMPT(voluntary)
[  161.827445] Tainted: [O]=3DOOT_MODULE
[  161.827650] Hardware name: innotek GmbH VirtualBox/VirtualBox, BIOS
VirtualBox 12/01/2006
[  161.828273] RIP:
0010:__bo_search_and_remove_from_free_rbtree+0xf/0xd0 [atomisp]
[  161.828977] Code: 2e 0f 1f 84 00 00 00 00 00 66 90 90 90 90 90 90
90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 55 48 89 e5 41 54 49
89 fc 53 <8b> 47 20 39 f0 74 46 89 f3 76 07 48 83 7f 10 00 74 3b 39 d8
73 1f
[  161.830239] RSP: 0018:ffffb28104a2e970 EFLAGS: 00010246
[  161.830588] RAX: 0000000000000000 RBX: ffffffffc0a868e0 RCX: ffff8d6141e=
1ce88
[  161.831071] RDX: ffff8d5f47601980 RSI: 0000000000000001 RDI: 00000000000=
00000
[  161.831524] RBP: ffffb28104a2e980 R08: 0000000000000003 R09: 00000000000=
00001
[  161.831977] R10: 6369766564204c4c R11: 6564204c4c554e28 R12: 00000000000=
00000
[  161.832422] R13: 0000000000000000 R14: ffffffffc0a87950 R15: 00000000000=
00001
[  161.833019] FS:  00007f04fce83740(0000) GS:ffff8d619f0c4000(0000)
knlGS:0000000000000000
[  161.833527] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  161.833868] CR2: 0000000000000020 CR3: 000000010625a003 CR4: 00000000000=
706f0
[  161.834307] Call Trace:
[  161.834434]  <TASK>
[  161.834545]  hmm_bo_alloc+0x5c/0x2c0 [atomisp]
[  161.834959]  __hmm_alloc+0x48/0xf0 [atomisp]
[  161.835267]  hmm_init+0x98/0xd0 [atomisp]
[  161.835561]  ? __pfx_test_init+0x10/0x10 [atomisp]
[  161.835863]  test_init+0x42/0xff0 [atomisp]
[  161.836174]  do_one_initcall+0x4b/0x320
[  161.836446]  do_init_module+0x6a/0x2b0
[  161.836675]  load_module+0x24f7/0x25c0
[  161.836905]  ? kernel_read_file+0x226/0x2d0
[  161.837160]  init_module_from_file+0x9b/0xe0
[  161.837413]  ? init_module_from_file+0x9b/0xe0
[  161.837687]  idempotent_init_module+0x170/0x270
[  161.837958]  __x64_sys_finit_module+0x6f/0xe0
[  161.838225]  x64_sys_call+0x1b7a/0x2150
[  161.838454]  do_syscall_64+0x74/0x1d0
[  161.838701]  ? ksys_mmap_pgoff+0x1b7/0x240
[  161.838950]  ? __x64_sys_mmap+0x37/0x50
[  161.839176]  ? x64_sys_call+0x2008/0x2150
[  161.839429]  ? do_syscall_64+0xa3/0x1d0
[  161.839640]  ? __x64_sys_read+0x1e/0x30
[  161.839863]  ? x64_sys_call+0x1b90/0x2150
[  161.840098]  ? do_syscall_64+0xa3/0x1d0
[  161.840315]  ? do_syscall_64+0x199/0x1d0
[  161.840538]  ? x64_sys_call+0x1b90/0x2150
[  161.840775]  ? do_syscall_64+0xa3/0x1d0
[  161.841007]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  161.841289] RIP: 0033:0x7f04fc92695d
[  161.841490] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e
fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24
08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 03 35 0d 00 f7 d8 64 89
01 48
[  161.842992] RSP: 002b:00007ffd12ffbb88 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[  161.843500] RAX: ffffffffffffffda RBX: 0000557fdea491a0 RCX: 00007f04fc9=
2695d
[  161.843968] RDX: 0000000000000000 RSI: 0000557fd288c358 RDI: 00000000000=
0000c
[  161.844401] RBP: 0000000000040000 R08: 0000000000000000 R09: 00000000000=
00000
[  161.844857] R10: 000000000000000c R11: 0000000000000246 R12: 0000557fd28=
8c358
[  161.845285] R13: 0000000000000000 R14: 0000557fdea492b0 R15: 0000557fdea=
491a0
[  161.845740]  </TASK>
[  161.845844] Modules linked in: atomisp(O+) ipu_bridge v4l2_fwnode
videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_common
v4l2_async videodev mc isofs vboxsf vboxguest vboxvideo
drm_vram_helper nls_iso8859_1 intel_rapl_msr intel_rapl_common
intel_uncore_frequency_common ghash_clmulni_intel sha512_ssse3
sha1_ssse3 aesni_intel snd_intel8x0 rapl snd_ac97_codec ac97_bus
snd_pcm binfmt_misc joydev snd_seq_midi snd_seq_midi_event snd_rawmidi
snd_seq vga16fb snd_seq_device vgastate input_leds sch_fq_codel
snd_timer snd mac_hid soundcore serio_raw vmwgfx drm_ttm_helper ttm
drm_client_lib drm_kms_helper drm msr parport_pc ppdev lp parport
ramoops pstore_blk reed_solomon efi_pstore pstore_zone ip_tables
x_tables autofs4 hid_generic usbhid hid e1000 video psmouse wmi ahci
libahci i2c_piix4 pata_acpi i2c_smbus [last unloaded: vboxguest]
[  161.851072] CR2: 0000000000000020


> With Best Regards,
> Andy Shevchenko

Best Regards,
Abelrahman Fekry

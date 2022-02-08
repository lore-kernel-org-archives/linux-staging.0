Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9CC2F2C
	for <linux-staging@lists.linux.dev>; Tue,  8 Feb 2022 06:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8325C004E1;
	Tue,  8 Feb 2022 06:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644301184;
	bh=b+zpBOL4ZTwMnMgEwD9LOB94TyO/PoYgderEOh0Agws=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hxSTgIOFAGVkaYqNNsunzatkwBcO8Y+hZrmCU27c0lK8Ywku5oNuz0D7FQRQKEuXA
	 DxSBzL9ijEVot2VXzBhTkBsJuXPMQ3Bd9weZ2PZxhAP6KR0MKlhMNCzNPr9V1FSrVH
	 aBZ+5EvZkiVcjEk66clcClaNS1/5KgY7epKD0uQd3MuQliwa1Sn/tFipoc62PTYgSw
	 fowmIpG4P//ZsKFsb1HKzvSWeBwRYn1h+ilqeAic9boOX+jtLhvI7EuaD9xY88HPu2
	 eNRGIg71ssJyevlY7EJPVDpqRjlGxN0y2Wnk11XtFWmH92+cIEucvp0lcUj+l3IcDr
	 ggRI5gEN9ItEw==
Date: Tue, 8 Feb 2022 07:19:37 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Tsuchiya Yuto <kitakar@gmail.com>
Cc: unlisted-recipients:; (no To-header on input)@bombadil.infradead.org,
 Hans de Goede <hdegoede@redhat.com>, Patrik Gfeller
 <patrik.gfeller@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Zijlstra
 <peterz@infradead.org>, Kaixu Xia <kaixuxia@tencent.com>, Ingo Molnar
 <mingo@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, Arnd Bergmann
 <arnd@arndb.de>, Borislav Petkov <bp@suse.de>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [BUG/RFC PATCH 2/5] [BUG][RFC] media: atomisp: pci: remove
 dummy_ptr NULL check to avoid duplicate active_bo
Message-ID: <20220208071937.38991cbf@sal.lan>
In-Reply-To: <20211017162337.44860-3-kitakar@gmail.com>
References: <20211017162337.44860-1-kitakar@gmail.com>
	<20211017162337.44860-3-kitakar@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 18 Oct 2021 01:23:33 +0900
Tsuchiya Yuto <kitakar@gmail.com> escreveu:

> This is almost a BUG report with a patch to just avoid kernel error
> message. Thus, prefixed with [BUG][RFC].
> 
> RFC:
>   1. Regarding the NULL check in hmm_init(), it was added for the case
>      when probe failed [1]. So, need to address that case with the other
>      means? But I'm not sure how we can do for the case.
>   2. Regarding the WARN_ON() in hmm_free(), there is a patch from Alan
>      ("atomisp: hmm gives a bogus warning on unload") [1] but I haven't
>      looked into it yet.
> 
> [1] https://lore.kernel.org/linux-media/151001141201.77201.10725942741811192730.stgit@alans-desktop/
> 
> >8-----------------------------------------------------------------8<  
> 
> The NULL check for dummy_ptr in hmm_init() [1] results in the following
> "hmm_init Failed to create sysfs" error exactly once every
> two times on atomisp reload by rmmod/insmod (although atomisp module
> loads and works fine regardless of this error):
> 
> 	kern  :warn  : [  140.230662] sysfs: cannot create duplicate filename '/devices/pci0000:00/0000:00:03.0/active_bo'
> 	kern  :warn  : [  140.230668] CPU: 1 PID: 2502 Comm: insmod Tainted: G         C OE     5.15.0-rc4-1-surface-mainline #1 b8acf6eb64994414b2e20bad312a7a2c45f748f9
> 	kern  :warn  : [  140.230675] Hardware name: OEMB OEMB/OEMB, BIOS 1.51116.238 03/09/2015
> 	kern  :warn  : [  140.230678] Call Trace:
> 	kern  :warn  : [  140.230687]  dump_stack_lvl+0x46/0x5a
> 	kern  :warn  : [  140.230702]  sysfs_warn_dup.cold+0x17/0x24
> 	kern  :warn  : [  140.230710]  sysfs_add_file_mode_ns+0x160/0x170
> 	kern  :warn  : [  140.230717]  internal_create_group+0x126/0x390
> 	kern  :warn  : [  140.230723]  hmm_init+0x5c/0x70 [atomisp 7a6a680bf400629363d2a6f58fd10e7299678b99]
> 	kern  :warn  : [  140.230811]  atomisp_pci_probe.cold+0x1136/0x148e [atomisp 7a6a680bf400629363d2a6f58fd10e7299678b99]
> 	kern  :warn  : [  140.230875]  local_pci_probe+0x45/0x80
> 	kern  :warn  : [  140.230882]  ? pci_match_device+0xd7/0x130
> 	kern  :warn  : [  140.230887]  pci_device_probe+0xfa/0x1b0
> 	kern  :warn  : [  140.230892]  really_probe+0x1f5/0x3f0
> 	kern  :warn  : [  140.230899]  __driver_probe_device+0xfe/0x180
> 	kern  :warn  : [  140.230903]  driver_probe_device+0x1e/0x90
> 	kern  :warn  : [  140.230908]  __driver_attach+0xc0/0x1c0
> 	kern  :warn  : [  140.230912]  ? __device_attach_driver+0xe0/0xe0
> 	kern  :warn  : [  140.230915]  ? __device_attach_driver+0xe0/0xe0
> 	kern  :warn  : [  140.230919]  bus_for_each_dev+0x89/0xd0
> 	kern  :warn  : [  140.230924]  bus_add_driver+0x12b/0x1e0
> 	kern  :warn  : [  140.230929]  driver_register+0x8f/0xe0
> 	kern  :warn  : [  140.230933]  ? 0xffffffffc153f000
> 	kern  :warn  : [  140.230937]  do_one_initcall+0x57/0x220
> 	kern  :warn  : [  140.230945]  do_init_module+0x5c/0x260
> 	kern  :warn  : [  140.230952]  load_module+0x24bd/0x26a0
> 	kern  :warn  : [  140.230962]  ? __do_sys_finit_module+0xae/0x110
> 	kern  :warn  : [  140.230966]  __do_sys_finit_module+0xae/0x110
> 	kern  :warn  : [  140.230972]  do_syscall_64+0x5c/0x80
> 	kern  :warn  : [  140.230979]  ? syscall_exit_to_user_mode+0x23/0x40
> 	kern  :warn  : [  140.230983]  ? do_syscall_64+0x69/0x80
> 	kern  :warn  : [  140.230988]  ? exc_page_fault+0x72/0x170
> 	kern  :warn  : [  140.230991]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> 	kern  :warn  : [  140.230997] RIP: 0033:0x7f7fd5d8718d
> 	kern  :warn  : [  140.231003] Code: b4 0c 00 0f 05 eb a9 66 0f 1f 44 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b3 6c 0c 00 f7 d8 64 89 01 48
> 	kern  :warn  : [  140.231006] RSP: 002b:00007ffefc25f0e8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> 	kern  :warn  : [  140.231012] RAX: ffffffffffffffda RBX: 000055ac3edcd7f0 RCX: 00007f7fd5d8718d
> 	kern  :warn  : [  140.231015] RDX: 0000000000000000 RSI: 000055ac3d723270 RDI: 0000000000000003
> 	kern  :warn  : [  140.231017] RBP: 0000000000000000 R08: 0000000000000000 R09: 00007f7fd5e52380
> 	kern  :warn  : [  140.231019] R10: 0000000000000003 R11: 0000000000000246 R12: 000055ac3d723270
> 	kern  :warn  : [  140.231021] R13: 0000000000000000 R14: 000055ac3edd06e0 R15: 0000000000000000
> 	kern  :err   : [  140.231038] atomisp-isp2 0000:00:03.0: hmm_init Failed to create sysfs
> 
> So, remove the NULL check to always call sysfs_remove_group() and fix
> the above error.
> 
> At this point, atomisp now gives WARN_ON() in hmm_free() [2] on atomisp
> reload by rmmod/insmod. So, also remove it.
> 
> [1] added on commit
>     d9ab83953fa7 ("media: atomisp: don't cause a warn if probe failed")
> [2] added on commit
>     b83cc378dfc4 ("atomisp: clean up the hmm init/cleanup indirections")

Interesting bug. As dummy_ptr == 0 is indeed a valid value, and
the driver should not call sysfs_remove_group() if sysfs_create_group(),
the right fix seem to use mmgr_EXCEPTION as the default value for
dummy_ptr. This way, the check before calling sys group removal logic
will still preserved.

On other words:

@@ -39,7 +39,7 @@
 struct hmm_bo_device bo_device;
 struct hmm_pool        dynamic_pool;
 struct hmm_pool        reserved_pool;
-static ia_css_ptr dummy_ptr;
+static ia_css_ptr dummy_ptr = mmgr_EXCEPTION;
 static bool hmm_initialized;
 struct _hmm_mem_stat hmm_mem_stat;
 
@@ -209,7 +209,7 @@ int hmm_init(void)
 
 void hmm_cleanup(void)
 {
-       if (!dummy_ptr)
+       if (dummy_ptr == mmgr_EXCEPTION)
                return;
        sysfs_remove_group(&atomisp_dev->kobj, atomisp_attribute_group);
 
The WARN_ON(!virt) should be removed anyway, as virt == 0 is a valid
value.

I'll do the above changes and apply the patch.


> 
> Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
> ---
>  drivers/staging/media/atomisp/pci/hmm/hmm.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
> index 6a5ee4607089..47dc3df3b800 100644
> --- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
> +++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
> @@ -209,8 +209,6 @@ int hmm_init(void)
>  
>  void hmm_cleanup(void)
>  {
> -	if (!dummy_ptr)
> -		return;
>  	sysfs_remove_group(&atomisp_dev->kobj, atomisp_attribute_group);
>  
>  	/* free dummy memory first */
> @@ -288,8 +286,6 @@ void hmm_free(ia_css_ptr virt)
>  
>  	dev_dbg(atomisp_dev, "%s: free 0x%08x\n", __func__, virt);
>  
> -	WARN_ON(!virt);
> -
>  	bo = hmm_bo_device_search_start(&bo_device, (unsigned int)virt);
>  
>  	if (!bo) {

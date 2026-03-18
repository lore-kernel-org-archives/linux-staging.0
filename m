Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD33372EF7
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 21:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773868132; cv=none; b=VB56hTbUL+Tirfr3k9GJTnXj99jjYJHyi8axqMxEEcbJj86efA0Ie81RHZFmUpiujOwgBXcfBYOAHf9/RjTBjRhD6zqO8CJrnRci+HQ7v/Iowk34q9uDGVuFMgGTBe3+uom3cQ2q6FXpW1Q+7GlmRcuAK2zXwLV6GsfNRHJK6ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773868132; c=relaxed/simple;
	bh=assmwfIFPbPLjAs2iUcmLblWZJgo/4bYd3ARcTcdVGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gZvVTN5R2/FPy0dBG/Kv2eXxcxGk/hzymgHK7ktj9RnqQXC6VZndpIvlHEWsjtPj7lJgVklcu3hwGqdYGyvK9iMqEdOqet1ABwyEfCDW9XOTlMZnTrFs4/OaTuFUI67BTV+cg9EKjHHGyvFrFpVJqwOl/H+uczGQQ+MkVfo610w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mBLJa+3+; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mBLJa+3+"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7d7d096607bso149374a34.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 14:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773868130; x=1774472930; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjkVCGc9UuS/iYmQSMn+hsLjVouvW5XYtaAItifULpw=;
        b=mBLJa+3+l8Z6DY2biSlI1+rE5wRWJmwpTgFncU9v/RaLClp/Zj1dqTC4/gM23j9k5e
         zKp+Hh7Z9cWxDele/qmR1YSCW82Gh6E++K5ubplDfPiNyFsYqwgTyZ21RN+GdrI7pzn2
         YWmVLL8qkxRV7Kb+uF+6R9be1wijZ+E6MfyF8O+KrASFqYoXWhUjR1AbE8epJNWzgnMD
         5YoO659oQL/+nGzOZ7PNcAtllXIithNuTLrfmWh7DQNYhStNjD5DvkrvH/74OrvCsRbj
         YOxSWF9yTwn6mUKm+l31aPvEikgcuIhZJ5QFr44+nqieuwewjX7JzbToYVP8sBmjyu0L
         TMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773868130; x=1774472930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hjkVCGc9UuS/iYmQSMn+hsLjVouvW5XYtaAItifULpw=;
        b=p0aEUUwT6rFXg+TvTJQyxBcIqYOg8j0Hu7POFLXYh2H0M+JnW3SPSW52ppBE7UmfgO
         WB8nMsIJIAUjYZmBkYX8wQBAqp2sUvS/2BaLQVQX2mbkIHWuHNwUNm7NS+fjVYhpxlaJ
         ZlACJA+Zsox2cijJCMnObHCrBOMo6B/PHhrhZuusjFQt2KT/yFKxjS/rSCeceftTnkS/
         gvA9wS9sQed0UHam8RQdqzqJB2qXOjXROGTngHbkZkDpY88ZgiQhZSSffsBKtb3BoeqH
         N/TBKEh9Q395ZjfW5zMJa353lAkKa8/SyRCMZRqqaSf/ziWU1Nt9EHWspu12TWM8zi4d
         B9xg==
X-Forwarded-Encrypted: i=1; AJvYcCX2DzZIyPb+xpWkx9OD+etYkzl9ZdMZb4FTpt2QpwDvQxc6pIjarajpG1bp74BLosqDLSoqIVPVIMVMLL/4@lists.linux.dev
X-Gm-Message-State: AOJu0YzAc6VMOx00V0GzcbyB5X9VPsklw8yMfx7ISqdkAoyXKlP8ptSM
	2Xr0yfGHnLa7tq2qJxgzto2VuEqQggSi5soGejVVbdzY8KdG8TQIvFgd
X-Gm-Gg: ATEYQzxj3/3YfxPnygH/OxqWPEZVNt4wGGu7LGdb0kAmDE77QAKRkdDibtQHm4XQM+4
	uarrqnDqTQGY8CqPj0jTPKsnpqzcNclDZo/lFy2ch3AyvYfGRLiJcgFz6Xh/y2YF6nYLm5Ap/zr
	bw2OOyucBoMIJOyemSl492Mb9s535AA0KLsgnnm4waylrdTuZIsr0sL4yjtBEIOVpzapQCvpSoM
	UNIs07WUj4l4nT2VJpnV9MsUyK4X7ju35Q+ZZQxg4Gk1oOdHzezPhTaNuW0Tww09BLp2VxDU+uN
	+FJ8uX4ztNAMvEUrZt9AGhCi/fh3AQdJn9E6bqmfcHeJYH3vRAO68VGtTXnX8yvG8+s9JHfC5pU
	2aOo1QK0vPh/P/NfLeQ+BzINSD+aMUlutGjgy8tojyFl1hfiEBoOzqkbgn/M2aprz9HNEedKPDG
	HhP5aYA9jS73g3by4m9ohkVPmAg6I3lv43
X-Received: by 2002:a05:6820:4513:b0:67b:f775:e5fe with SMTP id 006d021491bc7-67c0db33831mr2728249eaf.65.1773868129977;
        Wed, 18 Mar 2026 14:08:49 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:56::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41bd2c3111dsm3532488fac.12.2026.03.18.14.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 14:08:48 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Clemens Ladisch <clemens@ladisch.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Bodo Stroesser <bostroesser@gmail.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-afs@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v2 12/16] mm: allow handling of stacked mmap_prepare hooks in more drivers
Date: Wed, 18 Mar 2026 14:08:45 -0700
Message-ID: <20260318210845.2591228-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <72750af6906fd96fb6f18e83ac3e694cf357a2c1.1773695307.git.ljs@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 16 Mar 2026 21:12:08 +0000 "Lorenzo Stoakes (Oracle)" <ljs@kernel.org> wrote:

> While the conversion of mmap hooks to mmap_prepare is underway, we wil
> encounter situations where mmap hooks need to invoke nested mmap_prepare
> hooks.
> 
> The nesting of mmap hooks is termed 'stacking'.  In order to flexibly
> facilitate the conversion of custom mmap hooks in drivers which stack, we
> must split up the existing compat_vma_mapped() function into two separate
> functions:
> 
> * compat_set_desc_from_vma() - This allows the setting of a vm_area_desc
>   object's fields to the relevant fields of a VMA.

Hello Lorenzo, I hope you are doing well!

Thank you for this patch. I was developing on top of mm-new today and had
an error that I think was caused by this patch. I want to preface this by
saying that I am not at all familiar with this area of the code, so please
do forgive me if I've misinterpreted the crash and mistakenly pointed
at this commit : -)

Here is the crash:

[    1.083795] kernel tried to execute NX-protected page - exploit attempt? (uid: 0)
[    1.083883] BUG: unable to handle page fault for address: ffa00000048efbb8
[    1.083957] #PF: supervisor instruction fetch in kernel mode
[    1.084030] #PF: error_code(0x0011) - permissions violation
[    1.084086] PGD 100000067 P4D 10035f067 PUD 100364067 PMD 441ed9067 PTE 80000004466a3163
[    1.084162] Oops: Oops: 0011 [#1] SMP
[    1.084218] CPU: 0 UID: 0 PID: 305 Comm: mkdir Tainted: G        W   E       7.0.0-rc4-virtme-00442-ge53de5a0302f-dirty #85 PREEMPTLAZY

As you can see, it's on a QEMU instance. I don't think this makes a difference
in the crash, though.

[    1.084321] Tainted: [W]=WARN, [E]=UNSIGNED_MODULE
[    1.084369] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-5.el9 11/05/2023
[    1.084450] RIP: 0010:0xffa00000048efbb8
[    1.084489] Code: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 <40> 12 0e 00 01 00 11 ff d0 fa 8e 04 00 00 a0 ff 80 33 51 02 01 00
[    1.084642] RSP: 0018:ffa00000048ef998 EFLAGS: 00010286
[    1.084692] RAX: ffa00000048efbb8 RBX: ff11000102512cc0 RCX: 000000000000000d
[    1.084766] RDX: ffffffffa06247d0 RSI: ffa00000048efa18 RDI: ff11000102512cc0
[    1.084826] RBP: ffa00000048ef9c8 R08: 0000000000000000 R09: 0000000000000007
[    1.084889] R10: ff110001047d1f08 R11: 00007effdc3d0fff R12: ff110001047d3b00
[    1.084954] R13: ff11000446cae600 R14: ff110001024efe00 R15: ff11000102510a80
[    1.085021] FS:  0000000000000000(0000) GS:ff110004aae72000(0000) knlGS:0000000000000000
[    1.085083] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.085136] CR2: ffa00000048efbb8 CR3: 0000000102667001 CR4: 0000000000771ef0
[    1.085201] PKRU: 55555554
[    1.085228] Call Trace:
[    1.085248]  <TASK>
[    1.085274]  ? __compat_vma_mmap+0x8e/0x130
[    1.085318]  ? compat_vma_mmap+0x76/0x80
[    1.085354]  ? mas_alloc_nodes+0xb2/0x110
[    1.085390]  ? backing_file_mmap+0xc3/0xf0
[    1.085426]  ? ovl_mmap+0x41/0x50
[    1.085463]  ? ovl_mmap+0x50/0x50
[    1.085499]  ? __mmap_region+0x7e8/0x1100
[    1.085539]  ? do_mmap+0x49f/0x5e0
[    1.085573]  ? vm_mmap_pgoff+0xef/0x1e0
[    1.085609]  ? ksys_mmap_pgoff+0x15c/0x1f0
[    1.085647]  ? do_syscall_64+0xab/0x980
[    1.085684]  ? entry_SYSCALL_64_after_hwframe+0x4b/0x53
[    1.085730]  </TASK>
[    1.085770] Modules linked in: virtio_mmio(E) 9pnet_virtio(E) 9p(E) 9pnet(E) netfs(E)
[    1.085838] CR2: ffa00000048efbb8
[    1.085874] ---[ end trace 0000000000000000 ]---
[    1.085875] kernel tried to execute NX-protected page - exploit attempt? (uid: 0)
[    1.085918] RIP: 0010:0xffa00000048efbb8
[    1.085921] Code: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 <40> 12 0e 00 01 00 11 ff d0 fa 8e 04 00 00 a0 ff 80 33 51 02 01 00
[    1.085988] BUG: unable to handle page fault for address: ffa00000048f7bb8
[    1.086026] RSP: 0018:ffa00000048ef998 EFLAGS: 00010286
[    1.086166] #PF: supervisor instruction fetch in kernel mode
[    1.086221]
[    1.086267] #PF: error_code(0x0011) - permissions violation
[    1.086321] RAX: ffa00000048efbb8 RBX: ff11000102512cc0 RCX: 000000000000000d
[    1.086348] PGD 100000067
[    1.086394] RDX: ffffffffa06247d0 RSI: ffa00000048efa18 RDI: ff11000102512cc0
[    1.086459] P4D 10035f067
[    1.086486] RBP: ffa00000048ef9c8 R08: 0000000000000000 R09: 0000000000000007
[    1.086550] PUD 100364067
[    1.086577] R10: ff110001047d1f08 R11: 00007effdc3d0fff R12: ff110001047d3b00
[    1.086641] PMD 441ed9067
[    1.086668] R13: ff11000446cae600 R14: ff110001024efe00 R15: ff11000102510a80
[    1.086731] PTE 80000004433d3163
[    1.086764] FS:  0000000000000000(0000) GS:ff110004aae72000(0000) knlGS:0000000000000000
[    1.086829]
[    1.086868] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.086931] Oops: Oops: 0011 [#2] SMP
[    1.086958] CR2: ffa00000048efbb8 CR3: 0000000102667001 CR4: 0000000000771ef0
[    1.087015] CPU: 29 UID: 0 PID: 306 Comm: mount Tainted: G      D W   E       7.0.0-rc4-virtme-00442-ge53de5a0302f-dirty #85 PREEMPTLAZY
[    1.087050] PKRU: 55555554
[    1.087115] Tainted: [D]=DIE, [W]=WARN, [E]=UNSIGNED_MODULE
[    1.087207] Kernel panic - not syncing: Fatal exception
[    2.158392] Shutting down cpus with NMI
[    2.158629] Kernel Offset: disabled
[    2.158668] ---[ end Kernel panic - not syncing: Fatal exception ]---

It crashes at compat_vma_mmap, and here is what I think could be the 
potential crash path:

- compat_vma_mmap() creates struct vm_area_desc desc;
  - compat_set_desc_from_vma Doesn't initialize the struct, but instead
    modifies independent fields. I think this is where the behavior
    diverges, since before we would use the C initializer and uninitialized
    variables would be set to 0 (including ommitted ones, like
    action.success_hook or action.error_hook). But action.type = MMAP_NOTHING
  - desc.action.success_hook remains uninitialized in vfs_mmap_prepare
  - mmap_action_complete()
    - Here, We've set action.type to be MMAP_NOTHING, so we have err = 0
    - mmap_action_finish(action, vma, 0)
      - And here, since err == 0, we check action->success_hook (which has
        garbage, therefore it's nonzero) and call action->success_hook(vma)

And I think action->success_hook(vma) where success_hook is uninitialized
stack garbage gets me to where I am.

Again, I'm not too familiar with this area of the kernel, this is just
based on the quick digging that I did. And aplogies again if I'm missing
something ; -) I do think that the uninitialized members could be a problem
though.

Thank you, I hope you have a great day Lorenzo!
Joshua

Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F60C70
	for <linux-staging@lists.linux.dev>; Mon, 14 Jun 2021 13:24:46 +0000 (UTC)
IronPort-SDR: QBwiReo5gyfvFsu0KmHFcGVp7r6oc6AWnAqBMxNA/I1qDgD/lbbZq5ia5gzH19ey4fGoGur7pJ
 3azbpwW8S7bQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="192922835"
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; 
   d="scan'208";a="192922835"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2021 06:24:44 -0700
IronPort-SDR: 4uA4aG4ATRGcELj6mVIIipsj7S31i78lSJSkdTZtppZIp9IBhVKQcWeTB6JAWaOAhVgc0IR5Qw
 LVsjj7oq1qIw==
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; 
   d="scan'208";a="553365800"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2021 06:24:41 -0700
Received: from andy by smile with local (Exim 4.94)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1lsmZx-002Ejc-DY; Mon, 14 Jun 2021 16:24:37 +0300
Date: Mon, 14 Jun 2021 16:24:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Eduardo Valentin <edubezval@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vaibhav Gupta <vaibhavgupta40@gmail.com>,
	Liu Shixin <liushixin2@huawei.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	syzbot+142888ffec98ab194028@syzkaller.appspotmail.com
Subject: Re: [PATCH v3 1/8] media: v4l2-core: ignore native time32 ioctls on
 64-bit
Message-ID: <YMdYlcVThyh7sFgv@smile.fi.intel.com>
References: <20210614103409.3154127-1-arnd@kernel.org>
 <20210614103409.3154127-2-arnd@kernel.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210614103409.3154127-2-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jun 14, 2021 at 12:34:02PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Syzbot found that passing ioctl command 0xc0505609 into a 64-bit
> kernel from a 32-bit process causes uninitialized kernel memory to
> get passed to drivers instead of the user space data:

> BUG: KMSAN: uninit-value in check_array_args drivers/media/v4l2-core/v4l2-ioctl.c:3041 [inline]
> BUG: KMSAN: uninit-value in video_usercopy+0x1631/0x3d30 drivers/media/v4l2-core/v4l2-ioctl.c:3315
> CPU: 0 PID: 19595 Comm: syz-executor.4 Not tainted 5.11.0-rc7-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
>  __dump_stack lib/dump_stack.c:79 [inline]
>  dump_stack+0x21c/0x280 lib/dump_stack.c:120
>  kmsan_report+0xfb/0x1e0 mm/kmsan/kmsan_report.c:118
>  __msan_warning+0x5f/0xa0 mm/kmsan/kmsan_instr.c:197
>  check_array_args drivers/media/v4l2-core/v4l2-ioctl.c:3041 [inline]
>  video_usercopy+0x1631/0x3d30 drivers/media/v4l2-core/v4l2-ioctl.c:3315
>  video_ioctl2+0x9f/0xb0 drivers/media/v4l2-core/v4l2-ioctl.c:3391
>  v4l2_ioctl+0x255/0x290 drivers/media/v4l2-core/v4l2-dev.c:360
>  v4l2_compat_ioctl32+0x2c6/0x370 drivers/media/v4l2-core/v4l2-compat-ioctl32.c:1248
>  __do_compat_sys_ioctl fs/ioctl.c:842 [inline]
>  __se_compat_sys_ioctl+0x53d/0x1100 fs/ioctl.c:793
>  __ia32_compat_sys_ioctl+0x4a/0x70 fs/ioctl.c:793
>  do_syscall_32_irqs_on arch/x86/entry/common.c:79 [inline]
>  __do_fast_syscall_32+0x102/0x160 arch/x86/entry/common.c:141
>  do_fast_syscall_32+0x6a/0xc0 arch/x86/entry/common.c:166
>  do_SYSENTER_32+0x73/0x90 arch/x86/entry/common.c:209
>  entry_SYSENTER_compat_after_hwframe+0x4d/0x5c

Can we, please, get a habit to reduce tracebacks to only significant lines?
This is not only reduces the storage foot print of repositories in the world
(and thus electricity consumed for any operation on it) but also increases
density of useful information on one (small, due to reading on laptops / small
screen size devices) page.

> The time32 commands are defined but were never meant to be called on
> 64-bit machines, as those have always used time64 interfaces.  I missed
> this in my patch that introduced the time64 handling on 32-bit platforms.
> 
> The problem in this case is the mismatch of one function checking for
> the numeric value of the command and another function checking for the
> type of process (native vs compat) instead, with the result being that
> for this combination, nothing gets copied into the buffer at all.
> 
> Avoid this by only trying to convert the time32 commands when running
> on a 32-bit kernel where these are defined in a meaningful way.

-- 
With Best Regards,
Andy Shevchenko



Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0B53481
	for <linux-staging@lists.linux.dev>; Sat, 31 Jul 2021 16:18:14 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id z6-20020a9d24860000b02904d14e47202cso4264811ota.4
        for <linux-staging@lists.linux.dev>; Sat, 31 Jul 2021 09:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Wd7Ss1nUXQfJrFxKuj4fDW8j4pOsn6zKgX3RT8Xn4Vc=;
        b=cNJg/4N2mfTSR8QBarlydvmQrvAs12ok6Hz1kWxjTF8xDpK35rT5yrDc7PRGQUvcjD
         4s2p6q30auD/Kbvoyo0J9HAChCxIibzyonQIs6ottmYVAtzIe0KqheHivrsWKmmAnQEr
         LWBYjNa0wiJe3JfXlsj8DEYUAhJZyN9hHTR4l5AoT/+dJrPT3B8H3CPgsx9WIXkykxvH
         4Ocl5f20qPK9/6zJ5+mlT2VSAOZQIBWEfIOZHxTRulgrKqTFHVvfXWnn7pnUz9ZCoDmw
         S1duwERXw29hqsyBeOU9CyVihci9xUoDZkP181PjFhpT6fEr/yvDUUYZCoTxSS84ioJw
         98og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Wd7Ss1nUXQfJrFxKuj4fDW8j4pOsn6zKgX3RT8Xn4Vc=;
        b=p+xGLNPpYUe7XbfzQ7Ytq6K4VQgqu1Os4rSkxHoZEbXaqazJ3tYvoXmFiVQ3l6FO0F
         eIzaE5Nv0/XRCbju4kdUcX8RRxst8r0kuIAhk/SLjZMhM4d6qYWMGpuB/lySRz348Jkb
         spHOFVWWwMSq7X6UODTarliUG9F6f09iUKJRXgdPWTxzSufj9P4m2hRsP07Rfdud0LuH
         haZRuk7EAwMJPpP+qBdnLHDWIQhaO26Q2LBwDqru5nM+KLXxaq9y/xS86UgjsZjhUqlf
         nG1YA+XyLQPKNIcXHdYlTfE/+ZM4uNx8V+Jgx6RKXTkF+mk6z40qqWF6ZtpDzsxPMYBc
         Cw7w==
X-Gm-Message-State: AOAM5304ynfyHkLxONtBh1YUVNEAWPJx9ov2ysf1SBaNUgi8Wvs2Xl8I
	fVZHZ6EtZcKEcCAku1bEeARqf2bk5Js=
X-Google-Smtp-Source: ABdhPJx67zKLZJJ4mgWe2KVaD68nW+o4K6Nvt2nMD3JfL8oPLZdypPjY94jd2ORlrCYeS8uuK1pSDA==
X-Received: by 2002:a05:6830:215a:: with SMTP id r26mr5881875otd.244.1627748292910;
        Sat, 31 Jul 2021 09:18:12 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com (2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com. [2603:8090:2005:39b3::100a])
        by smtp.gmail.com with ESMTPSA id b70sm860006oii.24.2021.07.31.09.18.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jul 2021 09:18:12 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: kernel BUG in new r8188eu
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev
References: <80042e9f-6811-38f3-010b-1c0951ba88db@lwfinger.net>
 <YQThm1A0Up1m4l1S@kroah.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <c2a6746a-24e6-6888-9208-32fccebb3fec@lwfinger.net>
Date: Sat, 31 Jul 2021 11:18:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YQThm1A0Up1m4l1S@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/31/21 12:37 AM, Greg Kroah-Hartman wrote:
> Is this a new regression due to the recent cleanups, or something that
> has always been here?

I suspect that it has been there forever. I was just doing the kinds of things a 
user might do, and locked up my box.

> As for the error, looks like someone is reading to an address that is
> in userspace without doing the proper copy_from_user() thing.  Do you
> have a full traceback?

  BUG: unable to handle page fault for address: ffffeb020003b848
  #PF: supervisor read access in kernel mode
  #PF: error_code(0x0000) - not-present page
  PGD 0 P4D 0
  Oops: 0000 [#1] SMP PTI
  CPU: 2 PID: 45 Comm: kworker/2:1 Tainted: G         C O 
5.14.0-rc2-00157-g390c661543a8 #8
  Hardware name: TOSHIBA TECRA A50-A/TECRA A50-A, BIOS Version 4.50   09/29/2014
  Workqueue: usb_hub_wq hub_event [usbcore]
  RIP: 0010:kfree+0x68/0x2c0
  Code: 01 e5 0f 82 5f 02 00 00 48 b8 00 00 00 80 7f 77 00 00 48 01 c5 48 b8 00 
00 00 00 00 ea ff ff 48 c1 ed 0c 48 c1 e5 06 48 01 c5 <48> 8b 45 0>
  RSP: 0018:ffffc900001efa78 EFLAGS: 00010282
  RAX: ffffea0000000000 RBX: ffffc90000ee1028 RCX: 000000008010000d
  RDX: 0000000000000000 RSI: ffffffffa149eddf RDI: ffffc90000ee1578
  RBP: ffffeb020003b840 R08: 0000000000000001 R09: 0000000000000001
  R10: 0000000000000000 R11: ffff888121c0e400 R12: ffffc90000ee1578
  R13: ffff888101fd0000 R14: ffff888101fd0030 R15: 0000000000000003
  FS:  0000000000000000(0000) GS:ffff888323280000(0000) knlGS:0000000000000000
  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  CR2: ffffeb020003b848 CR3: 000000000220a002 CR4: 00000000001706e0
  Call Trace:
   ? kfree+0x25a/0x2c0
   rtw_free_mlme_priv_ie_data+0x15/0xf8 [r8188eu]
   _rtw_free_mlme_priv+0xe/0x30 [r8188eu]
   rtw_free_mlme_priv+0x1a/0x47 [r8188eu]
   rtw_free_drv_sw+0x5c/0x1ae [r8188eu]
   rtw_usb_if1_deinit+0x67/0xcd [r8188eu]
   rtw_dev_remove+0x5a/0xf4 [r8188eu]
   usb_unbind_interface+0x8a/0x270 [usbcore]
   ? kernfs_find_ns+0x35/0xd0
   __device_release_driver+0x1a0/0x260
   device_release_driver+0x24/0x30
   bus_remove_device+0xd8/0x140
   device_del+0x18b/0x3e0
   ? kobject_cleanup+0x49/0x130
   usb_disable_device+0xd9/0x260 [usbcore]
   usb_disconnect.cold+0x7b/0x201 [usbcore]
   hub_port_connect+0x88/0x8d0 [usbcore]
   ? kfree+0xe6/0x2c0
   hub_port_connect_change+0xb1/0x3a0 [usbcore]
   port_event+0x5d4/0x720 [usbcore]
   hub_event+0x1db/0x430 [usbcore]
   process_one_work+0x1dd/0x3a0
   worker_thread+0x50/0x3f0
   ? rescuer_thread+0x390/0x390
   kthread+0x128/0x140
   ? set_kthread_struct+0x40/0x40
   ret_from_fork+0x22/0x30
  Modules linked in: snd_seq_dummy snd_hrtimer snd_seq snd_seq_device ctr ccm 
r8188eu(C) rfcomm rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_resolver nfs>
   crypto_simd cryptd i915 i2c_algo_bit serio_raw ttm drm_kms_helper syscopyarea 
sysfillrect sysimgblt fb_sys_fops drm xhci_pci ehci_pci xhci_hcd >
  CR2: ffffeb020003b848
  ---[ end trace f5f4e2b2680b5fd7 ]---

The driver is allocating some buffers using kmalloc variants, and others using 
vmalloc. I checked to see if there was confusion on which form of free should be 
used, but this one is allocated with kmalloc and freed with kfree, which should 
be OK.

Larry

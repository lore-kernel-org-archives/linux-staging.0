Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D6B7E
	for <linux-staging@lists.linux.dev>; Fri, 11 Mar 2022 06:50:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BC86C340EC;
	Fri, 11 Mar 2022 06:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1646981401;
	bh=GPe0URqhjf9MwxKe2rxsKih3toSlOVZ1Bv4hFZgoFSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tvHzNBtut4An8eq2olhjRGFVikw6H7c+5Q1kGeH10mQuYU6oNQvExeyzfAVHUtoFZ
	 t+j0uPkN1339ZgZQ+zy/voDIx/sP7pB5f9T90bBHhPqaUT7D+Eth9oqzeTJYtnq4gR
	 GoCbE+D2d7lNNPxh2Tv1Pq96QdaudMSxI+hPhkCA=
Date: Fri, 11 Mar 2022 07:49:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Czerwacki, Eial" <eial.czerwacki@sap.com>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: help in address issues with a new driver
Message-ID: <YirxFbTcmzF1uAoC@kroah.com>
References: <PAXPR02MB73108745861C53FA175BA588810B9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <PAXPR02MB7310A014368829393A8D8692810B9@PAXPR02MB7310.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAXPR02MB7310A014368829393A8D8692810B9@PAXPR02MB7310.eurprd02.prod.outlook.com>

On Thu, Mar 10, 2022 at 10:58:25PM +0000, Czerwacki, Eial wrote:
> Greetings, 
> 
> I'm working on a driver intended to be sent to staging soon and I've encountered two issue I'd like to get help with.
> the driver's hierarchy is one module file shared by other two modules.

So 1 .c file that needs to be built into 2 different .ko files?

Don't do that, it's a mess and is not worth it.  Please restructure your
code.


> when I try to select both all three drivers as modules, I the following these two errors:
> ~/workspace/linux-staging.git$ make modules -j 9
> scripts/kconfig/conf  --syncconfig Kconfig
>   DESCEND  objtool
>   CALL    scripts/atomic/check-atomics.sh
>   CALL    scripts/checksyscalls.sh
>   CHK     include/generated/compile.h
>   CHK     kernel/kheaders_data.tar.xz
>   GEN     kernel/kheaders_data.tar.xz
>   CC [M]  kernel/kheaders.o
>   MODPOST Module.symvers
> WARNING: modpost: missing MODULE_LICENSE() in drivers/staging/vsmp-guest-driver/common/vsmp_version.o
> ERROR: modpost: "vsmp_release_op" [drivers/staging/vsmp-guest-driver/common/vsmp_version.ko] undefined!
> ERROR: modpost: "vsmp_deregister_sysfs_group" [drivers/staging/vsmp-guest-driver/common/vsmp_version.ko] undefined!
> ERROR: modpost: "vsmp_register_sysfs_group" [drivers/staging/vsmp-guest-driver/common/vsmp_version.ko] undefined!
> ERROR: modpost: "vsmp_init_op" [drivers/staging/vsmp-guest-driver/common/vsmp_version.ko] undefined!
> ERROR: modpost: "vsmp_read_buff_from_bar" [drivers/staging/vsmp-guest-driver/common/vsmp_version.ko] undefined!
> ERROR: modpost: "vsmp_generic_buff_read" [drivers/staging/vsmp-guest-driver/common/vsmp_version.ko] undefined!
> ERROR: modpost: "vsmp_read_reg_from_cfg" [drivers/staging/vsmp-guest-driver/common/vsmp_version.ko] undefined!
> ERROR: modpost: "sysfs_deregister_version_cb" [drivers/staging/vsmp-guest-driver/common/vsmp_common.ko] undefined!
> ERROR: modpost: "sysfs_register_version_cb" [drivers/staging/vsmp-guest-driver/common/vsmp_common.ko] undefined!
> make[1]: *** [scripts/Makefile.modpost:111: Module.symvers] Error 1
> make[1]: *** Deleting file 'Module.symvers'
> make: *** [Makefile:1370: modules] Error 2
> 
> vsmp_version.o is one file out of two in one module named common, the other one is the main entry point for the module, is it logical I need to define MODULE_LICENSE in both files?

MODULE_LICENSE has to end up once only in the resultant .ko file.  How
you make that happen is up to you.

> prior to the common module, the api module should be build but it isn't for some reason, the makefile looks like this:
> # SPDX-License-Identifier: GPL-2.0
> 
> ccflags-y += -I $(srctree)/drivers/staging/vsmp-guest-driver/include
> 
> obj-$(CONFIG_VSMP_GUEST_DRIVER) := api/vsmp_api.o
> obj-$(CONFIG_VSMP_GUEST_DRIVER_COMMON) := common/vsmp_common.o
> obj-$(CONFIG_VSMP_GUEST_DRIVER_COMMON) += common/vsmp_version.o
> obj-$(CONFIG_VSMP_GUEST_DRIVER_LOG) := vsmp_logs_handler.o
> 
> any ideas what I did wrong with the configuration?

Try not to use a subdir for files like this, it's not a good practice
and can be difficult as well.

Try to simplify all of this, it should not be complex.

But of course, without actually seeing the code, it's hard to tell
exactly what to do instead, sorry.

thanks,

greg k-h

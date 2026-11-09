Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.83
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219197;
	b=NkA/fzRX7wIX46g4Q2M3XDh1CE5QNYU/tQ5n8sGn0tL+xmGeZcM4fUES1gYhTc8lpIx1
	 fEkKa2cokLspFpOsDO+igx3OREbKIszeT+HONAu2WkDo3kEBNux61dYP1OtzkCIlU6udH
	 OOeBeQHoPGBZ2yR+2zDDMb9OtbnO8BsWMz355yns2W9zGRGUI1LN25Cfddmzns0EgMNEV
	 q9skJihAtmsFLM69vvL2LqazxICJ8p/qZTXCVL8sKCNx9/yprklM73oGU2WzRJVqsBH+L
	 f66hJXr24vx700/R4su0F68Z/ghzYfiURQwLuGkRRAEHjiyIEXVhNcUgJr86pybmP3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219197;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type;
	bh=sa0rZVJHi7ikJDIl/OZAzgIk59EhuKtQekBeFQBE0sY=;
	b=dVkh/l90Qdmu2iow1hdF4BUQKe0ZQV+e98b6UiQjEwcMm/sX0p+pK0hGnCmmcQdcSW58
	 rCqt1us5Y4AkVtcLBY6TtizTwCelXvbsgM1WnWB2aeZElL/Rua4+Arw+RDh9ih/1+tE2Z
	 qdE/zqtCH/64HHgHM+uYS3Dqt+Uq8qbQgIDibULgn5p2JDH8w/Rh9IdYPWl9phEJr8vVE
	 RIQzndIEyocOQ1I/QD8F0GoT1hS4srizNVFcPeBwaRXiuvCcYnlH+7zt3SGxKnHIaNjui
	 kaPxqOYlKuWoRJcrA9YWSo+GxzMprrXlnd6/PMKPu+2HM4rzSVzNn62iURZnAmK24Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=Ik3u33x3;
	arc=none smtp.remote-ip=192.134.164.83
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9152A606A31C;
	Mon,  9 Nov 2026 10:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9152A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=Ik3u33x3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=sa0rZVJHi7ikJDIl/OZAzgIk59EhuKtQekBeFQBE0sY=;
  b=Ik3u33x3NQKrcG7Fgk7pLXTOmhg7e0EEC6HKbZ2q2MwYLZYJxY1/sW5q
   iP2j3xf+8zdDhXcC5QKs2fucJeOxPJoFHW4+srX2k4AD+4MW1grP+64o9
   QtWuZHHG2Xzy2VDVsTTmSTKBBuF7Ih+HoqENVwkGSt/ha3RywHF3s2rbE
   k=;
X-CSE-ConnectionGUID: qUj+0+mSQJ2cA6v/YQ0CSw==
X-CSE-MsgGUID: v4+dZVPESFOAdImE+kK3PA==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,203,1787004000"; 
   d="scan'208";a="304526904"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 11:13:11 +0100
Date: Mon, 9 Nov 2026 11:13:11 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Shivani Patel <patelshivani2283@gmail.com>
cc: outreachy@lists.linux.dev, vaibhav.sr@gmail.com, mgreer@animalcreek.com, 
    johan@kernel.org, gregkh@linuxfoundation.org, 
    linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: audio_manager_module: Add newline to
 sysfs output
In-Reply-To: <20261109075242.62681-1-patelshivani2283@gmail.com>
Message-ID: <4989af5-f92c-697d-dc1e-d5439d49a4b@inria.fr>
References: <20261109075242.62681-1-patelshivani2283@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 9 Nov 2026, Shivani Patel wrote:

> The sysfs_emit() calls in the show functions for audio manager module
> attributes were missing terminating newlines. Add them to conform to
> the kernel coding style requirement that sysfs output ends with a
> newline character.

Patches on this issue have already been rejected.  Please check the
mailing list archives before sending patches.

julia

>
> Signed-off-by: Shivani Patel <patelshivani2283@gmail.com>
> ---
>  drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
> index dc90cc2d2..5737f2a32 100644
> --- a/drivers/staging/greybus/audio_manager_module.c
> +++ b/drivers/staging/greybus/audio_manager_module.c
> @@ -75,7 +75,7 @@ static void gb_audio_module_release(struct kobject *kobj)
>  static ssize_t gb_audio_module_name_show(struct gb_audio_manager_module *module,
>  					 struct gb_audio_manager_module_attribute *attr, char *buf)
>  {
> -	return sysfs_emit(buf, "%s", module->desc.name);
> +	return sysfs_emit(buf, "%s\n", module->desc.name);
>  }
>
>  static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
> @@ -84,7 +84,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
>  static ssize_t gb_audio_module_vid_show(struct gb_audio_manager_module *module,
>  					struct gb_audio_manager_module_attribute *attr, char *buf)
>  {
> -	return sysfs_emit(buf, "%d", module->desc.vid);
> +	return sysfs_emit(buf, "%d\n", module->desc.vid);
>  }
>
>  static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
> @@ -93,7 +93,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
>  static ssize_t gb_audio_module_pid_show(struct gb_audio_manager_module *module,
>  					struct gb_audio_manager_module_attribute *attr, char *buf)
>  {
> -	return sysfs_emit(buf, "%d", module->desc.pid);
> +	return sysfs_emit(buf, "%d\n", module->desc.pid);
>  }
>
>  static struct gb_audio_manager_module_attribute gb_audio_module_pid_attribute =
> @@ -103,7 +103,7 @@ static ssize_t gb_audio_module_intf_id_show(struct gb_audio_manager_module *modu
>  					    struct gb_audio_manager_module_attribute *attr,
>  					    char *buf)
>  {
> -	return sysfs_emit(buf, "%d", module->desc.intf_id);
> +	return sysfs_emit(buf, "%d\n", module->desc.intf_id);
>  }
>
>  static struct gb_audio_manager_module_attribute
> @@ -114,7 +114,7 @@ static ssize_t gb_audio_module_ip_devices_show(struct gb_audio_manager_module *m
>  					       struct gb_audio_manager_module_attribute *attr,
>  					       char *buf)
>  {
> -	return sysfs_emit(buf, "0x%X", module->desc.ip_devices);
> +	return sysfs_emit(buf, "0x%X\n", module->desc.ip_devices);
>  }
>
>  static struct gb_audio_manager_module_attribute
> @@ -125,7 +125,7 @@ static ssize_t gb_audio_module_op_devices_show(struct gb_audio_manager_module *m
>  					       struct gb_audio_manager_module_attribute *attr,
>  					       char *buf)
>  {
> -	return sysfs_emit(buf, "0x%X", module->desc.op_devices);
> +	return sysfs_emit(buf, "0x%X\n", module->desc.op_devices);
>  }
>
>  static struct gb_audio_manager_module_attribute
> --
> 2.50.1 (Apple Git-155)
>
>
>

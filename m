Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37D05C614;
	Thu, 14 Mar 2024 07:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710401970; cv=none; b=KvTwNhfh9j+SIOHXqswBsN7GNEAnr9XClUfcEFbQqk81H1J32ITWUvT0U2MvvEuQ7z0s1Bu/Awv4uKb2ehYNMUQK5FakJ+11QgoHAqS8KM+NQG/hvpm5IT5ylEuc03Alp9Zm2iTSWjUQf5BfEbQ1OboIBGxG5q/tasd1GD0yp8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710401970; c=relaxed/simple;
	bh=pnTHHt1TW382u+9+5iKCSJeq862HE4dvylrDAww2zLw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jgMq1fBR3cSAv6VMABM5eS+jn+y7R/7wEdT9G+kNoghQxVRTTsrKop75rOt4R8YSqEQHmw5YwFUifIiYp8dfllQfBI0xYZHl16HKmqeLuRTopN3Axf91epEz9lF18ytpJLdzU78004RWbwLe6RWC2oSUsrPPggyGawelGqlOrDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=jZiU/ttU; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="jZiU/ttU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=nnha1qea9vft3Z6+irMALn1pdyDOivvnlArNLW4U/VI=;
  b=jZiU/ttU1LGt8+0f3sWchKmhgdti1zFVFU2JDgTP4rk2oODyWKp/qfvh
   RejB4iqcdvW28UnBnVICna8A5c5v3xOwLOfsShcBDvOFUY6/V0jFJZGSo
   MjX2ulv8RXjPw1U2lITj7HaAbnYN3gYZLJGYECdqRmhP9tgDWPHnfLNT2
   4=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.07,124,1708383600"; 
   d="scan'208";a="156590462"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 08:39:16 +0100
Date: Thu, 14 Mar 2024 08:39:16 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Ayush Tiwari <ayushtiw0110@gmail.com>
cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com, 
    gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
    linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH v2] staging: greybus: Constify static struct kobj_type
 gb_audio_module_type
In-Reply-To: <ZfKevNRRNteRXZHT@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Message-ID: <58ef977c-9a85-c0b9-a7bb-b31f92597581@inria.fr>
References: <ZfKevNRRNteRXZHT@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Thu, 14 Mar 2024, Ayush Tiwari wrote:

> Constify static struct kobj_type gb_audio_module_type to prevent
> modification of data shared across many instances, ensuring that the
> structure's usage is consistent and predictable throughout the driver
> and allows the compiler to place it in read-only memory.

It would be helpful for the log message to include some hints about what
you have done to verify that the change is correct.

julia

>
> Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
> ---
>
> Changes in v2: incorporated changes in commit message as suggested by
> Alison
>
>  drivers/staging/greybus/audio_manager_module.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
> index 5f9dcbdbc191..4a4dfb42f50f 100644
> --- a/drivers/staging/greybus/audio_manager_module.c
> +++ b/drivers/staging/greybus/audio_manager_module.c
> @@ -144,7 +144,7 @@ static struct attribute *gb_audio_module_default_attrs[] = {
>  };
>  ATTRIBUTE_GROUPS(gb_audio_module_default);
>
> -static struct kobj_type gb_audio_module_type = {
> +static const struct kobj_type gb_audio_module_type = {
>  	.sysfs_ops = &gb_audio_module_sysfs_ops,
>  	.release = gb_audio_module_release,
>  	.default_groups = gb_audio_module_default_groups,
> --
> 2.40.1
>
>
>

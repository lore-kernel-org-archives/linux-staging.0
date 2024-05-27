Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA3D8BE2
	for <linux-staging@lists.linux.dev>; Mon, 27 May 2024 03:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716781722; cv=none; b=rsBneC+I5AbK6UrakkHKaUE+8/C/eeDIBj7r2jzwOKbJybQ5/swd2teNkGX9yfvy/CHz7Vzn/AhsxMv9eDq6O8mXqxjp1u6nDI+xQ4PqBQ9hJWFJRhzcNrX6fS3/pRbFytfB95SEly/Ubxm1+j9jkYmosRKDFoDjkgl9gW1Jqnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716781722; c=relaxed/simple;
	bh=0P5z3LuBgM9kPLTfjT9mSXM6LhXl+nL8u+EStQcpOSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uQmKoag/waQcWkDwzxCPk91nZgWP8DResLjCHTO940P1jgrjJ0j1mF3MkBH/0ML6UmtEr+WwR0meZ+M74lmf11+mf1IdgDISDu0Jn7qISyk/AITs8FW1Q0f82VMxwBVPNwQqePhoxmv1OlCIEdzZuCF70PzI4Mw2WBjPvzbXp9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DNHDpuNw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DNHDpuNw"
Received: from [192.168.81.180] (unknown [157.39.192.200])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C79528E0;
	Mon, 27 May 2024 05:48:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716781716;
	bh=0P5z3LuBgM9kPLTfjT9mSXM6LhXl+nL8u+EStQcpOSs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DNHDpuNwDT1XLa/BMUFmiL7AoY1m0J6ucwWtYH+CQJ7zZ0N9BeaNcXldxXAiJeF43
	 k3lKqhgZJzC7pcv5BZz4D+xNvGAffpLe+LXZ7v2bv7X5FIzhuWf0h87uByKMK/CRJC
	 vIoUEFIDeycyHIsLmkLavrKnilnOQ/VgkOp8xxlM=
Message-ID: <d5c1f632-0c42-40e7-8d00-ae1398e0d803@ideasonboard.com>
Date: Mon, 27 May 2024 09:18:30 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: vchiq_debugfs: Fix NPD in vchiq_dump_state
To: Stefan Wahren <wahrenst@gmx.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20240524151542.19415-1-wahrenst@gmx.net>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <20240524151542.19415-1-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefan,

Thanks for the fixup!

On 24/05/24 8:45 pm, Stefan Wahren wrote:
> The commit 42a2f6664e18 ("staging: vc04_services: Move global g_state
> to vchiq_state") falsely assumed that the debugfs entry vchiq/state
> was created with vchiq_instance as data. This causes now a NULL
> pointer derefence while trying to dump the vchiq state. So fix
> this by passing vchiq_state as data, because this is the relevant
> part here.
>
> Fixes: 42a2f6664e18 ("staging: vc04_services: Move global g_state to vchiq_state")
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

LGTM,

Reviewed-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>   .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 2 +-
>   .../vc04_services/interface/vchiq_arm/vchiq_debugfs.c     | 8 ++++----
>   .../vc04_services/interface/vchiq_arm/vchiq_debugfs.h     | 2 +-
>   3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 297af1d80b12..69daeba974f2 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -1759,7 +1759,7 @@ static int vchiq_probe(struct platform_device *pdev)
>   	if (err)
>   		goto failed_platform_init;
>
> -	vchiq_debugfs_init();
> +	vchiq_debugfs_init(&mgmt->state);
>
>   	dev_dbg(&pdev->dev, "arm: platform initialised - version %d (min %d)\n",
>   		VCHIQ_VERSION, VCHIQ_VERSION_MIN);
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
> index 54e7bf029d9a..1f74d0bb33ba 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
> @@ -42,9 +42,9 @@ static int debugfs_trace_show(struct seq_file *f, void *offset)
>
>   static int vchiq_dump_show(struct seq_file *f, void *offset)
>   {
> -	struct vchiq_instance *instance = f->private;
> +	struct vchiq_state *state = f->private;
>
> -	vchiq_dump_state(f, instance->state);
> +	vchiq_dump_state(f, state);
>
>   	return 0;
>   }
> @@ -121,12 +121,12 @@ void vchiq_debugfs_remove_instance(struct vchiq_instance *instance)
>   	debugfs_remove_recursive(node->dentry);
>   }
>
> -void vchiq_debugfs_init(void)
> +void vchiq_debugfs_init(struct vchiq_state *state)
>   {
>   	vchiq_dbg_dir = debugfs_create_dir("vchiq", NULL);
>   	vchiq_dbg_clients = debugfs_create_dir("clients", vchiq_dbg_dir);
>
> -	debugfs_create_file("state", S_IFREG | 0444, vchiq_dbg_dir, NULL,
> +	debugfs_create_file("state", S_IFREG | 0444, vchiq_dbg_dir, state,
>   			    &vchiq_dump_fops);
>   }
>
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.h
> index e9bf055a4ca9..fabffd81b1ec 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.h
> @@ -10,7 +10,7 @@ struct vchiq_debugfs_node {
>   	struct dentry *dentry;
>   };
>
> -void vchiq_debugfs_init(void);
> +void vchiq_debugfs_init(struct vchiq_state *state);
>
>   void vchiq_debugfs_deinit(void);
>
> --
> 2.34.1
>


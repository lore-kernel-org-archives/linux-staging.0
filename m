Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770FD21E091;
	Sat, 28 Mar 2026 06:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774677751; cv=none; b=SnffJrwwdedTnT7RKi8kKJ4TzslzDQayUfCMWjmnx5tUk3eKLRCOiuTG+IGNuHN9t0mXy/ZwNpNSE7O//f4vxQ9s2ynS90YMVf9AYW+QWJjEZyRCzNLXP0GWShgnFPueVtaIKoDEtPZi0/yMMspRw2x+7hmVFZYYCOGzThmfUiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774677751; c=relaxed/simple;
	bh=CtXmSgzwsODD2OV1neFpuoIpgKVd9hrini9i7/cP8mA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4mswaqoGf8bbwEkCb+06V2rhVCR5sn7aYCYR+c+p8OZoFjl9/HQNzOS4GGlaowsZrwOh8xBfhRh1u74ernAqbhk9mM39p0wxRLcbGk4WhsG8m71v0GPqGBf0PTkkXdbucfReQJ0g/sZarJmuiy8+HG6LlBX01A7+FP/b28DfNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gyP9A0jw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gyP9A0jw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F917C4CEF7;
	Sat, 28 Mar 2026 06:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774677751;
	bh=CtXmSgzwsODD2OV1neFpuoIpgKVd9hrini9i7/cP8mA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gyP9A0jwT8vf8JIUZtEiFSr9+pRh5SJtVZJLkks96OwWySDNwVFSCA6GDlvGADIaJ
	 wzYn3avxf0HuMvco9NVz0DQuK5Ji8BDNtAwXxMC0Qm+t3+VIOzWEPgOQ+TKDuloIAA
	 eGe2LoSAiG1dxrqH51RVxgf/GVoB8a/sipRvPORk=
Date: Sat, 28 Mar 2026 07:02:27 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Shivam Gupta <shivgupta751157@gmail.com>
Cc: johan@kernel.org, elder@kernel.org, vaibhav.sr@gmail.com,
	mgreer@animalcreek.com, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio_manager: Add missing newline to
 sysfs_emit outputs
Message-ID: <2026032850-riverbed-distant-f96b@gregkh>
References: <20260328044527.10489-1-shivgupta751157@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328044527.10489-1-shivgupta751157@gmail.com>

On Sat, Mar 28, 2026 at 10:15:27AM +0530, Shivam Gupta wrote:
> sysfs_emit outputs in audio_manager_module.c do not include a terminating
> newline, which is required for proper sysfs formatting.
> 
> Add newline characters to all sysfs_emit format strings.
> 
> Signed-off-by: Shivam Gupta <shivgupta751157@gmail.com>

You just changed the user/kernel api here, are you _sure_ it is ok to do
so?  What tools just broke or were used to test this?  What tool asked
you to make this change?

thanks,

greg k-h

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532FB329C79
	for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 12:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763382805; cv=none; b=YwXWLHrnIaoQxLOedZ67ZeJ3RMH7d0YWtnczHGJ3EGXyNpBgsRiS72IEilgwvINJNqSDf79NIh3p3vWfhHAaTepdjAl+3+5T4w+AYK+b8iybDiJ4iAZPHGZu5WkbAfP7vtNG/kMh07A1BeTAdWRCLOwe0Agj0v0Lyo0YpddaYoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763382805; c=relaxed/simple;
	bh=gYCBn1KE6BBmJnCrBauL9Eq9EEei93TQ1lw2gCaB2I4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gCyDBkFokhzsK6KlEMBAtkP6ixEXjHQiMhTW9uJnM7gm6p0xl4+k7dJQ08L+DLwl6BY51xDRrr25A2I8UUSI/JwKUWT/q8faPSBzomIw2Gg7Z0x6ENxRQg/G6EGNgY5DvGqARm2o3FplNyHpIPX9ejRE4AJOti4NX2FOeFwfwMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iHiWmoRK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iHiWmoRK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 522E6C113D0;
	Mon, 17 Nov 2025 12:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763382804;
	bh=gYCBn1KE6BBmJnCrBauL9Eq9EEei93TQ1lw2gCaB2I4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iHiWmoRKR9YhO4u7Wr7OSVUrmdTc72c/x//sxxdSDspj7dfapHzKO6HwzGFc49uTS
	 cQHdQCHDeo9DU2XuwQIjCtTgvhQBif34W3gmAD4aw70hKw3FXbbVNaDoH8QWip+ap/
	 EX8h2dj0NZx0fx2Q0//sSA4z0Y4CvMm/xVSYkjIs=
Date: Mon, 17 Nov 2025 07:33:21 -0500
From: Greg KH <gregkh@linuxfoundation.org>
To: Dharanitharan R <dharanitharan725@gmail.com>
Cc: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: replace strncpy() with strlcpy() in
 firmware test tool
Message-ID: <2025111706-glacial-lantern-337e@gregkh>
References: <20251117065003.7453-1-dharanitharan725@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117065003.7453-1-dharanitharan725@gmail.com>

On Mon, Nov 17, 2025 at 06:50:03AM +0000, Dharanitharan R wrote:
> The sample userspace firmware-management tool uses strncpy() to copy
> firmware tags. strncpy() does not guarantee null-termination and can
> leave buffers unterminated. For userspace code, strlcpy() is the
> recommended safe alternative.
> 
> Replace all strncpy() calls with strlcpy().
> 
> Signed-off-by: Dharanitharan <dharanitharan725@gmail.com>
> ---
>  .../greybus/Documentation/firmware/firmware.c      | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/drivers/staging/greybus/Documentation/firmware/firmware.c
> index 3b35ef6d4adb..224eb8f4e39c 100644
> --- a/drivers/staging/greybus/Documentation/firmware/firmware.c
> +++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
> @@ -63,8 +63,9 @@ static int update_intf_firmware(int fd)
>  	intf_load.major = 0;
>  	intf_load.minor = 0;
>  
> -	strncpy((char *)&intf_load.firmware_tag, firmware_tag,
> -		GB_FIRMWARE_U_TAG_MAX_SIZE);
> +    strlcpy(intf_load.firmware_tag, firmware_tag,
> +       GB_FIRMWARE_U_TAG_MAX_SIZE);
> +

What happened to the indentation?

:(


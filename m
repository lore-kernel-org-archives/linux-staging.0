Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CA4AD5E;
	Sun, 29 Dec 2024 10:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735468281; cv=none; b=oK0tUq0iXBEzCWuU2jH0LyybBY/QryjtL3LQMWoFUYQFxOTF9Vo1svAfen8KbZJuYydMxbltqmuwxzoCOXIcUj6qj70O4xe8/97Q1wQ3X/3kc7OFL2phz2gIBsyTkQ3R7LB9Xmb5ccDgDtsbbBMDatTt9Y21OQMyx0VpEX63ev8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735468281; c=relaxed/simple;
	bh=qio6Xaff+SQhFhUt/0l/Nl/CUWxaRBEonUhYd406FvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=POWRQkK5fIygcg+FhFG+M1ahNCHN8v20BGTbeADUoTx2qqDVs0YYiDlLZaPWhy/zcqgWfJ3FF7z2/KOiYrYZkbn2gKhdGWnzzYcHErw5o9bBXIEake0bh5yM4WdrNaXEIDciHUDHuGsu4NRiBxg9WD/pByd/WhbwbIPVGzBX2bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=autuNIuy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="autuNIuy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E051CC4CED1;
	Sun, 29 Dec 2024 10:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735468281;
	bh=qio6Xaff+SQhFhUt/0l/Nl/CUWxaRBEonUhYd406FvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=autuNIuy5AuZTs6UytAoJFTTCrEcOJY1sUktSKrztHXIMEAh9XsBpShGoOkMQzhsl
	 6wHiBaiBPg1g3qDC3naB7Xy8wNu+eCU80S5m2Swrsd1ihmi2ftUh0wLUC/UzDpcXp+
	 PXKfEASu8zIfOWSrB0OtNMJwvjl8S1FTrT95EMpw=
Date: Sun, 29 Dec 2024 11:30:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nihar Chaithanya <niharchaithanya@gmail.com>
Cc: dpenkler@gmail.com, dan.carpenter@linaro.org, skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 01/15] staging: gpib: Modify gpib_register_driver() to
 return error if it fails
Message-ID: <2024122940-irritate-bloated-12de@gregkh>
References: <20241228060800.107653-1-niharchaithanya@gmail.com>
 <20241228060800.107653-2-niharchaithanya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241228060800.107653-2-niharchaithanya@gmail.com>

On Sat, Dec 28, 2024 at 11:37:49AM +0530, Nihar Chaithanya wrote:
> The function gpib_register_driver() can fail if kmalloc() fails,
> but it doesn't return any error if that happens.
> 
> Modify the function to return error i.e int. Return the appropriate
> error code if it fails.

You forgot to mention that you removed the pr_info() line.

thanks,

greg k-h

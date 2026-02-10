Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E47A27A904;
	Tue, 10 Feb 2026 15:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770738067; cv=none; b=ghEgxua24GWOmtF2TYv5nD9gu/czdwktIwomqGilYRn0PH/7Vtu/yctLQ9eLaKs53QuvsH4xVuYGtch6mN4irhoUxmg3dg7ba7yQrKTY7eXSlWvSdsdIbEtncgIwtzFfz+4YO0f76zQc+9l+QQbZpClYUbkgVR1nJY9mdyMJlqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770738067; c=relaxed/simple;
	bh=4tU7wJd/IsNaIy/SWTtnLWLs0YM3ZkZeiLcAJ9uONZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iO4pSw7Lf0/sS8pGlFlRdOIjnT8FtysMFrgqU7xvkkRCX7JH6cvT0A9CPY8gLw/S57cZA5ve+lONFFj6bBPHGT86vkQOyAREQlV4S2eKpNuOAtKFyoImYHlbtzLOJ4bVnFcIpbeBa+jCEGEqMW1sGBeFY4lrSdbbLyFNDOb6/lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CeC71cWa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CeC71cWa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9717C19424;
	Tue, 10 Feb 2026 15:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770738067;
	bh=4tU7wJd/IsNaIy/SWTtnLWLs0YM3ZkZeiLcAJ9uONZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CeC71cWa+pfCFoavFRDSOb4Ww10zRNpYmwF4/WrlGRX1l3T9PbVPET7zzgbfeLyWp
	 D0bhXfLS2z6HpBM0+CIx6iwPQ7q4bhaDXgh+tEkmUCpaTzRNfwup8FCc87jtkMf1kD
	 9eGFyMnb3GkMYnnzq5KcfDSu5/mJ5VqvmcFQRsm0=
Date: Tue, 10 Feb 2026 16:41:04 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dharanitharan R <dharanitharan725@gmail.com>
Cc: trohan2000@gmail.com, bqn9090@gmail.com, straube.linux@gmail.com,
	hansg@kernel.org, abrahamadekunle50@gmail.com,
	davidzalman.101@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: use block-scoped loop variable in
 rtw_ap.c
Message-ID: <2026021036-collar-simile-0815@gregkh>
References: <20260210152812.15637-2-dharanitharan725@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210152812.15637-2-dharanitharan725@gmail.com>

On Tue, Feb 10, 2026 at 03:28:13PM +0000, Dharanitharan R wrote:
> Convert the loop iterator to a block-scoped declaration
> using C99-style for-loop initialization.

No need for this to be changed at this point in time, just do that for
new code please.  What tool said that this should be changed?

thanks,

greg k-h

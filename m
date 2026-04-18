Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17198347503;
	Sat, 18 Apr 2026 07:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776497074; cv=none; b=knFBEkz1w1q1VqD4+NN49UePXUdJtYoNZxeTkp6itkZ8qKjk7SzeCnfp5Wvna4MDz3sCTeOoNG8zJKTzaF2UpCs9Ob4DAR7Ewv8yY/y/nqrQYi3ipLYTX4Fs0txwTAR2VbfDc5X/Zqb8yfoQXjGm0hBtUnO7BLPl/GNqiss0LT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776497074; c=relaxed/simple;
	bh=gsVtB8IFMQv84XXqIbZAj5Qy5glcjwnHB4NntCJMGOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ApqlAIHct9euoCaZZB++aNX5nn/YdKjd5HjwktFBVLVJkAaLsRmO2eMOvhIeHCVt2KGVyHF55X0rVApvVARn4R6/0Ii+Aa/43VKG9DSYIuPRChilycNZa7RMlTiyoMRlOLtvoTs7i9DBDcrLO1d0YjGpiF8HedtcY2RaowgtVKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ENpuShOV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ENpuShOV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C7F9C19424;
	Sat, 18 Apr 2026 07:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776497073;
	bh=gsVtB8IFMQv84XXqIbZAj5Qy5glcjwnHB4NntCJMGOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ENpuShOVpNILKVe5XyM13JS9+LSrggSgUtoWrBUpxi4QipLJrKWTETGaVND+EqCjh
	 FIseXZGiSIt3yNNCQnQPdsx4ocGme7OxRUXenlaOSbhlA//VF4UNeO53qAij4cbEEc
	 al5CBbJP1ZIqWVlpG7q/2eZNM7+3287HK7tcjhUQ=
Date: Sat, 18 Apr 2026 09:24:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: osdevhari@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: remove trailing whitespace in
 rtw_xmit.c
Message-ID: <2026041841-prowling-reflex-a7b5@gregkh>
References: <CA+TGEkHXoCfY0RhmKFnfLrnPO+dKwKXAnGu84RNsNcE0=MaGAQ@mail.gmail.com>
 <6C4D65F4-8955-4B96-87A3-3FB25F5743EE@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6C4D65F4-8955-4B96-87A3-3FB25F5743EE@linux.dev>

On Sat, Apr 18, 2026 at 09:10:47AM +0200, Luka Gejak wrote:
> Hi Osdevhari,
> Let's start from the top of the email. Firstly attachments are not 
> allowed, only plaintext. Secondly Signed-off-by tag must use your real
> name(Firstname Lastname <email>. Thirdly, you should setup git 
> send-email and use it to send patches. Now let's take a look at actual
> code:

Again, Luka, please take a break from reviews.  I would recommend
getting some more experience in the developer workflow before doing
this, as it can be a bit confusing for new developers coming in to see
stuff like this.

And again, please do not use AI for reviews, we have that already, and
there is a big reason I do not let it loose on the staging list because
it is not yet ready for it.

thanks,

greg k-h

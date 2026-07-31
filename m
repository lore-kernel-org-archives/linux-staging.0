Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00B535C6A7;
	Fri, 31 Jul 2026 05:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785476477; cv=none; b=SCE/pSkF08MSbjicpIekCiQIFdhvPz5we2k5wbRMElLWaxWhWZUY9MvH3Un77BStm5BfUKBGpzqZUaMCAHoxsu/Ro3I2Kr0yyej2DixmR02Nm5R4ZFgaOCTTt53HF/95JUBfFE3cYg06D8DwuKpiZoL9WiPd8MFivKF6ExuM9OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785476477; c=relaxed/simple;
	bh=MwVmUFvB2IsHlAp3QKV53MilDwTStiF+IOgbqUBBfT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ng5PZgXvhxeKJiMQ9IvuiBZc93obCFxXTC8xWdNHk0qugTUBMbYl5iXbvKGhb5HedaWSQdVEz8tY+TRfHofsI5XcIUfQSMUfZvnvCMW90VCBJ4+0I4Lvw0oQQHbTWh+MPOVrWldqN1Jo0IrhKzc4ImG4IZviKt3B/HZqR4Bs9N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YM/NuU+8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YM/NuU+8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F1CB1F000E9;
	Fri, 31 Jul 2026 05:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785476476;
	bh=bbwMV3vwKG31ynz9/MINUUL0rJKlA038BsSPhUgq9LA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YM/NuU+8p9nrMdLNMgA2eJa97kX4F5b48uMSim71REYj3kYNdS6VZZGgUKSu4TWhj
	 mNJbvwO1HzxSOSNvqZD8KCPuPv9ewBEGUJFzo7MtjY3v0FryeqshgBLb55aYO04+aS
	 nW2XgX97ZKWTF+NR9ZLfEcmZiz62N1Uja6/zZ2bM=
Date: Fri, 31 Jul 2026 07:41:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: ceohunk@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rts5208: ms.c: replace udelay with usleep_range
Message-ID: <2026073146-jokester-come-d879@gregkh>
References: <6a6c2bbb.1c32ac96.11d8fd.8074@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a6c2bbb.1c32ac96.11d8fd.8074@mx.google.com>

On Thu, Jul 30, 2026 at 09:59:39PM -0700, ceohunk@gmail.com wrote:
> >>From 055881758fb68c22dc85a11add9e929f8506bbec Mon Sep 17 00:00:00 2001
> From: ChengYuhong <ceohunk@gmail.com>
> Date: Fri, 31 Jul 2026 12:00:54 +0800
> Subject: [PATCH] staging: rts5208: ms.c: replace udelay with usleep_range
> 
> Signed-off-by: ChengYuhong <ceohunk@gmail.com>
> ---
>  drivers/staging/rts5208/ms.c | 4311 ++++++++++++++++++++++++++++++++++

Odd, you are adding a whole new file here, are you sure you made this
patch correctly?

Also, this was sent twice, with no changelog text, and the above in the
body, is that intentional?  Perhaps go through the "write your first
patch" tutorial on kernelnewbies.org or use a tool like b4 to send your
patch?

thanks,

greg k-h

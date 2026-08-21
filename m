Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8419A29E0E5;
	Fri, 21 Aug 2026 04:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787285985; cv=none; b=dMVC29ixlcBN8eZviBMVwJn295slQ4l0dIfegxM4ClTGnJDCcf78cBxJgj92wkyLMzaK3PUyOv86T/wVSBQAgCnKd+JH4kaP4kRijd9C5FIpn48ow9YgLD/wK5ZfY8dWUBF5DpTOJMQj76PY2cVEK0QLcYo1mN1c2RWWqKutptU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787285985; c=relaxed/simple;
	bh=TeBR6kJQwpHmmIvYyYZ8kaE1EMd8dt3O0Oh016ccm64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lp2bayfwvgQ+xLul8WusReDYsdqbOI+eY9yayLxVcucNNjEM+kfWCUGU/Tg7wE1n1rlVjqot8DOeECEFUcORbpQrt2Hvc+saCyMlgm8VUlZB0fAeUpcVuW21OvCcvL0TA/Xe6jwejtjWhq79NMrvhOp7w4NKlskw9QsR6zTKn0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lK0KCYNA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lK0KCYNA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 720671F000E9;
	Fri, 21 Aug 2026 04:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787285984;
	bh=tZunS/PFothihucylLZUd9+UQpMRsEojs2ZRNNjEPsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lK0KCYNAjQ+23KEglq0jXxy9mvyPp7w182HSfSdOUbJkrZ/Jzuj72BjCD05y3Iv/A
	 BvcwqpREc5EdeNXBHJT5bCbwGaIuta2nQDtFyuHeFaksCud5p/W1mMFwcb++9tMw8B
	 38vw5GNTJYGvxrv3hd9/5wPMhbQ6wvBz6fAWBAug=
Date: Fri, 21 Aug 2026 06:18:05 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Kaden Vaughn <randomfnp@outlook.com>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: fixed formatting issues in
 rtw_security.c
Message-ID: <2026082149-area-area-f9d5@gregkh>
References: <PH7PR10MB66522A228CCAA372A4F0820FBFA32@PH7PR10MB6652.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH7PR10MB66522A228CCAA372A4F0820FBFA32@PH7PR10MB6652.namprd10.prod.outlook.com>

On Fri, Aug 21, 2026 at 03:15:50AM +0000, Kaden Vaughn wrote:
> Hi Greg, this is my first contribution to the Linux kernel!
> I tried using git but it wouldn't let me send the email so im doing it through the outlook GUI.

That didn't work :(

Please use git to send this, as we can't take attachments.  There are
lots of tutorials online for how to get git send-email to work.


> From a150421dcc8da80d9fc2a93be3e96db5e7e8c758 Mon Sep 17 00:00:00 2001
> From: Kaden Vaughn <randomfnp@outlook.com>
> Date: Thu, 20 Aug 2026 22:41:27 -0400
> Subject: [PATCH] From: Kaden Vaughn <randomfnp@outlook.com>
> 
> Subject: [PATCH] staging: rtl8723bs: fixed formatting issues in rtw_security.c
> 
> Signed-off-by: Kaden Vaughn <randomfnp@outlook.com>

No changelog text?

And this isn't a diff, it's just a whole new file :(

>  drivers/staging/rtl8723bs/core/rtw_security.c | 1539 +++++++++++++++++
>  1 file changed, 1539 insertions(+)
>  create mode 100644 drivers/staging/rtl8723bs/core/rtw_security.c

So something went wrong with your commit.

good luck!

greg k-h

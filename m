Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F87072
	for <linux-staging@lists.linux.dev>; Sun, 13 Jun 2021 12:34:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B9E96120E;
	Sun, 13 Jun 2021 12:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1623587660;
	bh=Uo6KONhUM11rl9mF6xj85ye4nwHE9oZO9QBwRDhb8p4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u9JyDikhxDstULDFDS0ugvs71ttab4Nqo2saxD5cWbYp65d48E5YVyZ2vr1w3m2T3
	 yEoic68Qzhb9u2+8hhI4YoPs5SOkkmXmHBhI5vbJx0aR24TZDVdoCfJbqNevWyvu7Y
	 eM6oX2KiYQErdnlSgjs2JuLL0FfHuBM9VRPN4210=
Date: Sun, 13 Jun 2021 14:34:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jhih-Ming Huang <fbihjmeric@gmail.com>
Cc: fabioaiuto83@gmail.com, ross.schm.dev@gmail.com, maqianga@uniontech.com,
	marcocesati@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rtw_security: fix cast to restricted __le32
Message-ID: <YMX7SRSPgvMA/Pw1@kroah.com>
References: <20210613122858.1433252-1-fbihjmeric@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210613122858.1433252-1-fbihjmeric@gmail.com>

On Sun, Jun 13, 2021 at 08:28:58PM +0800, Jhih-Ming Huang wrote:
> This patch fixes the sparse warning of fix cast to restricted __le32.
> 
> Last month, there was a change for replacing private CRC-32 routines with
> in-kernel ones.
> In that patch, we replaced getcrc32 with crc32_le in calling le32_to_cpu.
> le32_to_cpu accepts __le32 type as arg, but crc32_le returns unsigned int.
> That how it introduced the sparse warning.

As crc32_le returns a u32 which is in native-endian format, how can you
cast it to le32?  Why do you cast it to le32?  Isn't that going to be
incorrect for big endian systems?

thanks,

greg k-h

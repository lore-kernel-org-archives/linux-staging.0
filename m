Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3A77C
	for <linux-staging@lists.linux.dev>; Wed, 15 Feb 2023 02:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ADE3C433D2;
	Wed, 15 Feb 2023 02:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676428889;
	bh=wWD/OfXPqNsPHWvTUEODuneuyI/n26v4Hg5Tl/XoJIs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MeoNHJbCnBzJAwmp8++AYNciPQtge44PnNvboq2u03dqtl8Pbea9nmB9UoZfUKmoa
	 2xy+l7EdKgZJBB5gICf0hgxKgEjhlEDpOZEoxwhLIZtft3Km9aiCq8ZmnPxkX2dUUG
	 aqbCHCFN/MzLXC4y9qVSOhEvuONi3nMtPAKDzY+kxPWTfBbHco31yzk/+7Q22mo1fR
	 uxKHF06G/OeOEPyON2xEEnK36cE1H5+EkPYnXrSJ1AehtroRk6cFf/+BgGQdSYeIr/
	 ncAl8qrd01snNrUyXOX8Otacurtg7myguV35By98hKh2af9znpOCOSAE4ldB0u2lmU
	 fWGM3DNWQRaiQ==
Date: Tue, 14 Feb 2023 18:41:28 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: mchehab@kernel.org
Cc: netdev@vger.kernel.org, hverkuil@xs4all.nl, gregkh@linuxfoundation.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: drop unnecessary networking includes
Message-ID: <20230214184128.45cabcf8@kernel.org>
In-Reply-To: <20230203233129.3413367-1-kuba@kernel.org>
References: <20230203233129.3413367-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  3 Feb 2023 15:31:29 -0800 Jakub Kicinski wrote:
> dvb_net.h includes a bunch of core networking headers which increases
> the number of objects rebuilt when we touch them. They are unnecessary
> for the header itself and only one driver has an indirect dependency.
> 
> tveeprom.h includes if_packet to gain access to ETH_ALEN. This
> is a bit of an overkill because if_packet.h pulls in skbuff.h.
> The definition of ETH_ALEN is in the uAPI header, which is
> very rarely touched, so switch to including that.
> 
> This results in roughly 250 fewer objects built when skbuff.h
> is touched (6028 -> 5788).
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Hi Mauro! Could you take this in for 6.3?
Is it okay if we queue it via the networking tree otherwise?

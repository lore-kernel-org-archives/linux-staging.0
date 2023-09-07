Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF110C8C7
	for <linux-staging@lists.linux.dev>; Thu,  7 Sep 2023 14:43:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54C3DC32796;
	Thu,  7 Sep 2023 14:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1694097836;
	bh=dDjV8SeoGYBfPPQVmgOlnn/0boD8+0AVtqtuPLpORLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=digxMZdAvqJOGdBqkmYwy0J3MJL9/PkXTCeZj87cOcKTvwGb+KXjqUKmHL50EgScT
	 uPsIQVL/SbBqkPqs9Ss7AwZSa7PGZX36al1NzOy6ap0/q/gJODNDNx+7AjRey+cYB2
	 MPXTehhBGSu4uPlA5+UBwnrZ1idLegjRompPgPqE=
Date: Thu, 7 Sep 2023 15:43:53 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pavan Bobba <opensource206@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>,
	Michael Straube <straube.linux@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: vt6655: Type encoding info dropped from
 array name "byVT3253B0_"
Message-ID: <2023090724-trial-ipod-93d2@gregkh>
References: <ZPnLw+njcL/D391S@ubuntu.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZPnLw+njcL/D391S@ubuntu.myguest.virtualbox.org>

On Thu, Sep 07, 2023 at 06:40:27PM +0530, Pavan Bobba wrote:
> Below array names updated as per coding guidelines:
> 
>    1.byVT3253B0_AGC4_RFMD2959
>    2.byVT3253B0_AIROHA2230
>    3.byVT3253B0_UW2451
>    4.byVT3253B0_AGC
> 
>    Conversions performed:
>    a.type encoding info dropped from names
>    b.names replaced by snakecase
> 
>    Issue found by checkpatch
> 
> Signed-off-by: Pavan Bobba <opensource206@gmail.com>
> ---
>  v1 -> v2: Name of the tool added in the body of explanation,
>            which found this issue
> 
>  v2 -> v3: subject modified to more specific detail

Any specific reason you are not sending this to the maintainer that can
take it?

Also, your changelog needs work, please read the link the bot referred
you to.

thanks,

greg k-h

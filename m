Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD231E9F6;
	Tue,  1 Nov 2022 18:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2A42C433D6;
	Tue,  1 Nov 2022 18:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667326851;
	bh=/Z8SIuoKFu10X29ldMMaee847d8Lg9sBDgx1jCyVmAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Iy8rVSN34Mc3N/EFUGZxRd67bMKZtDjyDx9/YsGPsLq35D54/8bgtPke+No0NR0mz
	 5wFufKsElm5BdzwcExNJuoRqfrkExUdGRp67Dg/L20evnOgS9sTMQX2P0V6xq/ImMK
	 /E0YILFT+g+6BIIV8HaDQFk18tez6PU2Pl6n4YX0=
Date: Tue, 1 Nov 2022 19:21:44 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v2 0/2] some checkpatch fixes in the file rxtx.c
Message-ID: <Y2FjuHeVzY5VYG97@kroah.com>
References: <cover.1667305446.git.tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1667305446.git.tanjubrunostar0@gmail.com>

On Tue, Nov 01, 2022 at 12:37:58PM +0000, Tanjuate Brunostar wrote:
> These fixes are focused on the function s_vFillRTSHead
> 
> v2: changed confusing changelog messages
> 
> Tanjuate Brunostar (2):
>   change the function name s_vFillRTSHead
>   Join some lines of code to avoid code lines ending in (
> 
>  drivers/staging/vt6655/rxtx.c | 48 ++++++++++++++++-------------------
>  1 file changed, 22 insertions(+), 26 deletions(-)

Please look at your subject lines you are using here, and look at the
mailing list for previous patch submissions, and at the git log for this
file, and fix them up to have the proper prefixes on them.

As is, I can't take these.

thanks,

greg k-h

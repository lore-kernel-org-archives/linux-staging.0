Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A497C;
	Wed,  2 Nov 2022 07:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC45FC433D6;
	Wed,  2 Nov 2022 07:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667373586;
	bh=DHrUljguS7CAH73syCaZFep+k5XKR1AQvaMZzp/XqzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c6sgbVUli2pqvWAxGBu9KggqvplAolJEFxL70QiMGKRkBJ1hgzzmC8FrO3A78Be1n
	 000/FH5hvO1fr2Ea39a7FzIQOxdQ1UndpxEvULB940abYM5xbaf0yTv767e3QwiRxW
	 IIhiPzOLaiouzfHPs5dbSrwoByk4KjRJs4+mNThU=
Date: Wed, 2 Nov 2022 08:20:39 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v3 0/2] staging: vt6655: some checkpatch fixes in the
 file rxtx.c
Message-ID: <Y2IaR0jqcaXq2UIA@kroah.com>
References: <cover.1667326000.git.tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1667326000.git.tanjubrunostar0@gmail.com>

On Tue, Nov 01, 2022 at 06:17:47PM +0000, Tanjuate Brunostar wrote:
> These fixes are focused on the function s_vFillRTSHead
> 
> v3: changed the function name from fill_rts_head to fill_rts_header as
> head is conventionally used in lists
> 
> v2: changed confusing changelog messages
> 
> Tanjuate Brunostar (2):
>   staging: vt6655: change the function name s_vFillRTSHead
>   staging: vt6655: Join some lines of code to avoid code lines ending in
>     (

Neither of these changes apply to my tree.  Please rebase against the
staging-next branch of the staging.git tree and resend a new version.

thanks,

greg k-h

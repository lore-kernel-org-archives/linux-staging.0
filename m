Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51D829A0;
	Tue,  5 Apr 2022 13:46:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EDF1C385A0;
	Tue,  5 Apr 2022 13:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649166413;
	bh=pAirV066m2Mk+Gq9JHNPQKz4ZdQFBmx7aDmrA3JqHZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kldms96GddMs7OjzLMMO6ih82ytSwJcXHcStrjbrMsbg8HssmGCTXFRBWa4cgC6+L
	 Tg1OxlJBlSK+FkbKC5Jq5GQBlGRVGA07ftRe+osjG6RILregfrNyTQ0tLhKhfRiJdQ
	 i9XFvXJQGTCC7KSdxso/OGukUuDtHscXAhEADDUI=
Date: Tue, 5 Apr 2022 15:46:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
Cc: outreachy@lists.linux.dev, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: r8188eu: add space around arithmatic sign
Message-ID: <YkxIS2H0XX6LzDzu@kroah.com>
References: <860d8e222e2b695ce5cb4f48aa46a7f66e05d8e4.1649082939.git.eng.alaamohamedsoliman.am@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <860d8e222e2b695ce5cb4f48aa46a7f66e05d8e4.1649082939.git.eng.alaamohamedsoliman.am@gmail.com>

On Mon, Apr 04, 2022 at 04:39:16PM +0200, Alaa Mohamed wrote:
> Reported by checkpatch:
> 
> CHECK: spaces preferred around that '+' , '-' and '*'
> 
> Signed-off-by: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_br_ext.c | 58 +++++++++++------------
>  1 file changed, 29 insertions(+), 29 deletions(-)

This patch does not apply to my tree and branch.  Please rebase and
resend it against the staging-next branch of staging.git.

Patch 2/2 did apply.

thanks,

greg k-h

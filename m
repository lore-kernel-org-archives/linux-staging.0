Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B309B7F
	for <linux-staging@lists.linux.dev>; Tue, 22 Aug 2023 13:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C35C433C9;
	Tue, 22 Aug 2023 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1692712210;
	bh=mG6DXlXlMRPptfmTnxoYooQNKEhtfzz0atYYStvqRB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YnpCwjuhNzcnP1gJuJEANGaPW8k2JZeXA6x5JfL+BafuNNupg0nhqvnTFr6d28zZD
	 3ErRk2mRknR8Tmil02SGqVVx4U6LFCRd+tD4n75o3WC0wm+rRdaVp1UBxj9DYyeX4E
	 tnV4umEySVSuVBky5FPelj9aWtGdn77scfoiksm0=
Date: Tue, 22 Aug 2023 15:50:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tree Davies <tdavies@darkphysics.net>
Cc: philipp.g.hortmann@gmail.com, anjan@momi.ca,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/16] Staging: rtl8192e: Rename variable pRxTs in
 function rx_ts_delete_ba()
Message-ID: <2023082245-undergrad-sly-4f27@gregkh>
References: <20230820004744.278022-1-tdavies@darkphysics.net>
 <20230820004744.278022-2-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230820004744.278022-2-tdavies@darkphysics.net>

On Sat, Aug 19, 2023 at 05:47:29PM -0700, Tree Davies wrote:
> Rename variable pRxTs in function rx_ts_delete_ba() to ts
> to fix checkpatch warning Avoid CamelCase.
> 
> Signed-off-by: Tree Davies <tdavies@darkphysics.net>
> ---
> v3:Resend as 16 patch series - no longer throttled by email provider, fix commit msg
> v2:Resending in smaller patch series
>  drivers/staging/rtl8192e/rtl819x_BAProc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
> index 0e3372868f97..da29163f3022 100644
> --- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
> @@ -41,9 +41,9 @@ static u8 tx_ts_delete_ba(struct rtllib_device *ieee, struct tx_ts_record *pTxTs
>  	return bSendDELBA;
>  }

This patch series is named very strange.  Some commits have "v3", some
have "v2" and some none at all.

A patchset itself is versioned, I can't keep track of which commit in
the series is newer than which, sorry.  What would you do if you saw
this email thread in your inbox to review?  :)

Can you resend the whole thing, as a v4 series, with the Tested-by tag
added to the patches?

thanks,

greg k-h

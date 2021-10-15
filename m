Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716FB72
	for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 11:20:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E13360EFF;
	Fri, 15 Oct 2021 11:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1634296827;
	bh=2W8IGoWcN4dnWhDN155etd5POsGBKisgo5d/iujmmAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qcLpHUygt2XOZZ6T820MfK+BnyZQsLnaJMeo65TId0P320j7bFtOVFA/lPiRwN//k
	 vCZwCC48swOSmKkYldE+uOv2I3Tnwh8ZHTXutRs8STV1TSxMD6SEl9AKLZlWv7eagq
	 Nl6JNzF1nrdXys3bLEw4Vk4HI1iKSC1Ne4zThSps=
Date: Fri, 15 Oct 2021 13:20:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Karolina Drobnik <karolinadrobnik@gmail.com>
Cc: outreachy-kernel@googlegroups.com, forest@alittletooquiet.net,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: vt6655: Rename byPreambleType field
Message-ID: <YWlj9x6kwYUT1jlQ@kroah.com>
References: <20211015102444.90753-1-karolinadrobnik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015102444.90753-1-karolinadrobnik@gmail.com>

On Fri, Oct 15, 2021 at 11:24:44AM +0100, Karolina Drobnik wrote:
> Drop Hungarian notation prefix in `byPreambleType` member of
> struct vnt_private. Change it to use snake case. Update
> comment for `bb_get_frame_time` to reflect that change.
> 
> Fix issue detected by checkpatch.pl:
>   CHECK: Avoid CamelCase: <byPreambleType>
> 
> Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
> ---
>  drivers/staging/vt6655/baseband.c    |  8 ++---
>  drivers/staging/vt6655/baseband.h    |  2 +-
>  drivers/staging/vt6655/device.h      |  2 +-
>  drivers/staging/vt6655/device_main.c |  8 ++---
>  drivers/staging/vt6655/rxtx.c        | 50 ++++++++++++++--------------
>  5 files changed, 35 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
> index 0bae35af6e0f..7a5f186f2598 100644
> --- a/drivers/staging/vt6655/baseband.c
> +++ b/drivers/staging/vt6655/baseband.c
> @@ -1691,7 +1691,7 @@ static const unsigned short awc_frame_time[MAX_RATE] = {
>   *
>   * Parameters:
>   *  In:
> - *      by_preamble_type  - Preamble Type
> + *      preamble_type     - Preamble Type

This is not part of a structure.

>   *      by_pkt_type        - PK_TYPE_11A, PK_TYPE_11B, PK_TYPE_11GB, PK_TYPE_11GA
>   *      cb_frame_length   - Baseband Type
>   *      tx_rate           - Tx Rate
> @@ -1700,7 +1700,7 @@ static const unsigned short awc_frame_time[MAX_RATE] = {
>   * Return Value: FrameTime
>   *
>   */
> -unsigned int bb_get_frame_time(unsigned char by_preamble_type,
> +unsigned int bb_get_frame_time(unsigned char preamble_type,

Neither is this :(

Do not do multiple different things in the same commit and especially
when you do not describe them in the changelog text.

thanks,

greg k-h

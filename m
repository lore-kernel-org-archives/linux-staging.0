Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D483C9880;
	Wed, 15 Jul 2026 08:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784103250; cv=none; b=gPJ7x4YWmA99p3okD5WOYLrpaWUzZKyHsx5IpgdFiJ5VBm/jIkpuVhMHirX7bjWuct2oV7CN6rh6uIajkMPYebDOrAdGLny8OQJrJA9W3y4E7yQmOkyKqvPxVJVfXWQL2mLifh+3k/TNmUYmf7MX3jNmnA0APHoCnPmqEVgnXt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784103250; c=relaxed/simple;
	bh=qQ/xVvLJGYrrm7Z0qUSCTnS7ZyFLoa4WxXZQTCPmQ7U=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=F+sCo6FNwD5ldIM1Okj9hsmQrVm/Zv7BiJu9l5QMNP/VOJ6uTRPEePmv0Mh5ZGJ1iiKQMBVvGHgmhCPrlXfV2YuVtftGuMi7xTGxtlVPSmVSn7htiFu37Ta/1x8Bkbh6QUhAa1jTiRFh5peI1KrBFkyTXkW12jWnn/DPT4eKjac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PwZEzPm/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PwZEzPm/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268431F000E9;
	Wed, 15 Jul 2026 08:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784103248;
	bh=rMmHpW/WUR/bosNEJKxuvYuEM+okoRuwMkzlwbtjFlU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=PwZEzPm/9U/BTRwZkwCz8QyeS/Pzz42AjXaA2ykrifnw7Z2FiZorbfFAxg5khWk7N
	 5GWIqv4y3MN8wGeyAaA7qCEQ68jjfNfdQDDS5w7rf75qwvuyL/DVXsTpaCdDPWZF20
	 Jpw7Hurcain+v28pDAjOeyXMobNnQqhIkpEyk9oeltJv3OuXoCWBYkOVzeVcTKg9Mm
	 Tz0RP+Pu7Y7xjW3NpqhS4dG76lK2uXinlUhMfWrmSycEop/8V7v5uDqcnyB3DOyynL
	 gpyzq9WmieVR36IaFAl8bMb3Bb4rzUsWoqnUIirwf24KyLg9ClgXrTonieLeiDQUzd
	 5YI9jvs84JG2g==
Message-ID: <4a9b9842-8d51-4ddc-9b24-b69440091345@kernel.org>
Date: Wed, 15 Jul 2026 10:14:05 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: av7110: refactor deeply nested PTS loops
To: =?UTF-8?Q?Andr=C3=A9_Moreira?= <andrem.33333@gmail.com>,
 mchehab@kernel.org, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260620054654.122464-1-andrem.33333@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260620054654.122464-1-andrem.33333@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/06/2026 07:46, André Moreira wrote:
> Extract the deeply nested loops handling PTS flags in the MPEG-1
> block into a separate helper function `av7110_ipack_m1_pts()`.
> 
> This fixes a checkpatch warning regarding too many leading tabs and
> improves code readability without changing the underlying parser logic.
> 
> Signed-off-by: André Moreira <andrem.33333@gmail.com>
> ---
>  drivers/staging/media/av7110/av7110_ipack.c | 35 +++++++++++----------
>  1 file changed, 18 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/staging/media/av7110/av7110_ipack.c b/drivers/staging/media/av7110/av7110_ipack.c
> index 4be6e225f08e8..a3e69a737e97d 100644
> --- a/drivers/staging/media/av7110/av7110_ipack.c
> +++ b/drivers/staging/media/av7110/av7110_ipack.c
> @@ -136,6 +136,22 @@ static void write_ipack(struct ipack *p, const u8 *data, int count)
>  	}
>  }
>  
> +static int av7110_ipack_m1_pts(struct ipack *p, const u8 *buf,
> +			       int c, int count, int max_which)
> +{
> +	while (c < count && p->which < max_which) {
> +		if (p->which < 7)
> +			p->pts[p->which - 2] = buf[c];
> +
> +		write_ipack(p, buf + c, 1);
> +		c++;
> +		p->found++;
> +		p->which++;
> +		p->hlength++;
> +	}
> +	return c;
> +}
> +
>  int av7110_ipack_instant_repack(const u8 *buf, int count, struct ipack *p)
>  {
>  	int l;
> @@ -335,26 +351,11 @@ int av7110_ipack_instant_repack(const u8 *buf, int count, struct ipack *p)
>  				return count;
>  			if (p->which > 2) {
>  				if ((p->flag2 & PTS_DTS_FLAGS) == PTS_ONLY) {
> -					while (c < count && p->which < 7) {
> -						p->pts[p->which - 2] = buf[c];
> -						write_ipack(p, buf + c, 1);
> -						c++;
> -						p->found++;
> -						p->which++;
> -						p->hlength++;
> -					}
> +					c = av7110_ipack_m1_pts(p, buf, c, count, 7);
>  					if (c == count)
>  						return count;
>  				} else if ((p->flag2 & PTS_DTS_FLAGS) == PTS_DTS) {
> -					while (c < count && p->which < 12) {
> -						if (p->which < 7)
> -							p->pts[p->which - 2] = buf[c];
> -						write_ipack(p, buf + c, 1);
> -						c++;
> -						p->found++;
> -						p->which++;
> -						p->hlength++;
> -					}
> +					c = av7110_ipack_m1_pts(p, buf, c, count, 12);
>  					if (c == count)
>  						return count;
>  				}

Hmm, I think I'll just keep the code as-is. Creating a separate function for this makes
the repack function actually harder to understand.

Regards,

	Hans

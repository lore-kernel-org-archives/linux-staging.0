Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34228289836
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 07:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752651383; cv=none; b=NABGIVp7GpBN0FwcgLxoXgQ/ZCk+ZmYhPoPOD548gSuteGjh3Rl8KDkQQhJhAO99KYVSOoZDF9JipPSZM3S61jhvfLiTrzVQNQL1Y/xC4vOsxoJS6QWekSkppeC7oAUsmzf5VzsHCrDhQ8t9DEFJebHjea9/e1/H+10eZrLDoGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752651383; c=relaxed/simple;
	bh=Q2A/TOyp99N6KgU4vNvUVAZcubwb1x0fF/yEHSzNz3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWRqx5sJv/0auz8crgO+YbpbIcqBk4T4jysH81EltB80gmUeauGuTCaQ618ejLG3VGwBjn2kh13D71fgqVeSw9POI9DpjucUOwmA7qJuzW2btoz625OcoZLQ+Tn6MtmdFLBJcB9nNCD+gu1Uj4AGM15uzMadCQsdmqNVKTx7lpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1LgXxtei; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1LgXxtei"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78811C4CEF0;
	Wed, 16 Jul 2025 07:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752651382;
	bh=Q2A/TOyp99N6KgU4vNvUVAZcubwb1x0fF/yEHSzNz3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1LgXxteiy2yZFEIZQUXPBnBH/kNZL8Zqb4fLmplN82EpqAsALi9ow8IWEn3PfTLmM
	 mQnZsvBLJUx2cXU7jYA4RPu0/T/qBs3hcQJ71KctOUnrKME2lOpJiBZTRbfylLBswL
	 ICXuxx0I7m+/ukKfQMgheDBX6/E+f6FDTpXyqnqM=
Date: Wed, 16 Jul 2025 09:36:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ignacio =?iso-8859-1?Q?Pe=F1a?= <ignacio.pena87@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/3] staging: rtl8723bs: fix block comment end markers
Message-ID: <2025071643-reunion-escalator-5f6b@gregkh>
References: <20250716053604.64798-1-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250716053604.64798-1-ignacio.pena87@gmail.com>

On Wed, Jul 16, 2025 at 01:36:02AM -0400, Ignacio Peña wrote:
> From: Ignacio Pena <ignacio.pena87@gmail.com>
> 
> Fix checkpatch warnings about block comment style by moving the
> closing comment marker '*/' to a separate line.
> 
> Signed-off-by: Ignacio Pena <ignacio.pena87@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_efuse.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> index 7a74b011d..1e2b3c456 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> @@ -70,7 +70,8 @@ Efuse_Write1ByteToFakeContent(u16 Offset, u8 Value)
>   * When                        Who             Remark
>   * 11/17/2008  MHC             Create Version 0.
>   *
> - *---------------------------------------------------------------------------*/
> + *---------------------------------------------------------------------------

This line can now just be removed, right?

Same for all of these long "------" comment lines, they aren't needed as
this isn't the kernel coding style.

thanks,

greg k-h

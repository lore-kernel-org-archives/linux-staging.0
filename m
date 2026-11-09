Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.83
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234076;
	b=M+wQzpNDbC562FUCCpUGdHzODSPhEFi9rtZKA5aQD3wFsNCLkqwN/TYhht54aF65Tf8e
	 GN/JJ+FJ5hkswrfJYYeunF54edNjLTUzjancxpPIV/OjggXoVA2MqFWPb1SKER6JEQAog
	 xa7rU+U7MzT7FXAvZIdoAFvGg/MCanSWLd68YtF6x7WF3ShKkxZ/OKSYNn+96zHrLV74c
	 fYYlYssHHjB8SZwYqVJ/pf4FY9Ejgw9u9n4T8IA4ytMI3NlXiFNLedk3LqHBlI5C7djeB
	 VfYohEQuHeI26/JjpkMOYMOCTcSol32r/Q05xKJCDLda4B1j0mdpKIEVhn31RYLyDig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234076;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type;
	bh=NNQc4AZF/LOIBNx2K85deaaBLDBCMdMGjAS1ywWnU7w=;
	b=KsdiPZCxRwixNdxkmLLIOBAboKUKe3dAMreWH4qH32GWuBmLEfxLdwH8kHia9d7SwalE
	 SBwu7tVKoGcNHrTh78mB5X8+LCkBUhpGSfDV6hJlMob/QmpZX1ngjn+XPK2UNPiymuwQu
	 C/hXmkX23ZrLRnT9MmM+FxKvQJZFVkm5lce/NmW91g4SshaHLap7e+5ZpbcvPyvOm7zJL
	 7pLoRFnpYUClrPSO8LzJTAUtvaS7PkZBK97f1wAbTwy8DH/EedBbjIrbxhEL0vSTQDdsd
	 v+dxgEp+ZeFofiKgA3OvqQUSv8WlKV+ZNeMoe1eX1bdmlBQLywcrwIPuGEnnfaNVecA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b="O/lH5k+V";
	arc=none smtp.remote-ip=192.134.164.83
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDB1606A321;
	Mon,  9 Nov 2026 14:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EDB1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=O/lH5k+V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=NNQc4AZF/LOIBNx2K85deaaBLDBCMdMGjAS1ywWnU7w=;
  b=O/lH5k+VUVlZQwONhSgPDSiyFD/i2B0rVGBD7EWDyli31fC6kK4vSeUh
   g/IKenfltNbFs9KPk88cbPfWLXbprdd4aLQ9CAqex8ws/AujfXtg6jz4G
   roHBWB7Wvdp5EVn5rB8gEgtAe3vL8HkO999NHo8qDmv3U1OjZ8nqV6y3P
   I=;
X-CSE-ConnectionGUID: B7hJjYGQS3q6NVmBi67wHQ==
X-CSE-MsgGUID: 7YknnplXTiaHyH4b32XI2A==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,203,1787004000"; 
   d="scan'208";a="304586840"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 15:21:11 +0100
Date: Mon, 9 Nov 2026 15:21:11 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Shivani Patel <patelshivani2283@gmail.com>
cc: outreachy@lists.linux.dev, Andy Shevchenko <andy@kernel.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org, 
    linux-fbdev@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix spelling mistake "writte" ->
 "written"
In-Reply-To: <20261109133731.66016-1-patelshivani2283@gmail.com>
Message-ID: <e235fcb8-c0fd-1e63-eddf-41efd70c7c4@inria.fr>
References: <20261109133731.66016-1-patelshivani2283@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 9 Nov 2026, Shivani Patel wrote:

> Correct spelling mistake in comment ("writte" -> "written").
>
> Signed-off-by: Shivani Patel <patelshivani2283@gmail.com>

Someone else has already submitted that patch.  Please check the mailing
list archive before submitting patches.

julia

> ---
>  drivers/staging/fbtft/fb_st7789v.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/fbtft/fb_st7789v.c b/drivers/staging/fbtft/fb_st7789v.c
> index 861a15414..c4db681eb 100644
> --- a/drivers/staging/fbtft/fb_st7789v.c
> +++ b/drivers/staging/fbtft/fb_st7789v.c
> @@ -221,7 +221,7 @@ static int init_display(struct fbtft_par *par)
>   * write_vmem() - write data to display.
>   * @par: FBTFT parameter object.
>   * @offset: offset from screen_buffer.
> - * @len: the length of data to be writte.
> + * @len: the length of data to be written.
>   *
>   * Return: 0 on success, or a negative error code otherwise.
>   */
> --
> 2.50.1 (Apple Git-155)
>
>
>

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222093D88FA
	for <linux-staging@lists.linux.dev>; Tue,  7 Jul 2026 10:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419200; cv=none; b=mi48qCWPcuoq0xtgxjI4PbxcSG8N8eQoqSTNy7X9UAzDeGVJbU7Ap7+0hOgi3evZXJpLGlCvn7ih4CPzfGd69/v7B63OS6FE48E060SeJxouY2e7Z93UhidYVlFG5G9JfUR5oJLB3A7qL48HAlcWg1V3iodKirZoSnwqz49sbao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419200; c=relaxed/simple;
	bh=SNqQzMADUQHzAwu4ImQX8S4EXtUDeQgaQ2u3ifIf5Lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mizH5T609bpNGSwZYKlO5XLAKb08XVYdsCIgf2hfPuFWq69Wv0j6ZdNuriDcPtg8aCOpCcGyEz9UzzYXgBMxP7MiqeQBzPRxmjtSOuyJQkK0sUKRbIYJxBm4piCE1jQRX/nKa/qUPeeNdNb/WHffXpogXQ5bYSMn4LHlvaY8ZtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dKuBd49H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dKuBd49H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4FF1F000E9;
	Tue,  7 Jul 2026 10:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783419198;
	bh=67hjfNrIQ1qTTraJjKa0QP/1ki4Vo1A8WTm/TRttazk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dKuBd49Hb9khydQ7aufBYaaYdmXz1d6rZ/jgB90z/Ix0kLXbcu0C+kjAIWKKiLwbi
	 7iBoBpnTq8Ca88fXLlq3Ifc7SxZT2OIOZxCwb57dwuNtFg9KYEcxAYNmAbX8+Q7U+J
	 wakkoJRrPGDErhDLAhhtu3/Y2b0b5hIpKMph84yw=
Date: Tue, 7 Jul 2026 12:13:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Moksh Panicker <mokshpanicker.7@gmail.com>
Cc: linux-staging@lists.linux.dev, dan.carpenter@linaro.org
Subject: Re: [PATCH v6 1/2] staging: rtl8723bs: reformat
 rtw_efuse_read_1_byte() signature
Message-ID: <2026070711-trapezoid-attest-d8d8@gregkh>
References: <20260522125022.29700-1-mokshpanicker.7@gmail.com>
 <20260522125022.29700-2-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522125022.29700-2-mokshpanicker.7@gmail.com>

On Fri, May 22, 2026 at 12:50:21PM +0000, Moksh Panicker wrote:
> Reformat multi-line function signature to a single line to fix
> line length and coding style warnings from checkpatch.pl.
> 
> Also fix the missing brace/comment spacing in rtw_efuse_read_1_byte().
> 
> Note: CamelCase identifiers (Adapter, Address) are pre-existing
> in this function and not introduced by this patch.
> 
> Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_efuse.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> index 803a608b74fa..ab7486020b3f 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> @@ -41,10 +41,7 @@ rtw_efuse_calculate_word_counts(u8 word_en)
>   * 09/23/2008	MHC		Copy from WMAC.
>   *
>   */
> -u8
> -rtw_efuse_read_1_byte(
> -struct adapter *Adapter,
> -u16		Address)
> +u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u16 Address)
>  {
>  	u8 Bytetemp = {0x00};
>  	u8 temp = {0x00};
> @@ -76,9 +73,9 @@ u16		Address)
>  				break;
>  		}
>  		return rtw_read8(Adapter, EFUSE_CTRL);
> -	} else
> +	} else {
>  		return 0xFF;
> -
> +	}
>  } /* rtw_efuse_read_1_byte */
>  
>  /*  11/16/2008 MH Read one byte from real Efuse. */
> -- 
> 2.34.1
> 

Does not apply to the tree :(

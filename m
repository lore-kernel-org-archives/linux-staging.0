Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D6C2E2DF2;
	Tue, 10 Feb 2026 16:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770741302; cv=none; b=kzAStwTOEWzKWe5FKxtfevCDQnC7HDXlQBiqOor26xuzhBaF333S8gqe7l5T5E4nuX+bKBqtmDH9it1BRoLwKDJ4NtjDiJJQiM+o7DRfsNbzajpyYTyQMtusSohuE4AXZoUH3zPoD0oFr4G2OWEzbes3EL2E+ErEfokxJTW3htA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770741302; c=relaxed/simple;
	bh=k/E4wYRUk8fxLeEnAdfKABs3yvj/R6FCrxmfkZgMe6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T0fhR5AgbSoRks/rTGeXOGtsaMpHRaOUhEDeomM244Rb7vozCocE6KNk/AJojStimLfR5LuBcCceg9X9YP4ke0ig4wTI1ZQdiovb8b1Zl4+idgMqAEMOD5NX7Bbm3Py/40csBdQs0KDcPWM5zAAKnCR/Y/KYqoeee0M66Z8MQwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qEER14uV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qEER14uV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7E7C116C6;
	Tue, 10 Feb 2026 16:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770741302;
	bh=k/E4wYRUk8fxLeEnAdfKABs3yvj/R6FCrxmfkZgMe6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qEER14uVVYqngaDufuuAMtu4fIFgMq/dDv/+vBo/MNVtkQ57TeFKrb7972ciMoDaE
	 Vy0ipa6J2Sh7AQNNzEeqUAHs3dKIPtNYdEUgc46r1r9Mu7YJUrC+lWvMvAb423IqPM
	 GZFS44UJaK/7v1HysvxX+3v2uIdRN4CT1BMoP48c=
Date: Tue, 10 Feb 2026 17:34:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Haroen Tmimi <tmimiharoen@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove redundant 'Adapter' variable
 in HalPhyRf_8723B
Message-ID: <2026021031-dosage-outplayed-6d36@gregkh>
References: <20260210163236.46341-1-tmimiharoen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210163236.46341-1-tmimiharoen@gmail.com>

On Tue, Feb 10, 2026 at 05:32:36PM +0100, Haroen Tmimi wrote:
> The variable Adapter was declared and initialized locally in
> an if-statement, but it shadowed a variable of the same name and
> value declared in the function scope (line 169).
> 
> Removing the inner declaration allows the code to use the existing
> outer variable, resolving a -Wshadow warning.
> 
> Signed-off-by: Haroen Tmimi <tmimiharoen@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> index 9df3274c1048..f712d0345b99 100644
> --- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> +++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> @@ -208,7 +208,6 @@ void ODM_TxPwrTrackSetPwr_8723B(
>  	}
>  
>  	if (Method == TXAGC) {
> -		struct adapter *Adapter = pDM_Odm->Adapter;
>  
>  		pDM_Odm->Remnant_OFDMSwingIdx[RFPath] = pDM_Odm->Absolute_OFDMSwingIdx[RFPath];
>  
> -- 
> 2.53.0
> 

And now you have another coding style warning :(

Please be more careful when doing code cleanups so as to not add
additional problems.

thanks,

greg k-h

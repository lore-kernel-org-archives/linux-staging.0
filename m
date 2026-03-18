Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EF330E821;
	Wed, 18 Mar 2026 15:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773848230; cv=none; b=Y+8mjQkg7znr5ul2CkiZbhbV9+HhKhyjTpyY7vXmidGr0ETO1mzx8UZDu2FkewOk1SHEuznJFclJNLMhQ1Bf8R8VMhiTNyGun1Uqu+NFoJUPrXtYejSA/GmnEotjF0qoBcl4VJgOqPK037fbTsajQQTMGD0M1bhEEP5XFeDHi28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773848230; c=relaxed/simple;
	bh=IJMD+lo4p/9qKh979vlA7ntgtE1gCEzTf2YOI9TDsPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQ/UjKAYexV18hkC1gplWiTzMgoFZZR575juoCrgFNLN25psQCw/JNIFbcD2BvDbIPzt99psZFMMuJz/jBwa1T2Kj8lbnfnQqHAihNnwk0H+wmSCuasdm38uwz3Pt4u5kBVTGNWkCqJ5ZsGymE8vk2Ffie+bcrl3vfeOKAEbAtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kKm+cm8/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kKm+cm8/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8384C19421;
	Wed, 18 Mar 2026 15:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773848229;
	bh=IJMD+lo4p/9qKh979vlA7ntgtE1gCEzTf2YOI9TDsPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kKm+cm8/KdG72O8PIcDXzHISETNKYtda6u82AjuzeM6AkVFNouHxgsMvtiNDmztpM
	 eumhx2AEhxdoF0gUkQRiE4fiDhK+HlFpPVdRrmrgItrAGne1y7bbHtKuRm746Z18g7
	 VOvXEkSTGJpT3cGER/YHwtIAZ37WVmFp1hXJK3dw=
Date: Wed, 18 Mar 2026 16:37:04 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Bera =?iso-8859-1?B?Wfx6bPw=?= <b9788213@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	ethantidmore06@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: Remove dead code
Message-ID: <2026031851-elephant-unnamed-7e95@gregkh>
References: <20260312125337.1050-2-b9788213@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260312125337.1050-2-b9788213@gmail.com>

On Thu, Mar 12, 2026 at 03:53:38PM +0300, Bera Yüzlü wrote:
> Clean up the dm_odm_t structure by removing commented-out members and
> related legacy comments.
> 
> Signed-off-by: Bera Yüzlü <b9788213@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/odm.h | 33 -----------------------------
>  1 file changed, 33 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
> index 38830552d..d77763d28 100644
> --- a/drivers/staging/rtl8723bs/hal/odm.h
> +++ b/drivers/staging/rtl8723bs/hal/odm.h
> @@ -650,10 +650,6 @@ struct ant_detected_info {
>  /*  2011/09/22 MH Copy from SD4 defined structure. We use to support PHY DM integration. */
>  /*  */
>  struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
> -	/* struct timer_list	FastAntTrainingTimer; */
> -	/*  */
> -	/* 	Add for different team use temporarily */
> -	/*  */
>  	struct adapter *Adapter;		/*  For CE/NIC team */
>  	/*  WHen you use Adapter or priv pointer, you must make sure the pointer is ready. */
>  	bool odm_ready;
> @@ -673,17 +669,6 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
>  	u8 ControlChannel;
>  /*  ODM HANDLE, DRIVER NEEDS NOT TO HOOK------ */
>  
> -/* REMOVED COMMON INFO---------- */
> -	/* u8 		PseudoMacPhyMode; */
> -	/* bool			*BTCoexist; */
> -	/* bool			PseudoBtCoexist; */
> -	/* u8 		OPMode; */
> -	/* bool			bAPMode; */
> -	/* bool			bClientMode; */
> -	/* bool			bAdHocMode; */
> -	/* bool			bSlaveOfDMSP; */
> -/* REMOVED COMMON INFO---------- */
> -
>  /* 1  COMMON INFORMATION */
>  
>  	/*  */
> @@ -871,13 +856,6 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
>  	struct odm_mac_status_info *pMacInfo;
>  	/* MAC_INFO_88E		MacInfo; */
>  
> -	/*  Different Team independent structure?? */
> -
> -	/*  */
> -	/* TX_RTP_CMN		TX_retrpo; */
> -	/* TX_RTP_88E		TX_retrpo; */
> -	/* TX_RTP_8195		TX_retrpo; */
> -
>  	/*  */
>  	/* ODM Structure */
>  	/*  */
> @@ -901,17 +879,6 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
>  	/*  ================================================== */
>  	/*  */
>  
> -	/* common */

This line should not have been removed, right?

thanks,

greg k-h

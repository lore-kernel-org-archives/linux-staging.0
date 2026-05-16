Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC843405C26
	for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 10:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778927253; cv=none; b=J44K1svhQ/9h1+acW88nib+AQir0jaCCg5AmvP/RWU+IJbyzRdMJt3SOpTbPFZL/I/fhKJ54KJB/AxY4res/8qZYk1q2h5hmb0KomVx5Tdp7TNp71HnnGIM8ewoxeuWPQKeCx0QEiuO6GzW1BTObtjpXCOvjAjAxJfrWj/+Mko0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778927253; c=relaxed/simple;
	bh=s5pt6Wy7xvru8ZpciyxIMG02PiAVrwpDwaXrmSYugzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+oZQYqpHtS4qbAesIma//cT6vx4G3Bf1LURJv8PHkJ51lqYmeH7wfQ3o63KT6+/EojdEemZ+lQVr9FAAIMpnLoKgV6arR0YA6wuekF4AUhPiWzt/vXvQn9NVteYtobzl4XKFpKOcI1NYN9LU45pvFsPXxTpwsRkZeMPyq3psRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mf3LHlxj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mf3LHlxj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 154D0C19425;
	Sat, 16 May 2026 10:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778927253;
	bh=s5pt6Wy7xvru8ZpciyxIMG02PiAVrwpDwaXrmSYugzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mf3LHlxjYS5fFKEJNB1HJZj5Gv9M2q5z3l5a09eOAMsFA2RFnSqxsEFSxVo05ZS2e
	 E47xv8Nx5AAjJdN8uRTU68e1ST7nVR/hUnPruJHbVFMCAjC/Pw6kHYpZzkFxaCprGn
	 vaIb867fOoE+MPR4UeqE6aTA5+gV4MuQ83quqArs=
Date: Sat, 16 May 2026 12:27:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Moksh Panicker <mokshpanicker.7@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/4] staging: rtl8723bs: reformat rtw_efuse_read_1_byte()
 signature
Message-ID: <2026051631-nemesis-dinner-26a1@gregkh>
References: <20260516095103.12727-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516095103.12727-1-mokshpanicker.7@gmail.com>

On Sat, May 16, 2026 at 09:51:01AM +0000, Moksh Panicker wrote:
> Reformat multi-line function signature to a single line to fix
> line length and coding style warnings from checkpatch.pl.
> 
> Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_efuse.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> index 803a608b74fa..987d05816c5c 100644
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
> -- 
> 2.34.1
> 
> 

I only see 3 patches here :(

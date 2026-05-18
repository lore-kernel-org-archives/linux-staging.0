Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C08347505
	for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 18:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779129838; cv=none; b=aMdlj8N0Rwwep2R+WSKKAs5Kyq8v59nhoetRhOLApih69kIYXCBX/lUhBMaBN32s0S6LPr561tXcVD26OUMcEty8UxGiHwqDCwsxCu45mUntDAxFOQcOhSRByAypcuNwr5WMijWPMoSfe0e42p8+zNFaaFK/Nuf+oiXeLOPp/Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779129838; c=relaxed/simple;
	bh=Gj0fn+vQnPPQX8doCJU3EKW4+OSVRmLkhUK/Isb5FfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lahFiR7RfS/dBuYyB5WfS4SfjXsJ4EmX1IkFFuY2HWwJHT8d3NlGqzDIpTO+yzK/kwWoLC3zw+TT4dHYrlY6EB9MIHEWcBThVLyVSdRBZoKivgrFsINjzFPTQaLGgfiMKpnki0KcBkrQsSU/rXNYHhFpUoAKc8AzEXF8tdxfuI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b6jNTGhF; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6jNTGhF"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so29179225e9.0
        for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 11:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779129835; x=1779734635; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KrlZdolc+mDYauAn34biE+PFfmqw2yJ47nv9GlHQg9g=;
        b=b6jNTGhFFXpV2jpIRk9syK2QvLHO4ry3jEBodQbPbr9IVkinxGfjkuWVSccRCar8qm
         YqSOkPHTisxNGX1hKZye2aYMpiCyKMnflijSsOWhzA1ysZgGxWNvcA3Edd1dYUPXezTA
         tZ1BD4+Xctqq+9TItfr+//sanTCzfRT6PEWVpzuFlHDqwscGkZ51LBK4nr/C2943LC3e
         trmDrblPzQHJIEjFU3znUqsdADZlZ+Qnmjf/qn9XP9+emYEzFYrqHN0RwrpbHyW5T84N
         /3ZhQFzccXtu2rG5wJL2M3WpJHHAZWRUmg/USaghkrH7j3n0wcojDdjwg7zdswq2G16Q
         rWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779129835; x=1779734635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KrlZdolc+mDYauAn34biE+PFfmqw2yJ47nv9GlHQg9g=;
        b=rIT2reYIRm+YP5QdvADD5YP9EPbtuQAIEwgVrct4LXsh+yHg+wHq15OtVaO8cCWnyi
         6naAh6cWdku5V7Mdk5/u256Cnhcjq139+0HrmwGjEarUZ96ictHRM3BjYC6va+tz9QJT
         X5S7lkhvATb9NO39aioyHEFI0/gat4PZMv9aBXLXoy8jok2uxJV8DXXJtljVHByV+m7p
         aclfZAixVtv0VMIcyuBpSVoA7BGeNVRMz9vyycy2JAxx/MqfJMKpi/qcDC785vPONt18
         4MzXbXUWog4QjNNfvvQD1yQ7cDmj0xLJWVxCenRwLgOom+unOjLjMNZFarTJkw6uWekQ
         UW+g==
X-Gm-Message-State: AOJu0YwzH6JzP/TuGL589QIoENLx9T4j94WIpdCXeSbFFLNLU+hJ5Xtg
	L+W+nR+5z97wedd9bbxrPeMgrOl9rFE5KCrD6QLG6bwMRE6Zb+vfugqo
X-Gm-Gg: Acq92OEWFAfJE1C0WJvqkdrCwZI9z9nzLSO0I4QVPCkm+Vby6N+jEJYf17fzj5MZIIo
	RWpXw683cfLEKv2yvv4YIanuowugfsnC/2zn4FAfPmfMN3gXrDDBzBQLJUBH4pILSOKHLU2EK3+
	4oF4Lj5atenFqpxn3W+HPp6QZDvrtQwy+2zlARnSRuA4os3wmU8iodcvn/xSlufb+Iz4QH45+WS
	Sc/psM8SjEGQtPjUs3AUY3KeIKvDsW2jwlM2IADa82TBqXFC/hkmd+JwU6PiP+WAu4gcj6c9tCq
	nJhQcKPGkqjri/ap4oGnQOM3CMTXz0svyLkhfo6105Dey5f73qgXaAkrW3ktjMetx8vtLdytSSf
	7sqDYCXt58oQomlwgflAVbGW6v7gyRyaRJKOPwtmTt+JP3binbLvcyaGadXLlYF+Tv1mpbsYREw
	/Qwq1AyuXTyE/Gft9BF3I=
X-Received: by 2002:a05:600c:a293:b0:48f:e6de:1cc6 with SMTP id 5b1f17b1804b1-48fe6de1e03mr159442225e9.32.1779129834944;
        Mon, 18 May 2026 11:43:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feab2896bsm91191885e9.4.2026.05.18.11.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 11:43:54 -0700 (PDT)
Date: Mon, 18 May 2026 21:43:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: Moksh Panicker <mokshpanicker.7@gmail.com>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Subject: Re: [PATCH v5 1/3] staging: rtl8723bs: reformat
 rtw_efuse_read_1_byte() signature
Message-ID: <agtd5tvK58iY6ot1@stanley.mountain>
References: <20260518180641.44421-1-mokshpanicker.7@gmail.com>
 <20260518180641.44421-2-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518180641.44421-2-mokshpanicker.7@gmail.com>

On Mon, May 18, 2026 at 06:06:39PM +0000, Moksh Panicker wrote:
> Reformat multi-line function signature to a single line to fix
> line length and coding style warnings from checkpatch.pl.
> 
> Also fix the missing brace/comment spacing in rtw_efuse_read_1_byte().
> 
> Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_efuse.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> index 803a608b74fa..afece04c09cd 100644
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
> @@ -78,7 +75,7 @@ u16		Address)
>  		return rtw_read8(Adapter, EFUSE_CTRL);
>  	} else
>  		return 0xFF;
> -
> +	}

No.  You're not compile testing your patches.  This is the fifth version
and you're still breaking the build.  Take a break and come back in a
few days or something.

regards,
dan carpenter


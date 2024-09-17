Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12424152176
	for <linux-staging@lists.linux.dev>; Tue, 17 Sep 2024 20:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726603523; cv=none; b=r70SEKtX7zBTfaQsq2pHW3eqmwTvYYCtqDuwRCGywV9w34G/3ETy36M72hhl6w1iMwVuvL7xNa9cQBxT8XH04tMR7pFVS1c8iqhkqF8Zn5OiOyHE/no59ckgVppv6ujladoC+q06/S8O8s3N5tQooF4dFrEsODubwZhDX4NCaMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726603523; c=relaxed/simple;
	bh=SfodZ/rtM2jhxXtzGw81B5mYu4eTU4CKiUf1fOOsm7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MrXVRdsYJlloiQcG/C2tOBK5j03xPKE11uwjS7iRElC3UINX4nnZNxMYLTtc8+3ffQpQzZSPpaXjl6WUWaBq1s8ihpJ8XEgQduhmgS2pbSscpwSd9pPQRffGD2rC04pxe16C7Jb3RCpXtosin4lZImAf1Gsd30/vIG+dLHKJ7Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSeSmfEY; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSeSmfEY"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-535be093a43so7502876e87.3
        for <linux-staging@lists.linux.dev>; Tue, 17 Sep 2024 13:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726603518; x=1727208318; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+BAqZEURXqmfkfN7P6xqojM68KIepLhSNWCqaR0uo9I=;
        b=SSeSmfEYa1FCwz0zhq4pZBAf9b80eESdc9b3ZpT8oMZcpSvvWVLD14CScyfyElLBQ1
         wZChgtFb8StJOE3p6j175Qh0wN5GdT2QSLZrD9dGfxuF020mxq2tUKRaX36QHRIfVi5h
         JBiNo8zYEHC+ssaZGcNn+ptAGJVX9ftE4K8w2PC2FVHT6AW1xxeaQnz+NpBuz1bEFhRK
         kEKFiKfQyqJE7yGqO/JvUDVbFqotJR1HiVk44b7ZiTG/lVeF+Qjvos2ml6s1pXnFMPsa
         5+T38uGFGA39grwYAqs2TZKl+bI9qIa8RTxByRWJyoWAZaWKvbF422by4ny9TcSlH44Z
         1+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726603518; x=1727208318;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BAqZEURXqmfkfN7P6xqojM68KIepLhSNWCqaR0uo9I=;
        b=RNgE8bQn4kPrG3SVypxacj4b8IPzowCevNRWbNmya1cD+k5dIJlSF55tpQ4oDlGihr
         bp8eZAY6FwsG+VMqVxt3j7rKA7UXfoETiR995oocY9uhaYYYg1eurJfinMdOsK9BoNFp
         wYBZKybBQeHkNm4xbl5QrAYuFcxwu3euhesLLqv0fEfup6axf5W0mi4MQ4x3aNT5mGA4
         kIydWJEnrJQf4oHWMJ8yhbxNGEceKmsOryVec04gHlIpmEMuIVm+Gy3T+X20nOMW1gFX
         Jgf1mxbfh7ppwhSu7cVk9OZjAGG8jDFkCF4AYak3PdWz5e5WnRkJfufWPeMEYu4Ikr24
         7WAQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/iZilImW3yg3zyybvW/n87mnOggybsdgUgdnwelnoE6zDtXwDcicjW4iiOzFTLGMuI1+A1Hvy1tsMdXU0@lists.linux.dev
X-Gm-Message-State: AOJu0Yxk7Nf+/PVA8MSqlW9vY1iC1uV6fUySbol05GNzlfSjQb8Ywigr
	+gbTuYjo5Xa2eIIKiIYelQlFWSfKsZ0Jamm9nQ7rvZID1x9yNATg
X-Google-Smtp-Source: AGHT+IGMIxuzqNUJOUvGmb59uVLTBMVAOejxcAU/dsF1JxJY/nZGiZtZ/Vngc3Cz2bCT6Kw24apbGg==
X-Received: by 2002:a05:6512:ac8:b0:52c:c032:538d with SMTP id 2adb3069b0e04-53678fc857bmr9707003e87.27.1726603517664;
        Tue, 17 Sep 2024 13:05:17 -0700 (PDT)
Received: from kernel-710 (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610f4358sm484154466b.71.2024.09.17.13.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 13:05:17 -0700 (PDT)
Date: Tue, 17 Sep 2024 22:05:15 +0200
From: philipp hortmann <philipp.g.hortmann@gmail.com>
To: Tree Davies <tdavies@darkphysics.net>
Cc: gregkh@linuxfoundation.org, anjan@momi.ca,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/18] Staging: rtl8192e: 18 more Style guide variable
 renames
Message-ID: <Zung-0ClV_527-_e@kernel-710>
References: <20240917053152.575553-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917053152.575553-1-tdavies@darkphysics.net>

On Mon, Sep 16, 2024 at 10:31:34PM -0700, Tree Davies wrote:
> This series fixes camelCase variable names
> Thank you to all reviewers.
> ~Tree
> 
> Tree Davies (18):
>   Staging: rtl8192e: Rename variable nDataRate
>   Staging: rtl8192e: Rename variable bIsCCK
>   Staging: rtl8192e: Rename variable bCRC
>   Staging: rtl8192e: Rename variable pMCSRateSet
>   Staging: rtl8192e: Rename variable PreCommonCmd
>   Staging: rtl8192e: Rename variable PostCommonCmd
>   Staging: rtl8192e: Rename variable RxDataNum
>   Staging: rtl8192e: Rename variable FwRWRF
>   Staging: rtl8192e: Rename variable bFirstMPDU
>   Staging: rtl8192e: Rename variable bPacketBeacon
>   Staging: rtl8192e: Rename variable Rx_TS_Pending_List
>   Staging: rtl8192e: Rename variable bPacketMatchBSSID
>   Staging: rtl8192e: Rename variable bToSelfBA
>   Staging: rtl8192e: Rename variable Tx_TS_Admit_List
>   Staging: rtl8192e: Rename variable Tx_TS_Pending_List
>   Staging: rtl8192e: Rename variable Tx_TS_Unused_List
>   Staging: rtl8192e: Rename variable Sbox
>   Staging: rtl8192e: Rename variable pMCSFilter
> 
>  .../staging/rtl8192e/rtl8192e/r8192E_dev.c    | 50 +++++++++----------
>  .../staging/rtl8192e/rtl8192e/r8192E_phy.c    | 10 ++--
>  drivers/staging/rtl8192e/rtl8192e/rtl_core.c  |  6 +--
>  drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    |  2 +-
>  drivers/staging/rtl8192e/rtl819x_HTProc.c     | 10 ++--
>  drivers/staging/rtl8192e/rtl819x_TSProc.c     | 36 ++++++-------
>  drivers/staging/rtl8192e/rtllib.h             | 34 ++++++-------
>  drivers/staging/rtl8192e/rtllib_crypt_tkip.c  |  6 +--
>  8 files changed, 77 insertions(+), 77 deletions(-)
> 
> -- 
> 2.30.2
>

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>


Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC082D839C
	for <linux-staging@lists.linux.dev>; Sun,  3 May 2026 15:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777822942; cv=none; b=jRQNg3DDPTzAQV2knk1RvrkxdL6VXX20v/w6wu1hlAytUwBE6QzuQ2p3gOpJzFdcTOwQaGF5Z737lrU8yaXsIOVKIZzAKS4D8StO3LhsSARcCuAqLAdtLA42k3fQuP1H1M1WKvngqLOFPDeIc7QYwJHZ67ujHSsPOjxBIavIWEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777822942; c=relaxed/simple;
	bh=cEwDWDfHWUTVMRMMby8OG7tHLUyF2mKRPsrW/mUPIrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFQL9p5Y5ZrAQIHHpx0Ze/zTUnrrRYZ2td5pRm3Kfd/ofzON8NS0A4KTI21KQOEvWh6UVBSsd88/3JU5v5Wml1xhQFsRTXiqbyQFkpIPagUIUxDGpmN5KpUXBf6LDRfF91xYYBav/eZ57lTeBHsoc+qrf+ou0Kks4r0c1ivJbBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hHbrYtmY; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hHbrYtmY"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39389398838so7138571fa.3
        for <linux-staging@lists.linux.dev>; Sun, 03 May 2026 08:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777822939; x=1778427739; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=94+F6TRVbfA8R3Pb7VFTMIPChuyRr0kl9WH9wx1Cnck=;
        b=hHbrYtmY0aAv+hMeOaBkEq6zDSqku0vLBvezD+E0FwkOQq82swPTmN/h6uEdFqaqpj
         zsV0KALBCKCpvnzsk4AfPZFR3OkwTDIhCTk+WHeGIJ1QKXDFzPsq+Xh5V5ghETbngV16
         ZyYfijXrDshP3isGoWoG4xvU7EEcxHZlBI/0sSMil0hRD6/7cII6B1uesI+TisNYiE4V
         3dSYc3crpw+gfT/obZehWEzHMYp71bqDAiknICtONgqMyaBWsxzsdXQWVhJjBV7KPPww
         atLQAyQITMbOXNev20qruRezlR1xTg1SNhbnw/le8BfdVismG6iDxjkuBj23zT0tMcbF
         E+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777822939; x=1778427739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=94+F6TRVbfA8R3Pb7VFTMIPChuyRr0kl9WH9wx1Cnck=;
        b=A/4CxXhw2NzNZbzLdzTni1hrhLaqSGNuThfXchdADcQpw/14SQhoHoya90NZ5BUH6q
         Sna26TS3mKDcj+921xIp4vbwOmPyiZX5Uft9gjrftPB8IULplAXVWJxSucJgvovWkPMv
         cX49/OSBMBEP/gvrGS7j3Ha2LglQbCjvYIRMjiKU4LQWRJvSicR4APNnvGPXxHZqOlH5
         LDQAAPzEeUcKjSwhsNXDsSHAfLUN6WJRsEtrXq+WYYhSvkU+VPdh7EKPZJWuY3e5251k
         nZK4h3l+vrHtB3mlvbxI8OtcBCoZ9E2yB/rVt/lKSzs34/uIwuDT+DRxJ35oeoj+wX5O
         Z9ew==
X-Forwarded-Encrypted: i=1; AFNElJ+QA6NxvBOF9JHaV73Y+E+xfGxba0fR5eARYbbtxx5RmiOmBKdD57zUYtvzrFlEkjOC8veqz6B3U+v/jb16@lists.linux.dev
X-Gm-Message-State: AOJu0YwFUKe+nGBr7tJAr3IhQUZIhIfxP2y6kqberWs5IX4Olb1rs7Y6
	zJiPRKveBmbFjgI5FwPitDupoNp5pzNMpGF3eEK/x4L16ggvYGFepvqh
X-Gm-Gg: AeBDietTEuxXoh2aZZcLR+nLoPNVYBTlK/pMxlBovNR5SJgzm3uomrODbEoIDor6Lmk
	jerIstSTo1rGQNdCcd7/l7E/kacawB6cSzaPuPGST32U93TxazyEPad/qAhpIns54HAdRVYa1TV
	Utv8L3x3cfMAqutWsB2meCmbDGUAWkMLMQEjR+jiV63xBcSoi1w1+rZ2UssMFxJt3tgi1Ub9R+L
	n4lDGkN1uwMBDrY0+bhEtZ9EzBENo1x1wB9ywBNOjNFdEAivSv/z3aB6FWLN1vWteyIE0gca+Va
	9PNIdJgYMYK4O7S2LmnvpnKToVusfgD1TiL3ZToxxm02yzOSXjfWDMO5LIIErWf4+Th3StnP7S2
	778b7uhQf/4n4f+FMcU5HezkNBPcDDgzSq8KU7Twp3m3bvuggI3WGwG1wg+h7MSY+xjYhHaGqsF
	ern0a83bKrC0bNQnW5CQo+n1A6X4PVy5TgVn4=
X-Received: by 2002:a2e:bea6:0:b0:38c:6b40:c6bc with SMTP id 38308e7fff4ca-39378585d48mr19078991fa.27.1777822938673;
        Sun, 03 May 2026 08:42:18 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393900c9c94sm7542431fa.40.2026.05.03.08.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 08:42:18 -0700 (PDT)
Date: Sun, 3 May 2026 18:42:15 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Aidan Russell <aidanlrussell@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: Fix spelling mistakes in comments
Message-ID: <afds118E7NODetnJ@archlinux>
References: <20260503145346.10791-1-aidanlrussell@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503145346.10791-1-aidanlrussell@gmail.com>

On Sun, May 03, 2026 at 07:53:46AM -0700, Aidan Russell wrote:
> Fix several spelling mistakes in comments in the rtl8723bs staging
> driver.
> 
> No functional changes.
> 
> Signed-off-by: Aidan Russell <aidanlrussell@gmail.com>
...
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index 72d5905a48e9..eca1a5bc79be 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -1650,7 +1650,7 @@ u8 rtw_c2h_packet_wk_cmd(struct adapter *padapter, u8 *pbuf, u16 length)
>  	return res;
>  }
>  
> -/* dont call R/W in this function, beucase SDIO interrupt have claim host */
> +/* dont call R/W in this function, because SDIO interrupt have claim host */
      ^^^^
"dont" is also misspelled - could you change it to "don't" or "do not"
since you are here?

Otherwise, it looks good.


Thanks,
Nikolay

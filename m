Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBD03D1CB6
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 12:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777898021; cv=none; b=Qf4AEvw4cg8UWM/AeyYHQiFf72MJiWE/y2utWAIM48FuZ+zAG39B01pGwbeWcB6i8t7ko0VmOqs0bSHjaYGhbhuiydq8kzuaqHzYgRZGdKUH/I8XwdIQGUbSN0zPmGk3tdrtOqBk9Fk/7/L8kaHahStOh6Piu8KAfZNk+X9Zs68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777898021; c=relaxed/simple;
	bh=NbVs/Bw2APpoJ6GFh3qNcHWoaEW8QSqVbgB/Psz1ItM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W73/wWbMalzNURD8E1GOa/PpzwEuZmw5VFZzRBhCZdgb/HP2njX4lAcOH073Jvh+lhciPcHLMt8eb0iXYQ43H+vow1iR/NFfSuIifTS9vWaG0qxV2r4+Sn/SL/S+DSlFpWpNd52QnOZdWXXJY+fVJve5i96tFXx1nDPOge0l5j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DkKm8iTf; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DkKm8iTf"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a62f43b76aso3532501e87.3
        for <linux-staging@lists.linux.dev>; Mon, 04 May 2026 05:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777898018; x=1778502818; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YVNM0EYz7XT1m2PVNvAVtyRFSW/cSMV3/52iY/ZVHWA=;
        b=DkKm8iTffbOhiDTm6a+fqnNjf6sBy2o7GXVjSnFCLdCq3UIF7tD6bqxRXIX+aHpEpY
         lrkM7Z5RB9SAUMuI08KtVKC096FGYwIFj2zwNoOclBRrwJXXzyhSJGYxEO+2bX/WXHde
         GRPS5AI2WWali3rjujHFpCtJH5OE0JI1hcxJ8THDczdSC+/lHLBh/qGlpESIRQV8LxsM
         AvegndGF6lX3ZzeJMJwdBMPUij6NpPlo5hIadmJmVzeiOm4I+XaVoaJF9lxoWOVlxIQ+
         RM2i8r8/90+PGhckHfrTCKfTG4p/P9LhNdPdtcNUo4rR5ve1ANIH/6Tq85LVKcQVbVNn
         RIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777898018; x=1778502818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVNM0EYz7XT1m2PVNvAVtyRFSW/cSMV3/52iY/ZVHWA=;
        b=mNDXsJpgWHJCRM8G2HLZwKpbUjq85Fpp7lAMdA8A209/Xp+ksDWbPksYi6CFUeRmNw
         04q8sME/zvtqkBUVrZKHk69QLo98f0GKQ2tjS+zZy+LXc3OI63uYDOoOFNPpBti5dSZm
         OFqLgktwA+NjHuuyRTDoUbed2EWVBuzA7SFcGj5OCGu0TXOVAzDbHws0RtT2+VfwUqVN
         fvjCCF/KEedl5uKV0ri7HVUvz6vUR9eltjJgY33aUQIcNgeOfiD/8hv8Ge7+ZYmrsVVG
         L9W2licLDn76qR/v1tK0Ejdc9f4oxOUxNdlUH2GtbmwQKqxdzDWnGML9+eo5SVgBctm+
         JLMw==
X-Forwarded-Encrypted: i=1; AFNElJ9PfI+N8e4j777EwTJf8HT3MF/TU2/CrNU8VfVToOfLMUCUfMoIilsbx8K2VXBDhF1M+wTfO6iXr8EB9pbh@lists.linux.dev
X-Gm-Message-State: AOJu0YzrlxXmVIGcJq9uYaRxncQyHIelp4Ol5KMTgYdaNJwC+9AaWK7/
	RMJapEqUwkmexqzKSWPony7ZuLBjEoRzN/ry5aR/IGS9ZB7sVQzfyhH9863B7g==
X-Gm-Gg: AeBDiet+eg01mVdkveIogMAWsM9h2ZKIq8JXTRa6ofgsuaOzRfVwTsFlQ3IzdlR/ROZ
	kB+g3F7LNOqxSFC/mVLyNsjlU5zbNTrvQcAGGKgsseWL8qbA4SrNLNNh99AgQaER2+Ea6bECUlL
	ZYfwSZpt8493Nst6p13u8pMQcshVoKD9zieobs2dvB8B2S/ysp6Ew2yNZMSxw06xTY9x7dqgkLs
	xRX1fBL1p4xVhIPGuQUp29YTCQcqQc3FN4tX/y6mAlLGAXqLYgL5lGtuXzB8buSv86Oik8EshtO
	sNafaHFpHOGGqiNBzJOguLbK6lAj3G3exuXD/tC1GYyI0uo2/deyMDsyqRnTxYnnqahn1pPtTLz
	2SBb8CbuU9PoS75ZACt+gz2VnM57HK05VwA2dFyE/1eXTkU/RIA5RbHIZjjzbCbv1m6ww5wVSr5
	BBs1SFXtmR/SmGxDT1fPd2ypLJOjID2rwm3v8=
X-Received: by 2002:ac2:559a:0:b0:5a8:65d9:613f with SMTP id 2adb3069b0e04-5a865d96276mr2172890e87.24.1777898018249;
        Mon, 04 May 2026 05:33:38 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8616598c0sm2459090e87.83.2026.05.04.05.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 05:33:37 -0700 (PDT)
Date: Mon, 4 May 2026 15:33:35 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Siwanan Bungtong <horstaufmental@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, straube.linux@gmail.com,
	ignacio.pena87@gmail.com
Subject: Re: [PATCH 0/2] staging: rtl8723bs: add braces to if/else statements
Message-ID: <afiSH93kfMa8yrhU@archlinux>
References: <20260501203121.227992-1-horstaufmental@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501203121.227992-1-horstaufmental@gmail.com>

On Sat, May 02, 2026 at 03:31:19AM +0700, Siwanan Bungtong wrote:
> This series adds missing braces to if/else statements in rtl8723bs
> to comply with the kernel coding style and improve code readability.
> 
> No functional changes.
> 
> Siwanan Bungtong (2):
>   staging: rtl8723bs: add braces to if/else arms in rtw_efuse.c
>   staging: rtl8723bs: add braces to if/else arms in HalBtc8723b1Ant.c
> 
>  drivers/staging/rtl8723bs/core/rtw_efuse.c      | 4 ++--
>  drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c | 7 ++++---
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 

This is not applicable to staging-next, please rebase.

Thanks,
Nikolay

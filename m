Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776BD1B4C2D
	for <linux-staging@lists.linux.dev>; Fri, 30 Aug 2024 14:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725029557; cv=none; b=dddrsn124TSYs+bys12auHakI7Vg2ezSuIANZXXg9Xg978CUP4i1OJCe/Vb95Ptv120LbNgcKC4Sz/4a7lacPsacrqKlw7sjeDZmho21tJVxZM/mPVpGUWYa8V1JNBZAdxHuweaznFtClxUehQdtvx50kHqduMLX0OKXpgsY7IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725029557; c=relaxed/simple;
	bh=FuDLCEncKPaeV9pVCsEMan8OdEXT5DPU7suVJu1eIzA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UZc5lKyogrXx5IhBYf7McMkQKFAI9rmwGMdbya+S8wHLkCuPdQYwAkODAuL3W9/DUF0X8nFCQT9LeMGGZZ5d8GC83C2Uqru1pNWN6AyhyEf6Jm3rP6iA2h0p7KVmttM3U0eyvipstU2U4yYIWGXDsfdFCGf0dwqcaxGcPZXd/7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U6e7lmuA; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U6e7lmuA"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7143ae1b560so1105371b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 30 Aug 2024 07:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725029556; x=1725634356; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l43nUavHxnAn2/Q+7POfa5kpXTQFK1M94W4Oz0qeZQE=;
        b=U6e7lmuAmmj9vKllGZh+Pmzk3h3sufLQjISCSNB6YvalAlAVrt1DcGmphJz2ifAVj6
         vY/dyJ8wjv7ec5k8E4nmYWKUzDbkif4qYgWHnQucvlP8krxnsqFsQNQYS/2Yb6YHsIwz
         06CiRzD9Qnr+oda2CB6tpfiC4LHfRyp9JTWf7YAG4FuBDn8SKaXTYYoIktUrL5ZPcLyZ
         rdfm+ccW0lMhU1rzwti804UDvF3FbouBPVqrU4uFLqD6SUauReHbughXX47mhNjiIlsm
         i8jd0WZEDARGbIxGMFrTzcMITPSVKPQMpft/opLVNnQXEQU11073VufPSf+s5ERajkF1
         qDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725029556; x=1725634356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l43nUavHxnAn2/Q+7POfa5kpXTQFK1M94W4Oz0qeZQE=;
        b=cyTcPZOY8I2MtwrzCpTqjjif49AZdk6JBJtL5GIGUY8gKtYnCvxE2uSddpZQV0BhQD
         YJWRwlE/Rdw3KIxfQZbcaHyL4y7g9dJWkX2+05IcITW0zzh9GMkCqavDPutyIpEXP3kf
         BQ87RxRBTjyR/u70y/4FqiMN9NNmyJSYkTJnv/v34KDX3fIcKp/btPwosZjYvpNGyULo
         lcB6GGzNfli2CQTVqQFw+LKoc+EdeHdk03HpHGgDj7m7vWz1yDtNBlbfoWMq3GKOlvA0
         QmB4uPfruR8vnfxWjf0UV5iIacJHEH5c1BaApSthBQ2p5hrH8hXxSehhKBeVCKsk0kLB
         1UiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxc55WHFcrc4XLpZrs5WPAfukC273Q2h3rVC2+4G7PmuTKC0s/9NpRVJUiFSdPc5GenxCR0vNuJTD961U5@lists.linux.dev
X-Gm-Message-State: AOJu0YzdET0IcEY2uSy5NY9lfhBYXkIS/4dRePQMA3pIHcD1F3EP9hIh
	ZQGX6mVEmFur3dYYXWUxy8+pcn/naSiS3r8bbjPLepZqC/us1leg
X-Google-Smtp-Source: AGHT+IGxHY+6Jai4ZqwKefEHo2BiPfqhaC3jiXpWGV+/fyWdBXLOrdvc8VAZ3rrnNkBeBcUytqFPtw==
X-Received: by 2002:a05:6a20:d70f:b0:1c4:bbb8:4d02 with SMTP id adf61e73a8af0-1cce10c4d57mr5637524637.37.1725029555625;
        Fri, 30 Aug 2024 07:52:35 -0700 (PDT)
Received: from victor-IdeaPad-Gaming-3-16IAH7 ([116.68.77.85])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e569e9bfsm2847966b3a.130.2024.08.30.07.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 07:52:35 -0700 (PDT)
From: YOUR NAME <vivek6429.ts@gmail.com>
X-Google-Original-From: YOUR NAME <username@gmail.com>
Date: Fri, 30 Aug 2024 20:22:30 +0530
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: gregkh@linuxfoundation.org, dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Staging: rtl8723bs: Rename function SelectChannel()
Message-ID: <ZtHcrs3GoRZJiLjS@victor-IdeaPad-Gaming-3-16IAH7>
References: <Zs8WLkzoZe3Z0DYF@victor-IdeaPad-Gaming-3-16IAH7>
 <5cbf98cf-9b1a-455e-afcd-b0cdfcf1aaec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cbf98cf-9b1a-455e-afcd-b0cdfcf1aaec@gmail.com>

On Wed, Aug 28, 2024 at 10:25:56PM +0200, Philipp Hortmann wrote:
> On 8/28/24 14:21, vivek t s wrote:
> > Rename SelectChannel() to r8723bs_select_channel() to avoid CamelCase
> > warning from checkpatch.
> > 
> > Signed-off-by: vivek t s<vivek6429.ts@gmail.com>
> 
> Hi Vivek,
> 
> the description can be improved. Please always consider that checkpatch can
> be wrong. So checkpatch is not a justification.
> 
> I propose (feel free to improve):
> Rename function SelectChannel() to r8723bs_select_channel() to avoid
> CamelCase and to improve cleanliness of the global namespace.
> 
> Thanks for your support.
> 
> Bye Philipp

okay, understood.
i shall change the description and send again.

thanks,
vivek





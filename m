Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D731821D180
	for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 19:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729191732; cv=none; b=m0w40F6OoLycGtODrD4dsieGC2IDzBb2aJSeA5tSr2C5hXlMH5NGLIhNKZRcL88fKk3NNVL0RBmAbKxq/pKlxVK7c30nn3WRRMb4zA/rLTM/dlGfpjZIOKd4HVOmf6vlI0YEWVJAazweYW2NqvstSbkTXqHKO5R0B7c1xF5iHuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729191732; c=relaxed/simple;
	bh=FGcr0cwAInpg10pH93HSLy8OkgluyazJE1YUDfSja2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4YBPuqv9S4ch8oOzYoLciHoQTvzVWglD2k7+rtWoPPfYdRRdbyBWyHT45NupBU0rJzqp+o7Se/vmBFF+jtRFoaAxZfkb/5hZCXLntCVjKap5gt+XL8uFR2Pq0xh2GgASjBDmlgkvxPtsZ8ECL2BWdIhf/P/8eDrcCb+871mmO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JoO/cUC6; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JoO/cUC6"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c9693dc739so1733085a12.3
        for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 12:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729191724; x=1729796524; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yX7D72bYtA7nFMel8yCm1VLTz+d+DFr1g1il/QVdnM4=;
        b=JoO/cUC6lOSiny9O61pZksIOIRks/tfBddMRPhnfQ9baUkLbyFRAKSQYGrYm+oUTNb
         OleKN8cnEwl/jEzu9YmqlV7RhNoU4MvZ3xPtRCefwgl5COQ1MOfmR+hoBZ5p2DStuNdA
         cG9cBbNzsUmS8Wz6eetQDgbRS9YlCIff7yyBEB4WHz92r7P45YdL2iBjSuEbUiIA4qsI
         2s4DDypK1GIEC0nW4NbPDhguJcwne1K6wf87QZVmFexCaWnYodX4j1Ac9yNdrVhfZSCM
         RlWlX0PZkXloRkg09zVSDVmk1dqeuFyxIHZ/jr+3c2CvMmA+I/f+N/NCJ1HlxoZSmY8S
         g0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729191724; x=1729796524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yX7D72bYtA7nFMel8yCm1VLTz+d+DFr1g1il/QVdnM4=;
        b=TK4IgcD07jQ2BCP6Sm3jou5+Vn3Iif/0rMVZCFyum42KSfzqihQSGP9kTpWVmPGEJj
         /LJPFNzRaDd2LUDNTsTiC/JY0FQV/pLS49scsT/gBNrDfuwNZiPBS5MRFOge5Aisv8km
         3pAev+stiSw5DPtzhtz4mR6MUAeaHl5B9f58dr4M7/izZKVOZJzRtAN3v8ZE81aW3RJi
         uzOd8FL4bNhW3ZK0nn1YFUyw0VoLxUvfVs4GraJ6TMUQV5LrGeeEVwfyzCkRTKDlhHya
         OkguP28RS9+gBc8nEaXL4tPqXZ6QZtGrlhhxHOYg01V97EFXurG38K1KbIVUbQ5lZMCU
         +GNg==
X-Forwarded-Encrypted: i=1; AJvYcCW0HPy9Rqqz+wHALC57O86jl/+saFByjGgdNqNd/hbGXtqI2fSEWgwUSRHqP1vZb8q/Tbey75VBfvfh3bvw@lists.linux.dev
X-Gm-Message-State: AOJu0YwO8PUR4s0/c3SlY+sB9szEZw/0soGSH1SOAOzQYkPg5gjiLB4E
	mIkL76hHXe4Wet3JI+TR6iKyGNXzBO84Rj2Kt61GavySzdOThPeZTnWx6cbzqcM=
X-Google-Smtp-Source: AGHT+IEJBN0gq8BBhf6ABCGKugevTMmyCj5PVHfkHmf7ahmoy9bjp/wSlLak2Plc9KTCjs74F9EVww==
X-Received: by 2002:a05:6402:3512:b0:5c9:40e6:24e with SMTP id 4fb4d7f45d1cf-5c95ac4175emr14627651a12.28.1729191723962;
        Thu, 17 Oct 2024 12:02:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c98d779975sm2984259a12.67.2024.10.17.12.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 12:02:03 -0700 (PDT)
Date: Thu, 17 Oct 2024 22:02:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Everest K.C." <everestkc@everestkc.com.np>
Cc: dpenkler@gmail.com, gregkh@linuxfoundation.org,
	skhan@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] staging: gpib: Change return type and error code of
 fluke_get_dma_residue
Message-ID: <5bdbffc5-068b-494a-a44b-f9586bf28f6c@stanley.mountain>
References: <20241017092511.17621-1-everestkc@everestkc.com.np>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017092511.17621-1-everestkc@everestkc.com.np>

On Thu, Oct 17, 2024 at 03:25:10AM -0600, Everest K.C. wrote:
> fluke_get_dma_residue() returns unsigned int with -1 as error code.
> This error cannot be caught.
> Fix this by changing the return type of the function to int and 
> returning the error code, that was captured. Also, change the data 
> type of variable residue to int in the function fluke_dma_read().
> 
> Fixes: 55936779f496 ("staging: gpib: Add Fluke cda based cards GPIB driver")
> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> ---
> V1 -> V2: - Fixed the caller
> 	  - Updated the changelog
> 

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


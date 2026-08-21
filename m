Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F489385D96
	for <linux-staging@lists.linux.dev>; Fri, 21 Aug 2026 06:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787295506; cv=none; b=CA7MYxrrLAvcgfU2ZO+spSPUFPkhuIAMyMvbWFGWfmKznGQDuaTE7pUaXkn3Uym4k8zlD0yae7WAbr35uZsFLiAiaLKUQqkvadHo8Ho4si5tiZLweIe7A3xheZFDLEwAo559H78pp7nvOjgST2Yx+QGo7LDAFH8BS8W7Bb5M7go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787295506; c=relaxed/simple;
	bh=YWnqbBRFTqCa8CkD2PRlcyIBunfux/8atCCsfulqGWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f328aYCeNmBlg5aTJyJ75uZv8bV1dJqLZ6SDY8jpHTfu0Y43YmuV60cQNub+QZmHor68JH3v5oYtPPU1Uf5Tt9/XI/4AbhgEazTZkGOVm3H8HyAT+8Ihw9Dhyo/StqI2d16AwA24p/cS3uTAVoom7EdugGZfa+zcpNMhWt5thso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WJy7N52o; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WJy7N52o"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so486836f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 20 Aug 2026 23:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787295503; x=1787900303; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tk01vz4OOXH1YMA2hJuMI+IKr5JVcaCgldOQQB4ILzU=;
        b=WJy7N52oSVcj5M7eXhvJuOmeiQOGgpIp5UXrlHaYJ2/qmhsgSP/ggEdw5ns/NLEroS
         w1pd00HucA/J3RBmrsF2vO+4wJLXuHjmIrFhHlBFOe2VKFUJGo+h7KZ5hLw0Yt+IMA9k
         mlcgg4EN1nWrWLKKuX2X4ymDCOaaTllYyv51puiHmlC9FtkP4N+WPS6uR0eCzyqXYOYb
         sNSY6x0AyRTFyPD4pvnvhs2ueBKAiTUmtt0v53WCJDAhLzC5LXcFgP6voDXMx6+meg3z
         mUs9xkKnJO01QCPphvB3P5w7oNKOTRYEVOx71DlqS8eeZURUC4rDxvJn/k8hUarR0ZlD
         EENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787295503; x=1787900303;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tk01vz4OOXH1YMA2hJuMI+IKr5JVcaCgldOQQB4ILzU=;
        b=NkyzRQCu95x9O2hNDguJrC7GXFGg3VB1JH8UphcDLWdaQq2gpP5glKGB4kpGChTLu7
         SJ7CXL0Ko2QqBDmux+0BW2bX1DdVGIdj32gA127xIwWbxVRmOPuTdJWgcdYH2cePn8m0
         EcKfXaNsQjKdIjUOFcN8Sa/6VkY5Qx7/1p1Cs2j7xIDnc4Prc/auF0g4pPJbr83NeAH/
         8wEppjuCqGk29KGE0VaDc3sJjRb7BWQaEYu1W3tTMXocLNfYfhVsXPVXx9aOjANG6i23
         DpRxAjqvfEdnUpsWdvfhiuBajJLBcHF5DR+GD/IR0GuY/rspq5qyS5rDptM5C4FSRgE4
         vVSg==
X-Forwarded-Encrypted: i=1; AHgh+RphjdEF+OUXbF7MUvvJDQ1aYGx2WXvo8q3vV0c3VZZZy6D8Tk34gB1sKR7bAmh107f8r4D1A3KNLHHvd7LA@lists.linux.dev
X-Gm-Message-State: AFuF++mgeDhFjWfrysch02+TVOJx4Aj4kgWkgc//34DyzH9RV8TRlSuc
	1BIGafDGdQVWpvInJjrGjodQByYQLYA+4+G/OG+R8areVA0fX57gk+ag
X-Gm-Gg: AR+sD1344e5Q7iu3wTawpENBQPQhF9plIcg1V2I6eNKbLIPG2EZLn/ihQW0NS5Lp2Wb
	H149V2MR5qKuKhV8H08FLo7/X2hctCzFISzDnUHCo8a+I6K8FrjS/4FMVz4jNaXSdgbqRQPVJhH
	t1zXrp8F3AU5P+YLS8u9P3Hl9H4g8fhm8Vh+TAM6i49RFRdRFsfSlsUqPfktk2g0YqX1JLL1msQ
	mDVHAvACdEYSdGQ/XscloaIvSjqmvPVDhgapWc1k6ah/QyPJZT+OTDKelcR2PSjG/dwsE5iolJd
	Q8qzddZgzgzPOcAMMKcwhxbItYQABcvJ078LFUQ6dEZFbfK2BZOxCT/mqCRMdPFOlvoRUDUMdG8
	LGlIaTtpSnsOUJ0SsCe6VsFDt+kAiZS0T2rDDK3j6t+CKrnNjCmgceYkIiPt0QYuCAcjAFYx5/e
	Ji/g8bOyjSO2kRd6N72bifnpWscoD2tuAl1LQpLshnJMyGhMAf6XUQ3na9aLvmL6gVZt0=
X-Received: by 2002:a05:6000:4717:b0:47f:7759:89df with SMTP id ffacd0b85a97d-482c0b4236fmr5996951f8f.3.1787295503207;
        Thu, 20 Aug 2026 23:58:23 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b145c9d7sm18172409f8f.15.2026.08.20.23.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 23:58:22 -0700 (PDT)
Date: Fri, 21 Aug 2026 09:58:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: Tiago Panizio Gottardo <tiago.panizio@hotmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] staging: octeon: fix style issues in ethernet.c
Message-ID: <aof3Cs95spFEo3Vr@stanley.mountain>
References: <20260821041255.1616843-1-tiago.panizio@hotmail.com>
 <CPYP284MB085499A0F516D64E9596B9B6FFA32@CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CPYP284MB085499A0F516D64E9596B9B6FFA32@CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM>

On Fri, Aug 21, 2026 at 01:12:53AM -0300, Tiago Panizio Gottardo wrote:
> Fix several coding style issues in ethernet.c, including line wrapping,
> continuation alignment and function declaration formatting.
> 
> No functional changes intended.
> 
> Signed-off-by: Tiago Panizio Gottardo <tiago.panizio@hotmail.com>
> ---

1. This patch does a bunch of things at once.  Do, one thing per patch.
2. Some of things are weird.

>  static void cvm_oct_rx_refill_worker(struct work_struct *work)
>  {
>  	struct octeon_ethernet_platform *plat = container_of(work,
> -		struct octeon_ethernet_platform, rx_refill_work.work);
> +							     struct octeon_ethernet_platform,
> +							     rx_refill_work.work);
>  	/*

regards,
dan carpenter


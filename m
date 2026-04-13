Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BCB3A4538
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 08:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067409; cv=none; b=mFoezB+HJPYXU0RvY2u8JL5rPb6uqTuvBe15Zn+n+QLXtjgHhPxT9SC6jP6GtsbeIU44W0wfDPTj3L8nN3cCMj3wlycF2E9ScCS4ue7Y1I/hFa4jzsB/ydsvi55gNQiGgc0Z20yNlYnFx/rgskvhYre1JGb//rGwsXozpBN+XCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067409; c=relaxed/simple;
	bh=wAPCziRy3gqwNYDXtdaW7ysNJai/VXJp9vLcAm4gnsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qTT1RbH9iAdtU2cqBtMMZggXvIwkKDEjqiv3q/ASLcRSmSYeYp2zsJjjzvH3FF2NHaLh1BdB4jWISjtE9uzeMnfZVClmM7yWZDOjCRBFIUTLiIQ8rBOzTWKRVSnQcg3XhAaPFZjCSewoa+bvVZm4nXg/cZmFlouLPULt+oeQpSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XO6SoE1E; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XO6SoE1E"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso64554655e9.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 01:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067406; x=1776672206; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FdslTYfHiFdLBysZXJi70hRjVM/Tx0Yks32sBf4zOMo=;
        b=XO6SoE1E8ImYUrOGghgfTX4pQU2RfWCRXl2Vp4oOf6kejJvrJ2NDNhIT9SHn70nySL
         pm22M80AEW4MIu6x/3ZE/YxVZqwk2ri3Dy7hJdb8Eex6tpybjeEtfXKspQTBvz5FDuwd
         LTGwDL94IKYUP0sgKJqNoVyY5bUEklWvVrGPOxYDBh/LigKzq3RNPn4adjkr2NoAazyz
         iYJBoJtrqvEjWrCt5wkKypENGgTDjsQiqNYsw9/Xso4Wy/0Vs1mE6epjhPxfmRWxv5P9
         XDddTymtyyVZ6O3I8qnX8+HVnrPBfo2PNs91xr4E7nlO6ARtzS4TEg7c7fg+eOi0d6+O
         tM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067406; x=1776672206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FdslTYfHiFdLBysZXJi70hRjVM/Tx0Yks32sBf4zOMo=;
        b=owHnCLoal4JNUvvMs59rnFRfciyj3tJ2GgHekIRY9NffFae/xfUuXqLwPfuQAefK7r
         jkTEoK9kRLC4rVoV03jRQDmbtC+8EmFCw1z+QGkL/OPOtDUT/hzBoV9RJZMzdTkz4uiE
         ti/b8AqdHeU8wfNM2bBk3D89y1vG1VsDCp6nY/fnxgm0sZ8rIE9hQ739GZUz7C2pHrH8
         /ladmb5SMnURFro0ACMUr64bzL5LcarDj5F9EpM8/evFcmmQSVjjBZfjKgsJ/S1FtsDq
         UA3TJo8v8eFwgsS2RrKHGP/4+H+wQT2MxLESGwc3tSFjjqAYSSdzOXCHrSMIRC2W9ZsQ
         vTMg==
X-Forwarded-Encrypted: i=1; AFNElJ/EzWQkSiEXdR2utq/2opb2xTtR4Y3SUtmfq6dDcVuexJMih9/5ZRq01EWyblJCiomeRBU4vnrJwOzbW56v@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/P5H9MA54ijZJV5KTKKWIIU+PFngSofVG7BTDIbK9kAKQSq7g
	dIJAkTv8LmDUUmKQSFJjshCloTXL3ZQ74rO2uIupkBS8deMJVkFusmQr
X-Gm-Gg: AeBDiesiNhqltcL/a9nWIROxKvM8vxihSFacvexydb0S8l/cgmlSWlUC9LZMNWtoFVy
	rWKBS4u8cuMa02AqW4E6SXYq61gbImK6v+9cij0HY+bXqPi1pMd3mzEvK7CmP4rqNscApvNC7ID
	NWS+Lp+LmmsSf9rs43m2NiYt6yqZoxt/4BN9fYqMhxrMux+vBjXf6DhRT9/z0XqAI80MnCKGOh6
	VxjNVs05c4P7eMQaFnwcGbGf/r0g27XpIOxdhw/ShxULSkP83IuX4e22K+GM2NESjdNVuJGQoru
	pEymSlr5EA/LFmGU5a+j+wELweJR8LD4tuX5JGeDWePorYaLfQDxDDopklkCaDDcFmADWyQr3kI
	pYScAUhTnGRfrvjKLg+Nff2WY8awH82lQYpSeE/ZbwxUbmaOXDyVeniPK+4UXGvKFRlInlJLU+A
	/qFvrpgk2pYul4eoZrEMo=
X-Received: by 2002:a05:600c:45ce:b0:488:a8f0:35bd with SMTP id 5b1f17b1804b1-488d67df745mr174646595e9.8.1776067404611;
        Mon, 13 Apr 2026 01:03:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5d703c1sm89816805e9.3.2026.04.13.01.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:03:23 -0700 (PDT)
Date: Mon, 13 Apr 2026 11:03:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: tegra-video: tegra210: ensure PHY is disabled in
 pg_mode stop path
Message-ID: <adyjSM70HcX5cq9s@stanley.mountain>
References: <20260412163600.29925-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412163600.29925-1-dennylin0707@gmail.com>

On Sun, Apr 12, 2026 at 04:36:00PM +0000, Hungyu Lin wrote:
> tegra210_csi_port_start_streaming() enables the CSI PHY regardless
> of pg_mode, but tegra210_csi_port_stop_streaming() skips disabling
> the PHY when pg_mode is set due to an early return.
> 
> Remove the early return so that the PHY disable path is always
> executed, ensuring consistent teardown.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---

The obvious complaint is that this patch needs a Fixes tag.

The early return is suspicious but I don't believe you have tested this
patch.  It would be better to not send untested patches like this,
because there is a risk that the author wrote what they did deliberately.
This code is six years old now, so the original author has probably
moved on to a different project.  It's not necessarily that easy to
review and test the patch.

On the other hand, if someone from Nvidia wants to Ack this patch
then of course we'll merge the v2 of this which has a Fixes tag.
Just wait for someone from Nvidia to respond before resending.

regards,
dan carpenter


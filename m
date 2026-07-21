Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329F544103D
	for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 09:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784625974; cv=none; b=DPHNoHXDWfDPIKmxuhQfHBJTPRqT+6LjdODi7XspFkouPoycFMT9rJ9tqThOCqrOTGGb3N0vSV7X8VPCagtpfdJVBidEOiKFJj9NfE0RYoaZw132h2ffBtonoGc1gwznE3Nz/rFmoo3SjWCRV0p7MuliyCMhOfqb2OyP+chwo14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784625974; c=relaxed/simple;
	bh=z1WTWDI5f+jBI0QjxNyN35KTkHvWiSM9N6fRXjgPnm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uSnR9ihXwjwEdqEULzV0Ok9EiGv1xPFVF5CFBM+hUDj8JSfosy3hJhHJfDhRO2Yrq+12Gihb+3qv/Zq6AyRcbHSDNfdVvDW6CwL+vlHiZhs46qDojm23WlTT3dLpnkIh6UiTbUehvSjEIEKj1JKbbN7LkH7qYuWme/YP/dy8XDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MuqOKuqY; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MuqOKuqY"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-698a9f11776so12743813a12.1
        for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 02:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784625971; x=1785230771; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sbuX/Z82/a1Q2XE+uXfBweexF5O+JFRWQ4hhLAZ4P+Q=;
        b=MuqOKuqYaKMe2cxU06+aOJSNONbIfmdxiqFlLEVA7ntZYSxc9LIVAz2KljHDTEDItH
         eEtPR+CzxN48V4jYVX62OsRsp5RpvASCAUt8ee6TXTMkwc7KON3phJUrAdN3QwUPZkfo
         bXpVp+XOPzr6EfNAxa681X2Ac2f9btfuZ4CoA9c5WWymPBG4/HYrFlopUOuQqXpcztvc
         SgiIcF2V2XWc4+HPK2JVPBu1WyCrW2SoLU/v/douqftW72N0UgB1HdGpw+vn2+MFhex4
         MNk/oVXWPyLA2BNmUs3NUFHlbaVSjDE+ZLzlfItI44a/mKSTMngmhac25GxLcjXRNIaV
         nDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784625971; x=1785230771;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sbuX/Z82/a1Q2XE+uXfBweexF5O+JFRWQ4hhLAZ4P+Q=;
        b=Ve+nM5Na4j87oYjLZBQg8HP/aeCEdGQkjpAHvBpZ98QlaWa4KzkIxXa7PttVXBfifF
         yaeUOERDUJ+LnfjKaBvef6aQif+CNSmr1CymhPITBZWRzIIDteKZxTBLDgLIcakiER6m
         +j7tKyjxgVMfG1FPaTKBC1eml4cjOudIILD1guld0H0QaOe3fs+0JA78IU8zE6kwyolW
         xRZWl9+EEO9bzRc/yQOgVp6UOZnlooqqxmcvK73Xv3N4xwSc2hcEWkcRph3fplZ8Qfiy
         Is1udSuFeWqLvMIDQcEAOQ2UUHjzUPRmAF/NG9T0e9CjbxboTCm2EiOplfFhStm0kUTl
         O4+Q==
X-Gm-Message-State: AOJu0YxWjoyCpFT1vXUfgdH2omSsLilAbWTsEF56taFv0kf92Jizw85w
	tDLEkhU5z72OQ1uPtS8morrap/rB2G70YMBHpY2jBn0QsfRzaFq1GK9f
X-Gm-Gg: AR+sD13O0FlYAGVvJN9FEeBA5Xwg6jCm1HveLQFH8kRHNoc0JhFMSKSLBiOEjAOwMnN
	ik1dAR8BweiR/nt+/ZtDiA9uXupwRiX8ue2XlBZM7mW8M84/Y+H1KRPvKh0+huASn8l8gF1i2p5
	eB2knEnXl2dMfgZaWsOPvwmc1POkS8y+W2kB7QSizOUzzo+fdlGhHRDvRSQtsmnz5MxBacg7R3b
	6W1EbVpYrCO0HfmxO9bBGvYMxYWZ6Jt5tsB2EpBNrxh78CFnBmARFn4TfeA5ELWurhR0ISY45pm
	CGN2LbEtvPoWBW4nr/c6th6l7YstVV/RPaC+6Kyw5KxYp7IQqrRmnguLFFl8NMSpadnyyWDjIuR
	pknNG2dsnyZ5XDELuvucJoW0ffVhtRcnQQ6BTRk7Q2WJ/FJvzWfNGUJZKl2kxZKCnqtHX7BagHw
	==
X-Received: by 2002:a05:6402:a505:10b0:69e:9213:11b with SMTP id 4fb4d7f45d1cf-69e921305c2mr2757943a12.13.1784625971092;
        Tue, 21 Jul 2026 02:26:11 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e7000c3e2sm5662961a12.30.2026.07.21.02.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:26:10 -0700 (PDT)
Date: Tue, 21 Jul 2026 12:26:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: Aayush7352 <aayushdixit924@gmail.com>
Cc: linux-staging@lists.linux.dev, Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] staging: nvec: fix power-off path to not depend on
 workqueue
Message-ID: <al87LpFW487A7DXH@stanley.mountain>
References: <20260721084727.79305-1-aayushdixit924@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721084727.79305-1-aayushdixit924@gmail.com>

On Tue, Jul 21, 2026 at 02:17:27PM +0530, Aayush7352 wrote:

You need to use your real name.

> nvec_power_off() uses nvec_write_async() which queues work via schedule_work().
> During system shutdown or reboot, workqueues may be frozen, so the
> AP_PWR_DOWN message never reaches the embedded controller and the
> system hangs instead of powering off.
> 
> Fix by calling nvec_request_master() directly after queuing the power-off
> messages, processing the TX queue synchronously in the power-off context.
> Also add a NULL guard for nvec_power_handle.
> 
> This addresses the TODO item "add atomic ops in order to fix shutoff/reboot
> problems" in drivers/staging/nvec/TODO.

Missing signed off by line.

> ---
  ^^^

This is a common thing where people ask the AI to fix the todo...  You
need to say under the --- cut off line that the patch has not been
tested.

The TODO is kind of vague.  "add atomic ops in order to fix
shutoff/reboot"...  I suppose this could be the fix for it??  Anyway,
Marc wrote that todo so we'll see if that's what he meant.

regards,
dan carpenter


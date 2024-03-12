Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766DD77F1D
	for <linux-staging@lists.linux.dev>; Tue, 12 Mar 2024 09:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710234083; cv=none; b=Kf6X6jo3flmQtDLvDB+B0xXWpwezOTB4AEaMz4cUn+YcNHxwJ6nL6qDvH5SUaW6vUfYNlhNHU/DQSQALrf+V0DWVJhCRqXUv+WP5W34BWUeCac5VzV1tNXp7GreWFHxHHKYCxPCCTebexA5GvR5RHPo/IzMX/RHgerh0r0dKkuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710234083; c=relaxed/simple;
	bh=8y2DQPNhzOaxdj9KvjXtszQ/bn5b2LagZPzqGN36x4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fFJ9L7xCnBEhJbCX1Y7D2JeupvvrpkseLJTIi+ame8drYGh0+n2BYflKWXDXpi6lQPjbZ8Ss3RdoIWfPiArpLvFeSWjG70AuJ4cHLuZPYOU94gAjLvguiTv2UnYghqsCW0rxIIWI29kbGrxom6SMmqCPn4V4yayq8JT5+dIo39Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x7O9aFIk; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x7O9aFIk"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-56759dc7ea6so6898379a12.1
        for <linux-staging@lists.linux.dev>; Tue, 12 Mar 2024 02:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710234080; x=1710838880; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JP3cfM7mrXURBm82U67JdNSwwTeGi+Ghi4y8x6qCXGo=;
        b=x7O9aFIkXi4gn+ti0ZUtSj5ryKYAM8/JyzLmTCtF2bcqO7PZuFoQ3Tg6/fqNaSuH7b
         UarLfI6yueKqq7/+kzrO8bArgL0JktcxmGjl7UwFefzmFOA6YUqUv1rf5oTwKNDSsiLm
         UUo23mkRC3KizhPhiOADSK6IGjren5yeIHjePU67n624ZyjEoR2NWiWUflywm8LcWxc4
         Ou4MOp6OLZv5if9NgrCgjXkLQBdfQ5OAaqxNQsZmx9LxdcsTwpzmOh92JvD78l8JZFxq
         NdT4Zqd4nd+6MMjFGAWG6VfwQHNAYVPfC8DCI5E3ihygeupKNQV/lKfX4Ox70Yq/FMc3
         ExDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710234080; x=1710838880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JP3cfM7mrXURBm82U67JdNSwwTeGi+Ghi4y8x6qCXGo=;
        b=LBZnYAKwlNU7qYug+KYjNmHVtmU97XgC9/jmlLTuPl2538rQFx2FYNsrs9Kc/iEAMb
         CR3xvyxOPU5ZKTHjOhKu0EGT6GEvtDoo57jq7iQzAMZ2Gi9vCtxo86vWR5blTk7GPBY5
         taWQuE/2FXdcViBYrtKpAU1rwKZqVOx9qIJewvVo7v7P95/I57hfJ3zWAuGIrHD1YxU4
         kEZFdBRLlANizpp6/eJo99mqmLn0C6VSeTfVns4kz4MdWjLWb0HrRdT5IYKjlNAbC4pS
         43kDHi5oKBumIk96r4/ZINSBpE1UtxwQgBh04UcW+WBixci/a3vH/cAMYSXwlOX5pDSL
         4GwA==
X-Forwarded-Encrypted: i=1; AJvYcCW/y/Ae1FYtpLGqphuxtZY4pweiI3/g3d6B4rQZQEvNtd+PnTXQA20VDhdan7d1R9ohn8jW6rm1ezAnV75rT8185GW6cR2KFvTqUak6JA==
X-Gm-Message-State: AOJu0YxwTnMU3gFSUiOpbtNjV3pVCtP+wOwavr5lf8qBrn5cfDglWIYw
	7Gn/FSl2luUmOzutKTFFte6K8Co+M9fkaRYBAIWrwoBPxoNNFlQ4MEqCvv6KL3s=
X-Google-Smtp-Source: AGHT+IHwZrGE81YKbF2wM23szbAhUXytldSEaYxhYVB3Q19LP8guhW/J6+kuxH/HMd/98tZmJuGXbw==
X-Received: by 2002:a17:907:c001:b0:a46:20c6:b595 with SMTP id ss1-20020a170907c00100b00a4620c6b595mr4009913ejc.5.1710234079560;
        Tue, 12 Mar 2024 02:01:19 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id qa10-20020a170907868a00b00a43815bf5edsm3643280ejc.133.2024.03.12.02.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 02:01:19 -0700 (PDT)
Date: Tue, 12 Mar 2024 12:01:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alison Schofield <alison.schofield@intel.com>
Cc: "Felix N. Kimbu" <felixkimbu1@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: p80211conv: Rename local foo to decrypt_check
Message-ID: <0ae5c6f0-dfb3-4c98-9798-8379f6206256@moroto.mountain>
References: <Ze9Ie67PCSvBU+og@MOLeToid>
 <Ze+JxSpqc/eHfCKn@aschofie-mobl2>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ze+JxSpqc/eHfCKn@aschofie-mobl2>

On Mon, Mar 11, 2024 at 03:46:29PM -0700, Alison Schofield wrote:
> On Mon, Mar 11, 2024 at 07:07:55PM +0100, Felix N. Kimbu wrote:
> > This change renames the local variable foo to decrypt_check in functions
> > skb_ether_to_p80211(...) and skb_p80211_to_ether(...), giving intuitive
> > meaning to the identifier.
> 
> 'rc' is typically used for cases like this. If the name of the function
> being called is reasonably intuitive, then 'rc' suffices for the return
> value.
> 
> > 
> > It also indents the parameters to match the the opening parentheses.
> 
> 'Also' signals that this patch is trying to do more than one thing.
> One type of 'thing' per patch please.
> 

The name change did force a re-indent.  The v2 re-indent was wrong too
though.

regards,
dan carpenter


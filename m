Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A58438491
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 10:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784111695; cv=none; b=r4yn2CdQqpVrt3uMkR2o0iFiA81j1gpLIfeBAP5ik9oIAVgK1qXSDKZ4E9Z4CXusu72ifQtXfurPaoc+CMQMpv/7AOYlihNISYgGPnk01bSe2BJ0/Bla9FBE2U7c9EgaEIGOT0eSCBlGZ319QGyZNb74OQXDyzbrKQnEdVTD/LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784111695; c=relaxed/simple;
	bh=HCd3dYdTzeSr0/x7Y7nuHdop6BQWGYF6ITMoFKwUxVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ep3YtWUhd6SWispVS/V4z9zCI1nb7uu5R1ybroQ2L+ZdGnMGYjDFmdT1sMlGQ8C6ZFN8/ndW2JpqbAH9LlVyrcXD0ZxIAS0TSLpPMGOWCnq31hL69afD1TtQnmXdYpexbipSHE9dOfTCd3Hs3yafRS4l0WUNzfR18iNVnFHAsUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ecft7Iym; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ecft7Iym"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7eb4d532e65so2029186a34.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 03:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784111692; x=1784716492; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ixbs4H/5miSkvcWWnp1MjSu7kVoZLo9FSG6aq3RRnsI=;
        b=Ecft7IymxsGKtHPYO1er0Yi6NcNb1Q8FY12oJDTWxl5jFykwqm91nSXDWH7U4jJ8s8
         IZ8i23gSjJY3etHLYXL/ZfjEax30p2YufRuPcC7CpCL0iBOvCNIUIWDanSZuCj68LzuJ
         bmSe2KU5BXRSTKrR11fXAORIyLcB7XcwXca+XUCTxOaOoPdxU0go+MOwFZpTXNS9IIFf
         G1tmg60bTdDIB/ZjTD6EEclksPU2Th6NNnpCLHzBH1oFRHC7b8mBu1qTjumlnFcpqwBg
         zx97U85eLPo1mz6Nq+YogPkbrNLiVyHgdld93dU3vfLpbW7ifupMKmqjfpGGAgyVP5H7
         G5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784111692; x=1784716492;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ixbs4H/5miSkvcWWnp1MjSu7kVoZLo9FSG6aq3RRnsI=;
        b=avp+Es47nuY8nt7OMSkKwogs/dy5+vtkBaZQr/wWnNmV/vIHAuazv8yuJK+JFdqGH3
         2xY+kxkF1HhT2DJ9J87o+H5qI8ADwO1MZGMwCBpnI338CqWwGyxkl4LFDU/9J5BZ9Afj
         YAQLmfNmYmurTm+uXnXMl7/nBoUa7CX75G0w0ycdfJEeEvnQGHP+3D+jzgDylX8H4dB7
         k4W4FuxnFmdzR7okiQl5L48HpOHEKGGAcShOsQoTGftTUAoSSfSZDtA7k52+3/KFKLls
         WbZ6xyyhs04Sb2FYrBwu3xODpnhLZtOthvUvgyE1m3zmMTQdpFWbNby9D/Nisyq/T0f/
         SpzQ==
X-Forwarded-Encrypted: i=1; AHgh+RqRw/ncy9QMn5iy+uabAfveIsWgIMPwVl3HUSe3EvsSFsqTw0sZWOAVPJn1woxZK/iYy8lifMQLkSlCv3mV@lists.linux.dev
X-Gm-Message-State: AOJu0YyWenT33azgIorszBl9/4L/x9kvYBi5rO19yO8EwdSmgvlQ3mtw
	wCQJfjTKAAfbg7skdn4Rj5cYeOgeExept3v9gM8/C46//eDbayta3F6fZACccWNnH4c=
X-Gm-Gg: AfdE7cmR+h2gHsVxf51947QRjoxbvNF3OrUOSJ6onC7jjWB+KvKAPIFpYlw6gygFG/Z
	upE80RFXCGbYoc9xDobZsd0Jc2uAWvrw6KkzyXGB4PPKODADNM/uRLryIVLRiGT2U3Sr6/Zdhmf
	WYOJZhupVEa/hBt8cSCjeFST9vfobTzTlDOLt1QVyB2Mw2WGTv2etQ/2yk6ItS3Emjx/rSRPdth
	KgliCEN+ZFtoG6HYkiZTqOtTh7i3P3k/TfrRVTgnzQiLL2J7a38xAvaon+NWFw6ZaK+hKFBCFe/
	5/ha9+P9KV7sIVELovzI+CcZbNiiLNDH6OPxzL9dwr1BgwLWnGzApu00jR3gb4/rHIJoV4sY6/Z
	GYqiDUGFsB7S5hEbBQGGgLprA0SDFb/DC1SSaJyzXYSyuG24X27qU9iycSm8ItRoqaGyBL3Sy1M
	7RMX0U
X-Received: by 2002:a05:6808:190a:b0:49b:dcb8:e2ce with SMTP id 5614622812f47-4a4961a042amr1770737b6e.39.1784111692466;
        Wed, 15 Jul 2026 03:34:52 -0700 (PDT)
Received: from localhost ([74.80.182.90])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1ad5a77e3sm15714428b6e.6.2026.07.15.03.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 03:34:50 -0700 (PDT)
Date: Wed, 15 Jul 2026 13:34:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: Cong Nguyen <congnt264@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix xmit_frame/xmit_buf leaks on
 mgnt-frame error paths
Message-ID: <aldiRDQTQd0eN4SD@stanley.mountain>
References: <20260714163525.175763-1-congnt264@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714163525.175763-1-congnt264@gmail.com>

On Tue, Jul 14, 2026 at 11:35:25PM +0700, Cong Nguyen wrote:
> issue_beacon(), issue_probersp() and issue_asocrsp() obtain a management
> xmit_frame together with its xmit_buf from the driver's fixed-size
> management-TX pools via alloc_mgtxmitframe(). On the normal path the frame
> is handed to dump_mgntframe(), which transfers ownership and eventually
> returns both objects to their pools (the frame and, for beacons, the buf
> in rtl8723bs_mgnt_xmit(); other bufs via the pending-xmitbuf/TX-completion
> path).
> 
> Several error/edge paths return early after a successful
> alloc_mgtxmitframe() but before dump_mgntframe(), so ownership is never
> transferred and neither object is freed:
> 
>   - issue_beacon(): beacon larger than 512 bytes
>   - issue_probersp(): cur_network->ie_length > MAX_IE_SZ
>   - issue_probersp(): kzalloc() of the SSID scratch buffer fails
>   - issue_asocrsp(): pkt_type is neither ASSOCRSP nor REASSOCRSP
> 
> Because alloc_mgtxmitframe() removes the frame and buf from their free
> lists (list_del_init) without placing them on any pending list, an
> orphaned pair is on no list and referenced by nobody, so it is only
> reclaimed at driver teardown. Repeated hits progressively exhaust the
> management-TX pools until alloc_mgtxmitframe() returns NULL and the
> interface can no longer send beacons or probe/assoc responses.
> 
> Free the frame and buffer on these paths, matching the existing correct
> error handling in issue_assocreq().
> 
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>
> ---

Looks reasonable.  Please add a Fixes tag.

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter


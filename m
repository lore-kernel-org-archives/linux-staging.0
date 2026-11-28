Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795855048;
	b=XENEGZKRTUpli7AUZ4xkk9xUyNepTlRfGbuNkcihkbTWGmWdLgDvN/HnIiZQ5CuAa4gT
	 XzT1mQBiPewtg/eIpetrXCv9fusmVoEpAx09J6L6dmNjwmeIbjQf9MTE8AjO6QopDemmk
	 V1TNXHOaQse/6nrN+NqoJRE5BZ4y15muyIYUSiDuh4eANRBJITlOZS2ML44z6ZxxstNlm
	 oYu2jZoo6oMfRTMq3qy3Yvm7IID/98ITiAONOmF9qFU0CSFsS90PbcMinGR8iP2Oyc8gY
	 rmmmUDpVp55S+6bT3soXkS5gtM19E0FazWTSfdqiEQ6m/KoDKK/5DSxZyfsOkChYuig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795855048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=JEtpdBbbvdvLBP+cSNBXw3uIn7TjORLG/mLD4Xk1AiA=;
	b=T8PetWSNQFeZsBo8M0Ln25oQlzo5hlUnWs7PoL8WgWbdwsNImIAG7mVdqX05Aj0QsMYw
	 3fypmVI6hoOzow5CLm9wITA7zgdoGDroLnw6+Djh0nYN0cVGNpK+iXSZnRxowtNHdQ3Zm
	 wtayKp3IwamrMfuRFqVq2bRlj3Zt0Wkfq0M791Bjkrn2dylHrPBSBFXq4MbzLeADb1Vfv
	 /5C6JdpL0Yyqf6sIVBSmlenD3fOmhHGk49XpHkeeTaldkrWeXe8mcrC9//YZMcXhigSrW
	 an/1f7fyLUT9NGvoUgDUfNAtXEJdzGoUMphDbeGXo8Y/jTiNnEGpSyGEwWEKz/u74zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mwcfSoU9;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070A7606A31C
	for <linux-staging@lists.linux.dev>; Sat, 28 Nov 2026 08:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 070A7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mwcfSoU9
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so90011515e9.2
        for <linux-staging@lists.linux.dev>; Sat, 28 Nov 2026 00:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795855046; x=1796459846; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JEtpdBbbvdvLBP+cSNBXw3uIn7TjORLG/mLD4Xk1AiA=;
        b=mwcfSoU9DyZXDy5uPPNfkay3hHHbvmo53Mf0S4EUeHcAYPV4oIXuMGBmgta3e9w+bK
         1o7qHBWZ89fWoFaHnRYIC3QYBgoxrFKCN8eZLIV6zpXH2fp6aaevrXbe28sQ/UHzgRTP
         weGscZjLwsF41yQepqbRPydtqjPSYd/BmgjQeWifk5G8pa2TQ8Sx3YY29T0TRg/6zg6K
         /CLRRXnfliYaiuR23lemSVufutjKlPTV7cjea0vVpURnioJFqFiYMhTWH6b1G8Ris9vs
         mL4gDvBXsbsWiDHmnjLtGCWJjDQTfC3Er2Wf1m+gPQhIrK5/LSytUB+QL6bTJPB0NMAA
         qxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795855046; x=1796459846;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JEtpdBbbvdvLBP+cSNBXw3uIn7TjORLG/mLD4Xk1AiA=;
        b=IBzzJP9PV6rxLoFSJywtETZo1bsHG7Ive43QvP+FGG/roSjelWOoLkcOfcr4eLbChz
         BjqMlvZbbCGazgKBFcvRJ310cuCudCmVU/Dir+zty9TXRbz41EuIe6fl/o6w22XSJA7T
         zJYYkYVg3csra9JdggsNDQ+LXoc4pptPYgBzH2R7a5fxcSEGaMPCO/l0TgfqfjKLiRtZ
         XZUnRbx+xSbPg5R3B3nan/hS2Fj9nmeq7FxmYR8b0CcuZB7DtTtGcd1gBBG6+Fjkl9dB
         tj8zvkhT2m330VrsAqPOnc7t6P3hLJLEihlAnUfF9slH67UJpwAwfs0opEELAfPvh7gH
         RzhQ==
X-Forwarded-Encrypted: i=1; AL+hErG9H/6o1lRrCkgV54JXIoua+tnSoa3p7gvzCLIl+Ty8Mtvf/CuB0ikVg8CA4uv+FiCcXPgkbt/EfIBeK044@lists.linux.dev
X-Gm-Message-State: APuU4Z+2CHH+7TIuBBfjDUwrXyhG60wNThr+DGbFS0w5yqp7/zpZInaj
	uKITVQzvrRE1Adtsk/l3tO6D7/e892C+dS+4qYCseKdVHNa2MRGXJh/SisU2tmhvPFdy2R4Q
X-Gm-Gg: AZFdTZckf9YXD2ETMdFLLllFo1Rx7eIVBI5g5kHc7vqrVtZ4yA8gUSf3qjMnftuOczz
	NdBmt6LX4YCtJm8fYfx9yHuvnVqrzf+V31uVMBQriZWkiZGWlKFtyBqKN70u4Dw50bW1tplOoy4
	aq8HsGs8NTmRmzkIj03YJjvZtwesNgB6HV0W0n+iPRjUj5jd7/LTiIZGE8VH5KF0IJOS/2i1sHh
	OEhBynZuEvfJtXzN/6wR5IY2NOUNJpq86C7gVvPXBrrIjhhNfeGIIxy+g3sDR2SloLay8bgQPuN
	TDK8qxm4FILv5Ag5Oygoh1tK1sXmJ5g1CfV++9DsQmIr+qollH+rkHlSka3wdmqNgOQPZqg6Rmp
	pdeobZM8ITsNa4/ADvL9uI8/p9HQ4YPGgYkrqEhavEIgc9TOeSMjczncbJOsMDnLODVvOXuCMdo
	Aj0SCAlCNUBp9+qeRIedRjjNekhxJyCC2SdgFwpmzE44BA41lpnVMu8byKgyVZmfPY14MhdjQGN
	e6Dj00SQHNib0eS1bfoWby9Y69goPIl2cO4oxOvYFNY/JEQovdmUFQ7nmTIc4qqHPFrLv6LB3vi
	y4b0/oLl0Zs0oq7n/dnJsMbnzKCRfnh+ZsWKQgfCL7E9xGJaSsGyXrlSb0CO7vUAI1aa7v/CcFI
	EA1hNhFDOlipD6MtfGtMBLzHnlRuPcTuzfWD2gy+7nTtHNvUB9+kq+juf/lS7MF5av7o=
X-Received: by 2002:a05:600c:1da9:b0:4b1:2026:6b41 with SMTP id 5b1f17b1804b1-4bb88819294mr563181405e9.30.1795855046143;
        Sat, 28 Nov 2026 00:37:26 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm52893674f8f.2.2026.11.28.00.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 00:37:25 -0800 (PST)
Date: Sat, 28 Nov 2026 11:37:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: akafelixab@gmail.com
Cc: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fw-management: align arguments with
 open parenthesis
Message-ID: <awqSwYyS4KWsxaYL@stanley.mountain>
References: <20261127-greybus-align-v1-1-4c096948e389@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127-greybus-align-v1-1-4c096948e389@gmail.com>

On Fri, Nov 27, 2026 at 07:24:15PM -0500, Felix Huang via B4 Relay wrote:
> From: Felix Huang <akafelixab@gmail.com>
> 
> Align multi-line function call arguments with the opening parenthesis
> to adhere to the Linux kernel coding style and fix checkpatch.pl
> alignment checks.
> 
> Signed-off-by: Felix Huang <akafelixab@gmail.com>
> ---

You're working against an old tree.

regards,
dan carpenter


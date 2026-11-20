Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158995;
	b=IbBB+XqKe41j5jQ0p6mxIbHmDUfehLpszFStaAOXCLiHLdGoYfAzULb7UKLw2v+LWlnV
	 IeQWqPN2JvEnIJIX4XBHcevFkq9KFs37kL8WB3I3VA7/DEeMaxo0CPISYmjK58fiuqaba
	 5U5jxpYcBf0CoderpnkZPfydy2McRamAuDZ5Uzb24+6GW3wT0UY1KKzwt/7y3WN0xcoiE
	 1twMdgpg6MLI/6V3t1RfNSEu0EM7vXVVvlqUG/CYcGb7v8iaXTO6wzg3zGbya41hu70lK
	 itNoVOAnMvC6yRClXzEM1BW4wv/zSMeG2l95TyQvq8QZwTtJbiOBSmNy1PL7t09hEBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158995;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=p30/LUS9Qhu8eYZs3n7RSezpPRdawgsQqIN23flkfxA=;
	b=YmMDxKuYQIx9NjGpoWPsv0drfzzi/m+8T+8A7e1g1XyKANS0T2EF4wq5xx6Gm+P54Clk
	 J34HoirbAW09+6CIr4hM+euLD9ptZZy+RPTPH+qGoVuz5/76ktQRSwKASCYokJvMNcGHl
	 X3LqSX2QzpnPPA89lPCUpmxp2ZnHRtOmIeFXQZdNFeR5k7oTo0jAnSo0BOA3bIpAI1zAO
	 TrQkTd6riVN4N3uLz0awf6gLxL9yH7ieJ+HwwWTdp11T3K0amO2Ij0tCyDBgCE0jc3dpl
	 nkt20wVUjmMrwSklJD/HBM1jzA4L4n+5m85eakp3/W2SI80IyIrHT+LIDseZpvTp/CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=IzbLOq8S;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E809A606A320;
	Fri, 20 Nov 2026 07:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=IzbLOq8S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 097491F000C6;
	Fri, 20 Nov 2026 07:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795158994;
	bh=p30/LUS9Qhu8eYZs3n7RSezpPRdawgsQqIN23flkfxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IzbLOq8S4vrSe3/pP3y1Osjo0TvxvwG7Rg8YkXGPQ6dzRfmra2qKSGkbYaXEXqJz4
	 L/WzpYg/HV85sqYSdANdBXy2in6h4hhOCAVRYgVwvwp1n2xFGVV2YCaXvt+FL8D1vK
	 lLFQWDD4Bb+nQ+7c/V1AT829tfBN7BuPchbxpjEM=
Date: Fri, 20 Nov 2026 08:16:32 +0100
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Zachary Aflalo <zac@belligerently.dev>
Cc: "parthiban.veerasooran@microchip.com" <parthiban.veerasooran@microchip.com>,
	"christian.gromm@microchip.com" <christian.gromm@microchip.com>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Zachary Aflalo <zachary@aflalo.com>
Subject: Re: [PATCH] staging: most: net: Preserve network device registration
 errors
Message-ID: <2026112021-walnut-apple-f7b9@gregkh>
References: <YT3PR01MB910878CBF3D8FF5F25367214AF712@YT3PR01MB9108.CANPRD01.PROD.OUTLOOK.COM>
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
In-Reply-To: <YT3PR01MB910878CBF3D8FF5F25367214AF712@YT3PR01MB9108.CANPRD01.PROD.OUTLOOK.COM>

On Wed, Nov 11, 2026 at 02:42:07AM +0000, Zachary Aflalo wrote:
> From: Zachary Aflalo <zachary@aflalo.com>
> 
> comp_probe_channel() replaces every register_netdev() failure with
> -EINVAL. This hides errors such as -ENOMEM and -EINTR from the MOST core
> and the configfs create_link interface.
> 
> Save the registration error and return it through the existing unlock
> path. Keep mapping -ENODEV to -EINVAL because configfs uses -ENODEV to
> accept a deferred link when the device or component is missing. Returning
> that error for a failed registration would incorrectly acknowledge the
> link request as deferred configuration.
> 
> Codex assisted the source review, implementation, and commit message.
> 
> Fixes: d4a8ce7f57fc ("Staging: most: add MOST driver's aim-network module")
> Signed-off-by: Zachary Aflalo <zachary@aflalo.com>
> ---
> Validation:
>   Built the original and final driver objects on Debian ARM64 with
>   GCC 14.2.0, W=1 and C=2, using upstream sparse at
>   84ec0658c81db4ccc4aabc420d3dc118c2c6a310. No driver diagnostics or new
>   warnings. Both versions produce the same unrelated sparse warning in
>   arch/arm64/kernel/vdso/vgetrandom.c for __kernel_getrandom.
> 
>   Extracted-function tests with mocked dependencies cover both channel
>   directions, registration failures (including -ENODEV), successful
>   registration, duplicate-link rejection, lock balance, and the actual
>   configfs create_link store function. These are native userspace tests,
>   not kernel runtime or hardware tests. No physical MOST hardware tested.
> 
> AI assistance:
>   Codex inspected staging error paths, proposed this focused correction,
>   checked caller behavior, wrote the change and mocked tests, and drafted
>   this message. The prompts requested a small meaningful staging fix,
>   preservation of existing behavior, and validation before submission.
>  drivers/staging/most/net/net.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Please read:
	https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh

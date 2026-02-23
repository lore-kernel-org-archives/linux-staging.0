Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB99D2C0270;
	Mon, 23 Feb 2026 14:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857655; cv=none; b=E0OcnGDiUfvXr9zNv3hzFj79pQo0Yj3JDubviF57m3Al6h0KwKjr3a5PyunsjuowWp0m3MYx7ijpEHUeJaxGjhRRXvrHJJyoIuZRIPcF8ImHHKxDXtW2LR7fObyk8tEj80oihfKzd7U5DxS+lvxXcWMxhZaM/gUKZsYLHF52U+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857655; c=relaxed/simple;
	bh=hcXEa9TWcdEu5dYuRFL88/1iEl/wOXE3JkZuIRtrHgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DIhRXNxCVy11w62zG47Q7oKDD2ctRZbRajXyF2+PAyZmpo5DOEli170NlNI6bv4YXctyyhGNZeB8hST0Rfv4RqXN8dVKnIuPdBL4hOZ45C8W0yYlWaiZ34CotBTecFie/2K4ZncnYI9+cWMXXVifdR7oyjvY7txhdTDT/Gfav3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=msCHEsvV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="msCHEsvV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F9EC116C6;
	Mon, 23 Feb 2026 14:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771857655;
	bh=hcXEa9TWcdEu5dYuRFL88/1iEl/wOXE3JkZuIRtrHgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=msCHEsvVB1g0slfnVOmLSG1+25+HHJbh9Id8KxMgKymwbM6nflqdH/19LNL552v+2
	 yE50DEUYgn8ntbU2v+jyWqFxJs3JEy24y6GqNzcY3UefoOZgXR71l+vNQuCdGqPLdT
	 GfmopWvZr3KA3dgAYALr2g/g2KAkq4vW53IBXyv0=
Date: Mon, 23 Feb 2026 15:40:38 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Esther Zilberberg <esty5664@gmail.com>
Cc: trohan2000@gmail.com, bryant.boatright@proton.me, bqn9090@gmail.com,
	dan.carpenter@linaro.org, straube.linux@gmail.com,
	davidzalman.101@gmail.com, abrahamadekunle50@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: rename supportRateNum to
 support_rate_num
Message-ID: <2026022330-defiant-capsize-95e5@gregkh>
References: <20260209163458.7149-1-esty5664@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209163458.7149-1-esty5664@gmail.com>

On Mon, Feb 09, 2026 at 04:34:58PM +0000, Esther Zilberberg wrote:
> Rename supportRateNum to support_rate_num to fix warning
> reported by checkpatch.pl.
> 
> Signed-off-by: Esther Zilberberg <esty5664@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ap.c        | 16 ++++++++--------
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c  | 18 +++++++++---------
>  drivers/staging/rtl8723bs/core/rtw_wlan_util.c |  8 ++++----
>  3 files changed, 21 insertions(+), 21 deletions(-)

Does not apply to 7.0-rc1 :(

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F248A21A459;
	Sun,  2 Aug 2026 08:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785658676; cv=none; b=VGCBUpJsBOcBgys9gzf5/vR7ww7sb/4pVm7IEQToKv67NEu7HLGzLfEwzQN11zArNYHjFiI/iF8HGwPwAaHFYtg0Ec3SWL8sOT9+CAUlqkkUWCHAAjus26/IFf0UyVCynHgSZw7MRtcNFXb7i2i1mjP/gW2HAxzeBZ3ecM95S4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785658676; c=relaxed/simple;
	bh=/rr4dIVlniLMRcOWG0pRfUyEoa9hoCYbp+VODY41Efc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQXUD8wm5OTg/rymKgfd0rpkIUguq2PGeCbdWzFmCvZ0wlV0wxDxozAQgWI7dpRMJd81+/8FPZrJFzIF1XQSZFMH9UtcMIaCR9BXbiM3Umc7OnFtJSfhI9WKsRf0wKfRRSqLGqrvD90FrvQzrYdaID+9Raw8ArOI1A0nz++V470=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BS1uLBQP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BS1uLBQP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA9B1F00AC4;
	Sun,  2 Aug 2026 08:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785658674;
	bh=nQWeyFXQrtHxIWTBIAhvrp3YdlM//HhGS5SAxkKwT3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BS1uLBQPO3FEI2zcOlao7Md0PKQ7ln3h1Q1+59BsmrjySX58Xm/sNyVnUjT3zaGvq
	 5/9eaxWEuAK0srJQx/cPDqm1sqUlwchQLe5NdOzkPZWnv//v4gLa5Y/TdbdCcc6KeZ
	 xXSeypwgntIBsbCUm6xbPZxyHxAD1gDn6wkdseWA=
Date: Sun, 2 Aug 2026 10:16:26 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: validate WPS attribute lengths
Message-ID: <2026080254-deflector-mystify-a2ec@gregkh>
References: <20260801174611.49470-1-acharyalaxman8848@gmail.com>
 <2026080235-reverse-water-861f@gregkh>
 <CAMyXUJm_m79_0D8a_PWLnouN7NaF4aBsd3r9doKWyrKncN0aHA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMyXUJm_m79_0D8a_PWLnouN7NaF4aBsd3r9doKWyrKncN0aHA@mail.gmail.com>

On Sun, Aug 02, 2026 at 01:57:09PM +0545, Laxman Acharya Padhya wrote:
> Hi Greg,
> 
> This was found during an OpenAI Codex-assisted static
> review. Codex helped identify the unchecked length and draft the initial
> change; I then traced the call sites. I should have disclosed that
> assistance in the original submission.

Please do so.

> The reachable path is through received scan results:
> rtw_cfg80211_inform_bss() parses a WPS IE and copies the Selected Registrar
> payload into the one-byte stack variable `sr`. The outer IE is validated,
> but the inner attribute length was not. An oversized payload can therefore
> overwrite `sr`. An attribute length of 0xffff also makes the old u16
> attr_len calculation wrap to 3, after which attr_len - 4 underflows before
> memcpy().
> 
> I ran git diff --check, strict checkpatch (no errors or warnings), and a
> Docker ARM64 W=1 build with CONFIG_RTL8723BS=m. I did not test on hardware
> or inject a malformed frame, so testing was compile and static analysis
> only. I will include the appropriate Assisted-by information and improve
> runtime testing before any revision.

Please test stuff like this on real hardware, so we know you didn't
break anything.

thanks,

greg k-h

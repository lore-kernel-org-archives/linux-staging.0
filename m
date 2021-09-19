Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831423FC3
	for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 09:23:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F29861212;
	Sun, 19 Sep 2021 09:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1632043380;
	bh=DTCVzhxy45g1bLfr51LF2BFS1ilTxS3Wra1hNpxEFAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ncechFSzFh++pC4C8gu0lEkSfzwO5ILTZmyFt76aI4W28vFKcjmQZNPUo8NbfTf7M
	 Q6ctNGwBW5DeabZ1my2rCaapZQp3+/vDeIlxPKKBzbYMenPkbapeoxn2oyBaTruLUl
	 lZb1TuqcdZiWu3TGYN9dsKPD11hIpK3rOxnc6Q58=
Date: Sun, 19 Sep 2021 11:22:57 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Ulrich Kunitz <kune@deine-taler.de>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, linux-wireless@vger.kernel.org,
	zd1211-devs@lists.sourceforge.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jens Frederich <jfrederich@gmail.com>,
	Jon Nettleton <jon.nettleton@gmail.com>,
	linux-staging@lists.linux.dev, Daniel Drake <drake@endlessos.org>
Subject: Re: [PATCH v2] MAINTAINERS: Move Daniel Drake to credits
Message-ID: <YUcBcaa2M6Ar86Jl@kroah.com>
References: <20210917102834.25649-1-krzysztof.kozlowski@canonical.com>
 <YUSZy0fH0oKuFsLV@kroah.com>
 <875yuxx7eg.fsf@codeaurora.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875yuxx7eg.fsf@codeaurora.org>

On Sun, Sep 19, 2021 at 12:05:11PM +0300, Kalle Valo wrote:
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> 
> > On Fri, Sep 17, 2021 at 12:28:34PM +0200, Krzysztof Kozlowski wrote:
> >> Daniel Drake's @gentoo.org email bounces (is listed as retired Gentoo
> >> developer) and there was no activity from him regarding zd1211rw driver.
> >> Also his second address @laptop.org bounces.
> >> 
> >> Cc: Daniel Drake <drake@endlessos.org>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> >
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Thanks. I assume it's ok for everyone that I take this to
> wireless-drivers.

No objection from me, thanks.

greg k-h

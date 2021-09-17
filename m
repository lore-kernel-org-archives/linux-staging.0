Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53973FC0
	for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 13:36:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D08EE6112E;
	Fri, 17 Sep 2021 13:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1631885774;
	bh=XUprm54eUjikJd8MsoP206lnyZ1x/5YgMkkAxcualnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ch4hDU0FrNLeJlcD/MK9a47DD9o7uxIfdXK6Dr0SR+A7syumCAoFnQEPC1JxpaUsU
	 bURNaHLgtY5Z++pe8+Fmacqdf7NKoYWJF8/jggJeiNP2VyHXkk+PpSlYlz1E8yJKmZ
	 Bi099NuqsCwnvPHd2VRmbffjiM0S1UHTLaAmSkKQ=
Date: Fri, 17 Sep 2021 15:36:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Ulrich Kunitz <kune@deine-taler.de>, Kalle Valo <kvalo@codeaurora.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, linux-wireless@vger.kernel.org,
	zd1211-devs@lists.sourceforge.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jens Frederich <jfrederich@gmail.com>,
	Jon Nettleton <jon.nettleton@gmail.com>,
	linux-staging@lists.linux.dev, Daniel Drake <drake@endlessos.org>
Subject: Re: [PATCH v2] MAINTAINERS: Move Daniel Drake to credits
Message-ID: <YUSZy0fH0oKuFsLV@kroah.com>
References: <20210917102834.25649-1-krzysztof.kozlowski@canonical.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210917102834.25649-1-krzysztof.kozlowski@canonical.com>

On Fri, Sep 17, 2021 at 12:28:34PM +0200, Krzysztof Kozlowski wrote:
> Daniel Drake's @gentoo.org email bounces (is listed as retired Gentoo
> developer) and there was no activity from him regarding zd1211rw driver.
> Also his second address @laptop.org bounces.
> 
> Cc: Daniel Drake <drake@endlessos.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

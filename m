Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E412D3228;
	Wed, 28 Jan 2026 11:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769598146; cv=none; b=ayNWocDbGk1P6XKHXNo7UQpwTo+gFLO8i3834IzcBg4+XRliKyGy4o7kGMK8wLIaKSGp0OW4dAJcE11rYAHvL/hy5TN/1D7K0+PRuAuShiD0zY1KG/RbLD/e4y65wugKaq2Wv3UXVto8uiIl4nSsGejrETLrwV8UN2R9eR5q9hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769598146; c=relaxed/simple;
	bh=wLSAw1yl41Qi3RyufTqdbX+sDfJy2ACDKrmyJvFxHwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3vaY/YDpeY4OsZrOaLIiI8XCPEytWebb39ZgUCf8VxAkt50yi5B/P7xun4+Em6rVdCnrAz/X+FKD4+TT1k5ih+TYci+cwdxey/jqsw3Zjbii684i9pmphRA2zEGIBtIXMVvpzJ7+/ViAEQh19nTCETbB2P/mKaISqLiPM2567s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Lm2Iphao; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Lm2Iphao"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67451C4CEF1;
	Wed, 28 Jan 2026 11:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769598145;
	bh=wLSAw1yl41Qi3RyufTqdbX+sDfJy2ACDKrmyJvFxHwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lm2IphaoNq7JrKufQbAOEWmxkSkb4apy96yabcAwuogE4zrsY2HOhCnxpLQk+h3jY
	 UO6WXGLUNG/kNGEhphi1JbTTbuBNlc6mLl8vlctEzWS1JeRSFVkb0zpOLLX5zSiLtM
	 DOQOq5H+o3EEkotb9TBNCYjq3T+Ag9voiLQjvZ54=
Date: Wed, 28 Jan 2026 12:02:22 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] staging: rtl8723bs: remove unused diagnostic
Message-ID: <2026012847-reappoint-playmate-03ec@gregkh>
References: <20260128004009.51095-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260128004009.51095-1-ethantidmore06@gmail.com>

On Tue, Jan 27, 2026 at 06:40:04PM -0600, Ethan Tidmore wrote:
> This series performs a driver-wide audit and cleanup of dead diagnostic 
> code within the rtl8723bs staging driver.
> 
> The vendor-originated code included a variety of diagnostic counters 
> housed within 'struct debug_priv'. These counters were updated 
> throughout the driver's hot paths—including MLME, receive, power 
> control, and SDIO allocation—but were never read, exposed via 
> debugfs, or utilized for any internal logic.
> 
> This series removes the write-only counters, the skeletal functions 
> used to update them, and cleans up the resulting unused pointers 
> and logic blocks.
> 
> Changes in v2:
> - Expanded the series to include the removal of RX FIFO overflow 
>   logic in hal_com.c.

Please slow down and give people, and tools, a chance to review previous
versions before sending new versions.

Take the time and review changes sent in by others as well while you
wait.  There is no rush here.

thanks,

greg k-h

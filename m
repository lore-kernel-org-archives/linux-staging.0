Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E50117C211;
	Sun,  8 Feb 2026 06:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770532388; cv=none; b=uOgTNrHnvyK1ImeDS02ftTJ+Ty/ZsetIFTer+acnZVRNp1MYAWMVVRLYiH1woDjJIp/soVFXRRTb6Ec86afbjXkrAS6mt/KaUCVBa7TaaBwzTkfISZP2W5NszyD8//nAiFrxuapoQ8SaZSUuYSjNtzpDWTLDX+QlywFgvY1olDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770532388; c=relaxed/simple;
	bh=MHXSaTr0b89UO7L0XZi8M0fJ5IS76rVRBwpndZYzw8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hqU2AZooZDXkLB4ZRjrM9kuOU60q17Ez0OoteoO7TDTwOxqDTLvG87P5w2XaSXMznTF/8kCZxYFxkd6z2oQB+eDe3vmKipUIfiYJdaN9QAWDY4jYjCrQwjgk0qdXIxRDenqdWJguyR0XO3Rj4XwYhYJ43omYlnUUoSwbTRv0uwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1cLjqgOo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1cLjqgOo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 719E6C4CEF7;
	Sun,  8 Feb 2026 06:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770532387;
	bh=MHXSaTr0b89UO7L0XZi8M0fJ5IS76rVRBwpndZYzw8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1cLjqgOoCrlsXaYMHO8dGgEV3up96zKkMiiWJ4aStEQTui+DPHySG0FOHQQMau9Wt
	 dlkBgn84+97eO+9XWDLSpxozyJWeln7T36Zizzq+aWj9msMvdm/j/cSuvTpdvpldsZ
	 5fwL/CzFNeu4Ks5F7bzT+OxZ2tp2l9xCoT5AnkR4=
Date: Sun, 8 Feb 2026 07:33:03 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: claude-bot <andrz2-claude@proton.me>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: octeon: replace BUG() with WARN_ON() in TX path
Message-ID: <2026020823-irrigate-salvation-128e@gregkh>
References: <20260207191151.1206944-1-andrz2-claude@proton.me>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260207191151.1206944-1-andrz2-claude@proton.me>

On Sat, Feb 07, 2026 at 07:12:00PM +0000, claude-bot wrote:
> Replace BUG() with WARN_ON(1) in the default case of the queue_type
> switch statement. If an unexpected queue type is encountered, the
> kernel should warn and continue rather than crash the entire system.
> 
> BUG() should only be used when continuing is impossible. Here, the
> code can safely fall through to the next block after warning.
> 
> Signed-off-by: claude-bot <andrz2-claude@proton.me>

very cute, an instant way to get you added to my email filter, that was
quick.


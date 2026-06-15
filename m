Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FAD3E9287;
	Mon, 15 Jun 2026 12:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526260; cv=none; b=HCnceAEM8H9ap31kJ1ZLfvX7IXhS/uiwH8QbmafjM04OuWZDYD1R93TXIY5YYny+Ed8PQuS7w90uy+s+YITTYo6MghEF+UkjpkgGnYpw3sScVjyfMupOyCraK9PfVwtt8nRAyowTlmKjOZgwDWbBP1/9iNIUmIL++5yXUgFJ2hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526260; c=relaxed/simple;
	bh=xw8flhbLz+yP7xIeEQhJBR6bY7sCnvAMktlMSUSdZao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KhipbYA4fo3I8+XhhNinrvgRc8Nc79QLKf1U2WqUx3yRM36Etlpg/Kia9qISHWT+XMT+lMC/jnw0RoELEaJCCMU/dXdBH5ybf51RJ45/DuKW9gScjxOzBI59FXJn4f7//GdE7szkNnav6hkw86r9cC4+bMH5EJEudddZt9gZulY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=A/aIjmdz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="A/aIjmdz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7BD41F000E9;
	Mon, 15 Jun 2026 12:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781526258;
	bh=xw8flhbLz+yP7xIeEQhJBR6bY7sCnvAMktlMSUSdZao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A/aIjmdzbUo81qkbOUSW7K57JiGXMEfrfSAoW2Ym/A+WOVB2+whHNy2R3tgHgNhcQ
	 FvqDAe9El0mYuqodFE1DNUNPH+S4r8kVFu9kyPgkUwq8T5U5rk/00C9dhLIkqt3ZZe
	 j6FMeSl52LsaxqZpG26V0W0xZ1qhCnEicEFKWiXo=
Date: Mon, 15 Jun 2026 14:23:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Devansh Soni <devanshsoni874@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix line length checkpatch warning
Message-ID: <2026061507-cryptic-regalia-d63f@gregkh>
References: <20260615121838.30825-1-devanshsoni874@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615121838.30825-1-devanshsoni874@gmail.com>

On Mon, Jun 15, 2026 at 05:48:38PM +0530, Devansh Soni wrote:
> Wrap a long pointer arithmetic line to resolve a checkpatch.pl line length warning.

Ironically, this text is too wide :(

Didn't checkpatch complain about that?

thanks,

greg k-h

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637363B19D4;
	Wed,  1 Jul 2026 07:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782890844; cv=none; b=uN6dZv089yoWydQQ11gMfYxWrDSN9A7Z9S1PAnFejY5RWxcNMAbD4oPK3nNGy0vXKO2nuqFJhXJUUxNcazeaxikfBNiC5/dwCl9jNxU5nt4OLkF/UuIIJU3ix8UGS4i/u8qkXFSkSa0sD5Q0eCbZAPdnWhsmyIvjt+FfG631K3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782890844; c=relaxed/simple;
	bh=kL4Ko6Xc29Pp5so90xsv42ogI031VEVlRnLpyBH9+HA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lr2R1M+NEWZKLOA6ZSPVSXMc11qj59lRe0cbzKgdBkenSZ8tTn1PighIWfrMebpckp1HL1QTk1ty9mXrENn8quXQ1JTMLtq+o28kG06m6P5WHIGXBJQxLP/GfEEnUVEoJow6vABfeE0uWZJNE0RQTazx1tWjQYaTh92LUfwVjp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qFc9RtmF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qFc9RtmF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F4D1F000E9;
	Wed,  1 Jul 2026 07:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782890843;
	bh=/kc9AR/tAUENxli4QG5sS4JU/ywSy+T5Uw5g7paAFUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=qFc9RtmFgl2IACn4op41vX6eta59xcj3WUOts2o9xY/loqn9qH1KcxtxSmTq3W11Z
	 IpDgDw48RERhw1Y1XwzSbYQNApcy7Qrt1iIDQmnxOZI8M4qbuSjZItjg4MCRU0DLHy
	 9gUBCDsU6buDGObW4bc/waUZbafGcTN6XarPNDVQ=
Date: Wed, 1 Jul 2026 09:26:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Miraly <miraly.dev@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: make g_fbmode array const
Message-ID: <2026070145-grimy-overstate-2d23@gregkh>
References: <20260701041423.7881-1-miraly.dev@gmail.com>
 <akSgaOdkxQHL2R7t@stanley.mountain>
 <CAOW+FoFQVdBXMVfF2n2eV0_2u71apaQM8fV+uO1JVasqcqq-vQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOW+FoFQVdBXMVfF2n2eV0_2u71apaQM8fV+uO1JVasqcqq-vQ@mail.gmail.com>

On Wed, Jul 01, 2026 at 11:52:48AM +0500, Miraly wrote:
> Thanks for the tip.

Also, always test-build your changes before sending them out to the
world.  That would have caught this error.

good luck!

greg k-h

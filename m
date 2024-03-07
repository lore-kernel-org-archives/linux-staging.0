Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7400112D771;
	Thu,  7 Mar 2024 14:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709821213; cv=none; b=dvcnBy/tIB5sqZV/OXhs1lc5xUp4Jps+/K4QutOC9NW2AKsgIISsn8uRfcfQiayRQPvi35gxoBiSd5Y5LIetyhE96U9oeAQl4BQgUvjDySWSX9dvUPPHzvMWyrITyBrzB7c8upchYRdTE6EE1QQ5qZRn3RniESjcKb4MFAO9Ifc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709821213; c=relaxed/simple;
	bh=3TZhUhFLzemnVG3NbJ/6WCRnFa2En8QawFXjo4iKeps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KyFf8oYaFJLhD/a54q6/0A0rS2cLR3Zk7Xc0IlArw5LBUNgHg5XGlfV4ieWOmItIX0xY78/lsPOpRa8612nOrZQlfCylIHBd3YYdSkp16J9RvDaOIBJP2mvHC9zjYNr6vCPtSRlqZZG8beRgWmGIRLiPqlXeGg0ytI4KCG3HMYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Yi0PVOIg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Yi0PVOIg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA0FAC433F1;
	Thu,  7 Mar 2024 14:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709821212;
	bh=3TZhUhFLzemnVG3NbJ/6WCRnFa2En8QawFXjo4iKeps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yi0PVOIgfs7zBNvwrnD8NFxCpXjXVzIQTWhzfzOOYsddHwTAr3iZlW+bukKqvvS2x
	 UQaIqIBGnyUuf+dBbn8CXzNkO0jTZlLqyn7g2BaVNYDqWjsvx1aHj0nAB/VsRBkV0v
	 4Va/JROBkWxYt9Zx7JlOHXHtIVnN/UEJ7hKUNa2Y=
Date: Thu, 7 Mar 2024 14:20:10 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Dorine Tipo <dorine.a.tipo@gmail.com>
Cc: linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH v3 8/8] Revert "Staging: sm750fb: Rename variable
 sii164GetDeviceID"
Message-ID: <2024030726-scion-buddy-9aee@gregkh>
References: <20240306054458.102288-1-dorine.a.tipo@gmail.com>
 <20240306054458.102288-9-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306054458.102288-9-dorine.a.tipo@gmail.com>

On Wed, Mar 06, 2024 at 05:44:58AM +0000, Dorine Tipo wrote:
> This reverts commit 30c83463c8dcdc808d4f10d44c5a4f19d3b5f1f4.

This is not an object in Linus's tree, or my development tree, it is
local only to your tree, right?

And you aren't saying _why_ it must be reverted, what is wrong with it?

confused,

greg k-h

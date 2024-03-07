Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C8011CBA;
	Thu,  7 Mar 2024 07:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709796096; cv=none; b=Sxy0N3+h4U54W7jnxImEasQYRtE7k8qoyoOzsQg75BYkB69Zn7vikwtEPs6DqXRY5DbOFK0banjuWMwgLzXGscOTq50I7IPxJO732om/desPpju/NQD5/5zZvF72zFvUTtTxgqsZ4p0QtIxsJsPsFJWjttD+nuic3ksq2gAL2bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709796096; c=relaxed/simple;
	bh=pwGfZFagaa5QyWZ1VZ29lOeBRCqY0dl0rhOjmxwsOnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vA4i8JbLo3YubgCaNpFeDRF09PQyCkxVS5erM62kcCdYHhG0Dh9svZExriXm0vojaPFsERMWFl1kLnPbyoU//vnymLiZpMeTA+HPCz5lBoTLrv5Sg7e8i+NgMkCApg5tWFh3a4bem1kRy67violvtYEu+UKR8w0Xu048VrBe/Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1eiOuU5q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1eiOuU5q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40BFCC433C7;
	Thu,  7 Mar 2024 07:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709796095;
	bh=pwGfZFagaa5QyWZ1VZ29lOeBRCqY0dl0rhOjmxwsOnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1eiOuU5qXsH6CQTtHzI+cFjcqGefpBk7k+JlbbftQXEKDH+1k+i8xCiAfNFInIwGy
	 Av1yvkLye0CJ/18MzSEBqY5+zrzTNe3g4Ns/cbubCbZayNhXM21nG3MOxOWtzs2tf0
	 3E9SBn84wGcgJUPP9tvkG7xejrV2PqmHxHGiFAeQ=
Date: Thu, 7 Mar 2024 07:21:33 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Dorine Tipo <dorine.a.tipo@gmail.com>
Cc: linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH] Staging:sm750fb: Rename variable sii164GetChipString
Message-ID: <2024030721-mammogram-exquisite-69e9@gregkh>
References: <20240305223248.38321-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305223248.38321-1-dorine.a.tipo@gmail.com>

On Tue, Mar 05, 2024 at 10:32:48PM +0000, Dorine Tipo wrote:
> Rename variable sii164GetChipString to sii164Get_chip_string to fix
> checkpatch warning Avoid CamelCase

That's not what this patch does :(


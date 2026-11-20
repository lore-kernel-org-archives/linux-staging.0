Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795159228;
	b=Mwm0awcg4M0usrMsxY0nDZ5eU07sle4tlb+F5XhtEmGq0VB4DxmuF445PpJk/XyU5P/e
	 b+vu6MyxAsffx7Xu3WPlgkevscVipY7yEYH4llutIUT9OyRJ4kyymvFpZZnjosBODzemU
	 ZiKjvBq5Cvo+KvplA4o0E7Ty+qjBD4HeDFRgIUje2MHd/U8/2jOzyPRjwsesXfoXM0ERP
	 ECKjE7QGACKsoUjc9VbDkH81qrtDga/ENIAesIR/2WNOqvJM5r3KxokJCsaQ+QvpQPKQN
	 Q7Uyd0jKB7qNXUdp7Bn0ECWdETtbZDLhKncG2ZY3oMDz5XJpqWNF2+4CwhPPqnGAbHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795159228;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=rlmh4El46/80bmL1Z/3vhVqRJEBs8WW4jx2RQebVOoQ=;
	b=XXfUkzDC4750wYh5Ka2pBKJ25ymxYMFjeA4+ZAS96ARqMOSEKgtpWqwrt81D8ZmFi/LD
	 QT5vdmaD7B5UfQ3ymP7SE6YldtLbpzgMCoSlhil1EIQK8nuXGgrlVohmUQXxXnHsq9PVl
	 fKSmZQMDDBj1395I88LR6FctStL6H3hlbc7Q8xApjmM46MthIuPIj+3FlyTyjOIO4T2Et
	 uBrSlKjE/x3JUAxTeOgYdjfFESRIypaSuySociG6AVMynjpVm1QCW2t/TZ0/9/s889PG/
	 fcSlt/UTfvECCd1FEvwgs5dXCNaJkxFf6fWXNxb7gIydG9smNp/JfxUgrWU6pUItsJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=KDDW2+Yq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDCD606A32A;
	Fri, 20 Nov 2026 07:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=KDDW2+Yq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6861F000C6;
	Fri, 20 Nov 2026 07:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795159228;
	bh=rlmh4El46/80bmL1Z/3vhVqRJEBs8WW4jx2RQebVOoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KDDW2+YqNaXBg6bjx9qMHuZ4pOFywmKYxV0gaB4jEnPvtLCmcVYosVoBYSEsJbj7k
	 /4hpJhyXPWQklN2inZ4/8GNTh6hoowRKgEoRSMeZsmCKk1fwSUwBZVuPHwDsGMeBKR
	 3ucp6B4Qu5UwFANpmGxKQoK8iBEOuYFYZuTGw30E=
Date: Fri, 20 Nov 2026 08:20:26 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: aleszlucero@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] staging: octeon: fix probe error path and
 pow_send_list matching
Message-ID: <2026112003-briar-freckles-de3b@gregkh>
References: <20261111-octeon-init-pipeline-v1-v4-0-5b4f8e613ae1@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261111-octeon-init-pipeline-v1-v4-0-5b4f8e613ae1@gmail.com>

On Wed, Nov 11, 2026 at 09:48:31PM -0600, Oscar Alejandro Sánchez Lucero via B4 Relay wrote:
> Fixed two bugs in drivers/staging/octeon/ethernet.c:
> 
> 1. Call cvmx_pko_disable() in the cvm_oct_probe() error path to match the
>    teardown sequence in cvm_oct_remove().
> 2. Split pow_send_list on commas using strsep() instead of matching
>    substrings with strstr().
> 
> Oscar Alejandro Sánchez Lucero (2):
>   staging: octeon: disable PKO before device removal in probe error path
>   staging: octeon: match exact interface names in pow_send_list
> 
> Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
> ---
> Changes in v4:
> - Build tested on mips64 (cavium_octeon_defconfig) with W=1.
> - Link to v3: https://lore.kernel.org/r/20261111-octeon-init-pipeline-v1-v3-0-e5581974fae4@gmail.com

Without real hardware for you to test these changes on, I'm not going to
be able to accept any of your changes, sorry.

greg k-h

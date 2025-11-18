Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B7836A001
	for <linux-staging@lists.linux.dev>; Tue, 18 Nov 2025 16:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763481674; cv=none; b=jiUvDqxWK0AqugSj/UeV/5yCu6HqcPYMpTsCE62/RZbCsc04/nhFBFU+5r7VF2bw6orgQglCFEX1bVmaYjnoWsHaq3mw7i8PU471It46TbOiG6nWqoWTQMOMkjgQWH1DcjskwEbqJBQWA4wib42XIjPdYwHjKqEwrj7vcuewwDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763481674; c=relaxed/simple;
	bh=o0uPaJYb2jainUggFeViLacLUYF3OUcC7gOxNTF2NNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CA8YljKtQiCxSSPQDWAFclXkekAStCVEQMedRUkZfsE4Se31ec60mA227P//Pmgj6DsJkX+k9b1Q+yFX2bJTeIb/i/RwSvc3AiMa/V8YbZJ3DVqX3hU0jQ1cce2ZnJAV/ucwEzKyTBqTZN273cLD3SsM3gUPYZMqJtG8Q+Pi324=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pJSgRcHe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pJSgRcHe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE23C2BCB2;
	Tue, 18 Nov 2025 16:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763481674;
	bh=o0uPaJYb2jainUggFeViLacLUYF3OUcC7gOxNTF2NNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pJSgRcHe5D3tfHiL3L/sKzDh2ukivMWCyUlshbr1lDRaWp6H97M5dbnOrjLgalVhN
	 GrTNwPgMyLHH5SZqutPUOc1ifsK19FBwOO15C/WABPbeBOk4FeIRKnwm2WPsCDk0yr
	 mKKxm1hqTW0PQO0+LJHcPJF73WQ8U8vw1HP5XvzzaqMZawyoaHtC/VcHGWef6G8FKr
	 fz2vlsafmDytzNXnHghMEv7mr5EgzACrXP7rQV+WElMzKozEmP5rJndRtYQ3YLOqpr
	 H5JLdJ4DwOsFZwb+g0ad5/as6Q18vOKTW4jVwxvt9wO/2mBWHe2J8jUkJ0cWi97PQx
	 0Diq3n0iybYww==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vLO8m-00000000397-3OZD;
	Tue, 18 Nov 2025 17:01:12 +0100
Date: Tue, 18 Nov 2025 17:01:12 +0100
From: Johan Hovold <johan@kernel.org>
To: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Cc: gregkh@linuxfoundation.org, elder@kernel.org,
	linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org
Subject: Re: [PATCH 08/13] staging: greybus: fw-core: remove obsolete S2
 Loader runtime PM FIXME
Message-ID: <aRyYSMDwXLjGiB91@hovoldconsulting.com>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
 <20251117181818.118139-9-ayaanmirzabaig85@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117181818.118139-9-ayaanmirzabaig85@gmail.com>

On Mon, Nov 17, 2025 at 11:48:13PM +0530, Ayaan Mirza Baig wrote:
> A historical FIXME indicated that this autosuspend call could be removed
> once the S2 Loader supported runtime PM. That hardware is no longer
> supported and Greybus runtime PM is stable as-is, so the FIXME is
> obsolete. Remove it and replace it with a descriptive comment.

Just leave the FIXMEs in place.

Johan

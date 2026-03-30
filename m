Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3A3379EF9;
	Mon, 30 Mar 2026 16:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886516; cv=none; b=t0uSVwOxDduYeY68xXvTwTfyHTSZ8vHOJ/ZdMOjUUofpWONU2bBq5bGo0B0zmJvabMbKIRqAtv7Tbm3Dq8C0zl/mDdk2hS4LhdagoZ8qNOqmdDmXX7p6HPsqWkL6ZsUrT6gVB+quNru49SGwcFpvND4+S95ZxsssZMSiwwA78t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886516; c=relaxed/simple;
	bh=K74b8mSA6aRLk89vOVNK7WuG6v35vkrCZT4l0hDZPjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNPqmDQDoU+p0q1GMCqBAmKhVEc7X4Gdz3UTlOyuyhZyASyBlMlUvUi4UKd0bLhgnxlf1hwOCPwFL7tRnko/6nUR0eroLrzC5406r2lcl9UrVjfOXbqexM4bf0qLC/LRkWOVJu/RbchtNbOIRvkyP3B/lrpIBJCcNSo9Be3bHv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=q9dUN+wP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="q9dUN+wP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE3CDC2BCB1;
	Mon, 30 Mar 2026 16:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774886516;
	bh=K74b8mSA6aRLk89vOVNK7WuG6v35vkrCZT4l0hDZPjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q9dUN+wPnJI4obfb4wO01TINUAQRF3ck3FgIL8s3EmAbTAM6+/EO9DWbw7Q37IoQz
	 8+mN889ulc+Ida5qeXiItdAKNnrm/aPYoOjffuA9bq2qo1v1fts4YVrrZj6eV6HGhB
	 bfDv4ANNuCxlw6mk7SuS9UpNaEd6vpyQ6Xr34aSQ=
Date: Mon, 30 Mar 2026 18:01:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Bera =?iso-8859-1?B?Wfx6bPw=?= <b9788213@gmail.com>
Cc: filippo.muschera@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: refactor switch-case
Message-ID: <2026033037-dust-stardom-08da@gregkh>
References: <20260328163357.163332-2-b9788213@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260328163357.163332-2-b9788213@gmail.com>

On Sat, Mar 28, 2026 at 07:33:58PM +0300, Bera Yüzlü wrote:
> Refactored huge switch-case to lookup table. Used if-else for dynamic
> values.

That says what you did, but not why?

And did you test this?

And why do this at all?

thanks,

greg k-h

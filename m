Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7A71F1318;
	Fri, 11 Oct 2024 03:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728616922; cv=none; b=R4SH4946fJqdnnSF8vMOmKAPWsnotagw8IYTt3RQJjcFUazjtnBd4QzGbEViTqcjEfYuaszVckMjt5DDPI+A52FOcCKM11AQAhlJzKd2cGipEjSTYt0nsBcg1R5+KmeEvRE0LnBGO7tAsZ8AQp4Wcnuoo2OWQiirxGQ9HXwcGv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728616922; c=relaxed/simple;
	bh=ZQ8DM+JUT1bUaulL25fpBSlUeHowNZGfXhGOIofbxLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UsoBD+vjkxQm5XUtvRhInr24zGy8MOnLPyewkIwPnUxHtUYYTzMiTmw73Rrq0lVOZuYo24DE193fTq+QtoL7h6Tu9b8GA4uv1HFfa8P1grbvO7Q8NGApOO3clMqqD8N4L6aVPY6tlxeR/oZtgcPPa87Qt8Z6stDrfJ/MnmoU/Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QIfp7FGq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QIfp7FGq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E80C4CEC3;
	Fri, 11 Oct 2024 03:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728616921;
	bh=ZQ8DM+JUT1bUaulL25fpBSlUeHowNZGfXhGOIofbxLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QIfp7FGq+T/UZC4UKtRMTrNazHr7WkTC/VKKUF+KKHL3NHfELJnJIhXwrGcI2/pfQ
	 v32RpiVZNALKqn1zEN1uA/MvukXy7UjPXuLN0zDE96JvF7DIJ70bkvMZIH+JkLEQay
	 MNXyazO94dXK0vXDZ8Urxm273sE3Uptq5SA7CXzo=
Date: Fri, 11 Oct 2024 05:21:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tree Davies <tdavies@darkphysics.net>
Cc: philipp.g.hortmann@gmail.com, anjan@momi.ca,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/18] Staging: rtl8192e: 18 more Style guide variable
 renames
Message-ID: <2024101129-relive-dandruff-d976@gregkh>
References: <20240917053152.575553-1-tdavies@darkphysics.net>
 <2024100902-jurist-outward-a6a4@gregkh>
 <e0cdfdd3-eebb-40c5-a845-fbc5e52364d5@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0cdfdd3-eebb-40c5-a845-fbc5e52364d5@darkphysics.net>

On Thu, Oct 10, 2024 at 04:17:52PM -0700, Tree Davies wrote:
> Awww, that makes me sad...
> I'll have to find something else to work on.

We have just added a bunch of new drivers to the staging tree, so
there's lots of new stuff to work on if you want :)

thanks,

greg k-h

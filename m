Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A0F3090EE;
	Sat,  7 Feb 2026 13:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770469922; cv=none; b=tN+pCnPjpe62O/c9D/GUlUKydMTZAkHoBjSDcaDoRR9sAqdRz0WXYlQ8ZJWVPMjwY+guwiNDjv7W9mr/qj7kdbRprJqaXGWIIrvYWyAOfzWkP6XNIqYcuioOBGKYUbjLpSPxwLV3k+Cwb9NFFDhk1fDIAbhdBxeadNJPNuB85q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770469922; c=relaxed/simple;
	bh=kp5Kw9w5Ll1S6z0riFyj0t3JX6mp6f4cV+oZpOYzdKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HcMK5EInaOCHbwD/M2BsoWQGjQ0jf7XMIAfebj71eyERSrUz/PnUnvQAvI32NWPRiYfMhKOt2M1QWqvs4p4PQnXOR/I5/nLqm4q9jUJsIsmLq38fZTTl7ZA/UFz53MQ8qOWMY0ZuwSXDGumZQbd2Xwn/mufcp0bwRc+akDWhOOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HMk3+PKB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HMk3+PKB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 264C1C116D0;
	Sat,  7 Feb 2026 13:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770469921;
	bh=kp5Kw9w5Ll1S6z0riFyj0t3JX6mp6f4cV+oZpOYzdKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HMk3+PKB6XHVLtdOJWiylzqtFOl52GcY3vz/z+dAihZSdin6ur4+BG4HagBxXz9oU
	 llCyfBD7HkiJMHI0r+sVwovQ+/gtl93wgJxysrjorloLaBKETVv1ULHeQMfZEwsjpi
	 JAcG9EalRRXZnNKBmo59SczU/IcH96oJEjGd4gRg=
Date: Sat, 7 Feb 2026 14:11:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Khushal Chitturi <khushalchitturi@gmail.com>
Cc: dan.carpenter@linaro.org, straube.linux@gmail.com, hansg@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/4] staging: rtl8723bs: rename LinkDetectInfo and
 clean up related code
Message-ID: <2026020731-zipping-keenly-ae34@gregkh>
References: <20260201113837.8531-1-khushalchitturi@gmail.com>
 <20260201113837.8531-2-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260201113837.8531-2-khushalchitturi@gmail.com>

On Sun, Feb 01, 2026 at 05:08:34PM +0530, Khushal Chitturi wrote:
> This patch renames LinkDetectInfo instance to link_detect_info and update
> the fields of rt_link_detect_t to follow kernel naming conventions.
> Local variables in traffic_status_watchdog were also updated for
> consistency.

Please only do one logical thing per patch.  This is way too many
renames to try to verify you got it all correct here, would you like to
have to review this?  :)

> Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
> 
> ---

No need for a blank line after your signed-off-by line.

> Changelog:
> v5 -> v6: Limited the changes to LinkDetectInfo renaming.

No, you also changed the local variables.  Don't make fake claims in
changelog versions :(

thanks,

greg k-h

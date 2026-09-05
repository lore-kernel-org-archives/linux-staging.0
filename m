Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1507A33998
	for <linux-staging@lists.linux.dev>; Sat,  5 Sep 2026 17:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788628559; cv=none; b=KE9UPZWzdEYZi3QeRsoIyG1XzM6G+Gp5Da6W8J1KCuMldXmQ5uNcCXb31oX8wMlEXrIJ1YiDwDOsZE/+2aN74DTr15A5eY2qfXIScBuJQKWBnHG0G7szTltZfaTP3yPR+/c2U6FUzIk/tySkqYfjhHBxKd3zNaZpB6p9WcwSjmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788628559; c=relaxed/simple;
	bh=a/mAZ4GyDKhKeaCxOW9wc2KxOaC07++fqD8ahXUmuJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nutdIZ2fmL6/suTCrptAsoPyS72Z+waB5ct2B3lU3t3nWamQW1julN3xQfPluZf3YDYMzpIItimowCE1u1G21fDv3AWsY4rfvPrOLJ7PximF4IfQUyujHI5NjFdGviXZ24ITupBY4c8UFsm/6V3fDVHmXg2GqeP8fZhtEYm3ND4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1appqKRG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1appqKRG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84AA1F00A3A;
	Sat,  5 Sep 2026 17:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788628557;
	bh=GDwuG/g/38aDQqJ/XsiC4T7mb3x86c4E4iUtbURVyhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=1appqKRGT31OOyduhQhjLkJpwmK3S720Qp1dgwUVnDUBEjrJcfGReF01MIRNP/m8h
	 g/B+o8oQfiuCX8z4MukRIhayvq5BlT8cMk0ihQnSIW+CQheTYHOTv9eqS4gn2Z9cZF
	 9gYR9gHX54lNYBHLJBnuZMn6jyutW123GkaSr4po=
Date: Sat, 5 Sep 2026 19:14:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hank Yang <s950343@gmail.com>
Cc: linux-staging@lists.linux.dev, b9788213@gmail.com, guojy.bj@gmail.com
Subject: Re: staging: rtl8723bs: possible dead code in
 GetDeltaSwingTable_8723B (5GHz fallback path)
Message-ID: <2026090527-outdoors-press-9602@gregkh>
References: <20260905132248.2951-1-s950343@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260905132248.2951-1-s950343@gmail.com>

On Sat, Sep 05, 2026 at 09:22:41PM +0800, Hank Yang wrote:
> Hi Greg and staging maintainers,
> 
> I believe I've found dead code in
> drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c — a fallback branch
> in GetDeltaSwingTable_8723B() that can never execute, since it uses
> calibration tables from a different chip (8188E). If my reasoning
> below holds, I'd like to remove this else branch, but I wanted to
> check with you first before sending a patch. Details below:

There are loads of "dead code" in staging drivers, that's why they are
in staging :)

If you think it should be removed, then make a patch to remove it and
submit it and we will be glad to review it like any other submission.

thanks,

greg k-h

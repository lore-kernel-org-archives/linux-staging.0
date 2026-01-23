Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B4C392B7C;
	Fri, 23 Jan 2026 06:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769149513; cv=none; b=oimM27O0XcY+YqeeMdDUzoO5dMLA1fOHD/ThwVcSsxckQyI44oAX59elZCHukC0wEwVVaUSUVgaaOSRoQOBOQX3NGj4gtS05B/isKaeKZ4eSZ0Hkxb59NBJzW29tG9PHhJNM11nzuDINH8eiE36A+0+ZGuAaRCPp9K9eDV95Bq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769149513; c=relaxed/simple;
	bh=nYSxau8ajxahXqxz06swgjJbuZBDXoRwj0nWUJfmVms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRnIisz8b0Ta5CsoCvGf9qEc7utsvA9OWfkiPRLeD3LIg4TKdHN0c7WuzhWwTeT+CgLOsMQ55GP9YHY8+oALBu20qDLw+eX6ZO5k6RoyU0MGqKE6MS/7rr5fqhr5a0p1fp1qAAGnEa6t8Gwduzhst8PaBKa1RdT5NVxhgx/46Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LcaFzNOk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LcaFzNOk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBAE4C19422;
	Fri, 23 Jan 2026 06:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769149511;
	bh=nYSxau8ajxahXqxz06swgjJbuZBDXoRwj0nWUJfmVms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LcaFzNOkpgn0I2Tjt/NalIKoSQALg0cr4Mxox7kG4UomuvOHTg5SkUAcOWncfpoYR
	 /OjEbdi4s1hnDX/fAebtl3OyOIhIjZcIQNbXhm8Cn4RThY12erKOnFT78JWhGrQiHl
	 nDZn4MHdlL/6tQQIevrrrBCkJ1AvggUqIShd8XCY=
Date: Fri, 23 Jan 2026 07:25:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Minu Jin <s9430939@naver.com>
Cc: andriy.shevchenko@linux.intel.com, abrahamadekunle50@gmail.com,
	zxcv2569763104@gmail.com, milospuric856@gmail.com,
	karanja99erick@gmail.com, weibu@redadmin.org,
	dan.carpenter@linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/2] staging: rtl8723bs: Fix error handling in
 _rtw_pktfile_read()
Message-ID: <2026012336-filter-starlight-0fb3@gregkh>
References: <20260122174125.2567008-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122174125.2567008-1-s9430939@naver.com>

On Fri, Jan 23, 2026 at 02:41:23AM +0900, Minu Jin wrote:
> This series improves error handling in _rtw_pktfile_read() and cleans up
> the code style to comply with kernel standards.
> 
> In v6, I have reorganized the patches into a series of two to satisfy
> both Greg and Dan's feedback:
> 
>     1. The first patch combines the logic change and caller updates.
>        The function change and the caller updates must be in the same
>        patch. If they are separated, the code will not work correctly 
>        or will cause errors at that specific point in the history.
> 
>     2. The second patch focuses purely on code style cleanup (changing uint
>        to unsigned int) as requested by Andy Shevchenko.
> 
> Regarding the logic change in _rtw_pktfile_read():
> 
>     The original code used a ternary operator to read whatever data was 
>     available, even if it was less than requested. This could lead to 
>     callers processing incomplete data without knowing it.
> 
>     I have changed this to return -EINVAL when the remaining data is insufficient. 
>     This is safer because most callers expect the exact amount of data and 
>     should not proceed with a partial read.
> 
> Changes in v6:
>     - Reorganized into a 2-patch series to maintain git bisect safety.
>     - Combined function logic changes with caller updates into Patch 1.
>     - Separated style cleanup (uint -> unsigned int) into Patch 2.

Where is the list of changes for previous versions?

Also, was this tested on real hardware for this device?  As you are
changing the main data path, that should be required here.

thanks,

greg k-h

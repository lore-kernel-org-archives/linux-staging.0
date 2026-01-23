Received: from cvsmtppost14.nm.naver.com (cvsmtppost14.nm.naver.com [114.111.35.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A5C33123D
	for <linux-staging@lists.linux.dev>; Fri, 23 Jan 2026 07:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769153229; cv=none; b=Bmjz59DtcTFAudpQFoEb1H0itKKWLWPGHls0fVpa+rxnEmeLN0sZVG9sgU02aEdFBLNnQUZpn7Rj31YQQceIgDJA9OonpvzsrW6OYYD7rUPvA7d8fG7rYXV6rBInu1q5faX43O2qIhM06ByhXW5j5QbhVSj0ejD+ET3pDxndpu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769153229; c=relaxed/simple;
	bh=s1UAQtP8U3z//KYR3og9X1ZJjemERauUV9c29QGPZjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s6QPn6qZ5j//DOVzt/VR9zP20xJ5JoBX0bEf1j+mNnpWIZA/7bzmf0hvuJscpUXyjGyGQieQ8AGq2Chgrj6EdjCm5ZLFnBWV5kjAtfGH/F43L6WITi2ggrWiMTb8k/OT4F5XR53qGe5G0ysz0GGpZwWEQiDdKFOZ0ZPEMn6IRCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=vEJjxuoA; arc=none smtp.client-ip=114.111.35.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="vEJjxuoA"
Received: from cvsendbo004.nm ([10.112.24.36])
  by cvsmtppost14.nm.naver.com with ESMTP id ZzfIonfbQh24PAgkDYNepw
  for <linux-staging@lists.linux.dev>;
  Fri, 23 Jan 2026 07:27:00 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1769153220; bh=s1UAQtP8U3z//KYR3og9X1ZJjemERauUV9c29QGPZjg=;
	h=Date:From:To:Subject:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=vEJjxuoAnPb9eH/gcKFSx5nYdSzFWIJqODFothxSNpuDTDBt/WnygcZB1HVbFvZDv
	 qXwIfSwzuadz5v/03X+ioqHZBAZukr9OwGeCORSPupUFDoLQ1Rm4LxwdHRToHwSvNx
	 6VCthb8hntoqrn6EoDTe8cvqg9Bt0toYWIkhGRdOUj1sJtv5rCYZ9ddWA36JfnGyu+
	 k1vL5lNKntUJYsYfqjlALWXckb8on7SEbG0T1YEJwYd/0oIHMf/P5/PNvhk2G7fzaH
	 q/+IQPYSOkEnOqQyRFKlUlreyrIxtpuTwKY8nAxmH9cUcLD+9VEHvLED635h+86GfD
	 kwmOxxvzOswwQ==
X-Session-ID: WqodKviOSOy+qvAbJxYk+w
X-Works-Send-Opt: 3dYwjAIYjHmZaAKqKBmmKxbwKqpYkEljxBmwjAg=
X-Works-Smtp-Source: PqnZKxvrFqJZ+HmlKx2m+6E=
Received: from JMW-Ubuntu ([14.38.141.199])
  by cvnsmtp003.nm.naver.com with ESMTP id WqodKviOSOy+qvAbJxYk+w
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Fri, 23 Jan 2026 07:26:59 -0000
Date: Fri, 23 Jan 2026 16:26:58 +0900
From: Minu Jin <s9430939@naver.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: andriy.shevchenko@linux.intel.com, abrahamadekunle50@gmail.com,
	zxcv2569763104@gmail.com, milospuric856@gmail.com,
	karanja99erick@gmail.com, weibu@redadmin.org,
	dan.carpenter@linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/2] staging: rtl8723bs: Fix error handling in
 _rtw_pktfile_read()
Message-ID: <aXMiwivUd_j79kZS@JMW-Ubuntu>
References: <20260122174125.2567008-1-s9430939@naver.com>
 <2026012336-filter-starlight-0fb3@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026012336-filter-starlight-0fb3@gregkh>

On Fri, Jan 23, 2026 at 07:25:07AM +0100, Greg KH wrote:
> On Fri, Jan 23, 2026 at 02:41:23AM +0900, Minu Jin wrote:
> > This series improves error handling in _rtw_pktfile_read() and cleans up
> > the code style to comply with kernel standards.
> > 
> > In v6, I have reorganized the patches into a series of two to satisfy
> > both Greg and Dan's feedback:
> > 
> >     1. The first patch combines the logic change and caller updates.
> >        The function change and the caller updates must be in the same
> >        patch. If they are separated, the code will not work correctly 
> >        or will cause errors at that specific point in the history.
> > 
> >     2. The second patch focuses purely on code style cleanup (changing uint
> >        to unsigned int) as requested by Andy Shevchenko.
> > 
> > Regarding the logic change in _rtw_pktfile_read():
> > 
> >     The original code used a ternary operator to read whatever data was 
> >     available, even if it was less than requested. This could lead to 
> >     callers processing incomplete data without knowing it.
> > 
> >     I have changed this to return -EINVAL when the remaining data is insufficient. 
> >     This is safer because most callers expect the exact amount of data and 
> >     should not proceed with a partial read.
> > 
> > Changes in v6:
> >     - Reorganized into a 2-patch series to maintain git bisect safety.
> >     - Combined function logic changes with caller updates into Patch 1.
> >     - Separated style cleanup (uint -> unsigned int) into Patch 2.
> 
> Where is the list of changes for previous versions?
> 
> Also, was this tested on real hardware for this device?  As you are
> changing the main data path, that should be required here.
> 
> thanks,
> 
> greg k-h

Hi Greg,

Regarding hardware testing:
I don't have access to hardware with this chipset. However,
I have
    - Reviewed all call sites carefully
    - Verified the code compiles without warnings
    - Ran smatch static analysis with no issues found

If anyone has the hardware and could test this series, I would
appreciate it.

Regarding the change log history:
Changes in v6:
    - Reorganized into a 2-patch series to maintain git bisect safety
      (addressed Dan Carpenter's feedback).
    - Combined function logic changes with caller updates into Patch 1.
    - Separated style cleanup (uint -> unsigned int) into Patch 2.

Changes in v5:
    - Split the patch into a 3-patch series (suggested by Greg KH).
    - Patch 1: Refactored return type to 'int'.
    - Patch 2: Added error checks to call sites.
    - Patch 3: Implemented -EINVAL logic.
    (Note: Superseded by v6 to fix git bisect issues).

Changes in v4:
    - Modified _rtw_pktfile_read() to return -EINVAL if data is
      insufficient (following Greg KH's hint).
    - Replaced 'uint' with 'unsigned int' (suggested by Andy Shevchenko).
    - Removed redundant local variable 'len'.

Changes in v3:
    - Updated set_qos() from void to int (suggested by Greg KH, Dan Carpenter).
    - Fixed coding style issues (suggested by Andy Shevchenko).

Changes in v2:
    - Added check for skb_copy_bits() return value.

Thanks,
Minu

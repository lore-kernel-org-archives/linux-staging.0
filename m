Received: from cvsmtppost08.nm.naver.com (cvsmtppost08.nm.naver.com [114.111.35.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E8228152A
	for <linux-staging@lists.linux.dev>; Thu, 22 Jan 2026 13:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769088803; cv=none; b=qpnmhmt3xEAC/6Mx0gt6llifjLBnfYqSxMveRoNnlYWh+xnut7Xf7sr9qDlY7QqnS6ZjbBs1Jh3UWG1VSUK/CcxdEjQVclTLy3YbYcAYn5HYZ5O/fKPpZjt1/DQrHF7UI9nlJ2Crwf5fDRnoEaW4kbWmUOsB1uKIs48iNTP8Hwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769088803; c=relaxed/simple;
	bh=4y1o62N3xAQOxOvp8ONDXg1Aa1ZRt0/m5Zfrx+fQ9WE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rmMB/HAD9Lk8d9BleVSlkvEl4zpRYSUQwriFZmfOcW8qrQr/MhBBMQ7ds2l/I3rq4GfdeDkdGtMCakBIRkycbQFHec3qm7OHUcwwNukmXx1/7arDv7iBxXR8PgrSSE/qGm9tBkjVFhhm9RsuSmk5qo3lIIfVJ2YYqzS6zpm+w3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=FXn+U7XQ; arc=none smtp.client-ip=114.111.35.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="FXn+U7XQ"
Received: from cvsendbo008.nm ([10.112.24.37])
  by cvsmtppost08.nm.naver.com with ESMTP id PT3OZVU-R-GOOwzHrAUYTA
  for <linux-staging@lists.linux.dev>;
  Thu, 22 Jan 2026 13:23:12 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1769088192; bh=4y1o62N3xAQOxOvp8ONDXg1Aa1ZRt0/m5Zfrx+fQ9WE=;
	h=Date:From:To:Subject:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=FXn+U7XQqJVeyec6KzmwiHiiycwNZ8nTH8+XtAO7V0qNK2R74o+DYE/z+5lRwCYun
	 ES2JGKQLgPIhOiLb0rBeip0QiBeVsJLWUOsCoKhoFml3DxqiKsAGdrlFYuyYFY1nok
	 mElkTr8SEqAwOs9nXkeIdvZO0nJRkHL/918ont6CVcTxMMcmI2MFPTO1WvBK6RB1YD
	 LakElTixJ57ArgWCEqlL5siYik7bNIQhkJsLV4Yxy3o9Azis3hhwb7QXNtCjTPd+Lu
	 I11CHsHXZF32m6Jn+VIaiUVZd8vaS32Hrw50iAvvU7Lifi99QYm2mqF1JwqOCkSqYG
	 6ZFkQ2FWVGmbg==
X-Session-ID: c-QivvWmTqers+47XqNDRA
X-Works-Send-Opt: 3dYwjAIYjHmZaAKqKBmmKxbwKqpYkEljxBmwjAg=
X-Works-Smtp-Source: Ydn9KAvrFqJZ+Hmwaxb9+6E=
Received: from JMW-Ubuntu ([14.38.141.199])
  by cvnsmtp005.nm.naver.com with ESMTP id c-QivvWmTqers+47XqNDRA
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Thu, 22 Jan 2026 13:23:11 -0000
Date: Thu, 22 Jan 2026 22:23:11 +0900
From: Minu Jin <s9430939@naver.com>
To: dan.carpenter@linaro.org
Cc: gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com,
	abrahamadekunle50@gmail.com, zxcv2569763104@gmail.com,
	milospuric856@gmail.com, karanja99erick@gmail.com,
	weibu@redadmin.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] staging: rtl8723bs: change return type of
 _rtw_pktfile_read to int
Message-ID: <aXIkvw2bVfQwpqWF@JMW-Ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Dan,

Thanks for the feedback.
I'll drop the type-change patch and reorganize the series
into two patches for v6 as you suggested.

Regarding the return type,
I’ve audited the call sites including set_qos(), update_attrib(),
and rtw_xmitframe_coalesce(), along with their callers rtw_xmit() and xmit_frames().

Since these functions handle errors immediately and exit,
I initially thought a negative return value would be safe.

I'm curious if I missed a specific scenario in the current code,
or if your advice is more about general defensive programming—such as avoiding
future risks like implicit casting or pointer arithmetic issues.

I’d appreciate your insight on this
so I can better understand the preferred approach in the kernel.

Best regards

Minu Jin

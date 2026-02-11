Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1722353EDD;
	Wed, 11 Feb 2026 08:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770800395; cv=none; b=Ltb6ots0fUxD9XTB7Ae46HWadWZD3CgvJXM2FDrSnHT7sl1r6/8euh38ZVnFDnJfkVEVK8hvAKSKjRT9ZLkdb7sxQzutp9Tb3K37phifbi9eFhiRihdLkj7aMoPh2uZzVT/yAhjnGTxAisuzMC3sdXqipTncT7RhLp6V4qB8EiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770800395; c=relaxed/simple;
	bh=07grTX2RQ13vn6xpiUgEy7HqCUwPiJDQPxtfMMaadPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YZnWmHySIhqc//f67O8JlufFR+bBTyn+pYfFtDIVP/Sgp65rDOUw/rH8V/VxhMTP6QB8INLFQ1bwM55QwbP/m1nRj4RHvFvLyjC5m5BE82lz9n+1LHU2uM1EPH84mjMcbzM2J2yjAa13gWXyd8i8FCObjQK8R+LJLVD6HdepFQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=d7DJbowf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="d7DJbowf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A98CC4CEF7;
	Wed, 11 Feb 2026 08:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770800394;
	bh=07grTX2RQ13vn6xpiUgEy7HqCUwPiJDQPxtfMMaadPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d7DJbowf5NXfPJodMhr8tN8PzWc2BgtYOEelWdZA0J2AEqKkL0911rs0pUTDpftS5
	 mtAuantViJ5YfjojL5O2NANGB5/goHbupT+dmbX6InJ0Mu7Vlf8VJMiNgiSZMUvghR
	 QMhJ3owp5doTtC+87FxaD5VEpmEPw1LZR+OmPoTQ=
Date: Wed, 11 Feb 2026 09:59:50 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Juyeong Jun <juyeongjun.knu@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	grizzo <grizzo@ubuntu22.04.myguest.virtualbox.org>
Subject: Re: [PATCH] staging: rtl8723bs: split multiple assignment in
 osdep_service.c
Message-ID: <2026021137-buddhism-upcoming-392e@gregkh>
References: <20260211070412.5231-1-juyeongjun.knu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211070412.5231-1-juyeongjun.knu@gmail.com>

On Wed, Feb 11, 2026 at 04:04:12PM +0900, Juyeong Jun wrote:
> From: grizzo <grizzo@ubuntu22.04.myguest.virtualbox.org>

Something went wrong with your git setup :(


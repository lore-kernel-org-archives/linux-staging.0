Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B94F101F2
	for <linux-staging@lists.linux.dev>; Fri,  4 Apr 2025 06:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743746975; cv=none; b=LAnLtKjvM5e8jVE38UJlS72W7XTkA+JYJ6MjghKdY4Jv17Z/WPWb8+pHlQ08pAIIBOjntLIa5pO7xO0h39c+vVCS2X9hHyD8XgQCODgpTmzdL+H+6lPcaowvkFm/mAVUYda0SNbClUy1BQYjwyywTwfCFDzHQaseQkevYTMwHHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743746975; c=relaxed/simple;
	bh=Xse6i86w7uL+uBHsTtLcrH4fIkWE8uTV4DY/AU1u7xI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=prXbdlIP/bZ/7640GwZ9P8RiaVbtWURyoubZmz2t5Z+D61/qE/BaZmRx+pP01Tr7kJqHQSeJhraard3YOEL0d6DHmm3oF9tQF0RRUCKMjol4jCffMnaug/AYuPjZVTVUgz7zan7RDC6XswSrQdfvX69kY4yk1D4b6drVyXjHkzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=POXFsGbS; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="POXFsGbS"
Message-ID: <8e92451a-4d43-1836-ce5f-afb6a523115b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743746969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s3ZEIq+4SibMBcoXaxA8ucdTFz2oIn6GEaZjqQ0jTDM=;
	b=POXFsGbSvl2/qikVkQBoJpCGgep+OdzeFK2YhSkyhU2aC+dcabuIgMVeClzdT+MFY5ceZF
	RTovSsssX0s/jnReLrIxXQQAse4qYdwXSxZOj0nV14qHE7oExeoqg8hIkNF4ByvrZUH2zv
	UmpTz+1vLV+XUechTGZu4XHc1Lnsw4A=
Date: Fri, 4 Apr 2025 14:08:38 +0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH] staging: gpib: warning: variable 'nec_priv' set but not
 used warning
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dpenkler@gmail.com, arnd@arndb.de, dan.carpenter@linaro.org,
 everestkc@everestkc.com.np, niharchaithanya@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 sunliming <sunliming@kylinos.cn>, kernel test robot <lkp@intel.com>
References: <20250321010649.10918-1-sunliming@linux.dev>
 <2025040310-poncho-armband-782a@gregkh>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sunliming <sunliming@linux.dev>
In-Reply-To: <2025040310-poncho-armband-782a@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 2025/4/3 22:08, Greg KH wrote:
> On Fri, Mar 21, 2025 at 09:06:49AM +0800, sunliming@linux.dev wrote:
>> From: sunliming <sunliming@kylinos.cn>
>>
>> Fix below kernel warning:
>> drivers/staging/gpib/eastwood/fluke_gpib.c:196:23: warning: variable 'nec_priv' set but not
>> used [-Wunused-but-set-variable]
>>
>> Reported-by: kernel test robot <lkp@intel.com>
> Please link to where this was reported.  The report from the robot will
> have the needed information in it on how to do this.

Get it, I will resend the patch to fix this.

Thanks.

>> Signed-off-by: sunliming <sunliming@kylinos.cn>
> As per our documentation, please use your name, not your email alias, on
> the signed-off-by line.

It's not my email alias,my name is sunliming too.

Thanks.

> thanks,
>
> gregk -h

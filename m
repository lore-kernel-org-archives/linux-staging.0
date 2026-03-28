Received: from outbound.mr.icloud.com (p-west2-cluster4-host5-snip4-3.eps.apple.com [57.103.69.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DA1342144
	for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 14:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.69.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774709524; cv=none; b=KpzHPJ9nul5ePP2T2QAYC/iG2bVJrsfylryPJElNcXLIFTkJvrGUwxGRXeBDpC8NON+LTJH4TM0iQrNP/y2N3LKjrXitzekKV6dhC6ppDwHUnArvQD7XkdTAAkBFEpgBuztEd7ZElbZowMcHAiM8ALS8ti4RWSGMBNEh0qHdw6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774709524; c=relaxed/simple;
	bh=WFwpbURU404bVhl+d2pvP4V318d/hvaWHv1wRC1I4E4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OmoZCbcj1+epUxNK0qzzX3tqUEAWtuER9Mk51AbSDdEmFE4YPrEVO0b2bvxnoiGw7jSamXShYhZyjSwC4sKI52RFMl9Kwu3CDSGt2YWeNpRpu5YfBcUEcJRlQg+TS/yQxI6lE4JJLJRs+1SjJQTBZ2xVgLGEo9CVvfbeYY6V1MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=b1Yw1dKF; arc=none smtp.client-ip=57.103.69.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="b1Yw1dKF"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-8 (Postfix) with ESMTPS id 1F7EE1801CE3;
	Sat, 28 Mar 2026 14:51:59 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1774709521; x=1777301521; bh=XtAt2KO1shOSvecZrU8Dkaw3WH67f2TehIPpq93+OM0=; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme; b=b1Yw1dKFDxjxyNLL3vnm4juXR+4sQYNkwPOw6/JrbI9j8SY3y/9G2OwldSf9wBWJNgfKhJN4BstMjSTk8YzHYgBQw+P9TtWIsHovx9j7p5lfPnWPhrYwUWCa2Of1nSXPYX5Kb4y7m/CivEeeYIobGuB41UB8hL3uiOU/GtnrY0kjSP7AW/y1hw9ZquAYZzQXLqRF4Tga3duyaaUwL9H5oOoyw0pjmOR2kRIju2hEDXIPQYmltuvr7WagISJNDQ1funDt8noYgGmcx9b79HnU4Ygr5VSggXOs7faDrZkhqhIfP9qWt5d5AXQJZCQBq5E/Z4Vx79kRNLwEMtD2L2TV7Q==
Received: from [192.168.178.67] (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-8 (Postfix) with ESMTPSA id 6D96F1801CDD;
	Sat, 28 Mar 2026 14:51:57 +0000 (UTC)
Message-ID: <6c54c6bc-7c1a-4a3b-8135-eb9c5925c9a8@icloud.com>
Date: Sat, 28 Mar 2026 15:51:54 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: audio_manager: Add missing newline to
 sysfs_emit outputs
To: Greg KH <gregkh@linuxfoundation.org>,
 Shivam Gupta <shivgupta751157@gmail.com>
Cc: johan@kernel.org, elder@kernel.org, vaibhav.sr@gmail.com,
 mgreer@animalcreek.com, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260328044527.10489-1-shivgupta751157@gmail.com>
 <2026032850-riverbed-distant-f96b@gregkh>
Content-Language: en-US
From: Hadi Chokr <hadichokr@icloud.com>
In-Reply-To: <2026032850-riverbed-distant-f96b@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI4MDEwOSBTYWx0ZWRfXweZTdG6sVWyP
 khYnRXIYfdxSLdt2i64uENj2WsZlhyhdgKEYxVQB26NPaAr7iOUWvKGutmKge632fQKVP0lbpdJ
 yRjF5efAph0ZQdvkNKMy1cCkefQtnMeKFH1wjsIBDCqhgtVckNYZ1wvGxkCsDufhJ8urXva1I9t
 BBByAriIignw2Qbt1HKdieUPVjT3TjWbL7ZN4ufir+GKNKOSbcXsdJDSVAC0MlMy8kza/WF3Y8y
 nICduqsAHSnhVf/GfV2yv9uN+pyObrHNOSQYlpcUzknaPQdsdYQldnZT3/GmW1jHX2UoJaWygE1
 AYna7tKXu2MSkcRwZoNM9yE/Nsox305sZfOM7Jr8DVLF6xjaBGG5dq0lEiUvoE=
X-Proofpoint-GUID: 6DVosfPnyux8w8fRN7IebEbeYdMtWOlu
X-Proofpoint-ORIG-GUID: 6DVosfPnyux8w8fRN7IebEbeYdMtWOlu
X-Authority-Info-Out: v=2.4 cv=bo5BxUai c=1 sm=1 tr=0 ts=69c7eb11
 cx=c_apl:c_pps:t_out a=9OgfyREA4BUYbbCgc0Y0oA==:117
 a=9OgfyREA4BUYbbCgc0Y0oA==:17 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=x7bEGLp0ZPQA:10 a=r945xf9LNZYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=c712CcIMuawOq68mQ6kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-28_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2603280109

> On Sat, Mar 28, 2026 at 10:15:27AM +0530, Shivam Gupta wrote:
>> sysfs_emit outputs in audio_manager_module.c do not include a terminating
>> newline, which is required for proper sysfs formatting.
>>
>> Add newline characters to all sysfs_emit format strings.
>>
>> Signed-off-by: Shivam Gupta <shivgupta751157@gmail.com>
> You just changed the user/kernel api here, are you _sure_ it is ok to do
> so?  What tools just broke or were used to test this?  What tool asked
> you to make this change?
>
> thanks,
>
> greg k-h
>
I'm not the author, but I've been going through the staging tree, 
running checkpatch on various files, and reading documentation to get 
started with kernel development. This particular file 
(`drivers/staging/greybus/audio_manager_module.c`) triggers checkpatch 
warnings about missing newlines in `sysfs_emit` calls.

It seems fine to make this change tho, as it reflects the proper kernel 
API documented in `Documentation/filesystems/sysfs.rst`. One of the 
examples at line 266 shows the intended behaviour as:

     static ssize_t show_name(struct device *dev, struct 
device_attribute *attr,
                              char *buf)
     {
         return sysfs_emit(buf, "%s\n", dev->name);
     }

So to answer the question: checkpatch flagged it, and the kernel 
documentation confirms this is the correct usage of the function.

Happy to help.

Hadi Chokr

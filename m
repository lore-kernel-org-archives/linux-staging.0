Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E444C36BCF8
	for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 11:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770809321; cv=none; b=hyv8XMcNuppW6GwpZOvQxqGF4SxnfaQ5xDqczoTzNeogR8na+1X23MggIcfNCEZXY95JfI0/AHB6pQ3NtE2DVM/F2V+i+vMAPI6bAV24ABZaWtP31ymal/VBagWQmlsxiSOaOTW5n+AFt2uypii4dt5M2v+CmIC70pRy8oMWTwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770809321; c=relaxed/simple;
	bh=zjRfCYvn0HwOiG2N5SXplwll2RdwRZQpqPt75JDx4Ug=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GSoYHkTksLAKqLKycGhN+8gYJfR1SPQbDv8XzxrcNBFr8YtbgjfDOks8rGUnpiR1N9MyQ11OvgELhQIPNCDlDI8qrFBb0mdAUivhJbFSyD47mAC/M1Xnlj1zZ+ZPEl4GshvaYkVX/7qJwSkFT8I7bEGcsO8klS9OREttSj7hYao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iuuMKF3A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YiNXehVG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iuuMKF3A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YiNXehVG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B9lf2T2943328
	for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 11:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DE71sEnrIUr94aD31JpJQGVqAEN/siC6VuNOhwJ+Du8=; b=iuuMKF3AspdoE8OJ
	OX29Z8DkqKXSNTdJwKeJ1yxJZEkkzcCyUA8aiSGDFZwD4Un9KE8iKrmFv+aoCs1P
	tfUKAVY2/+FsbQ3trVH5QhDJRkHvG+L1BT6AwB1jnoecKNwbvVLmSHG2/a76pyDK
	7PhdjgI/mbK1X1nDDzydj6KOUpg+umdPNI0smb2Vwjl3CvwCaN7taaKdumY2mXpE
	SojTchVMgWUorHUiTjXQak/vDzw0Vf/F0fmTUOD7UpQgmhwCQTnGkZ1IdcoZGxri
	fJ6qg7kxiex8CmUtip6ALwXKqELcnZB5cMYBs5H7DayZg4GZi5TWBzaLiXfqMx+R
	xOha+A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c88r737wp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 11:28:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a289856eso233191085a.0
        for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 03:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770809318; x=1771414118; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DE71sEnrIUr94aD31JpJQGVqAEN/siC6VuNOhwJ+Du8=;
        b=YiNXehVGfnMaHubzxn4r06PL/OMMA6o9BFc3jbwBX381gaYMkcQFQNig4XWyDmn7BS
         0MwD795FRUcYg/Tvvrr/3+druMpiB94HhqGHYdncZl3qlFC4h1jG0pEGabuwhj13qQZk
         gl2C5JZMPTv7Ph8275GNx7XWl2nuEJknhiAt+RBHToZiUq+FG7NhuxVO4Z7WTvhYzKVf
         Ayo+G9Ju+1Xp/bPJNJi5BsDRbr3gq3ZxENbhTHwpgg1nyMWhP+kNBqEj9HMuFMgloXXU
         yp6TD7GU0aLl9uVfLxjAzBlszzERIcQMRybD+OO+nBiqOsdy2huOKftrpiVfXsWuy9iQ
         gBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770809318; x=1771414118;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DE71sEnrIUr94aD31JpJQGVqAEN/siC6VuNOhwJ+Du8=;
        b=kA9oQnl8TMRSKwxi3RYFzZdHn1QQuYENGDghMmGWlZOE0X0Y/OxZHUg6jDC2oAwkgK
         8dWtOAQ+HBz8BfT8+FXwGGeEYLsmERWewPZbdmMX8V+QZC2zrSQe8h1LRfFFJiVLqfgg
         s4/uwsEpFEm4CXx0XQrMJXBnRiK+VbCGjR9WwVz+APFIpiPT15Go8TyY/3U1jv6BObjz
         XoG2P7D8MJmsLkh1yjDXF7NXR87xipuAflSTVUende4gluYHoNN9PPJbTKp/hCbT8r0m
         YCy+eGwJ0pUEfg7co+Nrb7BLLEi6RbpZ8OJEX8MEP0AWmU0YvhKfpRlP6mHnYU75c+IR
         zYvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHZHqKNuf1ZlGP+GY4TGEMCzAXemD+AZgPG4C/RXQQK+A+aNoCasSRulrNEHuIfdaj9RUE3sxZmVB0Tpru@lists.linux.dev
X-Gm-Message-State: AOJu0YzpR7MHywbmg0rZHcH3xAp6TA6w0rigQUX8yjRHDedQ1b0IBgBm
	kjnfiIWnDppWvLPzNuOXPcwSq7AE6LDxWR024PbXkAsC0BDWU3o7wP4cSPcL/+ouXuQ1UzmX6zd
	HBIwvBIRzNr4qgxxWxYmM/6wgYfvTz27CC0B4bpWWbFPM4gv3WqwO18ZOrmw9fyINgkN7
X-Gm-Gg: AZuq6aIevx5H96XqsTDSyR8rYO6rNfcNtccBN3mOkrjhKKpQzkT356X65i8JS0aBm6J
	+x3PTPNIDsmRteouOe0mOTz7itNxZwKPZdGKefR2Gr40DTBlVuDcXV5oefVOFDvh2uFnp8uqiUp
	/QQbGQHSWKG6waDVmBEsfbJ1PMJeDaO2bU9C/yh75dHPLwxRgsgeaAR503khAUlMY87SgbeEODP
	j5RTXDJB5xxmxdrm9SPG8iNRfTGB7P8DuiS5IcsMyNA1i6Q2zV6lMg7wDHs5+lBp8+uFPlRNYq1
	4B/VGELbIPM2xlIhaMJPiVAk3My27roC6qIlHtonAdDs6+YIlHHe5YhOvHrG13MIMp8gBSPClT0
	J38xnxfVq0s5kap61P3C9oZwOkfOMutXlXQoNT97LE4VdGdUvZXBTyjT3OqiRgHjBslsQVL/oH/
	0gVOyaHrQoB00npkLFAxQNS//R7/1YwjPv8gpquV/FzOWfa58tPOMh4pJZ05rrWSRcUEoAYlIx6
	4f6ix3nD9Jl4j6c
X-Received: by 2002:a05:620a:4804:b0:8c7:1b10:e35d with SMTP id af79cd13be357-8cb1edb947cmr725914985a.24.1770809317994;
        Wed, 11 Feb 2026 03:28:37 -0800 (PST)
X-Received: by 2002:a05:620a:4804:b0:8c7:1b10:e35d with SMTP id af79cd13be357-8cb1edb947cmr725912985a.24.1770809317578;
        Wed, 11 Feb 2026 03:28:37 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ebd984csm50133566b.39.2026.02.11.03.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 03:28:37 -0800 (PST)
Message-ID: <8efb3705-42f3-40c5-9631-d72eb2dda74a@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 12:28:35 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH] staging: atomisp: fix heap buffer overflow in framebuffer
 conversion
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc: soufianeda@tutanota.com, linux-staging@lists.linux.dev,
        Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
        Greg KH <gregkh@linuxfoundation.org>
References: <20260210-atomisp-fix-v1-1-024429cbff31@tutanota.com>
 <aYt-vrc7h7CJOmSu@stanley.mountain> <aYw5q_gsHOmKAIhK@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <aYw5q_gsHOmKAIhK@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: G4nkjmkdcSoy55IkpUPYkc0QYqNENjc1
X-Authority-Analysis: v=2.4 cv=YaywJgRf c=1 sm=1 tr=0 ts=698c67e7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=mlNn8-T5AAAA:8
 a=bKjmrzRvnwYi2RYbpB8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=_4ER54FGBOWlvg8qisjz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA4OCBTYWx0ZWRfX6YFAnS/uZjeC
 MxXZ9XWaBZxJmROz50nMwpGAkDbJpzlhd+saZxeX5GF/p0M2nvwVrAfAkRDVuZWmFoyxmJN6cae
 pwdP0A0QjDIy/equimB2Dq4UMkU857YGnIZATqsOzlFcv5WSjSpUc/y5iWUoSndm6LGkDx1QyNN
 an9M7VOkQD1arxW+ijz8EhKpbi8q9oWV4/QvwtIaCpoVOYRg7TKUhaj6G8KWPi7bzW+Yrm7NqyC
 Jcm+2HjTHas6/YIrIsUwnDDuH35M/d2T6BM01sP7FcX4IT70E0KZNSfnPKOqhiFRxqYda9EKQ3u
 0or59mqI0oOVv+IyI7Gtd/34ylLV+O5F7P3eIa4iodEwENmE3h9NXIWSvpvpHS6UQtiJ3PHf47s
 Gd1cwnmSxHSuMAHTtxyrm2WSn7luap/r4kl6d21sFypxBGavfvjKEYD87lpduOPu/AwERFvWKX+
 4vZ4OIWwBa3/VgYdM9A==
X-Proofpoint-GUID: G4nkjmkdcSoy55IkpUPYkc0QYqNENjc1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_01,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110088

Hi,

On 11-Feb-26 09:11, Sakari Ailus wrote:
> Hi Dan, Soufiane,
> 
> On Tue, Feb 10, 2026 at 09:53:50PM +0300, Dan Carpenter wrote:
>> On Tue, Feb 10, 2026 at 04:26:31PM +0100, Soufiane via B4 Relay wrote:
>>> From: Soufiane <soufianeda@tutanota.com>
>>>
>>> Validate sizeimage against the allocated frame buffer size before
>>> hmm_store() to prevent out-of-bounds write.
>>>
>>> Signed-off-by: Soufiane <soufianeda@tutanota.com>
>>
>> We need a Fixes tag if the bug is real.
>>
>>> ---
>>>  drivers/staging/media/atomisp/pci/atomisp_cmd.c | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
>>> index 3a4eb4f6d3be..ca7ffc7855ac 100644
>>> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
>>> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
>>> @@ -3326,6 +3326,11 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
>>>  		goto err;
>>>  	}
>>>  
>>
>> There is some sketchy stuff happening in this code but I'm not sure I
>> understand the issue.  The code looks like this:
>>
>>   3317          /* Note: the padded width on an ia_css_frame is in elements, not in
>>   3318             bytes. The RAW frame we use here should always be a 16bit RAW
>>   3319             frame. This is why we bytesperline/2 is equal to the padded with */
>>   3320          if (ia_css_frame_allocate(&res, arg->fmt.width, arg->fmt.height,
>>   3321                                         sh_format, padded_width, 0)) {
>>
>> This allocates res.  Why would it allocate something smaller than
>> arg->fmt.sizeimage?  How did you find this bug?  By testing or reading
>> the code?  Do you have a reproducer?
>>
>>   3322                  ret = -ENOMEM;
>>   3323                  goto err;
>>   3324          }
>>
>>> +	if (arg->fmt.sizeimage > res->data_bytes) {
>>> +		ret = -EINVAL;
>>> +		goto err;
>>> +	}
>>> +
>>
>>   3325  
>>   3326          tmp_buf = vmalloc(arg->fmt.sizeimage);
>>   3327          if (!tmp_buf) {
>>   3328                  ret = -ENOMEM;
>>   3329                  goto err;
>>   3330          }
>>   3331          if (copy_from_user(tmp_buf, (void __user __force *)arg->base,
>>   3332                             arg->fmt.sizeimage)) {
>>   3333                  ret = -EFAULT;
>>   3334                  goto err;
>>   3335          }
>>   3336  
>>   3337          if (hmm_store(res->data, tmp_buf, arg->fmt.sizeimage)) {
>>                               ^^^^^^^^^
>> The worry is that the buffer this references is too small.  I would
>> prefer instead if there were some bounds checking before the memcpy()
>> calls in hmm_store().  They would use a different, smaller limit if
>> only part of the buffer could be used.  I don't know if that bounds
>> checking is really required though...
> 
> Indeed. Beyond that, even I have to admit I have little idea what this
> IOCTL is supposed to be doing. Possibly feed in a raw frame for processing?
> But that's not supposed to be implemented like this... The TODO file
> contains an entry that says "Remove/disable private IOCTLs" -- we should
> move to use parameter buffers instead.
> 
> I'm not sure anyone depends on these IOCTLs at the moment, but definitely
> some obviously are associated with some risk.
> 
> The world looked different when this code was written.
> 
> I'd disable all private IOCTLs in the driver, with the possible exception
> of ATOMISP_IOC_S_ISP_PARM, which is close to the parameter buffer approach
> already.

Ack, my suggestion would be to completely remove the entire
atomisp_vidioc_default() function from:

drivers/staging/media/atomisp/pci/atomisp_ioctl.c

(and stop setting .vidioc_default)

as mentioned this is something on the TODO list anyways.

This will cause a bunch of code to turn into dead code, but I would
like to keep that code around since when we add support for
a parameter buffer queue that code can serve as an example how to send
parameters to the ISP.

Regards,

Hans



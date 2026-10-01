Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC8D48EBFE
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 20:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790887192; cv=none; b=sxbw8q+iQkuLI7PPNiBIrpvLxs/6xHFqcJmHCfxWnSmjzQ3fm9u7WDFdhluGGLG2COZEMJGRz7HbbTFCohnPIPT+pp2yNtnkwPP1iayw06kZvDCHi8g2kncclPEEULJTK3VAP8xKrsza5wddIvCPxlS6o1abeLqTRUNXWzsZvsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790887192; c=relaxed/simple;
	bh=kweHcTiYSGano3ZkJ6VwDjuIBcKJdrSadLEsRa/sNyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E6LZuaXHG4jMI0kQJHpn4jU/m+DhPt+buIvWKBXT4XvNVeg76NQ4l2bpzUwnkAid4gqhaI5FU6sdvnBvk8SQgzrczQ20D8M1EEubOpc94fEABbkOsED03rsU3va7j3Zvm3lRRXk2U+YFWkdDBoJSDKJ4AT35kjWmjb/hWmtmMAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=LRIsUap4; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="LRIsUap4"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5332b955bb7so11544691cf.0
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 13:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1790887186; x=1791491986; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LuRZ1fld87sU/5peR0ChhxM+xFadb+8S7k9d8ZFQeGE=;
        b=LRIsUap4mzQK1R9AJlhzPs9qFKgXTNf5CNgMoPkrELnu/PCSm2aixKY9xs2EVSCSid
         B/hD+BNI6s+FuuiEunSzkP1C8R2Y2bpCK3Td7IYt94UvcBuHKP94fPh8UxeEB/5u6m5x
         tNc3GeA1iLoi8TGM18W66hjEezlBOi/rcUfZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790887186; x=1791491986;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LuRZ1fld87sU/5peR0ChhxM+xFadb+8S7k9d8ZFQeGE=;
        b=ekvlPTywYUBHJrDR7c/4F25OVU8T38N4uaEW172QXREsslk12Y56LbLIKFxKWiJQ8p
         Tk7aPM/BE/epozw7e4K1wu7JGMX+kBsFIYoMsLvH1mVanCc1NDc7jC+s7PdgR2u+LQLa
         SLYoMLlq2SWHw2FIYpRY7i2liod+36hdnf+HYq7o9T12B19JBKEZhJJqgnNA8i6huDAJ
         k8xSwiAFh3hWJjToUi8vg9eJtSr9ds+24bG0cq7wlkXsG/NoNIgOomRj3AyOClYCuULB
         Vhm9O9aoyg2UVcTZdlf0o3u488MEDaL9WSh5Cl23MdbMzswuVPXRN3vLU5h1hCNNMKec
         z0mw==
X-Forwarded-Encrypted: i=1; AKwUvByH0NUpnjamqkCFXZCMUTKTT26dlkyfhwXzs5ZyathBGRhs03GgrA47hWy2+oIepFEgPKZNZLdFBqZJxZj/@lists.linux.dev
X-Gm-Message-State: AFuF++kmgbGgXUu35CXeFKidsWgfyX8CqOkxEXLXKgYCnN1zDpmkVQ/b
	yyYmdvYnO5T78hS/dpg8SgtJpoDXGWgixbFS9iE9CucHV9G5z/8a5egQLVkCfPAJBA==
X-Gm-Gg: AYBFou0YeQk0c69Mbbo0fBMlf4sg4bm+QpuH+wu3apXMcElfSVyqMb09NzEDSSUfobZ
	70XRbg/x31mx9mvjebb2p6ks3sPe30NGxp9qYWnXJw84uzw+59JEvqPRvaWp6o2VNhMXX1/B5cf
	dYoCb54toRuXBc2+vrm4eqCuIWw12qzc5s+4Mj4EK0VcZqk5VaFxsrEwGen3J7MiStrluGMeTjh
	K21YZ0o/bZRaE4FE7of4ac6W1M4MHIVMx2CPOWS9OfLpIkGRlt6V9wi9+SyhbKssGCgv27C/KUK
	SNp7VqbxKuqnSvoo5XwoZpEBFshgnR6mnoquM1B0J1WqmZ+2XfwNWot5mQ0JGt3xPGj8SQ+0zuK
	XSPoVtVNM7dzMfk1JbvoAFslEW9z+nJjlUAgc6ngLkIlCEk9UiMbTlELxOTPa+l+dF/dSyd3QEb
	dUekMTu5XStgfrFVCtkdGGALREYWgRyGmyS2o6e4GqzgpfLjzklYUGHKGcyEwsTmKj6g==
X-Received: by 2002:a05:622a:1b0b:b0:533:286b:f7ee with SMTP id d75a77b69052e-533832a84b9mr76296561cf.9.1790887186104;
        Thu, 01 Oct 2026 13:39:46 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-53398d438ccsm7411331cf.30.2026.10.01.13.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 13:39:45 -0700 (PDT)
Message-ID: <898d033a-930c-4313-bc01-9e75590f9d4c@ieee.org>
Date: Thu, 1 Oct 2026 15:39:43 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: remove camera driver marked as broken
 since 2016
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dan Carpenter <error27@gmail.com>
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>
References: <20260918011437.108678-1-enelsonmoore@gmail.com>
 <3f152ed6-e572-4c96-8762-2fb7cdc77695@ieee.org>
 <aq0x6IGnKd2IYXoU@stanley.mountain>
 <2026100102-drop-down-washcloth-ce5d@gregkh>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <2026100102-drop-down-washcloth-ce5d@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/1/26 4:18 AM, Greg Kroah-Hartman wrote:
> On Fri, Sep 18, 2026 at 03:43:20PM +0300, Dan Carpenter wrote:
>> On Fri, Sep 18, 2026 at 07:18:54AM -0500, Alex Elder wrote:
>>> On 9/17/26 8:14 PM, Ethan Nelson-Moore wrote:
>>>> The Greybus camera driver has been marked as BROKEN since
>>>> commit d4f56b47a8fa ("staging: greybus: Add drivers/staging/greybus to
>>>> the build"). It has not been able to compile since at least
>>>> commit ec0ad868173d ("staging: greybus: move core include files to
>>>> include/linux/greybus/") because it includes greybus_protocols.h from
>>>> its own directory. These two facts make it very clear there is no
>>>> demand for this driver. Remove it from the kernel.
>>>
>>> Hmmm.  Do you know why it is BROKEN?  Do you know what it
>>> would take to make it work?  I understand the point of
>>> removing it, but in part the Greybus code has historically
>>> served as sample code for people to work on.  It might be
>>> nicer to have fixing it be a pet project.
>>>
>>
>> The compile breaks because of:
>>
>> commit aa1b4da6af67d5c6a4e933c2d30890c6f282f505
>> Author: Boris Brezillon <bbrezillon@kernel.org>
>> Date:   Mon Nov 10 14:28:35 2014 -0300
>>
>>      [media] v4l: Forbid usage of V4L2_MBUS_FMT definitions inside the kernel
>>      
>>      Place v4l2_mbus_pixelcode in a #ifndef __KERNEL__ section so that kernel
>>      users don't have access to these definitions.
> 
> Good point, no one has picked this up since then so let's drop the
> driver and if it ever is needed in the future it can be reverted and
> brought back.

It might be late to say so, but this sounds good to me (despite
my suggestion above).

					-Alex
  >
> thanks,
> 
> greg k-h


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3364E187847
	for <linux-staging@lists.linux.dev>; Mon,  2 Sep 2024 09:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725271038; cv=none; b=aOtvlUAi7fywFLc3GEyZJQT1mt3PCkSmlekdcjfmuX9jYFakgVP+btwfvUVM45rtaRMuy9OG6eFw/T16X1cd6XsuVzYTu/c0XQQmRKyM6H56Nqr2Q9jIf6TTaDrTxvxmJD5jZbiv0SbsqlshpNdZrVAUJlUohP/rS9FSvv3tW/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725271038; c=relaxed/simple;
	bh=h6aqWJZFe0DKJpJGK0OZTK0FOdgHJcHHhCtmfLuBK8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pg0aI6tEFDmYcKqkKy4cemzEy1S8pFiqm2fWqGkt8KtSN8Zp1HdfMyaPZPUUiNe+dIRVg/xwOsgPxGTI2RiQBMfCwvVcBolIU3WS4wqvOPS62VaCNNcd1+trb7rZjGghUOGv9g33rW4qVCraDum/X+66KwvZfj6KC/2rQpA2tLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VdKRpluI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VdKRpluI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725271036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GqO38yPbjmvsFWhnuzTcej5cxt9R0Ja/2qgnhxFK22Y=;
	b=VdKRpluImE/6nuKmLhzqgldnZNah89JaM3Zseq1drxMR5eBGFRiKFY6aEiok4LuJ1h3uU/
	4NYvF1Tnv5ZDlv6dLWH3C+X6dLaR7PdgSr+aXKRH8+acAwaeILag74sh+wexP1Rjxw2y3v
	cBxAUNqlSonSCwkzLf3rNL/LFpK5r3c=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-Z212JO6XMS6KF_FXFI1XLA-1; Mon, 02 Sep 2024 05:57:15 -0400
X-MC-Unique: Z212JO6XMS6KF_FXFI1XLA-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5c25cf44030so618308a12.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Sep 2024 02:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725271034; x=1725875834;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GqO38yPbjmvsFWhnuzTcej5cxt9R0Ja/2qgnhxFK22Y=;
        b=qiz7Yt4SRiceKFe1ai7sKIDTdEfHN1oQTEpNtS+M8/anvNUI9XMio3Zlkup+U0tToN
         xKm1d4ygei2XQRdSbce8votf1bTdbel2g8EPVvmFpSeqhKV8LoTSjgOlRGmjdIrtd+hN
         /ybF4O9H0Bist5dSRnmUlPD27HBkCLJwBQMxAjmm3VPy854mOJGZg07EyyDg1Lrxqs4/
         CYQESIJnSvhd5emlXCtQEt6gsNmCDRDPx3db8XnUysQsQxUmsPr4ne3fibseyEOp4KtQ
         CLZzaCHhkAdDN+UNhE8qL1DNFCeMFflcY/+QlVGe3FXX9wZGKYdzQBPoV1QUyrZWSFad
         o/+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXo8PEwnHZQV2ZgQSJf5W7LqYKDD5LdKmZKTSmGb3L7Oue6lnr32PljlQbgPdPPan1wXD28qyrWm8AdaseI@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9OMbXj+b+fPBd37hsmYSY5ODpPmsyaWZOOvyuMv237PfIWVu6
	sSucIz44KnU2BDsB609Ok90APjKLfpW6wZjZ3sEDpKjfZFUaiZHMe1tqs5pB0E/M6vTgVqwnU+y
	ok410457hbTibWJl4K42d7Ly3KlEs+yDTre8GMgl1aUjfrjnXWoXp62MvKcdSzGY=
X-Received: by 2002:a17:907:1c1f:b0:a6e:f7bc:dcab with SMTP id a640c23a62f3a-a897fad848dmr1008307166b.65.1725271033766;
        Mon, 02 Sep 2024 02:57:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwtv99Has9Hvq1W7dpRPfixeSdoVcVSbR1ZDJPHIHNOwqQjIB2aBEqdYaBzaUlXxrofnbVfQ==
X-Received: by 2002:a17:907:1c1f:b0:a6e:f7bc:dcab with SMTP id a640c23a62f3a-a897fad848dmr1008305066b.65.1725271033196;
        Mon, 02 Sep 2024 02:57:13 -0700 (PDT)
Received: from [192.168.171.203] ([109.38.145.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989222593sm535098466b.205.2024.09.02.02.57.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 02:57:12 -0700 (PDT)
Message-ID: <44642b37-9a73-40d6-9c2b-0f3182932907@redhat.com>
Date: Mon, 2 Sep 2024 11:57:09 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media/atomisp/include/linux: Fix spelling
 mistakes in atomisp.h
To: Roshan Khatri <topofeverest8848@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, andy@kernel.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240522161830.57434-1-topofeverest8848@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240522161830.57434-1-topofeverest8848@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/22/24 6:18 PM, Roshan Khatri wrote:
> codespell reported misspelled coefficients and vector in atomisp.h. This
> patch corrects the spellings to increase readability and searching.
> 
> Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>

Thank you for your 3 patch(es).

I have merged this/these in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this/these will be included in my next pull-request to
Mauro (to media subsystem maintainer)

Regards,

Hans



> ---
>  drivers/staging/media/atomisp/include/linux/atomisp.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
> index bbbd904b696a..1d11a9579587 100644
> --- a/drivers/staging/media/atomisp/include/linux/atomisp.h
> +++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
> @@ -201,7 +201,7 @@ struct atomisp_dis_vector {
>  };
>  
>  /* DVS 2.0 Coefficient types. This structure contains 4 pointers to
> - *  arrays that contain the coeffients for each type.
> + *  arrays that contain the coefficients for each type.
>   */
>  struct atomisp_dvs2_coef_types {
>  	short __user *odd_real; /** real part of the odd coefficients*/
> @@ -741,7 +741,7 @@ enum atomisp_burst_capture_options {
>  /* Digital Image Stabilization:
>   * 1. get dis statistics: reads DIS statistics from ISP (every frame)
>   * 2. set dis coefficients: set DIS filter coefficients (one time)
> - * 3. set dis motion vecotr: set motion vector (result of DIS, every frame)
> + * 3. set dis motion vector: set motion vector (result of DIS, every frame)
>   */
>  #define ATOMISP_IOC_G_DIS_STAT \
>  	_IOWR('v', BASE_VIDIOC_PRIVATE + 6, struct atomisp_dis_statistics)


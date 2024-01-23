Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DFE4F211
	for <linux-staging@lists.linux.dev>; Tue, 23 Jan 2024 06:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705990237; cv=none; b=caYMLZQMXyJe9/ihFbWFacqqGER+8e98ta8WRnqi6yHXKOl+L9ooowTQAJv8OvMGLlSKnAbz0NC7V4+vK6isYczg0t+62fgQpdld/5sSWOdwL22UnzwX0lAQu9cTZLx9n4DEKw8kz1I29iCYHra7/Pjx5P/u3JWOK84p0qXnsoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705990237; c=relaxed/simple;
	bh=w3gqNh/2pOwoeMf06X/XCaRk9VzBiWnMpsT5GqVh0sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OpQxAuEPAlR7fJb/ZFIQBgftUdGRGylXVgtNIgdZySs/bCa4fXLEfn56DJ3AwYw0tYS0LqIRBwfNH1DvBdKANAlVFePT9I7WlFMtMyv4sSTQxF55V8xlTP2EdomjqWruxo8qY/ED7xr9/LC8dQ/rtmiboI29PNoFZQMm2tNaSSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aH2P30z/; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aH2P30z/"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-78324e302d4so349897185a.1
        for <linux-staging@lists.linux.dev>; Mon, 22 Jan 2024 22:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705990234; x=1706595034; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5A/ClUoIrkIoreUe1TXm2hkzVatmI8TCvtYDlQ9V8pE=;
        b=aH2P30z/MdFf/STlD70lIoimGRxOcljlxI9HqPZnkOV6ihUcHcm/EInpptzLyVpdrd
         snX/Kmt+Jh/JGeuhR5cUYLMlhce/cplGOV+4nwPREbGIMHEEB8sxHrwPAXlWp55EbM2D
         0OFj74Qn4F0tbkBfmhQ9C+IPCwYj3aWs1lRmWz8Mfbh6aM1cUc9nWKP3hdKBM/0niybd
         8tqRGY5WAJMaEQdwj2C25iyrRruJlHVcGhqP77efxD+vdfVizNvOqoXM0QFmz5Te2umT
         VsB6J/fi/CxEmHjxRT+9XbPOdLw+uN4Vyy62+Ptqdz5n5lI6aZxpKqbA2c6SWkcdoRKU
         RN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705990234; x=1706595034;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5A/ClUoIrkIoreUe1TXm2hkzVatmI8TCvtYDlQ9V8pE=;
        b=lcewCKJfvSYuSZaYGKKK1j8N1l4u4DBXvDXhgCZ3w17yfXZMUrRP5jZqeQRlj3NLkT
         ODb3v5MQiH+09JkERogVmV3VR5e2Z5TfRqy1AcNI0EPKGyeyBvMtTphBR7oUmveGpELL
         EpjeVMymzVgZkDwctd93F+fbkAMipYWreTyXl2XJ4KYLFvZ3tuhjddxOZz4jWBuS683q
         kVSZwqpE89F6rP0dBzpua3Tg3/tzWhPzeA7Ho1dsu7UGzhiCgjRdfaZbaR4zZYcfDhq2
         qsSA1Dim2fDTDXXgpgbLf/9UjAyzYt1cCom+4BdhzwAbDVCzHnPzB2nXc07tKoWWkl/B
         d6dw==
X-Gm-Message-State: AOJu0YxKE0QCSMTxfZ8Nhyy8RGwY/aDF7hYEcWta9ztSJbW3RehKToQm
	rH6hKAIs9YEIT9Jm/dxZvtx3PVTYAQSnfu8Apgia1XZXtI73CTo2femH4O/MccZAyrmwW4deWBJ
	kIFM=
X-Google-Smtp-Source: AGHT+IE4OD6TOeSlxeub7wxFFX8Sv6dWWmPrA3e8kSMzmAMyNUFBJ2e3X/JubQQACaJDh2v9EM67/w==
X-Received: by 2002:a05:620a:ce6:b0:783:3f25:c6f3 with SMTP id c6-20020a05620a0ce600b007833f25c6f3mr6039607qkj.47.1705990233567;
        Mon, 22 Jan 2024 22:10:33 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id o11-20020ae9f50b000000b007837e17f643sm2839113qkg.63.2024.01.22.22.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 22:10:33 -0800 (PST)
Date: Tue, 23 Jan 2024 09:10:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hoorad Farrokh <hourrad.f@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] staging: rtl8723bs: remove unnecessary braces in
 while loop
Message-ID: <cd2fd58b-1017-4019-8810-c2421ddf02e0@moroto.mountain>
References: <4ii7ptqhz7ion46dczabnevuj7tjfv4iofvzedms6tvfgsfu2e@6rvcsdyodny2>
 <39fbf9df-d6da-4275-be3b-191108f94ec2@moroto.mountain>
 <delmvvkjuq2t76jrrxxb4a33tuef3m7bhkzpnopp5x7xzjdntb@ceybtr5piecl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <delmvvkjuq2t76jrrxxb4a33tuef3m7bhkzpnopp5x7xzjdntb@ceybtr5piecl>

On Tue, Jan 23, 2024 at 12:28:44PM +1300, Hoorad Farrokh wrote:
> Hello,
> Thanks for your comment.
> 
> > 
> > This function doesn't do anything...  The name says "free_all" but it
> > doesn't free anything.  I would prefer to fix this warning by adding
> > a comment:
> >
> 
> I didn't fully understand this part of your comment. Do you mean I should add a comment
> to the while loop + my changes and submit it agian? or 
> do you mean I should find a way to free things in the while loop? then submit again?
> 

Either one.

It's weird to note down the bugs in the source, but if we don't know how
to fix it, then perhaps that's the best we can do...

regards,
dan carpenter


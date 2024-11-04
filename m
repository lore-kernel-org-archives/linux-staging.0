Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DF71B3953
	for <linux-staging@lists.linux.dev>; Mon,  4 Nov 2024 11:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730718531; cv=none; b=N3dJpaMTBTKFDrOmvz28D4t+h2InBYg+VU69nQbdLJULepHRzVHAn/xfmp5UTy8flFWdBxZPndiUkRNF0unpg4ePKye9s4ptwRYOaxBNd3pLx4tBL4va9SNIwjnROV/QpXpGWNtwEWhLIzrutyCNHE9w94oCaR9Y0+z+xzr5gfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730718531; c=relaxed/simple;
	bh=s5P19hNeuAnGUdrMJ/5Mqch/0JAtnNtGyau8mT1WKzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NH7hKLmEZX0HnUpBZxdKf//4i0ZgDUqNgeb4mjDoaLo18p92auoC6m623ZgFkzBNkP3UyRYIEpvt4QzAdKY0pAnIZB3bzD6EPNAlJH3o+nqpzrmip2qN0QYrm7CYIasQY3mz9H/MbpBeQBg//1x8fWOWWNwNIsNNXW3CnwdG0MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DW9QWAx5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DW9QWAx5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730718528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eiPSsBINkhUGJeoO3ADfkXjMLznBBsiB9KM89Hnjm4M=;
	b=DW9QWAx51Nv/ZIAdNH3ObuUvUpozYuq1HpSwCeAqbWD/MODGJCbAepC9It75HesqRk1Gva
	ur2tFoEI3zvXGql1MbIEP1CyAqEPzUflQkMweieb0/h2sx8wTkGIevp2oXgajskkRq0di+
	lhMrMcz0PeZVdVd7KZ4NQQuWy4jo8P8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-w9WVmdehPo6aCm5tSxEvfw-1; Mon, 04 Nov 2024 06:08:47 -0500
X-MC-Unique: w9WVmdehPo6aCm5tSxEvfw-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5c94862c3adso2923200a12.3
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 03:08:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730718526; x=1731323326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eiPSsBINkhUGJeoO3ADfkXjMLznBBsiB9KM89Hnjm4M=;
        b=vUw0wswKFrYHKDxZ+7JqiIhaYWKGBA16O7PKQWwjSkFl1UntFZGNRIfjdGcmoWcsJQ
         3nkxk94aTcS2cqzH38FVMuwxrRLzz6zJAcl0QjV9o92ESSYhNi0lxl+KrmBUuI4XrI6l
         reaYaGnWyxJ5VUj2x2bbBbW9JwWF7275TYMkxK1YbDKGpTy9/AMt3rKIQzHJxQuNlFEo
         IkNVkF+YlQB7v+EzVE4XjCIFvKd9LEN+oFOO36WZSMbvBv1wBGH+OBaIUZUsciVMDIzS
         9W7nVr0dI+XVFi/pbkRAqwE/CXd6WqpfllVdLDt4T7e6h98lIY1t/513Tsu2QH4NQz9y
         0Fcg==
X-Forwarded-Encrypted: i=1; AJvYcCWdrDzV4wBRg0aZMSXfkUkWF05cfPi1hxOvKQXMabtts1iZ5RzXO1cUqyE3j7fPXesHcQH3OTjmMnJgAS6h@lists.linux.dev
X-Gm-Message-State: AOJu0YwavZeUaiIu9DUbYnKlSv38wsRtG9yBYJsbk7bi7sEvvh6yNBOl
	na5o3+z7ocmdDUEWiPYgK9bFgEi1iyCi5YTB9OYcermPL44zm+dTMVXN6bFZnxmdjdlFGk3gQQ6
	kCVSlWM8LJD4bHKGZhPQAru9/c0LgyDaudre0hvKjwvwjGD4DFW0/6Z0hy8sYo3o=
X-Received: by 2002:a05:6402:1d4c:b0:5ce:de14:65d0 with SMTP id 4fb4d7f45d1cf-5cede146642mr966711a12.0.1730718526157;
        Mon, 04 Nov 2024 03:08:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpuDyO8D1nRRXTlTJuNJPSHeW3WHC0+/HSstAONVJrZSkZK8THp6jyRFyHZaAKg2FAXzHvYw==
X-Received: by 2002:a05:6402:1d4c:b0:5ce:de14:65d0 with SMTP id 4fb4d7f45d1cf-5cede146642mr966691a12.0.1730718525615;
        Mon, 04 Nov 2024 03:08:45 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac7c8c91sm4128304a12.75.2024.11.04.03.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 03:08:44 -0800 (PST)
Message-ID: <e25fb120-965d-42e3-9f0a-7aa9bc1c9dee@redhat.com>
Date: Mon, 4 Nov 2024 12:08:41 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: atomisp: hmm_bo: Fix spelling errors in hmm_bo.h
To: "Everest K.C." <everestkc@everestkc.com.np>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240918082203.4941-1-everestkc@everestkc.com.np>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240918082203.4941-1-everestkc@everestkc.com.np>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 18-Sep-24 10:21 AM, Everest K.C. wrote:
> Fixed spelling errors reported by codespell in
> drivers/staging/media/atomisp/include/hmm/hmm_bo.h
> as follows:
>         increse --> increase
> 	decrese --> decrease
> 
> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>

Thank you for your patch(es).

I have merged this/these in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this/these will be included in my next pull-request to
Mauro (to media subsystem maintainer)

Regards,

Hans


> ---
>  drivers/staging/media/atomisp/include/hmm/hmm_bo.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
> index b4c03e0ca9c0..6d3c74156345 100644
> --- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
> +++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
> @@ -159,12 +159,12 @@ void hmm_bo_device_exit(struct hmm_bo_device *bdev);
>  int hmm_bo_device_inited(struct hmm_bo_device *bdev);
>  
>  /*
> - * increse buffer object reference.
> + * increase buffer object reference.
>   */
>  void hmm_bo_ref(struct hmm_buffer_object *bo);
>  
>  /*
> - * decrese buffer object reference. if reference reaches 0,
> + * decrease buffer object reference. if reference reaches 0,
>   * release function of the buffer object will be called.
>   *
>   * this call is also used to release hmm_buffer_object or its


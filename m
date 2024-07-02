Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39C5158D61
	for <linux-staging@lists.linux.dev>; Tue,  2 Jul 2024 10:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719916808; cv=none; b=jR1koJrISxqKb9gzRlpobUfBZFelgXWx3gjAOx1a1C6gKyZzxqQ8sZDlt1fkxfG6ZgiUlrHY+WNcHNVfnhjGIaYz7nYlJzhXMHjJNcT1Vz3uJwO9W/4xeR3ZQYiKc0B4X+q8izd93BK7jCov5trpCXb5hXfuoCZRvq2gGwg7r9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719916808; c=relaxed/simple;
	bh=TDppq3QndM8JNkDjO8u2RbRC5OpWh1V4tH234IJdXFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dc+WsWVD3LReyG2MGdJYM7f5AcjpthnQFVYL9PA6dhb9aGSVkZ5c7/d8hXChvIdQ/ZlPP89zIfvQJEq7Z4/Uikdf1FcwGyJeADvwmWubCkZrEpfxzj289jT2COSqsNTeZQs40FBE0o/6mhnCUIabF5/MMqZ+KFMpMtem2PcPwFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=inckK6Ts; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="inckK6Ts"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719916805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uCa6DSiwjRz2Wd6vpRX6uDoKcE2Oans70T8xfVyVyaw=;
	b=inckK6TsFh4hnvdAd2bHBaK04fcI+nwF89GIFLAVxLh0vNIsoe97fYHj4A/epitXYWjsN4
	QWtcszFUmsDQPgVKyL+EZY69FYS7k1nQkT1FM37ZU6IKH5NB4/ON+Tk/cY8AuzHTNm/F8V
	B/Ber/qdpAK32csHdYp9cx6zVa0OYjY=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-Z7uo9pmdN7OjzQlAs-w-lg-1; Tue, 02 Jul 2024 06:40:03 -0400
X-MC-Unique: Z7uo9pmdN7OjzQlAs-w-lg-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2ec72d14876so35317351fa.2
        for <linux-staging@lists.linux.dev>; Tue, 02 Jul 2024 03:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719916802; x=1720521602;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uCa6DSiwjRz2Wd6vpRX6uDoKcE2Oans70T8xfVyVyaw=;
        b=qdkdYgM9lJvxNmQfhTiZmmqRaeGmDTUJzvQtb87FQqTYFbZVtL7UX7qbZq+IXFj/B+
         nSQDttkZ+5506mYZ6vzsTRJWkrYn480uG1vXVJTsRuDsunRKdWwZQZW5I/UC4/sWveKb
         F5PNYCIjvxU6FdT/6tivQWGwXNEgLEQg7GJJPqEcwFMMb0+4AoL9UhKVTAm6vTMPCWDe
         fHeb2ogBYjsKiiQKJhm2l2Xo2AzjvFhUkV0fIJnPPfiJQPU4n/uK/Lwuz/ws2DhAlIRZ
         y+/FSDiHyA+zH3rYkX6sUYxe63upFpIAv92pvaMpXjYMNPD9Uk7LFqx8pPHdgWWmExNt
         2EwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbsaVTHgOm5UVHU32IM6/R0Pi3dbz8VNhBAyfcqHYKKgLklD5SvpSQcmxuieLL+wBQc4BN3bbNV42gsLI7R+s2v7MwoMjCnlSN62mvDw==
X-Gm-Message-State: AOJu0Yyxftg5WcOP7jLRT5t+sVLPOgltt2jY/B3fDdnOZbzFW3UEKnEs
	Z8V+REupgr8ELk1NBi948AhIcj9JqdKGjemKa1csGQ82p6N2VXmIB3VhS1EYbTnOKywMfnjUHSt
	yZmr8HNpKsorHpft4l1Zeqx9TqvSfM/wwDebfB3Z+ar7lXV15jOSgOXASvmImYvE=
X-Received: by 2002:a2e:a80c:0:b0:2ec:5759:bf2f with SMTP id 38308e7fff4ca-2ee5e337772mr60944951fa.7.1719916801658;
        Tue, 02 Jul 2024 03:40:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA9HFaqbpR5DiqdWlJr4mBoVmkGsxDa/lEzaGV1FtuE5tObmfGOuCe6wTUqiDmvlGM/Qax6w==
X-Received: by 2002:a2e:a80c:0:b0:2ec:5759:bf2f with SMTP id 38308e7fff4ca-2ee5e337772mr60944751fa.7.1719916801202;
        Tue, 02 Jul 2024 03:40:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5861324eb41sm5532223a12.30.2024.07.02.03.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 03:40:00 -0700 (PDT)
Message-ID: <2ac685f1-d46d-4639-b045-605bf95ed2ba@redhat.com>
Date: Tue, 2 Jul 2024 12:40:00 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] media: atomisp: Fix spelling mistake "pipline" ->
 "pipeline"
To: Colin Ian King <colin.i.king@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240429075146.1073869-1-colin.i.king@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240429075146.1073869-1-colin.i.king@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/29/24 9:51 AM, Colin Ian King wrote:
> There is a spelling mistake in a dev_err message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans


> ---
>  drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> index effc71b5a439..d7e8a9871522 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -894,7 +894,7 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	ret = __media_pipeline_start(&asd->video_out.vdev.entity.pads[0], &asd->video_out.pipe);
>  	mutex_unlock(&isp->media_dev.graph_mutex);
>  	if (ret) {
> -		dev_err(isp->dev, "Error starting mc pipline: %d\n", ret);
> +		dev_err(isp->dev, "Error starting mc pipeline: %d\n", ret);
>  		goto out_unlock;
>  	}
>  


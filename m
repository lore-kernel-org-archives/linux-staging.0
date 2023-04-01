Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C530119C
	for <linux-staging@lists.linux.dev>; Sat,  1 Apr 2023 11:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680347183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=082wN2d40YxS8UzRA5DpIleZHbfgWjfwCTFReqbA0DU=;
	b=b0n6v8ZeDlLz5ezeefDdf0PbpuNrFh/mLYBGgVb/GDCT3nYdf+z7TgC1ThUPpU+RmmidLM
	X/YYt+hOirwUN//zOWSiqglzkgB2QryQry5E76+MnN+1Zr2ZkKIrfnvxv/BvllazqbPRXh
	xclQJ8twBuXZp2/NsxCG7fV2qJqonNg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-veitA7pHPkenZNqGxZtlSg-1; Sat, 01 Apr 2023 07:06:22 -0400
X-MC-Unique: veitA7pHPkenZNqGxZtlSg-1
Received: by mail-ed1-f72.google.com with SMTP id f15-20020a50a6cf000000b0050050d2326aso34804359edc.18
        for <linux-staging@lists.linux.dev>; Sat, 01 Apr 2023 04:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680347181;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=082wN2d40YxS8UzRA5DpIleZHbfgWjfwCTFReqbA0DU=;
        b=wYbF8UDUqpXD7SJhnWs3QZPyK0RBKf9OjmWz9Y4b3wKmYuPSDrIxJQ96KrQU91nX01
         ErgJTrgJkt7SWIL1y/ad35ljjfCM50LRmQvtvS/ZtLD2Yphxf0M99hwFtD9OWwcr5RJL
         UE/UzOkFZpm803uQAN5nm0+pRypDbjQCdr+VyJyeBcqSGIzjGbzrEFKDPCIVQ27gWXju
         VoOHNelBCZJnoM+2SdWzoYrFDEfeFt9OOO/ab1sh61k8ZnlStom52iHZgcfegG/h8/N7
         ayU0ufC2cWdr/d+bwSCJl0nDCflBayG3gMnk6JeCNX+nvaV6EAdOBLkWjPSCM3iu66mJ
         A37Q==
X-Gm-Message-State: AAQBX9cep3dPutr1kHvYz89UlsIrefaZ/m7EKRGA11OeAIRf+rFiQ55a
	ucANApWSZYz/3lrsM9rnSPUptElKsqe4L+fDKHnK2qvJiFHgQR2c38/D1aS0e3tlZejJHhFy8pv
	5FERXw2PYAJ5LT9ktU9nCkq+UlA==
X-Received: by 2002:a17:906:f1c7:b0:933:c474:420b with SMTP id gx7-20020a170906f1c700b00933c474420bmr31523509ejb.19.1680347181550;
        Sat, 01 Apr 2023 04:06:21 -0700 (PDT)
X-Google-Smtp-Source: AKy350bNZPrff+UqQRkf0DfJ6wFD1zt9oWjO2MGu1jVR8hfJRAUQUuPkhITjmruRCr4ujfAnV/gUfQ==
X-Received: by 2002:a17:906:f1c7:b0:933:c474:420b with SMTP id gx7-20020a170906f1c700b00933c474420bmr31523495ejb.19.1680347181277;
        Sat, 01 Apr 2023 04:06:21 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id mc3-20020a170906eb4300b009334d87d106sm1978160ejb.147.2023.04.01.04.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Apr 2023 04:06:20 -0700 (PDT)
Message-ID: <d452fe83-e063-8f18-2582-af04c7cec867@redhat.com>
Date: Sat, 1 Apr 2023 13:06:19 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 04/10] media: atomisp: Remove crop_needs_override from
 atomisp_set_fmt()
To: Andy Shevchenko <andy@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Kate Hsuan <hpa@redhat.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20230221145906.8113-1-hdegoede@redhat.com>
 <20230221145906.8113-5-hdegoede@redhat.com>
 <Y/Tqs3hEYzeZ9Om4@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y/Tqs3hEYzeZ9Om4@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/21/23 17:00, Andy Shevchenko wrote:
> On Tue, Feb 21, 2023 at 03:59:00PM +0100, Hans de Goede wrote:
>> Remove the crop_needs_override local helper variable from
>> atomisp_set_fmt(), as it always is true now.
> 
> ...
> 
>> +			sink_crop.width = DIV_NEAREST_STEP(
>> +					      sink_crop.height *
>> +					      f->fmt.pix.width,
>> +					      f->fmt.pix.height,
>> +					      ATOM_ISP_STEP_WIDTH);
> 
> Not sure how long this code stays, I would indent it as
> 
> 			sink_crop.width =
> 				DIV_NEAREST_STEP(sink_crop.height *
> 						 f->fmt.pix.width,
> 						 f->fmt.pix.height,
> 						 ATOM_ISP_STEP_WIDTH);

Thanks, I've gone with:

			sink_crop.width =
				DIV_NEAREST_STEP(sink_crop.height * f->fmt.pix.width,
						 f->fmt.pix.height,
						 ATOM_ISP_STEP_WIDTH);

Keeping the first DIV_NEAREST_STEP() argument on a single line.

> 
> ...
> 
>> +			sink_crop.height = DIV_NEAREST_STEP(
>> +					       sink_crop.width *
>> +					       f->fmt.pix.height,
>> +					       f->fmt.pix.width,
>> +					       ATOM_ISP_STEP_HEIGHT);
> 
> Ditto.

Ditto :)

Regards,

Hans


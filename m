Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98921C11
	for <linux-staging@lists.linux.dev>; Sun, 16 Apr 2023 13:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681650752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ecW/u7CjtCVSaHYPl096FXbBaM+YOFYAJMZvfjOeWGs=;
	b=cx0XHXlC+H5IFtWDZ+xVe4Gl/iBJ27p6xZWyqrTJXMTM/WUPzBud21p3bNLd5GaNuipVn9
	zU+z7Vb/HcqyzvI2/YUCRoPCtHpbjscE6bLeQjR/tgJPlISiCwieWahlEfqCQ2/Xq2Axy5
	se3sqeC59vGqf0XoXXy8FuO5KtpZpys=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-emY96EmrMtuZA8_AKdgniQ-1; Sun, 16 Apr 2023 09:12:31 -0400
X-MC-Unique: emY96EmrMtuZA8_AKdgniQ-1
Received: by mail-ed1-f69.google.com with SMTP id u12-20020a50c04c000000b00506880aeb5dso2716694edd.10
        for <linux-staging@lists.linux.dev>; Sun, 16 Apr 2023 06:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681650750; x=1684242750;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ecW/u7CjtCVSaHYPl096FXbBaM+YOFYAJMZvfjOeWGs=;
        b=SL+dNRn/SbZGg1BaKVD9YaW+E/N0aBY18RLJvZRzQksAJO6bohWASNIyIzb36Fo3t+
         9Mur6A5lj/s732ne0Kt2yB+u1emxQ+UcfPXhGF1lXAxvlhfT0tNx5QH+PTTKJzW+xqcl
         2R8KXFcVxE+FZ72tSZNiZkruuMOeg+tX5M0DuQjKLVeEwBCZRgRG0O84W7MwmIuf89CA
         B27x9wyB3ovd8szPooqSHGDBcSU7aBrqaS5YjDI5DRccUbIUvaYpthceDMYPK7gdUtTJ
         odFQyN/H7n7+Pul1bAV8XrroOLaGxEv+5qQDdtu0RajUbWv86Y1wrFyBUOWcIxiwYTyU
         3pkQ==
X-Gm-Message-State: AAQBX9fN/8aINSEq5sJsLkuedhSB/lB6z8nx3GS/aFR4JUDuXA7rqChO
	e6XJ45rlnsGf0MtgYYf+qtbmt0Lc9XZ2xp7ppFNPBnf0cd8hFFD9+clIq6VMa1/nfHT9Uf66Mvf
	kRIqX3odYg+2Tl342rEdduNxrHsqK8LUf/Q==
X-Received: by 2002:a17:907:7809:b0:949:c05d:73b6 with SMTP id la9-20020a170907780900b00949c05d73b6mr4080300ejc.17.1681650750402;
        Sun, 16 Apr 2023 06:12:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zvy4OWUGG7/uKcn/guQnbp5MOYixLaUbua5xOk1r9lVf96E10h0El+lKgLR9svlpzbszXUTg==
X-Received: by 2002:a17:907:7809:b0:949:c05d:73b6 with SMTP id la9-20020a170907780900b00949c05d73b6mr4080287ejc.17.1681650750153;
        Sun, 16 Apr 2023 06:12:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id xh5-20020a170906da8500b0094edd8e38fasm3665933ejb.76.2023.04.16.06.12.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 06:12:29 -0700 (PDT)
Message-ID: <9b243f3e-92ad-197f-f0a6-b22eaf71238a@redhat.com>
Date: Sun, 16 Apr 2023 15:12:28 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] media: atomisp: Move a variable assignment behind a null
 pointer check in atomisp_cp_general_isp_parameters()
To: Andy Shevchenko <andy@kernel.org>, Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Xiaomeng Tong <xiam0nd.tong@gmail.com>, cocci@inria.fr,
 LKML <linux-kernel@vger.kernel.org>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <d8ed4e5d-49d4-ca7e-1283-1ec166bf643d@web.de>
 <ZDmJsemYldOsMMrH@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZDmJsemYldOsMMrH@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 4/14/23 19:13, Andy Shevchenko wrote:
> On Thu, Apr 13, 2023 at 10:20:15PM +0200, Markus Elfring wrote:
>> Date: Thu, 13 Apr 2023 22:08:42 +0200
>>
>> The address of a data structure member was determined before
>> a corresponding null pointer check in the implementation of
>> the function “atomisp_cp_general_isp_parameters”.
>>
>> Thus avoid the risk for undefined behaviour by moving the assignment
>> for the variable “cur_config” behind the null pointer check.
> 
> I don't think this is what is happening here. The check might be removed by
> optimizer in the compiler.

Right, Markus thank you for the patch.

Instead of this patch, can you please audit the callers of this
function? I expect that you will likely find that the callers
already unconditionally deref css_param themselves, or they
guarantee a non NULL value in other ways (e.g. address of local
variable).

So I expect that the check can simply be dropped completely,
which would be a much better fix.

Regards,

Hans





> 
>> This issue was detected by using the Coccinelle software.
>>
>> Fixes: ad85094b293e40e7a2f831b0311a389d952ebd5e ("Revert 'media: staging: atomisp: Remove driver'")
> 
> Wrong tag format.
> 
> Code-wise I'm not against this, but it's up to Hans.
> 


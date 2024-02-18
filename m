Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5084EB4D
	for <linux-staging@lists.linux.dev>; Sun, 18 Feb 2024 11:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708254492; cv=none; b=ExnMQxi9AqqDJtYc2JqCeAyn89/wkWsidvye8TDgVljRMc5FLuuXtiPKJNjVBC0Ng7bBMv3SddGRWtrA7IypYHR+WSpGpvImEWTnhm6tiwTjOCY5Lj3hBlhcb8MFJTi9+3TZxLDi+2o78wmDfzSGMqNo0rsxnkfJcE/cZtnSmH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708254492; c=relaxed/simple;
	bh=3TKvhQ3vxwW/peESH3bVfmlT/EEYE6U5+HjKrIuS+lA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rMXSHw/pNE4VZSu/gRcUXKL33eZbBCEVQSropcOrnC+JJywgqqT3Ux72FKDsin9zXKNY99GTZMuow0tCF21PHv5Oh2QBltg/+wW7fR5nETDv4wLZKU0FnQItfsl+nHQ3ylpcEwrdgqSp5aCzd+r2ZVEnszUOlMN3wI+G43N6+iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YHCpZ7jA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YHCpZ7jA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708254489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JHmmZL1fNh88Qylka4+U/ZSAGTN1aKufKX/Quq5dF9M=;
	b=YHCpZ7jAJSjz2QXVml1cCOLi0xxEjK9N8qjoqui96+PUur2hQ2SjhaKDk50L+ZqX6jZ45G
	Ml5RQ0udRJzJvB/rfyJW7vfp3VHBOfnSyy7l1yEm6xgRc3x0A8GmvNWTlRcQfj5+vmiRV7
	Q37+auUWGoZbtBq57VHz9PojdQaCK9Y=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-yTih17OUNrORBarF_79F7g-1; Sun, 18 Feb 2024 06:08:06 -0500
X-MC-Unique: yTih17OUNrORBarF_79F7g-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a3e7f805eccso8323566b.2
        for <linux-staging@lists.linux.dev>; Sun, 18 Feb 2024 03:08:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708254485; x=1708859285;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JHmmZL1fNh88Qylka4+U/ZSAGTN1aKufKX/Quq5dF9M=;
        b=eS1oid2+QStSIyQua6KNB++ErPX7WPXkiuPBcMMDZfIehwFF0pLE2IzIEo+wJqsmdG
         ZMLfTmqT5kZtEOZZD2BADHHo4/kA1tXNDAaMWSc6vE2sSwfpX4aiqvQVjt2ktkMq4K9E
         /ukV0f2etM/o4zOqYfVKnLFsoO93j5i0lDlzmr5p8tHlZaFhZ3FtrM4sisn2hAmt1Hoe
         TMndF/+8jpEc5goz83Oq3IbvVO016eusHruD2L/X77juysSvpq5PBrmbs31oiLhoWKdQ
         BLhhR75tw1lAZAstvninyQvmU1Lo1hgt/+s1s4lozJADq+cUBMOfvG5sJKocoHY4wfno
         JwrA==
X-Forwarded-Encrypted: i=1; AJvYcCUHH4X8NjVLnYS3iEfn8mnRRVz1BVjqtNRwssW26doCkid+itqM3unLgyYvO/MqY5I6SIZ1dAjcXNv4dG5C5NrHCqKj5j2D5TwMXhuwTA==
X-Gm-Message-State: AOJu0YygqZ8YuHqBOA7N2pWI+FNMAB/0S3qnj0wkxp1F9sy62jN9yD43
	/aXTwwmfOhmexrQtbdwCchqleZhbW2v+h9txMKdknLzwJm3weaQYYGwcGD28pi6VHWkzryngqLK
	zKn0qsR+/dyMfVtJWLz8uu3ixTQr3++12s1qve6pejUcA0CBd9ryxYcvtLFSWW10=
X-Received: by 2002:a17:906:231a:b0:a3e:8429:a927 with SMTP id l26-20020a170906231a00b00a3e8429a927mr428135eja.68.1708254485289;
        Sun, 18 Feb 2024 03:08:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCDSSiqE95u+4ghdM0qpsXmw/Pn3pWXEEMl5iBEArG7e7qJn0G9Z2BGOgnFtrEJrQRc21/TQ==
X-Received: by 2002:a17:906:231a:b0:a3e:8429:a927 with SMTP id l26-20020a170906231a00b00a3e8429a927mr428122eja.68.1708254485033;
        Sun, 18 Feb 2024 03:08:05 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id tz3-20020a170907c78300b00a3e0b7e7217sm1752185ejc.48.2024.02.18.03.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 03:08:04 -0800 (PST)
Message-ID: <1e42993f-bdb3-471a-9c34-04a23f5e71b3@redhat.com>
Date: Sun, 18 Feb 2024 12:08:03 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] media: atomisp: Implement link_setup op for ISP
 subdev MC entity
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20240217112438.15240-1-hdegoede@redhat.com>
 <20240217112438.15240-10-hdegoede@redhat.com>
 <CAHp75VfK6QKA4hq0_LNe1_i44M_6j65aYGnU7XSEF0M-NWLs7A@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VfK6QKA4hq0_LNe1_i44M_6j65aYGnU7XSEF0M-NWLs7A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 2/17/24 19:52, Andy Shevchenko wrote:
> On Sat, Feb 17, 2024 at 1:25 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The atomisp driver's Android heritage makes it weird in that
>> even though it uses MC + subdev-s it is designed to primarily
>> be controlled through its /dev/video# node.
>>
>> It implements s_input on /dev/video# to select which sensor to use,
>> while ignoring setup_link calls to enable a link to another sensor.
>>
>> Add support for selecting the active sensor the MC way by adding
>> setup_link support.
> 
> ->link_setup()
> 
>> The implementation is a bit convoluted due to the atomisp driver's
>> heritage.
> 
> ...
> 
>>  #include "atomisp_common.h"
>>  #include "atomisp_compat.h"
>>  #include "atomisp_fops.h"
>> +#include "atomisp_ioctl.h"
>>  #include "atomisp_internal.h"
> 
> Hmm... Perhaps keep it ordered?

Yeah my bad, I intended to keep it ordered but I somehow got it wrong.
this and the commit msg remark are both fixed in my personal tree now.

> 
> ...
> 
>> +       mutex_lock(&isp->mutex);
> 
> Side note: Are you planning to use cleanup.h at some point?

Maybe. I have no objections against. For functions needing
e.g. heap memory only locally it certainly makes sense.

Regards,

Hans



> 
>> +       ret = atomisp_pipe_check(&asd->video_out, true);
>> +       if (ret == 0)
>> +               asd->input_curr = i;
>> +       mutex_unlock(&isp->mutex);
>> +
>> +       return ret;
> 
> 


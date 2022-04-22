Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3652901
	for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 15:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650641560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+o3QI2qLDiKgmdGnQtt8Rgfs8/7qkV8vtGRNkkMknPA=;
	b=Xt0iXCLbVFLKSvqCepAXk7968Z01ZoKcxxFe53Hy6ikWQ/dq6HcPAnh24WAY3VVnWFOR2Y
	HbRckHpJ20P17A0G4L1s0HX1ETIwtA9NzrQ1Q0VEk8xgil6P6LF2N59ScxIBAKya/+2b8g
	+JaohGDQtSX99SepvX/g+AdpF8UqrCc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-xCkQ92CVPVyecRsJIStq-w-1; Fri, 22 Apr 2022 11:32:39 -0400
X-MC-Unique: xCkQ92CVPVyecRsJIStq-w-1
Received: by mail-qt1-f197.google.com with SMTP id j18-20020ac806d2000000b002f354e9bc9eso2327410qth.10
        for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 08:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=+o3QI2qLDiKgmdGnQtt8Rgfs8/7qkV8vtGRNkkMknPA=;
        b=1MR/NWhkzJTjH6KAjLBFUVZZsAh0cHWADdrN0GIBWd0yPUogLdQUW+PNnmeFnCYn5c
         +3xJ5q2vzjMaSxV6l4xvcRwaFJ3kqKpSW+blsOHVJ/nSx7GS6hg4Q5oQrUMnATc/YEno
         Aeakn9/6RkVB8JTiNRLyO7+Xcc0qkkikPnKW71zr1YIa42MlvSUiLdwoaSB1gPY2EZ2B
         3Hi180jgaioqjqS4ZqANo8IzQWfpyBfTyD10Z1PD7SDBXraR83sN7NChXlsX/JWoEoq7
         aHOZi4foCi0ZKXSFXq500guvjSS21iq8uzxk1nn3ZHTim5dBDhlpDlfJTD+ag1wjpMYG
         Q4Dw==
X-Gm-Message-State: AOAM530cDv/35ReGDaqvYQ4qDZr3znVhetIh7sYyt5BqvDJss3b+WRhu
	QBR+HfJwOlj8ahXEXJI0h3gL7GzjwuqKI5ydY6ILVkfDVa9Y/viGeN80zqbKYNJCbbJzrmLT8IB
	IlRwtWlzKUXtIjkQsfaJVfKsyZA==
X-Received: by 2002:a37:8d44:0:b0:69a:224a:dc27 with SMTP id p65-20020a378d44000000b0069a224adc27mr2989674qkd.563.1650641559083;
        Fri, 22 Apr 2022 08:32:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyw3Fqo3Nt15GFg/eHVhsKryB84/WiPdXDZP8hr3iO7fiPjDzNqt+7pAsJpGw+YTIzbAezHA==
X-Received: by 2002:a37:8d44:0:b0:69a:224a:dc27 with SMTP id p65-20020a378d44000000b0069a224adc27mr2989647qkd.563.1650641558767;
        Fri, 22 Apr 2022 08:32:38 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id v3-20020a05622a188300b002f201623acasm1364883qtc.50.2022.04.22.08.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 08:32:38 -0700 (PDT)
Subject: Re: [PATCH] staging: vchiq_arm: change vchiq_platform_init from
 global to static
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: nsaenz@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 gregkh@linuxfoundation.org, stefan.wahren@i2se.com, gascoar@gmail.com,
 ojaswin98@gmail.com, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220418164356.3532969-1-trix@redhat.com>
 <20220422144423.GI2462@kadam>
From: Tom Rix <trix@redhat.com>
Message-ID: <4594e273-caae-686c-4a4e-875a7bd70e0c@redhat.com>
Date: Fri, 22 Apr 2022 08:32:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220422144423.GI2462@kadam>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 4/22/22 7:44 AM, Dan Carpenter wrote:
> On Mon, Apr 18, 2022 at 12:43:56PM -0400, Tom Rix wrote:
>> Smatch reports this issue
>> vchiq_arm.c:466:5: warning: symbol 'vchiq_platform_init'
>>    was not declared. Should it be static?
> This is a Sparse warning, not Smatch.

Yes, this is correct.

Though I am using

make CC=cgcc

And forgot which one I had installed last.

Tom

>
> Use this command for Smatch
> ~/smatch/smatch_scripts/kchecker drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>
> And this command for Sparse
> ~/smatch/smatch_scripts/kchecker --sparse drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>
> regards,
> dan carpenter
>


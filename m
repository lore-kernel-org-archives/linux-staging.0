Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93C91A238C
	for <linux-staging@lists.linux.dev>; Thu,  1 May 2025 14:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746108473; cv=none; b=MbVlsF4orlHhiGbxE8FDdE+Z9iX0qVeE5vKM4gy6Din4MlY3wW5NBYp9CesncLISTG/Na/FTymTkNoAXEKNx3m2FBWeaSE51byFSoC8+89gROKISz0qmOWqU1zNXAKv0ZJu62jyXJU5q9661/GzzRoNqeFt7CW8yJqDRATtSr6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746108473; c=relaxed/simple;
	bh=9lC6JDyhN5Ye3uhPem/9/CiQIrSt2QGWIsm0S3JRraA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mMqxqDNC0e6xlHGszqXjB9DjvmNS1nMNK1PCinKLmcJoorMErWd1d7FudVlV4INnBy+KyWGPejvkSfHSgCKvj0wVz8zRTSh2pPqfpo9xF1lvxZ10FE2sQAcwPyBkpY3L4m9+/waZJf2jTt2sEgWHmgP2pPGrFF+sPvQsK48bORA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ig5E0iqK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ig5E0iqK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746108470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AcrNyKhVOmoLr0oSNLK0T/cJNvY0MVzyEpaG1k/ubdI=;
	b=Ig5E0iqKnEpHTKljrXhzPHX4s7q099/YaT08OGI8j/z5kMnHWzHY3pJ8ECpUl0Izh8mB3X
	MC+DGhw3CbWQ/U0w+QIuSyIuRzbaS+j1YIhZmF0SO38tQpeV2eVt2Kghw0G1CDUNwpNlNp
	QvRYm8ysfojoQ5jFaUQ5Mt0HV7RmpK8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-7RTxYKbaPSKZ0gowBLXDuQ-1; Thu, 01 May 2025 10:07:49 -0400
X-MC-Unique: 7RTxYKbaPSKZ0gowBLXDuQ-1
X-Mimecast-MFC-AGG-ID: 7RTxYKbaPSKZ0gowBLXDuQ_1746108468
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ace99fe4282so107622866b.1
        for <linux-staging@lists.linux.dev>; Thu, 01 May 2025 07:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746108468; x=1746713268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AcrNyKhVOmoLr0oSNLK0T/cJNvY0MVzyEpaG1k/ubdI=;
        b=gtpGpP8PpfCIVxi4sXvWT/6QM4QOkGxotsnY10+/dMmq9atvyL9dG6L0LVMn+18cua
         CqCDP/kELgtfcJtv04sczZZ40E5BlcGvDg478LTtu6iargNGoeOHBD3jTdiR1Zg/m/n2
         53AOKZMazDUpYKEWwQRdEquj4yvcEDfOqPYPee9RBjd3cyHai8EV7mwVhVkVv9tj5yuU
         b24gIr42Z3qgoJhV5+XqczgL9WdVTCvmHmI6wQ0FTgciY6LO5jed9gtXDesI4H5rOws5
         3JQHzc7zmX2VTpSWqtp2Y4ACyB7W1KzJ3sO8sWpGbpFACMFW5eDm5cL6FFB3aSYuaTny
         y86g==
X-Forwarded-Encrypted: i=1; AJvYcCUygy4esGhaCeXVxFRHShAiwYlIbqN17SwtxmOeu/XbxQpRxdu/FmMptLN47sjHtJW6rM7xPY7GiRn162Ls@lists.linux.dev
X-Gm-Message-State: AOJu0YyswYXROfEwSif/KwIJx7ul8vPk/XfXCxErwl8Mc/s9IYj79UAx
	hpDVMBSJkPhQ8BtexFzIWSqYfC3UvaYJnLlqoWGM2+D/2jPAdDFcwW69lAbxwcnGrjSs7OGceAr
	NNZBtoxZ0WwdjM7oxiH9u8x8q3TU07BfnQNiYBpDyYl1t/toCKz4W6+N30osEZOa+e7xRQBE=
X-Gm-Gg: ASbGncvKtt3N5qwMa7V9m7u+qwzFRtWcG2UynnTtWIkboYY68gDv2eyrzB9lol9XME9
	5+JgG1+ciRbhn2kQRhi3lXEXsnp/GhM8sES0Iszy5xVZN/WTCf0kRfl6S4g7vvL+hKU+7fPUDK2
	QLZTUeFZ5ctR4cXndijFtwhsbjItacU7BtHSdIULTVUr5jibcORuZf+JDMx4QdxhG6iNlbYN23K
	S/6oNNAdb+auiz3GMq3D4JHnt7uNiia6nQQBXmLvc3jt4EGNAQ+OY13yRLTRyohdaApPtlBF8oH
	vrX/EaFsmkDgNrP1JPSeK4YJ2ZZmu8ABRZALeLIwo7yzoR9zWYiEBARTEOqDMX5qqFyX/tCc/X6
	sIGO6SIVNqzS2HHMh6gPnW5pKg+VrnHgBb0ijKcZ4zvbZsT6f5r0qEKWqwt9ckw==
X-Received: by 2002:a17:907:bc96:b0:ace:dc05:b186 with SMTP id a640c23a62f3a-aceff3c3dc2mr205250866b.21.1746108467778;
        Thu, 01 May 2025 07:07:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOaCqfR6tnOcmlekhmwPg9qvklGDS8NHNOZ/TTonxjbbreUzOoz/tZ2SucDrZZ+SKYUtYWjA==
X-Received: by 2002:a17:907:bc96:b0:ace:dc05:b186 with SMTP id a640c23a62f3a-aceff3c3dc2mr205246866b.21.1746108467411;
        Thu, 01 May 2025 07:07:47 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da55af28sm44458566b.125.2025.05.01.07.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 07:07:46 -0700 (PDT)
Message-ID: <829bc6a0-bb93-46db-b039-5df0a68ce0b5@redhat.com>
Date: Thu, 1 May 2025 16:07:46 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: atomisp: fix spelling error in
 ia_css_sdis2_types.h
To: Liu Jing <liujing@cmss.chinamobile.com>, andy@kernel.org,
 mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20241209064022.4342-1-liujing@cmss.chinamobile.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241209064022.4342-1-liujing@cmss.chinamobile.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zlWPjTpJNs7nZfiqXxU0HLaE8nt_fFwyE4kiGNnNhRw_1746108468
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9-Dec-24 7:40 AM, Liu Jing wrote:
> fix the coefficients spelling error in ia_css_sdis2_types.h
> 
> Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans




> 
> diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h
> index f37802878528..2bed08435755 100644
> --- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h
> +++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h
> @@ -19,7 +19,7 @@
>  #endif
>  
>  /* DVS 2.0 Coefficient types. This structure contains 4 pointers to
> - *  arrays that contain the coeffients for each type.
> + *  arrays that contain the coefficients for each type.
>   */
>  struct ia_css_dvs2_coef_types {
>  	s16 *odd_real; /** real part of the odd coefficients*/


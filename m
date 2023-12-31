Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7556112
	for <linux-staging@lists.linux.dev>; Sun, 31 Dec 2023 09:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dEUTQIqU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704015853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aoRYRzmOMOJJ4RXzl3IlNI75xYwxW5bvz/7dVLMLKv0=;
	b=dEUTQIqURD9lqtqIonEFE2c2lgBthQNcrWHp+gng2kv9yQBsCykAQRS6Uu3KJjuXGW+n1v
	ZU/kCWyKqROvqUM/R2zUJUf8rTXIw8e3qd1QreQARsjYttsp71mNLGrPSW5U3Yw8LAnc8E
	IvDCBAtw4SbEMJuiOmjoUQRCP96Hcw0=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-jT-ORuhLNTytwevX-jq8ow-1; Sun, 31 Dec 2023 04:44:11 -0500
X-MC-Unique: jT-ORuhLNTytwevX-jq8ow-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-50e91f9d422so1393872e87.2
        for <linux-staging@lists.linux.dev>; Sun, 31 Dec 2023 01:44:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704015850; x=1704620650;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aoRYRzmOMOJJ4RXzl3IlNI75xYwxW5bvz/7dVLMLKv0=;
        b=qE6psGrz8bssgiuqKM/AVNLbpSdmi/vAd4Y0rS0txQWcZL1sBA5qVLghBw0y0B1htU
         5ib0FzAP+3WV4/x25JpLiuePLdyf7MRtq0a9snsN+PEm5wDjeEPvIuk6YpzrEMih/asb
         R5Y3AF36DmXsdW56G9O68vDhMOTu+ak7mIKkETIo2hAMnD54nKNVN721cUyGUmh3ZA9Q
         V5Bv66DHTq/njp7WPcucTj2YKwe6AN3YlyGkz4ZLn8PS8jyTSPf40nXP44AefFzkbzE+
         QB74OF7F90AL4KEOecuQNDuHHL+JJZLJNKW/t+9HLpeSKQh5Zp9Buk/BxMESmiNG0/+A
         IlmA==
X-Gm-Message-State: AOJu0YzL7I7n/8GNRrlkEzXi5LqzH/XSNx0GBeTaSuX6wvGyJoiv9pC+
	eLl0zi2HJSXy3WrB1myjtysHBJeTfJDRs3WDHmPkR27ETFtfVRClQiB+K9AeQXsgEySgXTEjcbB
	JoPAFQqlqTv8NojH/CjLszhPUB9mxAT8owg==
X-Received: by 2002:ac2:5e33:0:b0:50e:6b49:dcb with SMTP id o19-20020ac25e33000000b0050e6b490dcbmr5083332lfg.62.1704015850408;
        Sun, 31 Dec 2023 01:44:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzNZGGVmMW3iCVqv16siFv74SOZgPs6vzt0xYSpEq9SxVnRan3smFZvn81ZKSPyMltDFUZBA==
X-Received: by 2002:ac2:5e33:0:b0:50e:6b49:dcb with SMTP id o19-20020ac25e33000000b0050e6b490dcbmr5083322lfg.62.1704015850111;
        Sun, 31 Dec 2023 01:44:10 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id z17-20020a170906715100b00a26966683e3sm10072345ejj.144.2023.12.31.01.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Dec 2023 01:44:09 -0800 (PST)
Message-ID: <0856fd3a-4ff2-4dac-bb94-d7775bd535cc@redhat.com>
Date: Sun, 31 Dec 2023 10:44:08 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media/atomisp/pci/base/circbuf/src: Fix spelling
 mistakes in circbuf.c
To: Dipendra Khadka <kdipendra88@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, hpa@redhat.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20231223060422.77789-1-kdipendra88@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231223060422.77789-1-kdipendra88@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/23/23 07:04, Dipendra Khadka wrote:
> codespell reported following spelling mistakes
> in circbuf.c as below:
> 
> '''
> ./circbuf.c:27: whehter ==> whether
> ./circbuf.c:132: offest ==> offset
> '''
> This patch fixes these spelling mistakes.
> 
> Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans


> ---
>  drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
> index d9f7c143794d..2f484ef9d4b5 100644
> --- a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
> +++ b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
> @@ -24,7 +24,7 @@
>   **********************************************************************/
>  /*
>   * @brief Read the oldest element from the circular buffer.
> - * Read the oldest element WITHOUT checking whehter the
> + * Read the oldest element WITHOUT checking whether the
>   * circular buffer is empty or not. The oldest element is
>   * also removed out from the circular buffer.
>   *
> @@ -129,7 +129,7 @@ uint32_t ia_css_circbuf_extract(ia_css_circbuf_t *cb, int offset)
>  	u32 src_pos;
>  	u32 dest_pos;
>  
> -	/* get the maximum offest */
> +	/* get the maximum offset */
>  	max_offset = ia_css_circbuf_get_offset(cb, cb->desc->start, cb->desc->end);
>  	max_offset--;
>  


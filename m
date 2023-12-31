Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88B520E7
	for <linux-staging@lists.linux.dev>; Sun, 31 Dec 2023 09:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YcG9FU6W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704015594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p00vxKoEMhQVOKsnT5oQD5pn/y7oPEGUmKyIbH6tSV4=;
	b=YcG9FU6W06Q+enLfpyG7YBU8cnNEVitc01/wBGOjzbrM5ReDtIK5DAxf4atdA4GW7tnSL6
	hb9oTuuWfl/EsYfBdyKUgWAxlNGzH3w2twsyO8s43x9TPDj/WyTeS95pWI5AD/+DQAK6Du
	tOivfxs5iDu6skzmacDeLa68RrwiCXo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-O3uXmKcZO-6upgXtFfeUPw-1; Sun, 31 Dec 2023 04:39:53 -0500
X-MC-Unique: O3uXmKcZO-6upgXtFfeUPw-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-547dd379955so4465837a12.3
        for <linux-staging@lists.linux.dev>; Sun, 31 Dec 2023 01:39:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704015592; x=1704620392;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p00vxKoEMhQVOKsnT5oQD5pn/y7oPEGUmKyIbH6tSV4=;
        b=My+G9M9nSFy3T5SCTmlomBKSV0kdKDPW6iIHItOOhrnlwSviDMwS0pzF9Jlx+JLSHc
         e7Q6y71dsuW30CNy3311EalWTN86VLih/7pOTnNiWkUvnUO69TZxSw7CiPo4/0xXbQ+k
         IJF3AjYdZ8Ya8bOIBTGBWO+ecxGd7299bnN2S9qurCrryKEYMB4OxR70iCSHIdhUJzUB
         WQW4WTuuLsETD++YFpZ2ZcgxMdgUTaZlGdBHvWietB/LD7VgN+xFKnfjW+chj6oIIxmB
         QJ7dGGiRxa0akqKeTjll1NLq4h0omXKh/QNOTkL0QUHIbfKFPMCfarUpQZ8xA6/AUT9G
         jQXA==
X-Gm-Message-State: AOJu0YyW++7IUutbdFjjhPP0ivg+iUzQ1mZTqniq11aYN43BbXct1oob
	JSBDzDJUrmIYkjU1qseYPjNjfnQG/ua4U0y+5T6xzTtZVetry96KWOacQWu1JkkSwMNoM2e7ZLg
	cWudelz9Blhhn7Jpy8vA95KVFpwwR+p8PLNz5CgLDFg==
X-Received: by 2002:a50:f60d:0:b0:555:dc5f:101d with SMTP id c13-20020a50f60d000000b00555dc5f101dmr1016785edn.8.1704015592079;
        Sun, 31 Dec 2023 01:39:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9CSLi4539eGxiNxHCoTLDGqxn9HxSGEP8UxUiNunjYCYJMKg4e61V+O2clbJz5YKv2iw6vQ==
X-Received: by 2002:a50:f60d:0:b0:555:dc5f:101d with SMTP id c13-20020a50f60d000000b00555dc5f101dmr1016778edn.8.1704015591859;
        Sun, 31 Dec 2023 01:39:51 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ew10-20020a056402538a00b005546ba152f4sm10900308edb.71.2023.12.31.01.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Dec 2023 01:39:51 -0800 (PST)
Message-ID: <577086e4-c641-467e-b915-37d4ecfedb55@redhat.com>
Date: Sun, 31 Dec 2023 10:39:51 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media: atomisp: pci: Fix spelling mistake in
 isp2400_input_system_global.h
To: Dipendra Khadka <kdipendra88@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, hpa@redhat.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20231222201503.2337-1-kdipendra88@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231222201503.2337-1-kdipendra88@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/22/23 21:15, Dipendra Khadka wrote:
> The script checkpatch.pl reported a spelling error
> in isp2400_input_system_global.h as below:
> 
> '''
> WARNING: 'upto' may be misspelled - perhaps 'up to'?
> //MIPI allows upto 4 channels.
>               ^^^^
> '''
> 
> This patch corrects a spelling error,
> changing "upto" to "up to".
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
>  drivers/staging/media/atomisp/pci/isp2400_input_system_global.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_global.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_global.h
> index 61f23814e2fd..3ff61faf0621 100644
> --- a/drivers/staging/media/atomisp/pci/isp2400_input_system_global.h
> +++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_global.h
> @@ -19,7 +19,7 @@
>  #define		N_CSI_PORTS (3)
>  //AM: Use previous define for this.
>  
> -//MIPI allows upto 4 channels.
> +//MIPI allows up to 4 channels.
>  #define		N_CHANNELS  (4)
>  // 12KB = 256bit x 384 words
>  #define		IB_CAPACITY_IN_WORDS (384)


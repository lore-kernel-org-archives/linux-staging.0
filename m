Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EB91EA7F4
	for <linux-staging@lists.linux.dev>; Thu,  1 May 2025 14:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746108852; cv=none; b=rhKAg1poU+0RbnVzBteiYdF9PMlvAZXlKOGA5sC2EtkJJ17odK/KF3NktGALjQFLdpnSZiXNFarZw5YodEkw8bu80bn8e6o8JW9CsrVwm+5o4Msxdf9tdtkfDIIDIIfILk+EffzsoXd248RU9AM9kCvTneNjbgjAcOuDIZGz6ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746108852; c=relaxed/simple;
	bh=Beg1GyH5S7/erDqJpe9re516yOROLxGZC4WtaMJYpu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gW5mM1dBLe8HFaQ2yYPUK9Vjuzu3TPhIhHWWniNaDozPWE3OL5J7J3JEIliBX8AMowtgOGIgzAvJ4WtEaq92nJaiW9+u1Oz6HItnzrknz357nMAuWgYb6DnbJXU/yjYOv8IuiJfPKS18TDRVlql4ew05fkArUJVIH3DcJhp7Jpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C+sGxq2f; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C+sGxq2f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746108849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z2StXVt1J4ePYsdVr3FmCxU/oSwiVjfWoayP+B4Hirw=;
	b=C+sGxq2f1V9gW5bdDU1JMEGfakSWZ97CM4Zp/gsy4MJB93gK4P6UQXnqsYuS7C/WKf3e7C
	xWjoS8X3hldi7UFb3wMbPSMzqqVEaSGst0X+gHQkq5sLjAksm/s1r4LrKyrBGRkwV8Tvku
	EJ+sl3dv1txtEg5sUjGVKzBhbZv/QwM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-vZlWERbxMOK7J6XSzX29vQ-1; Thu, 01 May 2025 10:14:07 -0400
X-MC-Unique: vZlWERbxMOK7J6XSzX29vQ-1
X-Mimecast-MFC-AGG-ID: vZlWERbxMOK7J6XSzX29vQ_1746108846
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac293748694so107052866b.0
        for <linux-staging@lists.linux.dev>; Thu, 01 May 2025 07:14:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746108846; x=1746713646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z2StXVt1J4ePYsdVr3FmCxU/oSwiVjfWoayP+B4Hirw=;
        b=itvmSPkdv2WEgBo2O4p0kJ2YeJOHaTNXGdiB10pFGzvYuS9971344GeInr/x3ZOVZi
         fb0nnMUzQmdsfM8KH1YQNE6yh6gKm01/BXpf7gcdYIBOEMZDhp6y3afud0XFg0UP53Va
         pxxMAzJa1V1mjfmr7BVYakwBvU+Gmqk+QkhqLY1UBxo/MDmuBmIjK9BDB+skCNh4tZDK
         MrtN6/n0e8aLFK5M/tBJsh1ttQl7AGKkLnb4ncP5gCVL8mhi6SFPspW9eJTn1wxgO8IT
         o7D+3NFlvTh1Ef7WGQhRAnGwzO2Sp18Bw6aE6C9E+XwNax/kHn+XFFr0dUUqdsxGBfOk
         Ry5w==
X-Forwarded-Encrypted: i=1; AJvYcCVvmjAByGrS5SkJuxnbvqm41LiLWNT+i68bLMCYu8LKd97sR8HIwkjbr03nuWner5UdjKgIN4xg30HpzYBY@lists.linux.dev
X-Gm-Message-State: AOJu0YwYDD7x7/Hr8GNQ8uhXzi5znxIWWa2HiBkyPbD+mQUExaOunShp
	vouKdrdUnfZoIfeWTMS4Vs6wyLswZntLz350Et1AzP5kkww6WOJ6hMXm4PREn75Grknsyum6CVf
	6OAQWncXBSvbbv7XEIKniKJI4d7Z4ykamCXlLFvBjzfQG8F1Qg5qIZShAnD1SP8Y=
X-Gm-Gg: ASbGncsBRr69oW0xKJGgReA5iJZiMIRPMJ2xl9rhcE5jyZqUA4M4s5CCsOPLorglkeu
	jJrrT+UmVn7SMqu3ZWyatZXAhPm9tfvv78gW1SGu/YTjgCzgrTRwMul8t8wCgOn/MPm6YNli2wV
	pYXNPVywIfdjcbleD4AXsw+C98UVSV3mGwPyC1Nj+BSfilQN50MxfDafsKLv09/77Y2HxnXAl3P
	mpptykZfVBKnA7kkI3eHwhhDgHovrpvwCh68ai94rBjW9Cjovd84hfbKrxpSihewM70Y7oo6NFE
	hprr2KjqDNToQxLOaM/+uCPLn2xJvib/dq9iw3xiiHa9ZJeAKS1EEBPLo0N21OR+0P1TjPUywe+
	zfXuvsrdJGbv93E6x5VvfZ/9aSXqsmktJciY6oZWTB0fZVrmqtczu2xfXT6LNKQ==
X-Received: by 2002:a17:907:d92:b0:ace:6703:3cd5 with SMTP id a640c23a62f3a-aceff41a4e2mr236739166b.19.1746108846079;
        Thu, 01 May 2025 07:14:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1cvJ7TbAgmDjQAwVoYe5SoCoqChs3iKAeoX+tVWa1yU6aUPS0thllVgI3NeCYyTQl3R70aw==
X-Received: by 2002:a17:907:d92:b0:ace:6703:3cd5 with SMTP id a640c23a62f3a-aceff41a4e2mr236736966b.19.1746108845651;
        Thu, 01 May 2025 07:14:05 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da55afa1sm45536566b.131.2025.05.01.07.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 07:14:05 -0700 (PDT)
Message-ID: <b1007aab-c433-4a00-86c9-b448d1509c85@redhat.com>
Date: Thu, 1 May 2025 16:14:04 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: Fix indentation to use TAB instead of spaces
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>, linux-media@vger.kernel.org
Cc: andy@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <MESSAGE_ID_OF_V2_EMAIL_OR_REVIEW>
 <20250407123608.366190-1-gshahrouzi@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250407123608.366190-1-gshahrouzi@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ALNTk7Z-jtopl-0xeGrYBz5O1fta7A8pmBjBq1VgcmY_1746108846
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7-Apr-25 2:36 PM, Gabriel Shahrouzi wrote:
> Replace spaces with TAB to comply with kernel coding style.
> 
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---
> Changes in v2:
> 	- Resend using git send-email to fix formatting issues in email body.
> Changes in v3:
> 	- Use media prefix.
> 	- Capitalize tab to TAB.

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans




> ---
>  .../media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
> index ece5e3da34ee..127f12ba2214 100644
> --- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
> +++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
> @@ -114,7 +114,7 @@ configure_dma(
>  }
>  
>  int ia_css_vf_configure(const struct ia_css_binary *binary,
> -		        const struct ia_css_frame_info *out_info,
> +			const struct ia_css_frame_info *out_info,
>  			struct ia_css_frame_info *vf_info,
>  			unsigned int *downscale_log2)
>  {


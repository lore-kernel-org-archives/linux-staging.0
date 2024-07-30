Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7732F19FA66
	for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 13:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722347015; cv=none; b=egJEeab1RMuZHcJ+XygnzoPJHtqlwr43V/2dWGlLIyx0VY9PrNRmU+viKuXwKPMimzAn5Z7CMZX8g/YLoQKe2if19gResGICXLgDaACzOOKvKMaILnNS+RcVLOcgtjkQxdOLlWJCb1hbmJTxIWJEOvD0xWS21guxtDicmUpTW/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722347015; c=relaxed/simple;
	bh=fEeMyQpbe7hW1c3kPn8049ViTcs11muKc2j6GTTlrFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qbpy7rd8+UoOfBuTdv/Zdt+72Y4K7dUrZsrT/skoJpsJYQFIiG1RAFZsGCTGYT+mj0oQeET7M1GumIs27CnhoOeGe7YewUjr/0mc5WwkrNjE62Qhvcvo81TFLquWe+Uo7Hm0Er6itOlFqSvORBDqVU08KisJodHo241H5WVVtGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TVmaIhh0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TVmaIhh0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722347013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lIKQ8Grre4gzjcjmQf4lltrimuZ0xoo96Uhzmgo74TQ=;
	b=TVmaIhh0D+9g5EY6E34gWg3lEQqjhhC98yWELD1ngbHUOBUaEt1t6Zk7lyx6yvvlXKHiIg
	QaEHlrDvPIQKgmNW+HroBc6NUkm45nj0HwY097X30NEP7iS+xcc9pS6QcvC+hN0Su9NzPZ
	grvHxyIB2XPdni+/B2ywXPnNjkVZqq0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-gcLhDTv2MOq2Vmb7g3xj9Q-1; Tue, 30 Jul 2024 09:43:31 -0400
X-MC-Unique: gcLhDTv2MOq2Vmb7g3xj9Q-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a7a8d5ad9bcso334377866b.1
        for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 06:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722347010; x=1722951810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lIKQ8Grre4gzjcjmQf4lltrimuZ0xoo96Uhzmgo74TQ=;
        b=mfT8PHXNHsCK+W6oxiMf9HGpRjqE1J0f+xk7s16/3YHd8yZeHLbfS9d+KYj0wG0LG9
         +zUJAJjODPoPgslE58t9vcan4Tz7yeZ/P8Rli6kAbp7cp3/mAiRSpnZVjLm9js8Cdwyv
         aF+hKMQDwcrXG23Hos/U44hhbt5ssvjpDUSHTSRN+PqTcJZEx6IWLdo8UgCNciCPKi67
         LJzPR3IDP7j7qGxwD1OOX1qq3kTMdph18GklhkfGgbQvNnNQS8MAm7bFZyP16XSlg2Ao
         obCTsX1USFbNxuMia+TPdErfdqHUtv/g8eynIwLV6O2BvopCbAzBkVEVwqrcUWsaMwVN
         C16Q==
X-Forwarded-Encrypted: i=1; AJvYcCWC6Q6ye+Ov686pYnpW8V9R6yxT+AyLNk0tfMwOZ4H4IpxD5JDAJ04AfopPlQ+bF3JR8iYL0utlAwGwGDj0k2pAa3xzggkJyr6PAubLyg==
X-Gm-Message-State: AOJu0YyjxhGZ0G/amcRRuUsHx4CeR/WKM1Bxv72IJnirR8h+ytZSeI1z
	WCHhAVr+QM+4wCVnnEhLCaoqVhqcl0u5a6NLb2Wq+0F31RaMWDE6bAZQBrvCmmE5lRteoN3gaVF
	muzRPEtqEXMsdFDvIEqT+UVw+wPKqKedgFopQNinsDIJLSVRN8SkSYXuLgUiaOCI=
X-Received: by 2002:a17:907:d8e:b0:a72:b4d6:ec6c with SMTP id a640c23a62f3a-a7d400bb2c0mr810840466b.33.1722347009694;
        Tue, 30 Jul 2024 06:43:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGr2bhyq9b3mRAXR4ScB9mSPQa/VqSDPkEyk7KB6VJG2Hb0KepNOOSVf8hvsqrlqQD3F5QpPg==
X-Received: by 2002:a17:907:d8e:b0:a72:b4d6:ec6c with SMTP id a640c23a62f3a-a7d400bb2c0mr810838166b.33.1722347009227;
        Tue, 30 Jul 2024 06:43:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab5151csm642601266b.74.2024.07.30.06.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 06:43:28 -0700 (PDT)
Message-ID: <389396f9-2b07-4d7f-a609-747f3abd4864@redhat.com>
Date: Tue, 30 Jul 2024 15:43:27 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: rtl8723bs: remove space after pointer
To: Kartik Kulkarni <kartik.koolks@gmail.com>, mchehab@kernel.org,
 akari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: ~lkcamp/patches@lists.sr.ht, helen.koike@collabora.com
References: <20240730134155.37784-1-kartik.koolks@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240730134155.37784-1-kartik.koolks@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/30/24 3:41 PM, Kartik Kulkarni wrote:
> Fix checkpatch error "foo * bar" should be "foo *bar"
> in osdep_service.h:105
> 
> Signed-off-by: Kartik Kulkarni <kartik.koolks@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/staging/rtl8723bs/include/osdep_service.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
> index cf96b5f7a..d6d651342 100644
> --- a/drivers/staging/rtl8723bs/include/osdep_service.h
> +++ b/drivers/staging/rtl8723bs/include/osdep_service.h
> @@ -102,7 +102,7 @@ static inline int rtw_bug_check(void *parg1, void *parg2, void *parg3, void *par
>  #define MAC_ARG(x) (x)
>  #endif
>  
> -extern void rtw_free_netdev(struct net_device * netdev);
> +extern void rtw_free_netdev(struct net_device *netdev);
>  
>  /* Macros for handling unaligned memory accesses */
>  


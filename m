Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC92A41;
	Mon, 18 Apr 2022 18:46:46 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id 17so17836918lji.1;
        Mon, 18 Apr 2022 11:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Yhvd5iyykkmm2t4DgiqI0lAvcpTLrz7Y3LMOKJluMb4=;
        b=RXQYv43fTkIZutybdudszuCDQ+5uoNspnOjagrufG3IB2TG4CnwxbROrVtdujgt2BZ
         5QScDckHMthrdf2IiWrkOge43t+uGmSiHxK6kdx8Hqo3EgrEWZnk4FkUJTqROMfPLWWM
         0wt0lIRcTpraMjEe4vBEDcvLnNo0y5+OaWf6RXHO5S+bZxy3IyCIVq3qheJ4Vhbgmons
         aET3i0vKpLWjnozAlW+3ncOJd6mWpP2ZzIsEtZRNw+8DsVfzhoCgDRw+cBKMPLVNOSbv
         WjUlquwumJmI9GZVi61h/kGNlbEoBYAODi6RYw7O4O648oqPlk3hM7oRAGpphJAhPyYt
         55xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Yhvd5iyykkmm2t4DgiqI0lAvcpTLrz7Y3LMOKJluMb4=;
        b=FIGpL0bQd/1BIsQ9t1j0mg8ME8vzRJ4A3Mf6uXiuBNnx/KEhqc2QWgJyKN8vq1C2JX
         0lmL6MVUeQJyflNt6JBQ8vvYIsh3BWOpljZ6m+M7UfrzlVN2v7aA64LnNpZDZaTwMs8u
         aErup1iRIaRZqRxl4DoItn+FN/CHrop+nbnJmIB8YZqyZHcNYyBxjwj2dqIy1fR9eMxK
         TwzgqVopr+vFoM32vOs7kVAXNLetFIDQA9RyO3jkaSR+/f9rKrq/4Rqp+15vFM9ewRe0
         fI3OSqUzBlZ70bl+U7iCWcB57oTGwMU4A0vNeau9ux2/eM3x7HkS1TTqWhPyLMxquN7v
         +X5A==
X-Gm-Message-State: AOAM5300kknl2oY9UmYSeShQct9FS2B98tWjpN/6p1qpAu4BCY4gVekI
	PH8yEOO2fpOqJXr3HksQHi8=
X-Google-Smtp-Source: ABdhPJzVlK7+pWdjMe2nFAdPckzdSHgZC0yNofeQondbZW3lDFc8NgZdULeWU7EQR3K+OoB6CVL8gA==
X-Received: by 2002:a05:651c:508:b0:24b:147b:161c with SMTP id o8-20020a05651c050800b0024b147b161cmr7851048ljp.459.1650307604782;
        Mon, 18 Apr 2022 11:46:44 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.225.17])
        by smtp.gmail.com with ESMTPSA id b38-20020a05651c0b2600b0024b5fdd821dsm1203868ljr.102.2022.04.18.11.46.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Apr 2022 11:46:44 -0700 (PDT)
Message-ID: <c68a489a-384d-38c3-3cae-7faec28d1cbe@gmail.com>
Date: Mon, 18 Apr 2022 21:46:42 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5] staging: vt6655f: rxtx: Fix Lines should not end with
 a '('
Content-Language: en-US
To: Aliya Rahmani <aliyarahmani786@gmail.com>, forest@alittletooquiet.net
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 outreachy@lists.linux.dev
References: <20220418183113.19751-1-aliyarahmani786@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220418183113.19751-1-aliyarahmani786@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Aliya,

On 4/18/22 21:31, Aliya Rahmani wrote:
> -void
> -s_vFillRTSHead(
> -	struct vnt_private *pDevice,
> -	unsigned char byPktType,
> -	void *pvRTS,
> -	unsigned int cbFrameLength,
> -	bool bNeedAck,
> -	bool bDisCRC,
> -	struct ieee80211_hdr *hdr,
> -	unsigned short wCurrentRate,
> -	unsigned char byFBOption
> -)
> +static void s_vFillRTSHead(struct vnt_private *pDevice,
> +			   unsigned char byPktType,
> +			   void *pvRTS,
> +	                   unsigned int cbFrameLength,
> +                          bool bNeedAck,
> +	                   bool bDisCRC,
> +	                   struct ieee80211_hdr *hdr,
> +	                   unsigned short wCurrentRate,
> +	                   unsigned char byFBOption)

Indenting is wrong here. It should be consistent: 8 spaces should be 
converted to tabs

>   {
>   	unsigned int uRTSFrameLen = 20;
>   
> @@ -601,7 +597,7 @@ s_vFillRTSHead(
>   		if (byFBOption == AUTO_FB_NONE) {
>   			struct vnt_rts_g *buf = pvRTS;
>   			/* Get SignalField, ServiceField & Length */
> -			vnt_get_phy_field(pDevice, uRTSFrameLen,
> +			vnt_get_phy_field(pDevice, uRTSFrameLen
>   					  pDevice->byTopCCKBasicRate,

This won't compile. Please, always build-check your patches before 
sending out.




With regards,
Pavel Skripkin

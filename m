Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23037F
	for <linux-staging@lists.linux.dev>; Tue,  2 Aug 2022 20:10:40 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id s9so10813742ljs.6
        for <linux-staging@lists.linux.dev>; Tue, 02 Aug 2022 13:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=CixUSBcZNq9i0WpR8GtdvttXmNXU/G94pZeb65hTEM0=;
        b=WyNxtYqk3qeNX2OkEahMvbK034jsOfS/qAlqgpXcbok6ytj9bMkyg7zn1hiX32tp+/
         OEVHYAeSEdlMmm7Sc6SbDiw7Mx9W1vaadsB4Xkk/WBkl2toPvBPIHlr7yGzeFohoua9s
         dLAK1biH6/qLzRReNqLfwDG/bZnlOSo70OtmxpvLAoHfCyrlv6ycBip2qW/PYgBsxN1o
         jbkkIjkImEBZ8wQkzDMZdPt67/kUDDu7twHPSTzIhgHP+v+a8/ujqcNZZ++psR7/4hPh
         occvRR2zXeSz/WK65qdff/r4nsCevELyHFnBXmFme4DtRavFn/LwK+ImehnrnaZxbfs9
         hDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=CixUSBcZNq9i0WpR8GtdvttXmNXU/G94pZeb65hTEM0=;
        b=PSCHdsfb7cHtNookireFyhjdCq0lxlaRAnrioRO60Bs7XI8VtUO3Ck1i4CA9nNp3d0
         1kYO6UTKfaFoYHhAgDSboGUcPpodBCD1+uWwsLm9ksKGXOLtygwg+2/n/OGs5NrfTLjZ
         t83b8VyD1wQCBTmfDzDT5zULJ0MwG4DNXcdEPuTUy+NCFk02PcRivWBukITgeVKib9lj
         7Oo+3/YKSR90AwbJrVRMhZ3IwyTFh9X7Ndr0tCqNbVZrihqXFvhohppmcb1Re7e9i/AI
         NeYoCRb9TyeAOo9AdWjg8E7qKbYFNHjSqp4+GgBYCJBLE8sxHcxpbtJmaj3R6aOd3Ohh
         Qa0w==
X-Gm-Message-State: AJIora+H1i6MCLfMKdXVmkllH/tmxaiQermTjQKyDlSb39u8JyPW4vcJ
	+Y8rshZjY0Rb7wrSwxJ6dCo=
X-Google-Smtp-Source: AGRyM1t1sO0Omp3yxQjOR809RdRPIRBJhuRvsggT+FA6u4dXikm/vOHoeh7Yy9QJQO8lUgJaMi1KfQ==
X-Received: by 2002:a05:651c:11c5:b0:25e:22c9:19e1 with SMTP id z5-20020a05651c11c500b0025e22c919e1mr6791233ljo.428.1659471038665;
        Tue, 02 Aug 2022 13:10:38 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.227.117])
        by smtp.gmail.com with ESMTPSA id o18-20020ac24352000000b0048af397c827sm1161237lfl.218.2022.08.02.13.10.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 13:10:28 -0700 (PDT)
Message-ID: <2e838551-e6a3-df5d-a889-baf60c7f99fd@gmail.com>
Date: Tue, 2 Aug 2022 23:10:21 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] staging: r8188eu: convert rtw_set_802_11_add_wep
 error code semantics
Content-Language: en-US
To: Phillip Potter <phil@philpotter.co.uk>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, dan.carpenter@oracle.com, martin@kaiser.cx,
 straube.linux@gmail.com, fmdefrancesco@gmail.com, abdun.nihaal@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220728231150.972-1-phil@philpotter.co.uk>
 <20220728231150.972-3-phil@philpotter.co.uk>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220728231150.972-3-phil@philpotter.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Phillip,

Phillip Potter <phil@philpotter.co.uk> says:
> -	if (!rtw_set_802_11_add_wep(padapter, &wep)) {
> +	if (rtw_set_802_11_add_wep(padapter, &wep)) {
>   		if (rf_on == pwrpriv->rf_pwrstate)
>   			ret = -EOPNOTSUPP;
>   		goto exit;

is it intentional to ignore an error in case of rf_on != 
pwrpriv->rf_pwrstate?




With regards,
Pavel Skripkin

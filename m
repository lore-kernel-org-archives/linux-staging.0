Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2697B
	for <linux-staging@lists.linux.dev>; Sun, 19 Jun 2022 13:27:24 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id c30so9255363ljr.9
        for <linux-staging@lists.linux.dev>; Sun, 19 Jun 2022 06:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=USwIgojHd+4gk/AHbWFfWMNbK7HorsIidQTsMQSbCVU=;
        b=Q/hemLjSDMFkO9Tg2NsP1VHpDtRMriHHdj38JIvhf5xuu2VMIEranCy3wePWG/sOwL
         g2ipGRj5Q0JlVqylTQuFi0DqLS2hhbkikTIR7XdWkuSsI+a3dwVSNgDxdvo1N6K1V/qN
         Lp6d0mKXIdday0bhE4F+C3tGVeu/fel5UujWfGf8p4bU23F7xBV1FYGwOMj4/pqdN9Zn
         aJe844J0GEwbElzCJ4fypWgjAqWuLH9QpXDveA7IarAw4aTFj22h9jb2kdC7SHpIpUEV
         xe/jmnXzFAcVUToTNmklLXjQ4a5XUP5HybuECVzsYV+sAD3qwxxr7OIgTS5ivumn81lX
         FQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=USwIgojHd+4gk/AHbWFfWMNbK7HorsIidQTsMQSbCVU=;
        b=Z7cWE1+VGH5CyVr83CoL7X+YtXEID6t0ERCuZ3LiYUZNl2kLbxm2OrKfT5bHVMnq59
         muMuAV/tMyWf1l2rzWCqss+jVTP6KuNxKF3bnHETD4aXfw7sd9N+s2029sRZTgw4xWSP
         WwVavzSQyA6QM2edQUbWO3HQfdIvD+0G7Q9xoEst34dt8+jLApJTtOWTqYz7ZAdnkfId
         a9dq9nUS9jfS2Mz6caauVONSWNfYLzCMftcBOQmObuCBHO7kwwe/w4o0VqHdSRejynib
         BhaF/UxOGZRNY6v5a+7ZTGkmg1U2/H/YjVRFec96YGz2ZXcs2NPn1EE2el5es3rUdHku
         j6dw==
X-Gm-Message-State: AJIora9XF88lNWV8iGbK9hR5PGdaVvh/gNA2kEav8MEJVFBzwp7ac96p
	zD1ObxiC/bPkdFkS+k7RPwQ=
X-Google-Smtp-Source: AGRyM1u0JcyUxScgBS8laLu9CqwZlVR9LIrBtuS8pvs986OuPSuedixO1Df3jfGCZsSe8Y02oyijgA==
X-Received: by 2002:a2e:b0c6:0:b0:255:7c46:16b7 with SMTP id g6-20020a2eb0c6000000b002557c4616b7mr9577251ljl.383.1655645242642;
        Sun, 19 Jun 2022 06:27:22 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.229.27])
        by smtp.gmail.com with ESMTPSA id d18-20020a193852000000b0047f5f292485sm594946lfj.68.2022.06.19.06.27.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jun 2022 06:27:22 -0700 (PDT)
Message-ID: <91c9a0de-76f8-37fb-31b4-4401a6e35d48@gmail.com>
Date: Sun, 19 Jun 2022 16:27:21 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] Staging: r8188eu: core: rtw_xmit: Fixed a few coding
 style issues
Content-Language: en-US
To: Chang Yu <marcus.yu.56@gmail.com>, Larry.Finger@lwfinger.net
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220618204454.16071-1-marcus.yu.56@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220618204454.16071-1-marcus.yu.56@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Chang,

On 6/18/22 23:44, Chang Yu wrote:
> Fixed a few coding style issues and spelling errors in the comments.
> 
> Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
> ---

You are doing a lot of different changes in one patch. Please, separate 
each clean up into its own patch




Thanks,
--Pavel Skripkin

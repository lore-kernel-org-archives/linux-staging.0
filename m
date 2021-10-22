Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEB02C9F
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 11:47:13 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id w14so1900834edv.11
        for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 04:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t4Cy9ohriiGmBTdEfniJu/CEaDeRwPhyDAxiO98jLEo=;
        b=bKk533ufU6iiuuZpomfqR91e1+Gp1BeUkkXUORXj57pDqd6hhxJ/aWJkXl0uRAoHyy
         RYIUxI/fY2iEHj7tuwXjpqDdZSsOTv6mqUO8OvPzAxMB+HmJ1+aqhtv83AoTv6maQsg6
         FjShq1lezZLutpJKpasMt8lwVlFIdUPtNm+QoyNIly+BckKA7AzNFlMSLJXRKRljBzvm
         RMLS1gP39iLAlSbv0ZciN5VMu2XbzsPxk7C4QJRXRQIzqnExBtwmWQ61tt6f0JNokwZm
         6HmR1Xp4B4cAGdNQN/6oK1K1d9PIFmwYiERkoJ8MdltTo2r5LXT6nK8wqSrPQWgDlSuC
         q4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t4Cy9ohriiGmBTdEfniJu/CEaDeRwPhyDAxiO98jLEo=;
        b=eT26eO3dxbed+oLdzCnmvuHbBChKwLx0OfqY74DlfYY3R5lwjcgoTf/hYzwqT/Kv5a
         PRHNKtp6Ifcm+WUbttlnzX9FBlg8Di7VBQsvzMlZECsRF+77WN/fkQ1UmDyuWufYvN0x
         vwHf2A/ywt2HEv0+sHlblmRr3yd+iMS8gS3wqOVzGw+YNZKfooh1vOEcZZwbg9iOJ5yN
         cBU5N8+DhcodVy+6hp2u+zjnhm7wlkq2RvMHzxW7/tpk409JdJiqs7SUKf3mKa3wgVt6
         OGxtBeYrAKpQobSyn3enJLAB2ewPucqBu4gAMQVHDuwr3mOJX/lOdIyafjRpMyfLXnXD
         ++Qw==
X-Gm-Message-State: AOAM533tUXSUfK0g+XBbUJTdhj24bD9WrANHmTzOmEmeP3aIHsBQJDaZ
	8QCpZe9HgwV1zytR6wg67T4=
X-Google-Smtp-Source: ABdhPJxXqYCxmAF1ZJaLSg70/DuAGAe+CDC7iMoyWchm/IymTi1yPXROGEOw003Q9tZBbsK2JLwcpA==
X-Received: by 2002:a05:6402:402:: with SMTP id q2mr16462692edv.248.1634903231191;
        Fri, 22 Oct 2021 04:47:11 -0700 (PDT)
Received: from localhost.localdomain (host-80-181-148-119.retail.telecomitalia.it. [80.181.148.119])
        by smtp.gmail.com with ESMTPSA id j1sm4307029edk.53.2021.10.22.04.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 04:47:10 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org, Kushal Kothari <kushalkothari285@gmail.com>
Cc: kushalkothari285@gmail.com, kush19992810@gmail.com, outreachy-kernel@googlegroups.com, fabioaiuto83@gmail.com, ross.schm.dev@gmail.com, marcocesati@gmail.com, straube.linux@gmail.com, philippesdixon@gmail.com, manuelpalenzuelamerino@gmail.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, mike.rapoport@gmail.com, kushalkotharitest@googlegroups.com
Subject: Re: [PATCH 0/4] v2 staging: rtl8723bs: core: Cleanup patchset for style issues in rtw_cmd.c
Date: Fri, 22 Oct 2021 13:47:09 +0200
Message-ID: <7977747.61zFHCMloo@localhost.localdomain>
In-Reply-To: <cover.1634899405.git.kushalkothari285@gmail.com>
References: <cover.1634899405.git.kushalkothari285@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, October 22, 2021 1:37:34 PM CEST Kushal Kothari wrote:
> Kushal Kothari (4):
>   v2 staging: rtl8723bs: core: Remove true and false comparison
>   v2 staging: rtl8723bs: core: Remove unnecessary parentheses
>   v2 staging: rtl8723bs: core: Remove unnecessary space after a cast
>   v2 staging: rtl8723bs: core: Remove unnecessary blank lines
> 
> Changes from v1:
>   [PATCH 1/4]: Moved unnecessary parentheses change in PATCH 2/4
>   [PATCH 2/4]: Added the extra parentheses change from PATCH 1/4 here.
>   [PATCH 3/4]: No Changes
>   [PATCH 4/4]: Fix whitespace error.
> 
> 
> 
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 94 +++++++++---------------
>  1 file changed, 34 insertions(+), 60 deletions(-)
> 
> -- 
> 2.25.1
> 
Hi Kushal,

Version numbers ("v2" in this case) must be enclosed in square brackets, 
between "PATCH" and "n/N".

Thanks,

Fabio




Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF0023CD
	for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 14:30:22 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id h25so5291258wrc.13
        for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 07:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=3ItMjhvb1/hM2jNtzAM/HCEyjHx2yTDf8giphic99II=;
        b=Q+bqKn2kphZ6dkI4mNlHNqszn4boae0E/d/xBKmldgHQrzrmLOUjZyXGzBd9PX2ECn
         IYK84mP/abeHXWDoCOYulcBZO1pgSCfNJkYOr2le+FGi/Z57Q2Y5ZGItIiyJtWrL8eDG
         KuLA6BXfrRFs7ktJ+bLAvO2a2NstJNdVQz5kYdos/hpyNlBoC0ThHhpJR536oxMUJ3Df
         XExXODKubzBTrzjTQkJU2H3APAUCK1JS5B6B8J2fVdQyzRxQcpMXN2Q9h9VmKLrTVdhz
         zy4FcewLm5Q1jsyHbtrO74mdXdjqTF235POz/loiWtUrHaZpO45aE/uLY16JxqvHMDxU
         ciFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=3ItMjhvb1/hM2jNtzAM/HCEyjHx2yTDf8giphic99II=;
        b=qJ0ukPaUJEvnbKLEW6aM4wQa5PbSinLMyvh8CP2n3lkWhawmONvD4giH3HhgYkLLhB
         vFN3kayI7od8i29P2LqO+rAlJsSfsz+yKMI47ekeO0Y9uoj59Vf83WqqY9eDw+JUrt6i
         taVF0Qs/i+VCe4SpmWMIvuEz1JBL7nODlrD7n99R819Xr2/bx2eSfZrjEdOgBUux9Pfi
         m6Ywvf4++TNy6NocioUrbKSImtZxnPKNA6EQqjszzd9qU4pzQ68XXGFiZJEZG6OD9Z43
         Ux/22nHxMwBNIERXgUC/M7g3MReVsUyZOcqTEDbOwuoIeCXuwRYB52+4YVZDfoBATEvA
         hHSw==
X-Gm-Message-State: AOAM530m1e+gS2OYHjNgNv0kiCmhODsUFUXyMWfh6pYKwNwNdUOe+CJv
	7iSsnKgWEFyQu4n7sNGesXSYwg==
X-Google-Smtp-Source: ABdhPJzO4XZzgz0MgPEnN50RQJl3TakwYabgyyn0sJV65Y1f1DF3kHXL1X/rRZ3t7Oi9mzkALEpM+A==
X-Received: by 2002:a05:6000:249:b0:207:ab35:67eb with SMTP id m9-20020a056000024900b00207ab3567ebmr3951299wrz.222.1650637820657;
        Fri, 22 Apr 2022 07:30:20 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id u20-20020a05600c19d400b003929c4bf23asm1730656wmq.44.2022.04.22.07.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 07:30:20 -0700 (PDT)
Date: Fri, 22 Apr 2022 16:30:18 +0200
From: LABBE Corentin <clabbe@baylibre.com>
To: Aliya Rahmani <aliyarahmani786@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] staging: media: zoran: fix warnings reported by
 checkpatch
Message-ID: <YmK7+rQFwxcmMCfQ@Red>
References: <20220418171453.16971-1-aliyarahmani786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220418171453.16971-1-aliyarahmani786@gmail.com>

Le Mon, Apr 18, 2022 at 10:44:50PM +0530, Aliya Rahmani a écrit :
> These patches address style issues found by checkpatch in the
> zoran/videocodec.c file.
> 
> changes since v2:
> PATCH[2/3] : Rework commit description and subject
> PATCH[3/3] : Rework commit description and subject
> 
> Aliya Rahmani (3):
>  staging: media: zoran: use seq_puts() instead of seq_printf()
>  staging: media: zoran: else is not generally useful after a break or return
>  staging: media: zoran: avoid macro argument precedence issues
> 
> drivers/staging/media/zoran/videocodec.c | 9++++-----
> 1 file changed, 4 insertions(+), 5 deletions(-)
> 

Thanks for your patchs

Only problem is that your patch 1 did not apply, but this was easily fixed for applying.

The whole serie is:
Tested-by: Corentin Labbe <clabbe@baylibre.com>
Acked-by: Corentin Labbe <clabbe@baylibre.com>

Regards

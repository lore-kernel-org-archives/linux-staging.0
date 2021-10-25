Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806202C9F
	for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 14:07:01 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id u18so9682313wrg.5
        for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 07:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=YE/NzH8qBpbjmAapzAwapgPnCPKetXqI0pgiy9yOdQE=;
        b=L2dGHyNoFi2z+4ecIyz89lYHwy1pDFUGrmT7X6ovQeMSwRJjiNQ1ptux181OyYZQ89
         4CcnKb0YmJUuZ1HItQyP1HB1NQDmPVHLsnCXUJlC5kmnW3/QKBtREawB1ppLZmxjD3W3
         nK/ZDxQDTMsjonxm1NySHvHsi3s+6J/djsF8TXOyaTMq+oYq+ViWg+iLzctDo76SY4yU
         T9e20DiJrwxC8jHC/f+dgjyeGEsNRkFlDgiV8fq/pY4tCuYE+D7hDLQTRE1NZ+xFqERf
         DmozuhP74V822Q2Y3bOfywpz6WtJnuI/qrlGayFvw6TqdbbWOVty+m+8BgUVn4tQGojm
         /msA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=YE/NzH8qBpbjmAapzAwapgPnCPKetXqI0pgiy9yOdQE=;
        b=HzAgigyLvordZx/ej7rj9b8IP5T6Ee9Y+dlaGHfb71XzI3stKKDEezk9optYOp0V0L
         hpjuZLfHsRehAakzmhyffNcoajD0gDyuNQDt2yAiF8owufW0uQFNvHRDQ3k8vOgLh1g8
         owFXtGkLvl2hVFs3iNIvvJUcpHqVJ1pMIjaCD/3czsLmRdXzhOQ+VBCCaOc3vcmv1gNw
         dame/ANcER8VdpQh6T3iAHh0UggmfZRLQmsrGYIpYR53eD7sgoUtkDUaA2UCrwouskHu
         NDw1BBkug6k7aVLLRyMav7hEmydZi2EQgqNULh4+rsr+yjb9AMM5MmQr8O9fnq2cMi1W
         IuQQ==
X-Gm-Message-State: AOAM531AlVHnIqXOMWer8k8PKYLU/qdL43Bo+VB4RU4UgkEv/wvW3JDj
	6VoqLUZzpLlkOitY2E5FhBTTeA==
X-Google-Smtp-Source: ABdhPJyRYFvibtgc8IKqIHYknb4PmyxGSQKD0RMQUpWrP7fkWuU1HAthN9l4r9nE/QnuRmGJqgGJBQ==
X-Received: by 2002:adf:e607:: with SMTP id p7mr23358297wrm.30.1635170819465;
        Mon, 25 Oct 2021 07:06:59 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id p1sm5762489wmq.23.2021.10.25.07.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 07:06:59 -0700 (PDT)
Date: Mon, 25 Oct 2021 16:06:57 +0200
From: LABBE Corentin <clabbe@baylibre.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH v2 00/10] staging: media: zoran: fusion in one module
Message-ID: <YXa6AVRmkkEuE+XZ@Red>
References: <20211013185812.590931-1-clabbe@baylibre.com>
 <c2474663-3fe0-b0cd-ecb5-57ec370481e3@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c2474663-3fe0-b0cd-ecb5-57ec370481e3@xs4all.nl>

Le Mon, Oct 18, 2021 at 11:55:40AM +0200, Hans Verkuil a écrit :
> Hi Corentin,
> 
> I noticed some code review comments from Dan and a kernel test robot issue.
> Can you post a v3 fixing those by the end of the week? Next week I will have
> access again to my zoran board, so then I can test the v3 series.
> 
> BTW, I agree with Dan, just drop the 'Enable zoran debugfs' config option. It's
> not worth the additional complexity. Instead, just #ifdef CONFIG_DEBUG_FS
> where necessary (in most cases you shouldn't even have to do that since the
> since you have dummy debug_fs_* functions if CONFIG_DEBUG_FS isn't set).
> 

Hello

Ok I started fixing issues and will send V3 this week.

Regards

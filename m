Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606612FB6
	for <linux-staging@lists.linux.dev>; Thu, 24 Jun 2021 11:35:32 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id v12so2792901plo.10
        for <linux-staging@lists.linux.dev>; Thu, 24 Jun 2021 04:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5fbxh/5VAWoh2a2iqJ4ShFdp7c6ygfNf5JJPqxsGBW0=;
        b=CBeVgQ18DBl/KEDhp9RjDv+CWyRTPhA70WUl6Eq6zG2Eh4O1EkXc7q8BQPPxXvHL0d
         IYiF91sJkbYFAhyxh5xAMjthoujiyK7DwWu3I0u5BPQSCDit/z3ge0ZyirL3vwHoRzc0
         GHBzDktR683TDOwb+OdESTTD19NcYIIOnYJdWOw/Ua0a2C4n1CkbRATqL+RD9mEsHdGd
         by/wnP7e7ljVPo4WEqAnzTPmt2DF/Wyz8OiTwDx+Z08E5f/gnzgZ7eEoKrlLb6mPxLM0
         pcjM8ZPq4ZrUjxZlQ5GPEZg9V9kUo7Meab+BJOk8s9yfFo+n7QepA7O1KhF5TC2mO5DZ
         DNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5fbxh/5VAWoh2a2iqJ4ShFdp7c6ygfNf5JJPqxsGBW0=;
        b=pXjzFgiAXLcxosKLTg0TOtKHgnUjPGuYnRmP7UIBN1Fk9nRYPAaWmuGLjuDQERqK6n
         NztrvheeFrh4sViutHU4hGalf1Bmr60S3t9KFLTbiquWJanV1oP5XOnaRkLWFVRDOUmi
         h8hIHmHKV+TPHZK3AqX7QnyX/+WxCnodj6wv5fpy3oyeiWUdbLnhTnEBP51H5hjFxoLJ
         jCu71qEVA1qHp6epJ1+wAtARoZz07ckn1ydNlm7vqg1Hb9/rYzwv5jLUT47tr/q3muEe
         HfCJ5WPj3Ce9QoPzBEJbEX3UvyIatiARjKrnJOUe8Lzcq9fnn8GV72ycY6A3OmIKERI0
         56rw==
X-Gm-Message-State: AOAM531twAOOmqDub67MRTAGUnw+reuITUKlQAhFPELKVdnswBp90DT+
	bC7VpytRqePgZHfFbeTTKig=
X-Google-Smtp-Source: ABdhPJyqAtCNwVRVd25OYX02VeZWBbjsMFCRxxApl++5lb/Zm6XOEV7KFPDeXiTBJezI/VKygEdMCA==
X-Received: by 2002:a17:902:b105:b029:127:9159:65e3 with SMTP id q5-20020a170902b105b0290127915965e3mr3879272plr.80.1624534532023;
        Thu, 24 Jun 2021 04:35:32 -0700 (PDT)
Received: from localhost ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id h8sm2428058pjf.7.2021.06.24.04.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 04:35:31 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Thu, 24 Jun 2021 19:34:56 +0800
To: Benjamin Poirier <benjamin.poirier@gmail.com>
Cc: linux-staging@lists.linux.dev, netdev@vger.kernel.org,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Manish Chopra <manishc@marvell.com>,
	"supporter:QLOGIC QLGE 10Gb ETHERNET DRIVER" <GR-Linux-NIC-Dev@marvell.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 04/19] staging: qlge: add qlge_* prefix to avoid namespace
 clashes
Message-ID: <20210624113456.ofqdpdowmqifshnj@Rk>
References: <20210621134902.83587-1-coiby.xu@gmail.com>
 <20210621134902.83587-5-coiby.xu@gmail.com>
 <YNGXfu/wGcKTuJYA@d3>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YNGXfu/wGcKTuJYA@d3>

On Tue, Jun 22, 2021 at 04:55:42PM +0900, Benjamin Poirier wrote:
>On 2021-06-21 21:48 +0800, Coiby Xu wrote:
>> This patch extends commit f8c047be540197ec69cde33e00e82d23961459ea
>> ("staging: qlge: use qlge_* prefix to avoid namespace clashes with other qlogic drivers")
>> to add qlge_ prefix to rx_ring and tx_ring related structures.
>
>There are still many struct, defines and enums in qlge.h which don't
>have a prefix or mix ql_ and qlge_, some of which conflict with other
>instances elsewhere in the kernel.
>ex: QL_ADAPTER_UP
>
>I think they should all be changed, not just the ones have a conflict
>today.

I'll fix them in next version. Thanks for the reminder!

-- 
Best regards,
Coiby

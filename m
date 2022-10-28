Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC3B7B;
	Fri, 28 Oct 2022 05:55:39 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id q9so10647793ejd.0;
        Thu, 27 Oct 2022 22:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dHcjtBlF9AkvTQ187G+El3eWXgb0DB+tASWT0lUXslw=;
        b=APPhPPKpLEKKcqAjAIU8lScpz8AYZ3ghGbYomvNfHmYNs9YdI4LnOPVzQJd70DwRqv
         QuuxcEPLbqGQo4h7TbsxhbXer8SKQVr/AXJN5VtGqKTmMdWf3R7ewKM9Nyo9rpB7MXTE
         giH2VCjhSug33KY7sHF4EYCucXgLPy+FmetZkwTRcfPii6TUUtBNhiHS87CNQmk5Fdy+
         Q5qMr056HFbB+1cAH62ioMsRqU092xaOcpd+YMlQS/hZVgdqstMK4hvrEuLUXEkUDPx1
         5GwplW/0L/wYu67cQd8wD9yto/ljME60DVyT7BXgTU3hktCpkCaTvWeZwnrPW2s+1dcF
         NlpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dHcjtBlF9AkvTQ187G+El3eWXgb0DB+tASWT0lUXslw=;
        b=osld+LGSFbQyqXj6gdZT71diQrcTwOnL5wUGwKkOfS7MOk3hwGCS0/kuN06xyamw7g
         LgMc5F8GGIlPcf7ZvpH33IKT14EeJfZ7DGrXW8rvSMtl6q8zPQBhtR3RH1CX1vHB2GuN
         /59zGBPRH/7BwlvM3rjiK7pjhigJuBMZt8eDmlU2pCu8U4RHzEZzFf0pZhKuYUh+umgR
         FzVWTaL7dLf8U+NxgeF0S4uXpR2xRBpS74qWLx5uL7+rFcumKYQ0JfqTItw+PPWbm0p8
         vMg9SkJHuRwMsykNzSDkv/u7hNqxjd0phRgKB9EAuPy5I/m9loSC8auDLlmshO7/jjg2
         0MWQ==
X-Gm-Message-State: ACrzQf2eJJMBBAjdRE3SPKYJdmN0BMgLj+n2NzfSzCZZwsdFknPFquwt
	p+C1vWqsPCNrk3cbKDwYmnM=
X-Google-Smtp-Source: AMsMyM6ftI0oGaA8QDmtb2tUUW/FK1vUGwbu5918AdLHBLS5TzRNHnsreVduP+CuqTiJQYnvb4+D6Q==
X-Received: by 2002:a17:907:7e87:b0:791:a477:1109 with SMTP id qb7-20020a1709077e8700b00791a4771109mr42100956ejc.354.1666936537364;
        Thu, 27 Oct 2022 22:55:37 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:b816:5a2a:b0ef:26b2:1eb3? (p200300c78f2ab8165a2ab0ef26b21eb3.dip0.t-ipconnect.de. [2003:c7:8f2a:b816:5a2a:b0ef:26b2:1eb3])
        by smtp.gmail.com with ESMTPSA id v7-20020a17090606c700b00780f24b797dsm1698013ejb.108.2022.10.27.22.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 22:55:36 -0700 (PDT)
Message-ID: <0f50dd24-aaab-d7ad-858a-694f1d14dce5@gmail.com>
Date: Fri, 28 Oct 2022 07:55:35 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 1/6] staging: vt6655: fix lines ending in a '('
Content-Language: en-US
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>,
 linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 outreachy@lists.linux.dev
References: <cover.1666849707.git.tanjubrunostar0@gmail.com>
 <6742e42999e05ddf09318a0a3bda9ce23b6ae562.1666849707.git.tanjubrunostar0@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <6742e42999e05ddf09318a0a3bda9ce23b6ae562.1666849707.git.tanjubrunostar0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/22 11:05, Tanjuate Brunostar wrote:
> fix serveral checkpatch errors related to lines ending with a '(' by
> refactoring the code lines

Patch series coverletter is missing or the wrong one was send.

[PATCH v6 1_6] staging_ vt6655_ fix lines ending in a '('-4646.txt
WARNING: 'serveral' may be misspelled - perhaps 'several'?
#7:
fix serveral checkpatch errors related to lines ending with a '(' by
     ^^^^^^^^

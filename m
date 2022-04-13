Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BF82F32;
	Wed, 13 Apr 2022 20:28:34 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id x17so5559534lfa.10;
        Wed, 13 Apr 2022 13:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=YogmsT3U/7IiGgtRupJ7l2JCvP07NCmlPwoFX7KDPtY=;
        b=BPo2dFn3g3Gh2JwBI11FdGs4x3mRiOExHJeQ0r5erW9MSIGbZjN8Th2c967Kx/7qf0
         5OXeYO3hDq6ZNvj20Gn+M66UP5whLZ7SNR3PT65RWwnPevdzMu8a4w12cMx99fkiyn86
         c86oP1HLwUiOvcm0css861ol8AmuTSxmsvPXd5tnG5VaFF720ge3kMgxvcvyXbVyLC2g
         AB9k2hJg6PAr5dKeHZybm1kcabwcp+wLYNh/hJzN6yTiUeLjNKrttW5A2KVS0E/7eiF+
         nH3hdggmgHb4XfAU0BEPLAwmvhXclpiHl+ex4n5v3iAjbJ5z6ZUmQfywc3dd7fCBEzaf
         lkog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YogmsT3U/7IiGgtRupJ7l2JCvP07NCmlPwoFX7KDPtY=;
        b=GSsqg8Oq2JXGior1oDSouv882MfQgnNKg31X9HeOtDYebCKCw2EerxNEPqfOpxoSEQ
         q7T3iI8STf7OnjZPvXMSTEboFqlfwDjYZdL3Kl5XRvwkylOCjODzZk/jSldxddKDUNo1
         DeYycOpabgpVXAT7XmQpWIYZkGTUSuSMuigrVt7BO5W832Sz3og31wvZVYE8OWjnpyMy
         qA1SUEXoNjWbgj0BIMl+UMtWftqMJxOtRZY+ZVgdd8P1PyFlNx5imCPvRLJjehL/adEt
         FQivRTQEqeuI8aUnS/3TpuWEeeaEhGtDnI7quuctEV0XMGAkxC2yh9HtJPCe6LTiAoMN
         uviQ==
X-Gm-Message-State: AOAM533B8DaAXIrlO5X/hCYSVWtTgkyZSHCD9sKl8VtLes4poHsTisOb
	epJ7PjICygj69e2fPaPq4Rk=
X-Google-Smtp-Source: ABdhPJx0JXqvqpQqiCaSHmJ/9FmujTfxUUTysOB33UP0zQiaykp3WYA8RUFbyQijMt5X0AQ8Snm2IQ==
X-Received: by 2002:a05:6512:131d:b0:464:f4f7:1b2d with SMTP id x29-20020a056512131d00b00464f4f71b2dmr21530767lfu.143.1649881712569;
        Wed, 13 Apr 2022 13:28:32 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.225.17])
        by smtp.gmail.com with ESMTPSA id 26-20020ac24d5a000000b0046ba2c20d79sm1405438lfp.206.2022.04.13.13.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 13:28:32 -0700 (PDT)
Message-ID: <2eab9c9e-7e56-9920-de4d-2e53b3d7e6a1@gmail.com>
Date: Wed, 13 Apr 2022 23:28:31 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/6] staging: r8188eu: remove 'added by' author comments
Content-Language: en-US
To: Jaehee Park <jhpark1013@gmail.com>, Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev, Alison Schofield <alison.schofield@intel.com>
References: <cover.1649880454.git.jhpark1013@gmail.com>
 <c0c0a0e748ad85585b65e73841d431adefe86a59.1649880454.git.jhpark1013@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <c0c0a0e748ad85585b65e73841d431adefe86a59.1649880454.git.jhpark1013@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jaehee,

On 4/13/22 23:11, Jaehee Park wrote:
> Author comments "Added by Albert" and "Added by Annie" are sprinkled
> through the file. Git will keep history so these comments can be
> removed from the code.
> 

these people are not in the git log, since this driver was added in 
2021. I am afraid they are not even in Larry's GH repo log.

Anyway these comments are not so useful, so patch is OK.

With regards,
Pavel Skripkin

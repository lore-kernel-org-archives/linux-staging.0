Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABE229CA
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 08:48:21 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id k15so19288486edk.13
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 00:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=xQwYgCXBhVcx9Q7TUKVOI86G8epXxK9R2Ct2Vdmiq54=;
        b=jf7eTWM4n1fehBqIExoiNAl6b/IkjGB3Zrso01KQBQ3NoMZ2lqMXXiKTP+aW/r/dho
         4bbrvynjeEuzrmSINg5yww1r4O6mxmcQobvlrrGVUdB6Uuu5d55fQDHyaB6IDl4bwt7i
         RuZloZbADVoe+qwhmYqLfxxoxovaA5w+VG/Yiu+L9WQ3cCle7PiQwLqLcGl0hXxV6/kI
         Pr4+4Scz2OREaqcMbVJJ1T7Xdb3EixoO0TpXrpcDZ9tIv69933KuFvPNQaa4O3Vf57E4
         jPyhBB4iruEbjK1+bJQBGkwyfWEVQ1RViUdEH/o8XedLDGMG35RpyqXNGadm5XMa6sUm
         03ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xQwYgCXBhVcx9Q7TUKVOI86G8epXxK9R2Ct2Vdmiq54=;
        b=oFnzYnTlo8XqY9zpUxdx59pS1CxcKbVa0UQReTtAWRCvTKtTeBIEq9OC+58sTmwgG+
         lJyLk1oJsQDqFcFf1+1qsui18v6h/vJBBmXEBmvYxgXZzBIsB7NHjwOx7qltCr89epDE
         Qr83oH+X+RdukLkJdDaI6HIZYLRymO5LmXq0TJMKoAYZGs4K2ro/oEV+sAKUlx81iL0j
         6Uu7L1qPziFhdH5F70i8O2SUk+Brbe4R6mjKJboRJRByf0FnLBsRvY/yoRaYV3FOPdyv
         x3n5vJ0jKbV+zOn0oCYn9pW1m4x0k6PXLhHjiPO8gAzDDeX83ihuEds9VkbDMNlsNT/L
         lQTw==
X-Gm-Message-State: AOAM5320/m0Dzm//WUsfkqw7vPvyidD4mh2/8vaVpLjztHQ+iD2ggwlz
	jAXmX9bd22eMGDgwPcHG/nM=
X-Google-Smtp-Source: ABdhPJyfcW0iFZhoFs6TtVnep2FYlZjybsexgdTnjr3M2pDrnHdisvQTxZ+yB91Wid4EMkAngWjtwA==
X-Received: by 2002:a17:906:acd:: with SMTP id z13mr5612271ejf.714.1641545299942;
        Fri, 07 Jan 2022 00:48:19 -0800 (PST)
Received: from ?IPV6:2a02:8108:96c0:3b88::b8a2? ([2a02:8108:96c0:3b88::b8a2])
        by smtp.gmail.com with ESMTPSA id di5sm1204609ejc.45.2022.01.07.00.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jan 2022 00:48:19 -0800 (PST)
Message-ID: <de835ab4-8565-5f7a-4f11-ee4622c20702@gmail.com>
Date: Fri, 7 Jan 2022 09:48:18 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 20/32] staging: r8188eu: make
 odm_RefreshRateAdaptiveMask() static
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20211229205108.26373-1-straube.linux@gmail.com>
 <20211229205108.26373-21-straube.linux@gmail.com>
 <20220106122607.GL7674@kadam>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20220106122607.GL7674@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/6/22 13:26, Dan Carpenter wrote:
> But, you added a blank line here after the declaration to make checkpatch
> When you're moving functions around could you just leave them
> exactly as-is?

Sure, I'll do.

Thanks,
Michael


Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631DA7F
	for <linux-staging@lists.linux.dev>; Tue,  7 Jun 2022 16:40:53 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id 129so16376294pgc.2
        for <linux-staging@lists.linux.dev>; Tue, 07 Jun 2022 09:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=W8rwN3Jx6kG6W0OrIJ1jYETqFXWQxvnr8RKgWWTrkqM=;
        b=XMHL4/Jkz5kuNpGJNXQ/Bo9VoJybfxuND8WBmMI71IqhCvC7buvP65oeqaka6UadH9
         5UqxLIR28QxB/gb5tpJ2llJeXyrNvOeT44QmE31thANjqX/QoVR5cnjd3xsId4TERasE
         iPXSvqb8WxlFGHgLqVvERupW83X2FEpTTGyuH2ZxPA7MO1uTRmmn1Bqj36ufVYuoRPn5
         ZLvNIwuEBcm9X+rOovVNraALF/yN03+I7A/VkjMnHvD1Aj2t4Kg//FZGzQZKB2Nss2Oc
         bV74X/eDXR2ZbuvmkpfHaZC90iU2l6teCb1Js+KcbJQOAjeyHu0xq6HUZXFXmQoktJcU
         lBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W8rwN3Jx6kG6W0OrIJ1jYETqFXWQxvnr8RKgWWTrkqM=;
        b=MqsGjxVSmAP30T/ZTwTP8rLM7MsMgLr5WBa8jdZr2V23REKhgS7AHIF3r/hiE5IDaP
         0PfPAonRrqWW6chWqQRw/yM/fb43geP2hRNdyDsLgvjvWZhhL4O5aMssNqCSq10dL6J+
         oTkVaYCzjbjCAB6C/8Y5GM0gv0hGmt/d1tAX1jxHdZhlpEUDx5kG7iQ34V77cIyJ3SF3
         A5oaSXsJwEK1KhaeNJ41ZusF40xpY9EgMJ/mA8EIqn3w0mYRiLMjxhufpFdYD//X3fmZ
         5ScvHVrsA2bwszDUNgh6CBqFWVMCpzMjtVhtauMR+D8NOuVbKweqauHp64riM09lfo4s
         Z7xQ==
X-Gm-Message-State: AOAM531qqpS3Na5zxwja/y8lSAmqgdqe8idFUR8nWE+qHShM1R0vQAac
	YTgmJ13UIwnSAsYO/r93MxA=
X-Google-Smtp-Source: ABdhPJyccfA+r17Q/AS9I4VBKNAtHMpjPjAethjyWPjji/o+/dd2tRPjIEWVlBmmMSWdhKxzby/1cQ==
X-Received: by 2002:a63:84c3:0:b0:3fc:87ff:cdfa with SMTP id k186-20020a6384c3000000b003fc87ffcdfamr25671860pgd.460.1654620052837;
        Tue, 07 Jun 2022 09:40:52 -0700 (PDT)
Received: from fedora ([2601:1c1:4202:28a0::ec2b])
        by smtp.gmail.com with ESMTPSA id y9-20020a1709027c8900b0016782c55790sm3877042pll.232.2022.06.07.09.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 09:40:52 -0700 (PDT)
Date: Tue, 7 Jun 2022 09:40:50 -0700
From: Jared Kangas <kangas.jd@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	johan@kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: audio: fix loop cursor use after
 iteration
Message-ID: <Yp9/kqBUzpArfPdn@fedora>
References: <20220605231806.720085-1-kangas.jd@gmail.com>
 <20220606130626.GX2146@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220606130626.GX2146@kadam>

Thanks for catching that! Is there anything I need to do to add the
'Fixes:' tag to the patch? From my understanding, adding tags is done by
a maintainer later on, but I'm new to the patch submission process so I
want to make sure I'm not missing anything.

Jared

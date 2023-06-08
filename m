Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E24663CF
	for <linux-staging@lists.linux.dev>; Thu,  8 Jun 2023 10:27:50 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-30af56f5f52so313019f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 08 Jun 2023 03:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686220069; x=1688812069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uPZG38xwyAshCFX9nGXm3Ba4eD0vAozl9nQqqA8ytoI=;
        b=E/I9xUH8shI4Ijw1EehAus7r/sg7I6ONqpREIkoS41yBGV+D2yWFYs2GrmYXb7/aUa
         VRxlxa13OZ1V4phLesPIFWi4h+zOI7TSYdeKjTQapRTTe8WDgGh1kPjAH2f7tL+hbR6s
         1xLINwp+Ya7ASZAVPjHaad48+48KWFVJEevs7Zxlzzd94pRpneWtLs6mqzMSxm0P5veA
         uXTEsAs3lL/gsfZoLsLtQ95SO0iPQWhul9AMr/Ied/xvNmAo0vxKLwTkWNM3jkD9IOTA
         E3ol9Upvrz1pi2Ft2rpL4RtYqTLwSnYVbaOVc9WTDh5IaHUHoP6e43gqkJ3V9C10hM8S
         S6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686220069; x=1688812069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uPZG38xwyAshCFX9nGXm3Ba4eD0vAozl9nQqqA8ytoI=;
        b=Wdyd52UgtTrGx57fxg4bIiBgdFZIlh5nmu2qh9l2Ty0q9NnjXDUgFlcwPuFRNyIGsM
         1+i9nj7Oney3rfGJ9cWJ+qUaiuxDaG0ERfE5dfkA8QoeikgnuT2FRs7yBW30WSOSV8qM
         loRtMTlssEI7YMP2UeJGsWAcackBruI0ksZlIDa9lGDIjuGiXvndqwoiD37wGaKWJYG4
         E5LXDU8HpaMs/mosShpp5uwWihUiDyngqB1PBUzEFb2F4LC5I3yrSjk6C2XrTreIRuYH
         I7eUtqR2oikalmoc60ZAFBJjk8Php7PLDZM8Kg2bBcDQSv4CnvtXVzGISN4YUMmTx2R0
         Jjmg==
X-Gm-Message-State: AC+VfDy5gstkiPEokZ4Re7RwWaZIAuVLZbbtimKqL7aNHFZE+ARkzSZL
	R9N95BqJhgm3FwROxFXjMqSddg==
X-Google-Smtp-Source: ACHHUZ616A8iGFxZyanXrFgSaqJ1OQo0PThA3e8BMZMQ9Lk1Z/64+juJMGIU2jKaiyGv5aMXfyuSGw==
X-Received: by 2002:a5d:554e:0:b0:30a:f02a:b84d with SMTP id g14-20020a5d554e000000b0030af02ab84dmr6496116wrw.13.1686220069053;
        Thu, 08 Jun 2023 03:27:49 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f13-20020a056000036d00b0030aefa3a957sm1185398wrf.28.2023.06.08.03.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 03:27:47 -0700 (PDT)
Date: Thu, 8 Jun 2023 13:27:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yogesh Hegde <yogi.kernel@gmail.com>
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] staging: rtl8192e: Remove variable SetWirelessMode
Message-ID: <c3397bcc-e6b2-4ed1-a8c4-715c739d6977@kadam.mountain>
References: <cover.1686149467.git.yogi.kernel@gmail.com>
 <fba56522e419351b05e33df8cd0ac31806534d8c.1686149467.git.yogi.kernel@gmail.com>
 <01a162c5-f0de-47b1-97e7-8a451a89df80@kadam.mountain>
 <90813181-02a1-b54f-132b-c68e7b797bb6@gmail.com>
 <20230608095938.GA598514@yogi-Zephyrus>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230608095938.GA598514@yogi-Zephyrus>

On Thu, Jun 08, 2023 at 03:29:38PM +0530, Yogesh Hegde wrote:
> On Wed, Jun 07, 2023 at 10:18:28PM +0200, Philipp Hortmann wrote:
> Dan, Greg and Philipp what would be the best fix for this issue, 
> 1.  Patchset to combine both the modules into one module 
> 2.  Revert back this patchset to v1.

Neither of those options are good.  I haven't investigated this problem
to figure out what the correct option is but we're unlikely to merge
either of those unless you make some very persuasive arguments.

regards,
dan carpenter


Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EABC2C83
	for <linux-staging@lists.linux.dev>; Thu, 28 Oct 2021 12:37:02 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id f8so2602255edy.4
        for <linux-staging@lists.linux.dev>; Thu, 28 Oct 2021 05:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SLr4/TnuHibe67bj8qgu1HXsYDnjQOeI4kUtFicodUM=;
        b=Vp13/kU1uMF7hIYXyF+K5W5teumj+0JSIXryVIwzTjc7QMOkHfZOyFTGG9JLL2sNDJ
         rK6JlS7HtH/dNA+K5Rf7x5mQjYGR6S+M0xWfadOGZk/y59dWVoEdTWWaDXstuMl3MrKi
         VqN7qvNLRpWzn9CX2+VhZFr2olh8w73R3QQcZk3KQl2gXHvxUWXiInAQHvRPWEW+/9lP
         gEcDvZb5NxFB79tbwUoIEFOQGjUbrZA1Op2WFuZhBp+CXTmax2VVcrt/6weUuWsm717p
         fw0/S/Mnc0Z8PkQweaIRp9DZCxfLQSkAWXtnt2ckcatpuIt76BM3AkbXtTBbZ5V2HEwU
         Kj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SLr4/TnuHibe67bj8qgu1HXsYDnjQOeI4kUtFicodUM=;
        b=eK2EuVxcXVIWkoNXv9mN9nmWI8F3kvQQgi7WA/tmzEwawMD97QmLK3ZtanAXHbSWx7
         4D+3KG4gpCUB9Ba1EVtEnwH8ZZZP+/N2RQSiVCC5ARQF6yUQqgv8LIFxy1ETqEQl8mCI
         qoLdOJ8HHrApfvgbzLbCWzqlB0qeB3YB9h/JkvnawjiF7szqRZya4MLqrj9TjgI3g5PF
         mxMTRCmdSuHfZdHKr9+hK5wAI6AMPPUVnihfbj7+c209ahbyR1DFqG2m2+TSyxuTFapm
         cHuHfkcpgwAyoIKANEloethHKZOKCN/L1z8XUNsbtmJ+upIPOcc8uG5ruYGjqWm8GE/N
         IwTw==
X-Gm-Message-State: AOAM530K+t5eH1gg14eG/v0r2P2MYa6aefZMn4DdTfyoBkMYzRHxLned
	15JvO5Z2SDcO28Tc1ZyJf1A=
X-Google-Smtp-Source: ABdhPJxNLKB6efA6LY1H6WKs7qec+/IU0ErVxxUVKcftBYYm6ph6GxjvZ96Z+tffWqafuIFyGYeDkg==
X-Received: by 2002:a17:906:3a0e:: with SMTP id z14mr5245835eje.55.1635424620813;
        Thu, 28 Oct 2021 05:37:00 -0700 (PDT)
Received: from localhost.localdomain (host-79-56-54-101.retail.telecomitalia.it. [79.56.54.101])
        by smtp.gmail.com with ESMTPSA id s16sm1675021edd.32.2021.10.28.05.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 05:37:00 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org, forest@alittletooquiet.net, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Karolina Drobnik <karolinadrobnik@gmail.com>, Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: Re: [Outreachy kernel] [PATCH 5/7] staging: vt6655: Rewrite conditional in AL7320 initialization
Date: Thu, 28 Oct 2021 14:36:59 +0200
Message-ID: <1683328.aCfAWUeHFl@localhost.localdomain>
In-Reply-To: <948406a3e7d23f1cdf866aa4448d9428bdd32512.1635415820.git.karolinadrobnik@gmail.com>
References: <cover.1635415820.git.karolinadrobnik@gmail.com> <948406a3e7d23f1cdf866aa4448d9428bdd32512.1635415820.git.karolinadrobnik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On Thursday, October 28, 2021 12:35:35 PM CEST Karolina Drobnik wrote:
> Use conditional operator to determine which table for AL7320
> initialization should be used. Use `data` temporary value to
> store this value.
> 
> Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
> ---
>  drivers/staging/vt6655/rf.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
> index afd202ea3356..af4eb7eb8e7d 100644
> --- a/drivers/staging/vt6655/rf.c
> +++ b/drivers/staging/vt6655/rf.c
> @@ -716,13 +716,10 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, 
unsigned char rf_type,
>  		if (init_count > (MISCFIFO_SYNDATASIZE - sleep_count))
>  			return false;
>  
> -		if (channel <= CB_MAX_CHANNEL_24G) {
> -			for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
> -				MACvSetMISCFifo(priv, idx++, 
al7230_init_table[i]);
> -		} else {
> -			for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
> -				MACvSetMISCFifo(priv, idx++, 
al7230_init_table_a_mode[i]);
> -		}
> +		data = (channel <= CB_MAX_CHANNEL_24G) ?
> +			al7230_init_table : 
al7230_init_table_a_mode;

As far as I know by reading some Greg K-H's replies to other developers, this 
"<test> ? <true> : <false>" style is not well accepted here.

I'd prefer to see an explicit "if-else" statement because with that style you 
sacrifice readability and gain nothing here.

> +		for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
> +			MACvSetMISCFifo(priv, idx++, *(data++));

Again, as Julia pointed out, "*data++" and "*(data++)" are syntactically 
correct instructions but are not required here. I'm also pretty sure that, by 
not reusing that index, you're adding additional unnecessary instructions to 
the resulting assembly code (unless the compiler is able to optimize it).

"*foo++" and the like are powerful and compact instructions, but you should 
use them in other, more suitable contexts.

Thanks,

Fabio


>  
>  		MACvSetMISCFifo(priv, idx++, 
al7230_channel_table0[channel - 1]);
>  		MACvSetMISCFifo(priv, idx++, 
al7230_channel_table1[channel - 1]);
> -- 
> 2.30.2
> 
> -- 
> You received this message because you are subscribed to the Google Groups 
"outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an 
email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/
outreachy-kernel/
948406a3e7d23f1cdf866aa4448d9428bdd32512.1635415820.git.karolinadrobnik%40gmail.com.
> 





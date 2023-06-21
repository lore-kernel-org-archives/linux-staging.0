Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BED8134BF
	for <linux-staging@lists.linux.dev>; Wed, 21 Jun 2023 12:18:20 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4f8777caaa1so3541475e87.3
        for <linux-staging@lists.linux.dev>; Wed, 21 Jun 2023 05:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687349898; x=1689941898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5pZTs7wMZ0BYXuZPnTcmyw2sMgPd+LLhQOmvBxF+zh0=;
        b=hPY3aaZKh3+hpknbkVrtmxsGiIGpyQb7f+K9ZaIrdyRzeHndbyBBituhAfeeCH+Ix1
         sT925xkkVEVyIJn6zsVntEvtPIX4Q/UhzHeBUBQKOflaJYJWKcAQvXwxDaBhu9Il6aeA
         bWibsITaEbM5lxI4iOpnHuVOBb+0g5o+55eq2givzfpZHbrX/9NKs8awvu5hWeIRg7OH
         jWsty0b/nP+hCKVM5k/pSvuS0ZFGJK6Q5SMaRUOc9bAZYhmntXEB3GIWGC0fpWJKONsk
         28g4WmvNLZWKrn+7fbaK1YTvXSyPCvHRncZZWyIG7bYweMBihyBzRKIkjl7q+FK4lCid
         EWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687349898; x=1689941898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pZTs7wMZ0BYXuZPnTcmyw2sMgPd+LLhQOmvBxF+zh0=;
        b=EPdZplm+cueTR+YcRwIjof+a9H/tZWk1gVuqYuZW38GcXd4xsEcNp5uvfdCvD7aFEf
         /0nPGbneq/B77lN6zHibfGi9F9JOnV0ofyymhlyzmcbyyoUinxEj4F0rax+6V+N5+P/v
         9Y6WbXO0YL+YxdIKEJTi85J+fanf5e+2bxeU6WfkT1T8mvI34Khihcny5jvuPPOb4McC
         XDINT/qhBKtHcV62QG0mvR34fxFS1r4v0tzAq4gS66s7QW6G7SHcMRL3YNUJgHwWnSEL
         5vrTgVXG0mPVE58FZwy2ex8qSIyqrn2aN06TqC6zWYhxXq3XQgIVNL50UI0pHWMIusdo
         iZuw==
X-Gm-Message-State: AC+VfDx9nUMW3taRh3X0vn+sf/79Tjsz8nV+9ogNaqQfq75KhWy4fIkO
	e6BRXyeVPdRlDGIHZ7Jz7Ow=
X-Google-Smtp-Source: ACHHUZ7RUDikRcO1bSyrPSV6dRKWHu6Oic1opMvMZxTIQ7EEmU1OIBYEkfljxBhr3LduxHDLt5XcnA==
X-Received: by 2002:a2e:8443:0:b0:2b1:d588:a1a5 with SMTP id u3-20020a2e8443000000b002b1d588a1a5mr9268781ljh.52.1687349897805;
        Wed, 21 Jun 2023 05:18:17 -0700 (PDT)
Received: from emma-rogzephyrusg14ga401iv (sa-84-52-56-253.saturn.infonet.ee. [84.52.56.253])
        by smtp.gmail.com with ESMTPSA id u21-20020a2e9b15000000b002b44b8409b5sm887141lji.75.2023.06.21.05.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 05:18:17 -0700 (PDT)
Date: Wed, 21 Jun 2023 15:18:06 +0300
From: emma <emma.t.christy@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Subject: [PATCH] media: rkvdec: removed redundant blank
 line
Message-ID: <20230621151806.6b56f121@emma-rogzephyrusg14ga401iv>
In-Reply-To: <2023062136-drench-pasty-79a2@gregkh>
References: <20230621092223.10805-1-emma.t.christy@gmail.com>
	<2023062136-drench-pasty-79a2@gregkh>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 21 Jun 2023 12:51:11 +0200
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Wed, Jun 21, 2023 at 12:22:23PM +0300, emma christy wrote:
> > Adhere to Linux kernel coding style. Removed redundant blank line.
> > Issue found by checkpatch.
> > 
> > Signed-off-by: emma christy <emma.t.christy@gmail.com>  
> 
> You might need to write this as "Emma Christy", right?
> 
> Also, your "Subject" line has an additional [PATCH] and "Subject:" in
> it somehow.
> 
> thanks,
> 
> greg k-h

I am sorry for the errors, I am still new at this.

I did mean to sign as "Emma Christy". Should I resubmit the patch,
because of this?
The extra "Subject" got added during "git send-email" and I didn't
notice. The extra "[PATCH]" was added by me as I did not know it would
be added automatically later. I will not make these mistakes again.

Thank You,

Emma Christy

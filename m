Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F69B2C8B
	for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 09:38:54 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id z14so10549835wrg.6
        for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 02:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=j2/0T+iSdDtcRBJSHhWbXXR9G0R0VHtIn5iZtNGvdpY=;
        b=O8IHmCxEqS6oDsG6t3xo1/CJc/mKQKQrKBE5I0MDKkQGd03S7OqsFskcTN/dsmOWNR
         zTybvOnp12d3zvtbq0kzMNc80oUxNQlH6SiLR4G4PUQe+9fyKLHiE+QjHnxB2LT1uDZM
         aMeiJaIIwsjLS1pRgtWUeFfZOyZGA2P7T6lx3YFlIVWFCaA4gbSZHwYulHYFELdB+YPU
         4ZhqrdqRwXram+3kTOs+Pctv8HtyIeM3xcbOkEwZjL9FA7AwVhobHrMR0pSwObfT990U
         qQQKhYLDr6/gONsRQZcKMb3gGBND4mxKesrP2atjQclfE/kHB7OtEb4gQ6YYl6JBUk2z
         CHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=j2/0T+iSdDtcRBJSHhWbXXR9G0R0VHtIn5iZtNGvdpY=;
        b=J1HK1kpwiL4tZvRe9n90lVJpDS3InSyxEZo0cdczr2O5L2giUyDlWYGlxwQPyNlN/E
         24jE9+BV/ga7VkdGfW+c1F27z8PN2Gzhx+HzQ+/Ytsc8fmvK+JRxVwOMziY4dpPqGtU8
         FsufnN7Ogk+EfvaiFJ6qpy5Q1W/tMMwMfm+9T1B9k1iOgQ8X19VhAym10jTK2duEvP/F
         mF6Dm+SvXfRYPLTA2xc68k8iqGa8ATXQpQqvC5ss0YC2pvhKyPydqr7GRlDEP99OGcmJ
         Me+ZScm/1vTyT+i3Mg15rCaYDx4zb+bt7LlG1K3i3nBAbItXYN5rlDb4lUqmRwDwouB9
         adtg==
X-Gm-Message-State: AOAM5324DlPWf8WCv/HnSRfIewUYu0ngwCSW0T1iXyUrZANaSGJ5oOgx
	u8KI8xPxa7sKyCEBDXOTYEQ=
X-Google-Smtp-Source: ABdhPJyT9OntxpUvacaEwsTC1z3GP1l6mwKWW3rKtPLofWcuMSnvX3hOCI66pnpi/WPjiHdyhtVY+Q==
X-Received: by 2002:adf:8bce:: with SMTP id w14mr7800346wra.391.1635154732530;
        Mon, 25 Oct 2021 02:38:52 -0700 (PDT)
Received: from ?IPv6:2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62? ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id l20sm21094729wmq.42.2021.10.25.02.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 02:38:51 -0700 (PDT)
Message-ID: <4a0993774f75323c803f7b07ff9825d7beb6d95b.camel@gmail.com>
Subject: Re: [Outreachy kernel] [PATCH 2/5] staging: vt6655: Rename
 `byInitCount` variable
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: Alison Schofield <alison.schofield@intel.com>
Cc: outreachy-kernel@googlegroups.com, gregkh@linuxfoundation.org, 
	forest@alittletooquiet.net, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Mon, 25 Oct 2021 10:38:46 +0100
In-Reply-To: <20211022164011.GB464908@alison-desk>
References: <cover.1634826774.git.karolinadrobnik@gmail.com>
	 <53430b1183324f6a715999792a15df2ea6a3e206.1634826774.git.karolinadrobnik@gmail.com>
	 <20211022164011.GB464908@alison-desk>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hi Alison,

On Fri, 2021-10-22 at 09:40 -0700, Alison Schofield wrote:
> On Fri, Oct 22, 2021 at 10:37:15AM +0100, Karolina Drobnik wrote:
> > Drop Hungarian notation in `byInitCount` variable in
> > `RFvWriteWakeProgSyn` function. Change it to use snake case.
> > 
> > Fix issue detected by checkpatch.pl:
> >   CHECK: Avoid CamelCase: <byInitCount>
> 
> Hi Karolina,
> 
> This comment is for all the patches.
> 
> Commit msg:
> We've got plenty of space on that line, how about:
> "Rename byInitCount init_count"
> 
> (I say this because when someone searches by the oneliners it's
> nice to give as many keywords as possible - within the line limit)

Ok, will do my best to include it in my upcoming patchset.

> Commit log:
> The log (why this patch is important) seems to be saying that
> snake case is the fix for Hungarian notation. I don't think that
> is completely true. Snake case avoids the camel case of Hungarian
> notation, but we are also dropping the type descriptor which is
> another signature of Hungarian notation.
> 
> Perhaps this would be more direct:
> 
> To align with the kernel coding style, remove the type from
> the variable name and do not use CamelCase.

Ok, I'll use this format from now on.


Thanks,
Karolina

